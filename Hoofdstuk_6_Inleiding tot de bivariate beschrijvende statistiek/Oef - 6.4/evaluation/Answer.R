context({
  testcase(
    " ",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        2, # Correct answer: generatieve causaliteit
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "❌ Fout. **Tegenfeitelijke causaliteit** focust op interventie/manipulatie: wat zou er gebeuren als X anders was?",
            "2" = "✅ Juist! **Generatieve (productieve) causaliteit** legt de nadruk op het **mechanisme** waarmee een oorzaak een effect voortbrengt.",
            "3" = "❌ Fout. **Robuuste statistische afhankelijkheid** gaat over sterke samenhang, maar verklaart op zich geen mechanisme.",
            "4" = "❌ Fout. **Contributieve causaliteit** beschrijft een type causale factor (bijdrage), geen causaliteitstheorie die mechanismen centraal zet."
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
