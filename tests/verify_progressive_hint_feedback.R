targets <- list(
  list(id = "5.5", path = "Hoofdstuk_5_De standaardnormale verdeling en diens eigenschappen/Oef - 5.5/evaluation/Answer.R", options = 1:5, solution = "45 jaar", leak = "45 jaar|z\\s*≈\\s*1\\.28|Correct antwoord"),
  list(id = "12.1", path = "Hoofdstuk_12_Complexere relaties tussen variabelen/Oef - 12.1/evaluation/Answer.R", options = 1:4, solution = "Empathische bezorgdheid", leak = "Empathische bezorgdheid.*Empathische perspectiefneming|Correct antwoord"),
  list(id = "12.2", path = "Hoofdstuk_12_Complexere relaties tussen variabelen/Oef - 12.2/evaluation/Answer.R", options = 1:4, solution = "Moreel oordeel", leak = "Moreel oordeel|Correct antwoord"),
  list(id = "12.3", path = "Hoofdstuk_12_Complexere relaties tussen variabelen/Oef - 12.3/evaluation/Answer.R", options = 1:4, solution = "Morele intuïties", leak = "Morele intuïties \\(individualiserend\\)|Correct antwoord"),
  list(id = "12.4", path = "Hoofdstuk_12_Complexere relaties tussen variabelen/Oef - 12.4/evaluation/Answer.R", options = 1:4, solution = "\\.18", leak = "(?<![0-9])\\.18(?![0-9])|Correct antwoord"),
  list(id = "12.5", path = "Hoofdstuk_12_Complexere relaties tussen variabelen/Oef - 12.5/evaluation/Answer.R", options = 1:4, solution = "twee indirecte paden", leak = "twee indirecte paden|Correct antwoord"),
  list(id = "12.6", path = "Hoofdstuk_12_Complexere relaties tussen variabelen/Oef - 12.6/evaluation/Answer.R", options = 1:4, solution = "0\\.4264", leak = "0[.,]4264|0[.,]0864|0[.,]34\\s*\\+|Correct antwoord"),
  list(id = "12.7", path = "Hoofdstuk_12_Complexere relaties tussen variabelen/Oef - 12.7/evaluation/Answer.R", options = 1:4, solution = "2%", leak = "R²\\s*=\\s*2%|\\*\\*2%\\*\\*|Correct antwoord"),
  list(id = "12.8", path = "Hoofdstuk_12_Complexere relaties tussen variabelen/Oef - 12.8/evaluation/Answer.R", options = 1:4, solution = "57%", leak = "57%|100%\\s*[−-]\\s*43%|100\\s*[−-]\\s*43|Correct antwoord"),
  list(id = "12.9", path = "Hoofdstuk_12_Complexere relaties tussen variabelen/Oef - 12.9/evaluation/Answer.R", options = 1:4, solution = "57%", leak = "57%|Correct antwoord"),
  list(id = "12.11", path = "Hoofdstuk_12_Complexere relaties tussen variabelen/Oef - 12.11/evaluation/Answer.R", options = 1:4, solution = "Figuur B", leak = "Alleen in Figuur B|Figuur B.*schending|Correct antwoord"),
  list(id = "12.12", path = "Hoofdstuk_12_Complexere relaties tussen variabelen/Oef - 12.12/evaluation/Answer.R", options = 1:4, solution = "Figuur B", leak = "Alleen in Figuur B|Figuur B.*heteroscedasticiteit|Correct antwoord"),
  list(id = "12.13", path = "Hoofdstuk_12_Complexere relaties tussen variabelen/Oef - 12.13/evaluation/Answer.R", options = 1:4, solution = "Figuur B", leak = "Alleen in Figuur B|Figuur B.*schending|rechterstaart van B|Correct antwoord"),
  list(id = "12.14", path = "Hoofdstuk_12_Complexere relaties tussen variabelen/Oef - 12.14/evaluation/Answer.R", options = 1:4, solution = "Model B", leak = "Alleen Model B|Model B.*probleem|circa 34|≈\\s*34|Correct antwoord")
)

count_heading <- function(message, heading) {
  hits <- gregexpr(heading, message, fixed = TRUE)[[1L]]
  if (length(hits) == 1L && hits[[1L]] == -1L) 0L else length(hits)
}

expect_heading <- function(message, heading, expected, id, route) {
  actual <- count_heading(message, heading)
  if (actual != expected) {
    stop(sprintf("%s [%s]: expected %d occurrence(s) of %s, found %d.\n%s", id, route, expected, heading, actual, message))
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
    capture$tests[[length(capture$tests) + 1L]] <- list(expected = expected, comparator = comparator)
    invisible(NULL)
  }
  evaluation$get_reporter <- function() {
    list(add_message = function(message, type = NULL) {
      capture$messages <- c(capture$messages, as.character(message))
      invisible(NULL)
    })
  }

  sys.source(file, envir = evaluation, keep.source = FALSE)
  if (length(capture$tests) != 1L) stop(sprintf("%s: expected one testcase", file))

  list(
    expected = as.numeric(capture$tests[[1L]]$expected),
    run = function(value) {
      capture$messages <- character()
      capture$tests[[1L]]$comparator(value, capture$tests[[1L]]$expected)
      paste(capture$messages, collapse = "\n\n")
    }
  )
}

for (target in targets) {
  loaded <- load_evaluator(target$path)
  correct <- loaded$run(loaded$expected)
  expect_heading(correct, "**Bevestiging:**", 1L, target$id, "correct")
  expect_heading(correct, "**Denkregel:**", 1L, target$id, "correct")
  expect_heading(correct, "**Transferstap:**", 1L, target$id, "correct")
  if (!grepl(target$solution, correct, perl = TRUE, ignore.case = TRUE)) {
    stop(sprintf("%s [correct]: complete solution is missing.\n%s", target$id, correct))
  }

  for (value in setdiff(target$options, loaded$expected)) {
    message <- loaded$run(value)
    route <- sprintf("wrong option %s", value)
    expect_heading(message, "**Waarschijnlijke redenering:**", 1L, target$id, route)
    expect_heading(message, "**Waarom dit niet klopt:**", 1L, target$id, route)
    expect_heading(message, "**Denkregel:**", 1L, target$id, route)
    expect_heading(message, "**Volgende stap:**", 1L, target$id, route)
    expect_heading(message, "**Bevestiging:**", 0L, target$id, route)
    expect_heading(message, "**Transferstap:**", 0L, target$id, route)
    if (grepl(target$leak, message, perl = TRUE, ignore.case = TRUE)) {
      stop(sprintf("%s [%s]: feedback reveals the final solution.\n%s", target$id, route, message))
    }
  }

  invalid <- loaded$run(99)
  expect_heading(invalid, "**Controleer je invoer:**", 1L, target$id, "invalid input")
  expect_heading(invalid, "**Waarom dit niet klopt:**", 1L, target$id, "invalid input")
  expect_heading(invalid, "**Denkregel:**", 1L, target$id, "invalid input")
  expect_heading(invalid, "**Volgende stap:**", 1L, target$id, "invalid input")
  if (grepl(target$leak, invalid, perl = TRUE, ignore.case = TRUE)) {
    stop(sprintf("%s [invalid input]: feedback reveals the final solution.\n%s", target$id, invalid))
  }
}

cat(sprintf("Progressive hint feedback passed for %d evaluators.\n", length(targets)))
