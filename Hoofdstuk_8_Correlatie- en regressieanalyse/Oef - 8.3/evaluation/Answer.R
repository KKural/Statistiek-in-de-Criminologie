context({
  testcase(
    "Uitbijter herkennen via residu",
    {
      testEqual(
        "",
        function(env) {

          # Correct answer: B(8,29) has residual ~+4.8 vs the regression line.
          # A(3,33) looks highest in Y but the line at x=3 is ~34, so A is BELOW line (e=-1.1).
          # F(20,3) is extreme in X but the line nearly reaches zero there (e=+2.4 only).
          exp_uitbijter <- "B"

          if (!exists("uitbijter", envir = env)) {
            get_reporter()$add_message(
              paste0("## Oef - 8.3: Uitbijter herkennen via residu\n\n",
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
              "## Oef - 8.3: Uitbijter herkennen via residu\n\n",
              "✅ **Correct! Punt B heeft het grootste residu.**\n\n",
              "**Uitleg:** Het residu van elk punt is Y − Ŷ.\n\n",
              "| Punt | x | y | Ŷ | Residu |\n",
              "|------|----|----|-------|--------|\n",
              "| A | 3 | 33 | ≈34,1 | −1,1 |\n",
              "| **B** | **8** | **29** | **≈24,2** | **+4,8** ← grootst |\n",
              "| C | 11 | 16 | ≈18,3 | −2,3 |\n",
              "| D | 14 | 10 | ≈12,4 | −2,4 |\n",
              "| E | 17 | 5 | ≈6,5 | −1,5 |\n",
              "| F | 20 | 3 | ≈0,6 | +2,4 |\n\n",
              "Punt B heeft het grootste absolute residu (+4,8)."
            )
          } else {
            msg <- paste0(
              "## Oef - 8.3: Uitbijter herkennen via residu\n\n",
              "❌ **Fout. Je antwoord: `\"", val, "\"`. Correct antwoord: `\"B\"`**\n\n",
              "**Uitleg:** Bereken voor elk punt het residu = Y − Ŷ:\n\n",
              "| Punt | x | y | Ŷ | Residu |\n",
              "|------|----|----|-------|--------|\n",
              "| A | 3 | 33 | ≈34,1 | −1,1 |\n",
              "| **B** | **8** | **29** | **≈24,2** | **+4,8** ← grootst! |\n",
              "| C | 11 | 16 | ≈18,3 | −2,3 |\n",
              "| D | 14 | 10 | ≈12,4 | −2,4 |\n",
              "| E | 17 | 5 | ≈6,5 | −1,5 |\n",
              "| F | 20 | 3 | ≈0,6 | +2,4 |\n\n",
              "**Veelgemaakte fouten:** Punt A heeft de hoogste Y-waarde (33), maar de regressielijn loopt op x=3 al op 34,1 — A ligt dus net **onder** de lijn (residu −1,1). ",
              "Punt F is extreem in X (x=20), maar de lijn daalt daar ook sterk naar ~0,6 — residual slechts +2,4. ",
              "Alleen punt B (x=8, y=29) staat 4,8 eenheden boven de lijn en heeft daarmee het grootste absolute residu."
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
