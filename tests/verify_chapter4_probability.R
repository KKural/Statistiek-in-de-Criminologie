if (.Platform$OS.type == "windows") {
  for (locale in c(".UTF-8", "English_United States.utf8", "C.UTF-8")) {
    selected <- suppressWarnings(Sys.setlocale("LC_CTYPE", locale))
    suppressWarnings(Sys.setlocale("LC_COLLATE", locale))
    if (!is.na(selected)) break
  }
}

root <- normalizePath(".", winslash = "/", mustWork = TRUE)
chapter <- file.path(root, "Hoofdstuk_4_Een inleiding in kansrekeren")

read_text <- function(path) {
  paste(readLines(path, warn = FALSE, encoding = "UTF-8"), collapse = "\n")
}

# Starting an R evaluator itself requires substantially more than 10 MB. Keep
# Chapter 4 on Dodona's normal judge default unless a deliberately higher limit
# is configured.
config_files <- list.files(
  chapter,
  pattern = "^config\\.json$",
  recursive = TRUE,
  full.names = TRUE
)
too_small_memory_limits <- character()
for (config_file in config_files) {
  config_text <- read_text(config_file)
  memory_match <- regexec('"memory_limit"\\s*:\\s*([0-9]+)', config_text, perl = TRUE)
  matched <- regmatches(config_text, memory_match)[[1L]]
  if (length(matched) == 2L && as.numeric(matched[[2L]]) < 134217728) {
    too_small_memory_limits <- c(too_small_memory_limits, config_file)
  }
}
if (length(too_small_memory_limits)) {
  stop(paste(
    "Chapter 4 contains an explicit R memory limit below 128 MiB:",
    paste(too_small_memory_limits, collapse = ", ")
  ))
}

assignment_names <- function(text) {
  lines <- strsplit(text, "\n", fixed = TRUE)[[1L]]
  matches <- regexec("^\\s*([A-Za-z.][A-Za-z0-9._]*)\\s*<-", lines, perl = TRUE)
  parts <- regmatches(lines, matches)
  unique(vapply(parts[lengths(parts) > 0L], `[[`, character(1), 2L))
}

parse_expected_values <- function(text) {
  flattened <- gsub("[\r\n]", " ", text)
  match <- regexec("expected_values\\s*<-\\s*c\\((.*?)\\)", flattened, perl = TRUE)
  parts <- regmatches(flattened, match)[[1L]]
  if (length(parts) != 2L) return(numeric())
  entries <- strsplit(parts[[2L]], ",", fixed = TRUE)[[1L]]
  entry_pattern <- "^\\s*([A-Za-z.][A-Za-z0-9._]*)\\s*=\\s*(-?(?:[0-9]+(?:\\.[0-9]*)?|\\.[0-9]+))\\s*$"
  matches <- regexec(entry_pattern, entries, perl = TRUE)
  values <- regmatches(entries, matches)
  if (!length(values) || any(lengths(values) != 3L)) return(numeric())
  result <- as.numeric(vapply(values, `[[`, character(1), 3L))
  names(result) <- vapply(values, `[[`, character(1), 2L)
  result
}

# These retained exercises predate the common named expected_values vector.
# They are matched by answer-field signature, so renumbering or retitling a
# folder does not make this regression test stale.
legacy_canonical <- list(
  c(p_man = 0.4244, p_bachelor_given_man = 0.6776, p_man_and_bachelor = 0.2876),
  c(p_man = 0.8503, p_drug_given_man = 0.1200, p_joint = 0.1020),
  c(p_drug_given_man = 0.1200, p_man_given_drug = 0.8333),
  c(combinatie_8_0 = 1, combinatie_5_5 = 1, lotto_combinaties = 4496388),
  c(kans_schot_of_wurging = 0.67, kans_andere_oorzaak = 0.33),
  c(p_exact_twee = 0.3087)
)

canonical_for <- function(file) {
  evaluator <- read_text(file)
  expected_values <- parse_expected_values(evaluator)
  if (length(expected_values)) return(expected_values)

  exercise_dir <- dirname(dirname(file))
  boilerplate <- read_text(file.path(exercise_dir, "description", "boilerplate", "boilerplate"))
  fields <- assignment_names(boilerplate)
  matches <- legacy_canonical[vapply(
    legacy_canonical,
    function(values) setequal(names(values), fields),
    logical(1)
  )]
  if (length(matches) != 1L) {
    stop(sprintf("%s: could not identify one canonical answer by field signature.", file))
  }
  matches[[1L]][fields]
}

load_evaluator <- function(file) {
  capture <- new.env(parent = emptyenv())
  capture$tests <- list()
  capture$messages <- character()

  evaluation <- new.env(parent = globalenv())
  evaluation[["%||%"]] <- function(left, right) if (is.null(left)) right else left
  evaluation$context <- function(expression) force(expression)
  evaluation$testcase <- function(name, expression) force(expression)
  evaluation$testEqual <- function(description, generated, expected, comparator, ...) {
    capture$tests[[length(capture$tests) + 1L]] <- list(
      generated = generated,
      expected = expected,
      comparator = comparator
    )
    invisible(NULL)
  }
  evaluation$get_reporter <- function() {
    list(add_message = function(message, type = NULL) {
      capture$messages <- c(capture$messages, as.character(message))
      invisible(NULL)
    })
  }

  sys.source(file, envir = evaluation, keep.source = FALSE)
  if (length(capture$tests) != 1L) stop(sprintf("%s: expected exactly one testcase.", file))
  test <- capture$tests[[1L]]

  function(values) {
    capture$messages <- character()
    submission <- list2env(as.list(values), parent = emptyenv())
    generated <- test$generated(submission)
    score <- test$comparator(generated, test$expected)
    list(score = isTRUE(score), message = paste(capture$messages, collapse = "\n\n"))
  }
}

count_heading <- function(message, heading) {
  hits <- gregexpr(heading, message, fixed = TRUE)[[1L]]
  if (length(hits) == 1L && hits[[1L]] == -1L) 0L else length(hits)
}

expect_heading <- function(message, heading, expected, file, route) {
  actual <- count_heading(message, heading)
  if (actual != expected) {
    stop(sprintf(
      "%s [%s]: expected %d occurrence(s) of %s, found %d.\n%s",
      file, route, expected, heading, actual, message
    ))
  }
}

expect_diagnostic_opening <- function(message, file, route) {
  openings <- c(
    "**Waarschijnlijke redenering:**",
    "**Waarom deze keuze begrijpelijk kan lijken:**",
    "**Controleer je invoer:**",
    "**Controlepunt:**"
  )
  count <- sum(vapply(openings, function(heading) count_heading(message, heading), integer(1)))
  if (count < 1L) {
    stop(sprintf("%s [%s]: expected at least one diagnostic opening heading.\n%s", file, route, message))
  }
}

evaluator_files <- list.files(
  chapter,
  pattern = "^Answer\\.R$",
  recursive = TRUE,
  full.names = TRUE
)
if (length(evaluator_files) != 9L) {
  stop(sprintf("Expected nine Chapter 4 exercises after grouping, found %d.", length(evaluator_files)))
}

routes <- 0L
for (file in evaluator_files) {
  canonical <- canonical_for(file)
  run <- load_evaluator(file)

  correct <- run(canonical)
  if (!correct$score) stop(sprintf("%s [correct]: canonical answer was rejected.", file))
  expect_heading(correct$message, "**Bevestiging:**", 1L, file, "correct")
  expect_heading(correct$message, "**Denkregel:**", 1L, file, "correct")
  expect_heading(correct$message, "**Transferstap:**", 1L, file, "correct")
  routes <- routes + 1L

  wrong_values <- canonical
  field <- names(canonical)[[1L]]
  wrong_values[[field]] <- canonical[[field]] + max(1, abs(canonical[[field]]) + 1)
  wrong <- run(wrong_values)
  if (wrong$score) stop(sprintf("%s [wrong %s]: misconception was accepted.", file, field))
  expect_diagnostic_opening(wrong$message, file, paste0("wrong ", field))
  expect_heading(wrong$message, "**Waarom dit niet klopt:**", 1L, file, paste0("wrong ", field))
  expect_heading(wrong$message, "**Denkregel:**", 1L, file, paste0("wrong ", field))
  expect_heading(wrong$message, "**Volgende stap:**", 1L, file, paste0("wrong ", field))
  expect_heading(wrong$message, "**Bevestiging:**", 0L, file, paste0("wrong ", field))
  routes <- routes + 1L

  missing <- run(list())
  if (missing$score) stop(sprintf("%s [missing]: empty submission was accepted.", file))
  expect_diagnostic_opening(missing$message, file, "missing")
  expect_heading(missing$message, "**Denkregel:**", 1L, file, "missing")
  expect_heading(missing$message, "**Volgende stap:**", 1L, file, "missing")
  expect_heading(missing$message, "**Bevestiging:**", 0L, file, "missing")
  routes <- routes + 1L
}

cat(sprintf(
  "Chapter 4 probability verification passed for %d grouped/retained exercises and %d canonical, misconception, and missing-input routes.\n",
  length(evaluator_files),
  routes
))
