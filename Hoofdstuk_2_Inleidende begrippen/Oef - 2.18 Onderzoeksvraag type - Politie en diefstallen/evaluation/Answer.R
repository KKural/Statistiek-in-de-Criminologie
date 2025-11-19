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
            "1" = "❌ Fout - **Univariate** betekent één variabele. Voorbeelden: 'Hoeveel politiemensen zijn er gemiddeld per 1000 inwoners?' of 'Wat is het gemiddelde aantal diefstallen?' Deze vraag onderzoekt de relatie tussen twee variabelen.",
            
            "2" = "✅ Juist - **bivariate beschrijvende**. Bestudeerde variabelen: Aantal politiemensen per 1000 inwoners (kwantitatief, ratio) en Aantal geregistreerde diefstallen (kwantitatief, ratio). Het woord 'relatie' beschrijft alleen het verband.",
            
            "3" = "❌ Fout - **Verklarend** zou zoeken naar oorzaak-gevolg. Voorbeeld: 'Zorgen meer politiemensen voor minder diefstallen?' Het woord 'relatie' beschrijft alleen het verband, niet de oorzakelijkheid.",
            
            "4" = "❌ Fout - **Multivariate** betekent meer dan twee variabelen. Voorbeeld: 'Wat is de relatie tussen politieaantallen, diefstallen en werkloosheid tegelijk?' Deze vraag heeft twee variabelen."
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