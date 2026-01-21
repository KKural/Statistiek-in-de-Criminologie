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
            "1" = "❌ Fout. Wederzijdse beïnvloeding past bij **symmetrische** relaties (geen duidelijke richting).",
            "2" = "❌ Fout. Als er geen onderscheid is tussen variabelen, spreken we niet van een asymmetrische afhankelijkheidsrelatie.",
            "3" = "✅ Juist! In een **asymmetrische** relatie veronderstellen we inhoudelijk dat de ene variabele (X) de andere (Y) beïnvloedt.",
            "4" = "❌ Fout. Een schijnverband door een gemeenschappelijke oorzaak is een ander concept (spurious relationship), niet de definitie van asymmetrie."
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
