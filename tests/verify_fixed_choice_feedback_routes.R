if (.Platform$OS.type == "windows") {
  for (locale in c(".UTF-8", "English_United States.utf8", "C.UTF-8")) {
    selected <- suppressWarnings(Sys.setlocale("LC_CTYPE", locale))
    suppressWarnings(Sys.setlocale("LC_COLLATE", locale))
    if (!is.na(selected)) break
  }
}

root <- normalizePath(".", winslash = "/", mustWork = TRUE)
chapter_roots <- file.path(root, "Hoofdstuk_2_Inleidende begrippen")

read_text <- function(path) {
  paste(readLines(path, warn = FALSE, encoding = "UTF-8"), collapse = "\n")
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

candidate_files <- unlist(lapply(chapter_roots, function(chapter) {
  list.files(chapter, pattern = "^Answer\\.R$", recursive = TRUE, full.names = TRUE)
}), use.names = FALSE)

targets <- list()
for (file in candidate_files) {
  expected_values <- parse_expected_values(read_text(file))
  is_option_vector <- length(expected_values) >= 3L &&
    length(expected_values) <= 5L &&
    all(expected_values %in% 1:4)
  if (is_option_vector) {
    targets[[file]] <- expected_values
  }
}

expected_target_dirs <- c(
  "Oef - 2.1 Meetniveau - Delicten rangschikken",
  "Oef - 2.9 Onderzoeksvraag classificatie - Inbraken per maand",
  "Oef - 2.10 Onderzoeksvraag classificatie - Recidive en leeftijd"
)
actual_target_dirs <- basename(dirname(dirname(names(targets))))
if (length(targets) != 3L || !setequal(actual_target_dirs, expected_target_dirs)) {
  stop(sprintf(
    paste0(
      "Expected the three Chapter 2 grouped fixed-choice evaluators, found %d: %s."
    ),
    length(targets),
    if (length(actual_target_dirs)) paste(actual_target_dirs, collapse = ", ") else "none"
  ))
}

count_heading <- function(message, heading) {
  hits <- gregexpr(heading, message, fixed = TRUE)[[1L]]
  if (length(hits) == 1L && hits[[1L]] == -1L) 0L else length(hits)
}

expect_count <- function(message, heading, expected, file, route) {
  actual <- count_heading(message, heading)
  if (actual != expected) {
    stop(sprintf(
      "%s [%s]: expected %d occurrence(s) of %s, found %d.\n%s",
      file, route, expected, heading, actual, message
    ))
  }
}

expect_diagnostic_intro <- function(message, file, route) {
  headings <- c(
    "**Waarschijnlijke redenering:**",
    "**Waarom deze keuze begrijpelijk kan lijken:**",
    "**Controleer je invoer:**"
  )
  count <- sum(vapply(headings, function(heading) count_heading(message, heading), integer(1)))
  if (count != 1L) {
    stop(sprintf("%s [%s]: expected one diagnostic opening heading.\n%s", file, route, message))
  }
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
  if (length(capture$tests) != 1L) {
    stop(sprintf("%s: expected one testcase.", file))
  }
  test <- capture$tests[[1L]]

  function(values) {
    capture$messages <- character()
    submission <- list2env(as.list(values), parent = emptyenv())
    generated <- test$generated(submission)
    score <- test$comparator(generated, test$expected)
    list(score = isTRUE(score), message = paste(capture$messages, collapse = "\n\n"))
  }
}

routes <- 0L
for (file in names(targets)) {
  expected_values <- targets[[file]]
  run <- load_evaluator(file)

  correct <- run(expected_values)
  if (!correct$score) stop(sprintf("%s [correct]: canonical vector was rejected.", file))
  expect_count(correct$message, "**Bevestiging:**", 1L, file, "correct")
  expect_count(correct$message, "**Denkregel:**", 1L, file, "correct")
  expect_count(correct$message, "**Transferstap:**", 1L, file, "correct")
  routes <- routes + 1L

  for (field in names(expected_values)) {
    wrong_values <- expected_values
    wrong_values[[field]] <- setdiff(1:4, expected_values[[field]])[[1L]]
    wrong <- run(wrong_values)
    route <- paste0("wrong field ", field)
    if (wrong$score) stop(sprintf("%s [%s]: wrong option was accepted.", file, route))
    expect_diagnostic_intro(wrong$message, file, route)
    expect_count(wrong$message, "**Waarom dit niet klopt:**", 1L, file, route)
    expect_count(wrong$message, "**Denkregel:**", 1L, file, route)
    expect_count(wrong$message, "**Volgende stap:**", 1L, file, route)
    expect_count(wrong$message, "**Bevestiging:**", 0L, file, route)
    expect_count(wrong$message, "**Transferstap:**", 0L, file, route)
    routes <- routes + 1L
  }

  missing_field <- names(expected_values)[[1L]]
  missing_values <- expected_values[names(expected_values) != missing_field]
  missing <- run(missing_values)
  route <- paste0("missing field ", missing_field)
  if (missing$score) stop(sprintf("%s [%s]: incomplete answer was accepted.", file, route))
  expect_diagnostic_intro(missing$message, file, route)
  expect_count(missing$message, "**Waarom dit niet klopt:**", 1L, file, route)
  expect_count(missing$message, "**Denkregel:**", 1L, file, route)
  expect_count(missing$message, "**Volgende stap:**", 1L, file, route)
  expect_count(missing$message, "**Bevestiging:**", 0L, file, route)
  routes <- routes + 1L
}

if (routes != 18L) {
  stop(sprintf("Expected 18 Chapter 2 fixed-choice feedback routes, found %d.", routes))
}

cat(sprintf(
  "Validated %d correct, field-specific wrong-option, and missing-input routes across %d grouped fixed-choice evaluators.\n",
  routes,
  length(targets)
))
