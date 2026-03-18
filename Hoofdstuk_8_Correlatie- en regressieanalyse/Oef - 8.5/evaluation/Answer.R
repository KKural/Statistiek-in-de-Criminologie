context({
  testcase(
    "R-kwadraat omzetten naar percentage",
    {
      testEqual(
        "",
        function(env) {

          # R^2 = 0.874 shown in table -> 0.874 * 100 = 87.4% -> rounds to 87
          exp_r2_pct <- 87

          if (!exists("r_kwadraat_pct", envir = env)) {
            get_reporter()$add_message(
              paste0("## Oef - 8.7: R² omzetten naar een percentage\n\n",
                     "❌ **Je hebt geen antwoord ingevoerd.**\n\n",
                     "Wijs een geheel getal toe aan `r_kwadraat_pct`, bijv. `r_kwadraat_pct <- 74`."),
              type = "markdown")
            return(FALSE)
          }

          raw <- get("r_kwadraat_pct", envir = env)
          num <- suppressWarnings(as.numeric(raw))
          ok  <- !is.na(num) && abs(num - exp_r2_pct) <= 1  # allow 86 or 88 due to rounding

          if (ok) {
            msg <- paste0(
              "## Oef - 8.7: R² omzetten naar een percentage\n\n",
              "✅ **Correct! R² = 0,874 → 87%**\n\n",
              "**Uitleg:** De tabel toont R² = **0,874**. ",
              "Omzetten naar procenten: 0,874 × 100 = 87,4%, afgerond = **87%**. ",
              "Dit betekent dat **87%** van de variantie in het inbraakcijfer verklaard wordt ",
              "door het aantal politie-uren per week. De overige 13% hangt samen met ",
              "andere factoren (socio-economische status, verlichting, enz.)."
            )
          } else {
            msg <- paste0(
              "## Oef - 8.7: R² omzetten naar een percentage\n\n",
              "❌ **Fout. Je antwoord: ", raw, "%. Correct: 87%.**\n\n",
              "**Stap-voor-stap:**\n",
              "1. Lees R² af uit de tabel: **R² = 0,874**\n",
              "2. Vermenigvuldig met 100: 0,874 × 100 = 87,4%\n",
              "3. Rond af naar een geheel getal: **87%**\n\n",
              "Veelgemaakte fouten:\n",
              "- R² zelf als antwoord geven (0,874) in plaats van het percentage\n",
              "- Verkeerd afronden (88 i.p.v. 87 of 74 i.p.v. 87)"
            )
          }

          get_reporter()$add_message(msg, type = "markdown")
          ok
        },
        function(generated, expected) {
          if (isTRUE(generated)) {
            correct("Correct! R² = 0,874 staat voor 87% verklaarde variantie.")
          } else {
            wrong("Fout. Lees R² af als decimaal en vermenigvuldig met 100.")
          }
        }
      )
    }
  )
})
