context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        1,
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "✅ Juist! **Empathische bezorgdheid** en **Empathische perspectiefneming** zijn de exogene variabelen. Zij ontvangen geen pijlen vanuit andere modelvariabelen — zij vormen het vertrekpunt van de verklarende keten.",
            "2" = "❌ Fout. **Moreel oordeel** is de *endogene* uitkomstvariabele — het ontvangt pijlen van Geanticipeerde schuld en Morele boosheid.\n\n**Correct antwoord:** 1 (Empathische bezorgdheid en empathische perspectiefneming)",
            "3" = "❌ Fout. Morele intuiïties, Geanticipeerde schuld en Morele boosheid zijn *intermediaire* variabelen — zij ontvangen én sturen pijlen.\n\n**Correct antwoord:** 1",
            "4" = "❌ Fout. Geanticipeerde schuld en Morele boosheid zijn *intermediaire* variabelen — zij sturen pijlen naar Moreel oordeel.\n\n**Correct antwoord:** 1"
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
