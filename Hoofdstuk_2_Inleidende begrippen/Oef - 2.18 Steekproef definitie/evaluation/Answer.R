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
            "1" = "✅ Juist - **de 200 geselecteerde jongeren** vormen de steekproef. Dit zijn de concrete personen waarvan gegevens verzameld worden. Vergelijkbaar: 300 ondervraagde slachtoffers, 150 geïnterviewde politieagenten, 80 geobserveerde verdachten.",
            
            "2" = "❌ Fout - dit is de **doelpopulatie**, niet de steekproef. De populatie is de grotere groep waarover je conclusies wilt trekken. Steekproef is wie je daadwerkelijk onderzoekt (N=200).",
            
            "3" = "❌ Fout - dit is slechts de **interventiegroep** (ongeveer 100 van de 200). De volledige steekproef bestaat uit beide groepen: interventie én controle. Anders zou je geen vergelijking kunnen maken.",
            
            "4" = "❌ Fout - dit is veel breder dan wie onderzocht wordt. De steekproef is niet 'alle jongeren in de stad' maar specifiek de 200 geselecteerde jongeren uit probleemwijken."
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