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
              "\u274c Fout. **Waarschijnlijke redenering:** je hebt mogelijk kleine toevallige afwijkingen in Figuur A ",
              "als een systematische schending gelezen. De punten volgen daar de diagonaal overwegend goed.\n\n",
              "**Beslisregel:** normaliteit vraagt geen perfecte lijn; vooral een systematische kromming of duidelijke afwijking in de staarten is een waarschuwingssignaal.\n\n",
              "**Volgende stap:** volg de punten van het midden naar beide uiteinden. Alleen in Figuur B buigt de rechterstaart duidelijk omhoog.\n\n",
              "**Correct antwoord:** 2"
            ),
            "2" = paste0(
              "\u2705 Juist! **Figuur B** toont een schending van normaliteit: de punten aan het rechter uiteinde ",
              "buigen opwaarts af van de diagonaal, kenmerkend voor een **rechts scheve** verdeling ",
              "(positieve scheefheid).\n\n",
              "**Figuur A** vertoont geen probleem: de punten liggen dicht bij de diagonaal."
            ),
            "3" = paste0(
              "\u274c Fout. **Waarschijnlijke redenering:** je hebt mogelijk een perfecte aansluiting op de diagonaal verwacht ",
              "en daardoor de beperkte willekeurige afwijkingen in A te streng beoordeeld.\n\n",
              "**Beslisregel:** beoordeel het patroon per figuur; kleine niet-systematische afwijkingen zijn aanvaardbaar, een samenhangende staartafwijking niet.\n\n",
              "**Volgende stap:** A volgt de lijn zonder systematische buiging; B wijkt in de rechterstaart duidelijk en gericht af.\n\n",
              "**Correct antwoord:** 2"
            ),
            "4" = paste0(
              "\u274c Fout. **Waarschijnlijke redenering:** je hebt mogelijk vooral het midden van beide Q-Q-plots beoordeeld, ",
              "waar de punten relatief dicht bij de lijn liggen, en de rechterstaart van B gemist.\n\n",
              "**Beslisregel:** controleer altijd centrum én beide staarten; een systematische opwaartse afwijking rechts wijst op rechtsscheefheid.\n\n",
              "**Volgende stap:** inspecteer de meest rechtse punten in B en vergelijk ze met de diagonaal.\n\n",
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
