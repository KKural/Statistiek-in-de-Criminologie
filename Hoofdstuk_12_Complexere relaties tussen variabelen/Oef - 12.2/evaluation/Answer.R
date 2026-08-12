context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        2,  # Correct answer: Endogeen
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "❌ Fout. **Waarschijnlijke redenering:** je hebt mogelijk de startvariabelen gekozen omdat ze de rest van het model beïnvloeden. Empathische bezorgdheid en Empathische perspectiefneming hebben geen inkomende pijlen en zijn hier exogeen, niet de uiteindelijke uitkomst.\n\n**Denkregel:** in deze oefening is de endogene uitkomst de variabele die pijlen ontvangt maar zelf geen pijlen doorstuurt.\n\n**Volgende stap:** volg alle pijlen in hun richting tot het eindpunt; ze komen samen bij Moreel oordeel.\n\n**Correct antwoord:** 2",
            "2" = "✅ Juist! **Moreel oordeel (Stelen is OK)** is de **endogene** uitkomstvariabele van het model. Het ontvangt pijlen van Geanticipeerde schuld en Morele boosheid, maar stuurt zelf geen pijlen naar andere variabelen in het model.",
            "3" = "❌ Fout. **Waarschijnlijke redenering:** je hebt mogelijk alle variabelen met inkomende pijlen als de finale endogene uitkomst behandeld. De morele intuïties, Geanticipeerde schuld en Morele boosheid sturen ook pijlen door en zijn in deze oefening intermediair.\n\n**Denkregel:** de finale uitkomst ontvangt pijlen en heeft geen uitgaande pijl naar een andere modelvariabele.\n\n**Volgende stap:** zoek het eindpunt van de keten, niet de tussenstappen. Dat eindpunt is Moreel oordeel.\n\n**Correct antwoord:** 2",
            "4" = "❌ Fout. **Waarschijnlijke redenering:** je hebt mogelijk de directe voorspellers van Moreel oordeel verward met de uiteindelijke uitkomst zelf. Geanticipeerde schuld en Morele boosheid ontvangen én sturen pijlen en zijn dus intermediair.\n\n**Denkregel:** een intermediaire variabele ligt tussen oorzaak en uitkomst; de finale uitkomst stuurt geen pijl verder.\n\n**Volgende stap:** volg de uitgaande pijlen van Schuld en Boosheid één stap verder naar Moreel oordeel.\n\n**Correct antwoord:** 2"
          )
          key <- as.character(generated)
          msg <- feedbacks[[key]] %||% "❌ Geef een getal tussen 1 en 4 in."
          if (identical(generated, expected)) {
            msg <- paste0(msg, "\n\n**Bevestiging:** deze keuze komt overeen met de ongewijzigde antwoordsleutel.\n\n**Denkregel:** de finale endogene uitkomst ontvangt pijlen maar stuurt in dit model geen pijl verder.\n\n**Transferstap:** volg in een nieuw model alle gerichte paden tot hun eindpunt om de uitkomstvariabele te vinden.")
          } else if (key %in% names(feedbacks)) {
            msg <- sub("**Denkregel:**", "**Waarom dit niet klopt:** de gekozen variabelen zijn startpunten of tussenschakels en niet het eindpunt van de gerichte keten.\n\n**Denkregel:**", msg, fixed = TRUE)
          } else {
          msg <- paste0(msg, "\n\n**Controleer je invoer:** de invoer is leeg, niet-numeriek of buiten de aangeboden opties; daardoor kan geen inhoudelijke keuze worden vastgesteld.\n\n**Waarom dit niet klopt:** alleen één van de aangeboden optienummers kan met de antwoordsleutel worden beoordeeld.\n\n**Denkregel:** kies één geldige optie en zoek het knooppunt met inkomende maar geen uitgaande modelpijlen.\n\n**Volgende stap:** voer 1, 2, 3 of 4 in.")
          }
          get_reporter()$add_message(msg, type = "markdown")
          generated == expected
        }
      )
    }
  )
})
