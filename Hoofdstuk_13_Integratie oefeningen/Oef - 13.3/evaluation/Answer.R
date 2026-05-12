context({
    testcase(
        "",
        {
            testEqual(
                "",
                function(env) as.numeric(env$evaluationResult),
                1,
                comparator = function(generated, expected, ...) {
                    feedbacks <- list(
                        "1" = paste0(
                            "\u2705 Juist! Er zijn **drie indirecte routes** van Xa naar Y:\n\n",
                            "| Route | Berekening | Resultaat |\n",
                            "|-------|------------|-----------|\n",
                            "| Xa \u2192 M1 \u2192 Y | 0.50 \u00d7 (\u22120.25) | \u22120.125 |\n",
                            "| Xa \u2192 M1 \u2192 M2 \u2192 Y | 0.50 \u00d7 0.40 \u00d7 (\u22120.50) | \u22120.100 |\n",
                            "| Xa \u2192 Xb \u2192 M2 \u2192 Y | 0.40 \u00d7 0.30 \u00d7 (\u22120.50) | \u22120.060 |\n\n",
                            "**Totaal effect = \u22120.125 + (\u22120.100) + (\u22120.060) = \u22120.285**\n\n",
                            "Omdat er geen directe pijl loopt van 'Begeleidingskwaliteit' naar 'Recidiverisico', ",
                            "valt het totale effect volledig samen met de som van alle indirecte effecten. ",
                            "Het negatieve teken geeft aan dat hogere begeleidingskwaliteit samenhangt met een lager recidiverisico."
                        ),
                        "2" = paste0(
                            "\u274c Fout. \u22120.125 is slechts de eerste indirecte route (Xa \u2192 M1 \u2192 Y = 0.50 \u00d7 (\u22120.25)).\n\n",
                            "Er zijn **twee andere routes** die je niet hebt meegeteld:\n",
                            "- Xa \u2192 M1 \u2192 M2 \u2192 Y = 0.50 \u00d7 0.40 \u00d7 (\u22120.50) = \u22120.100\n",
                            "- Xa \u2192 Xb \u2192 M2 \u2192 Y = 0.40 \u00d7 0.30 \u00d7 (\u22120.50) = \u22120.060\n\n",
                            "**Correct antwoord:** 1 (\u22120.285)"
                        ),
                        "3" = paste0(
                            "\u274c Fout. \u22120.225 omvat routes 1 en 2 maar mist de route via Xb:\n",
                            "- Xa \u2192 M1 \u2192 Y = \u22120.125\n",
                            "- Xa \u2192 M1 \u2192 M2 \u2192 Y = \u22120.100\n\n",
                            "Vergeet niet de route **Xa \u2192 Xb \u2192 M2 \u2192 Y** = 0.40 \u00d7 0.30 \u00d7 (\u22120.50) = \u22120.060.\n\n",
                            "**Correct antwoord:** 1 (\u22120.285)"
                        ),
                        "4" = paste0(
                            "\u274c Fout. \u22120.060 is alleen de route via Xb (Xa \u2192 Xb \u2192 M2 \u2192 Y = 0.40 \u00d7 0.30 \u00d7 (\u22120.50)).\n\n",
                            "Je hebt de twee routes via M1 niet meegeteld:\n",
                            "- Xa \u2192 M1 \u2192 Y = \u22120.125\n",
                            "- Xa \u2192 M1 \u2192 M2 \u2192 Y = \u22120.100\n\n",
                            "**Correct antwoord:** 1 (\u22120.285)"
                        )
                    )
                    key <- as.character(generated)
                    msg <- feedbacks[[key]] %||% "\u274c Geef een getal tussen 1 en 4 in."
                    get_reporter()$add_message(msg, type = "markdown")
                    generated == expected
                }
            )
        }
    )
})
