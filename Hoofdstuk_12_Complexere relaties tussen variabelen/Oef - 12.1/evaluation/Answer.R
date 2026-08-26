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
            "2" = "❌ Fout. **Waarschijnlijke redenering:** je hebt mogelijk de uiteindelijke uitkomst gekozen als vertrekpunt van het model.\n\n**Waarom dit niet klopt:** een uitkomst die pijlen ontvangt, voldoet niet aan de voorwaarde voor een exogene variabele.\n\n**Denkregel:** een exogene variabele heeft geen inkomende pijlen vanuit andere modelvariabelen.\n\n**Volgende stap:** controleer bij elke antwoordset uitsluitend of er pijlpunt(en) naar de genoemde variabelen wijzen en probeer opnieuw.",
            "3" = "❌ Fout. **Waarschijnlijke redenering:** je hebt mogelijk variabelen in het midden van de verklarende keten als startvariabelen gelezen.\n\n**Waarom dit niet klopt:** deze variabelen ontvangen én sturen pijlen en zijn daardoor tussenschakels, geen exogene startpunten.\n\n**Denkregel:** exogeen betekent geen inkomende pijlen; intermediair betekent zowel inkomende als uitgaande pijlen.\n\n**Volgende stap:** volg de pijlen voor elke kandidaat achterwaarts en selecteer alleen een antwoordset waarvan geen enkele variabele een inkomende pijl heeft.",
            "4" = "❌ Fout. **Waarschijnlijke redenering:** je hebt mogelijk variabelen met een directe pijl naar de uitkomst automatisch als exogeen beschouwd.\n\n**Waarom dit niet klopt:** een uitgaande pijl alleen volstaat niet; een exogene variabele mag ook geen inkomende pijlen hebben.\n\n**Denkregel:** inspecteer voor elke variabele eerst alle inkomende pijlen, onafhankelijk van haar positie in het diagram.\n\n**Volgende stap:** controleer beide zijden van de variabelen in iedere antwoordset en probeer opnieuw."
          )
          key <- as.character(generated)
          msg <- feedbacks[[key]] %||% "❌ Geef een getal tussen 1 en 4 in."
          if (identical(generated, expected)) {
            msg <- paste0(msg, "\n\n**Bevestiging:** deze keuze komt overeen met de ongewijzigde antwoordsleutel.\n\n**Denkregel:** exogene variabelen hebben in het getekende model geen inkomende pijlen.\n\n**Transferstap:** classificeer in een nieuw padmodel elke variabele door eerst uitsluitend de inkomende pijlen te tellen.")
          } else if (!key %in% names(feedbacks)) {
          msg <- paste0(msg, "\n\n**Controleer je invoer:** de invoer is leeg, niet-numeriek of buiten de aangeboden opties; daardoor kan geen inhoudelijke keuze worden vastgesteld.\n\n**Waarom dit niet klopt:** alleen één van de aangeboden optienummers kan met de antwoordsleutel worden beoordeeld.\n\n**Denkregel:** koppel eerst één geldige optie aan de regel 'geen inkomende pijlen'.\n\n**Volgende stap:** voer 1, 2, 3 of 4 in en controleer de pijlen opnieuw.")
          }
          get_reporter()$add_message(msg, type = "markdown")
          generated == expected
        }
      )
    }
  )
})
