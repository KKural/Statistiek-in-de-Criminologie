context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        3,  # Correct answer: 57%
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "❌ Fout. **Waarschijnlijke redenering:** je hebt mogelijk het R²-label van een andere modelvariabele gebruikt.\n\n**Waarom dit niet klopt:** het onverklaarde aandeel moet worden berekend uit de R² van de specifiek gevraagde uitkomst.\n\n**Denkregel:** identificeer eerst de uitkomstvariabele; bereken daarna haar complement als `100% − R²%`.\n\n**Volgende stap:** koppel het juiste R²-label aan de uitkomst en voer de complementberekening opnieuw uit.",
            "2" = "❌ Fout. **Waarschijnlijke redenering:** je hebt mogelijk de juiste R² afgelezen maar het verklaarde aandeel zelf als antwoord gegeven.\n\n**Waarom dit niet klopt:** de vraag vraagt naar wat niet wordt verklaard, dus naar het complement van R².\n\n**Denkregel:** verklaard aandeel plus onverklaard aandeel is samen 100%.\n\n**Volgende stap:** bepaal welk aandeel ontbreekt tot 100% en kies daarna opnieuw.",
            "3" = "✅ Juist! De **R² van Moreel oordeel** is 43%. Dat betekent dat het model 43% van de variantie in Moreel oordeel verklaart. Het niet-verklaarde deel is 100% − 43% = **57%**. Dit aandeel weerspiegelt de invloed van variabelen die niet in het model zijn opgenomen.",
            "4" = "❌ Fout. **Waarschijnlijke redenering:** je hebt mogelijk de juiste complementbewerking uitgevoerd met het R²-label van een andere variabele.\n\n**Waarom dit niet klopt:** een correcte bewerking met de verkeerde modelvariabele beantwoordt de vraag nog steeds niet.\n\n**Denkregel:** neem het complement van de R² van de gevraagde uitkomst, niet van een ander knooppunt.\n\n**Volgende stap:** markeer eerst de uitkomstvariabele en haar eigen R²-label; bereken daarna pas het onverklaarde aandeel."
          )
          key <- as.character(generated)
          msg <- feedbacks[[key]] %||% "❌ Geef een getal tussen 1 en 4 in."
          if (identical(generated, expected)) {
            msg <- paste0(msg, "\n\n**Bevestiging:** deze keuze komt overeen met de ongewijzigde antwoordsleutel.\n\n**Denkregel:** onverklaarde proportie = 1 − R², of in procenten 100% − verklaard percentage.\n\n**Transferstap:** noteer bij een nieuw probleem eerst het R² van de juiste uitkomst en controleer dat verklaard plus onverklaard 100% is.")
          } else if (!key %in% names(feedbacks)) {
          msg <- paste0(msg, "\n\n**Controleer je invoer:** de invoer is leeg, niet-numeriek of buiten de aangeboden opties; daardoor kan geen inhoudelijke keuze worden vastgesteld.\n\n**Waarom dit niet klopt:** alleen één van de aangeboden optienummers kan met de antwoordsleutel worden beoordeeld.\n\n**Denkregel:** gebruik een geldige optie en bereken het complement van het R²-label bij de gevraagde uitkomst.\n\n**Volgende stap:** controleer eerst de doelvariabele en voer daarna één optienummer van 1 tot en met 4 in.")
          }
          get_reporter()$add_message(msg, type = "markdown")
          generated == expected
        }
      )
    }
  )
})
