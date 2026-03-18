context({
  testcase(
    "R\u00b2 omzetten naar een percentage",
    {
      testEqual(
        "",
        function(env) {

          # R² = 0.874 in the table → 87.4% → rounded to 87 (tolerance ±1)
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
              "\u2705 **Correct! R\u00b2 = 0,874 \u00d7 100 \u2248 87%**\n\n",
              "**Uitleg:** De tabel toont R\u00b2 = 0,874. ",
              "Dit betekent dat **87,4%** van de variantie in inbraken verklaard wordt door politie-aanwezigheid.\n\n",
              "Afgerond naar een geheel getal: **87%**."
            )
          } else {
            given <- if (is.na(val)) "geen geldig getal" else as.character(val)
            msg <- paste0(
              "## Oef - 8.5: R\u00b2 omzetten naar een percentage\n\n",
              "\u274c **Fout. Je antwoord: `", given, "`. Correct antwoord: `87`**\n\n",
              "**Uitleg:** Zoek R\u00b2 in de regressie-uitvoer (R\u00b2 = 0,874). ",
              "Vermenigvuldig met 100: 0,874 \u00d7 100 = 87,4. ",
              "Afgerond naar een geheel getal geeft **87**.\n\n",
              "> Antwoorden tussen 86 en 88 worden ook als correct beschouwd."
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
