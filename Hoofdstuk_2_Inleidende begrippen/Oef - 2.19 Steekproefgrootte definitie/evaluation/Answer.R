context({
  testcase(
    " ",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        2,  # Correct answer
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "❌ Fout - 100 is waarschijnlijk de grootte van **elke groep afzonderlijk** (interventie of controle), maar niet de totale steekproefgrootte. N = totaal aantal personen in het onderzoek.",
            
            "2" = "✅ Juist - **N = 200** is de totale steekproefgrootte (alle deelnemers samen). Dit wordt verdeeld over interventiegroep (≈100) en controlegroep (≈100). Vergelijkbaar: als 150 ex-gedetineerden worden gevolgd, dan is N=150, ongeacht of ze therapy kregen of niet.",
            
            "3" = "❌ Fout - dit getal komt niet voor in de onderzoeksbeschrijving. De steekproefgrootte wordt expliciet vermeld als 200 jongeren.",
            
            "4" = "❌ Fout - de steekproefgrootte is wel bekend: er worden 200 jongeren onderzocht, zoals vermeld in de onderzoeksbeschrijving."
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