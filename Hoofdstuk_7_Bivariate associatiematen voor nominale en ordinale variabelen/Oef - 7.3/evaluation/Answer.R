# **Bevestiging:** correct-route feedback below confirms the answer before the Denkregel and Transferstap.
context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        4,
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "❌ Dit is niet de foute uitspraak. **Waarschijnlijke redenering:** je hebt mogelijk gedacht dat een rangcorrelatie buiten de gebruikelijke correlatiegrenzen kan vallen. Spearman's rho is echter begrensd tussen −1 en +1.\n\n**Waarom dit niet klopt:** deze keuze markeert een uitspraak als fout die binnen de definitie wel geldig is; de uitleg hierboven benoemt het beslissende onderscheid.\n\n**Denkregel:** controleer bij elke correlatiemaat eerst het theoretische bereik; voor rho is dat [−1, +1].\n\n**Volgende stap:** behoud uitspraak 1 en zoek de uitspraak die een negatieve rho ten onrechte uitsluit. <a href='https://psychology.town/statistics/spearman-rho-rank-order-correlation-guide/' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            "2" = "❌ Dit is niet de foute uitspraak. **Waarschijnlijke redenering:** je hebt mogelijk ‘monotoon’ verward met ‘perfect lineair’. Spearman's rho beoordeelt juist of rangen systematisch in dezelfde of tegengestelde richting bewegen.\n\n**Waarom dit niet klopt:** deze keuze markeert een uitspraak als fout die binnen de definitie wel geldig is; de uitleg hierboven benoemt het beslissende onderscheid.\n\n**Denkregel:** Spearman's rho meet sterkte én richting van een monotone relatie bij ordinale of gerangschikte gegevens.\n\n**Volgende stap:** accepteer uitspraak 2 en controleer welke andere uitspraak de negatieve richting ontkent. <a href='https://psychology.town/statistics/spearman-rho-rank-order-correlation-guide/' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            "3" = "❌ Dit is niet de foute uitspraak. **Waarschijnlijke redenering:** je hebt mogelijk aangenomen dat ‘samenhang’ alleen betekent dat beide variabelen samen stijgen. Een consistente tegengestelde rangorde levert echter een negatieve rho op.\n\n**Waarom dit niet klopt:** deze keuze markeert een uitspraak als fout die binnen de definitie wel geldig is; de uitleg hierboven benoemt het beslissende onderscheid.\n\n**Denkregel:** dezelfde rangrichting geeft een positieve rho; tegengestelde rangrichting geeft een negatieve rho.\n\n**Volgende stap:** behoud uitspraak 3 en vergelijk haar met uitspraak 4, die een negatieve rho onmogelijk noemt. <a href='https://psychology.town/statistics/spearman-rho-rank-order-correlation-guide/' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            "4" = "**Bevestiging:** Correct. Deze uitspraak is fout: Spearman's rho kan wel degelijk negatief zijn en een daling in de ene variabele betekent niet automatisch een daling in de andere. <a href='https://psychology.town/statistics/spearman-rho-rank-order-correlation-guide/' target='_blank' rel='noopener noreferrer'>Lees meer</a>\n\n**Denkregel:** toets een ordinale associatiemaat steeds op passend meetniveau, theoretisch bereik, richting en de behandeling van rangorde of ties.\n\n**Transferstap:** pas dezelfde controles toe op een nieuw criminologisch voorbeeld en formuleer één uitspraak die wel en één die niet uit de maat volgt."
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
