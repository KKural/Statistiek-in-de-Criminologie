context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        1,  # Correct answer: To break down central question into manageable parts
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "✅ Juist! Onderzoeksdeelvragen maken de vaak vage en brede centrale onderzoeksvraag behapbaar door deze op te delen in deelvragen die gemakkelijker te behandelen zijn. <a href='https://handboeksgpl.sites.uu.nl/doing-research/central-question-and-sub-questions/?lang=en' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            
            "2" = "❌ Fout. Het doel is niet om het onderzoek langer te maken, maar om het beter te organiseren. <a href='https://handboeksgpl.sites.uu.nl/doing-research/central-question-and-sub-questions/?lang=en' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            
            "3" = "❌ Fout. Het doel van deelvragen is niet om meer variabelen toe te voegen, maar om de hoofdvraag systematisch te onderzoeken. <a href='https://handboeksgpl.sites.uu.nl/doing-research/central-question-and-sub-questions/?lang=en' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            
            "4" = "❌ Fout. Deelvragen zijn een methodologisch hulpmiddel, niet bedoeld om het onderzoek aantrekkelijker te maken voor het publiek. <a href='https://handboeksgpl.sites.uu.nl/doing-research/central-question-and-sub-questions/?lang=en' target='_blank' rel='noopener noreferrer'>Lees meer</a>"
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
