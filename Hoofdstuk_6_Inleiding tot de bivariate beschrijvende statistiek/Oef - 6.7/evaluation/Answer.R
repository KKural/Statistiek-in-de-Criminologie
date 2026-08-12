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
            "1" = "❌ **Je keuze bevat relevante kwaliteitsinformatie, maar niet de beslisregel voor het type associatiemaat.**\n\n**Waarom dit fout is:** steekproefgrootte en trekking beïnvloeden precisie en generaliseerbaarheid; ze bepalen niet of de maat bijvoorbeeld nominaal, ordinaal of metrisch moet zijn.\n\n**Denkregel:** kies eerst op meetniveau en theoretische richting; beoordeel daarna steekproefkwaliteit. <a href='https://www.statisticssolutions.com/free-resources/directory-of-statistical-analyses/measures-of-association/' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            "2" = "✅ **Juist.** De keuze steunt op twee vragen: welk meetniveau hebben de variabelen, en is de relatie theoretisch symmetrisch of asymmetrisch?\n\n**Versterk je redenering:** noteer vóór elke keuze: *meetniveau X/Y* en *richting ja/nee*. <a href='https://www.statisticssolutions.com/free-resources/directory-of-statistical-analyses/measures-of-association/' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            "3" = "❌ **Je antwoord suggereert dat je de bouwstenen van een kruistabel gebruikt als keuzecriterium voor de associatiemaat.**\n\n**Waarom dit fout is:** celfrequenties en totalen helpen bij berekening en interpretatie, maar de soort maat volgt eerst uit meetniveau en richting.\n\n**Denkregel:** onderscheid *welke maat past?* van *hoe bereken en beoordeel ik haar?* <a href='https://www.statisticssolutions.com/free-resources/directory-of-statistical-analyses/measures-of-association/' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            "4" = "❌ **Je keuze verwart een grafische conventie met een inhoudelijke beslisregel.**\n\n**Waarom dit fout is:** de keuze van X- en Y-as verandert niet het meetniveau; alleen bij een theoretisch gerichte relatie zijn de rollen van verklarende en afhankelijke variabele relevant.\n\n**Denkregel:** bepaal eerst meetniveau en theoretische richting; kies daarna pas de visualisatie. <a href='https://www.statisticssolutions.com/free-resources/directory-of-statistical-analyses/measures-of-association/' target='_blank' rel='noopener noreferrer'>Lees meer</a>"
          )
          key <- as.character(generated)
          msg <- feedbacks[[key]] %||% "❌ Geef een getal tussen 1 en 4 in."
          get_reporter()$add_message(msg, type = "markdown")
          generated == expected
        }
      )
    }
  )
})
