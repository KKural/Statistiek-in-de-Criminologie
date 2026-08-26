context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          expected_values <- c(0.1000, 0.3545, 0.6636, 0.8545, 1.0000)
          if (!exists("cumulatieve_relatieve_frequenties", envir = env)) {
            result <- list(ok = FALSE, valid = FALSE, value = numeric(0), expected = expected_values)
          } else {
            value <- suppressWarnings(as.numeric(get("cumulatieve_relatieve_frequenties", envir = env)))
            valid <- length(value) == 5L && all(is.finite(value))
            result <- list(
              ok = valid && all(abs(value - expected_values) <= 0.00005),
              valid = valid,
              value = value,
              expected = expected_values
            )
          }
          assign("results_3_2c", result, envir = globalenv())
          isTRUE(result$ok)
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          result <- get("results_3_2c", envir = globalenv())
          gewone_relatieve <- c(0.1000, 0.2545, 0.3091, 0.1909, 0.1455)
          if (isTRUE(generated == expected)) {
            message <- paste(
              "**Bevestiging:** de cumulatieve proporties zijn correct, lopen niet terug en eindigen op 1.",
              "**Denkregel:** cumulatief relatief = cumulatief absoluut / N; iedere rij bevat alle eerdere categorieën.",
              "**Transferstap:** gebruik een nieuwe ordinale schaal en zoek met de cumulatieve proporties waar 25%, 50% en 75% worden bereikt.",
              sep = "\n\n"
            )
          } else {
            if (!result$valid) {
              likely <- "Je vector bevat waarschijnlijk nog een `NA`, tekst of een verkeerd aantal waarden."
              why <- "Er is precies één eindige cumulatieve proportie per categorie nodig."
              next_step <- "Vul vijf getallen tussen 0 en 1 in, in de tabelvolgorde."
            } else if (all(abs(result$value - gewone_relatieve) <= 0.00005)) {
              likely <- "Je hebt de gewone relatieve frequenties ingevuld zonder ze cumulatief op te bouwen."
              why <- "Vanaf de tweede rij moet ook het aandeel van alle eerdere categorieën worden meegenomen."
              next_step <- "Behoud de eerste proportie en tel bij iedere volgende rij de nieuwe proportie op bij het vorige lopende totaal."
            } else if (abs(tail(result$value, 1) - 1) > 0.00005) {
              likely <- "Een eerdere fout in de lopende som werkt door tot de laatste categorie."
              why <- "Na de laatste categorie is de volledige steekproef opgenomen, dus de eindwaarde moet 1 zijn."
              next_step <- "Werk opnieuw van boven naar beneden en controleer na elke rij het lopende totaal."
            } else {
              first_wrong <- which(abs(result$value - result$expected) > 0.00005)[1]
              likely <- paste0("De cumulatieve berekening wijkt voor het eerst af op positie ", first_wrong, ".")
              why <- paste0("Daar hoort de cumulatieve proportie ", format(result$expected[first_wrong], nsmall = 4), " te staan.")
              next_step <- "Deel de cumulatieve absolute frequentie op die rij door N en herbereken de volgende rijen."
            }
            message <- paste(
              paste0("**Waarschijnlijke redenering:** ", likely),
              paste0("**Waarom dit niet klopt:** ", why),
              "**Denkregel:** cumulatieve proporties kunnen alleen gelijk blijven of stijgen en eindigen bij 1.",
              paste0("**Volgende stap:** ", next_step),
              sep = "\n\n"
            )
          }
          get_reporter()$add_message(message, type = "markdown")
          generated == expected
        }
      )
    }
  )
})
