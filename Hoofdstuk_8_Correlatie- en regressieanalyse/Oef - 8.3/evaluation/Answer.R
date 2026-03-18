context({
  testcase(
    "Uitbijter herkennen via residu",
    {
      testEqual(
        "",
        function(env) {

          # Correct answer: B(6,31) has residual ~+9.1 vs the regression line.
          # A looks high in Y but resid ~+1.7; F looks extreme in X but resid ~+1.8.
          exp_uitbijter <- "B"

          if (!exists("uitbijter", envir = env)) {
            get_reporter()$add_message(
              paste0("## Oef - 8.5: Uitbijter herkennen via residu\n\n",
                     "❌ **Je hebt geen antwoord ingevoerd.**\n\n",
                     "Wijs een letter toe aan de variabele `uitbijter`, bijv. `uitbijter <- \"A\"`"),
              type = "markdown")
            return(FALSE)
          }

          val <- trimws(toupper(as.character(get("uitbijter", envir = env))))
          correct_ans <- toupper(exp_uitbijter)
          ok <- (val == correct_ans)

          if (ok) {
            msg <- paste0(
              "## Oef - 8.5: Uitbijter herkennen via residu\n\n",
              "✅ **Correct! Punt B heeft het grootste residu.**\n\n",
              "**Uitleg:** Het residu van elk punt is Y − Ŷ.\n\n",
              "| Punt | x | y | Ŷ | Residu |\n",
              "|------|---|---|------|--------|\n",
              "| A | 3 | 29 | ≈27,3 | +1,7 |\n",
              "| **B** | **6** | **31** | **≈21,9** | **+9,1** ← grootst |\n",
              "| C | 8 | 18 | ≈18,3 | −0,3 |\n",
              "| D | 10 | 12 | ≈14,8 | −2,8 |\n",
              "| E | 13 | 9 | ≈9,4 | −0,4 |\n",
              "| F | 17 | 4 | ≈2,2 | +1,8 |\n\n",
              "Punt B heeft een residu van bijna **+9**, ruim groter dan alle andere punten."
            )
          } else {
            msg <- paste0(
              "## Oef - 8.5: Uitbijter herkennen via residu\n\n",
              "❌ **Fout. Je antwoord: `\"", val, "\"`. Correct antwoord: `\"B\"`**\n\n",
              "**Uitleg:** Bereken voor elk punt het residu = Y − Ŷ:\n\n",
              "| Punt | x | y | Ŷ | Residu |\n",
              "|------|---|---|------|--------|\n",
              "| A | 3 | 29 | ≈27,3 | +1,7 |\n",
              "| **B** | **6** | **31** | **≈21,9** | **+9,1** ← grootst! |\n",
              "| C | 8 | 18 | ≈18,3 | −0,3 |\n",
              "| D | 10 | 12 | ≈14,8 | −2,8 |\n",
              "| E | 13 | 9 | ≈9,4 | −0,4 |\n",
              "| F | 17 | 4 | ≈2,2 | +1,8 |\n\n",
              "Punt **F** lijkt extremer (ver rechts in X), maar ligt bijna op de lijn (residu slechts +1,8). ",
              "Punt **A** heeft de hoogste Y maar past bij de trend (residu +1,7). ",
              "Alleen punt **B** wijkt met een residu van +9,1 sterk af van de verwachte waarde."
            )
          }

          get_reporter()$add_message(msg, type = "markdown")
          ok
        },
        function(generated, expected) {
          if (isTRUE(generated)) {
            correct("Correct! Punt B heeft het grootste residu.")
          } else {
            wrong("Fout. Bereken het residu (Y minus voorspelde Y) voor elk punt en vergelijk.")
          }
        }
      )
    }
  )
})
