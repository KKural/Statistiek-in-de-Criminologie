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
            "1" = "❌ Fout. **Tegenfeitelijke causaliteit** focust op interventie/manipulatie: wat zou er gebeuren als X anders was? [Lees meer](https://www.google.com/url?sa=t&source=web&rct=j&opi=89978449&url=https://www-personal.umd.umich.edu/~delittle/resources/causal%2520mechanism.pdf&ved=2ahUKEwii14jf07-SAxWkKvsDHcH8Fc4QFnoECBoQAQ&usg=AOvVaw0Gd7sJjVyoNDUuJat6pOJX)",
            "2" = "✅ Juist! **Generatieve (productieve) causaliteit** legt de nadruk op het **mechanisme** waarmee een oorzaak een effect voortbrengt. [Lees meer](https://www.google.com/url?sa=t&source=web&rct=j&opi=89978449&url=https://www-personal.umd.umich.edu/~delittle/resources/causal%2520mechanism.pdf&ved=2ahUKEwii14jf07-SAxWkKvsDHcH8Fc4QFnoECBoQAQ&usg=AOvVaw0Gd7sJjVyoNDUuJat6pOJX)",
            "3" = "❌ Fout. **Robuuste statistische afhankelijkheid** gaat over sterke samenhang, maar verklaart op zich geen mechanisme. [Lees meer](https://www.google.com/url?sa=t&source=web&rct=j&opi=89978449&url=https://www-personal.umd.umich.edu/~delittle/resources/causal%2520mechanism.pdf&ved=2ahUKEwii14jf07-SAxWkKvsDHcH8Fc4QFnoECBoQAQ&usg=AOvVaw0Gd7sJjVyoNDUuJat6pOJX)",
            "4" = "❌ Fout. **Contributieve causaliteit** beschrijft een type causale factor (bijdrage), geen causaliteitstheorie die mechanismen centraal zet. [Lees meer](https://www.google.com/url?sa=t&source=web&rct=j&opi=89978449&url=https://www-personal.umd.umich.edu/~delittle/resources/causal%2520mechanism.pdf&ved=2ahUKEwii14jf07-SAxWkKvsDHcH8Fc4QFnoECBoQAQ&usg=AOvVaw0Gd7sJjVyoNDUuJat6pOJX)[Lees meer](https://www.google.com/url?sa=t&source=web&rct=j&opi=89978449&url=https://www-personal.umd.umich.edu/~delittle/resources/causal%2520mechanism.pdf&ved=2ahUKEwii14jf07-SAxWkKvsDHcH8Fc4QFnoECBoQAQ&usg=AOvVaw0Gd7sJjVyoNDUuJat6pOJX)"
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
