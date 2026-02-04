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
            "1" = "❌ Fout. Wederzijdse beïnvloeding past bij **symmetrische** relaties (geen duidelijke richting). <a href='https://www.youtube.com/watch?v=cQ-zAFzdckI' target='_blank' rel='noopener noreferrer'>Bekijk video</a> | <a href='https://vivdas.medium.com/regression-and-causal-inference-how-causal-graphs-helped-me-overcome-3-key-misconceptions-1faaa1845036' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            "2" = "❌ Fout. Als er geen onderscheid is tussen variabelen, spreken we niet van een asymmetrische afhankelijkheidsrelatie. <a href='https://www.youtube.com/watch?v=cQ-zAFzdckI' target='_blank' rel='noopener noreferrer'>Bekijk video</a> | <a href='https://vivdas.medium.com/regression-and-causal-inference-how-causal-graphs-helped-me-overcome-3-key-misconceptions-1faaa1845036' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            "3" = "✅ Juist! In een **asymmetrische** relatie veronderstellen we inhoudelijk dat de ene variabele (X) de andere (Y) beïnvloedt. <a href='https://www.youtube.com/watch?v=cQ-zAFzdckI' target='_blank' rel='noopener noreferrer'>Bekijk video</a> | <a href='https://vivdas.medium.com/regression-and-causal-inference-how-causal-graphs-helped-me-overcome-3-key-misconceptions-1faaa1845036' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            "4" = "❌ Fout. Een schijnverband door een gemeenschappelijke oorzaak is een ander concept (spurious relationship), niet de definitie van asymmetrie. <a href='https://www.youtube.com/watch?v=cQ-zAFzdckI' target='_blank' rel='noopener noreferrer'>Bekijk video</a> | <a href='https://vivdas.medium.com/regression-and-causal-inference-how-causal-graphs-helped-me-overcome-3-key-misconceptions-1faaa1845036' target='_blank' rel='noopener noreferrer'>Lees meer</a>"
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
