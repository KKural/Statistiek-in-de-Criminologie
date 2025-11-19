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
            "1" = "❌ Fout - dit is de **steekproef** (N=200), niet de doelpopulatie. De steekproef is wie je onderzoekt, populatie is waarover je conclusies trekt. Vergelijkbaar: 500 ex-gedetineerden zijn steekproef, alle ex-gedetineerden zijn populatie.",
            
            "2" = "✅ Juist - **alle jongeren in probleemwijken** waar dergelijke interventies kunnen worden toegepast vormen de doelpopulatie. De onderzoekers willen conclusies trekken over effectiviteit voor alle vergelijkbare situaties, niet alleen deze 200 jongeren. Vergelijkbaar: recidive-onderzoek wil conclusies over alle vergelijkbare daders.",
            
            "3" = "❌ Fout - dit is slechts de helft van de steekproef. Je wilt conclusies trekken over alle jongeren waar interventie toegepast kan worden, niet alleen over wie interventie kreeg. Anders zou je geen controlegroep nodig hebben.",
            
            "4" = "❌ Fout - te breed. Het onderzoek richt zich specifiek op **probleemwijken** en jongeren waarbij overlast speelt. Jongeren zonder overlastproblemen vallen buiten de reikwijdte van deze interventie."
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