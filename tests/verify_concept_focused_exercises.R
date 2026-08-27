if (.Platform$OS.type == "windows") {
  for (locale in c(".UTF-8", "English_United States.utf8", "C.UTF-8")) {
    selected <- suppressWarnings(Sys.setlocale("LC_CTYPE", locale))
    suppressWarnings(Sys.setlocale("LC_COLLATE", locale))
    if (!is.na(selected)) break
  }
}

root <- normalizePath(".", winslash = "/", mustWork = TRUE)

cases <- list(
  "2.9" = list(meetniveau = 4),
  "2.10" = list(type_onderzoeksvraag = 3),
  "2.11" = list(meetniveau = 4),
  "2.12" = list(afhankelijke_variabele = 2),
  "2.13" = list(onderzoeksopzet = 2),
  "2.14" = list(variabelentype = 1),
  "2.15" = list(type_onderzoeksvraag = 1),
  "3.1" = list(frequentie_vaak = 3),
  "3.2.1" = list(cumulatieve_frequentie_neutraal = 20),
  "3.2.2" = list(relatieve_frequentie_tevreden = 0.30),
  "3.2.3" = list(cumulatieve_relatieve_frequentie_neutraal = 0.65),
  "3.2.4" = list(samenvattingspaar = 2),
  "3.3.3" = list(gemiddelde = 24),
  "3.3.10" = list(steekproefvariantie = 20),
  "3.4.4" = list(mediaan = 30),
  "3.5" = list(spreidingsmaat = 1),
  "4.7" = list(kans_a_of_b = 0.8),
  "5.1" = list(z_score = 2),
  "5.2" = list(kans_boven_grens = 0.16),
  "7.1.1" = list(percentage_crimineel_mannen = 25),
  "7.1.2" = list(oddsratio = 2, interpretatie = 1),
  "7.2" = list(conclusie = 1),
  "8.1.1" = list(kruisproductsom = 4),
  "8.1.2" = list(pearson_r = 1),
  "9.1" = list(verwachte_frequentie = 12),
  "9.2" = list(ondergrens = 26.08, bovengrens = 33.92),
  "9.3" = list(n_minimum = 43),
  "9.4.1" = list(groepsgemiddelde = 4),
  "9.4.2" = list(ss_binnen = 8),
  "9.4.3" = list(f_ratio = 4, significant = 1),
  "9.5" = list(antwoord = 3),
  "10.1.1" = list(gemiddelde_x = 2.5),
  "10.1.2" = list(scp_xy = -4),
  "10.1.3" = list(variantie_x = 6),
  "10.1.4" = list(r_xy = 0.5),
  "10.1.5" = list(r_xy_z = 0.504),
  "10.2" = list(relatietype = 1),
  "10.3" = list(relatietype = 3),
  "10.4" = list(conclusie = 3),
  "10.5" = list(antwoord = 2),
  "11.1.1" = list(afhankelijke_variabele = 3),
  "11.1.2" = list(scp_x1y = -4),
  "11.1.3" = list(voorspelling = 10),
  "11.1.4" = list(interpretatie_b1 = 2),
  "11.6.1" = list(interpretatie_b1 = 1),
  "11.6.2" = list(delta_r2 = 0.08, conclusie = 1),
  "11.7.1" = list(modelconclusie = 1),
  "11.7.2" = list(voorspelling = 16)
)

all_dirs <- list.dirs(root, recursive = TRUE, full.names = TRUE)

exercise_dir <- function(code) {
  pattern <- paste0("^Oef - ", gsub(".", "\\.", code, fixed = TRUE), "(?:[^0-9.]|$)")
  matches <- all_dirs[grepl(pattern, basename(all_dirs), perl = TRUE)]
  if (length(matches) != 1L) {
    stop(sprintf("Exercise %s: expected one directory, found %d.", code, length(matches)))
  }
  matches[[1L]]
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
      generated = generated, expected = expected, comparator = comparator
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
  if (length(capture$tests) != 1L) stop("Expected one testcase: ", file)
  test <- capture$tests[[1L]]
  function(values) {
    submission <- list2env(values, parent = emptyenv())
    capture$messages <- character()
    generated <- test$generated(submission)
    score <- test$comparator(generated, test$expected)
    list(score = isTRUE(score), message = paste(capture$messages, collapse = "\n"))
  }
}

expect_headings <- function(result, score, headings, label) {
  if (!identical(result$score, score)) {
    stop(sprintf("%s: expected score %s, received %s.", label, score, result$score))
  }
  for (heading in headings) {
    if (!grepl(heading, result$message, fixed = TRUE)) {
      stop(sprintf("%s: feedback misses %s.", label, heading))
    }
  }
}

assignment_names <- function(text) {
  lines <- strsplit(text, "\n", fixed = TRUE)[[1L]]
  matches <- regexec("^\\s*([A-Za-z.][A-Za-z0-9._]*)\\s*<-", lines, perl = TRUE)
  parts <- regmatches(lines, matches)
  vapply(parts[lengths(parts) > 0L], `[[`, character(1), 2L)
}

bank_files <- list.files(root, pattern = "^EXERCISE_ANSWER_BANK\\.md$", recursive = TRUE,
                         full.names = TRUE)
if (length(bank_files) != 14L) {
  stop(sprintf("Expected one answer bank in each of 14 chapter folders, found %d.",
               length(bank_files)))
}
bank <- paste(vapply(bank_files, function(file) {
  paste(readLines(file, warn = FALSE, encoding = "UTF-8"), collapse = "\n")
}, character(1)), collapse = "\n")

for (code in names(cases)) {
  values <- cases[[code]]
  dir <- exercise_dir(code)
  description_file <- file.path(dir, "description", "description.nl.md")
  boilerplate_file <- file.path(dir, "description", "boilerplate", "boilerplate")
  evaluator_file <- file.path(dir, "evaluation", "Answer.R")
  config_file <- file.path(dir, "config.json")
  required <- c(description_file, boilerplate_file, evaluator_file, config_file)
  if (!all(file.exists(required))) stop("Missing required file for exercise ", code)

  description <- paste(readLines(description_file, warn = FALSE, encoding = "UTF-8"),
                       collapse = "\n")
  boilerplate <- paste(readLines(boilerplate_file, warn = FALSE, encoding = "UTF-8"),
                       collapse = "\n")
  evaluator <- paste(readLines(evaluator_file, warn = FALSE, encoding = "UTF-8"),
                     collapse = "\n")
  config <- paste(readLines(config_file, warn = FALSE, encoding = "UTF-8"), collapse = "\n")

  if (!grepl("**Leerdoel:**", description, fixed = TRUE)) {
    stop("Exercise ", code, " has no explicit learning objective.")
  }
  if (grepl("observaties\\s*[0-9]+\\s*[-–]\\s*[0-9]+", description,
            ignore.case = TRUE, perl = TRUE)) {
    stop("Exercise ", code, " still processes an arbitrary observation range.")
  }
  if (grepl("\\?\\?\\?|\\bNA\\b|\\bNULL\\b", boilerplate, perl = TRUE)) {
    stop("Exercise ", code, " uses a banned placeholder.")
  }
  fields <- assignment_names(boilerplate)
  if (!identical(sort(fields), sort(names(values)))) {
    stop("Exercise ", code, " boilerplate/evaluator field mismatch.")
  }
  if (length(fields) > 2L) stop("Exercise ", code, " asks for more than two answers.")
  if (!grepl('"token"\\s*:\\s*"[^"]+"', config, perl = TRUE)) {
    stop("Exercise ", code, " has no Dodona token.")
  }

  run <- load_evaluator(evaluator_file)
  expect_headings(
    run(values), TRUE,
    c("**Bevestiging:**", "**Denkregel:**", "**Transferstap:**"),
    paste(code, "canonical answer")
  )
  expect_headings(
    run(list()), FALSE,
    c("**Waarschijnlijke redenering:**", "**Waarom dit niet klopt:**",
      "**Denkregel:**", "**Volgende stap:**"),
    paste(code, "missing answer")
  )

  heading_pattern <- paste0("(?m)^### Oef - ", gsub(".", "\\.", code, fixed = TRUE),
                            "(?=[^0-9.]|$)")
  heading <- regexpr(heading_pattern, bank, perl = TRUE)[[1L]]
  if (heading < 0L) stop("Answer bank has no section for exercise ", code)
  remainder <- substr(bank, heading, nchar(bank))
  next_heading <- regexpr("\n### ", substr(remainder, 6L, nchar(remainder)), fixed = TRUE)[[1L]]
  section <- if (next_heading < 0L) remainder else substr(remainder, 1L, next_heading + 4L)
  if (!grepl("#### Correcte inzending", section, fixed = TRUE)) {
    stop("Answer bank has no canonical answer for exercise ", code)
  }
  for (field in names(values)) {
    expected_line <- paste0(
      "(?m)^", field, "\\s*<-\\s*", gsub("\\.", "\\\\.", as.character(values[[field]])),
      "\\s*$"
    )
    if (!grepl(expected_line, section, perl = TRUE)) {
      stop("Answer bank mismatch for ", code, ": ", field)
    }
  }

  branch_lines <- grep('^\\s*if .*likely <- "', strsplit(evaluator, "\n", fixed = TRUE)[[1L]],
                       value = TRUE, perl = TRUE)
  branch_text <- sub('^.*likely <- "([^"]+)".*$', '\\1', branch_lines, perl = TRUE)
  for (text in branch_text) {
    if (!grepl(text, section, fixed = TRUE)) {
      stop("Answer bank misses a misconception for exercise ", code, ": ", text)
    }
  }
}

cat(sprintf(
  "Validated %d concept-focused exercises, canonical answers, missing-input routes, and answer-bank misconceptions.\n",
  length(cases)
))
