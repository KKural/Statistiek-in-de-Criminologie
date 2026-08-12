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
          if (length(v) != 1 || is.na(v) || !(v %in% LETTERS[1:6])) return(paste0(
            "**Controleer je invoer:** de invoer is niet aan één van de aangeboden puntletters A–F te koppelen.\n\n",
            "**Waarom dit niet klopt:** alleen een bestaande puntletter kan worden beoordeeld als kandidaat voor het grootste absolute residu.\n\n",
            "**Denkregel:** controleer eerst het antwoordformaat en vergelijk daarna voor A–F de waarden van |Y − Ŷ|.\n\n",
            "**Volgende stap:** voer exact één letter A, B, C, D, E of F in en maak vervolgens de residutabel af."
          ))
          if (v == "A") return(paste0(
            "**Waarschijnlijke redenering:** je koos mogelijk A omdat dit punt de hoogste Y-waarde (33) heeft.\n\n",
            "**Waarom dit niet klopt:** de regressielijn ligt bij x = 3 rond 34,1, zodat A slechts −1,1 van de lijn afligt.\n\n",
            "**Denkregel:** vergelijk absolute verticale afstanden |Y − Ŷ|; een hoge Y of extreme X is op zichzelf geen groot residu.\n\n",
            "**Volgende stap:** bereken voor A en B eerst Ŷ en |Y − Ŷ|. Voor B is dat |29 − 24,2| = 4,8, de grootste afstand."
          ))
          if (v == "F") return(paste0(
            "**Waarschijnlijke redenering:** je koos mogelijk F omdat zijn X-waarde het meest extreem is.\n\n",
            "**Waarom dit niet klopt:** de lijn voorspelt bij x = 20 al Ŷ ≈ 0,6, zodat het residu van F slechts +2,4 is.\n\n",
            "**Denkregel:** leverage (extreme X) en residu (verticale Y-afstand) zijn verschillende kenmerken.\n\n",
            "**Volgende stap:** vergelijk |3 − 0,6| voor F met |29 − 24,2| voor B; B heeft het grootste absolute residu."
          ))
          paste0(
            "**Waarschijnlijke redenering:** je keuze is niet eenduidig aan één veelvoorkomende denkstap te koppelen.\n\n",
            "**Waarom dit niet klopt:** de gekozen observatie heeft niet de grootste waarde van |Y − Ŷ|.\n\n",
            "**Denkregel:** bereken voor elk punt het getekende residu Y − Ŷ en vergelijk daarna de absolute waarden.\n\n",
            "**Volgende stap:** werk de residutabel af:\n",
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
            "**Denkregel:** de evaluator heeft één puntletter nodig om de verticale afstanden te vergelijken.\n\n",
            "**Volgende stap:** wijs een letter toe aan `uitbijter`, bijvoorbeeld `uitbijter <- \"B\"`.\n\n"
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
            "| F | 20 | 3 | ≈0,6 | +2,4 |\n\n",
            "**Bevestiging:** punt B is correct omdat |e| = 4,8 de grootste gecontroleerde verticale afstand is.\n\n",
            "**Denkregel:** een uitbijter volgens residu maximaliseert |Y − Ŷ|, niet X of Y afzonderlijk.\n\n",
            "**Transferstap:** gebruik bij een nieuwe scatterplot dezelfde residutabel en controleer leverage apart.\n\n"
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
