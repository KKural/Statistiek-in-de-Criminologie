context({
  testcase(
    " ",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        3,  # Correct answer
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "❌ Fout - **Univariate** betekent één variabele. Voorbeelden: 'Hoeveel buurten hebben cameratoezicht?' of 'Wat is het gemiddelde aantal geweldsdelicten?' Deze vraag onderzoekt twee variabelen: cameratoezicht en geweldsdelicten.",
            
            "2" = "❌ Fout - **Beschrijvende** vraag zou alleen de relatie beschrijven. Voorbeeld: 'Wat is de correlatie tussen cameratoezicht en geweldsdelicten?' Het woord 'invloed' wijst op oorzaak-gevolg, niet alleen beschrijving.",
            
            "3" = "✅ Juist - **bivariate verklarende**. Bestudeerde variabelen: Aanwezigheid van cameratoezicht (binaire variabele: ja/nee) en Aantal geregistreerde geweldsdelicten (kwantitatief, ratio). Het woord 'invloed' wijst op causale relatie.",
            
            "4" = "❌ Fout - **Multivariate** betekent meer dan twee variabelen. Voorbeeld: 'Heeft cameratoezicht, samen met straatverlichting en politiepatrouilles, invloed op geweld?' Deze vraag heeft twee variabelen."
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