# **Bevestiging:** correct-route feedback below confirms the result before the Denkregel and Transferstap.
context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        4,  # Correct answer: 4) 45 jaar
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "❌ Fout. **Waarschijnlijke redenering:** 42.5 jaar komt overeen met een kleinere positieve Z-score; je hebt mogelijk een lager percentiel gebruikt dan het 90ste percentiel.\n\n**Waarom dit niet klopt:** een lagere percentielgrens laat meer dan 10% van de verdeling erboven en selecteert dus niet uitsluitend de oudste 10%.\n\n**Denkregel:** ‘oudste 10%’ begint waar 90% jonger is, dus bij de 90ste percentielgrens met z ≈ 1.28.\n\n**Volgende stap:** bereken X = 37.8 + 1.28×5.6 ≈ **45 jaar**.\n\n**Correct antwoord:** 4. <a href='https://www.statisticshowto.com/probability-and-statistics/normal-distributions/' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            
            "2" = "❌ Fout. **Waarschijnlijke redenering:** 47 jaar is consistent met ongeveer z = 1.65; je hebt mogelijk de grens voor de hoogste 5% gebruikt in plaats van die voor de hoogste 10%.\n\n**Waarom dit niet klopt:** z≈1.65 laat ongeveer 5% boven de grens en beantwoordt daarom een strengere selectie dan de gevraagde oudste 10%.\n\n**Denkregel:** een bovengrens van 10% hoort bij de cumulatieve kans 0.90 en z ≈ 1.28; z ≈ 1.65 hoort bij ongeveer 0.95.\n\n**Volgende stap:** vervang 1.65 door 1.28 in X = μ + zσ: 37.8 + 1.28×5.6 ≈ **45 jaar**.\n\n**Correct antwoord:** 4. <a href='https://www.statisticshowto.com/probability-and-statistics/normal-distributions/' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            
            "3" = "❌ Fout. **Waarschijnlijke redenering:** je hebt mogelijk een grens van ongeveer twee standaardafwijkingen boven het gemiddelde gebruikt. Dat selecteert een veel kleinere bovenstaart dan 10%.\n\n**Waarom dit niet klopt:** z≈2 laat slechts ongeveer 2.3% boven de grens, waardoor de geselecteerde groep veel kleiner is dan gevraagd.\n\n**Denkregel:** bepaal de Z-score vanuit het gevraagde staartpercentage; gebruik niet automatisch z = 2. Voor de oudste 10% is z ≈ 1.28.\n\n**Volgende stap:** vul z = 1.28 in: X = 37.8 + 1.28×5.6 ≈ **45 jaar**.\n\n**Correct antwoord:** 4. <a href='https://www.statisticshowto.com/probability-and-statistics/normal-distributions/' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            
            "4" = "**Bevestiging:** ✅ **Juist!** De gevangenen vanaf de leeftijd van **45 jaar** vormen inderdaad de oudste 10% van deze gevangenispopulatie. Met μ = 37.8 en σ = 5.6 jaar, en gebruik van het **90ste percentiel** (z ≈ 1.28), berekenen we: X = 37.8 + (1.28 × 5.6) ≈ 45 jaar. Dit betekent dat ongeveer **10% van alle gedetineerden** 45 jaar of ouder is, wat deze groep geschikt maakt voor de **gerichteerde bevraging** van de gevangenisdirecteur. Dit is een praktisch voorbeeld van hoe **normale verdelingen** gebruikt worden in **criminologisch onderzoek** voor steekproefplanning. <a href='https://www.statisticshowto.com/probability-and-statistics/normal-distributions/' target='_blank' rel='noopener noreferrer'>Lees meer</a>\n\n**Denkregel:** zet ‘hoogste q%’ om naar de cumulatieve grens 1−q en gebruik daarna X=μ+zσ.\n\n**Transferstap:** bereken met dezelfde regel de grens voor de oudste 5% en verklaar waarom die hoger ligt.",
            
            "5" = "❌ Fout. **Waarschijnlijke redenering:** je dacht mogelijk dat individuele leeftijden of de populatieomvang nodig zijn. Voor een theoretische percentielgrens volstaan echter de gespecificeerde normale verdeling en het gewenste percentage.\n\n**Waarom dit niet klopt:** de theoretische percentielgrens wordt volledig bepaald door μ, σ en de cumulatieve kans; ruwe leeftijden of populatieomvang zijn daarvoor niet vereist.\n\n**Denkregel:** bij een normale verdeling bepalen μ, σ en de cumulatieve kans samen de grens via X = μ + zσ.\n\n**Volgende stap:** zet ‘oudste 10%’ om naar het 90ste percentiel, zoek z ≈ 1.28 en bereken X ≈ **45 jaar**.\n\n**Correct antwoord:** 4. <a href='https://www.statisticshowto.com/probability-and-statistics/normal-distributions/' target='_blank' rel='noopener noreferrer'>Lees meer</a>"
          )
          
          key <- as.character(generated)
          msg <- feedbacks[[key]] %||% "❌ Geef een getal tussen 1 en 5 in."
          
          if (!key %in% names(feedbacks)) {
            msg <- paste0(
              "**Invoercontrole:** je invoer lijkt niet overeen te komen met één van de aangeboden optienummers; dit kan een typefout of een andere invoerinterpretatie zijn.\n\n",
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
