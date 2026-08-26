context({
    testcase(
        "",
        {
            testEqual(
                "",
                function(env) as.numeric(env$evaluationResult),
                1, # Correct answer: 2%
                comparator = function(generated, expected, ...) {
                    feedbacks <- list(
                        "1" = "✅ Juist! De **R² van Morele intuities (groepsgericht)** is **2%**. Dit betekent dat de twee dimensies van empathie samen slechts 2% van de variantie in deze variabele verklaren — empathische perspectiefneming heeft dus nauwelijks invloed op de groepsgerichte morele intuities.",
                        "2" = "❌ Fout. **Waarschijnlijke redenering:** je hebt mogelijk een R²-label bij een andere variabele afgelezen.\n\n**Waarom dit niet klopt:** een R²-label beschrijft de verklaarde variantie van de specifieke variabele waarbij het in het diagram staat.\n\n**Denkregel:** koppel ieder R²-label eerst aan zijn eigen endogene variabele voordat je een waarde kiest.\n\n**Volgende stap:** lokaliseer de volledige naam van de gevraagde variabele en lees uitsluitend het direct bijbehorende R²-label.",
                        "3" = "❌ Fout. **Waarschijnlijke redenering:** je hebt mogelijk een nabijgelegen R²-label aan de gevraagde variabele gekoppeld.\n\n**Waarom dit niet klopt:** ruimtelijke nabijheid alleen is onvoldoende; het label moet bij het juiste endogene knooppunt horen.\n\n**Denkregel:** identificeer eerst het knooppunt en koppel daarna pas het R²-label.\n\n**Volgende stap:** omcirkel de doelvariabele, controleer welk label ermee verbonden is en probeer opnieuw.",
                        "4" = "❌ Fout. **Waarschijnlijke redenering:** je hebt mogelijk twee inhoudelijk verwante variabelen met een vergelijkbare naam verwisseld.\n\n**Waarom dit niet klopt:** verwante constructen zijn afzonderlijke knooppunten en kunnen verschillende hoeveelheden verklaarde variantie hebben.\n\n**Denkregel:** controleer de volledige variabelenaam, inclusief de specificatie tussen haakjes.\n\n**Volgende stap:** zoek expliciet de groepsgerichte variant en lees alleen het label dat bij dat knooppunt staat."
                    )
          key <- as.character(generated)
          msg <- feedbacks[[key]] %||% "❌ Geef een getal tussen 1 en 4 in."
          if (identical(generated, expected)) {
            msg <- paste0(msg, "\n\n**Bevestiging:** deze keuze komt overeen met de ongewijzigde antwoordsleutel.\n\n**Denkregel:** elk R²-label hoort bij de endogene variabele waarvan de inkomende predictoren variantie verklaren.\n\n**Transferstap:** omcirkel in een nieuw diagram eerst de doelvariabele en lees pas daarna het aangrenzende R²-label.")
          } else if (!key %in% names(feedbacks)) {
          msg <- paste0(msg, "\n\n**Controleer je invoer:** de invoer is leeg, niet-numeriek of buiten de aangeboden opties; daardoor kan geen inhoudelijke keuze worden vastgesteld.\n\n**Waarom dit niet klopt:** alleen één van de aangeboden optienummers kan met de antwoordsleutel worden beoordeeld.\n\n**Denkregel:** voer een geldige optie 1–4 in en koppel het R²-label aan de volledige variabelenaam.\n\n**Volgende stap:** zoek groepsgerichte intuïties en lees uitsluitend het bijbehorende percentage.")
          }
                    get_reporter()$add_message(msg, type = "markdown")
                    generated == expected
                }
            )
        }
    )
})
