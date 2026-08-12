context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        3, # Correct answer: relatie samenvatten
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "❌ **Je keuze is consistent met de gedachte dat twee variabelen analyseren automatisch een causale toets is.**\n\n**Waarom dit fout is:** bivariate beschrijvende statistiek vat het geobserveerde verband samen, maar sluit alternatieve verklaringen niet uit.\n\n**Denkregel:** gebruik *sterkte, richting en vorm* voor beschrijving; gebruik theorie en onderzoeksdesign voor causale claims. <a href='https://www.geeksforgeeks.org/maths/bivariate-analysis/' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            "2" = "❌ **Je antwoord suggereert dat je ‘beschrijvend’ herkent, maar het voorvoegsel *bi-* negeert.**\n\n**Waarom dit fout is:** een frequentieverdeling van één variabele is univariaat; bivariaat gaat over het patroon tussen twee variabelen.\n\n**Denkregel:** tel eerst het aantal variabelen: één = univariaat, twee = bivariaat. <a href='https://www.geeksforgeeks.org/maths/bivariate-analysis/' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            "3" = "✅ **Juist.** Bivariate beschrijvende statistiek vat de **sterkte**, **richting** en **vorm** van een relatie tussen twee variabelen samen.\n\n**Versterk je redenering:** beschrijf een bivariate uitkomst steeds met deze drie woorden voordat je een inhoudelijke conclusie formuleert. <a href='https://www.geeksforgeeks.org/maths/bivariate-analysis/' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            "4" = "❌ **Je keuze suggereert dat de cijfers zelf bepalen welke variabele onafhankelijk is.**\n\n**Waarom dit fout is:** de rollen van X en Y volgen hoofdzakelijk uit theorie, tijdsvolgorde en onderzoeksopzet; de bivariate analyse beschrijft vervolgens hun relatie.\n\n**Denkregel:** wijs X en Y inhoudelijk toe vóór je de associatiemaat interpreteert. <a href='https://www.geeksforgeeks.org/maths/bivariate-analysis/' target='_blank' rel='noopener noreferrer'>Lees meer</a>"
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
