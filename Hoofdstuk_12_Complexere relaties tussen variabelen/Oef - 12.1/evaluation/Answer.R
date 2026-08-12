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
            "1" = "✅ Juist! **Empathische bezorgdheid** en **Empathische perspectiefneming** zijn de exogene variabelen. Zij ontvangen geen pijlen vanuit andere modelvariabelen — zij vormen het vertrekpunt van de verklarende keten.",
            "2" = "❌ Fout. **Waarschijnlijke redenering:** je hebt mogelijk de uiteindelijke uitkomst gekozen als vertrekpunt van het model. **Moreel oordeel** ontvangt echter pijlen en is hier endogeen.\n\n**Beslisregel:** een exogene variabele heeft geen inkomende pijlen vanuit andere modelvariabelen.\n\n**Volgende stap:** controleer bij elke kandidaat eerst of er een pijlpunt naar de variabele wijst. Alleen Empathische bezorgdheid en Empathische perspectiefneming hebben geen inkomende pijlen.\n\n**Correct antwoord:** 1",
            "3" = "❌ Fout. **Waarschijnlijke redenering:** je hebt mogelijk de variabelen in het midden van de verklarende keten als startvariabelen gelezen. Deze morele intuïties en emoties ontvangen én sturen pijlen en zijn dus intermediair.\n\n**Beslisregel:** exogeen = geen inkomende pijlen; intermediair = zowel inkomende als uitgaande pijlen.\n\n**Volgende stap:** volg de pijlen achterwaarts. Bij deze variabelen kom je nog bij andere modelvariabelen uit; bij de twee empathiedimensies niet.\n\n**Correct antwoord:** 1",
            "4" = "❌ Fout. **Waarschijnlijke redenering:** je hebt mogelijk variabelen met een directe pijl naar de uitkomst als exogeen beschouwd. Geanticipeerde schuld en Morele boosheid ontvangen zelf ook pijlen en zijn daarom intermediair.\n\n**Beslisregel:** een uitgaande pijl alleen maakt een variabele niet exogeen; er mogen ook geen inkomende pijlen zijn.\n\n**Volgende stap:** inspecteer beide kanten van elke variabele en kies de variabelen zonder inkomende pijlen.\n\n**Correct antwoord:** 1"
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
