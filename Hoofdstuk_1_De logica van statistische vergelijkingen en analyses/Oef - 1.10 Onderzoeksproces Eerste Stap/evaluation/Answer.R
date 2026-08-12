context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        3,  # Correct answer: Q20 - Sampling strategy evaluation
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "❌ Fout. Universiteitsstudenten zijn slechts een deel van alle jongeren. Deze steekproef mist jongeren die werken, werkloos zijn, of andere vormen van onderwijs volgen. <a href='https://www.qualtrics.com/en-gb/experience-management/research/sampling-methods/' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            
            "2" = "❌ Fout. 500 respondenten is een redelijke steekproefgrootte voor dit type onderzoek. Het probleem ligt niet in het aantal, maar in wie er onderzocht wordt. <a href='https://www.qualtrics.com/en-gb/experience-management/research/sampling-methods/' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            
            "3" = "✅ Juist! De steekproef bevat enkel universiteitsstudenten en laat veel andere jongeren buiten beschouwing, zoals zij die in het secundair of hoger beroepsonderwijs zitten, werken of werkloos zijn. Daardoor is de steekproef niet volledig representatief voor alle jongeren. <a href='https://www.qualtrics.com/en-gb/experience-management/research/sampling-methods/' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            
            "4" = "❌ Fout. Met juiste toestemming en anonimiteit kan drugsonderzoek wel ethisch uitgevoerd worden. Het probleem ligt in de representativiteit van de steekproef, niet in de ethiek van het onderwerp. <a href='https://www.qualtrics.com/en-gb/experience-management/research/sampling-methods/' target='_blank' rel='noopener noreferrer'>Lees meer</a>"
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
