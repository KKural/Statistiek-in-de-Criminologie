context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        3,
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "❌ Fout. **Waarschijnlijke redenering:** je hebt mogelijk variabelen aan het begin van de keten als tussenschakels gekozen.\n\n**Waarom dit niet klopt:** startvariabelen zonder inkomende pijlen voldoen niet aan beide voorwaarden voor een intermediaire variabele.\n\n**Denkregel:** intermediaire variabelen hebben zowel inkomende als uitgaande pijlen.\n\n**Volgende stap:** controleer voor elke kandidaat afzonderlijk of aan beide pijlvoorwaarden is voldaan.",
            "2" = "❌ Fout. **Waarschijnlijke redenering:** je hebt mogelijk de finale uitkomst meegeteld omdat die inkomende pijlen heeft.\n\n**Waarom dit niet klopt:** een eindvariabele die geen pijl verder stuurt, is geen tussenschakel.\n\n**Denkregel:** intermediair betekent ontvangen én doorsturen; een finale uitkomst ontvangt maar stuurt niet verder.\n\n**Volgende stap:** sluit eerst start- en eindvariabelen uit en beoordeel daarna alle variabelen ertussen.",
            "3" = "✅ Juist! De vier **intermediaire** variabelen zijn:\n\n1. Morele intuïties (individualiserend)\n2. Morele intuïties (groepsgericht)\n3. Geanticipeerde schuld\n4. Morele boosheid\n\nZij ontvangen allemaal pijlen én sturen pijlen door naar andere variabelen in het model.",
            "4" = "❌ Bijna. **Waarschijnlijke redenering:** je hebt mogelijk alleen de intermediaire variabelen vlak vóór de finale uitkomst geselecteerd.\n\n**Waarom dit niet klopt:** ook eerder in de keten kunnen variabelen zowel inkomende als uitgaande pijlen hebben.\n\n**Denkregel:** tel elke variabele met minstens één inkomende én één uitgaande pijl, ongeacht haar positie in de keten.\n\n**Volgende stap:** scan het volledige model van links naar rechts en controleer alle knooppunten, niet alleen de laatste tussenstap."
          )
          key <- as.character(generated)
          msg <- feedbacks[[key]] %||% "❌ Geef een getal tussen 1 en 4 in."
          if (identical(generated, expected)) {
            msg <- paste0(msg, "\n\n**Bevestiging:** deze keuze komt overeen met de ongewijzigde antwoordsleutel.\n\n**Denkregel:** een intermediaire variabele heeft zowel minstens één inkomende als minstens één uitgaande pijl.\n\n**Transferstap:** maak bij een nieuw model twee vinkkolommen — inkomend en uitgaand — en selecteer de variabelen met twee vinkjes.")
          } else if (!key %in% names(feedbacks)) {
          msg <- paste0(msg, "\n\n**Controleer je invoer:** de invoer is leeg, niet-numeriek of buiten de aangeboden opties; daardoor kan geen inhoudelijke keuze worden vastgesteld.\n\n**Waarom dit niet klopt:** alleen één van de aangeboden optienummers kan met de antwoordsleutel worden beoordeeld.\n\n**Denkregel:** beoordeel alleen geldige opties 1–4 en controleer per variabele zowel inkomende als uitgaande pijlen.\n\n**Volgende stap:** voer één optienummer in.")
          }
          get_reporter()$add_message(msg, type = "markdown")
          generated == expected
        }
      )
    }
  )
})
