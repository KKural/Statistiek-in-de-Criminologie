context({
  testcase(
    " ",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        4,  # Correct answer: 4) 45 jaar
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "❌ **Fout.** 42.5 jaar is **te laag** voor de oudste 10% van deze gevangenispopulatie. Met een **gemiddelde leeftijd** van 37.8 jaar en een **standaardafwijking** van 5.6 jaar betekent dit dat je mogelijk een **fout** hebt gemaakt in de berekening van het **90ste percentiel**. Voor de oudste 10% moet je het punt vinden waarbij 90% van de populatie jonger is. Dit vereist de juiste **z-score** (ongeveer 1.28) uit de standaardnormale verdeling. <a href='https://www.statisticshowto.com/probability-and-statistics/percentiles-rank-range/' target='_blank' rel='noopener noreferrer'>Lees meer over percentielen</a>",
            
            "2" = "❌ **Fout.** 47 jaar is **te hoog** en zou resulteren in een veel **kleiner percentage** dan de gewenste 10%. Bij deze leeftijdsgrens zou je waarschijnlijk slechts **5-6% van de populatie** selecteren in plaats van 10%. Dit suggereert dat je mogelijk de **95ste percentiel** (z ≈ 1.65) hebt gebruikt in plaats van het **90ste percentiel** (z ≈ 1.28). In **criminologisch onderzoek** is het cruciaal om de juiste **percentielgrenzen** te gebruiken voor representatieve steekproeven. <a href='https://www.khanacademy.org/math/ap-statistics/density-curves-normal-distribution-ap/measuring-position/v/z-score-introduction' target='_blank' rel='noopener noreferrer'>Lees meer over z-scores</a>",
            
            "3" = "❌ **Fout.** 50 jaar is **veel te hoog** en zou slechts een **zeer klein percentage** van de gevangenispopulatie omvatten - waarschijnlijk minder dan **2-3%** in plaats van de gewenste 10%. Deze leeftijd ligt meer dan **2 standaardafwijkingen** boven het gemiddelde (37.8 + 2×5.6 = 48.6), wat betekent dat je ver buiten het **90ste percentiel** zit. In de praktijk zou dit betekenen dat de **steekproef te klein** wordt voor betrouwbare conclusies over de oudere gedetineerden. <a href='https://www.statisticshowto.com/probability-and-statistics/standard-deviation/' target='_blank' rel='noopener noreferrer'>Lees meer over standaardafwijkingen</a>",
            
            "4" = "✅ **Juist!** De gevangenen vanaf de leeftijd van **45 jaar** vormen inderdaad de oudste 10% van deze gevangenispopulatie. Met μ = 37.8 en σ = 5.6 jaar, en gebruik van het **90ste percentiel** (z ≈ 1.28), berekenen we: X = 37.8 + (1.28 × 5.6) ≈ 45 jaar. Dit betekent dat ongeveer **10% van alle gedetineerden** 45 jaar of ouder is, wat deze groep geschikt maakt voor de **gerichteerde bevraging** van de gevangenisdirecteur. Dit is een praktisch voorbeeld van hoe **normale verdelingen** gebruikt worden in **criminologisch onderzoek** voor steekproefplanning. <a href='https://www.statisticshowto.com/probability-and-statistics/normal-distributions/' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            
            "5" = "❌ **Fout.** Deze opgave is **wel degelijk oplosbaar**! We hebben alle benodigde informatie voor een **normale verdeling berekening**: het **gemiddelde** (μ = 37.8 jaar), de **standaardafwijking** (σ = 5.6 jaar), en de gewenste **percentielgrens** (oudste 10% = 90ste percentiel). In **criminologische statistiek** zijn dit de **standaardingrediënten** voor percentielberekeningen. Het proces vereist het opzoeken van de juiste z-score en toepassing van de formule X = μ + z×σ. Dit is een **fundamentele vaardigheid** voor onderzoeksplanning in de criminologie. <a href='https://openstax.org/books/statistics/pages/6-1-the-standard-normal-distribution' target='_blank' rel='noopener noreferrer'>Lees meer over normale verdeling</a>"
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
