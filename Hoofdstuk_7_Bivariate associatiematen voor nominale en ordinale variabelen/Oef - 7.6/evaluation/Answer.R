context({
  testcase(
    "Spearman's rho (rho = 0): juiste foutieve uitspraak",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        3,
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "Deze uitspraak is niet fout. Spearman's rho is bij uitstek geschikt voor ordinale data of metrische variabelen die tot rangen zijn omgezet. <a href='https://psychology.town/statistics/spearman-rho-rank-order-correlation-guide/' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            "2" = "Deze uitspraak is niet fout. Spearman's rho is een niet-parametrische correlatiemaat die werkt met rangorden in plaats van ruwe metrische waarden. <a href='https://psychology.town/statistics/spearman-rho-rank-order-correlation-guide/' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            "3" = "Correct. Deze uitspraak is fout: een rho van 0 sluit andere (niet-monotone) verbanden niet uit. Er kan nog steeds een complex patroon tussen de variabelen bestaan. <a href='https://psychology.town/statistics/spearman-rho-rank-order-correlation-guide/' target='_blank' rel='noopener noreferrer'>Lees meer over correlatie-interpretatie</a>",
            "4" = "Deze uitspraak is niet fout. Een rho van 0 betekent dat er geen monotone relatie wordt gedetecteerd (geen stijgende of dalende trend in de rangen). <a href='https://psychology.town/statistics/spearman-rho-rank-order-correlation-guide/' target='_blank' rel='noopener noreferrer'>Lees meer</a>"
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
