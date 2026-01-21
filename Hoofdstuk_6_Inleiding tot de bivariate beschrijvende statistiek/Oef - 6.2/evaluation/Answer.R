context({
  testcase(
    " ",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        2, # Correct answer: contributieve oorzaken
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "❌ Fout. **Voldoende én noodzakelijke** oorzaken zijn in criminologisch onderzoek zeldzaam: gedrag is doorgaans multicausaal en contextafhankelijk.",
            "2" = "✅ Juist! In criminologisch onderzoek gaat het meestal om **contributieve oorzaken**: factoren die bijdragen, maar op zichzelf niet voldoende of noodzakelijk zijn.",
            "3" = "❌ Fout. **Voldoende maar niet-noodzakelijke** oorzaken zijn nog steeds te strikt: één factor die op zichzelf al voldoende is, komt zelden voor.",
            "4" = "❌ Fout. **Onvoldoende maar noodzakelijke** oorzaken zijn theoretisch mogelijk, maar sluit minder aan bij de typische multicausale realiteit in criminologisch onderzoek."
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
