root <- normalizePath(".", winslash = "/", mustWork = TRUE)
chapter <- file.path(root, "Hoofdstuk_3_De univariate beschrijvende statistiek")

exercise_dir <- function(number) {
  folders <- list.dirs(chapter, recursive = FALSE, full.names = TRUE)
  pattern <- sprintf("^Oef - 3\\.%s ", number)
  matches <- folders[grepl(pattern, basename(folders))]
  if (length(matches) != 1L) {
    stop(sprintf("Exercise 3.%s: expected one folder, found %d.", number, length(matches)))
  }
  matches[[1L]]
}

read_text <- function(path) paste(readLines(path, warn = FALSE), collapse = "\n")

assert_absent <- function(text, pattern, label) {
  if (grepl(pattern, text, fixed = TRUE)) {
    stop(sprintf("%s still contains answer-revealing text: %s", label, pattern))
  }
}

load_evaluator <- function(file) {
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
  runner <- function(values) {
    submission <- list2env(values, parent = emptyenv())
    capture$messages <- character()
    generated <- test$generated(submission)
    isTRUE(test$comparator(generated, test$expected))
  }
  attr(runner, "messages") <- function() capture$messages
  runner
}

expect_score <- function(run, values, expected, label) {
  actual <- run(values)
  if (!identical(actual, expected)) {
    stop(sprintf("%s: expected score %s, received %s.", label, expected, actual))
  }
}

# Student-visible examples and comments must not disclose assessed results.
visible_31 <- paste(
  read_text(file.path(exercise_dir("1"), "description", "description.nl.md")),
  read_text(file.path(exercise_dir("1"), "description", "boilerplate", "boilerplate"))
)
assert_absent(visible_31, "Bijvoorbeeld voor \"Zelden\"", "Exercise 3.1")
assert_absent(visible_31, "bijvoorbeeld 3.23", "Exercise 3.1")

visible_33 <- paste(
  read_text(file.path(exercise_dir("3"), "description", "description.nl.md")),
  read_text(file.path(exercise_dir("3"), "description", "boilerplate", "boilerplate"))
)
assert_absent(visible_33, "(33.55)", "Exercise 3.3")
assert_absent(visible_33, "24 - 33.55", "Exercise 3.3")
assert_absent(visible_33, "(-9.5500)^2", "Exercise 3.3")

visible_34 <- paste(
  read_text(file.path(exercise_dir("4"), "description", "description.nl.md")),
  read_text(file.path(exercise_dir("4"), "description", "boilerplate", "boilerplate"))
)
assert_absent(visible_34, "(238.91)", "Exercise 3.4")
assert_absent(visible_34, "# Gesorteerd:", "Exercise 3.4")
assert_absent(visible_34, "Q1 = 3de waarde", "Exercise 3.4")
assert_absent(visible_34, "Q3 = 3de waarde", "Exercise 3.4")

visible_35 <- paste(
  read_text(file.path(exercise_dir("5"), "description", "description.nl.md")),
  read_text(file.path(exercise_dir("5"), "description", "boilerplate", "boilerplate"))
)
assert_absent(visible_35, "bijv. 2.58", "Exercise 3.5")
assert_absent(visible_35, "Dit is de gekozen spreidingsmaat", "Exercise 3.5")
assert_absent(visible_35, "standaarddeviatie de meest informatieve maat", "Exercise 3.5")
if (!grepl("steekproef van 9 wijken", visible_35, fixed = TRUE)) {
  stop("Exercise 3.5 must identify the nine neighbourhoods as a sample.")
}
if (!grepl("Vervang `???` door het juiste antwoord", visible_35, fixed = TRUE)) {
  stop("Exercise 3.5 description and boilerplate placeholders are inconsistent.")
}

# Exercise 3.3: correct sample variance and coherent spread choice.
run_33 <- load_evaluator(file.path(exercise_dir("3"), "evaluation", "Answer.R"))
hours <- c(24, 36, 35, 28, 24, 28, 24, 36, 32, 36, 40, 38, 36, 34, 40, 36, 32, 36, 40, 36)
deviation_names_33 <- c(
  "afwijking_24_1", "afwijking_36_1", "afwijking_35", "afwijking_28_1", "afwijking_24_2",
  "afwijking_28_2", "afwijking_24_3", "afwijking_36_2", "afwijking_32_1", "afwijking_36_3",
  "afwijking_40_1", "afwijking_38", "afwijking_36_4", "afwijking_34", "afwijking_40_2",
  "afwijking_36_5", "afwijking_32_2", "afwijking_36_6", "afwijking_40_3", "afwijking_36_7"
)
squared_names_33 <- sub("^afwijking", "gekw_afwijking", deviation_names_33)
correct_33 <- c(
  list(
    freq_24 = 3, freq_28 = 2, freq_32 = 2, freq_34 = 1,
    freq_35 = 1, freq_36 = 7, freq_38 = 1, freq_40 = 3,
    percent_24 = 15, percent_28 = 10, percent_32 = 10, percent_34 = 5,
    percent_35 = 5, percent_36 = 35, percent_38 = 5, percent_40 = 15,
    modus = 36, mediaan = 36, gemiddelde = 33.55,
    variatiebreedte = 16, q1 = 30, q3 = 36, ika = 6,
    meest_relevante_centraliteit = "gemiddelde",
    meest_relevante_spreiding = "standaardafwijking",
    reden = "gebruikt alle informatie",
    sum_of_squares = 528.95,
    variantie = 27.8395,
    standaardafwijking = 5.2763,
    variatiecoefficient = 0.1573
  ),
  setNames(as.list(round(hours - 33.55, 4)), deviation_names_33),
  setNames(as.list(round((hours - 33.55)^2, 4)), squared_names_33)
)
expect_score(run_33, correct_33, TRUE, "Exercise 3.3 correct route")
old_variance_33 <- correct_33
old_variance_33$variantie <- 27.8295
expect_score(run_33, old_variance_33, FALSE, "Exercise 3.3 old incorrect variance")

# Exercise 3.4: two-decimal percentages and internally consistent squared deviations.
run_34 <- load_evaluator(file.path(exercise_dir("4"), "evaluation", "Answer.R"))
marriages <- c(240, 144, 143, 72, 30, 26, 2, 150, 14, 150, 1657)
deviation_names_34 <- c(
  "afwijking_240", "afwijking_144", "afwijking_143", "afwijking_72", "afwijking_30",
  "afwijking_26", "afwijking_2", "afwijking_150_1", "afwijking_14", "afwijking_150_2", "afwijking_1657"
)
squared_names_34 <- sub("^afwijking", "gekw_afwijking", deviation_names_34)
rounded_deviations_34 <- round(marriages - 238.91, 2)
correct_34 <- c(
  list(
    freq_2 = 1, freq_14 = 1, freq_26 = 1, freq_30 = 1, freq_72 = 1,
    freq_143 = 1, freq_144 = 1, freq_150 = 2, freq_240 = 1, freq_1657 = 1,
    percent_2 = 9.09, percent_14 = 9.09, percent_26 = 9.09,
    percent_30 = 9.09, percent_72 = 9.09, percent_143 = 9.09,
    percent_144 = 9.09, percent_150 = 18.18, percent_240 = 9.09,
    percent_1657 = 9.09,
    gemiddelde = 238.91, mediaan = 143, modus = 150,
    variatiebreedte = 1655, q1 = 26, q3 = 150, ika = 124,
    sum_of_squares = 2268540.93,
    variantie = 226854.09,
    standaardafwijking = 476.29
  ),
  setNames(as.list(rounded_deviations_34), deviation_names_34),
  setNames(as.list(round(rounded_deviations_34^2, 2)), squared_names_34)
)
accepted_squared_sum_34 <- sum(unlist(correct_34[squared_names_34]))
if (abs(accepted_squared_sum_34 - correct_34$sum_of_squares) > 0.005) {
  stop("Exercise 3.4 accepted squared deviations do not add to the accepted sum of squares.")
}
expect_score(run_34, correct_34, TRUE, "Exercise 3.4 correct route")
one_decimal_34 <- correct_34
one_decimal_34$percent_2 <- 9.1
expect_score(run_34, one_decimal_34, FALSE, "Exercise 3.4 one-decimal percentage")
old_square_34 <- correct_34
old_square_34$gekw_afwijking_72 <- 27859.15
expect_score(run_34, old_square_34, FALSE, "Exercise 3.4 old incorrect square")

# Exercise 3.5: only the correctly rounded two-decimal SD is accepted.
run_35 <- load_evaluator(file.path(exercise_dir("5"), "evaluation", "Answer.R"))
correct_35 <- list(
  gemiddelde_incidenten = 6,
  afwijkingen = c(-4, 1, 4, -1, 0, 2, -3, -2, 3),
  gekwadrateerde_afwijkingen = c(16, 1, 16, 1, 0, 4, 9, 4, 9),
  sum_of_squares = 60,
  variantie_incidenten = 7.5,
  standaarddeviatie_incidenten = 2.74,
  gekozen_spreidingsmaat = "standaarddeviatie"
)
expect_score(run_35, correct_35, TRUE, "Exercise 3.5 correct route")

population_35 <- correct_35
population_35$variantie_incidenten <- 6.67
population_35$standaarddeviatie_incidenten <- 2.58
expect_score(run_35, population_35, FALSE, "Exercise 3.5 population-denominator route")

expect_score(run_35, list(), FALSE, "Exercise 3.5 missing route")

text_35 <- lapply(correct_35, function(value) "geen getal")
expect_score(run_35, text_35, FALSE, "Exercise 3.5 text-input route")
if (!grepl("eindig numeriek getal", paste(attr(run_35, "messages")(), collapse = "\n"), fixed = TRUE)) {
  stop("Exercise 3.5 text-input route did not return numeric input guidance.")
}

na_35 <- lapply(correct_35, function(value) {
  if (is.numeric(value)) rep(NA_real_, length(value)) else NA_character_
})
expect_score(run_35, na_35, FALSE, "Exercise 3.5 NA-input route")
if (!grepl("eindig numeriek getal", paste(attr(run_35, "messages")(), collapse = "\n"), fixed = TRUE)) {
  stop("Exercise 3.5 NA-input route did not return numeric input guidance.")
}

inf_35 <- lapply(correct_35, function(value) {
  if (is.numeric(value)) rep(Inf, length(value)) else value
})
expect_score(run_35, inf_35, FALSE, "Exercise 3.5 infinite-input route")
if (!grepl("eindig numeriek getal", paste(attr(run_35, "messages")(), collapse = "\n"), fixed = TRUE)) {
  stop("Exercise 3.5 infinite-input route did not return numeric input guidance.")
}

short_vectors_35 <- correct_35
short_vectors_35$afwijkingen <- c(-4, 1)
short_vectors_35$gekwadrateerde_afwijkingen <- c(16, 1)
expect_score(run_35, short_vectors_35, FALSE, "Exercise 3.5 short-vector route")
if (!grepl("precies negen eindige waarden", paste(attr(run_35, "messages")(), collapse = "\n"), fixed = TRUE)) {
  stop("Exercise 3.5 short-vector route did not return vector-length guidance.")
}

adjacent_sd_35 <- correct_35
adjacent_sd_35$standaarddeviatie_incidenten <- 2.73
expect_score(run_35, adjacent_sd_35, FALSE, "Exercise 3.5 adjacent hundredth")

cat("Chapter 3 answer-hygiene verification passed.\n")
