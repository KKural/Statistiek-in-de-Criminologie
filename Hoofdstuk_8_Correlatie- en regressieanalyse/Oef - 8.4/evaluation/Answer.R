context({
  testcase(
    "Ligging van punt P t.o.v. de regressielijn",
    {
      testEqual(
        "",
        function(env) {

          # P(9, 8): regression line predicts ~16.5 at x=9 -> Y < Y-hat -> BELOW (code 3)
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
              "**Uitleg:** Bij x = 9 voorspelt de regressielijn circa **16,5** inbraken. ",
              "Wijk P heeft in werkelijkheid slechts **8** inbraken. ",
              "Omdat Y (8) < Ŷ (16,5) is het residu negatief — P ligt **onder** de lijn."
            )
          } else {
            msg <- paste0(
              "## Oef - 8.6: Ligging van punt P\n\n",
              "❌ **Fout. Je antwoord: ", student_lbl, " (code ", raw, "). Correct: onder de lijn (code 3).**\n\n",
              "**Uitleg:** Kijk naar de verticale afstand: waar kruist de regressielijn de verticale lijn op x = 9? ",
              "Dat is circa **16,5**. Punt P heeft y = **8**, wat lager is dan 16,5. ",
              "Dus P bevindt zich **onder** de regressielijn (residu = 8 − 16,5 = −8,5 < 0).\n\n",
              "Let op: dat P visueel ‘hoog’ lijkt in de grafiek doet er niet toe — ",
              "het gaat om de positie ten opzichte van de lijn op datzelfde x-punt."
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
