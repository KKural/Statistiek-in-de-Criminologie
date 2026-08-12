# **Bevestiging:** correct-option feedback below confirms the answer and its conceptual basis.
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
            "1" = "❌ **Waarschijnlijke redenering:** **Je keuze is consistent met de gedachte dat twee variabelen analyseren automatisch een causale toets is.** Dit is een voorzichtige hypothese op basis van je keuze; dezelfde optie kan ook om een andere reden zijn gekozen.\n\n**Waarom dit niet klopt:** bivariate beschrijvende statistiek vat het geobserveerde verband samen, maar sluit alternatieve verklaringen niet uit.\n\n**Denkregel:** gebruik *sterkte, richting en vorm* voor beschrijving; gebruik theorie en onderzoeksdesign voor causale claims. <a href='https://www.geeksforgeeks.org/maths/bivariate-analysis/' target='_blank' rel='noopener noreferrer'>Lees meer</a>\n\n**Volgende stap:** pas de denkregel toe op een nieuw criminologisch voorbeeld en benoem het beslissende criterium vóór je kiest.",
            "2" = "❌ **Waarschijnlijke redenering:** **Je antwoord suggereert dat je ‘beschrijvend’ herkent, maar het voorvoegsel *bi-* negeert.** Dit is een voorzichtige hypothese op basis van je keuze; dezelfde optie kan ook om een andere reden zijn gekozen.\n\n**Waarom dit niet klopt:** een frequentieverdeling van één variabele is univariaat; bivariaat gaat over het patroon tussen twee variabelen.\n\n**Denkregel:** tel eerst het aantal variabelen: één = univariaat, twee = bivariaat. <a href='https://www.geeksforgeeks.org/maths/bivariate-analysis/' target='_blank' rel='noopener noreferrer'>Lees meer</a>\n\n**Volgende stap:** pas de denkregel toe op een nieuw criminologisch voorbeeld en benoem het beslissende criterium vóór je kiest.",
            "3" = "**Bevestiging:** ✅ **Juist.** Bivariate beschrijvende statistiek vat de **sterkte**, **richting** en **vorm** van een relatie tussen twee variabelen samen.\n\n**Denkregel:** beschrijf een bivariate uitkomst steeds met deze drie woorden voordat je een inhoudelijke conclusie formuleert. <a href='https://www.geeksforgeeks.org/maths/bivariate-analysis/' target='_blank' rel='noopener noreferrer'>Lees meer</a>\n\n**Transferstap:** formuleer dezelfde regel voor een nieuw criminologisch voorbeeld en noteer welk gegeven je daarvoor eerst moet controleren.",
            "4" = "❌ **Waarschijnlijke redenering:** **Je keuze suggereert dat de cijfers zelf bepalen welke variabele onafhankelijk is.** Dit is een voorzichtige hypothese op basis van je keuze; dezelfde optie kan ook om een andere reden zijn gekozen.\n\n**Waarom dit niet klopt:** de rollen van X en Y volgen hoofdzakelijk uit theorie, tijdsvolgorde en onderzoeksopzet; de bivariate analyse beschrijft vervolgens hun relatie.\n\n**Denkregel:** wijs X en Y inhoudelijk toe vóór je de associatiemaat interpreteert. <a href='https://www.geeksforgeeks.org/maths/bivariate-analysis/' target='_blank' rel='noopener noreferrer'>Lees meer</a>\n\n**Volgende stap:** pas de denkregel toe op een nieuw criminologisch voorbeeld en benoem het beslissende criterium vóór je kiest."
          )
          key <- as.character(generated)
          msg <- feedbacks[[key]] %||% "❌ Geef een getal tussen 1 en 4 in."
          if (!key %in% names(feedbacks)) {
            msg <- paste0(
              "**Invoercontrole:** je invoer lijkt niet overeen te komen met één van de aangeboden optienummers; dit kan een typefout of een andere invoerinterpretatie zijn.\n\n",
              "**Waarom dit niet klopt:** de evaluator kan alleen een inhoudelijke optie beoordelen wanneer één geldig optienummer is ingevoerd.\n\n",
              "**Denkregel:** koppel eerst elke antwoordoptie aan haar nummer en voer uitsluitend dat ene nummer in.\n\n",
              "**Volgende stap:** lees de opties opnieuw, kies het nummer dat bij je redenering hoort en dien alleen dat nummer in."
            )
          }
          get_reporter()$add_message(msg, type = "markdown")
          generated == expected
        }
      )
    }
  )
})
