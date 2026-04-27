context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        2,  # Correct answer: Endogeen
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "❌ Fout. **Exogeen** betekent dat een variabele geen inkomende pijlen heeft vanuit andere modelvariabelen. Moreel oordeel ontvangt pijlen van Geanticipeerde schuld én Morele boosheid — het is dus niet exogeen.\n\n**Correct antwoord:** 2 (endogeen) — de uiteindelijke uitkomstvariabele.",
            "2" = "✅ Juist! **Moreel oordeel (Stelen is OK)** is de **endogene** uitkomstvariabele van het model. Het ontvangt pijlen van Geanticipeerde schuld en Morele boosheid, maar stuurt zelf geen pijlen naar andere variabelen in het model.",
            "3" = "❌ Fout. **Intermediaire** variabelen ontvangen én sturen pijlen. Moreel oordeel stuurt geen pijlen naar andere modelvariabelen — het is dus geen intermediaire variabele.\n\n**Correct antwoord:** 2 (endogeen).",
            "4" = "❌ Fout. Een variabele kan niet tegelijk exogeen (geen inkomende pijlen) en intermediair (ontvangt én stuurt pijlen) zijn. Kijk opnieuw naar de pijlen in het model.\n\n**Correct antwoord:** 2 (endogeen)."
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