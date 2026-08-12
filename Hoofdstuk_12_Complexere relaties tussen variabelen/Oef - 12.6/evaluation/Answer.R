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
            "1" = "❌ Fout. **Waarschijnlijke redenering:** je hebt mogelijk alleen het directe pad **0.34** afgelezen en het indirecte pad niet meegerekend.\n\n**Beslisregel:** totaal effect = direct effect + de producten van alle volledige indirecte paden.\n\n**Volgende stap:** bereken eerst 0.48 × 0.18 = 0.0864 en tel dit bij 0.34 op: **0.4264**.\n\n**Correct antwoord:** 3",
            "2" = "❌ Fout. **Waarschijnlijke redenering:** deze waarde past mogelijk bij een reken- of decimalenfout, maar niet eenduidig bij één pad in het getoonde model.\n\n**Beslisregel:** vermenigvuldig de coëfficiënten binnen een indirect pad en tel dat product daarna één keer bij het directe effect.\n\n**Volgende stap:** schrijf de bewerking eerst symbolisch uit en vul dan in: 0.34 + (0.48 × 0.18) = **0.4264**.\n\n**Correct antwoord:** 3",
            "3" = "✅ Juist! Het **totale effect** van Empathische bezorgdheid op Geanticipeerde schuld is **0.4264**:\n\n- Direct effect: **0.34**\n- Indirect effect via Morele intuities (ind.): 0.48 × 0.18 = **0.0864**\n- Totaal: 0.34 + 0.0864 = **0.4264**",
            "4" = "❌ Fout. **Waarschijnlijke redenering:** je hebt mogelijk alleen de eerste coëfficiënt van het indirecte pad gekozen. **0.48** loopt tot Morele intuïties (individualiserend), niet tot Geanticipeerde schuld.\n\n**Beslisregel:** een indirect effect is het product van alle coëfficiënten op de volledige route; het totale effect telt daar het directe pad bij.\n\n**Volgende stap:** verleng de route met × 0.18 en tel vervolgens + 0.34: **0.4264**.\n\n**Correct antwoord:** 3"
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
