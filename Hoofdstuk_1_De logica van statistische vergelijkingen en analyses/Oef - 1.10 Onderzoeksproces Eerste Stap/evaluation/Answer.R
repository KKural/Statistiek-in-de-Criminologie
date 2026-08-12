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
          
          likely_reasons <- list(
            "1" = "je beschouwde universiteitsstudenten mogelijk als een bruikbare vertegenwoordiging van jongeren omdat zij tot die populatie behoren, maar belangrijke subgroepen ontbreken.",
            "2" = "het getal 500 trok mogelijk je aandacht als probleem, terwijl een grote steekproef een systematisch selectieve samenstelling niet herstelt.",
            "4" = "het gevoelige onderwerp drugsgebruik riep mogelijk eerst een ethisch bezwaar op, maar met toestemming en anonimiteit is hier representativiteit het centrale probleem."
          )
          key <- as.character(generated)
          msg <- feedbacks[[key]] %||% "❌ Geef een getal tussen 1 en 4 in."
          if (key %in% names(feedbacks) && generated != expected) {
            msg <- paste0(
              "**Waarschijnlijke redenering:** ", likely_reasons[[key]], "\n\n",
              "**Waarom dit niet klopt:** ",
              msg,
              "\n\n**Denkregel:** benoem bij elke optie eerst het kernbegrip en de beslissende eigenschap; toets daarna of de optie aan dat criterium voldoet.\n\n",
              "**Volgende stap:** schrijf voor je gekozen optie één reden vóór en één reden tegen, en kies opnieuw op basis van het beslissende criterium."
            )
          } else if (key %in% names(feedbacks) && generated == expected) {
            msg <- paste0(
              "**Bevestiging:** je gekozen optie is correct.\n\n",
              msg,
              "\n\n**Denkregel:** koppel het juiste antwoord steeds aan de beslissende eigenschap, niet alleen aan een herkenbaar voorbeeld.\n\n",
              "**Transferstap:** formuleer die eigenschap in je eigen woorden en pas haar toe op een nieuw criminologisch voorbeeld."
            )
          }
          
          if (!key %in% names(feedbacks)) {
            msg <- paste0(
              "**Mogelijke denkroute:** je invoer lijkt niet overeen te komen met één van de aangeboden optienummers; dit kan een typefout of een andere invoerinterpretatie zijn.\n\n",
              "**Waarom dit niet klopt:** de evaluator kan alleen een inhoudelijke optie beoordelen wanneer één geldig optienummer is ingevoerd.\n\n",
              "**Denkregel:** koppel eerst elke antwoordoptie aan haar nummer en voer uitsluitend dat ene nummer in.\n\n",
              "**Volgende stap:** lees de opties opnieuw, kies het nummer dat bij je redenering hoort en dien alleen dat nummer in."
            )
          }
          get_reporter()$add_message(msg, type = "markdown")
          
          generated == expected
        }
      )
    }
  )
})
