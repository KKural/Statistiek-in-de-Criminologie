context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        3,  # Correct answer: .18
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "❌ Fout. **.21** is de padcoëfficiënt van het directe pad van **Empathische perspectiefneming** naar **Geanticipeerde schuld** — niet van Morele intuities (individualiserend) naar Geanticipeerde schuld.\n\n**Correct antwoord:** 3 (.18)",
            "2" = "❌ Fout. **.34** is de padcoëfficiënt van het directe pad van **Empathische bezorgdheid** naar **Geanticipeerde schuld**.\n\n**Correct antwoord:** 3 (.18)",
            "3" = "✅ Juist! De padcoëfficiënt van **Morele intuities (individualiserend) → Geanticipeerde schuld** is **.18**. Dit pad is statistisch significant (p < .001).",
            "4" = "❌ Fout. **.48** is de padcoëfficiënt van het pad van **Empathische bezorgdheid** naar **Morele intuities (individualiserend)** — niet naar Geanticipeerde schuld.\n\n**Correct antwoord:** 3 (.18)"
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