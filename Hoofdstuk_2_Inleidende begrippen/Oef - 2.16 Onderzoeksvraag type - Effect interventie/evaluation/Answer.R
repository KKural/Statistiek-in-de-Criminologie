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
            "1" = "❌ Fout - **Beschrijvende vraag** beschrijft 'wat is' zonder vergelijking. Criminologische voorbeelden: 'Hoeveel misdrijven zijn er per wijk?', 'Wat is de gemiddelde leeftijd van verdachten?'. Deze vraag vergelijkt twee groepen.",
            
            "2" = "✅ Juist - **verschilvraag/effectvraag** vergelijkt groepen om verschil te meten ('Heeft interventie effect?' = 'Verschilt interventiegroep van controlegroep?'). Andere criminologische voorbeelden: 'Verschilt recidive tussen gevangenis en taakstraf?', 'Is er effect van CCTV op criminaliteit?'.",
            
            "3" = "❌ Fout - **Samenhangvraag** onderzoekt correlatie tussen twee continue variabelen. Criminologische voorbeelden: 'Hangt werkloosheid samen met criminaliteit?', 'Correleert leeftijd met aantal veroordelingen?'. Dit onderzoek vergelijkt groepen, niet correlatie.",
            
            "4" = "❌ Fout - **Voorspellingsvraag** voorspelt uitkomsten. Criminologische voorbeelden: 'Voorspelt jeugdcriminaliteit volwassen recidive?', 'Welke factoren voorspellen gewelddadig gedrag?'. Deze vraag test effect, voorspelt niet."
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