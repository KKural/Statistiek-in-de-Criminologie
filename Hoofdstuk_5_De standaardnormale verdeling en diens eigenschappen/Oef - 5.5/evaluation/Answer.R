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
            "1" = "❌ Fout. **Waarschijnlijke redenering:** je hebt mogelijk een percentielgrens gekozen die niet overeenkomt met de gevraagde bovenstaart.\n\n**Waarom dit niet klopt:** deze grens laat een groter aandeel dan 10% van de verdeling erboven en selecteert dus niet uitsluitend de oudste 10%.\n\n**Denkregel:** zet een gevraagde hoogste fractie eerst om naar de bijbehorende cumulatieve kans links van de grens.\n\n**Volgende stap:** bepaal opnieuw welk percentiel precies 10% boven zich laat en gebruik daarna de bijbehorende Z-score in `X = μ + zσ`. <a href='https://www.statisticshowto.com/probability-and-statistics/normal-distributions/' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            
            "2" = "❌ Fout. **Waarschijnlijke redenering:** je hebt mogelijk een grens voor een kleinere bovenstaart gekozen.\n\n**Waarom dit niet klopt:** een kleinere bovenstaart gebruikt een hogere grens en selecteert minder dan de gevraagde 10% van de populatie.\n\n**Denkregel:** controleer vóór de berekening of het gebied boven de gekozen Z-grens gelijk is aan het gevraagde percentage.\n\n**Volgende stap:** zoek de Z-score waarbij precies 10% rechts van de grens ligt en bereken de leeftijd opnieuw zonder tussentijds af te ronden. <a href='https://www.statisticshowto.com/probability-and-statistics/normal-distributions/' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            
            "3" = "❌ Fout. **Waarschijnlijke redenering:** je hebt mogelijk automatisch een grens van ongeveer twee standaardafwijkingen boven het gemiddelde gebruikt.\n\n**Waarom dit niet klopt:** zo'n grens hoort bij een veel kleinere bovenstaart dan 10%, waardoor de geselecteerde groep te klein wordt.\n\n**Denkregel:** bepaal de Z-score vanuit het gevraagde staartpercentage; gebruik geen vaste vuistregel zonder het bijbehorende oppervlak te controleren.\n\n**Volgende stap:** teken of markeer eerst de bovenste 10% van de normale verdeling en zoek vervolgens de passende Z-grens. <a href='https://www.statisticshowto.com/probability-and-statistics/normal-distributions/' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            
            "4" = "**Bevestiging:** ✅ **Juist!** De gevangenen vanaf de leeftijd van **45 jaar** vormen inderdaad de oudste 10% van deze gevangenispopulatie. Met μ = 37.8 en σ = 5.6 jaar, en gebruik van het **90ste percentiel** (z ≈ 1.28), berekenen we: X = 37.8 + (1.28 × 5.6) ≈ 45 jaar. Dit betekent dat ongeveer **10% van alle gedetineerden** 45 jaar of ouder is, wat deze groep geschikt maakt voor de **gerichteerde bevraging** van de gevangenisdirecteur. Dit is een praktisch voorbeeld van hoe **normale verdelingen** gebruikt worden in **criminologisch onderzoek** voor steekproefplanning. <a href='https://www.statisticshowto.com/probability-and-statistics/normal-distributions/' target='_blank' rel='noopener noreferrer'>Lees meer</a>\n\n**Denkregel:** zet ‘hoogste q%’ om naar de cumulatieve grens 1−q en gebruik daarna X=μ+zσ.\n\n**Transferstap:** bereken met dezelfde regel de grens voor de oudste 5% en verklaar waarom die hoger ligt.",
            
            "5" = "❌ Fout. **Waarschijnlijke redenering:** je dacht mogelijk dat individuele leeftijden of de populatieomvang nodig zijn.\n\n**Waarom dit niet klopt:** voor een theoretische percentielgrens volstaan het gemiddelde, de standaardafwijking, de verdelingsvorm en het gewenste aandeel.\n\n**Denkregel:** bij een normale verdeling bepalen `μ`, `σ` en de cumulatieve kans samen de grens via `X = μ + zσ`.\n\n**Volgende stap:** vertaal de oudste 10% naar een cumulatieve kans, zoek de bijbehorende Z-score en voer daarna de berekening uit. <a href='https://www.statisticshowto.com/probability-and-statistics/normal-distributions/' target='_blank' rel='noopener noreferrer'>Lees meer</a>"
          )
          
          key <- as.character(generated)
          msg <- feedbacks[[key]] %||% "❌ Geef een getal tussen 1 en 5 in."
          
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
