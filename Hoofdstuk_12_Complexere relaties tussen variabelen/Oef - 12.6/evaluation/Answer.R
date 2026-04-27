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
                        "2" = "❌ Fout. **14%** is de R² van **Morele boosheid**, niet van Morele intuities (groepsgericht).\n\n**Correct antwoord:** 1 (2%) — zoek de R² die bij de ellips 'Morele intuities (groepsgericht)' staat.",
                        "3" = "❌ Fout. **24%** is de R² van **Geanticipeerde schuld**, niet van Morele intuities (groepsgericht).\n\n**Correct antwoord:** 1 (2%)",
                        "4" = "❌ Fout. **38%** is de R² van **Morele intuities (individualiserend)**, niet van Morele intuities (groepsgericht).\n\n**Correct antwoord:** 1 (2%)"
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
