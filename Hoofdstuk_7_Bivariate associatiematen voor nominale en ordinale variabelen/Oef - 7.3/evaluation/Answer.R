context({
  testcase(
    "Spearman's rho: juiste foutieve uitspraak",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        3,
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "Deze uitspraak is niet fout. Spearman's rho kan negatief zijn wanneer hogere waarden van de ene variabele samengaan met lagere waarden van de andere (omgekeerde monotone relatie).",
            "2" = "Deze uitspraak is niet fout. Spearman's rho ligt altijd tussen -1 en +1.",
            "3" = "Correct. Deze uitspraak is fout: Spearman's rho kan wel degelijk negatief zijn en een daling in de ene variabele betekent niet automatisch een daling in de andere.",
            "4" = "Deze uitspraak is niet fout. Spearman's rho meet de sterkte en richting van een monotone relatie tussen twee ordinale (of tot rang omgezette) variabelen."
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