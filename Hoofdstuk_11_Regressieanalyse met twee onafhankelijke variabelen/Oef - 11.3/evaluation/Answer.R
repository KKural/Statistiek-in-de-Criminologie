context({
  testcase("", {
    testEqual("", function(env) {
      expected_values <- c(uitbijter_code = 2, punt_positie = 3, r_kwadraat_pct = 87)
      read_number <- function(name) {
        if (!exists(name, envir = env)) return(NA_real_)
        value <- suppressWarnings(as.numeric(get(name, envir = env)))
        if (length(value) != 1L || !is.finite(value)) return(NA_real_)
        value
      }
      values <- vapply(names(expected_values), read_number, numeric(1))
      valid <- all(is.finite(values))
      correct <- valid && all(abs(values - expected_values) <= 0.0005)
      assign("results_11_3_combined", list(values = values, expected = expected_values, valid = valid), envir = globalenv())
      correct
    }, TRUE, comparator = function(generated, expected, ...) {
      results <- get("results_11_3_combined", envir = globalenv())
      if (isTRUE(generated == expected)) {
        message <- paste(
          "**Bevestiging:** punt B heeft het grootste absolute residu, P ligt onder de lijn en R² komt overeen met ongeveer 87% verklaarde variantie.",
          "**Denkregel:** een residu is Y − Ŷ; R² beschrijft het verklaarde aandeel op modelniveau.",
          "**Transferstap:** controleer bij een nieuw model eerst observatieniveau en modelniveau afzonderlijk en verbind ze pas daarna.",
          sep = "\n\n"
        )
      } else if (!results$valid) {
        missing_fields <- names(results$expected)[!is.finite(results$values)]
        message <- paste(
          paste0("**Waarschijnlijke redenering:** de volgende antwoorden ontbreken of zijn niet als één getal ingevoerd: ", paste(missing_fields, collapse = ", "), "."),
          "**Waarom dit niet klopt:** de puntletter wordt hier als code 1–6 ingevoerd en de andere twee velden verwachten eveneens een numeriek antwoord.",
          "**Denkregel:** gebruik de opgegeven codes en zet R² pas daarna om naar een geheel percentage.",
          "**Volgende stap:** vul alle drie velden in zonder tekst of aanhalingstekens.",
          sep = "\n\n"
        )
      } else {
        wrong_field <- names(which(abs(results$values - results$expected) > 0.0005))[[1L]]
        likely <- switch(wrong_field,
          uitbijter_code = "Je hebt waarschijnlijk het punt met een extreme X- of Y-waarde gekozen in plaats van de grootste verticale afstand.",
          punt_positie = "Je hebt waarschijnlijk de positie visueel benoemd zonder het teken van Y − Ŷ te gebruiken.",
          r_kwadraat_pct = "Je hebt waarschijnlijk R, adjusted R² of de decimale R² ingevuld.",
          "Je hebt een diagnostische maat verwisseld."
        )
        why <- switch(wrong_field,
          uitbijter_code = "Punt B heeft een residu van ongeveer +4.8, de grootste absolute verticale afstand; B hoort bij code 2.",
          punt_positie = "16 − 18.3 = −2.3, dus P ligt onder de lijn en hoort bij code 3.",
          r_kwadraat_pct = "De gewone R² is 0.872; als geheel percentage is dat 87, niet 93, 86 of 0.872.",
          "Het antwoord hoort niet bij de gevraagde maat."
        )
        next_step <- switch(wrong_field,
          uitbijter_code = "Vergelijk voor A tot en met F de absolute waarde van Y − Ŷ.",
          punt_positie = "Bereken 16 − 18.3 en vertaal het negatieve teken naar de juiste code.",
          r_kwadraat_pct = "Selecteer eerst de kolom R² en vermenigvuldig 0.872 met 100.",
          "Koppel het veld opnieuw aan de juiste genummerde vraag."
        )
        message <- paste(
          paste0("**Waarschijnlijke redenering:** ", likely),
          paste0("**Waarom dit niet klopt:** ", why),
          "**Denkregel:** leverage, residu, R, R² en adjusted R² zijn verschillende kenmerken.",
          paste0("**Volgende stap:** ", next_step),
          sep = "\n\n"
        )
      }
      get_reporter()$add_message(message, type = "markdown")
      generated == expected
    })
  })
})
