context({
  testcase(
    " ",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        1,  # Correct answer
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "✅ Juist - **Univariate beschrijvende** vraag. Bestudeerde variabele: Het aantal gerapporteerde inbraken per maand in Belgische steden. Er wordt één variabele beschreven zonder relaties met andere variabelen te onderzoeken.",
            
            "2" = "❌ Fout - **Bivariate** betekent twee variabelen. Voorbeelden: 'Hoe verschilt het aantal inbraken tussen steden en dorpen?' of 'Wat is de relatie tussen aantal inbraken en seizoen?' Deze vraag onderzoekt alleen één variabele: aantal inbraken.",
            
            "3" = "❌ Fout - **Verklarende** vragen zoeken oorzaak-gevolg relaties. Voorbeelden: 'Veroorzaakt meer politietoezicht minder inbraken?' of 'Heeft werkloosheid invloed op inbraken?' Deze vraag zoekt geen verklaring, alleen beschrijving.",
            
            "4" = "❌ Fout - **Multivariate** betekent meer dan twee variabelen. Voorbeeld: 'Hoe variëren inbraken naar stad, seizoen en sociaaleconomische status tegelijk?' Deze vraag heeft slechts één variabele."
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