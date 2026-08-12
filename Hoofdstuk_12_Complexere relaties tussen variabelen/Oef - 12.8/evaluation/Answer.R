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
            "1" = "❌ Fout. **Waarschijnlijke redenering:** je hebt mogelijk een R² van een andere variabele afgelezen. **38%** hoort bij Morele intuïties (individualiserend), niet bij de uitkomst Moreel oordeel.\n\n**Beslisregel:** identificeer eerst de gevraagde uitkomstvariabele; bereken daarna het onverklaarde deel als 100% − haar R².\n\n**Volgende stap:** gebruik R² = 43% bij Moreel oordeel: 100% − 43% = **57%**.\n\n**Correct antwoord:** 3",
            "2" = "❌ Fout. **Waarschijnlijke redenering:** je hebt mogelijk de juiste R² afgelezen maar het verklaarde aandeel rechtstreeks als antwoord gegeven. **43%** is wat het model wél verklaart.\n\n**Beslisregel:** onverklaarde variantie = 1 − R², of in procenten 100% − R²%.\n\n**Volgende stap:** neem het complement van 43%: **57%**.\n\n**Correct antwoord:** 3",
            "3" = "✅ Juist! De **R² van Moreel oordeel** is 43%. Dat betekent dat het model 43% van de variantie in Moreel oordeel verklaart. Het niet-verklaarde deel is 100% − 43% = **57%**. Dit aandeel weerspiegelt de invloed van variabelen die niet in het model zijn opgenomen.",
            "4" = "❌ Fout. **Waarschijnlijke redenering:** je hebt mogelijk 100% − 38% berekend en dus het R²-label van Morele intuïties (individualiserend) gebruikt. De bewerking is dan passend, maar de gekozen variabele niet.\n\n**Beslisregel:** neem het complement van de R² van de gevraagde uitkomst, niet van een andere modelvariabele.\n\n**Volgende stap:** koppel Moreel oordeel aan R² = 43% en bereken 100% − 43% = **57%**.\n\n**Correct antwoord:** 3"
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
