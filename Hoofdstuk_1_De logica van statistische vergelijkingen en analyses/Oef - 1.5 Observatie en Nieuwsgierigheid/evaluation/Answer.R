context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        4,  # Correct answer: Observation and curiosity
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "❌ Fout. Dit zijn latere stappen in het onderzoeksproces. Voordat je data kunt verzamelen, moet je eerst weten wat je wilt onderzoeken.",
            
            "2" = "❌ Fout. De onderzoeksvraag komt voort uit eerdere observaties en nieuwsgierigheid. Je moet eerst iets interessants opmerken voordat je er een vraag over kunt formuleren.",
            
            "3" = "❌ Fout. Literatuurstudie is belangrijk, maar wordt typisch pas gedaan nadat nieuwsgierigheid en observatie de onderzoeker naar een bepaald onderwerp hebben geleid.",
            
            "4" = "✅ Juist! Observatie en nieuwsgierigheid zijn de eerste stappen die vaak over het hoofd worden gezien. Veel onderzoeksprojecten veranderen van richting omdat onderzoekers hun interesse verliezen of nieuwe inzichten krijgen. Deze stappen vormen de basis voor alle verdere onderzoek."
          )
          
          likely_reasons <- list(
            "1" = "je beschouwde dataverzameling mogelijk als de eerste zichtbare formele onderzoeksactiviteit en sloeg daardoor de voorafgaande oriëntatie over.",
            "2" = "je zag de geformuleerde onderzoeksvraag mogelijk als het officiële beginpunt, maar die vraag ontstaat pas uit iets dat eerst is opgemerkt.",
            "3" = "je hebt mogelijk geleerd om een literatuurstudie vroeg te doen en plaatste die daarom vóór de observatie en nieuwsgierigheid die het onderwerp selecteren."
          )
          key <- as.character(generated)
          msg <- feedbacks[[key]] %||% "❌ Geef een getal tussen 1 en 4 in."
          if (key %in% names(feedbacks) && generated != expected) {
            msg <- paste0(
              "**Waarschijnlijke redenering:** ", likely_reasons[[key]], "\n\n",
              "**Waarom dit niet klopt:** ",
              msg,
              "\n\n**Denkregel:** Verken eerst het waargenomen patroon; neem een oorzaak of oplossing niet meteen als bewezen aan.\n\n",
              "**Volgende stap:** Kies de optie die het patroon eerst onderzoekt voordat methoden of conclusies worden vastgelegd."
            )
          } else if (key %in% names(feedbacks) && generated == expected) {
            msg <- paste0(
              "**Bevestiging:** je gekozen optie is correct.\n\n",
              msg,
              "\n\n**Denkregel:** Systematische observatie en nieuwsgierigheid signaleren een patroon waaruit een onderzoekbare vraag kan ontstaan.\n\n",
              "**Transferstap:** Zet een concentratie van fietsdiefstal op een kaart om in een concrete, toetsbare criminologische onderzoeksvraag."
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
