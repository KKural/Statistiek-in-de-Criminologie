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
            "1" = "❌ Fout. Kruistabellen zijn net vooral geschikt wanneer variabelen een **beperkt aantal categorieën** hebben (nominaal/ordinaal).",
            "2" = "✅ Juist! Bij **metrische** variabelen zijn er vaak veel mogelijke waarden, waardoor een kruistabel snel **onleesbaar** wordt. Visualisatie (bv. scatterplot) is dan praktischer.",
            "3" = "❌ Fout. Metrische variabelen worden vaak net wél gevisualiseerd (bv. met een puntenwolk) om patronen te zien.",
            "4" = "❌ Fout. Kruistabellen kunnen aantallen of percentages tonen; dat hangt af van de gekozen presentatie, niet “altijd percentages”."
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
