if (.Platform$OS.type == "windows") {
  for (locale in c(".UTF-8", "English_United States.utf8", "C.UTF-8")) {
    selected <- suppressWarnings(Sys.setlocale("LC_CTYPE", locale))
    suppressWarnings(Sys.setlocale("LC_COLLATE", locale))
    if (!is.na(selected)) break
  }
}

root <- normalizePath(".", winslash = "/", mustWork = TRUE)
all_dirs <- list.dirs(root, recursive = TRUE, full.names = TRUE)
bank_files <- list.files(root, pattern = "^EXERCISE_ANSWER_BANK\\.md$", recursive = TRUE,
                         full.names = TRUE)
answer_bank <- paste(vapply(bank_files, function(file) {
  paste(readLines(file, warn = FALSE, encoding = "UTF-8"), collapse = "\n")
}, character(1)), collapse = "\n")

find_exercise <- function(code) {
  pattern <- paste0("^Oef\\s*-?\\s*", gsub(".", "\\.", code, fixed = TRUE),
                    "(?:[^0-9.]|$)")
  all_dirs[grepl(pattern, basename(all_dirs), perl = TRUE)]
}

grouped_counts <- c(
  "1.1" = 5, "1.2" = 5,
  "2.1" = 5, "2.9" = 3, "2.10" = 4,
  "3.2.1" = 4,
  "3.3.1" = 3, "3.3.3" = 5, "3.3.5" = 3, "3.3.7" = 3, "3.3.9" = 3,
  "3.4.1" = 5, "3.4.4" = 4,
  "4.1" = 3, "4.4" = 3, "4.9" = 4,
  "5.1" = 3, "5.4" = 3,
  "6.1" = 4, "6.5" = 3,
  "7.1.1" = 4, "7.3" = 4,
  "8.1.1" = 4, "8.3" = 3,
  "9.4.1" = 5,
  "10.1.1" = 5, "10.2" = 4,
  "11.1.1" = 4, "11.3" = 3, "11.6.1" = 5,
  "12.1" = 3, "12.4" = 3, "12.7" = 3, "12.11" = 4
)

absorbed <- c(
  "1.3", "1.4", "1.5", "1.6", "1.7", "1.8", "1.9", "1.10",
  "2.2", "2.3", "2.4", "2.5", "2.11", "2.12", "2.13", "2.14", "2.15",
  "3.2.2", "3.2.3", "3.2.4",
  "3.3.2", "3.3.4", "3.3.6", "3.3.8", "3.3.10",
  "3.4.2", "3.4.3", "3.4.5",
  "4.2", "4.3", "4.7", "4.10", "4.12",
  "5.2", "5.3", "5.5",
  "6.2", "6.3", "6.4", "6.6", "6.7",
  "7.1.2", "7.2", "7.4", "7.5", "7.6",
  "8.1.2", "8.4", "8.5",
  "9.4.2", "9.4.3", "9.5",
  "10.1.2", "10.1.3", "10.1.4", "10.1.5", "10.3", "10.4", "10.5",
  "11.1.2", "11.1.3", "11.1.4", "11.4", "11.5", "11.6.2", "11.7.1", "11.7.2",
  "12.2", "12.3", "12.5", "12.6", "12.8", "12.9", "12.12", "12.13", "12.14"
)

assignment_names <- function(text) {
  lines <- strsplit(text, "\n", fixed = TRUE)[[1L]]
  matches <- regexec("^\\s*([A-Za-z.][A-Za-z0-9._]*)\\s*<-", lines, perl = TRUE)
  parts <- regmatches(lines, matches)
  vapply(parts[lengths(parts) > 0L], `[[`, character(1), 2L)
}

failures <- character()
tokens <- character()
for (code in names(grouped_counts)) {
  dirs <- find_exercise(code)
  if (length(dirs) != 1L) {
    failures <- c(failures, sprintf("%s: expected one retained folder, found %d", code,
                                    length(dirs)))
    next
  }
  dir <- dirs[[1L]]
  paths <- c(
    description = file.path(dir, "description", "description.nl.md"),
    boilerplate = file.path(dir, "description", "boilerplate", "boilerplate"),
    evaluator = file.path(dir, "evaluation", "Answer.R"),
    config = file.path(dir, "config.json")
  )
  if (!all(file.exists(paths))) {
    failures <- c(failures, paste(code, "is missing grouped exercise files"))
    next
  }
  description <- paste(readLines(paths[["description"]], warn = FALSE, encoding = "UTF-8"),
                       collapse = "\n")
  boilerplate <- paste(readLines(paths[["boilerplate"]], warn = FALSE, encoding = "UTF-8"),
                       collapse = "\n")
  evaluator <- paste(readLines(paths[["evaluator"]], warn = FALSE, encoding = "UTF-8"),
                     collapse = "\n")
  config <- paste(readLines(paths[["config"]], warn = FALSE, encoding = "UTF-8"),
                  collapse = "\n")
  fields <- assignment_names(boilerplate)
  if (length(fields) != grouped_counts[[code]]) {
    failures <- c(failures, sprintf("%s: expected %d answer fields, found %d", code,
                                    grouped_counts[[code]], length(fields)))
  }
  if (!grepl("**Leerdoel:**", description, fixed = TRUE)) {
    failures <- c(failures, paste(code, "has no explicit grouped learning objective"))
  }
  if (grepl("\\?\\?\\?|\\bNA\\b|\\bNULL\\b", boilerplate, perl = TRUE)) {
    failures <- c(failures, paste(code, "uses a banned boilerplate placeholder"))
  }
  if (!grepl("expected_values\\s*<-\\s*c\\(", evaluator, perl = TRUE)) {
    failures <- c(failures, paste(code, "has no named canonical expected_values vector"))
  }
  relative_dir <- substring(normalizePath(dir, winslash = "/", mustWork = TRUE),
                            nchar(root) + 2L)
  source_marker <- paste0("Bronmap: `", relative_dir, "`")
  marker <- regexpr(source_marker, answer_bank, fixed = TRUE)[[1L]]
  if (marker < 0L) {
    failures <- c(failures, paste(code, "has no chapter answer-bank section"))
  } else {
    remainder <- substr(answer_bank, marker, nchar(answer_bank))
    next_heading <- regexpr("\n### ", remainder, fixed = TRUE)[[1L]]
    section <- if (next_heading < 0L) remainder else substr(remainder, 1L, next_heading - 1L)
    missing_misconceptions <- fields[!vapply(
      fields,
      function(field) grepl(paste0("Foute testinvoer voor `", field, "`"), section,
                             fixed = TRUE),
      logical(1)
    )]
    if (length(missing_misconceptions)) {
      failures <- c(failures, paste(code, "has no answer-bank misconception for",
                                    paste(missing_misconceptions, collapse = ", ")))
    }
  }
  token_match <- regexec('"token"\\s*:\\s*"([^"]+)"', config, perl = TRUE)
  token_parts <- regmatches(config, token_match)[[1L]]
  if (length(token_parts) != 2L) {
    failures <- c(failures, paste(code, "has no retained Dodona token"))
  } else {
    tokens <- c(tokens, token_parts[[2L]])
  }
}

for (code in absorbed) {
  dirs <- find_exercise(code)
  graded <- dirs[file.exists(file.path(dirs, "evaluation", "Answer.R"))]
  if (length(graded)) failures <- c(failures, paste(code, "still exists as a graded folder"))
}

if (anyDuplicated(tokens)) failures <- c(failures, "retained grouped activities reuse a Dodona token")
evaluator_count <- length(list.files(root, pattern = "^Answer\\.R$", recursive = TRUE,
                                     full.names = TRUE))
if (evaluator_count != 50L) {
  failures <- c(failures, sprintf("expected 50 graded exercises after grouping, found %d",
                                  evaluator_count))
}

boilerplate_files <- list.files(root, pattern = "^boilerplate$", recursive = TRUE,
                                full.names = TRUE)
bad_placeholders <- boilerplate_files[vapply(boilerplate_files, function(file) {
  text <- paste(readLines(file, warn = FALSE, encoding = "UTF-8"), collapse = "\n")
  grepl("\\?\\?\\?|\\bNA(?:_[A-Za-z]+_)?\\b|\\bNULL\\b", text, perl = TRUE)
}, logical(1))]
if (length(bad_placeholders)) {
  failures <- c(failures, paste("banned placeholders remain in",
                                paste(basename(dirname(dirname(bad_placeholders))),
                                      collapse = ", ")))
}

if (length(failures)) {
  cat("Logical-grouping verification failed:\n")
  cat(sprintf("- %s\n", failures))
  quit(status = 1)
}
cat(sprintf("Validated %d grouped activities and retirement of %d absorbed exercises.\n",
            length(grouped_counts), length(absorbed)))
