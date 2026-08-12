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
            "1" = "❌ Fout. **Waarschijnlijke redenering:** je hebt mogelijk een R² van een andere variabele afgelezen. **38%** hoort bij Morele intuïties (individualiserend), niet bij de uitkomst Moreel oordeel.\n\n**Denkregel:** identificeer eerst de gevraagde uitkomstvariabele; bereken daarna het onverklaarde deel als 100% − haar R².\n\n**Volgende stap:** gebruik R² = 43% bij Moreel oordeel: 100% − 43% = **57%**.\n\n**Correct antwoord:** 3",
            "2" = "❌ Fout. **Waarschijnlijke redenering:** je hebt mogelijk de juiste R² afgelezen maar het verklaarde aandeel rechtstreeks als antwoord gegeven. **43%** is wat het model wél verklaart.\n\n**Denkregel:** onverklaarde variantie = 1 − R², of in procenten 100% − R²%.\n\n**Volgende stap:** neem het complement van 43%: **57%**.\n\n**Correct antwoord:** 3",
            "3" = "✅ Juist! De **R² van Moreel oordeel** is 43%. Dat betekent dat het model 43% van de variantie in Moreel oordeel verklaart. Het niet-verklaarde deel is 100% − 43% = **57%**. Dit aandeel weerspiegelt de invloed van variabelen die niet in het model zijn opgenomen.",
            "4" = "❌ Fout. **Waarschijnlijke redenering:** je hebt mogelijk 100% − 38% berekend en dus het R²-label van Morele intuïties (individualiserend) gebruikt. De bewerking is dan passend, maar de gekozen variabele niet.\n\n**Denkregel:** neem het complement van de R² van de gevraagde uitkomst, niet van een andere modelvariabele.\n\n**Volgende stap:** koppel Moreel oordeel aan R² = 43% en bereken 100% − 43% = **57%**.\n\n**Correct antwoord:** 3"
          )
          key <- as.character(generated)
          msg <- feedbacks[[key]] %||% "❌ Geef een getal tussen 1 en 4 in."
          if (identical(generated, expected)) {
            msg <- paste0(msg, "\n\n**Bevestiging:** deze keuze komt overeen met de ongewijzigde antwoordsleutel.\n\n**Denkregel:** onverklaarde proportie = 1 − R², of in procenten 100% − verklaard percentage.\n\n**Transferstap:** noteer bij een nieuw probleem eerst het R² van de juiste uitkomst en controleer dat verklaard plus onverklaard 100% is.")
          } else if (key %in% names(feedbacks)) {
            msg <- sub("**Denkregel:**", "**Waarom dit niet klopt:** de gekozen waarde is het verklaarde aandeel zelf of is berekend met het R² van een andere variabele.\n\n**Denkregel:**", msg, fixed = TRUE)
          } else {
          msg <- paste0(msg, "\n\n**Mogelijke denkroute:** de invoer is leeg, niet-numeriek of buiten de aangeboden opties; daardoor kan geen inhoudelijke keuze worden vastgesteld.\n\n**Waarom dit niet klopt:** alleen één van de aangeboden optienummers kan met de antwoordsleutel worden beoordeeld.\n\n**Denkregel:** gebruik een geldige optie en bereken het complement van het juiste R².\n\n**Volgende stap:** voer 100 − 43 uit en kies daarna 1, 2, 3 of 4.")
          }
          get_reporter()$add_message(msg, type = "markdown")
          generated == expected
        }
      )
    }
  )
})
