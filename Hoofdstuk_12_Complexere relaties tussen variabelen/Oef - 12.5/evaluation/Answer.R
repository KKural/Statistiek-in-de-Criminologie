context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        2,  # Correct answer: Twee indirecte paden
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "❌ Fout. Er is meer dan één indirect pad. Zoek alle routes via tussenliggende variabelen:\n\n1. Emp.perspectiefneming → Morele intuities (ind.) → Geanticipeerde schuld → Moreel oordeel\n2. Emp.perspectiefneming → Morele intuities (ind.) → Morele boosheid → Moreel oordeel\n\n**Correct antwoord:** 2 (twee indirecte paden)",
            "2" = "✅ Juist! **Empathische perspectiefneming** werkt via **twee indirecte paden** door op Moreel oordeel:\n\n1. via Morele intuities (ind.) → Geanticipeerde schuld → Moreel oordeel\n2. via Morele intuities (ind.) → Morele boosheid → Moreel oordeel",
            "3" = "❌ Fout. Controleer of je ook directe paden hebt meegeteld of een pad dubbel hebt geteld. Er zijn slechts twee indirecte paden:\n\n1. Emp.perspectiefneming → Morele intuities (ind.) → Geanticipeerde schuld → Moreel oordeel\n2. Emp.perspectiefneming → Morele intuities (ind.) → Morele boosheid → Moreel oordeel\n\n**Correct antwoord:** 2",
            "4" = "❌ Fout. Er zijn geen vier indirecte paden. Let op: Empathische perspectiefneming heeft in dit model slechts één uitgesplitst indirect pad (via Morele intuities (ind.)), dat daarna in twee richtingen splitst.\n\n**Correct antwoord:** 2 (twee indirecte paden)"
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