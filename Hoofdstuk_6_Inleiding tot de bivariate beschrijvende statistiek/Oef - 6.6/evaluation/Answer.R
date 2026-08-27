# **Bevestiging:** correct-option feedback below confirms the answer and its conceptual basis.
context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        2, # Correct answer: kruistabel onleesbaar bij metrische variabelen
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "❌ **Waarschijnlijke redenering:** **Je antwoord draait de toepassingsregel om.** Dit is een voorzichtige hypothese op basis van je keuze; dezelfde optie kan ook om een andere reden zijn gekozen.\n\n**Waarom dit niet klopt:** kruistabellen werken juist goed voor variabelen met een beperkt aantal nominale of ordinale categorieën. Bij veel unieke metrische waarden ontstaan te veel rijen en kolommen.\n\n**Denkregel:** weinig categorieën → kruistabel; veel numerieke waarden → meestal scatterplot. <a href='https://statisticsbyjim.com/graphs/scatterplots/' target='_blank' rel='noopener noreferrer'>Lees meer</a>\n\n**Volgende stap:** pas de denkregel toe op een nieuw criminologisch voorbeeld en benoem het beslissende criterium vóór je kiest.",
            "2" = "**Bevestiging:** ✅ **Juist.** Metrische variabelen hebben vaak veel mogelijke waarden, waardoor een kruistabel snel onleesbaar wordt; een scatterplot bewaart de numerieke informatie en maakt patronen zichtbaar.\n\n**Denkregel:** kies de weergave op basis van het meetniveau én het aantal unieke waarden. <a href='https://statisticsbyjim.com/graphs/scatterplots/' target='_blank' rel='noopener noreferrer'>Lees meer</a>\n\n**Transferstap:** formuleer dezelfde regel voor een nieuw criminologisch voorbeeld en noteer welk gegeven je daarvoor eerst moet controleren.",
            "3" = "❌ **Waarschijnlijke redenering:** **Je keuze suggereert dat veel numerieke waarden visualisatie onmogelijk maken.** Dit is een voorzichtige hypothese op basis van je keuze; dezelfde optie kan ook om een andere reden zijn gekozen.\n\n**Waarom dit niet klopt:** precies bij metrische variabelen helpt een puntenwolk om richting, vorm, sterkte en uitschieters te zien.\n\n**Denkregel:** als beide assen numerieke afstanden hebben, probeer eerst een scatterplot. <a href='https://statisticsbyjim.com/graphs/scatterplots/' target='_blank' rel='noopener noreferrer'>Lees meer</a>\n\n**Volgende stap:** pas de denkregel toe op een nieuw criminologisch voorbeeld en benoem het beslissende criterium vóór je kiest.",
            "4" = "❌ **Waarschijnlijke redenering:** **Je antwoord verwart de inhoud van een tabel met de keuze van de tabelvorm.** Dit is een voorzichtige hypothese op basis van je keuze; dezelfde optie kan ook om een andere reden zijn gekozen.\n\n**Waarom dit niet klopt:** een kruistabel kan aantallen, rijpercentages of kolompercentages tonen; ‘altijd percentages’ is geen meetniveauregel.\n\n**Denkregel:** kies eerst de tabelvorm op basis van de variabelen en daarna aantallen of percentages op basis van de onderzoeksvraag. <a href='https://statisticsbyjim.com/graphs/scatterplots/' target='_blank' rel='noopener noreferrer'>Lees meer</a>\n\n**Volgende stap:** pas de denkregel toe op een nieuw criminologisch voorbeeld en benoem het beslissende criterium vóór je kiest."
          )
          key <- as.character(generated)
          msg <- feedbacks[[key]] %||% "❌ Geef een getal tussen 1 en 4 in."
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
