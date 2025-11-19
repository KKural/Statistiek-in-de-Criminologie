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
            "1" = "✅ Juist - **univariate beschrijvende**. Bestudeerde variabele: Leeftijd van daders van geweldmisdrijven. Slechts één variabele wordt onderzocht.",
            
            "2" = "❌ Fout - **Bivariate** betekent twee variabelen. Voorbeelden: 'Verschilt de leeftijd van geweldsdaders tussen mannen en vrouwen?' of 'Wat is de relatie tussen leeftijd en type geweldsdelict?' Deze vraag onderzoekt alleen leeftijd.",
            
            "3" = "❌ Fout - **Verklarende** vragen zoeken oorzaak-gevolg relaties. Voorbeelden: 'Beïnvloedt leeftijd de kans op geweldsdelicten?' of 'Veroorzaakt jongere leeftijd meer agressief gedrag?' Deze vraag zoekt geen verklaring, alleen beschrijving.",
            
            "4" = "❌ Fout - **Multivariate** betekent meer dan twee variabelen. Voorbeeld: 'Wat is de gemiddelde leeftijd van geweldsdaders naar geslacht, opleiding en regio?' Deze vraag heeft één variabele: leeftijd."
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