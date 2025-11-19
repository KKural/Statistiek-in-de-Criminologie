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
            "1" = "❌ Fout - **Univariate** betekent één variabele. Voorbeelden: 'Wat is de gemiddelde leeftijd van daders?' of 'Hoeveel procent pleegt recidive?' Deze vraag onderzoekt twee variabelen: recidive en leeftijd.",
            
            "2" = "❌ Fout - **Beschrijvende** vraag zou alleen de relatie beschrijven. Voorbeeld: 'Wat is de correlatie tussen leeftijd en recidive?' Het woord 'beïnvloed' wijst op oorzaak-gevolg, niet alleen beschrijving van verband.",
            
            "3" = "✅ Juist - **bivariate verklarende**. Bestudeerde variabelen: Kans op recidive (binaire variabele: ja/nee) en Leeftijd van de dader (continu, ratio). Het woord 'beïnvloed' wijst op causale relatie.",
            
            "4" = "❌ Fout - **Multivariate** betekent meer dan twee variabelen. Voorbeeld: 'Wordt recidive beïnvloed door leeftijd, geslacht en opleidingsniveau samen?' Deze vraag heeft slechts twee variabelen."
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