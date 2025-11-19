context({
  testcase(
    " ",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        1,  # Correct answer
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "✅ Juist - bij het **nominaal** meetniveau worden gegevens ingedeeld in categorieën zonder een specifieke volgorde. Nationaliteit is een typisch voorbeeld hiervan: de categorieën zijn verschillend, maar er is geen rangorde tussen de nationaliteiten.",
            
            "2" = "❌ Fout - **Ordinaal** heeft categorieën met rangorde. Criminologische voorbeelden: ernst van delicten (licht, gemiddeld, zwaar), rang bij politie (agent, brigadier, commissaris). Nationaliteiten kunnen niet gerangschikt worden - 'Belg' is niet 'hoger' of 'lager' dan 'Frans'.",
            
            "3" = "❌ Fout - **Interval** heeft numerieke waarden met gelijke afstanden, maar geen absoluut nulpunt. Criminologische voorbeelden: jaar van veroordeling (1990, 2000, 2010), attitude-scores. Nationaliteit is categorisch, niet numeriek.",
            
            "4" = "❌ Fout - **Ratio** heeft numerieke waarden met gelijke afstanden en een absoluut nulpunt. Criminologische voorbeelden: aantal politieagenten per nationaliteit, jaren werkervaring. Nationaliteit zelf is geen numerieke meting."
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