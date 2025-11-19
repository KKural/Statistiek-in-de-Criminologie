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
            "1" = "❌ Fout - dit zijn de **antwoordcategorieën**, niet de onderzoekseenheden. We verzamelen gegevens OVER de methoden, maar VAN de studenten. Vergelijkbaar: in criminologisch onderzoek zijn 'soorten delicten' niet de onderzoekseenheden, maar de 'daders' of 'incidenten' wel.",
            
            "2" = "✅ Juist - dit zijn de **individuele eenheden** waarvan we gegevens verzamelen - de 'cases' van het onderzoek. In criminologisch onderzoek zijn dit bijvoorbeeld individuele daders, slachtoffers, of misdrijfincidenten.",
            
            "3" = "❌ Fout - dit is de **setting/context**, maar we verzamelen geen gegevens over universiteiten. Vergelijkbaar: in een studie over gevangenisstraffen zijn 'gevangenissen' niet de onderzoekseenheden als we data verzamelen over individuele gevangenen.",
            
            "4" = "❌ Fout - dit zijn **mogelijke waarden** van een variabele, niet de onderzoekseenheden zelf. Vergelijkbaar: in criminaliteitsonderzoek zijn 'hoog/gemiddeld/laag' risico-categorieën, maar de onderzoekseenheden zijn de individuen die in deze categorieën vallen."
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