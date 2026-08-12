context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        2,
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = paste0(
              "\u274c Fout. **Waarschijnlijke redenering:** je hebt mogelijk de aanwezigheid van verticale spreiding in Figuur A ",
              "als heteroscedasticiteit geïnterpreteerd. De spreiding verandert daar niet systematisch en de smoother is vrijwel vlak.\n\n",
              "**Beslisregel:** heteroscedasticiteit betekent dat de residuspreiding verandert met de geschatte waarden; ",
              "een systematisch stijgende of dalende smoother is daarvoor een signaal.\n\n",
              "**Volgende stap:** volg de rode lijn van links naar rechts. Alleen in Figuur B stijgt ze duidelijk.\n\n",
              "**Correct antwoord:** 2"
            ),
            "2" = paste0(
              "\u2705 Juist! **Figuur B** toont **heteroscedasticiteit**: de rode smoother stijgt, wat aangeeft ",
              "dat de spreiding van de residuen toeneemt bij hogere geschatte waarden.\n\n",
              "**Figuur A** vertoont geen probleem: de punten zijn gelijkmatig verspreid en de smoother is vlak."
            ),
            "3" = paste0(
              "\u274c Fout. **Waarschijnlijke redenering:** je hebt mogelijk elke spreiding van punten als een ongelijke variantie beoordeeld. ",
              "Bij homoscedasticiteit mogen residuen verspreid zijn; die spreiding moet vooral ongeveer constant blijven.\n\n",
              "**Beslisregel:** vergelijk de spreiding over de volledige x-as en beoordeel elke figuur apart. Vlak en gelijkmatig is passend; een trend is problematisch.\n\n",
              "**Volgende stap:** A blijft ongeveer gelijkmatig; B vertoont een stijgende smoother en dus toenemende spreiding.\n\n",
              "**Correct antwoord:** 2"
            ),
            "4" = paste0(
              "\u274c Fout. **Waarschijnlijke redenering:** je hebt mogelijk de puntenwolken globaal als vergelijkbaar gezien en de stijgende smoother in B onvoldoende meegewogen.\n\n",
              "**Beslisregel:** een duidelijke trend in de Scale-Location-smoother betekent dat de residuspreiding afhangt van de geschatte waarde.\n\n",
              "**Volgende stap:** vergelijk het begin en einde van de rode lijn in B; de hogere waarde rechts wijst op heteroscedasticiteit.\n\n",
              "**Correct antwoord:** 2"
            )
          )
          key <- as.character(generated)
          msg <- feedbacks[[key]] %||% "\u274c Geef een getal tussen 1 en 4 in."
          get_reporter()$add_message(msg, type = "markdown")
          generated == expected
        }
      )
    }
  )
})
