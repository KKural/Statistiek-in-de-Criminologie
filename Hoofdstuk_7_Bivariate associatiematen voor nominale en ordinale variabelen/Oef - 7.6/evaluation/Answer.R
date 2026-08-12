# **Bevestiging:** correct-route feedback below confirms the answer before the Denkregel and Transferstap.
context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        3,
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "❌ Dit is niet de foute uitspraak. **Waarschijnlijke redenering:** je hebt mogelijk ordinale data verward met nominale categorieën zonder rangorde. Spearman's rho gebruikt juist de ranginformatie in ordinale data.\n\n**Waarom dit niet klopt:** deze keuze markeert een uitspraak als fout die binnen de definitie wel geldig is; de uitleg hierboven benoemt het beslissende onderscheid.\n\n**Denkregel:** gebruik een rangcorrelatie wanneer waarnemingen betekenisvol geordend kunnen worden.\n\n**Volgende stap:** behoud uitspraak 1 en beoordeel vervolgens wat rho = 0 wel en niet uitsluit. <a href='https://psychology.town/statistics/spearman-rho-rank-order-correlation-guide/' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            "2" = "❌ Dit is niet de foute uitspraak. **Waarschijnlijke redenering:** je hebt mogelijk ‘niet-parametrisch’ geïnterpreteerd als ‘geen correlatiemaat’. Spearman's rho is wel een correlatiemaat, maar werkt met rangen en vereist geen lineair verband tussen ruwe waarden.\n\n**Waarom dit niet klopt:** deze keuze markeert een uitspraak als fout die binnen de definitie wel geldig is; de uitleg hierboven benoemt het beslissende onderscheid.\n\n**Denkregel:** niet-parametrisch beschrijft de aannames en het gebruik van rangen; het betekent niet dat er geen associatie wordt gemeten.\n\n**Volgende stap:** behoud uitspraak 2 en vergelijk de twee uitspraken over de betekenis van rho = 0. <a href='https://psychology.town/statistics/spearman-rho-rank-order-correlation-guide/' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            "3" = "**Bevestiging:** Correct. Deze uitspraak is fout: een rho van 0 sluit andere (niet-monotone) verbanden niet uit. Er kan nog steeds een complex patroon tussen de variabelen bestaan. <a href='https://psychology.town/statistics/spearman-rho-rank-order-correlation-guide/' target='_blank' rel='noopener noreferrer'>Lees meer over correlatie-interpretatie</a>\n\n**Denkregel:** toets een ordinale associatiemaat steeds op passend meetniveau, theoretisch bereik, richting en de behandeling van rangorde of ties.\n\n**Transferstap:** pas dezelfde controles toe op een nieuw criminologisch voorbeeld en formuleer één uitspraak die wel en één die niet uit de maat volgt.",
            "4" = "❌ Dit is niet de foute uitspraak. **Waarschijnlijke redenering:** je hebt mogelijk gedacht dat een niet-monotoon patroon uitspraak 4 weerlegt. Rho = 0 sluit zo'n patroon echter niet uit; het zegt juist dat er geen monotone stijgende of dalende trend is.\n\n**Waarom dit niet klopt:** deze keuze markeert een uitspraak als fout die binnen de definitie wel geldig is; de uitleg hierboven benoemt het beslissende onderscheid.\n\n**Denkregel:** interpreteer rho = 0 als ‘geen monotone rangsamenhang’, niet als ‘geen enkel mogelijk verband’.\n\n**Volgende stap:** behoud uitspraak 4; kies de sterkere uitspraak die ten onrechte alle verbanden uitsluit. <a href='https://psychology.town/statistics/spearman-rho-rank-order-correlation-guide/' target='_blank' rel='noopener noreferrer'>Lees meer</a>"
          )
          key <- as.character(generated)
          msg <- feedbacks[[key]]
          if (is.null(msg)) {
            msg <- "Geef een getal tussen 1 en 4 in."
          }
          if (!key %in% names(feedbacks)) {
            msg <- paste0(
              "**Mogelijke denkroute:** je invoer lijkt niet overeen te komen met één van de aangeboden optienummers; dit kan een typefout of een andere invoerinterpretatie zijn.\n\n",
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
