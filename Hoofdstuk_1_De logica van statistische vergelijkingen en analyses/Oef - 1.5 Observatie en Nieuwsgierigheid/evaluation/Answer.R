context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        4,  # Correct answer: Observation and curiosity
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "❌ Fout. Dit zijn latere stappen in het onderzoeksproces. Voordat je data kunt verzamelen, moet je eerst weten wat je wilt onderzoeken.",
            
            "2" = "❌ Fout. De onderzoeksvraag komt voort uit eerdere observaties en nieuwsgierigheid. Je moet eerst iets interessants opmerken voordat je er een vraag over kunt formuleren.",
            
            "3" = "❌ Fout. Literatuurstudie is belangrijk, maar wordt typisch pas gedaan nadat nieuwsgierigheid en observatie de onderzoeker naar een bepaald onderwerp hebben geleid.",
            
            "4" = "✅ Juist! Observatie en nieuwsgierigheid zijn de eerste stappen die vaak over het hoofd worden gezien. Veel onderzoeksprojecten veranderen van richting omdat onderzoekers hun interesse verliezen of nieuwe inzichten krijgen. Deze stappen vormen de basis voor alle verdere onderzoek."
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
