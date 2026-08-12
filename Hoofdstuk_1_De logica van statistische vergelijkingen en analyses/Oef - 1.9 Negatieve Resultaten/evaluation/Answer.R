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
          
          key <- as.character(generated)
          msg <- feedbacks[[key]] %||% "❌ Geef een getal tussen 1 en 4 in."
          if (key %in% names(feedbacks) && generated != expected) {
            msg <- paste0(
              "**Mogelijke denkroute:** je keuze kan aantrekkelijk zijn omdat één bekende eigenschap passend lijkt, terwijl het beslissende criterium van de vraag nog niet is toegepast.\n\n",
              msg,
              "\n\n**Versterk je denkstap:** benoem vóór je opnieuw antwoordt (1) het kernbegrip, (2) de beslissende eigenschap en (3) waarom jouw gekozen optie daar wel of niet aan voldoet."
            )
          } else if (key %in% names(feedbacks) && generated == expected) {
            msg <- paste0(
              msg,
              "\n\n**Versterk je redenering:** formuleer de beslissende eigenschap in je eigen woorden, zodat je dezelfde regel in een nieuwe criminologische context kunt toepassen."
            )
          }
          
          get_reporter()$add_message(msg, type = "markdown")
          
          generated == expected
        }
      )
    }
  )
})
