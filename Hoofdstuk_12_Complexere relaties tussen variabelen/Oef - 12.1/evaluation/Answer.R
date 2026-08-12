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
            "2" = "❌ Fout. **Waarschijnlijke redenering:** je hebt mogelijk de uiteindelijke uitkomst gekozen als vertrekpunt van het model. **Moreel oordeel** ontvangt echter pijlen en is hier endogeen.\n\n**Denkregel:** een exogene variabele heeft geen inkomende pijlen vanuit andere modelvariabelen.\n\n**Volgende stap:** controleer bij elke kandidaat eerst of er een pijlpunt naar de variabele wijst. Alleen Empathische bezorgdheid en Empathische perspectiefneming hebben geen inkomende pijlen.\n\n**Correct antwoord:** 1",
            "3" = "❌ Fout. **Waarschijnlijke redenering:** je hebt mogelijk de variabelen in het midden van de verklarende keten als startvariabelen gelezen. Deze morele intuïties en emoties ontvangen én sturen pijlen en zijn dus intermediair.\n\n**Denkregel:** exogeen = geen inkomende pijlen; intermediair = zowel inkomende als uitgaande pijlen.\n\n**Volgende stap:** volg de pijlen achterwaarts. Bij deze variabelen kom je nog bij andere modelvariabelen uit; bij de twee empathiedimensies niet.\n\n**Correct antwoord:** 1",
            "4" = "❌ Fout. **Waarschijnlijke redenering:** je hebt mogelijk variabelen met een directe pijl naar de uitkomst als exogeen beschouwd. Geanticipeerde schuld en Morele boosheid ontvangen zelf ook pijlen en zijn daarom intermediair.\n\n**Denkregel:** een uitgaande pijl alleen maakt een variabele niet exogeen; er mogen ook geen inkomende pijlen zijn.\n\n**Volgende stap:** inspecteer beide kanten van elke variabele en kies de variabelen zonder inkomende pijlen.\n\n**Correct antwoord:** 1"
          )
          key <- as.character(generated)
          msg <- feedbacks[[key]] %||% "❌ Geef een getal tussen 1 en 4 in."
          if (identical(generated, expected)) {
            msg <- paste0(msg, "\n\n**Bevestiging:** deze keuze komt overeen met de ongewijzigde antwoordsleutel.\n\n**Denkregel:** exogene variabelen hebben in het getekende model geen inkomende pijlen.\n\n**Transferstap:** classificeer in een nieuw padmodel elke variabele door eerst uitsluitend de inkomende pijlen te tellen.")
          } else if (key %in% names(feedbacks)) {
            msg <- sub("**Denkregel:**", "**Waarom dit niet klopt:** de gekozen set bevat minstens één variabele met een inkomende pijl en voldoet dus niet aan de definitie van exogeen.\n\n**Denkregel:**", msg, fixed = TRUE)
          } else {
          msg <- paste0(msg, "\n\n**Invoercontrole:** de invoer is leeg, niet-numeriek of buiten de aangeboden opties; daardoor kan geen inhoudelijke keuze worden vastgesteld.\n\n**Waarom dit niet klopt:** alleen één van de aangeboden optienummers kan met de antwoordsleutel worden beoordeeld.\n\n**Denkregel:** koppel eerst één geldige optie aan de regel 'geen inkomende pijlen'.\n\n**Volgende stap:** voer 1, 2, 3 of 4 in en controleer de pijlen opnieuw.")
          }
          get_reporter()$add_message(msg, type = "markdown")
          generated == expected
        }
      )
    }
  )
})
