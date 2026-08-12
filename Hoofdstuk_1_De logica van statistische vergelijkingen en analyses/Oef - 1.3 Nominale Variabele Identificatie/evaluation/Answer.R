context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        1,  # Correct answer: Q7 from your rotation pattern
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "✅ Juist! Type misdrijf bestaat uit categorieën zonder natuurlijke rangorde - je kunt niet zeggen dat diefstal 'meer' of 'minder' is dan geweld.",
            
            "2" = "❌ Fout. Temperatuur heeft numerieke waarden en een natuurlijke rangorde (warmer/kouder).",
            
            "3" = "❌ Fout. Dit is ordinaal omdat er een duidelijke rangorde is van laag naar hoog.",
            
            "4" = "❌ Fout. Leeftijd is ratio omdat het numerieke waarden heeft met een absoluut nulpunt."
          )
          
          key <- as.character(generated)
          msg <- feedbacks[[key]] %||% "❌ Geef een getal tussen 1 en 4 in."
          if (key %in% names(feedbacks) && generated != expected) {
            msg <- paste0(
              "**Mogelijke denkroute:** je keuze kan aantrekkelijk zijn omdat één bekende eigenschap passend lijkt, terwijl het beslissende criterium van de vraag nog niet is toegepast.\n\n",
              msg,
              "\n\n**Versterk je denkstap:** benoem vóór je opnieuw antwoordt (1) het kernbegrip, (2) de beslissende eigenschap en (3) waarom jouw gekozen optie daar wel of niet aan voldoet."
            )
          } else if (key %in% names(feedbacks) && generated == expected) {
            msg <- paste0(
              msg,
              "\n\n**Versterk je redenering:** formuleer de beslissende eigenschap in je eigen woorden, zodat je dezelfde regel in een nieuwe criminologische context kunt toepassen."
            )
          }
          
          get_reporter()$add_message(msg, type = "markdown")
          
          generated == expected
        }
      )
    }
  )
})
