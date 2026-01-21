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
            "1" = "Correct. Deze uitspraak is fout: Gamma kan geen waarden groter dan 1 aannemen, ook niet bij veel gelijke waarden.",
            "2" = "Deze uitspraak is niet fout. Gamma kan positief zijn (meer concordante dan discordante paren) of negatief (meer discordante dan concordante paren).",
            "3" = "Deze uitspraak is niet fout. Gamma ligt, net als Spearman's rho, tussen -1 en +1.",
            "4" = "Deze uitspraak is niet fout. In de klassieke definitie negeert Gamma gebonden rangen (ties) in de berekening."
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