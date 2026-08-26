if (.Platform$OS.type == "windows") {
  for (locale in c(".UTF-8", "English_United States.utf8", "C.UTF-8")) {
    selected <- suppressWarnings(Sys.setlocale("LC_CTYPE", locale))
    suppressWarnings(Sys.setlocale("LC_COLLATE", locale))
    if (!is.na(selected)) break
  }
}

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
    stop(sprintf("%s: expected exactly one testcase, found %d.", file, length(capture$tests)))
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

run_91 <- load_evaluator(exercise_file("^Hoofdstuk_9_", "9.1", "evaluation", "Answer.R"))
correct_91 <- list(
  H0_richting = 1, E_opsluiting_premier = 5.5, E_betaling_premier = 5.75,
  E_rehab_minister = 11.25, chi_kwadraat = 19.471, df_chi = 4,
  kritieke_waarde_005 = 9.488, significant_005 = 1,
  kritieke_waarde_001 = 13.277, significant_001 = 1
)
expect_score(run_91(correct_91), TRUE, "9.1 requested precision")
wrong_91 <- correct_91
wrong_91$chi_kwadraat <- 19.48
expect_score(run_91(wrong_91), FALSE, "9.1 broad chi-square tolerance")

run_92 <- load_evaluator(exercise_file("^Hoofdstuk_9_", "9.2", "evaluation", "Answer.R"))
correct_92 <- list(
  gemiddelde = 27.1, standaardfout = 0.6633,
  BI_90_onder = 26.01, BI_90_boven = 28.19,
  BI_99_onder = 25.39, BI_99_boven = 28.81,
  breder_interval = 2
)
expect_score(run_92(correct_92), TRUE, "9.2 requested precision")
wrong_92 <- correct_92
wrong_92$standaardfout <- 0.6634
expect_score(run_92(wrong_92), FALSE, "9.2 incorrect fourth decimal")

run_93 <- load_evaluator(exercise_file("^Hoofdstuk_9_", "9.3", "evaluation", "Answer.R"))
correct_93 <- list(
  z_waarde = 1.96, sigma = 9000, foutenmarge = 400,
  quotient = 44.1000, n_voor_afronding = 1944.81, n_minimum = 1945
)
expect_score(run_93(correct_93), TRUE, "9.3 requested precision")
wrong_93 <- correct_93
wrong_93$quotient <- 44.1001
expect_score(run_93(wrong_93), FALSE, "9.3 incorrect fourth decimal")

run_94 <- load_evaluator(exercise_file("^Hoofdstuk_9_", "9.4", "evaluation", "Answer.R"))
correct_94 <- list(
  gemiddelde_groot = 3190, gemiddelde_middel = 1580, gemiddelde_ruraal = 484,
  grand_mean = 1751.33, SS_within_groot = 1514000, SS_within_middel = 321000,
  SS_within_ruraal = 52040, SS_within = 1887040, df_within = 27,
  MS_within = 69890.37, SS_between = 37052506.67, df_between = 2,
  MS_between = 18526253.33, F_ratio = 265.08, eta_kwadraat = 0.9515,
  significant_anova = 1
)
expect_score(run_94(correct_94), TRUE, "9.4 requested precision")
wrong_94 <- correct_94
wrong_94$grand_mean <- 1751.34
expect_score(run_94(wrong_94), FALSE, "9.4 part-1 mean tolerance")

run_95 <- load_evaluator(exercise_file("^Hoofdstuk_9_", "9.5", "evaluation", "Answer.R"))
correct_95 <- as.list(c(vraag1 = 2, vraag2 = 4, vraag3 = 2, vraag4 = 3,
                        vraag5 = 1, vraag6 = 3, vraag7 = 2))
expect_score(run_95(correct_95), TRUE, "9.5 integer choices")
wrong_95 <- correct_95
wrong_95$vraag1 <- 2.4
expect_score(run_95(wrong_95), FALSE, "9.5 decimal choice")

run_101 <- load_evaluator(exercise_file("^Hoofdstuk_10_", "10.1", "evaluation", "Answer.R"))
correct_101 <- list(
  X_bar = 1.8571, Y_bar = 2.1429, Z_bar = 15.5714,
  SS_X = 28.8571, SS_Y = 10.8571, SS_Z = 13.7143,
  SCP_XY = 8.1429, SCP_XZ = 8.5714, SCP_YZ = 6.4286,
  Var_X = 4.8095, Var_Y = 1.8095, Var_Z = 2.2857,
  SD_X = 2.1931, SD_Y = 1.3452, SD_Z = 1.5119,
  Cov_XY = 1.3571, Cov_XZ = 1.4286, Cov_YZ = 1.0714,
  r_XY = 0.4600, r_XZ = 0.4309, r_YZ = 0.5268,
  r_XY_teller = 0.2330, r_XY_noemer = 0.7670, r_XY_Z = 0.3038,
  conclusie_type = 2
)
expect_score(run_101(correct_101), TRUE, "10.1 final-rounding route")
wrong_101 <- correct_101
wrong_101$X_bar <- 1.8572
expect_score(run_101(wrong_101), FALSE, "10.1 broad tolerance")

run_102 <- load_evaluator(exercise_file("^Hoofdstuk_10_", "10.2", "evaluation", "Answer.R"))
correct_102 <- list(
  r_XY = -0.44, r_XZ = -0.68, r_YZ = 0.82,
  r_XY_teller = 0.1176, r_XY_noemer = 0.4197, r_XY_Z = 0.2802,
  conclusie_type = 4
)
expect_score(run_102(correct_102), TRUE, "10.2 four-decimal route")
wrong_102 <- correct_102
wrong_102$r_XY_Z <- 0.2803
expect_score(run_102(wrong_102), FALSE, "10.2 broad partial-r tolerance")

run_103 <- load_evaluator(exercise_file("^Hoofdstuk_10_", "10.3", "evaluation", "Answer.R"))
correct_103 <- list(
  r_XY = 0.10, r_XZ = -0.65, r_YZ = -0.55,
  r_XY_teller = -0.2575, r_XY_noemer = 0.6347, r_XY_Z = -0.4057,
  conclusie_type = 3
)
expect_score(run_103(correct_103), TRUE, "10.3 four-decimal route")
wrong_103 <- correct_103
wrong_103$r_XY_Z <- -0.4058
expect_score(run_103(wrong_103), FALSE, "10.3 broad partial-r tolerance")

run_104 <- load_evaluator(exercise_file("^Hoofdstuk_10_", "10.4", "evaluation", "Answer.R"))
expect_score(run_104(list(conclusie_A = 1, conclusie_B = 2, conclusie_C = 3)),
             TRUE, "10.4 single intended testcase")

run_105 <- load_evaluator(exercise_file("^Hoofdstuk_10_", "10.5", "evaluation", "Answer.R"))
correct_105 <- as.list(c(vraag1 = 2, vraag2 = 3, vraag3 = 1, vraag4 = 3,
                          vraag5 = 2, vraag6 = 3, vraag7 = 2))
expect_score(run_105(correct_105), TRUE, "10.5 integer choices")
wrong_105 <- correct_105
wrong_105$vraag1 <- 2.4
expect_score(run_105(wrong_105), FALSE, "10.5 decimal choice")

run_111 <- load_evaluator(exercise_file("^Hoofdstuk_11_", "11.1", "evaluation", "Answer.R"))
correct_111 <- list(
  afhankelijke_variabele = 3, gemiddelde_x1 = 3.00, gemiddelde_x2 = 7.00,
  gemiddelde_y = 18.00, SSx1 = 10, SSx2 = 30, SSy = 80, SSx1x2 = 0,
  SSx1y = -22, SSx2y = 30, determinant_D = 300, b1 = -2.20, b2 = 1.00,
  intercept_a = 17.60, voorspelling = 19.00, R_kwadraat = 0.9800,
  richting_b1 = 2, sterkste_predictor = 1
)
expect_score(run_111(correct_111), TRUE, "11.1 requested precision")
wrong_111 <- correct_111
wrong_111$gemiddelde_x1 <- 3.01
expect_score(run_111(wrong_111), FALSE, "11.1 broad mean tolerance")
wrong_choice_111 <- correct_111
wrong_choice_111$afhankelijke_variabele <- 3.2
expect_score(run_111(wrong_choice_111), FALSE, "11.1 decimal choice")

run_113 <- load_evaluator(exercise_file("^Hoofdstuk_11_", "11.3", "evaluation", "Answer.R"))
expect_score(run_113(list(uitbijter = "B")), TRUE, "11.3 correct letter")
missing_113 <- run_113(list())
expect_score(missing_113, FALSE, "11.3 missing letter")
if (grepl('uitbijter <- "B"', missing_113$message, fixed = TRUE)) {
  stop("11.3 missing-answer feedback leaks the correct letter.")
}

run_115 <- load_evaluator(exercise_file("^Hoofdstuk_11_", "11.5", "evaluation", "Answer.R"))
expect_score(run_115(list(r_kwadraat_pct = 87)), TRUE, "11.5 whole percentage")
result_115_86 <- run_115(list(r_kwadraat_pct = 86))
expect_score(result_115_86, FALSE, "11.5 adjusted R-squared")
if (!grepl("gecorrigeerde", result_115_86$message, ignore.case = TRUE)) {
  stop("11.5 no longer recognises 86 as adjusted R-squared.")
}
result_115_85 <- run_115(list(r_kwadraat_pct = 85))
expect_score(result_115_85, FALSE, "11.5 lower neighbour")
if (grepl("komt overeen met de .*gecorrigeerde", result_115_85$message, ignore.case = TRUE)) {
  stop("11.5 falsely diagnoses 85 as adjusted R-squared.")
}
expect_score(run_115(list(r_kwadraat_pct = 88)), FALSE, "11.5 upper neighbour")

run_116 <- load_evaluator(exercise_file("^Hoofdstuk_11_", "11.6", "evaluation", "Answer.R"))
correct_116 <- as.list(c(
  vraag1 = 2, vraag2 = 3, vraag3 = 2, vraag4 = 2, vraag5 = 2, vraag6 = 1,
  vraag7 = 1, vraag8 = 1, vraag9 = 1, vraag10 = 1, vraag11 = 2,
  vraag12 = 2, vraag13 = 3, vraag14 = 3
))
expect_score(run_116(correct_116), TRUE, "11.6 integer choices")
wrong_116 <- correct_116
wrong_116$vraag1 <- 2.4
expect_score(run_116(wrong_116), FALSE, "11.6 decimal choice")

run_117 <- load_evaluator(exercise_file("^Hoofdstuk_11_", "11.7", "evaluation", "Answer.R"))
correct_117 <- as.list(c(
  vraag1 = 2, vraag2 = 4, vraag3 = 3, vraag4 = 4, vraag5 = 3, vraag6 = 3,
  vraag7 = 1, vraag8 = 2, vraag9 = 3, vraag10 = 3, vraag11 = 4
))
expect_score(run_117(correct_117), TRUE, "11.7 integer choices")
wrong_117 <- correct_117
wrong_117$vraag1 <- 2.4
expect_score(run_117(wrong_117), FALSE, "11.7 decimal choice")

leak_targets <- c(
  exercise_file("^Hoofdstuk_9_", "9.5", "description", "description.nl.md"),
  exercise_file("^Hoofdstuk_10_", "10.3", "description", "description.nl.md"),
  exercise_file("^Hoofdstuk_10_", "10.3", "description", "boilerplate", "boilerplate"),
  exercise_file("^Hoofdstuk_10_", "10.5", "description", "description.nl.md"),
  exercise_file("^Hoofdstuk_11_", "11.6", "description", "description.nl.md"),
  exercise_file("^Hoofdstuk_11_", "11.7", "description", "description.nl.md")
)
leak_text <- paste(vapply(
  leak_targets,
  function(f) paste(readLines(f, warn = FALSE, encoding = "UTF-8"), collapse = "\n"),
  character(1)
), collapse = "\n")
for (pattern in c("vraag1 <- 2", "suppressorvariabele is", "Suppressorvariabele: lage zelfcontrole")) {
  if (grepl(pattern, leak_text, fixed = TRUE)) stop("Answer-leaking text remains: ", pattern)
}

assets <- c(
  exercise_file("^Hoofdstuk_12_", "12.11", "description", "media", "resfit_a.png"),
  exercise_file("^Hoofdstuk_12_", "12.11", "description", "media", "resfit_b.png"),
  exercise_file("^Hoofdstuk_12_", "12.12", "description", "media", "scaleloc_a.png"),
  exercise_file("^Hoofdstuk_12_", "12.12", "description", "media", "scaleloc_b.png"),
  exercise_file("^Hoofdstuk_12_", "12.13", "description", "media", "qq_a.png"),
  exercise_file("^Hoofdstuk_12_", "12.13", "description", "media", "qq_b.png"),
  exercise_file("^Hoofdstuk_12_", "12.14", "description", "media", "vif_a.png"),
  exercise_file("^Hoofdstuk_12_", "12.14", "description", "media", "vif_b.png")
)
if (!all(file.exists(assets))) stop("A neutral Chapter 12 diagnostic asset is missing.")

cat("Chapter 9-13 rounding, route, leakage, and asset verification passed.\n")
