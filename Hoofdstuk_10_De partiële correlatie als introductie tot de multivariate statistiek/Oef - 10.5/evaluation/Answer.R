context({
  testcase(
    "Controlevragen - Partiële correlatie en multivariate statistiek",
    {
      testEqual(
        "",
        function(env) {
          results <- list()

          exp_answers <- list(
            vraag1 = 2,  # correlatie X-Y na uitschakelen effect van Z op beide
            vraag2 = 3,  # hoogstwaarschijnlijk een schijnverband veroorzaakt door Z
            vraag3 = 1,  # ONJUIST: pc kan nooit groter zijn -- suppressoreffect toont van wel
            vraag4 = 3,  # reëel verband dat nauwelijks beïnvloed wordt door leeftijd
            vraag5 = 2,  # r_XY verminderd met het product van r_XZ en r_YZ
            vraag6 = 3,  # sterker of tegenovergesteld teken dan r_XY
            vraag7 = 2   # principe van controleren voor derde variabelen
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
            vraag1 = "Vraag 1: Definitie van partiële correlatie",
            vraag2 = "Vraag 2: r_XY=0.70 maar r_XY.Z=0.02 — wat betekent dit?",
            vraag3 = "Vraag 3: Welke bewering is ONJUIST?",
            vraag4 = "Vraag 4: Buurtoverlast–angst na controle voor leeftijd",
            vraag5 = "Vraag 5: Wat staat in de teller van de formule?",
            vraag6 = "Vraag 6: Wanneer is Z een suppressorvariabele?",
            vraag7 = "Vraag 7: Partiële correlatie als introductie tot multivariate statistiek"
          )

          hints <- list(
            vraag1 = "Antwoord: 2  [correlatie X-Y nadat het effect van Z op beide variabelen is uitgeschakeld]",
            vraag2 = "Antwoord: 3  [r_XY.Z≈0 = hoogstwaarschijnlijk een schijnverband veroorzaakt door Z]",
            vraag3 = "Antwoord: 1  [ONJUIST: pc kan NOOIT groter zijn dan r_XY — suppressoreffect toont van wel]",
            vraag4 = "Antwoord: 3  [r blijft vergelijkbaar → reëel verband dat nauwelijks beïnvloed wordt door leeftijd]",
            vraag5 = "Antwoord: 2  [teller = r_XY verminderd met het product van r_XZ en r_YZ]",
            vraag6 = "Antwoord: 3  [Z is suppressor als r_XY.Z sterker of tegenovergesteld teken heeft dan r_XY]",
            vraag7 = "Antwoord: 2  [partiële correlatie leert het principe van controleren voor derde variabelen]"
          )

          lines <- character(0)
          score <- 0
          total <- length(qnames)

          for (key in names(qnames)) {
            r     <- results[[key]]
            label <- qnames[[key]]
            if (!r$exists) {
              lines <- c(lines, sprintf("❌ **%s** (`%s`): niet ingevuld\\\n  → %s\n", label, key, hints[[key]]))
            } else if (!r$correct) {
              lines <- c(lines, sprintf("❌ **%s**: jouw antwoord = %s\\\n  → %s\n", label, as.character(r$value), hints[[key]]))
            } else {
              lines <- c(lines, sprintf("✅ **%s**: correct (antwoord %d)\n",
                label, as.integer(r$expected)))
              score <- score + 1
            }
          }

          lines <- c(lines,
            sprintf("---\n\n**Score: %d / %d**", score, total)
          )

          msg <- paste(lines, collapse = "\n")
          get_reporter()$add_message(msg, type = "markdown")
          generated == expected
        }
      )
    }
  )
})