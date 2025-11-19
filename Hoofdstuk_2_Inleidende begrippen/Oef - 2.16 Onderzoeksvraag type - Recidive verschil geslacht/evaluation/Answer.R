context({
  testcase(
    " ",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        2,  # Correct answer
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "❌ Fout - **Univariate** betekent één variabele. Voorbeelden: 'Wat is het gemiddelde recidivepercentage in België?' of 'Hoeveel procent van de daders is man?' Deze vraag vergelijkt recidive tussen geslachten - dus twee variabelen.",
            
            "2" = "✅ Juist - **bivariate beschrijvende**. Bestudeerde variabelen: Geslacht (categorisch: man/vrouw) en Percentage recidive (continu, ratio). Het woord 'verschilt' beschrijft het verschil zonder causale relatie.",
            
            "3" = "❌ Fout - **Verklarend** zou zoeken naar oorzaak-gevolg. Voorbeeld: 'Veroorzaakt geslacht verschillen in recidive?' Het woord 'verschilt' beschrijft alleen het verschil, zoekt niet naar waarom.",
            
            "4" = "❌ Fout - **Multivariate** betekent meer dan twee variabelen. Voorbeeld: 'Hoe verschilt recidive tussen geslacht, leeftijd en opleidingsniveau tegelijk?' Deze vraag heeft twee variabelen: geslacht en recidive."
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