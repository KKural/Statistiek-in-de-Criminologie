context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        4,  # Correct answer
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "❌ Fout - **Nominaal** betekent categorieën zonder rangorde. Criminologische voorbeelden: type winkel (supermarkt, kledingzaak, elektronicazaak), dag van de week waarop diefstal plaatsvond. Aantal meldingen is een telling, geen categorie.",
            
            "2" = "❌ Fout - **Ordinaal** heeft categorieën met rangorde, maar ongelijke afstanden tussen categorieën. Criminologische voorbeelden: ernst van winkeldiefstal (klein, gemiddeld, groot), rang van winkeldetective. Aantal meldingen heeft wel gelijke afstanden: verschil tussen 2 en 3 meldingen is hetzelfde als tussen 5 en 6 meldingen.",
            
            "3" = "❌ Fout - **Interval** heeft numerieke waarden met gelijke afstanden, maar geen absoluut nulpunt. Criminologische voorbeelden: jaar van registratie (2020, 2021, 2022), temperatuur tijdens diefstal in °C. Bij aantal meldingen betekent '0' wel degelijk 'geen meldingen' - het is een echt nulpunt.",
            
            "4" = "✅ Juist - de **registratie** van het aantal meldingen van winkeldiefstal per winkel bevindt zich op het ratio meetniveau. Dit gaat om een kwantitatieve telling waarbij: er een absoluut nulpunt is (0 meldingen betekent geen winkeldiefstal) en er betekenisvolle verhoudingen kunnen worden berekend (bijvoorbeeld: 4 meldingen is tweemaal zoveel als 2 meldingen)."
          )
          
          likely_reasons <- list(
            "1" = "je zag meldingen mogelijk als afzonderlijke categorieën of registratielabels, terwijl het gevraagde gegeven een telling per winkel is.",
            "2" = "je merkte terecht dat aantallen geordend kunnen worden, maar stopte mogelijk vóór de controles op gelijke afstanden en een werkelijk nulpunt.",
            "3" = "je herkende numerieke waarden met gelijke afstanden, maar liet mogelijk buiten beschouwing dat nul meldingen werkelijk geen meldingen betekent."
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
