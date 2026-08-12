context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        2,  # Correct answer
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "❌ Fout - **Nominaal** betekent categorieën zonder rangorde. Criminologische voorbeelden: type gevangenis (open, gesloten, jeugd), soort therapie (groep, individueel, gezins). De motivatieschaal 1-5 kan wel gerangschikt worden van laag naar hoog.",
            
            "2" = "✅ Juist - de **motivatieschaal** van 1 tot 5 bevindt zich op het ordinaal meetniveau. De cijfers geven een rangorde aan van motivatie: een 5 betekent meer motivatie dan een 3. Echter, de afstand tussen de cijfers is niet noodzakelijk gelijk. Het verschil in motivatie tussen een 1 en een 2 kan subjectief anders worden ervaren dan tussen een 4 en een 5. <a href='https://www.youtube.com/watch?v=KJPXZIEmvfA' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            
            "3" = "❌ Fout - **Interval** heeft numerieke waarden met gelijke afstanden, maar geen absoluut nulpunt. Criminologische voorbeelden: IQ-test scores, jaar van geboorte. Bij motivatieschalen is de 'afstand' tussen 1 en 2 niet noodzakelijk gelijk aan die tussen 4 en 5 - het zijn subjectieve beoordelingen. <a href='https://www.youtube.com/watch?v=KJPXZIEmvfA' target='_blank' rel='noopener noreferrer'>Lees meer</a>,",
            
            "4" = "❌ Fout - **Ratio** heeft numerieke waarden met gelijke afstanden en een absoluut nulpunt. Criminologische voorbeelden: aantal therapiesessies bijgewoond (0 = geen sessies), dagen in isolatiecel. Bij motivatieschaal betekent '1' niet 'geen motivatie' - het is nog steeds motivatie, alleen heel weinig."
          )
          
          likely_reasons <- list(
            "1" = "je zag vijf benoembare antwoordcategorieën en koppelde die mogelijk aan nominaal, maar de scores hebben een duidelijke lage-naar-hoge volgorde.",
            "3" = "de cijfers 1–5 deden mogelijk vermoeden dat elke stap exact even groot is, terwijl gelijke psychologische afstanden niet zijn aangetoond.",
            "4" = "je behandelde score 1 mogelijk als volledige afwezigheid van motivatie en daarmee als werkelijk nulpunt."
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
