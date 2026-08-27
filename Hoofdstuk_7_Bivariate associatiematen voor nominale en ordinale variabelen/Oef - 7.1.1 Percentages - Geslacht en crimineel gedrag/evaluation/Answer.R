context({
  testcase("", {
    testEqual("", function(env) {
      expected_values <- c(
        percentage_crimineel_mannen = 25,
        oddsratio = 2,
        interpretatie = 1
      )
      tolerances <- c(
        percentage_crimineel_mannen = 0.005,
        oddsratio = 0.005,
        interpretatie = 0
      )

      read_number <- function(name) {
        if (!exists(name, envir = env, inherits = FALSE)) return(NA_real_)
        value <- suppressWarnings(as.numeric(get(name, envir = env, inherits = FALSE)))
        if (length(value) != 1L || !is.finite(value)) return(NA_real_)
        value
      }

      values <- vapply(names(expected_values), read_number, numeric(1))
      valid <- is.finite(values)
      correct_fields <- valid & abs(values - expected_values) <= tolerances

      assign(
        "results_7_1_grouped",
        list(
          values = values,
          expected = expected_values,
          valid = valid,
          correct_fields = correct_fields
        ),
        envir = globalenv()
      )

      all(correct_fields)
    }, TRUE, comparator = function(generated, expected, ...) {
      results <- get("results_7_1_grouped", envir = globalenv())

      if (isTRUE(generated == expected)) {
        message <- paste(
          "**Bevestiging:** 25% van de mannen behoort tot de bedoelde cel, de oddsratio A/B is 2 en optie 1 interpreteert die oddsratio correct.",
          "**Denkregel:** kies eerst de juiste conditionele noemer, bereken daarna de oddsverhouding in de gevraagde richting en onderscheid odds van kansen.",
          "**Transferstap:** pas bij een nieuwe 2×2-tabel dezelfde keten toe: conditioneel percentage, oddsratio en interpretatie.",
          sep = "\n\n"
        )
      } else if (!all(results$valid)) {
        missing_fields <- names(results$valid)[!results$valid]
        message <- paste(
          paste0(
            "**Waarschijnlijke redenering:** er ontbreekt een geldige numerieke invoer voor: ",
            paste(missing_fields, collapse = ", "), "."
          ),
          "**Waarom dit niet klopt:** elke deelvraag heeft precies één getal of optienummer nodig; zonder alle antwoorden kan de redenering niet volledig worden beoordeeld.",
          "**Denkregel:** kies eerst de juiste conditionele noemer, bereken daarna de oddsverhouding in de gevraagde richting en onderscheid odds van kansen.",
          paste0(
            "**Volgende stap:** vul eerst alleen de lege velden ",
            paste(missing_fields, collapse = ", "), " in en dien opnieuw in."
          ),
          sep = "\n\n"
        )
      } else {
        wrong_field <- names(results$correct_fields)[!results$correct_fields][[1L]]
        likely <- switch(
          wrong_field,
          percentage_crimineel_mannen = {
            value <- results$values[[wrong_field]]
            if (abs(value - 0.25) <= 0.0005) {
              "je hebt de correcte proportie ingevoerd, maar niet het gevraagde percentage."
            } else {
              "je hebt waarschijnlijk het verkeerde totaal als conditionele noemer gebruikt."
            }
          },
          oddsratio = {
            value <- results$values[[wrong_field]]
            if (abs(value - 0.5) <= 0.005) {
              "je hebt de verhouding omgekeerd en B/A berekend."
            } else if (abs(value - 0.25) <= 0.005) {
              "je hebt de odds van één groep overgenomen zonder de verhouding te vormen."
            } else {
              "je hebt odds mogelijk als kansen behandeld."
            }
          },
          interpretatie = {
            value <- results$values[[wrong_field]]
            if (value == 2) {
              "je hebt een verhouding van odds geïnterpreteerd als een exacte verhouding van kansen."
            } else {
              "je hebt de referentiegroep en vergelijkingsgroep verwisseld."
            }
          }
        )
        why <- switch(
          wrong_field,
          percentage_crimineel_mannen = "de vraag conditioneert op mannen: 30 / 120 × 100 = 25%.",
          oddsratio = "de gevraagde richting is A ten opzichte van B: 0.50 / 0.25 = 2.",
          interpretatie = "OR = 2 zegt dat de odds in A tweemaal die in B zijn; dit betekent niet automatisch dat de kansen exact verdubbelen."
        )
        next_step <- switch(
          wrong_field,
          percentage_crimineel_mannen = "omcirkel eerst de groep waarop wordt geconditioneerd en gebruik haar totaal als noemer.",
          oddsratio = "schrijf de richting letterlijk als odds A / odds B voordat je deelt.",
          interpretatie = "gebruik in je zin het woord odds en behoud dezelfde A/B-richting als in de berekening."
        )
        message <- paste(
          paste0("**Waarschijnlijke redenering:** ", likely),
          paste0("**Waarom dit niet klopt:** ", why),
          "**Denkregel:** kies eerst de juiste conditionele noemer, bereken daarna de oddsverhouding in de gevraagde richting en onderscheid odds van kansen.",
          paste0("**Volgende stap:** ", next_step),
          sep = "\n\n"
        )
      }

      get_reporter()$add_message(message, type = "markdown")
      generated == expected
    })
  })
})
