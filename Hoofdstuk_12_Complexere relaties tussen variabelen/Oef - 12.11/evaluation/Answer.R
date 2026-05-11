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
              "\u274c Fout. Figuur A toont **geen** schending \u2014 de rode LOESS-lijn loopt nagenoeg horizontaal ",
              "rond nul, wat wijst op een lineair verband.\n\n",
              "**Correct antwoord:** 2 \u2014 Figuur B toont de schending: de rode lijn maakt een duidelijke ",
              "boog (eerst positief, dan negatief), wat erop wijst dat het ware verband niet-lineair is."
            ),
            "2" = paste0(
              "\u2705 Juist! **Figuur B** toont een schending van de lineariteitsassumptie. De rode LOESS-smoother ",
              "vertoont een duidelijke boog in de residuen, wat aangeeft dat een rechte lijn het verband ",
              "niet goed beschrijft.\n\n",
              "**Figuur A** is correct: de residuen liggen willekeurig verspreid rond nul \u2014 geen systematisch patroon."
            ),
            "3" = paste0(
              "\u274c Fout. Niet beide figuren tonen een schending.\n\n",
              "**Figuur A** vertoont geen probleem: de smoother is vlak en de residuen zijn willekeurig verspreid.\n\n",
              "**Figuur B** toont wel een schending: de gebogen smoother wijst op niet-lineariteit.\n\n",
              "**Correct antwoord:** 2"
            ),
            "4" = paste0(
              "\u274c Fout. **Figuur B** toont wel degelijk een schending. Let op de gebogen rode lijn \u2014 ",
              "die systematische kromming wijst op een niet-lineair verband dat het model mist.\n\n",
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
