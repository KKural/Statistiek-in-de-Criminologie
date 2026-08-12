context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        4,  # Correct answer: Interval/Ratio
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "❌ Fout. Nominaal betekent categorieën zonder rangorde. Voorbeeld: haarkleur (blond, bruin, zwart) is nominaal. Leeftijd heeft wel numerieke waarden en rangorde. <a href='https://www.questionpro.com/blog/nominal-ordinal-interval-ratio/' target='_blank' rel='noopener noreferrer'>Lees meer over meetschalen</a>",
            "2" = "❌ Fout. Als je uitgaat van leeftijd in jaren is het antwoord fout, omdat ordinaal alleen rangorde aangeeft en geen gelijke intervallen. Leeftijd heeft wél gelijke intervallen tussen jaren, dus het oorspronkelijke meetniveau is interval/ratio (ratio, omdat er een natuurlijk nulpunt is). Wel is het mogelijk om van een interval/ratio-variabele een categorische variabele te maken. Bijvoorbeeld door leeftijden in categorieën zoals '0-9', '4-12', '13-17' enz. in te delen. In dat geval wordt het meetniveau ordinaal, omdat de categorieën een rangorde hebben, maar de exacte afstanden tussen categorieën niet meer relevant zijn. <a href='https://www.questionpro.com/blog/nominal-ordinal-interval-ratio/' target='_blank' rel='noopener noreferrer'>Lees meer over meetschalen</a>",
            "3" = "❌ Fout. Dichotoom betekent slechts twee categorieën. Voorbeeld: geslacht (man/vrouw) of ja/nee vragen. Leeftijd heeft een oneindig aantal mogelijke waarden. <a href='https://www.questionpro.com/blog/nominal-ordinal-interval-ratio/' target='_blank' rel='noopener noreferrer'>Lees meer over meetschalen</a>",
            "4" = "✅ Juist! Leeftijd is interval/ratio omdat het numerieke waarden heeft, gelijke intervallen, en een absoluut nulpunt (0 jaar = geen leeftijd). Voorbeeld: leeftijd in jaren: 18, 19, 20, ... <a href='https://www.questionpro.com/blog/nominal-ordinal-interval-ratio/' target='_blank' rel='noopener noreferrer'>Lees meer over meetschalen</a>"
          )
          likely_reasons <- list(
            "1" = "je zag mogelijk dat leeftijden mensen in categorieën kunnen indelen en koppelde dat aan nominaal, terwijl de vraag over de ruwe leeftijdswaarden gaat.",
            "2" = "je merkte terecht op dat leeftijden geordend kunnen worden, maar stopte mogelijk vóór de controle op gelijke afstanden en een werkelijk nulpunt.",
            "3" = "je dacht mogelijk aan een afgeleide tweedeling zoals jong/oud, terwijl de oorspronkelijke variabele meer dan twee numerieke waarden kan aannemen."
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
