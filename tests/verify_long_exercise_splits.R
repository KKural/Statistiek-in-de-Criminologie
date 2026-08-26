if (.Platform$OS.type == "windows") {
  for (locale in c(".UTF-8", "English_United States.utf8", "C.UTF-8")) {
    selected <- suppressWarnings(Sys.setlocale("LC_CTYPE", locale))
    suppressWarnings(Sys.setlocale("LC_COLLATE", locale))
    if (!is.na(selected)) break
  }
}

root <- normalizePath(".", winslash = "/", mustWork = TRUE)

chapter_dir <- function(pattern) {
  matches <- list.dirs(root, recursive = FALSE, full.names = TRUE)
  matches <- matches[grepl(pattern, basename(matches))]
  if (length(matches) != 1L) {
    stop(sprintf("Expected exactly one chapter matching %s, found %d.", pattern, length(matches)))
  }
  matches[[1L]]
}

chapters <- list(
  ch9 = chapter_dir("^Hoofdstuk_9_"),
  ch10 = chapter_dir("^Hoofdstuk_10_"),
  ch11 = chapter_dir("^Hoofdstuk_11_")
)

part_path <- function(chapter, folder) file.path(chapters[[chapter]], folder)

cases <- list(
  "9.4.1" = list(
    dir = part_path("ch9", "Oef - 9.4"),
    values = list(gemiddelde_groot = 3190, gemiddelde_middel = 1580,
                  gemiddelde_ruraal = 484, grand_mean = 1751.33),
    choices = character()
  ),
  "9.4.2" = list(
    dir = part_path("ch9", "Oef - 9.4.2 Deel 2 - binnengroepsvariatie"),
    values = list(SS_within_groot = 1514000, SS_within_middel = 321000,
                  SS_within_ruraal = 52040, SS_within = 1887040,
                  df_within = 27, MS_within = 69890.37),
    choices = character()
  ),
  "9.4.3" = list(
    dir = part_path("ch9", "Oef - 9.4.3 Deel 3 - tussengroepsvariatie en F-toets"),
    values = list(SS_between = 37052506.67, df_between = 2,
                  MS_between = 18526253.33, F_ratio = 265.08,
                  eta_kwadraat = 0.9515, significant_anova = 1),
    choices = "significant_anova"
  ),
  "10.1.1" = list(
    dir = part_path("ch10", "Oef - 10.1"),
    values = list(X_bar = 1.8571, Y_bar = 2.1429, Z_bar = 15.5714),
    choices = character()
  ),
  "10.1.2" = list(
    dir = part_path("ch10", "Oef - 10.1.2 Deel 2 - somkwadraten en kruisproductsommen"),
    values = list(SS_X = 28.8571, SS_Y = 10.8571, SS_Z = 13.7143,
                  SCP_XY = 8.1429, SCP_XZ = 8.5714, SCP_YZ = 6.4286),
    choices = character()
  ),
  "10.1.3" = list(
    dir = part_path("ch10", "Oef - 10.1.3 Deel 3 - varianties en standaarddeviaties"),
    values = list(Var_X = 4.8095, Var_Y = 1.8095, Var_Z = 2.2857,
                  SD_X = 2.1931, SD_Y = 1.3452, SD_Z = 1.5119),
    choices = character()
  ),
  "10.1.4" = list(
    dir = part_path("ch10", "Oef - 10.1.4 Deel 4 - covarianties en bivariate correlaties"),
    values = list(Cov_XY = 1.3571, Cov_XZ = 1.4286, Cov_YZ = 1.0714,
                  r_XY = 0.4600, r_XZ = 0.4309, r_YZ = 0.5268),
    choices = character()
  ),
  "10.1.5" = list(
    dir = part_path("ch10", "Oef - 10.1.5 Deel 5 - partiële correlatie en interpretatie"),
    values = list(r_XY_teller = 0.2330, r_XY_noemer = 0.7670,
                  r_XY_Z = 0.3038, conclusie_type = 2),
    choices = "conclusie_type"
  ),
  "11.1.1" = list(
    dir = part_path("ch11", "Oef - 11.1"),
    values = list(afhankelijke_variabele = 3, gemiddelde_x1 = 3.00,
                  gemiddelde_x2 = 7.00, gemiddelde_y = 18.00),
    choices = "afhankelijke_variabele"
  ),
  "11.1.2" = list(
    dir = part_path("ch11", "Oef - 11.1.2 Deel 2 - somkwadraten en kruisproducten"),
    values = list(SSx1 = 10, SSx2 = 30, SSy = 80,
                  SSx1x2 = 0, SSx1y = -22, SSx2y = 30),
    choices = character()
  ),
  "11.1.3" = list(
    dir = part_path("ch11", "Oef - 11.1.3 Deel 3 - regressiemodel en voorspelling"),
    values = list(determinant_D = 300, b1 = -2.20, b2 = 1.00,
                  intercept_a = 17.60, voorspelling = 19.00,
                  R_kwadraat = 0.9800),
    choices = character()
  ),
  "11.1.4" = list(
    dir = part_path("ch11", "Oef - 11.1.4 Deel 4 - interpretatie van regressiegewichten"),
    values = list(richting_b1 = 2, sterkste_predictor = 1),
    choices = c("richting_b1", "sterkste_predictor")
  ),
  "11.6.1" = list(
    dir = part_path("ch11", "Oef - 11.6"),
    values = as.list(c(vraag1 = 2, vraag2 = 3, vraag3 = 2, vraag4 = 2,
                       vraag5 = 2, vraag6 = 1, vraag7 = 1)),
    choices = paste0("vraag", 1:7)
  ),
  "11.6.2" = list(
    dir = part_path("ch11", "Oef - 11.6.2 Deel 2 - modelvergelijking en interpretatie"),
    values = as.list(c(vraag8 = 1, vraag9 = 1, vraag10 = 1, vraag11 = 2,
                       vraag12 = 2, vraag13 = 3, vraag14 = 3)),
    choices = paste0("vraag", 8:14)
  ),
  "11.7.1" = list(
    dir = part_path("ch11", "Oef - 11.7"),
    values = as.list(c(vraag1 = 2, vraag2 = 4, vraag3 = 3,
                       vraag4 = 4, vraag5 = 3)),
    choices = paste0("vraag", 1:5)
  ),
  "11.7.2" = list(
    dir = part_path("ch11", "Oef - 11.7.2 Deel 2 - regressieparameters en voorspelling"),
    values = as.list(c(vraag6 = 3, vraag7 = 1, vraag8 = 2,
                       vraag9 = 3, vraag10 = 3, vraag11 = 4)),
    choices = paste0("vraag", 6:11)
  )
)

choice_limits <- list(
  "9.4.3" = list(significant_anova = 1:2),
  "11.1.1" = list(afhankelijke_variabele = 1:3),
  "11.1.4" = list(richting_b1 = 1:2, sterkste_predictor = 1:2)
)

count_family <- function(chapter, base_number) {
  folders <- list.dirs(chapters[[chapter]], recursive = FALSE, full.names = FALSE)
  pattern <- paste0("^Oef - ", gsub(".", "\\.", base_number, fixed = TRUE), "($|\\.)")
  sum(grepl(pattern, folders))
}

expected_counts <- c("9.4" = 3L, "10.1" = 5L, "11.1" = 4L, "11.6" = 2L, "11.7" = 2L)
actual_counts <- c(
  "9.4" = count_family("ch9", "9.4"),
  "10.1" = count_family("ch10", "10.1"),
  "11.1" = count_family("ch11", "11.1"),
  "11.6" = count_family("ch11", "11.6"),
  "11.7" = count_family("ch11", "11.7")
)
if (!identical(actual_counts, expected_counts)) {
  stop(sprintf(
    "Split counts differ. Expected %s; received %s.",
    paste(names(expected_counts), expected_counts, sep = "=", collapse = ", "),
    paste(names(actual_counts), actual_counts, sep = "=", collapse = ", ")
  ))
}

originals <- c(
  file.path(chapters$ch9, "Oef - 9.4"),
  file.path(chapters$ch10, "Oef - 10.1"),
  file.path(chapters$ch11, "Oef - 11.1"),
  file.path(chapters$ch11, "Oef - 11.6"),
  file.path(chapters$ch11, "Oef - 11.7")
)
for (dir in originals) {
  config_text <- paste(readLines(file.path(dir, "config.json"), warn = FALSE, encoding = "UTF-8"),
                       collapse = "\n")
  if (!grepl('"internals"', config_text, fixed = TRUE) ||
      !grepl('"token"', config_text, fixed = TRUE)) {
    stop("Original part lost its Dodona token: ", dir)
  }
}
for (case in cases[!vapply(cases, function(x) x$dir %in% originals, logical(1))]) {
  config_text <- paste(readLines(file.path(case$dir, "config.json"), warn = FALSE,
                                encoding = "UTF-8"), collapse = "\n")
  if (grepl('"internals"', config_text, fixed = TRUE)) {
    stop("A new split part contains internals instead of awaiting Dodona bookkeeping: ",
         case$dir)
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
  function(values) {
    submission <- list2env(values, parent = emptyenv())
    capture$messages <- character()
    generated <- test$generated(submission)
    score <- test$comparator(generated, test$expected)
    list(score = isTRUE(score), message = paste(capture$messages, collapse = "\n"))
  }
}

expect_route <- function(result, expected_score, headings, label) {
  if (!identical(result$score, expected_score)) {
    stop(sprintf("%s: expected score %s, received %s.", label, expected_score, result$score))
  }
  for (heading in headings) {
    if (!grepl(heading, result$message, fixed = TRUE)) {
      stop(sprintf("%s: feedback misses %s.\n%s", label, heading, result$message))
    }
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

is_zero_placeholder <- function(assignment) {
  identical(assignment$rhs, "0") ||
    grepl("^rep\\(\\s*0\\s*,\\s*[0-9]+\\s*\\)$", assignment$rhs, perl = TRUE) ||
    grepl("^c\\(\\s*0(?:\\s*,\\s*0)+\\s*\\)$", assignment$rhs, perl = TRUE)
}

for (id in names(cases)) {
  case <- cases[[id]]
  required <- c(
    file.path(case$dir, "config.json"),
    file.path(case$dir, "description", "description.nl.md"),
    file.path(case$dir, "description", "boilerplate", "boilerplate"),
    file.path(case$dir, "evaluation", "Answer.R")
  )
  if (!all(file.exists(required))) {
    stop("Missing split files for ", id)
  }

  description <- paste(readLines(required[[2L]], warn = FALSE, encoding = "UTF-8"),
                       collapse = "\n")
  boilerplate <- paste(readLines(required[[3L]], warn = FALSE, encoding = "UTF-8"),
                       collapse = "\n")
  if (grepl("**Hint:**", description, fixed = TRUE) ||
      grepl("### Hint", description, fixed = TRUE)) {
    stop("Visible hint remains in split description ", id)
  }
  if (grepl("???", boilerplate, fixed = TRUE)) {
    stop("Syntax-invalid placeholder remains in ", id)
  }
  if (grepl("(?<![A-Za-z0-9_])(?:NA(?:_[A-Za-z]+_)?|NULL)(?![A-Za-z0-9_])",
            boilerplate, perl = TRUE)) {
    stop("NA/NULL learner placeholder remains in ", id)
  }
  boilerplate_lines <- strsplit(boilerplate, "\n", fixed = TRUE)[[1L]]
  assignments <- Filter(Negate(is.null), lapply(boilerplate_lines, parse_assignment_line))
  if (any(vapply(assignments, is_zero_placeholder, logical(1)))) {
    stop("Zero-valued learner placeholder remains in ", id)
  }
  slots <- Filter(Negate(is.null), lapply(assignments, slot_from_assignment))
  field_names <- if (length(slots)) vapply(slots, `[[`, character(1), "name") else character()
  if (anyDuplicated(field_names)) stop(id, " defines a learner field more than once.")
  submitted_value_count <- sum(vapply(slots, `[[`, integer(1), "count"))
  if (submitted_value_count > 8L) {
    stop(id, " contains more than eight submitted values.")
  }
  if (!setequal(field_names, names(case$values))) {
    stop(sprintf("%s boilerplate/evaluator field mismatch.", id))
  }
  scalar_layout <- vapply(slots, function(slot) identical(slot$kind, "blank"), logical(1))
  if (!all(scalar_layout)) {
    stop(id, " must use a blank RHS after <- for every numeric/choice field.")
  }

  run <- load_evaluator(required[[4L]])
  correct <- run(case$values)
  expect_route(
    correct, TRUE,
    c("**Bevestiging:**", "**Denkregel:**", "**Transferstap:**"),
    paste(id, "correct")
  )

  missing <- run(list())
  expect_route(
    missing, FALSE,
    c("**Waarschijnlijke redenering:**", "**Waarom dit niet klopt:**",
      "**Denkregel:**", "**Volgende stap:**"),
    paste(id, "missing")
  )

  for (field in names(case$values)) {
    wrong_values <- case$values
    if (field %in% case$choices) {
      wrong_values[[field]] <- if (wrong_values[[field]] == 4) 1 else wrong_values[[field]] + 1
    } else {
      wrong_values[[field]] <- wrong_values[[field]] +
        if (abs(wrong_values[[field]]) >= 100) 1 else 0.01
    }
    wrong <- run(wrong_values)
    expect_route(
      wrong, FALSE,
      c("**Waarschijnlijke redenering:**", "**Waarom dit niet klopt:**",
        "**Denkregel:**", "**Volgende stap:**"),
      paste(id, field, "wrong")
    )
    if (grepl("Correct antwoord", wrong$message, ignore.case = TRUE) ||
        grepl("juiste antwoord", wrong$message, ignore.case = TRUE) ||
        grepl("correcte optie", wrong$message, ignore.case = TRUE) ||
        (field %in% case$choices && grepl(
          paste0("optie\\s+", case$values[[field]], "(?:\\D|$)"),
          wrong$message,
          ignore.case = TRUE,
          perl = TRUE
        ))) {
      stop(id, " wrong-route feedback reveals the answer for ", field, ".")
    }
  }

  first <- names(case$values)[[1L]]
  for (invalid in list("abc", c(1, 2), Inf)) {
    invalid_values <- case$values
    invalid_values[[first]] <- invalid
    invalid_result <- run(invalid_values)
    expect_route(
      invalid_result, FALSE,
      c("geen geldige eindige enkelvoudige waarde", "**Volgende stap:**"),
      paste(id, first, "invalid scalar")
    )
  }

  limits <- choice_limits[[id]]
  if (!is.null(limits)) {
    for (field in names(limits)) {
      invalid_choice <- case$values
      invalid_choice[[field]] <- max(limits[[field]]) + 1L
      invalid_result <- run(invalid_choice)
      expect_route(
        invalid_result, FALSE,
        c("buiten de antwoordopties", "**Volgende stap:**"),
        paste(id, field, "invalid choice range")
      )
    }
  }
}

cat(sprintf(
  "Validated %d split activities: files, tokens, blank learner slots, <=8 submitted values, and all correct/missing/wrong/invalid routes.\n",
  length(cases)
))
