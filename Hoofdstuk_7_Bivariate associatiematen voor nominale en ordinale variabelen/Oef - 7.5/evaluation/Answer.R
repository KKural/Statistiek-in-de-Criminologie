# **Bevestiging:** correct-route feedback below confirms the answer before the Denkregel and Transferstap.
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
            "1" = "❌ Dit is niet de foute uitspraak. **Waarschijnlijke redenering:** je hebt mogelijk gedacht dat het aantal rangparen het bereik van tau vergroot. Normalisatie houdt Kendall's tau echter binnen −1 en +1.\n\n**Waarom dit niet klopt:** deze keuze markeert een uitspraak als fout die binnen de definitie wel geldig is; de uitleg hierboven benoemt het beslissende onderscheid.\n\n**Denkregel:** controleer eerst het theoretische bereik van een correlatiemaat; voor Kendall's tau is dat [−1,+1].\n\n**Volgende stap:** behoud uitspraak 1 en zoek de optie met een waarde buiten dit interval. <a href='https://www.statisticshowto.com/kendalls-tau/' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            "2" = "**Bevestiging:** Correct. Deze uitspraak is fout: Kendall's tau kan nooit gelijk zijn aan 2 of -2; de waarde blijft steeds binnen het interval [-1, 1]. <a href='https://www.statisticshowto.com/kendalls-tau/' target='_blank' rel='noopener noreferrer'>Lees meer</a>\n\n**Denkregel:** toets een ordinale associatiemaat steeds op passend meetniveau, theoretisch bereik, richting en de behandeling van rangorde of ties.\n\n**Transferstap:** pas dezelfde controles toe op een nieuw criminologisch voorbeeld en formuleer één uitspraak die wel en één die niet uit de maat volgt.",
            "3" = "❌ Dit is niet de foute uitspraak. **Waarschijnlijke redenering:** je hebt mogelijk Kendall's tau verward met een maat die rechtstreeks met ruwe waarden rekent. Tau vergelijkt juist rangparen als concordant of discordant.\n\n**Waarom dit niet klopt:** deze keuze markeert een uitspraak als fout die binnen de definitie wel geldig is; de uitleg hierboven benoemt het beslissende onderscheid.\n\n**Denkregel:** concordante paren ondersteunen dezelfde rangorde; discordante paren ondersteunen de tegengestelde rangorde.\n\n**Volgende stap:** behoud uitspraak 3 en controleer welke antwoordwaarde onmogelijk is binnen [−1,+1]. <a href='https://www.statisticshowto.com/kendalls-tau/' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            "4" = "❌ Dit is niet de foute uitspraak. **Waarschijnlijke redenering:** je hebt mogelijk ‘overeenkomst’ opgevat als uitsluitend perfecte gelijkheid. Kendall's tau kwantificeert juist de mate waarin twee rangorden overeenkomen.\n\n**Waarom dit niet klopt:** deze keuze markeert een uitspraak als fout die binnen de definitie wel geldig is; de uitleg hierboven benoemt het beslissende onderscheid.\n\n**Denkregel:** meer concordante dan discordante paren betekent meer overeenkomst en een positievere tau.\n\n**Volgende stap:** behoud uitspraak 4 en toets de numerieke opties aan het bereik van tau. <a href='https://www.statisticshowto.com/kendalls-tau/' target='_blank' rel='noopener noreferrer'>Lees meer</a>"
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
