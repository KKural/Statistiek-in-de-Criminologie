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
            "1" = "❌ Dit is niet de foute uitspraak. **Waarschijnlijke redenering:** je hebt mogelijk gedacht dat een rangcorrelatie buiten de gebruikelijke correlatiegrenzen kan vallen. Spearman's rho is echter begrensd tussen −1 en +1.\n\n**Beslisregel:** controleer bij elke correlatiemaat eerst het theoretische bereik; voor rho is dat [−1, +1].\n\n**Volgende stap:** behoud uitspraak 1 en zoek de uitspraak die een negatieve rho ten onrechte uitsluit. <a href='https://psychology.town/statistics/spearman-rho-rank-order-correlation-guide/' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            "2" = "❌ Dit is niet de foute uitspraak. **Waarschijnlijke redenering:** je hebt mogelijk ‘monotoon’ verward met ‘perfect lineair’. Spearman's rho beoordeelt juist of rangen systematisch in dezelfde of tegengestelde richting bewegen.\n\n**Beslisregel:** Spearman's rho meet sterkte én richting van een monotone relatie bij ordinale of gerangschikte gegevens.\n\n**Volgende stap:** accepteer uitspraak 2 en controleer welke andere uitspraak de negatieve richting ontkent. <a href='https://psychology.town/statistics/spearman-rho-rank-order-correlation-guide/' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            "3" = "❌ Dit is niet de foute uitspraak. **Waarschijnlijke redenering:** je hebt mogelijk aangenomen dat ‘samenhang’ alleen betekent dat beide variabelen samen stijgen. Een consistente tegengestelde rangorde levert echter een negatieve rho op.\n\n**Beslisregel:** dezelfde rangrichting geeft een positieve rho; tegengestelde rangrichting geeft een negatieve rho.\n\n**Volgende stap:** behoud uitspraak 3 en vergelijk haar met uitspraak 4, die een negatieve rho onmogelijk noemt. <a href='https://psychology.town/statistics/spearman-rho-rank-order-correlation-guide/' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            "4" = "Correct. Deze uitspraak is fout: Spearman's rho kan wel degelijk negatief zijn en een daling in de ene variabele betekent niet automatisch een daling in de andere. <a href='https://psychology.town/statistics/spearman-rho-rank-order-correlation-guide/' target='_blank' rel='noopener noreferrer'>Lees meer</a>"
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
