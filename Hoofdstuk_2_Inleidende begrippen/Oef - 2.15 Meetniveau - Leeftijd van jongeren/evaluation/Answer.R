context({
  testcase(
    " ",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        4,  # Correct answer
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "❌ Fout - **Nominaal** = categorieën zonder rangorde. Criminologische voorbeelden: type delict (diefstal, geweld, fraude), plaats delict (thuis, straat, winkel). Leeftijd is een numerieke waarde met betekenisvolle volgorde en afstanden.",
            
            "2" = "❌ Fout - **Ordinaal** = categorieën met rangorde maar ongelijke afstanden. Criminologische voorbeelden: ernst delict (licht-gemiddeld-zwaar), frequentie overlast (zelden-soms-vaak). Bij leeftijd zijn afstanden wel gelijk: 16-17 jaar = 17-18 jaar.",
            
            "3" = "❌ Fout - **Interval** = gelijke afstanden maar geen absoluut nulpunt. Voorbeeld: jaartal (2020, 2021). Bij leeftijd betekent '0 jaar' wel degelijk 'geboorte' - een echt nulpunt. Ook zijn verhoudingen betekenisvol: 20 jaar is dubbel zo oud als 10 jaar.",
            
            "4" = "✅ Juist - **ratio** (leeftijd heeft een absoluut nulpunt waarbij '0 jaar' betekenisvol is - geboorte). Verhoudingen zijn ook betekenisvol: iemand van 20 is dubbel zo oud als iemand van 10. Vergelijkbaar: aantal jaren in gevangenis, aantal maanden therapie."
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