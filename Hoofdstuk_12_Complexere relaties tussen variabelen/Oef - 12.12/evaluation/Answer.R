context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        2,
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = paste0(
              "\u274c Fout. Figuur A toont **geen** heteroscedasticiteit \u2014 de rode LOESS-smoother loopt ",
              "nagenoeg horizontaal, wat wijst op een gelijkmatige spreiding van de residuen.\n\n",
              "**Correct antwoord:** 2 \u2014 In Figuur B stijgt de smoother, wat betekent dat de variantie ",
              "van de residuen toeneemt naarmate de geschatte waarden groter worden."
            ),
            "2" = paste0(
              "\u2705 Juist! **Figuur B** toont **heteroscedasticiteit**: de rode smoother stijgt, wat aangeeft ",
              "dat de spreiding van de residuen toeneemt bij hogere geschatte waarden.\n\n",
              "**Figuur A** vertoont geen probleem: de punten zijn gelijkmatig verspreid en de smoother is vlak."
            ),
            "3" = paste0(
              "\u274c Fout. Niet beide figuren tonen heteroscedasticiteit.\n\n",
              "**Figuur A** is correct: de smoother is vlak en de punten zijn gelijkmatig verspreid.\n\n",
              "**Figuur B** toont wel een schending: de stijgende smoother wijst op toenemende variantie.\n\n",
              "**Correct antwoord:** 2"
            ),
            "4" = paste0(
              "\u274c Fout. **Figuur B** toont wel degelijk heteroscedasticiteit. Let op de stijgende rode lijn ",
              "\u2014 die geeft aan dat de residuen meer verspreid zijn bij hogere geschatte waarden.\n\n",
              "**Correct antwoord:** 2"
            )
          )
          key <- as.character(generated)
          msg <- feedbacks[[key]] %||% "\u274c Geef een getal tussen 1 en 4 in."
          get_reporter()$add_message(msg, type = "markdown")
          generated == expected
        }
      )
    }
  )
})
