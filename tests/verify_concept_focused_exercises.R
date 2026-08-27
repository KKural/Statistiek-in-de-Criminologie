if (.Platform$OS.type == "windows") {
  for (locale in c(".UTF-8", "English_United States.utf8", "C.UTF-8")) {
    selected <- suppressWarnings(Sys.setlocale("LC_CTYPE", locale))
    suppressWarnings(Sys.setlocale("LC_COLLATE", locale))
    if (!is.na(selected)) break
  }
}

root <- normalizePath(".", winslash = "/", mustWork = TRUE)

read_text <- function(path) {
  paste(readLines(path, warn = FALSE, encoding = "UTF-8"), collapse = "\n")
}

assignment_names <- function(text) {
  lines <- strsplit(text, "\n", fixed = TRUE)[[1L]]
  matches <- regexec(
    "^\\s*([A-Za-z.][A-Za-z0-9._]*)\\s*<-\\s*([^#]*)(?:#.*)?$",
    lines,
    perl = TRUE
  )
  parts <- regmatches(lines, matches)
  parts <- parts[lengths(parts) == 3L]
  if (!length(parts)) return(character())
  rhs <- trimws(vapply(parts, `[[`, character(1), 3L))
  learner_slot <- !nzchar(rhs) | rhs == '""' |
    grepl("^c\\(\\s*(?:,\\s*)+\\)$", rhs, perl = TRUE)
  unique(vapply(parts[learner_slot], `[[`, character(1), 2L))
}

expected_value_names <- function(text) {
  flattened <- gsub("[\r\n]", " ", text)
  match <- regexec(
    "expected_values\\s*<-\\s*c\\((.*?)\\)",
    flattened,
    perl = TRUE
  )
  parts <- regmatches(flattened, match)[[1L]]
  if (length(parts) != 2L) return(character())
  entries <- strsplit(parts[[2L]], ",", fixed = TRUE)[[1L]]
  names <- sub("^\\s*([A-Za-z.][A-Za-z0-9._]*)\\s*=.*$", "\\1", entries, perl = TRUE)
  names[grepl("^[A-Za-z.][A-Za-z0-9._]*$", names)]
}

config_files <- list.files(root, pattern = "^config\\.json$", recursive = TRUE, full.names = TRUE)
graded_config_count <- sum(vapply(config_files, function(file) {
  text <- read_text(file)
  grepl('"type"\\s*:\\s*"exercise"', text, perl = TRUE) &&
    grepl('"evaluation"\\s*:', text, perl = TRUE)
}, logical(1)))
if (graded_config_count != 94L) {
  stop(sprintf("Expected 94 active graded exercises after selective restoration, found %d.", graded_config_count))
}

evaluator_files <- list.files(
  root,
  pattern = "^Answer\\.R$",
  recursive = TRUE,
  full.names = TRUE
)
if (length(evaluator_files) != 93L) {
  stop(sprintf("Expected 93 R evaluators plus one tested Python exercise, found %d R evaluators.",
               length(evaluator_files)))
}

failures <- character()
grouped_files <- character()
chapter1_simple_files <- character()

for (evaluator_file in evaluator_files) {
  exercise_dir <- dirname(dirname(evaluator_file))
  relative_dir <- substring(
    normalizePath(exercise_dir, winslash = "/", mustWork = TRUE),
    nchar(root) + 2L
  )
  is_chapter1_simple <- startsWith(relative_dir, "Hoofdstuk_1_")
  paths <- c(
    description = file.path(exercise_dir, "description", "description.nl.md"),
    config = file.path(exercise_dir, "config.json")
  )
  boilerplate_file <- file.path(exercise_dir, "description", "boilerplate", "boilerplate")
  if (!all(file.exists(paths))) {
    failures <- c(failures, sprintf("%s: missing required description or config", relative_dir))
    next
  }

  description <- read_text(paths[["description"]])
  boilerplate <- if (file.exists(boilerplate_file)) read_text(boilerplate_file) else ""
  evaluator <- read_text(evaluator_file)
  config <- read_text(paths[["config"]])
  fields <- assignment_names(boilerplate)
  expected_fields <- expected_value_names(evaluator)
  fixed_choice <- grepl("env\\$evaluationResult\\b", evaluator, perl = TRUE)

  if (is_chapter1_simple) {
    chapter1_simple_files <- c(chapter1_simple_files, evaluator_file)
    if (!fixed_choice) {
      failures <- c(failures, sprintf("%s: simple fixed-choice evaluator does not read evaluationResult",
                                      relative_dir))
    }
  }
  if (!fixed_choice && !file.exists(boilerplate_file)) {
    failures <- c(failures, sprintf("%s: fill exercise has no boilerplate", relative_dir))
  } else if (!fixed_choice && (length(fields) < 1L || length(fields) > 5L)) {
    failures <- c(
      failures,
      sprintf("%s: expected 1-5 distinct answer fields, found %d", relative_dir, length(fields))
    )
  }
  testcase_hits <- gregexpr(
    "(?<![A-Za-z0-9._])testcase\\s*\\(",
    evaluator,
    perl = TRUE
  )[[1L]]
  testcase_count <- if (length(testcase_hits) == 1L && testcase_hits[[1L]] == -1L) {
    0L
  } else {
    length(testcase_hits)
  }
  if (testcase_count != 1L) {
    failures <- c(failures, sprintf("%s: expected exactly one testcase", relative_dir))
  }
  if (!grepl('"token"\\s*:\\s*"[A-Za-z0-9_-]{64}"', config, perl = TRUE)) {
    failures <- c(failures, sprintf("%s: missing or malformed Dodona token", relative_dir))
  }

  required_feedback <- c(
    "**Bevestiging:**", "**Denkregel:**", "**Transferstap:**",
    "**Waarom dit niet klopt:**", "**Volgende stap:**"
  )
  missing_feedback <- required_feedback[!vapply(
    required_feedback,
    function(heading) grepl(heading, evaluator, fixed = TRUE),
    logical(1)
  )]
  if (length(missing_feedback)) {
    failures <- c(
      failures,
      sprintf("%s: evaluator misses feedback heading(s): %s",
              relative_dir, paste(missing_feedback, collapse = ", "))
    )
  }

  multi_answer <- !fixed_choice && length(fields) >= 3L && length(fields) <= 5L &&
    length(expected_fields) >= 3L
  if (multi_answer) {
    grouped_files <- c(grouped_files, evaluator_file)
    if (!grepl("**Leerdoel:**", description, fixed = TRUE)) {
      failures <- c(failures, sprintf("%s: no explicit learning objective", relative_dir))
    }
    if (grepl("observaties\\s*[0-9]+\\s*[-–]\\s*[0-9]+", description,
              ignore.case = TRUE, perl = TRUE)) {
      failures <- c(failures, sprintf("%s: still processes an arbitrary observation range", relative_dir))
    }
    if (grepl("\\?\\?\\?|\\bNA(?:_[A-Za-z]+_)?\\b|\\bNULL\\b", boilerplate, perl = TRUE)) {
      failures <- c(failures, sprintf("%s: uses a banned learner placeholder", relative_dir))
    }
    if (!identical(sort(fields), sort(expected_fields))) {
      failures <- c(
        failures,
        sprintf("%s: boilerplate fields do not match named expected_values", relative_dir)
      )
    }
  }
}

if (length(chapter1_simple_files) != 10L) {
  failures <- c(
    failures,
    sprintf("Expected 10 restored Chapter 1 simple R exercises, found %d",
            length(chapter1_simple_files))
  )
}

if (length(grouped_files) != 21L) {
  failures <- c(
    failures,
    sprintf("Expected 21 retained multi-answer evaluators with named expected_values, found %d",
            length(grouped_files))
  )
}

if (length(failures)) {
  cat("Concept-focused exercise verification failed:\n")
  cat(sprintf("- %s\n", failures))
  quit(status = 1)
}

cat(sprintf(
  paste0(
    "Validated %d active graded exercises: %d multi-answer activities use 3-5 ",
    "named answer fields and an explicit objective; 10 Chapter 1 activities use the ",
    "simple fixed-choice interface; every R activity has one testcase, a retained token, ",
    "and the feedback contract.\n"
  ),
  graded_config_count,
  length(grouped_files)
))
