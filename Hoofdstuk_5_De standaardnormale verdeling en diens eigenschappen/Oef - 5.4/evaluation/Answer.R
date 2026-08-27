context({
  testcase("", {
    testEqual("", function(env) {
      expected_values <- c(bier_tussen_pct = 38.30, bier_boven_pct = 15.87, leeftijdsgrens_optie = 4)
      tolerances <- c(bier_tussen_pct = 0.0051, bier_boven_pct = 0.0051, leeftijdsgrens_optie = 0)

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
        "results_5_4_grouped",
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
      results <- get("results_5_4_grouped", envir = globalenv())

      if (isTRUE(generated == expected)) {
        message <- paste(
          "**Bevestiging:** de intervalkans is 38.30%, de rechterstaart is 15.87% en optie 4 geeft de grens van ongeveer 45 jaar voor de oudste 10%.",
          "**Denkregel:** zet elke ruwe grens om naar z, kies de juiste oppervlakte en zet een kans alleen dan om naar procent wanneer de vraag een percentage verlangt.",
          "**Transferstap:** noteer bij een nieuwe toepassing naast elke grens het bijbehorende z-teken en arceer het gevraagde gebied.",
          sep = "\n\n"
        )
      } else if (!all(results$valid)) {
        missing_fields <- names(results$valid)[!results$valid]
        message <- paste(
          paste0("**Waarschijnlijke redenering:** er ontbreekt een geldige numerieke invoer voor: ", paste(missing_fields, collapse = ", "), "."),
          "**Waarom dit niet klopt:** elke genummerde deelvraag heeft precies één getal of optienummer nodig; zonder alle antwoorden kan de volledige redenering niet worden beoordeeld.",
          "**Denkregel:** zet elke ruwe grens om naar z, kies de juiste oppervlakte en zet een kans alleen dan om naar procent wanneer de vraag een percentage verlangt.",
          paste0("**Volgende stap:** vul eerst alleen de lege velden ", paste(missing_fields, collapse = ", "), " in en dien opnieuw in."),
          sep = "\n\n"
        )
      } else {
        wrong_field <- names(results$correct_fields)[!results$correct_fields][[1L]]
        likely <- switch(
          wrong_field,
          bier_tussen_pct = { value <- results$values[[wrong_field]]; if (abs(value - 0.3830) <= 0.0005) "je hebt de juiste kans berekend maar niet naar procent omgezet." else "je hebt waarschijnlijk één staart gebruikt in plaats van het verschil tussen beide cumulatieve kansen." },
          bier_boven_pct = { value <- results$values[[wrong_field]]; if (abs(value - 84.13) <= 0.01) "je hebt de linkerkans onder 35 cl gebruikt in plaats van de rechterstaart." else if (abs(value - 0.1587) <= 0.0005) "je hebt de kans niet naar procent omgezet." else "je hebt waarschijnlijk de verkeerde staart of schaal gebruikt." },
          leeftijdsgrens_optie = { value <- results$values[[wrong_field]]; if (value == 2 || value == 3) "je hebt een te extreme z-grens gekozen en selecteert minder dan 10%." else if (value == 1) "je hebt een grens gekozen waar meer dan 10% boven ligt." else "je hebt ten onrechte aangenomen dat de grens niet uit μ, σ en het percentiel kan worden berekend." }
        )
        why <- switch(
          wrong_field,
          bier_tussen_pct = "tussen 32 en 34 liggen z = -0.5 en z = 0.5; Φ(0.5) - Φ(-0.5) = 0.3830 = 38.30%.",
          bier_boven_pct = "35 cl geeft z = 1; P(Z > 1) = 1 - 0.8413 = 0.1587 = 15.87%.",
          leeftijdsgrens_optie = "de oudste 10% begint bij het 90e percentiel: 37.8 + 1.28 × 5.6 ≈ 45 jaar, optie 4."
        )
        next_step <- switch(
          wrong_field,
          bier_tussen_pct = "trek de twee cumulatieve kansen van elkaar af en vermenigvuldig daarna met 100.",
          bier_boven_pct = "bereken het complement van Φ(1) en zet dit resultaat om naar procent.",
          leeftijdsgrens_optie = "gebruik z0.90 ≈ 1.28 in X = μ + zσ en rond pas het eindresultaat af."
        )
        message <- paste(
          paste0("**Waarschijnlijke redenering:** ", likely),
          paste0("**Waarom dit niet klopt:** ", why),
          "**Denkregel:** zet elke ruwe grens om naar z, kies de juiste oppervlakte en zet een kans alleen dan om naar procent wanneer de vraag een percentage verlangt.",
          paste0("**Volgende stap:** ", next_step),
          sep = "\n\n"
        )
      }

      get_reporter()$add_message(message, type = "markdown")
      generated == expected
    })
  })
})
