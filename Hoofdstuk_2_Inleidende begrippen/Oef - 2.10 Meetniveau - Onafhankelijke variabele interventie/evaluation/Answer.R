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
            "1" = "✅ Juist - **nominaal** (er zijn twee categorieën: interventiewijk en controlegroep). Dit zijn verschillende categorieën zonder rangorde - geen van beide is 'hoger' of 'beter' dan de ander, het zijn gewoon verschillende behandelingen.",
            
            "2" = "❌ Fout - **Ordinaal** heeft categorieën met rangorde. Criminologische voorbeelden: intensiteit van programma (laag, gemiddeld, hoog), ernst van straf (licht, zwaar). 'Interventiewijk' vs. 'controlegroep' heeft geen rangorde - geen is 'hoger' dan de ander.",
            
            "3" = "❌ Fout - **Interval** heeft numerieke waarden met gelijke afstanden, maar geen absoluut nulpunt. Criminologische voorbeelden: jaar van interventie (2020, 2021), IQ-scores van deelnemers. Interventie vs. controle zijn categorieën, geen numerieke waarden.",
            
            "4" = "❌ Fout - **Ratio** heeft numerieke waarden met gelijke afstanden en een absoluut nulpunt. Criminologische voorbeelden: aantal interventiesessies (0, 1, 2, 3), kosten van programma in euro's. Interventiewijk/controlegroep zijn niet numeriek meetbaar."
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