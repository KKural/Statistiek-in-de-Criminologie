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
            "1" = "❌ Fout. **Waarschijnlijke redenering:** je hebt mogelijk de variabelen aan het begin van de keten als tussenschakel gekozen. Empathische bezorgdheid en Empathische perspectiefneming ontvangen geen pijlen en zijn exogeen.\n\n**Beslisregel:** intermediaire variabelen hebben zowel inkomende als uitgaande pijlen.\n\n**Volgende stap:** controleer voor elke kandidaat of er aan beide kanten van de variabele een gerichte verbinding staat.\n\n**Correct antwoord:** 3",
            "2" = "❌ Fout. **Waarschijnlijke redenering:** je hebt mogelijk de finale uitkomst meegeteld omdat die inkomende pijlen heeft. Moreel oordeel stuurt echter geen pijl verder en is daarom geen tussenschakel.\n\n**Beslisregel:** intermediair = ontvangt én stuurt; finale uitkomst = ontvangt maar stuurt niet verder.\n\n**Volgende stap:** sluit eerst de start- en eindvariabelen uit en beoordeel daarna de variabelen ertussen.\n\n**Correct antwoord:** 3",
            "3" = "✅ Juist! De vier **intermediaire** variabelen zijn:\n\n1. Morele intuïties (individualiserend)\n2. Morele intuïties (groepsgericht)\n3. Geanticipeerde schuld\n4. Morele boosheid\n\nZij ontvangen allemaal pijlen én sturen pijlen door naar andere variabelen in het model.",
            "4" = "❌ Bijna. **Waarschijnlijke redenering:** je hebt mogelijk alleen de intermediaire variabelen vlak vóór Moreel oordeel geselecteerd. Geanticipeerde schuld en Morele boosheid zijn inderdaad intermediair, maar de twee soorten Morele intuïties ontvangen en sturen eveneens pijlen.\n\n**Beslisregel:** tel elke variabele met minstens één inkomende én één uitgaande pijl, ongeacht haar positie in de keten.\n\n**Volgende stap:** scan het volledige model van links naar rechts en voeg beide variabelen voor Morele intuïties toe.\n\n**Correct antwoord:** 3 (alle vier)"
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
