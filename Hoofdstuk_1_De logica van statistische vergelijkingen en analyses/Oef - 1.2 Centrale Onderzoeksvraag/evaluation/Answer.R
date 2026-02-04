context({
  testcase(
    " ",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        4,  # Correct answer: To determine focus and direction
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "❌ Fout. De centrale vraag helpt inderdaad om het onderwerp te beperken, maar haar belangrijkste doel is het geven van richting en betekenis aan het hele onderzoek. <a href='https://handboeksgpl.sites.uu.nl/doing-research/central-question-and-sub-questions/?lang=en' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            
            "2" = "❌ Fout. De centrale onderzoeksvraag vormt juist het kader waarbinnen subvraagstukken of hypothesen ontwikkeld worden — ze vervangt die niet. <a href='https://handboeksgpl.sites.uu.nl/doing-research/central-question-and-sub-questions/?lang=en' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            
            "3" = "❌ Fout. De centrale onderzoeksvraag wordt vooraf opgesteld om het onderzoek te sturen, niet om de resultaten achteraf samen te vatten. <a href='https://handboeksgpl.sites.uu.nl/doing-research/central-question-and-sub-questions/?lang=en' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            
            "4" = "✅ Juist! De centrale onderzoeksvraag bepaalt de hoofdfocus, verduidelijkt wat onderzocht wordt en zorgt dat het onderzoek een duidelijke richting en samenhang heeft. <a href='https://handboeksgpl.sites.uu.nl/doing-research/central-question-and-sub-questions/?lang=en' target='_blank' rel='noopener noreferrer'>Lees meer</a>"
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