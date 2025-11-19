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
            "1" = "❌ Fout - **Onafhankelijke variabele** is wat de onderzoeker manipuleert (hier: type interventie). Leeftijd wordt niet gemanipuleerd maar gecontroleerd. Vergelijkbaar: in therapie-onderzoek is 'type therapie' onafhankelijk, maar 'leeftijd patiënt' is controle.",
            
            "2" = "❌ Fout - **Afhankelijke variabele** is de uitkomst die gemeten wordt (hier: aantal meldingen). Leeftijd is niet de uitkomst. Vergelijkbaar: in recidive-onderzoek is 'aantal nieuwe misdrijven' afhankelijk, maar 'leeftijd dader' is controle.",
            
            "3" = "✅ Juist - **controlevariabele** wordt gemeten om ervoor te zorgen dat groepen vergelijkbaar zijn en confounding uit te sluiten. Ook wel 'moderator' of 'covariate' genoemd. Vergelijkbaar: sociale status, geslacht, of eerdere strafblad in andere criminologische studies.",
            
            "4" = "❌ Fout - **Verstorende variabele** (confounder) is iets dat niet gecontroleerd wordt maar wel invloed heeft. Hier wordt leeftijd wél bewust gemeten om te controleren, dus het is geen verstorende maar controlevariabele."
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