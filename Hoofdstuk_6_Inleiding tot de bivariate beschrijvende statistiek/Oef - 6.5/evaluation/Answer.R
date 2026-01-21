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
            "1" = "❌ Fout. Bivariate beschrijvende statistiek kan **geen definitief causale** conclusies bewijzen; ze beschrijft enkel verbanden.",
            "2" = "❌ Fout. Dit is **univariate** beschrijvende statistiek (één variabele).",
            "3" = "✅ Juist! Bivariate beschrijvende statistiek vat de **sterkte**, **richting** en **vorm** van een relatie tussen twee variabelen samen.",
            "4" = "❌ Fout. Welke variabele ‘onafhankelijk’ is, volgt vooral uit **theorie en onderzoeksopzet**, niet uit bivariate descriptieve analyse zelf."
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
