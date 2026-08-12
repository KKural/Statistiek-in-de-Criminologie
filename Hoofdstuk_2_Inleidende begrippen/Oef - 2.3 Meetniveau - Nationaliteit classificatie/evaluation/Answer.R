context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        1,  # Correct answer
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "✅ Juist - bij het **nominaal** meetniveau worden gegevens ingedeeld in categorieën zonder een specifieke volgorde. Nationaliteit is een typisch voorbeeld hiervan: de categorieën zijn verschillend, maar er is geen rangorde tussen de nationaliteiten. <a href='https://www.youtube.com/watch?v=KJPXZIEmvfA' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            
            "2" = "❌ Fout - **Ordinaal** heeft categorieën met rangorde. Criminologische voorbeelden: ernst van delicten (licht, gemiddeld, zwaar), rang bij politie (agent, brigadier, commissaris). Nationaliteiten kunnen niet gerangschikt worden - 'Belg' is niet 'hoger' of 'lager' dan 'Frans'.",
            
            "3" = "❌ Fout - **Interval** heeft numerieke waarden met gelijke afstanden, maar geen absoluut nulpunt. Criminologische voorbeelden: jaar van veroordeling (1990, 2000, 2010), attitude-scores. Nationaliteit is categorisch, niet numeriek.",
            
            "4" = "❌ Fout - **Ratio** heeft numerieke waarden met gelijke afstanden en een absoluut nulpunt. Criminologische voorbeelden: aantal politieagenten per nationaliteit, jaren werkervaring. Nationaliteit zelf is geen numerieke meting."
          )
          
          likely_reasons <- list(
            "2" = "je rangschikte nationaliteiten mogelijk op basis van een extern kenmerk, maar de nationaliteitscategorieën zelf hebben geen natuurlijke volgorde.",
            "3" = "je behandelde mogelijke categoriecodes misschien als numerieke waarden met gelijke afstanden, terwijl de codes alleen labels zijn.",
            "4" = "je dacht mogelijk aan aantallen personen per nationaliteit, die wel ratio zijn, maar de gevraagde variabele is nationaliteit zelf."
          )
          key <- as.character(generated)
          msg <- feedbacks[[key]] %||% "❌ Geef een getal tussen 1 en 4 in."
          if (key %in% names(feedbacks) && generated != expected) {
            msg <- paste0(
              "**Waarom deze keuze begrijpelijk kan lijken:** ", likely_reasons[[key]], "\n\n",
              "**Waarom dit niet klopt:** ",
              msg,
              "\n\n**Denkregel:** Een administratieve nationaliteitscode blijft een label; zij maakt de categorieen niet kwantitatief of ordinaal.\n\n",
              "**Volgende stap:** Probeer nationaliteiten betekenisvol te rangschikken en kies, wanneer dat niet kan, de nominale optie."
            )
          } else if (key %in% names(feedbacks) && generated == expected) {
            msg <- paste0(
              "**Bevestiging:** je gekozen optie is correct.\n\n",
              msg,
              "\n\n**Denkregel:** Nationaliteit bestaat uit categorieen zonder natuurlijke rangorde en is daarom nominaal.\n\n",
              "**Transferstap:** Classificeer land van geboorte en leg uit of de categorieen inhoudelijk geordend kunnen worden."
            )
          }
          
          if (!key %in% names(feedbacks)) {
            msg <- paste0(
              "**Controleer je invoer:** je invoer lijkt niet overeen te komen met één van de aangeboden optienummers; dit kan een typefout of een andere invoerinterpretatie zijn.\n\n",
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
