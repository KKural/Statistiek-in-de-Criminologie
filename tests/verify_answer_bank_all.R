if (.Platform$OS.type == "windows") {
  for (locale in c(".UTF-8", "English_United States.utf8", "C.UTF-8")) {
    selected <- suppressWarnings(Sys.setlocale("LC_CTYPE", locale))
    suppressWarnings(Sys.setlocale("LC_COLLATE", locale))
    if (!is.na(selected)) break
  }
}

root <- normalizePath(".", winslash = "/", mustWork = TRUE)
bank <- paste(readLines(file.path(root, "EXERCISE_ANSWER_BANK.md"), warn = FALSE,
                        encoding = "UTF-8"), collapse = "\n")
evaluators <- list.files(root, pattern = "^Answer\\.R$", recursive = TRUE,
                         full.names = TRUE)
if (!length(evaluators)) stop("No evaluators found.")

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
  if (length(capture$tests) != 1L) stop("Expected exactly one testcase: ", file)
  test <- capture$tests[[1L]]
  function(submission) {
    capture$messages <- character()
    generated <- test$generated(submission)
    score <- test$comparator(generated, test$expected)
    list(score = isTRUE(score), message = paste(capture$messages, collapse = "\n"))
  }
}

failures <- character()
validated <- 0L
for (file in evaluators) {
  exercise <- basename(dirname(dirname(file)))
  code_match <- regexec("^Oef\\s*-?\\s*([0-9]+(?:\\.[0-9]+)*)", exercise, perl = TRUE)
  code_parts <- regmatches(exercise, code_match)[[1L]]
  if (length(code_parts) != 2L) {
    failures <- c(failures, paste(file, "has no parseable exercise code"))
    next
  }
  code <- code_parts[[2L]]
  heading_pattern <- paste0("(?m)^### Oef - ", gsub(".", "\\.", code, fixed = TRUE),
                            "(?=[^0-9.]|$)")
  heading <- regexpr(heading_pattern, bank, perl = TRUE)[[1L]]
  if (heading < 0L) {
    failures <- c(failures, paste("Exercise", code, "has no answer-bank section"))
    next
  }
  remainder <- substr(bank, heading, nchar(bank))
  next_heading <- regexpr("\n### ", substr(remainder, 6L, nchar(remainder)), fixed = TRUE)[[1L]]
  section <- if (next_heading < 0L) remainder else substr(remainder, 1L, next_heading + 4L)
  correct_start <- regexpr("#### Correcte inzending", section, fixed = TRUE)[[1L]]
  if (correct_start < 0L) {
    failures <- c(failures, paste("Exercise", code, "has no correct-answer heading"))
    next
  }
  correct_section <- substr(section, correct_start, nchar(section))
  block_match <- regexec("(?s)```r\\s*\\n(.*?)\\n```", correct_section, perl = TRUE)
  block_parts <- regmatches(correct_section, block_match)[[1L]]
  if (length(block_parts) != 2L) {
    failures <- c(failures, paste("Exercise", code, "has no R answer block"))
    next
  }
  submission <- new.env(parent = baseenv())
  parsed <- tryCatch(parse(text = block_parts[[2L]]), error = identity)
  if (inherits(parsed, "error")) {
    failures <- c(failures, paste("Exercise", code, "answer does not parse:",
                                  conditionMessage(parsed)))
    next
  }
  evaluated <- tryCatch(eval(parsed, envir = submission), error = identity)
  if (inherits(evaluated, "error")) {
    failures <- c(failures, paste("Exercise", code, "answer does not evaluate:",
                                  conditionMessage(evaluated)))
    next
  }
  if (!length(ls(submission, all.names = TRUE)) && length(evaluated) == 1L &&
      (is.numeric(evaluated) || is.character(evaluated) || is.logical(evaluated))) {
    assign("evaluationResult", evaluated, envir = submission)
  }
  result <- tryCatch(load_evaluator(file)(submission), error = identity)
  if (inherits(result, "error")) {
    failures <- c(failures, paste("Exercise", code, "evaluator crashed:",
                                  conditionMessage(result)))
  } else if (!isTRUE(result$score)) {
    failures <- c(failures, paste("Exercise", code, "rejects its answer-bank solution"))
  } else {
    validated <- validated + 1L
  }
}

if (length(failures)) {
  cat("Answer-bank validation failed:\n")
  cat(sprintf("- %s\n", failures))
  quit(status = 1)
}

cat(sprintf("Validated answer-bank solutions against all %d canonical evaluators.\n",
            validated))
