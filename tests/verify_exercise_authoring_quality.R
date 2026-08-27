root <- normalizePath(".", winslash = "/", mustWork = TRUE)

`%||%` <- function(x, y) if (is.null(x)) y else x

if (.Platform$OS.type == "windows") {
  for (locale in c(".UTF-8", "English_United States.utf8", "C.UTF-8")) {
    selected <- suppressWarnings(Sys.setlocale("LC_CTYPE", locale))
    suppressWarnings(Sys.setlocale("LC_COLLATE", locale))
    if (!is.na(selected)) break
  }
} else {
  for (locale in c("C.UTF-8", "en_US.UTF-8")) {
    selected <- suppressWarnings(Sys.setlocale("LC_ALL", locale))
    if (!is.na(selected)) break
  }
}

if (!requireNamespace("jsonlite", quietly = TRUE)) {
  stop("The authoring-quality check requires the jsonlite package.")
}

read_text <- function(path) {
  paste(readLines(path, warn = FALSE, encoding = "UTF-8"), collapse = "\n")
}

parse_assignment_line <- function(line) {
  match <- regexec(
    "^\\s*([A-Za-z.][A-Za-z0-9._]*)\\s*<-\\s*(.*)$",
    line,
    perl = TRUE
  )
  parts <- regmatches(line, match)[[1L]]
  if (!length(parts)) return(NULL)

  raw_rhs <- parts[[3L]]
  comment_start <- regexpr("#", raw_rhs, fixed = TRUE)[[1L]]
  if (comment_start > 0L) {
    rhs <- substr(raw_rhs, 1L, comment_start - 1L)
    comment <- substr(raw_rhs, comment_start + 1L, nchar(raw_rhs))
  } else {
    rhs <- raw_rhs
    comment <- ""
  }
  list(name = parts[[2L]], rhs = trimws(rhs), comment = trimws(comment), line = line)
}

blank_vector_size <- function(rhs) {
  if (!grepl("^c\\(.*\\)$", rhs, perl = TRUE)) return(NA_integer_)
  inside <- sub("^c\\((.*)\\)$", "\\1", rhs, perl = TRUE)
  if (nzchar(gsub("[[:space:],]", "", inside, perl = TRUE))) return(NA_integer_)
  commas <- gregexpr(",", inside, fixed = TRUE)[[1L]]
  comma_count <- if (length(commas) == 1L && commas[[1L]] == -1L) 0L else length(commas)
  if (comma_count == 0L) return(NA_integer_)
  comma_count + 1L
}

slot_from_assignment <- function(assignment) {
  if (!nzchar(assignment$rhs)) {
    return(list(name = assignment$name, kind = "blank", count = 1L))
  }
  if (identical(assignment$rhs, "\"\"")) {
    return(list(name = assignment$name, kind = "string", count = 1L))
  }
  vector_size <- blank_vector_size(assignment$rhs)
  if (!is.na(vector_size)) {
    return(list(name = assignment$name, kind = "vector", count = vector_size))
  }
  NULL
}

has_string_entry_note <- function(text) {
  grepl(
    "(?im)^\\s*#.*(?:tekst|aanhaling|quote|string|woord|letters)",
    text,
    perl = TRUE
  )
}

is_zero_placeholder <- function(assignment) {
  identical(assignment$rhs, "0") ||
    grepl("^rep\\(\\s*0\\s*,\\s*[0-9]+\\s*\\)$", assignment$rhs, perl = TRUE) ||
    grepl("^c\\(\\s*0(?:\\s*,\\s*0)+\\s*\\)$", assignment$rhs, perl = TRUE)
}

failures <- character()
configs <- list.files(root, pattern = "^config\\.json$", recursive = TRUE, full.names = TRUE)
if (!length(configs)) stop("No activity configs found.")

activities <- vector("list", length(configs))
tokens <- character()
token_files <- character()

for (index in seq_along(configs)) {
  config_file <- configs[[index]]
  activity_dir <- dirname(config_file)
  config <- tryCatch(
    jsonlite::fromJSON(config_file, simplifyVector = FALSE),
    error = function(error) {
      failures <<- c(failures, sprintf("%s: invalid JSON (%s)", config_file, conditionMessage(error)))
      NULL
    }
  )
  if (is.null(config)) next

  activities[[index]] <- list(dir = activity_dir, config = config)
  token <- config$internals$token
  if (!is.null(token)) {
    tokens <- c(tokens, as.character(token))
    token_files <- c(token_files, config_file)
  }

  if (!identical(config$type, "exercise")) next

  required_config_values <- list(
    programming_language = config$programming_language,
    dutch_name = config$description$names$nl,
    evaluation_handler = config$evaluation$handler
  )
  empty_config_values <- names(required_config_values)[vapply(
    required_config_values,
    function(value) is.null(value) || length(value) != 1L || !nzchar(trimws(as.character(value))),
    logical(1)
  )]
  if (length(empty_config_values)) {
    failures <- c(
      failures,
      sprintf("%s: missing required config values: %s", config_file, paste(empty_config_values, collapse = ", "))
    )
  }

  required <- c(description = file.path(activity_dir, "description", "description.nl.md"))
  if (!is.null(config$boilerplate)) {
    required <- c(required, boilerplate = file.path(activity_dir, config$boilerplate))
  }
  if (identical(toupper(as.character(config$evaluation$handler %||% "")), "R")) {
    required <- c(required, evaluator = file.path(activity_dir, "evaluation", "Answer.R"))
  }
  missing_files <- names(required)[!file.exists(required)]
  if (length(missing_files)) {
    failures <- c(
      failures,
      sprintf("%s: missing %s", activity_dir, paste(missing_files, collapse = ", "))
    )
    next
  }

  description <- read_text(required[["description"]])
  boilerplate <- if ("boilerplate" %in% names(required)) read_text(required[["boilerplate"]]) else ""
  evaluator <- if ("evaluator" %in% names(required)) read_text(required[["evaluator"]]) else ""
  display_name <- config$description$names$nl %||% ""

  description_lines <- strsplit(description, "\n", fixed = TRUE)[[1L]]
  first_nonempty <- description_lines[nzchar(trimws(description_lines))][1L] %||% ""
  multi_application <- grepl("^Oef - 1\\.11 Praktische toepassingen$", basename(activity_dir))
  if (!multi_application && grepl("^#{1,6}\\s+", trimws(first_nonempty), perl = TRUE)) {
    failures <- c(failures, sprintf("%s: duplicate opening activity-title heading remains", activity_dir))
  }
  if (grepl("\\bDeel\\s+[0-9]+", display_name, perl = TRUE)) {
    failures <- c(failures, sprintf("%s: Dodona title still uses a redundant Deel label", activity_dir))
  }

  hint_pattern <- "(?im)^\\s*(?:>\\s*)?(?:#{1,6}\\s*)?(?:\\*\\*)?(?:interpretatiehint|hint|tip)\\s*:"
  if (grepl(hint_pattern, description, perl = TRUE)) {
    failures <- c(failures, sprintf("%s: visible pre-answer hint remains", required[["description"]]))
  }

  exact_double_question <- "(?<!\\?)\\?\\?(?!\\?)"
  if (grepl(exact_double_question, description, perl = TRUE) && grepl("???", boilerplate, fixed = TRUE)) {
    failures <- c(failures, sprintf("%s: description says ?? while boilerplate uses ???", activity_dir))
  }

  forbidden_na <- "(?<![A-Za-z0-9_])(?:NA(?:_[A-Za-z]+_)?|NULL)(?![A-Za-z0-9_])"
  if (nzchar(boilerplate) && grepl(forbidden_na, boilerplate, perl = TRUE)) {
    failures <- c(failures, sprintf("%s: learner boilerplate contains an NA/NULL placeholder", activity_dir))
  }

  boilerplate_lines <- strsplit(boilerplate, "\n", fixed = TRUE)[[1L]]
  assignments <- Filter(Negate(is.null), lapply(boilerplate_lines, parse_assignment_line))
  slots <- Filter(Negate(is.null), lapply(assignments, slot_from_assignment))
  slot_vars <- if (length(slots)) {
    unique(vapply(slots, `[[`, character(1), "name"))
  } else {
    character()
  }
  answer_pattern <- paste0(
    "^\\s*([A-Za-z.][A-Za-z0-9._]*)\\s*<-\\s*",
    "(?:\\?\\?\\?|NA_(?:real|integer|character)_|rep\\(\\s*NA_(?:real|integer|character)_|c\\(\\s*NA_(?:real|integer|character)_|\"\\?\\?\\?\")"
  )
  answer_lines <- grep(answer_pattern, boilerplate_lines, value = TRUE, perl = TRUE)
  legacy_answer_vars <- unique(sub("^\\s*([A-Za-z.][A-Za-z0-9._]*).*$", "\\1", answer_lines, perl = TRUE))
  assignment_vars <- if (length(assignments)) {
    unique(vapply(assignments, `[[`, character(1), "name"))
  } else {
    character()
  }
  answer_vars <- unique(c(assignment_vars, slot_vars, legacy_answer_vars))
  grouped_target <- grepl("expected_values\\s*<-\\s*c\\(", evaluator, perl = TRUE) &&
    length(answer_vars) >= 3L

  if (length(answer_vars) > 5L) {
    failures <- c(failures, sprintf(
      "%s: %d answer objects; a coherent grouped exercise may contain at most 5",
      activity_dir,
      length(answer_vars)
    ))
  }
  missing_in_evaluator <- if (nzchar(evaluator)) {
    answer_vars[!vapply(answer_vars, function(name) {
      pattern <- paste0("(?<![A-Za-z0-9._])\\Q", name, "\\E(?![A-Za-z0-9._])")
      grepl(pattern, evaluator, perl = TRUE)
    }, logical(1))]
  } else {
    character()
  }
  if (length(missing_in_evaluator)) {
    failures <- c(
      failures,
      sprintf("%s: boilerplate answers absent from evaluator: %s", activity_dir, paste(missing_in_evaluator, collapse = ", "))
    )
  }

  if (nzchar(evaluator)) {
    legacy_code_pattern <- paste0(
      "3\\.2[a-d]|3\\.3(?:a2|d[2-5]|[a-e])|",
      "3\\.4(?:a[23]|c[23]|[a-d])"
    )
    if (grepl(legacy_code_pattern, paste(display_name, description), perl = TRUE)) {
      failures <- c(failures, sprintf("%s: legacy letter-based exercise code remains visible", activity_dir))
    }
    if (grouped_target && grepl("???", boilerplate, fixed = TRUE)) {
      failures <- c(failures, sprintf("%s: learner boilerplate contains syntax-invalid ???", activity_dir))
    }
    zero_placeholders <- vapply(assignments, is_zero_placeholder, logical(1))
    if (grouped_target && any(zero_placeholders)) {
      failures <- c(
        failures,
        sprintf(
          "%s: exercise uses 0 as a learner placeholder for %s",
          activity_dir,
          paste(vapply(assignments[zero_placeholders], `[[`, character(1), "name"), collapse = ", ")
        )
      )
    }
    string_slots <- vapply(slots, function(slot) identical(slot$kind, "string"), logical(1))
    if (any(string_slots) && !has_string_entry_note(boilerplate)) {
      failures <- c(
        failures,
        sprintf("%s: empty-string learner slot lacks a text/quotation note", activity_dir)
      )
    }
    answer_entry_count <- sum(vapply(slots, `[[`, integer(1), "count"))
    if (answer_entry_count > 8L) {
      failures <- c(
        failures,
        sprintf("%s: exercise requires %d submitted values (maximum 8)", activity_dir, answer_entry_count)
      )
    }
  }

  media_refs <- character()
  html_matches <- regmatches(description, gregexpr("<img[^>]+src=[\"'][^\"']+[\"']", description, perl = TRUE))[[1L]]
  if (length(html_matches) && html_matches[[1L]] != "") {
    media_refs <- c(media_refs, sub(".*src=[\"']([^\"']+)[\"'].*", "\\1", html_matches, perl = TRUE))
  }
  markdown_matches <- regmatches(description, gregexpr("!\\[[^]]*\\]\\([^)]+\\)", description, perl = TRUE))[[1L]]
  if (length(markdown_matches) && markdown_matches[[1L]] != "") {
    media_refs <- c(media_refs, sub(".*\\(([^)]+)\\)", "\\1", markdown_matches, perl = TRUE))
  }
  media_refs <- media_refs[!grepl("^(?:https?:)?//", media_refs, perl = TRUE)]
  missing_media <- media_refs[!file.exists(file.path(activity_dir, "description", media_refs))]
  if (length(missing_media)) {
    failures <- c(failures, sprintf("%s: missing referenced media: %s", activity_dir, paste(missing_media, collapse = ", ")))
  }
}

if (length(tokens)) {
  duplicate_tokens <- unique(tokens[duplicated(tokens)])
  if (length(duplicate_tokens)) {
    affected <- token_files[tokens %in% duplicate_tokens]
    failures <- c(failures, sprintf("Duplicate Dodona token in: %s", paste(affected, collapse = ", ")))
  }
  invalid_tokens <- token_files[!grepl("^[A-Za-z0-9_-]{64}$", tokens)]
  if (length(invalid_tokens)) {
    failures <- c(failures, sprintf("Invalid Dodona token shape in: %s", paste(invalid_tokens, collapse = ", ")))
  }
}

graded_activities <- Filter(function(item) {
  if (is.null(item) || !identical(item$config$type, "exercise")) return(FALSE)
  !is.null(item$config$evaluation)
}, activities)

if (length(graded_activities) != 51L) {
  failures <- c(
    failures,
    sprintf("Expected 51 active graded exercises after logical grouping, found %d",
            length(graded_activities))
  )
}

if (length(failures)) {
  cat("Exercise-authoring quality verification failed:\n")
  cat(sprintf("- %s\n", failures))
  quit(status = 1)
}

cat(sprintf(
  paste0(
    "Exercise-authoring quality passed for %d activities and %d active graded exercises; ",
    "learner slots use at most five answer objects, and no explicit Hint/Tip, redundant ",
    "Deel title, legacy letter code, or grouped NA/NULL/???/zero placeholder remains.\n"
  ),
  length(configs),
  length(graded_activities)
))
