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
            "1" = "❌ **Je antwoord draait de toepassingsregel om.**\n\n**Waarom dit fout is:** kruistabellen werken juist goed voor variabelen met een beperkt aantal nominale of ordinale categorieën. Bij veel unieke metrische waarden ontstaan te veel rijen en kolommen.\n\n**Denkregel:** weinig categorieën → kruistabel; veel numerieke waarden → meestal scatterplot. <a href='https://statisticsbyjim.com/graphs/scatterplots/' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            "2" = "✅ **Juist.** Metrische variabelen hebben vaak veel mogelijke waarden, waardoor een kruistabel snel onleesbaar wordt; een scatterplot bewaart de numerieke informatie en maakt patronen zichtbaar.\n\n**Versterk je redenering:** kies de weergave op basis van het meetniveau én het aantal unieke waarden. <a href='https://statisticsbyjim.com/graphs/scatterplots/' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            "3" = "❌ **Je keuze suggereert dat veel numerieke waarden visualisatie onmogelijk maken.**\n\n**Waarom dit fout is:** precies bij metrische variabelen helpt een puntenwolk om richting, vorm, sterkte en uitschieters te zien.\n\n**Denkregel:** als beide assen numerieke afstanden hebben, probeer eerst een scatterplot. <a href='https://statisticsbyjim.com/graphs/scatterplots/' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            "4" = "❌ **Je antwoord verwart de inhoud van een tabel met de keuze van de tabelvorm.**\n\n**Waarom dit fout is:** een kruistabel kan aantallen, rijpercentages of kolompercentages tonen; ‘altijd percentages’ is geen meetniveauregel.\n\n**Denkregel:** kies eerst de tabelvorm op basis van de variabelen en daarna aantallen of percentages op basis van de onderzoeksvraag. <a href='https://statisticsbyjim.com/graphs/scatterplots/' target='_blank' rel='noopener noreferrer'>Lees meer</a>"
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
