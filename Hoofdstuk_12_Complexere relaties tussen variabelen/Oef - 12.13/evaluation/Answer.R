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
              "als een systematische schending gelezen. Kleine afwijkingen alleen zijn echter onvoldoende voor die conclusie.\n\n",
              "**Denkregel:** normaliteit vraagt geen perfecte lijn; vooral een systematische kromming of duidelijke afwijking in de staarten is een waarschuwingssignaal.\n\n",
              "**Volgende stap:** volg in beide figuren de punten vanuit het midden naar beide uiteinden en zoek naar een samenhangend afwijkingspatroon."
            ),
            "2" = paste0(
              "\u2705 Juist! **Figuur B** toont een schending van normaliteit: de punten aan het rechter uiteinde ",
              "buigen opwaarts af van de diagonaal, kenmerkend voor een **rechts scheve** verdeling ",
              "(positieve scheefheid).\n\n",
              "**Figuur A** vertoont geen probleem: de punten liggen dicht bij de diagonaal."
            ),
            "3" = paste0(
              "\u274c Fout. **Waarschijnlijke redenering:** je hebt mogelijk een perfecte aansluiting op de diagonaal verwacht ",
              "en daardoor beperkte willekeurige afwijkingen te streng beoordeeld.\n\n",
              "**Denkregel:** beoordeel het patroon per figuur; kleine niet-systematische afwijkingen zijn aanvaardbaar, een samenhangende staartafwijking niet.\n\n",
              "**Volgende stap:** beoordeel elke figuur afzonderlijk en onderscheid kleine lokale afwijkingen van een gerichte buiging in een volledige staart."
            ),
            "4" = paste0(
              "\u274c Fout. **Waarschijnlijke redenering:** je hebt mogelijk vooral het midden van beide Q-Q-plots beoordeeld, ",
              "waar de punten relatief dicht bij de lijn liggen, en daardoor een mogelijk staartpatroon gemist.\n\n",
              "**Denkregel:** controleer altijd centrum én beide staarten; een systematische opwaartse afwijking rechts wijst op rechtsscheefheid.\n\n",
              "**Volgende stap:** inspecteer voor beide figuren centrum, linkerstaart en rechterstaart afzonderlijk en vergelijk elk deel met de diagonaal."
            )
          )
          key <- as.character(generated)
          msg <- feedbacks[[key]] %||% "\u274c Geef een getal tussen 1 en 4 in."
          if (identical(generated, expected)) {
            msg <- paste0(msg, "\n\n**Bevestiging:** deze keuze komt overeen met de ongewijzigde antwoordsleutel.\n\n**Denkregel:** in een Q-Q-plot zijn kleine toevallige afwijkingen normaal; systematische staartbuiging van de diagonaal is diagnostisch.\n\n**Transferstap:** inspecteer bij een nieuwe Q-Q-plot midden en beide staarten afzonderlijk.")
          } else if (key %in% names(feedbacks)) {
            msg <- sub("**Denkregel:**", "**Waarom dit niet klopt:** de gekozen conclusie negeert waar de afwijking systematisch is of eist ten onrechte perfecte aansluiting.\n\n**Denkregel:**", msg, fixed = TRUE)
          } else {
          msg <- paste0(msg, "\n\n**Controleer je invoer:** de invoer is leeg, niet-numeriek of buiten de aangeboden opties; daardoor kan geen inhoudelijke keuze worden vastgesteld.\n\n**Waarom dit niet klopt:** alleen één van de aangeboden optienummers kan met de antwoordsleutel worden beoordeeld.\n\n**Denkregel:** beoordeel alleen geldige opties op systematische afwijking van de Q-Q-diagonaal.\n\n**Volgende stap:** voer 1, 2, 3 of 4 in en controleer vooral de rechterstaart.")
          }
          get_reporter()$add_message(msg, type = "markdown")
          generated == expected
        }
      )
    }
  )
})
