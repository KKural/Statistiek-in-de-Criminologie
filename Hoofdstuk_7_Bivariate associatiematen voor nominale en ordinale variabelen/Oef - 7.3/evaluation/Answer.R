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
            "1" = "Deze uitspraak is niet fout. Spearman's rho ligt altijd tussen -1 en +1. [Lees meer over Spearman's rho](https://www.statisticshowto.com/probability-and-statistics/correlation-coefficient-formula/spearmans-rank-correlation-coefficient/)",
            "2" = "Deze uitspraak is niet fout. Spearman's rho meet de sterkte en richting van een monotone relatie tussen twee ordinale (of tot rang omgezette) variabelen. [Lees meer](https://statistics.laerd.com/statistical-guides/spearmans-rank-order-correlation-statistical-guide.php)",
            "3" = "Deze uitspraak is niet fout. Spearman's rho kan negatief zijn wanneer hogere waarden van de ene variabele samengaan met lagere waarden van de andere (omgekeerde monotone relatie). [Lees meer](https://www.youtube.com/watch?v=9EqHaQ4bPkc)",
            "4" = "Correct. Deze uitspraak is fout: Spearman's rho kan wel degelijk negatief zijn en een daling in de ene variabele betekent niet automatisch een daling in de andere. [Lees meer](https://statistics.laerd.com/statistical-guides/spearmans-rank-order-correlation-statistical-guide.php)"
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