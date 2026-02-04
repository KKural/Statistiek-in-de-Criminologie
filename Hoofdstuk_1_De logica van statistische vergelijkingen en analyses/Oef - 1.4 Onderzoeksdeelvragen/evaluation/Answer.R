context({
  testcase(
    " ",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        1,  # Correct answer: To break down central question into manageable parts
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "✅ Juist! Onderzoeksdeelvragen maken de vaak vage en brede centrale onderzoeksvraag behapbaar door deze op te delen in deelvragen die gemakkelijker te behandelen zijn. <a href='https://handboeksgpl.sites.uu.nl/doing-research/central-question-and-sub-questions/?lang=en' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            
            "2" = "❌ Fout. Het doel is niet om het onderzoek langer te maken, maar om het beter te organiseren. <a href='https://handboeksgpl.sites.uu.nl/doing-research/central-question-and-sub-questions/?lang=en' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            
            "3" = "❌ Fout. Het doel van deelvragen is niet om meer variabelen toe te voegen, maar om de hoofdvraag systematisch te onderzoeken. <a href='https://handboeksgpl.sites.uu.nl/doing-research/central-question-and-sub-questions/?lang=en' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            
            "4" = "❌ Fout. Deelvragen zijn een methodologisch hulpmiddel, niet bedoeld om het onderzoek aantrekkelijker te maken voor het publiek. <a href='https://handboeksgpl.sites.uu.nl/doing-research/central-question-and-sub-questions/?lang=en' target='_blank' rel='noopener noreferrer'>Lees meer</a>"
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