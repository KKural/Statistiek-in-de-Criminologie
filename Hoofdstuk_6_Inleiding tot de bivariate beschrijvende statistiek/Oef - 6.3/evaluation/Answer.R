context({
  testcase(
    " ",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        3, # Correct answer: inhoudelijk veronderstelde beïnvloeding
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "❌ Fout. Wederzijdse beïnvloeding past bij **symmetrische** relaties (geen duidelijke richting). [Lees meer over relationele statistiek](https://www.statisticshowto.com/probability-and-statistics/correlation-coefficient-formula/)",
            "2" = "❌ Fout. Als er geen onderscheid is tussen variabelen, spreken we niet van een asymmetrische afhankelijkheidsrelatie. [Lees meer](https://en.wikipedia.org/wiki/Causal_graph)",
            "3" = "✅ Juist! In een **asymmetrische** relatie veronderstellen we inhoudelijk dat de ene variabele (X) de andere (Y) beïnvloedt. [Lees meer over regressie](https://www.khanacademy.org/math/statistics-probability/describing-relationships-quantitative-data)",
            "4" = "❌ Fout. Een schijnverband door een gemeenschappelijke oorzaak is een ander concept (spurious relationship), niet de definitie van asymmetrie. [Lees meer over confounding](https://www.scribbr.com/methodology/confounding-variables/)"
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
