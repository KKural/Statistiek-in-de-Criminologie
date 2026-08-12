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
          
          likely_reasons <- list(
            "2" = "je zag mogelijk verschillende temperatuurwaarden als categorieën, maar temperatuur draagt ook numerieke ordening en afstandsinformatie.",
            "3" = "je herkende mogelijk categorieën in het veiligheidsniveau, maar die categorieën hebben juist een betekenisvolle volgorde van laag naar hoog.",
            "4" = "je zag mogelijk dat leeftijd personen kan groeperen, maar ruwe leeftijd is een numerieke ratio-variabele met een werkelijk nulpunt."
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
