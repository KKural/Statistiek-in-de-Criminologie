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
            "1" = "✅ Juist - **univariate beschrijvende**. Bestudeerde variabele: Het percentage burgers dat zich onveilig voelt in hun buurt. Slechts één variabele wordt onderzocht.",
            
            "2" = "❌ Fout - **Bivariate** betekent twee variabelen. Voorbeelden: 'Verschilt onveiligheidsgevoel tussen mannen en vrouwen?' of 'Wat is de relatie tussen leeftijd en onveiligheidsgevoel?' Deze vraag onderzoekt alleen onveiligheidsgevoel.",
            
            "3" = "❌ Fout - **Verklarende** vragen zoeken oorzaak-gevolg relaties. Voorbeelden: 'Veroorzaakt slechte straatverlichting meer onveiligheidsgevoel?' of 'Heeft misdaadervaring invloed op veiligheidsgevoel?' Deze vraag zoekt geen verklaring.",
            
            "4" = "❌ Fout - **Multivariate** betekent meer dan twee variabelen. Voorbeeld: 'Hoe variëert onveiligheidsgevoel naar leeftijd, geslacht en buurttype tegelijk?' Deze vraag heeft één variabele."
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