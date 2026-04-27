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
            "1" = "❌ Fout. **38%** is de R² van Morele intuities (individualiserend) — het aandeel verklaarde variantie in die variabele, niet in Moreel oordeel.\n\n**Correct antwoord:** 3 (57%) — de R² van Moreel oordeel is 43%, dus 100% − 43% = 57% wordt niet verklaard.",
            "2" = "❌ Fout. **43%** is de R² van Moreel oordeel — het aandeel dat WEL verklaard wordt. De vraag vraagt naar het deel dat NIET verklaard wordt.\n\n**Correct antwoord:** 3 (57%) — 100% − 43% = 57%",
            "3" = "✅ Juist! De **R² van Moreel oordeel** is 43%. Dat betekent dat het model 43% van de variantie in Moreel oordeel verklaart. Het niet-verklaarde deel is 100% − 43% = **57%**. Dit aandeel weerspiegelt de invloed van variabelen die niet in het model zijn opgenomen.",
            "4" = "❌ Fout. **62%** is geen waarde die rechtstreeks uit het model kan worden afgelezen. Zoek de R² van Moreel oordeel op en bereken 100% minus die waarde.\n\n**Correct antwoord:** 3 (57%) — 100% − 43% = 57%"
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