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
            "1" = "❌ Fout. **Waarschijnlijke redenering:** 42.5 jaar komt overeen met een kleinere positieve Z-score; je hebt mogelijk een lager percentiel gebruikt dan het 90ste percentiel.\n\n**Beslisregel:** ‘oudste 10%’ begint waar 90% jonger is, dus bij de 90ste percentielgrens met z ≈ 1.28.\n\n**Volgende stap:** bereken X = 37.8 + 1.28×5.6 ≈ **45 jaar**.\n\n**Correct antwoord:** 4. <a href='https://www.statisticshowto.com/probability-and-statistics/normal-distributions/' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            
            "2" = "❌ Fout. **Waarschijnlijke redenering:** 47 jaar is consistent met ongeveer z = 1.65; je hebt mogelijk de grens voor de hoogste 5% gebruikt in plaats van die voor de hoogste 10%.\n\n**Beslisregel:** een bovengrens van 10% hoort bij de cumulatieve kans 0.90 en z ≈ 1.28; z ≈ 1.65 hoort bij ongeveer 0.95.\n\n**Volgende stap:** vervang 1.65 door 1.28 in X = μ + zσ: 37.8 + 1.28×5.6 ≈ **45 jaar**.\n\n**Correct antwoord:** 4. <a href='https://www.statisticshowto.com/probability-and-statistics/normal-distributions/' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            
            "3" = "❌ Fout. **Waarschijnlijke redenering:** je hebt mogelijk een grens van ongeveer twee standaardafwijkingen boven het gemiddelde gebruikt. Dat selecteert een veel kleinere bovenstaart dan 10%.\n\n**Beslisregel:** bepaal de Z-score vanuit het gevraagde staartpercentage; gebruik niet automatisch z = 2. Voor de oudste 10% is z ≈ 1.28.\n\n**Volgende stap:** vul z = 1.28 in: X = 37.8 + 1.28×5.6 ≈ **45 jaar**.\n\n**Correct antwoord:** 4. <a href='https://www.statisticshowto.com/probability-and-statistics/normal-distributions/' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            
            "4" = "✅ **Juist!** De gevangenen vanaf de leeftijd van **45 jaar** vormen inderdaad de oudste 10% van deze gevangenispopulatie. Met μ = 37.8 en σ = 5.6 jaar, en gebruik van het **90ste percentiel** (z ≈ 1.28), berekenen we: X = 37.8 + (1.28 × 5.6) ≈ 45 jaar. Dit betekent dat ongeveer **10% van alle gedetineerden** 45 jaar of ouder is, wat deze groep geschikt maakt voor de **gerichteerde bevraging** van de gevangenisdirecteur. Dit is een praktisch voorbeeld van hoe **normale verdelingen** gebruikt worden in **criminologisch onderzoek** voor steekproefplanning. <a href='https://www.statisticshowto.com/probability-and-statistics/normal-distributions/' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            
            "5" = "❌ Fout. **Waarschijnlijke redenering:** je dacht mogelijk dat individuele leeftijden of de populatieomvang nodig zijn. Voor een theoretische percentielgrens volstaan echter de gespecificeerde normale verdeling en het gewenste percentage.\n\n**Beslisregel:** bij een normale verdeling bepalen μ, σ en de cumulatieve kans samen de grens via X = μ + zσ.\n\n**Volgende stap:** zet ‘oudste 10%’ om naar het 90ste percentiel, zoek z ≈ 1.28 en bereken X ≈ **45 jaar**.\n\n**Correct antwoord:** 4. <a href='https://www.statisticshowto.com/probability-and-statistics/normal-distributions/' target='_blank' rel='noopener noreferrer'>Lees meer</a>"
          )
          
          key <- as.character(generated)
          msg <- feedbacks[[key]] %||% "❌ Geef een getal tussen 1 en 5 in."
          
          get_reporter()$add_message(msg, type = "markdown")
          
          generated == expected
        }
      )
    }
  )
})
