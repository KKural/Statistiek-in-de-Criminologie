context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        2,  # Correct answer: Q9 from your rotation pattern
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "❌ Fout. Het publiceren van negatieve resultaten gaat niet om het vullen van tijdschriften, maar om wetenschappelijke integriteit. Tijdschriften hebben al genoeg positieve resultaten om te publiceren - het probleem is juist dat negatieve resultaten vaak worden afgewezen.",
            
            "2" = "✅ Juist! Publicatiebias ontstaat wanneer alleen positieve resultaten gepubliceerd worden. Dit leidt tot een vertekend beeld: als 10 studies geen effect vinden en 1 studie wel, maar alleen die ene wordt gepubliceerd, lijkt het effect groter dan het is. Negatieve resultaten voorkomen ook dat onderzoekers dezelfde dure fouten herhalen.",
            
            "3" = "❌ Fout. Het doel is niet om onderzoekers te ontmoedigen. Integendeel: negatieve resultaten helpen onderzoekers om betere hypotheses te formuleren, methoden te verbeteren, en nieuwe onderzoeksrichtingen te vinden. Ze zijn leerzaam, niet ontmoedigend.",
            
            "4" = "❌ Fout. Negatieve resultaten zijn niet automatisch betrouwbaarder dan positieve. Beide kunnen even valide zijn, afhankelijk van de onderzoekskwaliteit. Het punt is dat beide soorten resultaten nodig zijn voor een compleet beeld van de werkelijkheid."
          )
          
          likely_reasons <- list(
            "1" = "je dacht mogelijk dat meer publiceerbare inhoud het voornaamste voordeel is, omdat negatieve resultaten extra artikelen opleveren.",
            "3" = "je associeerde ‘negatief resultaat’ mogelijk met ontmoediging of mislukking, terwijl zo’n resultaat juist hypotheses en methoden kan verbeteren.",
            "4" = "je zag een afwezig effect mogelijk als voorzichtiger en daarom betrouwbaarder, maar betrouwbaarheid hangt van de onderzoekskwaliteit af."
          )
          key <- as.character(generated)
          msg <- feedbacks[[key]] %||% "❌ Geef een getal tussen 1 en 4 in."
          if (key %in% names(feedbacks) && generated != expected) {
            msg <- paste0(
              "**Waarom deze keuze begrijpelijk kan lijken:** ", likely_reasons[[key]], "\n\n",
              "**Waarom dit niet klopt:** ",
              msg,
              "\n\n**Denkregel:** Beoordeel alle uitgevoerde studies, niet alleen studies met een significant of positief resultaat.\n\n",
              "**Volgende stap:** Vergelijk welke positieve en nulresultaten in het gepubliceerde beeld ontbreken en kies de optie die publicatiebias benoemt."
            )
          } else if (key %in% names(feedbacks) && generated == expected) {
            msg <- paste0(
              "**Bevestiging:** je gekozen optie is correct.\n\n",
              msg,
              "\n\n**Denkregel:** Selectieve publicatie van positieve bevindingen veroorzaakt publicatiebias en overschat de zichtbaarheid van effecten.\n\n",
              "**Transferstap:** Leg uit hoe preregistratie en publicatie van nulresultaten het bewijs over een preventieprogramma evenwichtiger maken."
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
