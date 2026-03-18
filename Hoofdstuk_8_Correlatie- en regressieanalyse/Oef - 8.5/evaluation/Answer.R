context({
  testcase(
    "R\u00b2 omzetten naar een percentage",
    {
      testEqual(
        "",
        function(env) {

          # R² = 0.872 in the table → 87.2% → rounded to 87 (tolerance ±1)
          # Distractor: Adjusted R² = 0.856 → 86% (wrong — students must use R², not Adjusted R²)
          exp_r2_pct <- 87

          if (!exists("r_kwadraat_pct", envir = env)) {
            get_reporter()$add_message(
              paste0("## Oef - 8.5: R\u00b2 omzetten naar een percentage\n\n",
                     "\u274c **Je hebt geen antwoord ingevoerd.**\n\n",
                     "Wijs een geheel getal toe aan de variabele `r_kwadraat_pct`, bijv. `r_kwadraat_pct <- 85`"),
              type = "markdown")
            return(FALSE)
          }

          val <- suppressWarnings(as.numeric(get("r_kwadraat_pct", envir = env)))
          ok <- !is.na(val) && abs(val - exp_r2_pct) <= 1

          if (ok) {
            msg <- paste0(
              "## Oef - 8.5: R\u00b2 omzetten naar een percentage\n\n",
              "\u2705 **Correct! R\u00b2 = 0,872 \u00d7 100 \u2248 87%**\n\n",
              "**Uitleg:** De modelsamenvatting toont R\u00b2 = **0,872** (tweede kolom). ",
              "Dit betekent dat **87,2%** van de variantie in criminaliteitsgraad verklaard wordt door politie-inzet.\n\n",
              "Let op: de *gecorrigeerde* R\u00b2 (0,856 \u2192 86%) is een andere maatstaf die corrigeert voor het aantal predictoren ",
              "en is hier niet gevraagd."
            )
          } else {
            given <- if (is.na(val)) "geen geldig getal" else as.character(val)
            msg <- paste0(
              "## Oef - 8.5: R\u00b2 omzetten naar een percentage\n\n",
              "\u274c **Fout. Je antwoord: `", given, "`. Correct antwoord: `87`**\n\n",
              "**Uitleg:** Zoek in de **Modelsamenvatting** de kolom R\u00b2 (niet de gecorrigeerde R\u00b2). ",
              "De tabel toont R\u00b2 = **0,872**. Vermenigvuldig met 100: 0,872 \u00d7 100 = 87,2 \u2248 **87%**.\n\n",
              "Als je 86 hebt geantwoord, heb je vermoedelijk de *gecorrigeerde* R\u00b2 (0,856) gebruikt — ",
              "die corrigeert voor het aantal predictoren in het model en is hier niet gevraagd."
            )
          }

          get_reporter()$add_message(msg, type = "markdown")
          ok
        },
        function(generated, expected) {
          if (isTRUE(generated)) {
            correct("Correct! R\u00b2 = 0,874 \u2192 87%.")
          } else {
            wrong("Fout. Vermenigvuldig R\u00b2 met 100 en rond af naar een geheel getal.")
          }
        }
      )
    }
  )
})
