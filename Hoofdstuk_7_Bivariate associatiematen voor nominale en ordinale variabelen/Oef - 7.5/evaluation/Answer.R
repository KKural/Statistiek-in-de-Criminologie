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
            "1" = "❌ Dit is niet de foute uitspraak. **Waarschijnlijke redenering:** je hebt mogelijk gedacht dat het aantal rangparen het bereik van tau vergroot. Normalisatie houdt Kendall's tau echter binnen −1 en +1.\n\n**Beslisregel:** controleer eerst het theoretische bereik van een correlatiemaat; voor Kendall's tau is dat [−1,+1].\n\n**Volgende stap:** behoud uitspraak 1 en zoek de optie met een waarde buiten dit interval. <a href='https://www.statisticshowto.com/kendalls-tau/' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            "2" = "Correct. Deze uitspraak is fout: Kendall's tau kan nooit gelijk zijn aan 2 of -2; de waarde blijft steeds binnen het interval [-1, 1]. <a href='https://www.statisticshowto.com/kendalls-tau/' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            "3" = "❌ Dit is niet de foute uitspraak. **Waarschijnlijke redenering:** je hebt mogelijk Kendall's tau verward met een maat die rechtstreeks met ruwe waarden rekent. Tau vergelijkt juist rangparen als concordant of discordant.\n\n**Beslisregel:** concordante paren ondersteunen dezelfde rangorde; discordante paren ondersteunen de tegengestelde rangorde.\n\n**Volgende stap:** behoud uitspraak 3 en controleer welke antwoordwaarde onmogelijk is binnen [−1,+1]. <a href='https://www.statisticshowto.com/kendalls-tau/' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            "4" = "❌ Dit is niet de foute uitspraak. **Waarschijnlijke redenering:** je hebt mogelijk ‘overeenkomst’ opgevat als uitsluitend perfecte gelijkheid. Kendall's tau kwantificeert juist de mate waarin twee rangorden overeenkomen.\n\n**Beslisregel:** meer concordante dan discordante paren betekent meer overeenkomst en een positievere tau.\n\n**Volgende stap:** behoud uitspraak 4 en toets de numerieke opties aan het bereik van tau. <a href='https://www.statisticshowto.com/kendalls-tau/' target='_blank' rel='noopener noreferrer'>Lees meer</a>"
          )
          key <- as.character(generated)
          msg <- feedbacks[[key]]
          if (is.null(msg)) {
            msg <- "Geef een getal tussen 1 en 4 in."
          }
          get_reporter()$add_message(msg, type = "markdown")
          generated == expected
        }
      )
    }
  )
})
