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
              "\u274c Fout. Figuur A toont **geen** schending \u2014 de punten volgen de diagonale stippellijn goed, ",
              "wat wijst op normaal verdeelde residuen.\n\n",
              "**Correct antwoord:** 2 \u2014 In Figuur B buigen de punten aan het rechtse uiteinde duidelijk ",
              "omhoog af van de diagonaal, wat wijst op een rechtsscheve verdeling van de residuen."
            ),
            "2" = paste0(
              "\u2705 Juist! **Figuur B** toont een schending van normaliteit: de punten aan het rechter uiteinde ",
              "buigen opwaarts af van de diagonaal, kenmerkend voor een **rechts scheve** verdeling ",
              "(positieve scheefheid).\n\n",
              "**Figuur A** vertoont geen probleem: de punten liggen dicht bij de diagonaal."
            ),
            "3" = paste0(
              "\u274c Fout. Niet beide figuren tonen een schending.\n\n",
              "**Figuur A** is correct: de punten volgen de diagonaal goed.\n\n",
              "**Figuur B** toont wel een schending: de opwaartse buiging rechts wijst op rechtsscheefheid.\n\n",
              "**Correct antwoord:** 2"
            ),
            "4" = paste0(
              "\u274c Fout. **Figuur B** toont wel degelijk een schending van normaliteit. De punten aan het ",
              "rechtse uiteinde wijken duidelijk af van de diagonaal (buigen naar boven), ",
              "wat kenmerkend is voor een rechts scheve verdeling.\n\n",
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
