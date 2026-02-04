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
            "1" = "❌ Fout. **Voldoende én noodzakelijke** oorzaken zijn in criminologisch onderzoek zeldzaam: gedrag is doorgaans multicausaal en contextafhankelijk. <a href='https://bookdown.org/paul/applied-causal-analysis/deterministiccausation.html' target='_blank' rel='noopener noreferrer'>Lees meer over deterministische causaliteit</a>",
            "2" = "✅ Juist! In criminologisch onderzoek gaat het meestal om **contributieve oorzaken**: factoren die bijdragen, maar op zichzelf niet voldoende of noodzakelijk zijn. <a href='https://bookdown.org/paul/applied-causal-analysis/deterministiccausation.html' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            "3" = "❌ Fout. **Voldoende maar niet-noodzakelijke** oorzaken zijn nog steeds te strikt: één factor die op zichzelf al voldoende is, komt zelden voor. <a href='https://bookdown.org/paul/applied-causal-analysis/deterministiccausation.html' target='_blank' rel='noopener noreferrer'>Lees meer over causaliteitstypen</a>",
            "4" = "❌ Fout. **Onvoldoende maar noodzakelijke** oorzaken zijn theoretisch mogelijk, maar sluiten minder aan bij de typische multicausale realiteit in criminologisch onderzoek. <a href='https://bookdown.org/paul/applied-causal-analysis/deterministiccausation.html' target='_blank' rel='noopener noreferrer'>Lees meer</a>"
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
