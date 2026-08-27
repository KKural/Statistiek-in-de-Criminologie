if (.Platform$OS.type == "windows") {
  for (locale in c(".UTF-8", "English_United States.utf8", "C.UTF-8")) {
    selected <- suppressWarnings(Sys.setlocale("LC_CTYPE", locale))
    suppressWarnings(Sys.setlocale("LC_COLLATE", locale))
    if (!is.na(selected)) break
  }
}

exercise_cases <- list(
  list(
    file = file.path(
      "Hoofdstuk_2_Inleidende begrippen",
      "Oef - 2.6 Variabeletype - Studentnummer classificatie",
      "evaluation", "Answer.R"
    ),
    correct = list(
      favoriete_keuze = "Nominaal",
      leeftijd = "Ratio",
      geslacht = "Nominaal",
      studierichting = "Nominaal",
      studentnummer = "Nominaal"
    )
  ),
  list(
    file = file.path(
      "Hoofdstuk_2_Inleidende begrippen",
      "Oef - 2.7 Onafhankelijke en afhankelijke variabelen - Jongeren interventie",
      "evaluation", "Answer.R"
    ),
    correct = list(
      onafhankelijke_variabele = "De interventie",
      meetniveau_onafhankelijk_variabele = "nominaal",
      afhankelijke_variabele = "Het aantal meldingen van overlast",
      meetniveau_afhankelijk_variabele = "ratio"
    )
  )
)

run_evaluator <- function(spec) {
  captured_test <- NULL
  captured_expected <- NULL
  captured_comparator <- NULL

  mock <- new.env(parent = globalenv())
  mock$context <- function(expression) force(expression)
  mock$testcase <- function(description, expression) force(expression)
  mock$testEqual <- function(description, test_function, expected,
                             comparator, ...) {
    captured_test <<- test_function
    captured_expected <<- expected
    captured_comparator <<- comparator
    invisible(NULL)
  }
  mock$get_reporter <- function() {
    list(add_message = function(...) invisible(NULL))
  }

  source(spec$file, local = mock, encoding = "UTF-8")
  if (!is.function(captured_test) || !is.function(captured_comparator)) {
    stop(sprintf("Could not capture the evaluator in %s.", spec$file))
  }

  first_field <- names(spec$correct)[[1L]]
  cases <- list(
    correct = spec$correct,
    wrong = utils::modifyList(spec$correct, setNames(list("onjuist"), first_field)),
    vector = utils::modifyList(
      spec$correct,
      setNames(list(c(spec$correct[[first_field]], "extra")), first_field)
    ),
    missing = spec$correct[names(spec$correct) != first_field],
    na = utils::modifyList(spec$correct, setNames(list(NA_character_), first_field)),
    empty = utils::modifyList(spec$correct, setNames(list(""), first_field))
  )

  outcomes <- vapply(names(cases), function(case_name) {
    submission <- list2env(cases[[case_name]], parent = emptyenv())
    generated <- captured_test(submission)
    if (length(generated) != 1L || is.na(generated)) {
      stop(sprintf("%s returned a non-scalar result for %s.", spec$file, case_name))
    }
    captured_comparator(generated, captured_expected)
    isTRUE(generated)
  }, logical(1))

  if (!isTRUE(outcomes[["correct"]]) || any(outcomes[names(outcomes) != "correct"])) {
    stop(sprintf("Unexpected scalar-input outcomes in %s.", spec$file))
  }
}

invisible(lapply(exercise_cases, run_evaluator))
cat("Chapter 2 text evaluators handle correct, wrong, vector, missing, NA and empty inputs safely.\n")
