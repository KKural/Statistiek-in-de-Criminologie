root <- normalizePath(".", winslash = "/", mustWork = TRUE)
chapter <- file.path(root, "Hoofdstuk_3_De univariate beschrijvende statistiek")

exercise_dir <- function(number, suffix = "") {
  folders <- list.dirs(chapter, recursive = FALSE, full.names = TRUE)
  marker <- paste0("3.", number, suffix)
  pattern <- sprintf("^Oef - %s ", gsub("\\.", "\\\\.", marker))
  matches <- folders[grepl(pattern, basename(folders))]
  if (length(matches) != 1L) {
    stop(sprintf("Exercise %s: expected one folder, found %d.", marker, length(matches)))
  }
  matches[[1L]]
}

read_text <- function(path) paste(readLines(path, warn = FALSE, encoding = "UTF-8"), collapse = "\n")

assert_absent <- function(text, pattern, label) {
  if (grepl(pattern, text, fixed = TRUE)) {
    stop(sprintf("%s still contains prohibited visible text: %s", label, pattern))
  }
}

parse_assignment_line <- function(line) {
  match <- regexec(
    "^\\s*([A-Za-z.][A-Za-z0-9._]*)\\s*<-\\s*(.*)$",
    line,
    perl = TRUE
  )
  parts <- regmatches(line, match)[[1L]]
  if (!length(parts)) return(NULL)

  raw_rhs <- parts[[3L]]
  comment_start <- regexpr("#", raw_rhs, fixed = TRUE)[[1L]]
  rhs <- if (comment_start > 0L) substr(raw_rhs, 1L, comment_start - 1L) else raw_rhs
  list(name = parts[[2L]], rhs = trimws(rhs))
}

blank_vector_size <- function(rhs) {
  if (!grepl("^c\\(.*\\)$", rhs, perl = TRUE)) return(NA_integer_)
  inside <- sub("^c\\((.*)\\)$", "\\1", rhs, perl = TRUE)
  if (nzchar(gsub("[[:space:],]", "", inside, perl = TRUE))) return(NA_integer_)
  commas <- gregexpr(",", inside, fixed = TRUE)[[1L]]
  comma_count <- if (length(commas) == 1L && commas[[1L]] == -1L) 0L else length(commas)
  if (comma_count == 0L) return(NA_integer_)
  comma_count + 1L
}

slot_from_assignment <- function(assignment) {
  if (!nzchar(assignment$rhs)) {
    return(list(name = assignment$name, kind = "blank", count = 1L))
  }
  if (identical(assignment$rhs, "\"\"")) {
    return(list(name = assignment$name, kind = "string", count = 1L))
  }
  vector_size <- blank_vector_size(assignment$rhs)
  if (!is.na(vector_size)) {
    return(list(name = assignment$name, kind = "vector", count = vector_size))
  }
  NULL
}

has_string_entry_note <- function(text) {
  grepl(
    "(?im)^\\s*#.*(?:tekst|aanhaling|quote|string|woord|letters)",
    text,
    perl = TRUE
  )
}

is_zero_placeholder <- function(assignment) {
  identical(assignment$rhs, "0") ||
    grepl("^rep\\(\\s*0\\s*,\\s*[0-9]+\\s*\\)$", assignment$rhs, perl = TRUE) ||
    grepl("^c\\(\\s*0(?:\\s*,\\s*0)+\\s*\\)$", assignment$rhs, perl = TRUE)
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

expect_score <- function(run, values, expected, label, message_pattern = NULL) {
  actual <- run(values)
  if (!identical(actual, expected)) {
    stop(sprintf("%s: expected score %s, received %s.", label, expected, actual))
  }
  if (!is.null(message_pattern)) {
    messages <- paste(attr(run, "messages")(), collapse = "\n")
    if (!grepl(message_pattern, messages, fixed = TRUE)) {
      stop(sprintf("%s: feedback did not contain `%s`.", label, message_pattern))
    }
  }
}

expect_feedback_absent <- function(run, patterns, label) {
  messages <- paste(attr(run, "messages")(), collapse = "\n")
  disclosed <- patterns[vapply(patterns, grepl, logical(1), x = messages, fixed = TRUE)]
  if (length(disclosed)) {
    stop(sprintf("%s: wrong-answer feedback disclosed `%s`.", label, disclosed[[1L]]))
  }
}

part_dirs <- c(
  exercise_dir("2"), exercise_dir("2", "b"), exercise_dir("2", "c"), exercise_dir("2", "d"),
  exercise_dir("3"), exercise_dir("3", "a2"), exercise_dir("3", "b"), exercise_dir("3", "c"),
  exercise_dir("3", "d"), exercise_dir("3", "d2"), exercise_dir("3", "d3"),
  exercise_dir("3", "d4"), exercise_dir("3", "d5"), exercise_dir("3", "e"),
  exercise_dir("4"), exercise_dir("4", "a2"), exercise_dir("4", "a3"), exercise_dir("4", "b"),
  exercise_dir("4", "c"), exercise_dir("4", "c2"), exercise_dir("4", "c3"), exercise_dir("4", "d")
)

for (path in part_dirs) {
  boilerplate_file <- file.path(path, "description", "boilerplate", "boilerplate")
  boilerplate <- read_text(boilerplate_file)
  assert_absent(boilerplate, "???", basename(path))
  if (grepl("(?<![A-Za-z0-9_])(?:NA(?:_[A-Za-z]+_)?|NULL)(?![A-Za-z0-9_])",
            boilerplate, perl = TRUE)) {
    stop(sprintf("%s still contains an NA/NULL learner placeholder.", basename(path)))
  }
  boilerplate_lines <- strsplit(boilerplate, "\n", fixed = TRUE)[[1L]]
  assignments <- Filter(Negate(is.null), lapply(boilerplate_lines, parse_assignment_line))
  if (any(vapply(assignments, is_zero_placeholder, logical(1)))) {
    stop(sprintf("%s still uses 0 as a learner placeholder.", basename(path)))
  }
  slots <- Filter(Negate(is.null), lapply(assignments, slot_from_assignment))
  if (!length(slots)) {
    stop(sprintf("%s contains no textual learner slots.", basename(path)))
  }
  answer_vars <- vapply(slots, `[[`, character(1), "name")
  if (anyDuplicated(answer_vars)) {
    stop(sprintf("%s defines a learner field more than once.", basename(path)))
  }
  string_slots <- vapply(slots, function(slot) identical(slot$kind, "string"), logical(1))
  if (any(string_slots) && !has_string_entry_note(boilerplate)) {
    stop(sprintf("%s uses an empty string without a text/quotation note.", basename(path)))
  }
  submitted_values <- sum(vapply(slots, `[[`, integer(1), "count"))
  if (submitted_values > 8L) {
    stop(sprintf("%s requires %d submitted values; maximum is 8.", basename(path), submitted_values))
  }
}

# Existing neighbouring exercises retain their answer-hygiene protections.
visible_31 <- paste(
  read_text(file.path(exercise_dir("1"), "description", "description.nl.md")),
  read_text(file.path(exercise_dir("1"), "description", "boilerplate", "boilerplate"))
)
assert_absent(visible_31, "Bijvoorbeeld voor \"Zelden\"", "Exercise 3.1")
assert_absent(visible_31, "bijvoorbeeld 3.23", "Exercise 3.1")

# Exercise 3.2: four independent parts.
run_32a <- load_evaluator(file.path(exercise_dir("2"), "evaluation", "Answer.R"))
correct_32a <- list(
  cumulatieve_absolute_frequenties = c(33, 117, 219, 282, 330),
  totaal_n = 330
)
expect_score(run_32a, correct_32a, TRUE, "3.2a correct", "Bevestiging")
wrong_32a <- correct_32a
wrong_32a$cumulatieve_absolute_frequenties <- c(33, 84, 102, 63, 48)
expect_score(run_32a, wrong_32a, FALSE, "3.2a non-cumulative route", "gewone absolute frequenties")

run_32b <- load_evaluator(file.path(exercise_dir("2", "b"), "evaluation", "Answer.R"))
correct_32b <- list(relatieve_frequenties = c(0.1000, 0.2545, 0.3091, 0.1909, 0.1455))
expect_score(run_32b, correct_32b, TRUE, "3.2b correct", "Bevestiging")
expect_score(
  run_32b,
  list(relatieve_frequenties = 100 * correct_32b$relatieve_frequenties),
  FALSE,
  "3.2b percentage-scale route",
  "percentages ingevuld"
)

run_32c <- load_evaluator(file.path(exercise_dir("2", "c"), "evaluation", "Answer.R"))
correct_32c <- list(cumulatieve_relatieve_frequenties = c(0.1000, 0.3545, 0.6636, 0.8545, 1.0000))
expect_score(run_32c, correct_32c, TRUE, "3.2c correct", "Bevestiging")
expect_score(
  run_32c,
  list(cumulatieve_relatieve_frequenties = correct_32b$relatieve_frequenties),
  FALSE,
  "3.2c non-cumulative route",
  "gewone relatieve frequenties"
)

run_32d <- load_evaluator(file.path(exercise_dir("2", "d"), "evaluation", "Answer.R"))
correct_32d <- list(
  meetniveau = "ordinaal",
  modus = "noch tevreden, noch ontevreden",
  mediaan = "noch tevreden, noch ontevreden",
  meest_relevante_centraliteit = "mediaan",
  q1 = "ontevreden",
  q3 = "tevreden",
  variatiebreedte = "zeer ontevreden tot zeer tevreden",
  ika = "ontevreden tot tevreden"
)
expect_score(run_32d, correct_32d, TRUE, "3.2d correct", "Bevestiging")
wrong_32d <- correct_32d
wrong_32d$meetniveau <- "nominaal"
expect_score(run_32d, wrong_32d, FALSE, "3.2d nominal route", "natuurlijke rangorde")

# Exercise 3.3: ten parts, ratio terminology and Tukey hinges.
all_33_text <- paste(vapply(part_dirs[5:14], function(path) {
  read_text(file.path(path, "description", "description.nl.md"))
}, character(1)), collapse = "\n")
if (!grepl("ratio", all_33_text, ignore.case = TRUE)) stop("Exercise 3.3 must identify work hours as ratio data.")
if (!grepl("Tukey-hinges", all_33_text, fixed = TRUE)) stop("Exercise 3.3 must state the quartile convention.")

hours <- c(24, 36, 35, 28, 24, 28, 24, 36, 32, 36, 40, 38, 36, 34, 40, 36, 32, 36, 40, 36)

run_33a <- load_evaluator(file.path(exercise_dir("3"), "evaluation", "Answer.R"))
correct_33a <- list(
  frequenties = c(3, 2, 2, 1),
  percentages = c(15, 10, 10, 5)
)
expect_score(run_33a, correct_33a, TRUE, "3.3a correct", "Bevestiging")
wrong_33a <- correct_33a
wrong_33a$frequenties[1] <- 2
expect_score(run_33a, wrong_33a, FALSE, "3.3a frequency route", "telling voor 24 uur")

run_33a2 <- load_evaluator(file.path(exercise_dir("3", "a2"), "evaluation", "Answer.R"))
correct_33a2 <- list(
  frequenties = c(1, 7, 1, 3),
  percentages = c(5, 35, 5, 15)
)
expect_score(run_33a2, correct_33a2, TRUE, "3.3a2 correct", "Bevestiging")
wrong_33a2 <- correct_33a2
wrong_33a2$percentages <- wrong_33a2$percentages / 100
expect_score(run_33a2, wrong_33a2, FALSE, "3.3a2 proportion route", "proporties tussen 0 en 1")

run_33b <- load_evaluator(file.path(exercise_dir("3", "b"), "evaluation", "Answer.R"))
correct_33b <- list(
  modus = 36, mediaan = 36, gemiddelde = 33.55,
  variatiebreedte = 16, q1 = 30, q3 = 36, ika = 6
)
expect_score(run_33b, correct_33b, TRUE, "3.3b correct", "Bevestiging")
wrong_33b <- correct_33b
wrong_33b$q1 <- 31
expect_score(run_33b, wrong_33b, FALSE, "3.3b R-default quartile route", "standaardinterpolatie")
expect_feedback_absent(run_33b, c("bedraagt hier 30", "volgt 30", "juiste antwoord"), "3.3b leak guard")

run_33c <- load_evaluator(file.path(exercise_dir("3", "c"), "evaluation", "Answer.R"))
correct_33c <- list(
  meest_relevante_centraliteit = "gemiddelde",
  meest_relevante_spreiding = "standaardafwijking",
  reden = "gebruikt alle informatie"
)
expect_score(run_33c, correct_33c, TRUE, "3.3c correct", "Bevestiging")
wrong_33c <- list(
  meest_relevante_centraliteit = "mediaan",
  meest_relevante_spreiding = "interkwartielafstand",
  reden = "robuust voor uitbijters"
)
expect_score(run_33c, wrong_33c, FALSE, "3.3c robust-route mismatch", "problematische uitbijter")

run_33d <- load_evaluator(file.path(exercise_dir("3", "d"), "evaluation", "Answer.R"))
correct_33d <- list(
  afwijkingen = round(hours[1:4] - mean(hours), 4),
  gekwadrateerde_afwijkingen = round((hours[1:4] - mean(hours))^2, 4)
)
expect_score(run_33d, correct_33d, TRUE, "3.3d correct", "Bevestiging")
wrong_33d <- correct_33d
wrong_33d$afwijkingen <- abs(wrong_33d$afwijkingen)
expect_score(run_33d, wrong_33d, FALSE, "3.3d absolute-deviation route", "absolute afstanden")
expect_feedback_absent(run_33d, c("-9.5500", "91.2025", "juiste antwoord"), "3.3d leak guard")

deviation_parts_33 <- list(
  d2 = 5:8,
  d3 = 9:12,
  d4 = 13:16,
  d5 = 17:20
)
for (suffix in names(deviation_parts_33)) {
  positions <- deviation_parts_33[[suffix]]
  run <- load_evaluator(file.path(exercise_dir("3", suffix), "evaluation", "Answer.R"))
  correct <- list(
    afwijkingen = round(hours[positions] - mean(hours), 4),
    gekwadrateerde_afwijkingen = round((hours[positions] - mean(hours))^2, 4)
  )
  expect_score(run, correct, TRUE, paste0("3.3", suffix, " correct"), "Bevestiging")
}

run_33d3_wrong <- load_evaluator(file.path(exercise_dir("3", "d3"), "evaluation", "Answer.R"))
wrong_33d3 <- list(
  afwijkingen = round(hours[9:12] - mean(hours), 4),
  gekwadrateerde_afwijkingen = round((hours[9:12] - mean(hours))^2, 4)
)
wrong_33d3$gekwadrateerde_afwijkingen[1] <- -wrong_33d3$gekwadrateerde_afwijkingen[1]
expect_score(run_33d3_wrong, wrong_33d3, FALSE, "3.3d3 negative-square route", "nooit negatief")
expect_feedback_absent(run_33d3_wrong, c("2.4025", "juiste kwadraat"), "3.3d3 leak guard")

run_33e <- load_evaluator(file.path(exercise_dir("3", "e"), "evaluation", "Answer.R"))
correct_33e <- list(
  sum_of_squares = 528.95,
  variantie = 27.8395,
  standaardafwijking = 5.2763,
  variatiecoefficient = 0.1573
)
expect_score(run_33e, correct_33e, TRUE, "3.3e correct", "Bevestiging")
wrong_33e <- correct_33e
wrong_33e$variantie <- 26.4475
expect_score(run_33e, wrong_33e, FALSE, "3.3e population variance route", "populatievariantie")
expect_feedback_absent(run_33e, c("27.8395", "gevraagde eindantwoord"), "3.3e leak guard")

# Exercise 3.4: eight parts and unrounded intermediate calculations.
durations <- c(240, 144, 143, 72, 30, 26, 2, 150, 14, 150, 1657)

run_34a <- load_evaluator(file.path(exercise_dir("4"), "evaluation", "Answer.R"))
correct_34a <- list(
  frequenties = c(1, 1, 1, 1),
  percentages = c(9.09, 9.09, 9.09, 9.09)
)
expect_score(run_34a, correct_34a, TRUE, "3.4a correct", "Bevestiging")
wrong_34a <- correct_34a
wrong_34a$frequenties[1] <- 2
expect_score(run_34a, wrong_34a, FALSE, "3.4a frequency route", "telling van 2 dagen")

run_34a2 <- load_evaluator(file.path(exercise_dir("4", "a2"), "evaluation", "Answer.R"))
correct_34a2 <- list(
  frequenties = c(1, 1, 1),
  percentages = c(9.09, 9.09, 9.09)
)
expect_score(run_34a2, correct_34a2, TRUE, "3.4a2 correct", "Bevestiging")

run_34a3 <- load_evaluator(file.path(exercise_dir("4", "a3"), "evaluation", "Answer.R"))
correct_34a3 <- list(
  frequenties = c(2, 1, 1),
  percentages = c(18.18, 9.09, 9.09)
)
expect_score(run_34a3, correct_34a3, TRUE, "3.4a3 correct", "Bevestiging")
wrong_34a3 <- correct_34a3
wrong_34a3$frequenties[1] <- 1
expect_score(run_34a3, wrong_34a3, FALSE, "3.4a3 duplicate-value route", "telling van 150 dagen")

run_34b <- load_evaluator(file.path(exercise_dir("4", "b"), "evaluation", "Answer.R"))
correct_34b <- list(
  gemiddelde = 238.91, mediaan = 143, modus = 150,
  variatiebreedte = 1655, q1 = 26, q3 = 150, ika = 124
)
expect_score(run_34b, correct_34b, TRUE, "3.4b correct", "Bevestiging")
wrong_34b <- correct_34b
wrong_34b$gemiddelde <- 143
expect_score(run_34b, wrong_34b, FALSE, "3.4b median-as-mean route", "mediaan ingevuld")
expect_feedback_absent(run_34b, c("238.91", "gevraagde eindantwoord"), "3.4b leak guard")

run_34c <- load_evaluator(file.path(exercise_dir("4", "c"), "evaluation", "Answer.R"))
exact_mean_34 <- sum(durations) / length(durations)
correct_34c <- list(
  afwijkingen = round(durations[1:4] - exact_mean_34, 2),
  gekwadrateerde_afwijkingen = round((durations[1:4] - exact_mean_34)^2, 2)
)
expect_score(run_34c, correct_34c, TRUE, "3.4c correct", "Bevestiging")
wrong_34c <- correct_34c
wrong_34c$gekwadrateerde_afwijkingen <- round(wrong_34c$afwijkingen^2, 2)
expect_score(run_34c, wrong_34c, FALSE, "3.4c rounded-deviation square route", "afgeronde afwijkingen gekwadrateerd")
expect_feedback_absent(run_34c, c("1.19", "9007.74", "juiste kwadraat"), "3.4c leak guard")

run_34c2 <- load_evaluator(file.path(exercise_dir("4", "c2"), "evaluation", "Answer.R"))
correct_34c2 <- list(
  afwijkingen = round(durations[5:8] - exact_mean_34, 2),
  gekwadrateerde_afwijkingen = round((durations[5:8] - exact_mean_34)^2, 2)
)
expect_score(run_34c2, correct_34c2, TRUE, "3.4c2 correct", "Bevestiging")

run_34c3 <- load_evaluator(file.path(exercise_dir("4", "c3"), "evaluation", "Answer.R"))
correct_34c3 <- list(
  afwijkingen = round(durations[9:11] - exact_mean_34, 2),
  gekwadrateerde_afwijkingen = round((durations[9:11] - exact_mean_34)^2, 2)
)
expect_score(run_34c3, correct_34c3, TRUE, "3.4c3 correct", "Bevestiging")
wrong_34c3 <- correct_34c3
wrong_34c3$gekwadrateerde_afwijkingen[3] <- -wrong_34c3$gekwadrateerde_afwijkingen[3]
expect_score(run_34c3, wrong_34c3, FALSE, "3.4c3 negative-square route", "nooit negatief")

run_34d <- load_evaluator(file.path(exercise_dir("4", "d"), "evaluation", "Answer.R"))
correct_34d <- list(
  sum_of_squares = 2268540.91,
  variantie = 226854.09,
  standaardafwijking = 476.29
)
expect_score(run_34d, correct_34d, TRUE, "3.4d correct", "Bevestiging")
wrong_34d <- correct_34d
wrong_34d$sum_of_squares <- 2268540.92
expect_score(run_34d, wrong_34d, FALSE, "3.4d summed-rounded-squares route", "weergavetabel")
expect_feedback_absent(run_34d, c("2268540.91", "gevraagde eindantwoord"), "3.4d leak guard")

# Exercise 3.5 remains a sample-variance regression guard.
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
expect_score(run_35, correct_35, TRUE, "3.5 correct")
population_35 <- correct_35
population_35$variantie_incidenten <- 6.67
population_35$standaarddeviatie_incidenten <- 2.58
expect_score(run_35, population_35, FALSE, "3.5 population denominator")

cat("Chapter 3 split-activity and answer-hygiene verification passed.\n")
