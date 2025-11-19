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
            "1" = "❌ Fout - **Nominaal** betekent categorieën zonder rangorde. Criminologische voorbeelden: type gevangenis (open, gesloten, jeugd), soort therapie (groep, individueel, gezins). De motivatieschaal 1-5 kan wel gerangschikt worden van laag naar hoog.",
            
            "2" = "✅ Juist - de **motivatieschaal** van 1 tot 5 bevindt zich op het ordinaal meetniveau. De cijfers geven een rangorde aan van motivatie: een 5 betekent meer motivatie dan een 3. Echter, de afstand tussen de cijfers is niet noodzakelijk gelijk. Het verschil in motivatie tussen een 1 en een 2 kan subjectief anders worden ervaren dan tussen een 4 en een 5.",
            
            "3" = "❌ Fout - **Interval** heeft numerieke waarden met gelijke afstanden, maar geen absoluut nulpunt. Criminologische voorbeelden: IQ-test scores, jaar van geboorte. Bij motivatieschalen is de 'afstand' tussen 1 en 2 niet noodzakelijk gelijk aan die tussen 4 en 5 - het zijn subjectieve beoordelingen.",
            
            "4" = "❌ Fout - **Ratio** heeft numerieke waarden met gelijke afstanden en een absoluut nulpunt. Criminologische voorbeelden: aantal therapiesessies bijgewoond (0 = geen sessies), dagen in isolatiecel. Bij motivatieschaal betekent '1' niet 'geen motivatie' - het is nog steeds motivatie, alleen heel weinig."
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