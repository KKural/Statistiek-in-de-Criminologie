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
            "1" = "❌ Fout - nominaal betekent categorieën zonder rangorde, zoals haarkleur of nationaliteit.",
            
            "2" = "✅ Juist - bij het ordinaal meetniveau kunnen de gegevens/data gerangschikt worden in een bepaalde volgorde, zoals van 'minst ernstig' naar 'meest ernstig'. Echter, de exacte afstand tussen de categorieën is niet meetbaar of betekenisvol.",
            
            "3" = "❌ Fout - interval heeft numerieke waarden met gelijke afstanden, maar geen absoluut nulpunt.",
            
            "4" = "❌ Fout - ratio heeft numerieke waarden met gelijke afstanden en een absoluut nulpunt."
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