context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        1,
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "Correct. Deze uitspraak is fout: Gamma kan geen waarden groter dan 1 aannemen, ook niet bij veel gelijke waarden. <a href='https://www.statisticshowto.com/gamma-coefficient-goodman-kruskal/' target='_blank' rel='noopener noreferrer'>Lees meer over Gamma</a>",
            "2" = "❌ Dit is niet de foute uitspraak. **Waarschijnlijke redenering:** je hebt mogelijk gedacht dat Gamma alleen de sterkte en niet de richting weergeeft. De verhouding tussen concordante en discordante paren bepaalt ook het teken.\n\n**Beslisregel:** meer concordante paren geeft positieve Gamma; meer discordante paren geeft negatieve Gamma.\n\n**Volgende stap:** behoud uitspraak 2 en controleer welke uitspraak het bereik [−1,+1] schendt. <a href='https://www.statisticshowto.com/gamma-coefficient-goodman-kruskal/' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            "3" = "❌ Dit is niet de foute uitspraak. **Waarschijnlijke redenering:** je hebt mogelijk het negeren van ties geïnterpreteerd als een mogelijkheid om buiten de correlatiegrenzen te vallen. Dat verandert het bereik niet.\n\n**Beslisregel:** Gamma = (C−D)/(C+D) en blijft daardoor tussen −1 en +1 wanneer de maat gedefinieerd is.\n\n**Volgende stap:** behoud uitspraak 3; de bewering dat Gamma boven 1 kan uitkomen is de onjuiste. <a href='https://www.statisticshowto.com/gamma-coefficient-goodman-kruskal/' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            "4" = "❌ Dit is niet de foute uitspraak. **Waarschijnlijke redenering:** je hebt mogelijk Gamma verward met een ordinale maat die ties expliciet in de noemer corrigeert. In de klassieke Gamma-berekening worden gebonden paren niet als concordant of discordant meegeteld.\n\n**Beslisregel:** bepaal per maat expliciet hoe ties worden behandeld; voor klassieke Gamma tellen C en D, niet de gebonden paren.\n\n**Volgende stap:** behoud uitspraak 4 en toets vervolgens uitspraak 1 aan het vaste bereik [−1,+1]. <a href='https://www.statisticshowto.com/gamma-coefficient-goodman-kruskal/' target='_blank' rel='noopener noreferrer'>Lees meer</a>"
          )
          key <- as.character(generated)
          msg <- feedbacks[[key]]
          if (is.null(msg)) {
            msg <- "Geef een getal tussen 1 en 4 in."
          }
          get_reporter()$add_message(msg, type = "markdown")
          generated == expected
        }
      )
    }
  )
})
