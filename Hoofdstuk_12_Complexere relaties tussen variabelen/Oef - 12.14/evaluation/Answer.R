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
              "\u274c Fout. **Model A** heeft **geen** multicollineariteitsprobleem \u2014 beide VIF-waarden ",
              "zijn circa 1,04, ruim onder de grens van 5.\n\n",
              "**Correct antwoord:** 2 \u2014 In Model B zijn beide VIF-waarden \u226534 (ver boven de grens van 10), ",
              "wat wijst op een ernstig multicollineariteitsprobleem."
            ),
            "2" = paste0(
              "\u2705 Juist! **Model B** heeft een ernstig multicollineariteitsprobleem: beide VIF-waarden ",
              "zijn ver boven 10 (circa 34). Dit komt doordat de samengestelde risicoschaal bijna volledig ",
              "lineair afhankelijk is van de ondersteuningsuren (r \u2248 0,99), waardoor de regressiecoëfficiënten ",
              "onbetrouwbaar worden.\n\n",
              "**Model A** heeft geen probleem: VIF \u2248 1,04 voor beide predictoren."
            ),
            "3" = paste0(
              "\u274c Fout. Niet beide modellen hebben een multicollineariteitsprobleem.\n\n",
              "**Model A** VIF-waarden zijn circa 1,04 \u2014 geen enkel probleem.\n\n",
              "**Model B** VIF-waarden zijn \u226534 \u2014 ernstig probleem.\n\n",
              "**Correct antwoord:** 2"
            ),
            "4" = paste0(
              "\u274c Fout. **Model B** heeft wel degelijk een ernstig multicollineariteitsprobleem. ",
              "VIF-waarden boven 10 wijzen op een problematische correlatie tussen de predictoren.\n\n",
              "Vergelijk: Model A VIF \u2248 1,04 (geen probleem) vs Model B VIF \u2248 34 (ernstig).\n\n",
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
