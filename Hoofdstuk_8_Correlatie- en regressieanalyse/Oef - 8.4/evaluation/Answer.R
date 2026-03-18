context({
  testcase(
    "Ligging van punt P t.o.v. de regressielijn",
    {
      testEqual(
        "",
        function(env) {

          # P(8, 16): regression line predicts ~18.3 at x=8 -> Y(16) < Y-hat(18.3) -> BELOW (code 3)
          # Visual trap: P sits between background points (6,21) and (10,16), looks like it follows the trend.
          # But the line at x=8 is at 18.3, so P is 2.3 units below it.
          exp_punt_positie <- 3

          if (!exists("punt_positie", envir = env)) {
            get_reporter()$add_message(
              paste0("## Oef - 8.6: Ligging van punt P\n\n",
                     "❌ **Je hebt geen antwoord ingevoerd.**\n\n",
                     "Wijs code 1, 2 of 3 toe aan `punt_positie`."),
              type = "markdown")
            return(FALSE)
          }

          raw <- get("punt_positie", envir = env)
          num <- suppressWarnings(as.numeric(raw))
          ok  <- !is.na(num) && num == exp_punt_positie

          lbl_map <- c("1" = "boven de lijn", "2" = "op de lijn", "3" = "onder de lijn")
          student_lbl <- if (!is.na(num) && as.character(round(num)) %in% names(lbl_map))
            lbl_map[[as.character(round(num))]] else paste0("ongeldig (", raw, ")")

          if (ok) {
            msg <- paste0(
              "## Oef - 8.6: Ligging van punt P\n\n",
              "✅ **Correct! Punt P ligt onder de regressielijn (code 3).**\n\n",
              "**Uitleg:** Bij x = 8 voorspelt de regressielijn circa **18,3** inbraken. ",
              "Wijk P heeft in werkelijkheid **16** inbraken. ",
              "Omdat Y (16) < Ŷ (18,3) is het residu negatief (16 − 18,3 = −2,3) — P ligt **onder** de lijn."
            )
          } else {
            msg <- paste0(
              "## Oef - 8.6: Ligging van punt P\n\n",
              "❌ **Fout. Je antwoord: ", student_lbl, " (code ", raw, "). Correct: onder de lijn (code 3).**\n\n",
              "**Uitleg:** Bepaal de voorspelde Y bij x = 8: dat is circa **18,3**. ",
              "Punt P heeft y = **16**, wat lager is dan 18,3. ",
              "Dus P bevindt zich **onder** de regressielijn (residu = 16 − 18,3 = −2,3 < 0).\n\n",
              "Let op: P lijkt visueel 'in lijn' te liggen met de naburige punten (6,21) en (10,16), ",
              "maar de regressielijn daalt op x=8 al naar 18,3 — P blijft daározonder."
            )
          }

          get_reporter()$add_message(msg, type = "markdown")
          ok
        },
        function(generated, expected) {
          if (isTRUE(generated)) {
            correct("Correct! Punt P ligt onder de regressielijn.")
          } else {
            wrong("Fout. Vergelijk de Y-waarde van P met de voorspelde waarde op de lijn bij hetzelfde x.")
          }
        }
      )
    }
  )
})
