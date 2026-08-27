if (!requireNamespace("jsonlite", quietly = TRUE)) {
  stop("Package 'jsonlite' is required for the numbering check.")
}

chapter_dirs <- list.dirs(".", recursive = FALSE, full.names = TRUE)
chapter_match <- regexec("^\\./Hoofdstuk_([0-9]+)_", chapter_dirs)
chapter_parts <- regmatches(chapter_dirs, chapter_match)
chapter_number <- vapply(
  chapter_parts,
  function(parts) if (length(parts) > 1L) as.integer(parts[[2L]]) else NA_integer_,
  integer(1)
)
selected <- !is.na(chapter_number) & chapter_number >= 1L & chapter_number <= 12L
chapter_dirs <- chapter_dirs[selected]
chapter_number <- chapter_number[selected]
ordering <- order(chapter_number)
chapter_dirs <- chapter_dirs[ordering]
chapter_number <- chapter_number[ordering]

extract_number <- function(title, chapter) {
  if (length(title) != 1L || is.na(title) || !nzchar(title)) return(NA_integer_)
  match <- regexec(
    sprintf("(?:^|[^0-9])%d\\.([0-9]+)(?:[^0-9]|$)", chapter),
    title,
    perl = TRUE
  )
  parts <- regmatches(title, match)[[1L]]
  if (length(parts) < 2L) NA_integer_ else as.integer(parts[[2L]])
}

failures <- character()
for (index in seq_along(chapter_dirs)) {
  chapter_dir <- chapter_dirs[[index]]
  chapter <- chapter_number[[index]]
  activity_dirs <- list.dirs(chapter_dir, recursive = FALSE, full.names = TRUE)
  config_files <- file.path(activity_dirs, "config.json")
  config_files <- config_files[file.exists(config_files)]

  titles <- lapply(config_files, function(file) {
    config <- jsonlite::fromJSON(file, simplifyVector = FALSE)
    config$description$names
  })

  for (language in c("nl", "en")) {
    language_titles <- vapply(titles, function(names) {
      value <- names[[language]]
      if (is.null(value)) NA_character_ else value
    }, character(1))
    numbers <- vapply(language_titles, extract_number, integer(1), chapter = chapter)
    expected <- 0L:(length(config_files) - 1L)

    if (anyNA(numbers)) {
      failures <- c(
        failures,
        sprintf(
          "Chapter %d (%s) has a missing or unnumbered title in: %s",
          chapter,
          language,
          paste(config_files[is.na(numbers)], collapse = ", ")
        )
      )
    } else if (!identical(unname(sort(numbers)), expected)) {
      failures <- c(
        failures,
        sprintf(
          "Chapter %d (%s) uses %s; expected one each of %s.",
          chapter,
          language,
          paste(sort(numbers), collapse = ", "),
          paste(expected, collapse = ", ")
        )
      )
    }
  }
}

if (length(failures)) {
  cat("Continuous activity-numbering verification failed:\n")
  cat(sprintf("- %s\n", failures))
  quit(status = 1)
}

cat("All current activities in Chapters 1-12 use continuous Dutch and English numbering.\n")
