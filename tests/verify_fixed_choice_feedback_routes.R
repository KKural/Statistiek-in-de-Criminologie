root <- normalizePath(".", winslash = "/", mustWork = TRUE)

chapter_1 <- list.files(
  file.path(root, "Hoofdstuk_1_De logica van statistische vergelijkingen en analyses"),
  pattern = "^Answer\\.R$",
  recursive = TRUE,
  full.names = TRUE
)
chapter_2 <- list.files(
  file.path(root, "Hoofdstuk_2_Inleidende begrippen"),
  pattern = "^Answer\\.R$",
  recursive = TRUE,
  full.names = TRUE
)
chapter_2 <- chapter_2[
  grepl("/Oef - 2\\.[1-5] [^/]+/evaluation/Answer\\.R$", gsub("\\\\", "/", chapter_2))
]
files <- c(chapter_1, chapter_2)

if (length(files) != 15L) {
  stop(sprintf("Expected 15 fixed-choice evaluators, found %d.", length(files)))
}

count_heading <- function(message, heading) {
  hits <- gregexpr(heading, message, fixed = TRUE)[[1]]
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

load_comparator <- function(file) {
  capture <- new.env(parent = emptyenv())
  capture$tests <- list()
  capture$messages <- character()

  evaluation <- new.env(parent = globalenv())
  evaluation[["%||%"]] <- function(left, right) {
    if (is.null(left)) right else left
  }
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
    stop(sprintf("%s: expected one fixed-choice testcase.", file))
  }

  list(
    test = capture$tests[[1L]],
    run = function(value) {
      capture$messages <- character()
      capture$tests[[1L]]$comparator(value, capture$tests[[1L]]$expected)
      paste(capture$messages, collapse = "\n\n")
    }
  )
}

for (file in files) {
  loaded <- load_comparator(file)
  expected <- as.numeric(loaded$test$expected)

  correct <- loaded$run(expected)
  expect_count(correct, "**Bevestiging:**", 1L, file, "correct")
  expect_count(correct, "**Denkregel:**", 1L, file, "correct")
  expect_count(correct, "**Transferstap:**", 1L, file, "correct")
  expect_count(correct, "**Waarschijnlijke redenering:**", 0L, file, "correct")
  expect_count(correct, "**Volgende stap:**", 0L, file, "correct")
  expect_count(correct, "**Invoercontrole:**", 0L, file, "correct")

  for (wrong_value in setdiff(1:4, expected)) {
    wrong <- loaded$run(wrong_value)
    route <- paste0("wrong option ", wrong_value)
    expect_count(wrong, "**Waarschijnlijke redenering:**", 1L, file, route)
    expect_count(wrong, "**Waarom dit niet klopt:**", 1L, file, route)
    expect_count(wrong, "**Denkregel:**", 1L, file, route)
    expect_count(wrong, "**Volgende stap:**", 1L, file, route)
    expect_count(wrong, "**Bevestiging:**", 0L, file, route)
    expect_count(wrong, "**Transferstap:**", 0L, file, route)
    expect_count(wrong, "**Invoercontrole:**", 0L, file, route)
  }

  invalid <- loaded$run(99)
  expect_count(invalid, "**Invoercontrole:**", 1L, file, "invalid input")
  expect_count(invalid, "**Waarom dit niet klopt:**", 1L, file, "invalid input")
  expect_count(invalid, "**Denkregel:**", 1L, file, "invalid input")
  expect_count(invalid, "**Volgende stap:**", 1L, file, "invalid input")
  expect_count(invalid, "**Waarschijnlijke redenering:**", 0L, file, "invalid input")
  expect_count(invalid, "**Bevestiging:**", 0L, file, "invalid input")
  expect_count(invalid, "**Transferstap:**", 0L, file, "invalid input")
}

cat(sprintf(
  "Validated correct, every listed wrong option, and invalid-input feedback for %d fixed-choice evaluators.\n",
  length(files)
))
