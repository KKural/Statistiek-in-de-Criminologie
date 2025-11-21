context({
  testcase(
    "",
    {
      testEqual(
        " ",
        function(env) as.numeric(env$evaluationResult),
        2,  # Correct answer
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "❌ Fout - **Nominaal** betekent categorieën zonder rangorde. Criminologische voorbeelden: type delict (diefstal, geweld, fraude), geslacht dader (man, vrouw), soort straf (gevangenis, boete, werkstraf). Deze kunnen niet gerangschikt worden van 'minst' naar 'meest'. Delicten rangschikken naar ernst vereist wel een rangorde.",
            
            "2" = "✅ Juist - bij het **ordinaal** meetniveau kunnen de gegevens/data gerangschikt worden in een bepaalde volgorde, zoals van 'minst ernstig' naar 'meest ernstig'. Echter, de exacte afstand tussen de categorieën is niet meetbaar of betekenisvol. Bijvoorbeeld: je weet dat 'moord' ernstiger is dan 'diefstal', maar de precieze 'afstand' in ernst is niet meetbaar.",
            
            "3" = "❌ Fout - **Interval** heeft numerieke waarden met gelijke afstanden, maar geen absoluut nulpunt. Criminologische voorbeelden: attitude-schalen (veiligheidsgevoel 1-7), satisfactie met politie (1-10). Bij interval is er geen 'nul-punt' dat 'geen attitude' betekent. Delicten rangschikken naar ernst gebruikt geen numerieke schaal met gelijke intervallen.",
            
            "4" = "❌ Fout - **Ratio** heeft numerieke waarden met gelijke afstanden en een absoluut nulpunt. Criminologische voorbeelden: aantal delicten (0 = geen delicten), lengte gevangenisstraf in maanden (0 = geen straf), leeftijd dader (0 = net geboren). Bij ratio kan je zeggen '4 jaar gevangenis is dubbel zo lang als 2 jaar'. Dit geldt niet voor ernst-rangschikking van delicten."
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