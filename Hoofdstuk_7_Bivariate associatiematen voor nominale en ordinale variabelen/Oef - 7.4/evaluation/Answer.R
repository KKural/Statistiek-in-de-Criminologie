# **Bevestiging:** correct-route feedback below confirms the answer before the Denkregel and Transferstap.
context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        1,
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "**Bevestiging:** Correct. Deze uitspraak is fout: Gamma kan geen waarden groter dan 1 aannemen, ook niet bij veel gelijke waarden. <a href='https://www.statisticshowto.com/gamma-coefficient-goodman-kruskal/' target='_blank' rel='noopener noreferrer'>Lees meer over Gamma</a>\n\n**Denkregel:** Gamma = (C-D)/(C+D), negeert gebonden paren in deze klassieke vorm en blijft daardoor tussen -1 en +1.\n\n**Transferstap:** Bereken het mogelijke teken van Gamma wanneer ernst en recidiverisico vooral concordante rangparen vormen en controleer dat de uitkomst binnen [-1,+1] blijft.",
            "2" = "❌ Dit is niet de foute uitspraak. **Waarschijnlijke redenering:** je hebt mogelijk gedacht dat Gamma alleen de sterkte en niet de richting weergeeft. De verhouding tussen concordante en discordante paren bepaalt ook het teken.\n\n**Waarom dit niet klopt:** deze keuze markeert een uitspraak als fout die binnen de definitie wel geldig is; de uitleg hierboven benoemt het beslissende onderscheid.\n\n**Denkregel:** meer concordante paren geeft positieve Gamma; meer discordante paren geeft negatieve Gamma.\n\n**Volgende stap:** behoud uitspraak 2 en controleer welke uitspraak het bereik [−1,+1] schendt. <a href='https://www.statisticshowto.com/gamma-coefficient-goodman-kruskal/' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            "3" = "❌ Dit is niet de foute uitspraak. **Waarschijnlijke redenering:** je hebt mogelijk het negeren van ties geïnterpreteerd als een mogelijkheid om buiten de correlatiegrenzen te vallen. Dat verandert het bereik niet.\n\n**Waarom dit niet klopt:** deze keuze markeert een uitspraak als fout die binnen de definitie wel geldig is; de uitleg hierboven benoemt het beslissende onderscheid.\n\n**Denkregel:** Gamma = (C−D)/(C+D) en blijft daardoor tussen −1 en +1 wanneer de maat gedefinieerd is.\n\n**Volgende stap:** behoud uitspraak 3; de bewering dat Gamma boven 1 kan uitkomen is de onjuiste. <a href='https://www.statisticshowto.com/gamma-coefficient-goodman-kruskal/' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            "4" = "❌ Dit is niet de foute uitspraak. **Waarschijnlijke redenering:** je hebt mogelijk Gamma verward met een ordinale maat die ties expliciet in de noemer corrigeert. In de klassieke Gamma-berekening worden gebonden paren niet als concordant of discordant meegeteld.\n\n**Waarom dit niet klopt:** deze keuze markeert een uitspraak als fout die binnen de definitie wel geldig is; de uitleg hierboven benoemt het beslissende onderscheid.\n\n**Denkregel:** bepaal per maat expliciet hoe ties worden behandeld; voor klassieke Gamma tellen C en D, niet de gebonden paren.\n\n**Volgende stap:** behoud uitspraak 4 en toets vervolgens uitspraak 1 aan het vaste bereik [−1,+1]. <a href='https://www.statisticshowto.com/gamma-coefficient-goodman-kruskal/' target='_blank' rel='noopener noreferrer'>Lees meer</a>"
          )
          key <- as.character(generated)
          msg <- feedbacks[[key]]
          if (is.null(msg)) {
            msg <- "Geef een getal tussen 1 en 4 in."
          }
          if (!key %in% names(feedbacks)) {
            msg <- paste0(
              "**Invoercontrole:** je invoer lijkt niet overeen te komen met één van de aangeboden optienummers; dit kan een typefout of een andere invoerinterpretatie zijn.\n\n",
              "**Waarom dit niet klopt:** de evaluator kan alleen een inhoudelijke optie beoordelen wanneer één geldig optienummer is ingevoerd.\n\n",
              "**Denkregel:** koppel eerst elke antwoordoptie aan haar nummer en voer uitsluitend dat ene nummer in.\n\n",
              "**Volgende stap:** lees de opties opnieuw, kies het nummer dat bij je redenering hoort en dien alleen dat nummer in."
            )
          }
          get_reporter()$add_message(msg, type = "markdown")
          generated == expected
        }
      )
    }
  )
})
