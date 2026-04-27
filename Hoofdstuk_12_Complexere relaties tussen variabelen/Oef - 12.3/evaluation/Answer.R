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
            "1" = "❌ Fout. Empathische bezorgdheid en perspectiefneming zijn de *exogene* variabelen — zij ontvangen geen pijlen vanuit andere modelvariabelen.\n\n**Correct antwoord:** 3",
            "2" = "❌ Fout. Moreel oordeel is de *endogene* uitkomstvariabele — het ontvangt pijlen maar stuurt er geen naar andere modelvariabelen.\n\n**Correct antwoord:** 3",
            "3" = "✅ Juist! De vier **intermediaire** variabelen zijn:\n\n1. Morele intuiïties (individualiserend)\n2. Morele intuiïties (groepsgericht)\n3. Geanticipeerde schuld\n4. Morele boosheid\n\nZij ontvangen allemaal pijlen én sturen pijlen door naar andere variabelen in het model.",
            "4" = "❌ Bijna! Geanticipeerde schuld en Morele boosheid zijn inderdaad intermediair, maar je vergeet ook **Morele intuiïties (individualiserend en groepsgericht)**.\n\n**Correct antwoord:** 3 (alle vier)"
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
