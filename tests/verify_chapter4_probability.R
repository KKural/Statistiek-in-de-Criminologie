root <- normalizePath(".", winslash = "/", mustWork = TRUE)
chapter <- file.path(root, "Hoofdstuk_4_Een inleiding in kansrekeren")

# Starting an R evaluator itself requires substantially more than 10 MB.  Keep
# Chapter 4 on Dodona's normal judge default unless a deliberately higher limit
# is configured.  This guards against status 137 / "Memory limit exceeded"
# regressions caused by interpreting memory_limit as a small decimal value.
config_files <- list.files(
  chapter,
  pattern = "^config\\.json$",
  recursive = TRUE,
  full.names = TRUE
)
too_small_memory_limits <- character()
for (config_file in config_files) {
  config_text <- paste(readLines(config_file, warn = FALSE), collapse = "\n")
  memory_match <- regexec(
    '"memory_limit"\\s*:\\s*([0-9]+)',
    config_text,
    perl = TRUE
  )
  matched <- regmatches(config_text, memory_match)[[1L]]
  if (length(matched) == 2L && as.numeric(matched[[2L]]) < 134217728) {
    too_small_memory_limits <- c(too_small_memory_limits, config_file)
  }
}
if (length(too_small_memory_limits) > 0L) {
  stop(paste(
    "Chapter 4 contains an explicit R memory limit below 128 MiB:",
    paste(too_small_memory_limits, collapse = ", ")
  ))
}

find_answer <- function(number) {
  pattern <- sprintf("^Oef - 4\\.%s ", gsub("\\.", "\\\\.", as.character(number)))
  folders <- list.dirs(chapter, recursive = FALSE, full.names = TRUE)
  matches <- folders[grepl(pattern, basename(folders))]
  if (length(matches) != 1L) {
    stop(sprintf("Exercise 4.%s: expected one folder, found %d.", number, length(matches)))
  }
  file.path(matches, "evaluation", "Answer.R")
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
  list(
    run = function(values = list()) {
      submission <- list2env(values, parent = emptyenv())
      capture$messages <- character()
      generated <- test$generated(submission)
      score <- test$comparator(generated, test$expected)
      list(
        score = isTRUE(score),
        message = paste(capture$messages, collapse = "\n\n")
      )
    }
  )
}

expect_text <- function(result, pattern, file, route) {
  if (!grepl(pattern, result$message, perl = TRUE)) {
    stop(sprintf("%s [%s]: missing feedback pattern %s.\n%s", file, route, pattern, result$message))
  }
}

expect_score <- function(result, expected, file, route) {
  if (!identical(result$score, expected)) {
    stop(sprintf("%s [%s]: expected score %s, received %s.", file, route, expected, result$score))
  }
}

expect_link <- function(result, file, route) {
  expect_text(result, "<a href=['\"]https://", file, route)
  expect_text(result, "Lees meer", file, route)
}

check_correct <- function(result, file, route = "correct") {
  expect_score(result, TRUE, file, route)
  expect_text(result, "\\*\\*Bevestiging:\\*\\*", file, route)
  expect_text(result, "\\*\\*Denkregel:\\*\\*", file, route)
  expect_text(result, "\\*\\*Transferstap:\\*\\*", file, route)
  expect_link(result, file, route)
}

check_mapped_wrong <- function(result, file, route) {
  expect_score(result, FALSE, file, route)
  expect_text(
    result,
    "\\*\\*(Waarschijnlijke redenering|Waarom deze keuze begrijpelijk kan lijken):\\*\\*",
    file,
    route
  )
  expect_text(result, "\\*\\*Waarom dit niet klopt:\\*\\*", file, route)
  expect_text(result, "\\*\\*Denkregel:\\*\\*", file, route)
  expect_text(result, "\\*\\*Volgende stap:\\*\\*", file, route)
  expect_link(result, file, route)
}

check_invalid <- function(result, file, route) {
  expect_score(result, FALSE, file, route)
  expect_text(result, "\\*\\*Controleer je invoer:\\*\\*", file, route)
  expect_text(result, "\\*\\*Denkregel:\\*\\*", file, route)
  expect_text(result, "\\*\\*Volgende stap:\\*\\*", file, route)
  expect_link(result, file, route)
}

mcq_specs <- list(
  list(number = "1", expected = 2L),
  list(number = "2", expected = 2L),
  list(number = "3", expected = 2L),
  list(number = "9", expected = 4L)
)

mcq_routes <- 0L
for (spec in mcq_specs) {
  file <- find_answer(spec$number)
  loaded <- load_evaluator(file)

  for (option in 1:4) {
    result <- loaded$run(list(evaluationResult = option))
    route <- sprintf("option %d", option)
    if (option == spec$expected) {
      check_correct(result, file, route)
    } else {
      check_mapped_wrong(result, file, route)
    }
    mcq_routes <- mcq_routes + 1L
  }

  check_invalid(loaded$run(list(evaluationResult = 99)), file, "out-of-range input")
  check_invalid(loaded$run(list(evaluationResult = "abc")), file, "text input")
  check_invalid(loaded$run(list()), file, "missing input")
  mcq_routes <- mcq_routes + 3L
}

numeric_specs <- list(
  list(
    number = "4",
    correct = list(kans_inbraak_of_geweld = 0.64, kans_geen_van_beide = 0.36),
    wrong = list(kans_inbraak_of_geweld = 0.0943, kans_geen_van_beide = 0.36)
  ),
  list(
    number = "5",
    correct = list(p_man = 0.4244, p_bachelor_given_man = 0.6776, p_man_and_bachelor = 0.2876),
    wrong = list(p_man = 0.5756, p_bachelor_given_man = 0.6776, p_man_and_bachelor = 0.2876)
  ),
  list(
    number = "6",
    correct = list(p_man = 0.8503, p_drug_given_man = 0.1200, p_joint = 0.1020),
    wrong = list(p_man = 0.8503, p_drug_given_man = 0.1224, p_joint = 0.1020)
  ),
  list(
    number = "8",
    correct = list(p_drug_given_man = 0.1200, p_man_given_drug = 0.8333),
    wrong = list(p_drug_given_man = 0.8333, p_man_given_drug = 0.1200)
  ),
  list(
    number = "10",
    correct = list(aantal_rangschikkingen = 560),
    wrong = list(aantal_rangschikkingen = 40320)
  ),
  list(
    number = "11",
    correct = list(combinatie_8_0 = 1, combinatie_5_5 = 1, lotto_combinaties = 4496388),
    wrong = list(combinatie_8_0 = 0, combinatie_5_5 = 1, lotto_combinaties = 4496388)
  ),
  list(
    number = "12",
    correct = list(permutaties_7 = 5040, permutaties_10 = 3628800),
    wrong = list(permutaties_7 = 2520, permutaties_10 = 3628800)
  ),
  list(
    number = "13",
    correct = list(kans_schot_of_wurging = 0.67, kans_andere_oorzaak = 0.33),
    wrong = list(kans_schot_of_wurging = 0.099, kans_andere_oorzaak = 0.33)
  ),
  list(
    number = "14",
    correct = list(p_exact_twee = 0.3087),
    wrong = list(p_exact_twee = 0.03087)
  )
)

numeric_routes <- 0L
for (spec in numeric_specs) {
  file <- find_answer(spec$number)
  loaded <- load_evaluator(file)
  check_correct(loaded$run(spec$correct), file)
  check_mapped_wrong(loaded$run(spec$wrong), file, "mapped numerical misconception")
  check_invalid(loaded$run(list()), file, "missing input")
  numeric_routes <- numeric_routes + 3L
}

cat(sprintf(
  paste0(
    "Chapter 4 probability verification passed: ",
    "%d MCQ routes and %d numerical routes across %d exercises.\n"
  ),
  mcq_routes,
  numeric_routes,
  length(mcq_specs) + length(numeric_specs)
))
