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
            "1" = "❌ **Waarschijnlijke redenering:** je zag antwoordcategorieën en koppelde die daarom aan een nominale variabele. **Waarom dit niet past:** nominale categorieën hebben geen rangorde, terwijl de empathie-antwoorden wel lopen van 'heel onwaarschijnlijk' naar 'heel waarschijnlijk'. **Beslisregel:** kan je de categorieën betekenisvol ordenen? Zo ja, dan is de schaal niet nominaal.",
            
            "2" = "✅ Juist - **ordinaal** meetniveau met antwoordopties gaande van heel onwaarschijnlijk tot en met heel waarschijnlijk, de categorieën zijn ordenbaar maar de afstand tussen de categorieën is niet gelijk. Het verschil in betekenis tussen onwaarschijnlijk en neutraal is niet exact hetzelfde als tussen waarschijnlijk en heel waarschijnlijk. <a href='https://www.youtube.com/watch?v=KJPXZIEmvfA' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            
            "3" = "❌ **Waarschijnlijke redenering:** je behandelde de genummerde antwoordposities alsof de afstand tussen elke twee categorieën gelijk is. **Waarom dit niet past:** de categorieën zijn geordend, maar het betekenisverschil tussen 'onwaarschijnlijk' en 'neutraal' hoeft niet gelijk te zijn aan dat tussen 'waarschijnlijk' en 'heel waarschijnlijk'. **Beslisregel:** nummers op antwoordopties bewijzen geen gelijke intervallen; daarvoor moet gelijke afstand inhoudelijk verdedigbaar zijn. <a href='https://www.youtube.com/watch?v=KJPXZIEmvfA' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            
            "4" = "❌ **Waarschijnlijke redenering:** je interpreteerde het laagste antwoord als een echt nulpunt. **Waarom dit niet past:** 'heel onwaarschijnlijk' betekent niet dat empathie objectief nul is, en ook gelijke afstanden zijn niet aangetoond. **Beslisregel:** ratio vereist zowel gelijke intervallen als een werkelijk nulpunt waarbij afwezigheid van de eigenschap betekenisvol is."
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
