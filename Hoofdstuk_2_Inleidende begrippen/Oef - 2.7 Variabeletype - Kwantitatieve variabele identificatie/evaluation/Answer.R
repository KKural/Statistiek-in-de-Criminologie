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
            "1" = "❌ Fout - dit is **categorisch**. Het zijn verschillende categorieën (Google, Bibliotheek, Wikipedia, Overig) zonder numerieke betekenis. Vergelijkbaar criminologisch voorbeeld: 'type delict' (diefstal, geweld, fraude).",
            
            "2" = "❌ Fout - dit is **categorisch**. Categorieën man/vrouw kunnen niet gebruikt worden voor rekenkundige bewerkingen. Vergelijkbaar criminologisch voorbeeld: 'geslacht van dader' of 'geslacht van slachtoffer'.",
            
            "3" = "✅ Juist - **leeftijd** is kwantitatief. Je kunt er rekenkundige bewerkingen mee uitvoeren: gemiddelde berekenen, optellen, aftrekken. In criminologisch onderzoek zijn andere kwantitatieve voorbeelden: aantal jaren gevangenisstraf, hoogte van boete, aantal eerdere veroordelingen.",
            
            "4" = "❌ Fout - dit is **categorisch**. Verschillende studierichtingen (recht, psychologie, sociologie) zijn categorieën zonder numerieke waarde. Vergelijkbaar criminologisch voorbeeld: 'opleidingsniveau van dader' (laag, gemiddeld, hoog)."
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