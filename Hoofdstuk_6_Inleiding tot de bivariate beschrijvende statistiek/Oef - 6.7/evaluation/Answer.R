# **Bevestiging:** correct-option feedback below confirms the answer and its conceptual basis.
context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        2, # Correct answer: meetniveau + theoretische richting
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "❌ **Waarschijnlijke redenering:** **Je keuze bevat relevante kwaliteitsinformatie, maar niet de beslisregel voor het type associatiemaat.** Dit is een voorzichtige hypothese op basis van je keuze; dezelfde optie kan ook om een andere reden zijn gekozen.\n\n**Waarom dit niet klopt:** steekproefgrootte en trekking beïnvloeden precisie en generaliseerbaarheid; ze bepalen niet of de maat bijvoorbeeld nominaal, ordinaal of metrisch moet zijn.\n\n**Denkregel:** kies eerst op meetniveau en theoretische richting; beoordeel daarna steekproefkwaliteit. <a href='https://www.statisticssolutions.com/free-resources/directory-of-statistical-analyses/measures-of-association/' target='_blank' rel='noopener noreferrer'>Lees meer</a>\n\n**Volgende stap:** pas de denkregel toe op een nieuw criminologisch voorbeeld en benoem het beslissende criterium vóór je kiest.",
            "2" = "**Bevestiging:** ✅ **Juist.** De keuze steunt op twee vragen: welk meetniveau hebben de variabelen, en is de relatie theoretisch symmetrisch of asymmetrisch?\n\n**Denkregel:** noteer vóór elke keuze: *meetniveau X/Y* en *richting ja/nee*. <a href='https://www.statisticssolutions.com/free-resources/directory-of-statistical-analyses/measures-of-association/' target='_blank' rel='noopener noreferrer'>Lees meer</a>\n\n**Transferstap:** formuleer dezelfde regel voor een nieuw criminologisch voorbeeld en noteer welk gegeven je daarvoor eerst moet controleren.",
            "3" = "❌ **Waarschijnlijke redenering:** **Je antwoord suggereert dat je de bouwstenen van een kruistabel gebruikt als keuzecriterium voor de associatiemaat.** Dit is een voorzichtige hypothese op basis van je keuze; dezelfde optie kan ook om een andere reden zijn gekozen.\n\n**Waarom dit niet klopt:** celfrequenties en totalen helpen bij berekening en interpretatie, maar de soort maat volgt eerst uit meetniveau en richting.\n\n**Denkregel:** onderscheid *welke maat past?* van *hoe bereken en beoordeel ik haar?* <a href='https://www.statisticssolutions.com/free-resources/directory-of-statistical-analyses/measures-of-association/' target='_blank' rel='noopener noreferrer'>Lees meer</a>\n\n**Volgende stap:** pas de denkregel toe op een nieuw criminologisch voorbeeld en benoem het beslissende criterium vóór je kiest.",
            "4" = "❌ **Waarschijnlijke redenering:** **Je keuze verwart een grafische conventie met een inhoudelijke beslisregel.** Dit is een voorzichtige hypothese op basis van je keuze; dezelfde optie kan ook om een andere reden zijn gekozen.\n\n**Waarom dit niet klopt:** de keuze van X- en Y-as verandert niet het meetniveau; alleen bij een theoretisch gerichte relatie zijn de rollen van verklarende en afhankelijke variabele relevant.\n\n**Denkregel:** bepaal eerst meetniveau en theoretische richting; kies daarna pas de visualisatie. <a href='https://www.statisticssolutions.com/free-resources/directory-of-statistical-analyses/measures-of-association/' target='_blank' rel='noopener noreferrer'>Lees meer</a>\n\n**Volgende stap:** pas de denkregel toe op een nieuw criminologisch voorbeeld en benoem het beslissende criterium vóór je kiest."
          )
          key <- as.character(generated)
          msg <- feedbacks[[key]] %||% "❌ Geef een getal tussen 1 en 4 in."
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
