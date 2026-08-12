context({
  testcase(
    "",
    {
      testEqual(
        " ",
        function(env) as.numeric(env$evaluationResult),
        2,  # Correct answer
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "❌ Fout - **Nominaal** betekent categorieën zonder rangorde. Criminologische voorbeelden: type delict (diefstal, geweld, fraude), geslacht dader (man, vrouw), soort straf (gevangenis, boete, werkstraf). Deze kunnen niet gerangschikt worden van 'minst' naar 'meest'. Delicten rangschikken naar ernst vereist wel een rangorde. <a href='https://www.youtube.com/watch?v=KJPXZIEmvfA' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            
            "2" = "✅ Juist - bij het **ordinaal** meetniveau kunnen de gegevens/data gerangschikt worden in een bepaalde volgorde, zoals van 'minst ernstig' naar 'meest ernstig'. Echter, de exacte afstand tussen de categorieën is niet meetbaar of betekenisvol. Bijvoorbeeld: je weet dat 'moord' ernstiger is dan 'diefstal', maar de precieze 'afstand' in ernst is niet meetbaar. <a href='https://www.youtube.com/watch?v=KJPXZIEmvfA' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            
            "3" = "❌ Fout - **Interval** heeft numerieke waarden met gelijke afstanden, maar geen absoluut nulpunt. Criminologische voorbeelden: attitude-schalen (veiligheidsgevoel 1-7), satisfactie met politie (1-10). Bij interval is er geen 'nul-punt' dat 'geen attitude' betekent. Delicten rangschikken naar ernst gebruikt geen numerieke schaal met gelijke intervallen. <a href='https://www.youtube.com/watch?v=KJPXZIEmvfA' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            
            "4" = "❌ Fout - **Ratio** heeft numerieke waarden met gelijke afstanden en een absoluut nulpunt. Criminologische voorbeelden: aantal delicten (0 = geen delicten), lengte gevangenisstraf in maanden (0 = geen straf), leeftijd dader (0 = net geboren). Bij ratio kan je zeggen '4 jaar gevangenis is dubbel zo lang als 2 jaar'. Dit geldt niet voor ernst-rangschikking van delicten. <a href='https://www.youtube.com/watch?v=KJPXZIEmvfA' target='_blank' rel='noopener noreferrer'>Lees meer</a>"
          )
          
          likely_reasons <- list(
            "1" = "je zag delicttypen als categorieën en koppelde die mogelijk aan nominaal, maar de opdracht voegt expliciet een ernstvolgorde toe.",
            "3" = "je behandelde de rangplaatsen mogelijk als numerieke scores met gelijke afstanden, terwijl alleen de volgorde van ernst vastligt.",
            "4" = "je veronderstelde mogelijk dat een laagste ernstcategorie een werkelijk nulpunt vormt en verhoudingen tussen ernstniveaus mogelijk maakt."
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
