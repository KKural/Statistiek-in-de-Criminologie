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

expect_diagnostic <- function(result, file, route) {
  if (result$score) stop(sprintf("%s [%s]: diagnostic route was accepted.", file, route))
  opening_headings <- c(
    "**Waarschijnlijke redenering:**",
    "**Waarom deze keuze begrijpelijk kan lijken:**",
    "**Controleer je invoer:**"
  )
  opening_count <- sum(vapply(
    opening_headings,
    function(heading) count_heading(result$message, heading),
    integer(1)
  ))
  if (opening_count != 1L) {
    stop(sprintf("%s [%s]: expected one diagnostic opening heading.\n%s",
                 file, route, result$message))
  }
  expect_count(result$message, "**Waarom dit niet klopt:**", 1L, file, route)
  expect_count(result$message, "**Denkregel:**", 1L, file, route)
  expect_count(result$message, "**Volgende stap:**", 1L, file, route)
  expect_count(result$message, "**Bevestiging:**", 0L, file, route)
  expect_count(result$message, "**Transferstap:**", 0L, file, route)
  if (grepl("(?i)(?:correcte|juiste|finale)\\s+antwoord\\s*(?:is|=)",
            result$message, perl = TRUE)) {
    stop(sprintf("%s [%s]: diagnostic feedback reveals a final answer.\n%s",
                 file, route, result$message))
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
  if (length(capture$tests) != 1L) stop(sprintf("%s: expected one testcase.", file))
  test <- capture$tests[[1L]]

  function(values) {
    capture$messages <- character()
    submission <- list2env(as.list(values), parent = emptyenv())
    generated <- test$generated(submission)
    score <- test$comparator(generated, test$expected)
    list(score = isTRUE(score), message = paste(capture$messages, collapse = "\n\n"))
  }
}

all_evaluators <- list.files(
  root,
  pattern = "^Answer\\.R$",
  recursive = TRUE,
  full.names = TRUE
)
targets <- list()
for (file in all_evaluators) {
  expected_values <- parse_expected_values(read_text(file))
  if (length(expected_values) >= 3L && length(expected_values) <= 10L) {
    targets[[file]] <- expected_values
  }
}

chapter1_root <- normalizePath(
  file.path(root, "Hoofdstuk_1_De logica van statistische vergelijkingen en analyses"),
  winslash = "/",
  mustWork = TRUE
)
chapter1_targets <- startsWith(
  normalizePath(names(targets), winslash = "/", mustWork = TRUE),
  paste0(chapter1_root, "/")
)
if (any(chapter1_targets)) {
  stop("Simple Chapter 1 exercises must not enter the grouped progressive-feedback set.")
}

if (length(targets) != 17L) {
  stop(sprintf(
    "Expected 17 retained multi-answer evaluators with 3-10 named answers, found %d.",
    length(targets)
  ))
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

  wrong_messages <- character()
  for (field in names(expected_values)) {
    wrong_values <- expected_values
    step <- if (abs(expected_values[[field]]) < 0.01) 1 else abs(expected_values[[field]]) + 1
    wrong_values[[field]] <- expected_values[[field]] + step
    route <- paste0("wrong field ", field)
    wrong <- run(wrong_values)
    expect_diagnostic(wrong, file, route)
    wrong_messages <- c(wrong_messages, wrong$message)
    routes <- routes + 1L
  }
  evaluator_text <- read_text(file)
  declares_field_titles <- grepl("field_(?:titles|labels)\\s*<-\\s*c\\(",
                                 evaluator_text, perl = TRUE)
  if (declares_field_titles && length(unique(wrong_messages)) != length(expected_values)) {
    stop(sprintf(
      "%s: changing different fields did not produce field-specific progressive feedback.",
      file
    ))
  }

  missing_field <- names(expected_values)[[1L]]
  missing_values <- expected_values[names(expected_values) != missing_field]
  expect_diagnostic(run(missing_values), file, paste0("missing field ", missing_field))
  routes <- routes + 1L
}

if (routes != 96L) {
  stop(sprintf("Expected 96 retained progressive-feedback routes, found %d.", routes))
}

cat(sprintf(
  paste0(
    "Progressive feedback passed for %d logically grouped evaluators and %d routes; ",
    "diagnostic scaffolds avoid final-answer reveals, and field-labelled evaluators distinguish fields.\n"
  ),
  length(targets),
  routes
))
