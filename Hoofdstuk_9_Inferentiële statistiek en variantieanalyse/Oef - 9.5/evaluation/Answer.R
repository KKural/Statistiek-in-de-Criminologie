context({
  testcase(
    "Controlevragen - Inferentiële statistiek en ANOVA",
    {
      testEqual(
        "",
        function(env) {
          results <- list()

          exp_answers <- list(
            vraag1 = 2,  # gemiddelde verschilt tussen 2+ groepen
            vraag2 = 4,  # F-waarde
            vraag3 = 2,  # F > 1
            vraag4 = 3,  # p-waarde kleiner
            vraag5 = 1,  # model verklaart meer dan nulmodel
            vraag6 = 3,  # model verklaart significant meer
            vraag7 = 2   # t-toets voor individuele coeff
          )

          parse_num <- function(val) {
            if (is.character(val)) {
              val <- trimws(val)
              if (grepl("^[A-Da-d]$", val)) {
                return(match(toupper(val), c("A", "B", "C", "D")))
              }
              val <- gsub(",", ".", val, fixed = TRUE)
            }
            suppressWarnings(as.numeric(val))
          }

          check_mc <- function(varname, expected) {
            if (!exists(varname, envir = env)) {
              return(list(exists = FALSE, value = NA, correct = FALSE, expected = expected))
            }
            raw <- get(varname, envir = env)
            num <- parse_num(raw)
            ok  <- !is.na(num) && abs(num - expected) < 0.5
            list(exists = TRUE, value = raw, value_num = num, correct = ok, expected = expected)
          }

          for (q in names(exp_answers)) {
            results[[q]] <- check_mc(q, exp_answers[[q]])
          }

          assign("detailed_results", results, envir = globalenv())
          all(sapply(results, function(x) x$correct))
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("detailed_results", envir = globalenv())

          qnames <- c(
            vraag1 = "Vraag 1: Hypothesen bij ANOVA",
            vraag2 = "Vraag 2: Toetsingsgrootheid ANOVA",
            vraag3 = "Vraag 3: F-waarde en tussengroepsvariantie",
            vraag4 = "Vraag 4: p-waarde naarmate F groter is",
            vraag5 = "Vraag 5: Doel F-toets bij regressie",
            vraag6 = "Vraag 6: Betekenis p<0.05 bij F-toets regressie",
            vraag7 = "Vraag 7: Andere toets bij regressie"
          )

          lines <- character(0)
          score <- 0
          total <- length(qnames)

          for (key in names(qnames)) {
            r     <- results[[key]]
            label <- qnames[[key]]
            if (!r$exists) {
              lines <- c(lines, sprintf("❌ **%s**: variabele `%s` niet gevonden.", label, key))
            } else if (!r$correct) {
              lines <- c(lines, sprintf("❌ **%s**: jouw antwoord = %s | juiste antwoord = %d",
                label, as.character(r$value), as.integer(r$expected)))
            } else {
              lines <- c(lines, sprintf("✅ **%s**: correct (antwoord %d)",
                label, as.integer(r$expected)))
              score <- score + 1
            }
          }

          lines <- c(lines, "",
            sprintf("**Score: %d / %d**", score, total)
          )

          msg <- paste(lines, collapse = "\n")
          if (score == total) correct(msg) else wrong(msg)
        }
      )
    }
  )
})