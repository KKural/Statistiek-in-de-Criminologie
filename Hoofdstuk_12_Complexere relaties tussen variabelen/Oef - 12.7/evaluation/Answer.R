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
                        "2" = "❌ Fout. **Waarschijnlijke redenering:** je hebt mogelijk een R²-label bij een andere variabele afgelezen. **14%** hoort bij Morele boosheid.\n\n**Beslisregel:** een R²-waarde beschrijft de verklaarde variantie van de variabele waarbij het label staat.\n\n**Volgende stap:** lokaliseer eerst de ellips Morele intuïties (groepsgericht) en lees uitsluitend het aangrenzende R²-label: **2%**.\n\n**Correct antwoord:** 1",
                        "3" = "❌ Fout. **Waarschijnlijke redenering:** je hebt mogelijk het R²-label van Geanticipeerde schuld gevolgd; daar hoort **24%** bij.\n\n**Beslisregel:** koppel elk R²-label aan zijn eigen endogene variabele voordat je de waarde vergelijkt.\n\n**Volgende stap:** ga terug naar Morele intuïties (groepsgericht); bij die variabele staat **R² = 2%**.\n\n**Correct antwoord:** 1",
                        "4" = "❌ Fout. **Waarschijnlijke redenering:** je hebt mogelijk de twee soorten Morele intuïties verwisseld. **38%** hoort bij de individualiserende, niet bij de groepsgerichte variant.\n\n**Beslisregel:** controleer de volledige variabelenaam; verwante constructen kunnen verschillende R²-waarden hebben.\n\n**Volgende stap:** zoek expliciet het label ‘groepsgericht’ en lees daar **2%** af.\n\n**Correct antwoord:** 1"
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
