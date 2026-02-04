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
            "1" = "❌ Fout - **Nominaal** betekent categorieën zonder rangorde. Criminologische voorbeelden: type slachtoffer (persoon, bedrijf, overheid), soort bewijs (DNA, vingerafdruk, getuigenis). Bij empathie-schalen kunnen antwoorden wel gerangschikt worden van 'heel onwaarschijnlijk' naar 'heel waarschijnlijk'",
            
            "2" = "✅ Juist - **ordinaal** meetniveau met antwoordopties gaande van heel onwaarschijnlijk tot en met heel waarschijnlijk, de categorieën zijn ordenbaar maar de afstand tussen de categorieën is niet gelijk. Het verschil in betekenis tussen onwaarschijnlijk en neutraal is niet exact hetzelfde als tussen waarschijnlijk en heel waarschijnlijk. <a href='https://www.youtube.com/watch?v=KJPXZIEmvfA' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            
            "3" = "❌ Fout - **Interval** heeft numerieke waarden met gelijke afstanden, maar geen absoluut nulpunt. Criminologische voorbeelden: IQ-scores van daders, temperatuur tijdens delict (°C). Bij empathie is er geen echte numerieke schaal met gelijke intervallen. <a href='https://www.youtube.com/watch?v=KJPXZIEmvfA' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            
            "4" = "❌ Fout - **Ratio** heeft numerieke waarden met gelijke afstanden en een absoluut nulpunt. Criminologische voorbeelden: aantal jaren ervaring van rechters, hoogte boete in euro's. Bij empathie-schalen is er geen absoluut nulpunt dat 'geen empathie' betekent."
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