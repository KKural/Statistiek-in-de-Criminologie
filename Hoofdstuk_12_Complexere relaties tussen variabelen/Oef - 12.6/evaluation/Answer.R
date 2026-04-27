context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        3, # Correct answer: 0.4264
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "❌ Fout. **0.34** is alleen het directe effect van Empathische bezorgdheid op Geanticipeerde schuld. Je moet ook het indirecte pad via Morele intuities (ind.) optellen.\n\nTotaal effect = 0.34 + (0.48 × 0.18) = 0.34 + 0.0864 = **0.4264**",
            "2" = "❌ Fout. **0.3432** lijkt op de berekening voor het totale effect van **Empathische perspectiefneming** op Geanticipeerde schuld (0.21 + 0.21 × 0.18 × ...), niet van Empathische bezorgdheid.\n\nVoor Empathische bezorgdheid: 0.34 + (0.48 × 0.18) = **0.4264**",
            "3" = "✅ Juist! Het **totale effect** van Empathische bezorgdheid op Geanticipeerde schuld is **0.4264**:\n\n- Direct effect: **0.34**\n- Indirect effect via Morele intuities (ind.): 0.48 × 0.18 = **0.0864**\n- Totaal: 0.34 + 0.0864 = **0.4264**",
            "4" = "❌ Fout. **0.48** is de padcoëfficiënt van Empathische bezorgdheid naar Morele intuities (individualiserend), niet het totale effect op Geanticipeerde schuld.\n\nTotaal effect = 0.34 + (0.48 × 0.18) = **0.4264**"
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
context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        3, # Correct answer: 57%
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
