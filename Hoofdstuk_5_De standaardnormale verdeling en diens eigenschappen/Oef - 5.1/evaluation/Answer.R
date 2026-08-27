context({
  testcase("", {
    testEqual("", function(env) {
      expected_values <- c(z_score = 2, kans_boven_grens = 0.16, anesthesie_risico = 2)
      tolerances <- c(z_score = 0.0005, kans_boven_grens = 0.0005, anesthesie_risico = 0)

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
        "results_5_1_grouped",
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
      results <- get("results_5_1_grouped", envir = globalenv())

      if (isTRUE(generated == expected)) {
        message <- paste(
          "**Bevestiging:** alle drie antwoorden zijn juist: z = 2, de complementkans is 0.16 en optie 2 geeft het anesthesierisico van ongeveer 0.9%.",
          "**Denkregel:** standaardiseer met z = (X - μ) / σ; bepaal daarna expliciet of de gevraagde oppervlakte links, rechts of tussen grenzen ligt.",
          "**Transferstap:** markeer bij een nieuwe normale-verdelingsvraag eerst de grens en de gevraagde oppervlakte voordat je rekent.",
          sep = "\n\n"
        )
      } else if (!all(results$valid)) {
        missing_fields <- names(results$valid)[!results$valid]
        message <- paste(
          paste0("**Waarschijnlijke redenering:** er ontbreekt een geldige numerieke invoer voor: ", paste(missing_fields, collapse = ", "), "."),
          "**Waarom dit niet klopt:** elke genummerde deelvraag heeft precies één getal of optienummer nodig; zonder alle antwoorden kan de volledige redenering niet worden beoordeeld.",
          "**Denkregel:** standaardiseer met z = (X - μ) / σ; bepaal daarna expliciet of de gevraagde oppervlakte links, rechts of tussen grenzen ligt.",
          paste0("**Volgende stap:** vul eerst alleen de lege velden ", paste(missing_fields, collapse = ", "), " in en dien opnieuw in."),
          sep = "\n\n"
        )
      } else {
        wrong_field <- names(results$correct_fields)[!results$correct_fields][[1L]]
        likely <- switch(
          wrong_field,
          z_score = { value <- results$values[[wrong_field]]; if (abs(value - 12) <= 0.0005) "je hebt alleen X - μ berekend en nog niet door σ gedeeld." else "je hebt de ruwe afstand en de afstand in standaardafwijkingen door elkaar gehaald." },
          kans_boven_grens = { value <- results$values[[wrong_field]]; if (abs(value - 0.84) <= 0.0005) "je hebt de gegeven linkerkans overgenomen in plaats van de rechterstaart te bepalen." else "je hebt de grens waarschijnlijk aan de verkeerde staart gekoppeld." },
          anesthesie_risico = { value <- results$values[[wrong_field]]; if (value == 3) "je hebt mogelijk het 95e in plaats van het 92e percentiel gebruikt." else if (value == 4) "je hebt mogelijk de verkeerde staart of een tweezijdige kans gebruikt." else "je hebt de dosisgrens niet consequent van de effectieve naar de letale verdeling overgebracht." }
        )
        why <- switch(
          wrong_field,
          z_score = "een z-score is geen ruwe afstand; 72 ligt 12 punten, dus 12 / 6 = 2 standaardafwijkingen boven het gemiddelde.",
          kans_boven_grens = "P(X > grens) is het complement van P(X ≤ grens), dus 1 - 0.84 = 0.16.",
          anesthesie_risico = "de 92%-dosis is ongeveer 57.65 mg; in N(100,18) hoort daarbij z ≈ -2.36 en een linkerkans van ongeveer 0.9%, dus optie 2."
        )
        next_step <- switch(
          wrong_field,
          z_score = "bereken eerst 72 - 60 en deel het resultaat door 6.",
          kans_boven_grens = "teken de grens en trek de linkerkans af van 1.",
          anesthesie_risico = "bereken eerst de 92%-dosis en gebruik exact die dosis als grens in de letale verdeling."
        )
        message <- paste(
          paste0("**Waarschijnlijke redenering:** ", likely),
          paste0("**Waarom dit niet klopt:** ", why),
          "**Denkregel:** standaardiseer met z = (X - μ) / σ; bepaal daarna expliciet of de gevraagde oppervlakte links, rechts of tussen grenzen ligt.",
          paste0("**Volgende stap:** ", next_step),
          sep = "\n\n"
        )
      }

      get_reporter()$add_message(message, type = "markdown")
      generated == expected
    })
  })
})
