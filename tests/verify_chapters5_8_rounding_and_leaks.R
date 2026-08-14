root <- normalizePath(".", winslash = "/", mustWork = TRUE)

exercise_file <- function(chapter_pattern, exercise, ...) {
  chapter <- list.dirs(root, recursive = FALSE, full.names = TRUE)
  chapter <- chapter[grepl(chapter_pattern, basename(chapter))]
  if (length(chapter) != 1L) stop("Expected exactly one matching chapter.")
  file.path(chapter, paste0("Oef - ", exercise), ...)
}

load_evaluator <- function(file) {
  capture <- new.env(parent = emptyenv())
  capture$tests <- list()
  capture$messages <- character()

  evaluation <- new.env(parent = globalenv())
  evaluation$`%||%` <- function(x, y) if (is.null(x)) y else x
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
    stop(sprintf("%s: expected exactly one testcase.", file))
  }

  test <- capture$tests[[1L]]
  function(values) {
    submission <- list2env(values, parent = emptyenv())
    capture$messages <- character()
    generated <- test$generated(submission)
    score <- test$comparator(generated, test$expected)
    list(score = isTRUE(score), message = paste(capture$messages, collapse = "\n"))
  }
}

expect_score <- function(result, expected, route) {
  if (!identical(result$score, expected)) {
    stop(sprintf("%s: expected score %s, received %s.", route, expected, result$score))
  }
}

expect_message <- function(result, pattern, route) {
  if (!grepl(pattern, result$message, perl = TRUE)) {
    stop(sprintf("%s: feedback did not match %s.\n%s", route, pattern, result$message))
  }
}

run_51 <- load_evaluator(exercise_file(
  "^Hoofdstuk_5_", "5.1", "evaluation", "Answer.R"
))
correct_51 <- list(
  z1_a = -3.00, z2_a = -2.33, p_z1_a = 0.0013, p_z2_a = 0.0099,
  verschil_a = 0.0086, vraag_a = 0.86, vraag_b = 8.08, vraag_c = 96.41
)
expect_score(run_51(correct_51), TRUE, "5.1 rounded answers")
wrong_51 <- correct_51
wrong_51$vraag_b <- 8.09
expect_score(run_51(wrong_51), FALSE, "5.1 incorrect hundredth")

run_52 <- load_evaluator(exercise_file(
  "^Hoofdstuk_5_", "5.2", "evaluation", "Answer.R"
))
correct_52 <- list(
  z_65 = -1.00, z_80 = 0.50, percentage_trainen = 53.28,
  percentage_spelen = 30.85, aantal_trainen = 27, aantal_spelen = 15
)
expect_score(run_52(correct_52), TRUE, "5.2 continuous 65-to-80 boundary")
wrong_52 <- correct_52
wrong_52$percentage_trainen <- 49.67
wrong_52$aantal_trainen <- 25
result_52 <- run_52(wrong_52)
expect_score(result_52, FALSE, "5.2 literal 79 misconception")
expect_message(result_52, "79 als bovengrens", "5.2 literal 79 feedback")

run_54 <- load_evaluator(exercise_file(
  "^Hoofdstuk_5_", "5.4", "evaluation", "Answer.R"
))
expect_score(run_54(list(vraag_a = 38.30, vraag_b = 15.87)), TRUE, "5.4 rounded answers")
expect_score(run_54(list(vraag_a = 38.31, vraag_b = 15.87)), FALSE, "5.4 incorrect hundredth")

run_71 <- load_evaluator(exercise_file(
  "^Hoofdstuk_7_", "7.1", "evaluation", "Answer.R"
))
correct_71 <- list(
  percentage_mannen = 61.50, percentage_vrouwen = 38.50,
  percentage_yes = 25.00, percentage_no = 75.00,
  percentage_yes_bij_mannen = 30.89, percentage_yes_bij_vrouwen = 15.58,
  percentageverschil_yes = 15.31, odds_mannen = 0.4471,
  odds_vrouwen = 0.1846, odds_ratio = 2.42, chi_kwadraat = 59.1983,
  kans_no_bij_vrouwen = 0.8442, antwoord_mc = 3
)
expect_score(run_71(correct_71), TRUE, "7.1 rounded answers")
wrong_71 <- correct_71
wrong_71$percentage_mannen <- 61.60
expect_score(run_71(wrong_71), FALSE, "7.1 broad-tolerance regression")

run_72 <- load_evaluator(exercise_file(
  "^Hoofdstuk_7_", "7.2", "evaluation", "Answer.R"
))
correct_72 <- list(
  percentage_ja_bij_mannen = 41.98, percentage_ja_bij_vrouwen = 25.00,
  percentageverschil_ja = 16.98, chi_kwadraat = 60.18,
  associatiemaat_mc = 1, phi = 0.18, interpretatie_phi_mc = 1
)
expect_score(run_72(correct_72), TRUE, "7.2 rounded answers")
wrong_72 <- correct_72
wrong_72$phi <- 0.19
expect_score(run_72(wrong_72), FALSE, "7.2 broad-tolerance regression")

run_81 <- load_evaluator(exercise_file(
  "^Hoofdstuk_8_", "8.1", "evaluation", "Answer.R"
))
correct_81 <- list(
  verklarende_variabele = 1, gemiddelde_x = 50.00, gemiddelde_y = 1.7380,
  SSx = 1066.0, SSy = 3.4434, SSxy = 57.87, variantie_x = 266.5,
  variantie_y = 0.8609, sd_x = 16.3248, sd_y = 0.9278,
  covariantie = 14.4675, pearson_r = 0.9552, correlatie_verandert = 2,
  verklaring_euro = "De correlatie blijft onveranderd bij een positieve lineaire transformatie."
)
expect_score(run_81(correct_81), TRUE, "8.1 complete rounded answers")
wrong_81 <- correct_81
wrong_81$pearson_r <- 0.955
expect_score(run_81(wrong_81), FALSE, "8.1 three-decimal r")

boilerplate_81 <- paste(readLines(exercise_file(
  "^Hoofdstuk_8_", "8.1", "description", "boilerplate", "boilerplate"
), warn = FALSE, encoding = "UTF-8"), collapse = "\n")
required_81 <- c(
  "gemiddelde_x", "gemiddelde_y", "SSx", "SSy", "SSxy", "variantie_x",
  "variantie_y", "sd_x", "sd_y", "covariantie", "pearson_r"
)
missing_81 <- required_81[!vapply(required_81, grepl, logical(1), x = boilerplate_81, fixed = TRUE)]
if (length(missing_81)) stop(paste("8.1 boilerplate missing:", paste(missing_81, collapse = ", ")))
if (!grepl("Pearson's correlatie (4 decimalen)", boilerplate_81, fixed = TRUE)) {
  stop("8.1 boilerplate does not request Pearson r to four decimals.")
}

run_85 <- load_evaluator(exercise_file(
  "^Hoofdstuk_8_", "8.5", "evaluation", "Answer.R"
))
expect_score(run_85(list(r_kwadraat_pct = 87)), TRUE, "8.5 rounded R-squared")
result_85_86 <- run_85(list(r_kwadraat_pct = 86))
expect_score(result_85_86, FALSE, "8.5 adjusted R-squared")
expect_message(result_85_86, "gecorrigeerde", "8.5 adjusted R-squared feedback")
expect_score(run_85(list(r_kwadraat_pct = 88)), FALSE, "8.5 upper-neighbour integer")

cat("Chapter 5-8 rounding/leak verification passed.\n")
