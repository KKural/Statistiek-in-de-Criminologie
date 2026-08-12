context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        1,  # Correct answer: To break down central question into manageable parts
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "✅ Juist! Onderzoeksdeelvragen maken de vaak vage en brede centrale onderzoeksvraag behapbaar door deze op te delen in deelvragen die gemakkelijker te behandelen zijn. <a href='https://handboeksgpl.sites.uu.nl/doing-research/central-question-and-sub-questions/?lang=en' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            
            "2" = "❌ Fout. Het doel is niet om het onderzoek langer te maken, maar om het beter te organiseren. <a href='https://handboeksgpl.sites.uu.nl/doing-research/central-question-and-sub-questions/?lang=en' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            
            "3" = "❌ Fout. Het doel van deelvragen is niet om meer variabelen toe te voegen, maar om de hoofdvraag systematisch te onderzoeken. <a href='https://handboeksgpl.sites.uu.nl/doing-research/central-question-and-sub-questions/?lang=en' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            
            "4" = "❌ Fout. Deelvragen zijn een methodologisch hulpmiddel, niet bedoeld om het onderzoek aantrekkelijker te maken voor het publiek. <a href='https://handboeksgpl.sites.uu.nl/doing-research/central-question-and-sub-questions/?lang=en' target='_blank' rel='noopener noreferrer'>Lees meer</a>"
          )
          
          likely_reasons <- list(
            "2" = "je koppelde meerdere deelvragen mogelijk aan meer onderzoekswerk en dus aan een langere studie, maar dat is niet hun methodologische doel.",
            "3" = "je dacht mogelijk dat ‘meer deelvragen’ automatisch ‘meer variabelen’ betekent, terwijl deelvragen vooral de hoofdvraag structureren.",
            "4" = "je zag mogelijk een communicatief voordeel voor het publiek, maar verwarde dat met de functie van deelvragen in de onderzoeksopbouw."
          )
          key <- as.character(generated)
          msg <- feedbacks[[key]] %||% "❌ Geef een getal tussen 1 en 4 in."
          if (key %in% names(feedbacks) && generated != expected) {
            msg <- paste0(
              "**Waarom deze keuze begrijpelijk kan lijken:** ", likely_reasons[[key]], "\n\n",
              "**Waarom dit niet klopt:** ",
              msg,
              "\n\n**Denkregel:** Deelvragen moeten samen de centrale vraag beantwoorden; een methodekeuze of los detail is geen passende deelvraag.\n\n",
              "**Volgende stap:** Koppel elke optie aan een onderdeel van de centrale vraag en kies de optie die de brede vraag behapbaar maakt."
            )
          } else if (key %in% names(feedbacks) && generated == expected) {
            msg <- paste0(
              "**Bevestiging:** je gekozen optie is correct.\n\n",
              msg,
              "\n\n**Denkregel:** Een deelvraag maakt een afgebakend onderdeel van de centrale vraag onderzoekbaar zonder de hoofdvraag te vervangen.\n\n",
              "**Transferstap:** Splits een centrale vraag over recidive op in deelvragen over omvang, risicofactoren en groepsverschillen."
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
