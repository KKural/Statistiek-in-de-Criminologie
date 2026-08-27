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
              "**Waarom deze keuze begrijpelijk kan lijken:** ", likely_reasons[[key]], "\n\n",
              "**Waarom dit niet klopt:** ",
              msg,
              "\n\n**Denkregel:** Controleer afzonderlijk of de delicten ordenbaar zijn en of gelijke afstanden betekenis hebben; alleen het eerste geldt.\n\n",
              "**Volgende stap:** Rangschik de categorieen en kies de optie die volgorde zonder gelijke afstand beschrijft."
            )
          } else if (key %in% names(feedbacks) && generated == expected) {
            msg <- paste0(
              "**Bevestiging:** je gekozen optie is correct.\n\n",
              msg,
              "\n\n**Denkregel:** Ordinale categorieen hebben een rangorde, maar hun opeenvolgende afstanden zijn niet aantoonbaar gelijk.\n\n",
              "**Transferstap:** Rangschik laag, middel en hoog recidiverisico en leg uit waarom de twee schaalstappen niet even groot hoeven te zijn."
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
