context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        4,  # Correct answer: Q5 from your rotation pattern
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "❌ Fout. Er is wel degelijk een verschil tussen populatie en steekproef in termen van omvang en representatie.",
            
            "2" = "❌ Fout. Dit is andersom. De steekproef is een deel van de populatie, niet omgekeerd.",
            
            "3" = "❌ Fout. De grootte van een populatie hangt af van wat je onderzoekt, niet van een vast getal.",
            
            "4" = "✅ Juist! Een populatie bestaat uit alle eenheden waarin je geïnteresseerd bent, een steekproef is een subset daarvan. Als je de hele populatie onderzoekt, heet dat een census. Meestal bestudeer je echter een steekproef, omdat het vaak te duur of onpraktisch is om iedereen te onderzoeken."
          )
          
          likely_reasons <- list(
            "1" = "je zag populatie en steekproef mogelijk beide als groepen onderzoekseenheden en liet het onderscheid tussen het volledige doeluniversum en een subset weg.",
            "2" = "je herkende terecht een deel-geheelrelatie, maar draaide mogelijk de richting om: de steekproef wordt uit de populatie getrokken.",
            "3" = "je koppelde ‘populatie’ mogelijk aan een vaste grote omvang, terwijl de afbakening door de onderzoeksvraag en niet door een getalsgrens wordt bepaald."
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
