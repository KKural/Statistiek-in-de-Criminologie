context({
  testcase(
    "Gamma: juiste foutieve uitspraak",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        1,
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "Correct. Deze uitspraak is fout: Gamma kan geen waarden groter dan 1 aannemen, ook niet bij veel gelijke waarden. [Lees meer over Gamma](https://www.statisticshowto.com/goodman-kruskal-gamma/)",
            "2" = "Deze uitspraak is niet fout. Gamma kan positief zijn (meer concordante dan discordante paren) of negatief (meer discordante dan concordante paren). [Lees meer](https://en.wikipedia.org/wiki/Goodman_and_Kruskal%27s_gamma)",
            "3" = "Deze uitspraak is niet fout. Gamma ligt, net als Spearman's rho, tussen -1 en +1. [Lees meer](https://www.statisticshowto.com/goodman-kruskal-gamma/)",
            "4" = "Deze uitspraak is niet fout. In de klassieke definitie negeert Gamma gebonden rangen (ties) in de berekening. [Lees meer over ordinale correlatiematen](https://statistics.laerd.com/spss-tutorials/goodman-and-kruskals-gamma-using-spss-statistics.php)"
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