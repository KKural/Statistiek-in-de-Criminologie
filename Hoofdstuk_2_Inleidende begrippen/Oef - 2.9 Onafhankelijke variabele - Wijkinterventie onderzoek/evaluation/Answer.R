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
            "1" = "❌ Fout - dit is de **afhankelijke variabele** - wat we meten als uitkomst. In experimenteel onderzoek is dit het 'effect', niet de 'oorzaak'. Vergelijkbaar: in onderzoek naar effect van CCTV op criminaliteit is 'aantal misdrijven' de afhankelijke variabele.",
            
            "2" = "❌ Fout - dit is **geen variabele die gemanipuleerd wordt** door de onderzoeker. Het is een achtergrondvariabele. De onderzoeker kiest niet wie welke leeftijd heeft. Vergelijkbaar: in effectonderzoek naar reclasseringsprogramma's is 'geslacht van deelnemer' niet de onafhankelijke variabele.",
            
            "3" = "✅ Juist - de **interventie** (interventiewijk vs. controlegroep) is wat de onderzoeker manipuleert om het effect te meten. Jongeren krijgen wel of geen interventie - dit is de 'oorzaak' die we testen. Vergelijkbaar: type therapie in gevangenisonderzoek of aanwezigheid van cameratoezicht in veiligheidsonderzoek.",
            
            "4" = "❌ Fout - dit is een **constante, geen variabele**. Alle deelnemers worden 12 maanden gevolgd - er is geen variatie. Vergelijkbaar: als alle deelnemers aan drugsrehabilitatie 6 maanden programma volgen, dan is '6 maanden' geen variabele."
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