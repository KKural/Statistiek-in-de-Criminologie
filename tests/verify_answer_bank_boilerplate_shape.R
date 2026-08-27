root <- normalizePath(".", winslash = "/", mustWork = TRUE)
bank_files <- list.files(root, pattern = "^EXERCISE_ANSWER_BANK\\.md$", recursive = TRUE,
                         full.names = TRUE)
bank <- paste(vapply(bank_files, function(file) {
  paste(readLines(file, warn = FALSE, encoding = "UTF-8"), collapse = "\n")
}, character(1)), collapse = "\n")

section_for <- function(code) {
  pattern <- paste0("(?m)^### Oef - ", gsub(".", "\\.", code, fixed = TRUE),
                    "(?=[^0-9.]|$)")
  start <- regexpr(pattern, bank, perl = TRUE)[[1L]]
  if (start < 0L) stop("No answer-bank section for ", code)
  rest <- substr(bank, start, nchar(bank))
  next_start <- regexpr("\n### ", substr(rest, 6L, nchar(rest)), fixed = TRUE)[[1L]]
  if (next_start < 0L) rest else substr(rest, 1L, next_start + 4L)
}

correct_block <- function(section) {
  start <- regexpr("#### Correcte inzending", section, fixed = TRUE)[[1L]]
  if (start < 0L) return(NA_character_)
  rest <- substr(section, start, nchar(section))
  match <- regexec("(?s)```r\\s*\\n(.*?)\\n```", rest, perl = TRUE)
  parts <- regmatches(rest, match)[[1L]]
  if (length(parts) == 2L) parts[[2L]] else NA_character_
}

normalize_shape <- function(text) {
  lines <- strsplit(gsub("\\r\\n?", "\n", text), "\n", fixed = TRUE)[[1L]]
  lines <- sub("[[:space:]]+$", "", lines)
  while (length(lines) && !nzchar(lines[[length(lines)]])) lines <- head(lines, -1L)
  assignment <- "^(\\s*[A-Za-z.][A-Za-z0-9._]*\\s*<-)"
  lines <- ifelse(grepl(assignment, lines, perl = TRUE),
                  sub(paste0(assignment, ".*$"), "\\1 <INGEVULD>", lines, perl = TRUE),
                  lines)
  paste(lines, collapse = "\n")
}

evaluators <- list.files(root, pattern = "^Answer\\.R$", recursive = TRUE,
                         full.names = TRUE)
failures <- character()
checked <- 0L
for (evaluator in evaluators) {
  dir <- dirname(dirname(evaluator))
  boilerplate_file <- file.path(dir, "description", "boilerplate", "boilerplate")
  if (!file.exists(boilerplate_file)) next
  folder <- basename(dir)
  match <- regexec("^Oef\\s*-?\\s*([0-9]+(?:\\.[0-9]+)*)", folder, perl = TRUE)
  parts <- regmatches(folder, match)[[1L]]
  if (length(parts) != 2L) next
  code <- parts[[2L]]
  boilerplate <- paste(readLines(boilerplate_file, warn = FALSE, encoding = "UTF-8"),
                       collapse = "\n")
  boilerplate <- sub("^\ufeff", "", boilerplate)
  answer <- correct_block(section_for(code))
  has_assignment <- grepl("(?m)^\\s*[A-Za-z.][A-Za-z0-9._]*\\s*<-", boilerplate,
                          perl = TRUE)
  answer_lines <- if (is.na(answer)) character() else
    trimws(strsplit(answer, "\n", fixed = TRUE)[[1L]])
  selected_lines <- answer_lines[nzchar(answer_lines) & !startsWith(answer_lines, "#")]
  is_choice_copy <- !has_assignment && !is.na(answer) &&
    grepl(trimws(boilerplate), answer, fixed = TRUE) && length(selected_lines) == 1L
  if (is.na(answer)) {
    failures <- c(failures, paste(code, "has no copy-paste R block"))
  } else if (has_assignment &&
             !identical(normalize_shape(boilerplate), normalize_shape(answer))) {
    failures <- c(failures, paste(code, "answer block is not a filled boilerplate copy"))
  } else if (!has_assignment && !is_choice_copy) {
    failures <- c(failures, paste(code, "choice answer does not extend its boilerplate"))
  }
  checked <- checked + 1L
}

if (length(failures)) {
  cat(sprintf("Boilerplate-shape audit found %d mismatches across %d fill exercises:\n",
              length(failures), checked))
  cat(sprintf("- %s\n", failures))
  quit(status = 1)
}
cat(sprintf("All %d fill exercises use filled copies of their current boilerplates.\n", checked))
