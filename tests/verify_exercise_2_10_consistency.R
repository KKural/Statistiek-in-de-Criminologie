root <- normalizePath(".", winslash = "/", mustWork = TRUE)
chapter <- list.dirs(root, recursive = FALSE, full.names = TRUE)
chapter <- chapter[grepl("^Hoofdstuk_2_", basename(chapter))]
exercise <- list.dirs(chapter, recursive = FALSE, full.names = TRUE)
exercise <- exercise[grepl("^Oef - 2\\.10 ", basename(exercise))]
if (length(exercise) != 1L) stop("Expected exactly one Exercise 2.10 directory.")

capture <- new.env(parent = emptyenv())
capture$tests <- list()
capture$messages <- character()
evaluation <- new.env(parent = globalenv())
evaluation$context <- function(expression) force(expression)
evaluation$testcase <- function(name, expression) force(expression)
evaluation$testEqual <- function(description, generated, expected, comparator, ...) {
  capture$tests[[length(capture$tests) + 1L]] <- list(
    generated = generated,
    expected = expected,
    comparator = comparator
  )
}
evaluation$get_reporter <- function() {
  list(add_message = function(message, type = NULL) {
    capture$messages <- c(capture$messages, as.character(message))
  })
}

sys.source(file.path(exercise, "evaluation", "Answer.R"), envir = evaluation)
if (length(capture$tests) != 1L) stop("Exercise 2.10 must contain exactly one testcase.")
test <- capture$tests[[1L]]

run <- function(values) {
  capture$messages <- character()
  env <- list2env(values, parent = emptyenv())
  generated <- test$generated(env)
  score <- test$comparator(generated, test$expected)
  list(score = isTRUE(score), message = paste(capture$messages, collapse = "\n"))
}

correct <- list(
  type_vraag = "bivariate verklarende",
  bestudeerde_variabele = "recidive en exacte leeftijd van de dader",
  meetniveau_recidive = "nominaal",
  kwantitatief_recidive = "nee",
  meetniveau_leeftijd = "ratio",
  kwantitatief_leeftijd = "ja",
  type_waarden_leeftijd = "continue waarden",
  voorbeeld_waarden_leeftijd = "18.5, 25 en 42.2 jaar"
)

if (!run(correct)$score) stop("Exercise 2.10 rejects the complete correct route.")

chance_wording <- correct
chance_wording$bestudeerde_variabele <- "kans op recidive en leeftijd"
if (run(chance_wording)$score) stop("Exercise 2.10 still accepts a recidive probability instead of binary recidive.")

wrong_value_type <- correct
wrong_value_type$type_waarden_leeftijd <- "ratio waarden"
if (run(wrong_value_type)$score) stop("Exercise 2.10 conflates ratio level with continuous value type.")

vector_input <- correct
vector_input$type_vraag <- c("bivariate verklarende", "univariate beschrijvende")
vector_result <- tryCatch(run(vector_input), error = identity)
if (inherits(vector_result, "error")) stop("Exercise 2.10 crashes on vector-valued text input.")
if (vector_result$score) stop("Exercise 2.10 accepts vector-valued text input.")

bad_examples <- correct
bad_examples$voorbeeld_waarden_leeftijd <- "999"
if (run(bad_examples)$score) stop("Exercise 2.10 accepts an implausible single age example.")

wrong_result <- run(wrong_value_type)
if (grepl("bivariate verklarende|ratiovariabele|continue waarden", wrong_result$message, ignore.case = TRUE)) {
  stop("Exercise 2.10 leaks the complete solution on an incorrect route.")
}

cat("Exercise 2.10 consistency and progressive-feedback verification passed.\n")
