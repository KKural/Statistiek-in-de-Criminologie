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
            "1" = "❌ Fout - dit is de **onafhankelijke variabele** - wat de onderzoeker manipuleert om effect te meten. Vergelijkbaar: in onderzoek naar effect van gevangenisstraf is 'type straf' (gevangenis vs. taakstraf) de onafhankelijke variabele, niet de afhankelijke.",
            
            "2" = "✅ Juist - **het aantal meldingen van overlast** waarbij de jongeren betrokken waren is de afhankelijke variabele. Dit is wat we meten als uitkomst - het 'effect' van de interventie. Vergelijkbaar: recidivecijfers na therapie, aantal misdrijven na CCTV-installatie.",
            
            "3" = "❌ Fout - dit **bepaalt de groepsindeling**, maar is niet de uitkomst die gemeten wordt. Het is hoe we weten wie interventie kreeg, maar het is niet wat we meten als effect. Vergelijkbaar: in therapie-onderzoek is 'ziekenhuis waar behandeling plaatsvond' niet de uitkomstmaat.",
            
            "4" = "❌ Fout - dit is de **steekproefgrootte** (N=200), niet een variabele die per persoon verschilt. Vergelijkbaar: als 300 ex-gedetineerden gevolgd worden, dan is '300' niet de afhankelijke variabele."
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