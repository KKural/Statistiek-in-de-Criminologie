files <- list.files(
  ".",
  pattern = "^Answer\\.R$",
  recursive = TRUE,
  full.names = TRUE
)

if (!length(files)) {
  stop("No canonical Answer.R evaluators were found.")
}

read_evaluator <- function(file) {
  paste(readLines(file, warn = FALSE, encoding = "UTF-8"), collapse = "\n")
}

sources <- setNames(lapply(files, read_evaluator), files)
placeholder <- vapply(
  sources,
  grepl,
  logical(1),
  pattern = "Empty evaluation - to be implemented",
  fixed = TRUE
)
implemented <- files[!placeholder]

parse_failures <- unlist(lapply(files, function(file) {
  tryCatch(
    {
      parse(file)
      NULL
    },
    error = function(error) sprintf("%s: %s", file, conditionMessage(error))
  )
}))

requirements <- list(
  likely_reasoning = "\\*\\*Waarschijnlijke (redenering|denkroute):\\*\\*",
  why_wrong = "\\*\\*Waarom dit (niet klopt|niet werkt):\\*\\*",
  thinking_rule = "\\*\\*Denkregel:\\*\\*",
  next_step = "\\*\\*Volgende stap:\\*\\*",
  transfer = "\\*\\*Transfer(stap)?:\\*\\*"
)

banned_outcome_insensitive_text <- c(
  "Strengthen your reasoning",
  "formulate the decisive characteristic",
  "formuleer die eigenschap in je eigen woorden",
  "pas haar toe op een nieuw criminologisch voorbeeld",
  "pas dezelfde controles toe op een nieuw criminologisch voorbeeld",
  "formuleer één uitspraak die wel en één die niet uit de maat volgt",
  "**Mogelijke denkroute:**",
  "controleer vraagtype, variabelenrol en meetniveau als afzonderlijke beslissingen"
)
confirmation_pattern <- paste(
  "\\*\\*(Bevestiging|Waarom dit klopt):\\*\\*",
  "|✅|Juist|Correct",
  sep = ""
)

coverage_failures <- character()
for (file in implemented) {
  source <- sources[[file]]
  missing <- names(requirements)[
    !vapply(requirements, grepl, logical(1), x = source, perl = TRUE)
  ]
  if (!grepl(confirmation_pattern, source, perl = TRUE)) {
    missing <- c(missing, "confirmation")
  }
  banned <- banned_outcome_insensitive_text[
    vapply(
      banned_outcome_insensitive_text,
      grepl,
      logical(1),
      x = source,
      fixed = TRUE
    )
  ]
  if (length(missing)) {
    coverage_failures <- c(
      coverage_failures,
      sprintf("%s: missing %s", file, paste(missing, collapse = ", "))
    )
  }
  if (length(banned)) {
    coverage_failures <- c(
      coverage_failures,
      sprintf(
        "%s: contains outcome-insensitive text: %s",
        file,
        paste(banned, collapse = " | ")
      )
    )
  }
}

cat(sprintf(
  "Canonical evaluators: %d total, %d implemented, %d placeholders.\n",
  length(files),
  length(implemented),
  sum(placeholder)
))

if (sum(placeholder)) {
  cat("Skipped placeholders without authored question/answer content:\n")
  cat(sprintf("- %s\n", files[placeholder]))
}

failures <- c(parse_failures, coverage_failures)
if (length(failures)) {
  cat("\nFeedback-contract verification failed:\n")
  cat(sprintf("- %s\n", failures))
  quit(status = 1)
}

cat("All implemented evaluators parse and expose the complete feedback contract.\n")
