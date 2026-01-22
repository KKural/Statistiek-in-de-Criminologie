context({
  testcase(
    "Kendall's tau: juiste foutieve uitspraak",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        2,
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "Deze uitspraak is niet fout. Kendall's tau ligt altijd tussen -1 en +1. [Lees meer over Kendall's tau](https://www.statisticshowto.com/kendalls-tau/)",
            "2" = "Correct. Deze uitspraak is fout: Kendall's tau kan nooit gelijk zijn aan 2 of -2; de waarde blijft steeds binnen het interval [-1, 1]. [Lees meer](https://en.wikipedia.org/wiki/Kendall_rank_correlation_coefficient)",
            "3" = "Deze uitspraak is niet fout. Kendall's tau is gebaseerd op het aantal concordante en discordante paren. [Lees meer](https://www.statisticshowto.com/kendalls-tau/)",
            "4" = "Deze uitspraak is niet fout. Kendall's tau meet de overeenkomst tussen rangorden van twee variabelen. [Lees meer over ordinale correlaties](https://statistics.laerd.com/spss-tutorials/kendalls-tau-b-using-spss-statistics.php)"
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