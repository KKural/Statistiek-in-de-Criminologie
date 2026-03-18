context({
  testcase("Uitbijter herkennen via residu", {
    testEqual("",
      function(env) {
        results <- list()

        exp_uitbijter <- "B"

        check_letter <- function(varname, expected) {
          if (!exists(varname, envir = env))
            return(list(exists = FALSE, value = NA, value_char = NA, correct = FALSE, expected = expected))
          raw <- get(varname, envir = env)
          val <- trimws(toupper(as.character(raw)))
          ok  <- val == toupper(expected)
          list(exists = TRUE, value = raw, value_char = val, correct = ok, expected = expected)
        }

        results$uitbijter <- check_letter("uitbijter", exp_uitbijter)

        assign("detailed_results", results, envir = globalenv())
        all(sapply(results, function(r) isTRUE(r$correct)))
      },
      TRUE,
      comparator = function(generated, expected, ...) {
        results <- get("detailed_results", envir = globalenv())

        qnames <- c(uitbijter = "Punt met het grootste absolute residu")

        wrong_msg_uitbijter <- function(val) {
          v <- trimws(toupper(as.character(val)))
          if (v == "A") return(paste0(
            "**Waarom dit fout is:** Punt A heeft de hoogste Y-waarde (33), maar de regressielijn loopt op x = 3 al tot circa 34,1 — A ligt net **onder** de lijn (residu = −1,1).\n\n",
            "**Wat je miste:** Het grootste *absolute* residu vind je niet door de hoogste Y op te zoeken, maar door Y − Ŷ te berekenen voor elk punt.\n\n",
            "**Correctie:** Punt B (x=8, y=29) geeft Ŷ ≈ 24,2 → residu = +4,8 (grootst in absolute waarde)."
          ))
          if (v == "F") return(paste0(
            "**Waarom dit fout is:** Punt F staat ver rechts (x = 20) en valt op door zijn extreme ligging, maar de regressielijn daalt op x = 20 ook sterk (Ŷ ≈ 0,6) — residu slechts +2,4.\n\n",
            "**Wat je miste:** Een extreme X-waarde betekent niet automatisch een groot residu. Het residu hangt af van de verticale afstand tot de lijn.\n\n",
            "**Correctie:** Punt B (x=8, y=29) geeft Ŷ ≈ 24,2 → residu = +4,8 (grootst)."
          ))
          paste0(
            "**Je antwoord \"", v, "\" is niet correct.**\n\n",
            "**Stap-voor-stap controle:** Bereken residu = Y − Ŷ voor elk punt:\n",
            "- Punt A: 33 − 34,1 = −1,1\n",
            "- **Punt B: 29 − 24,2 = +4,8** ← grootste absolute waarde\n",
            "- Punt C: 16 − 18,3 = −2,3\n",
            "- Punt D: 10 − 12,4 = −2,4\n",
            "- Punt E: 5 − 6,5 = −1,5\n",
            "- Punt F: 3 − 0,6 = +2,4"
          )
        }

        feedback_text <- ""

        q <- "uitbijter"
        r <- results[[q]]
        if (!r$exists) {
          feedback_text <- paste0(feedback_text,
            "❌ **", qnames[[q]], "** — **Je hebt geen antwoord ingevoerd.**\n\n",
            "Wijs een letter toe aan `uitbijter`, bijv. `uitbijter <- \"A\"`\n\n"
          )
        } else if (r$correct) {
          feedback_text <- paste0(feedback_text,
            "✅ **", qnames[[q]], "** — **Correct! (\"", r$value, "\")**\n\n",
            "Punt B (x=8, y=29) heeft Ŷ ≈ 24,2 en residu = **+4,8** — het grootste absolute residu van alle zes punten.\n\n",
            "**Residutabel:**\n\n",
            "| Punt | x | y | Ŷ | Residu |\n",
            "|------|----|----|-------|--------|\n",
            "| A | 3 | 33 | ≈34,1 | −1,1 |\n",
            "| **B** | **8** | **29** | **≈24,2** | **+4,8** ← grootst |\n",
            "| C | 11 | 16 | ≈18,3 | −2,3 |\n",
            "| D | 14 | 10 | ≈12,4 | −2,4 |\n",
            "| E | 17 | 5 | ≈6,5 | −1,5 |\n",
            "| F | 20 | 3 | ≈0,6 | +2,4 |\n\n"
          )
        } else {
          msg <- wrong_msg_uitbijter(r$value)
          feedback_text <- paste0(feedback_text,
            "❌ **", qnames[[q]], "** — **Fout. Antwoord: `\"", r$value_char, "\"`. Correct: `\"B\"`**\n\n",
            msg, "\n\n"
          )
        }

        get_reporter()$add_message(feedback_text, type = "markdown")
        generated == expected
      }
    )
  })
})
