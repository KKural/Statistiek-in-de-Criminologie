context({
  testcase(
    " ",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        2, # Correct answer: meetniveau + theoretische richting
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "❌ Fout. Steekproefgrootte en type steekproef bepalen niet rechtstreeks welke **associatiemaat** je kiest. [Lees meer](https://www.statisticshowto.com/probability-and-statistics/statistics-definitions/sample-size/)",
            "2" = "✅ Juist! Je houdt rekening met het **meetniveau** van de variabelen én of de associatie theoretisch **symmetrisch of asymmetrisch** is. [Lees meer over associatiematen](https://statistics.laerd.com/statistical-guides/measures-of-association.php)",
            "3" = "❌ Fout. Celfrequenties en totalen zijn relevant voor het lezen van kruistabellen, maar zijn geen kernregels voor de keuze van een associatiemaat. [Lees meer](https://statistics.laerd.com/spss-tutorials/chi-square-test-for-association-using-spss-statistics.php)",
            "4" = "❌ Fout. De keuze van assen is een visualisatiekeuze, niet de basisregel voor associatiematen. [Lees meer over grafieken](https://www.khanacademy.org/math/statistics-probability/describing-relationships-quantitative-data)"
          )
          key <- as.character(generated)
          msg <- feedbacks[[key]] %||% "❌ Geef een getal tussen 1 en 4 in."
          get_reporter()$add_message(msg, type = "markdown")
          generated == expected
        }
      )
    }
  )
})
