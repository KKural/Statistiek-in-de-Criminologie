context({
  testcase(
    "Spearman's rho (rho = 0): juiste foutieve uitspraak",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        2,
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "Deze uitspraak is niet fout. Een rho van 0 betekent dat er geen monotone relatie wordt gedetecteerd (geen stijgende of dalende trend in de rangen).",
            "2" = "Correct. Deze uitspraak is fout: een rho van 0 sluit andere (niet-monotone) verbanden niet uit. Er kan nog steeds een complex patroon tussen de variabelen bestaan.",
            "3" = "Deze uitspraak is niet fout. Spearman's rho is bij uitstek geschikt voor ordinale data of metrische variabelen die tot rangen zijn omgezet.",
            "4" = "Deze uitspraak is niet fout. Spearman's rho is een niet-parametrische correlatiemaat die werkt met rangorden in plaats van ruwe metrische waarden."
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
