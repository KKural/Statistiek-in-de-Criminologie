context({
  testcase(
    " ",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        3, # Correct answer: relatie samenvatten
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "❌ Fout. Bivariate beschrijvende statistiek kan **geen definitief causale** conclusies bewijzen; ze beschrijft enkel verbanden. <a href='https://www.geeksforgeeks.org/maths/bivariate-analysis/' target='_blank' rel='noopener noreferrer'>Lees meer over bivariate analyse</a>",
            "2" = "❌ Fout. Dit is **univariate** beschrijvende statistiek (één variabele). <a href='https://www.geeksforgeeks.org/maths/bivariate-analysis/' target='_blank' rel='noopener noreferrer'>Lees meer over bivariate analyse</a>",
            "3" = "✅ Juist! Bivariate beschrijvende statistiek vat de **sterkte**, **richting** en **vorm** van een relatie tussen twee variabelen samen. <a href='https://www.geeksforgeeks.org/maths/bivariate-analysis/' target='_blank' rel='noopener noreferrer'>Lees meer over bivariate analyse</a>",
            "4" = "❌ Fout. Welke variabele 'onafhankelijk' is, volgt vooral uit **theorie en onderzoeksopzet**, niet uit bivariate descriptieve analyse zelf. <a href='https://www.geeksforgeeks.org/maths/bivariate-analysis/' target='_blank' rel='noopener noreferrer'>Lees meer over bivariate analyse</a>"
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
