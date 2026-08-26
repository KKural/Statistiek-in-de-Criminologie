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
            "1" = "❌ Fout. **Waarschijnlijke redenering:** je hebt mogelijk de startvariabelen gekozen omdat ze de rest van het model beïnvloeden.\n\n**Waarom dit niet klopt:** startvariabelen zonder inkomende pijlen zijn exogeen en vormen niet de finale uitkomst.\n\n**Denkregel:** in deze oefening is de endogene uitkomst de variabele die pijlen ontvangt maar zelf geen pijlen doorstuurt.\n\n**Volgende stap:** volg alle gerichte pijlen tot het knooppunt waar de keten eindigt en probeer opnieuw.",
            "2" = "✅ Juist! **Moreel oordeel (Stelen is OK)** is de **endogene** uitkomstvariabele van het model. Het ontvangt pijlen van Geanticipeerde schuld en Morele boosheid, maar stuurt zelf geen pijlen naar andere variabelen in het model.",
            "3" = "❌ Fout. **Waarschijnlijke redenering:** je hebt mogelijk alle variabelen met inkomende pijlen als finale uitkomst behandeld.\n\n**Waarom dit niet klopt:** sommige variabelen ontvangen pijlen maar sturen ze ook door en zijn daardoor tussenschakels.\n\n**Denkregel:** de finale uitkomst ontvangt pijlen en heeft geen uitgaande pijl naar een andere modelvariabele.\n\n**Volgende stap:** sluit alle knooppunten met een uitgaande pijl uit en beoordeel de antwoordsets opnieuw.",
            "4" = "❌ Fout. **Waarschijnlijke redenering:** je hebt mogelijk directe voorspellers verward met de uiteindelijke uitkomst zelf.\n\n**Waarom dit niet klopt:** variabelen die pijlen ontvangen én doorsturen, liggen nog binnen de causale keten.\n\n**Denkregel:** een intermediaire variabele ligt tussen oorzaak en uitkomst; de finale uitkomst stuurt geen pijl verder.\n\n**Volgende stap:** volg de uitgaande pijlen van de gekozen variabelen nog één stap verder en probeer opnieuw."
          )
          key <- as.character(generated)
          msg <- feedbacks[[key]] %||% "❌ Geef een getal tussen 1 en 4 in."
          if (identical(generated, expected)) {
            msg <- paste0(msg, "\n\n**Bevestiging:** deze keuze komt overeen met de ongewijzigde antwoordsleutel.\n\n**Denkregel:** de finale endogene uitkomst ontvangt pijlen maar stuurt in dit model geen pijl verder.\n\n**Transferstap:** volg in een nieuw model alle gerichte paden tot hun eindpunt om de uitkomstvariabele te vinden.")
          } else if (!key %in% names(feedbacks)) {
          msg <- paste0(msg, "\n\n**Controleer je invoer:** de invoer is leeg, niet-numeriek of buiten de aangeboden opties; daardoor kan geen inhoudelijke keuze worden vastgesteld.\n\n**Waarom dit niet klopt:** alleen één van de aangeboden optienummers kan met de antwoordsleutel worden beoordeeld.\n\n**Denkregel:** kies één geldige optie en zoek het knooppunt met inkomende maar geen uitgaande modelpijlen.\n\n**Volgende stap:** voer 1, 2, 3 of 4 in.")
          }
          get_reporter()$add_message(msg, type = "markdown")
          generated == expected
        }
      )
    }
  )
})
