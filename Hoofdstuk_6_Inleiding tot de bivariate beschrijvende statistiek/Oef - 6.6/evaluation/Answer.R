context({
  testcase(
    " ",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        2, # Correct answer: kruistabel onleesbaar bij metrische variabelen
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "❌ Fout. Kruistabellen zijn net vooral geschikt wanneer variabelen een **beperkt aantal categorieën** hebben (nominaal/ordinaal). [Lees meer](https://statistics.laerd.com/spss-tutorials/chi-square-test-for-association-using-spss-statistics.php)",
            "2" = "✅ Juist! Bij **metrische** variabelen zijn er vaak veel mogelijke waarden, waardoor een kruistabel snel **onleesbaar** wordt. Visualisatie (bv. scatterplot) is dan praktischer. [Lees meer over scatterplots](https://www.khanacademy.org/math/statistics-probability/describing-relationships-quantitative-data/introduction-to-scatterplots/v/constructing-a-scatter-plot)",
            "3" = "❌ Fout. Metrische variabelen worden vaak net wél gevisualiseerd (bv. met een puntenwolk) om patronen te zien. [Lees meer](https://www.statisticshowto.com/probability-and-statistics/regression-analysis/scatter-plot-chart/)",
            "4" = "❌ Fout. Kruistabellen kunnen aantallen of percentages tonen; dat hangt af van de gekozen presentatie, niet “altijd percentages”. [Lees meer over kruistabellen](https://www.youtube.com/watch?v=hZxnzfnt5v8)"
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
