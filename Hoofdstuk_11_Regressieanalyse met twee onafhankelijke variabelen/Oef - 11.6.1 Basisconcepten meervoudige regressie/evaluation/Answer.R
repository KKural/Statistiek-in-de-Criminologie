context({
  testcase("", {
    testEqual("", function(env) {
      expected_values <- c(interpretatie_b1 = 1, delta_r2 = 0.08, modelverbetering = 1)
      read_number <- function(name) {
        if (!exists(name, envir = env)) return(NA_real_)
        value <- suppressWarnings(as.numeric(get(name, envir = env)))
        if (length(value) != 1L || !is.finite(value)) return(NA_real_)
        value
      }
      values <- vapply(names(expected_values), read_number, numeric(1))
      valid <- all(is.finite(values))
      correct <- valid && all(abs(values - expected_values) <= 0.0005)
      assign("results_11_6_1_combined", list(values = values, expected = expected_values, valid = valid), envir = globalenv())
      correct
    }, TRUE, comparator = function(generated, expected, ...) {
      results <- get("results_11_6_1_combined", envir = globalenv())
      if (isTRUE(generated == expected)) {
        message <- paste(
          "**Bevestiging:** de partiële coëfficiënt, ΔR² en significantie van de modelverbetering zijn correct geïnterpreteerd.",
          "**Denkregel:** interpreteer eerst de coëfficiënt bij constante andere predictors; bereken daarna ΔR² als R² uitgebreid min R² klein en vergelijk p met α.",
          "**Transferstap:** pas dezelfde drie stappen toe wanneer een nieuw regressiemodel één extra predictor toevoegt.",
          sep = "\n\n"
        )
      } else if (!results$valid) {
        missing_fields <- names(results$expected)[!is.finite(results$values)]
        message <- paste(
          paste0("**Waarschijnlijke redenering:** de volgende antwoorden ontbreken of zijn geen enkel eindig getal: ", paste(missing_fields, collapse = ", "), "."),
          "**Waarom dit niet klopt:** deze oefening vraagt één antwoord voor de coëfficiënt, één voor ΔR² en één voor de significantietoets.",
          "**Denkregel:** gebruik één numeriek resultaat of de opgegeven antwoordcode per lege plaats.",
          "**Volgende stap:** vul alle velden in en controleer daarna de interpretatie, de berekening en de significantiecode afzonderlijk.",
          sep = "\n\n"
        )
      } else {
        wrong_field <- names(which(abs(results$values - results$expected) > 0.0005))[[1L]]
        likely <- switch(wrong_field,
          interpretatie_b1 = "Je hebt waarschijnlijk de voorwaarde bij constante X2 of het verschil tussen gemiddeld en altijd gemist.",
          delta_r2 = "Je hebt waarschijnlijk de twee R²-waarden opgeteld of in de verkeerde richting afgetrokken.",
          modelverbetering = "Je hebt p = 0.02 waarschijnlijk niet met α = 0.05 vergeleken.",
          "Je hebt een onderdeel van de output verwisseld."
        )
        why <- switch(wrong_field,
          interpretatie_b1 = "b1 = 3 beschrijft de gemiddelde verandering in ŷ per eenheid X1 terwijl X2 constant blijft; dat is code 1.",
          delta_r2 = "ΔR² = 0.38 − 0.30 = 0.08.",
          modelverbetering = "0.02 is kleiner dan 0.05, dus de verbetering is significant en hoort bij code 1.",
          "Het antwoord volgt niet uit de genoemde output."
        )
        next_step <- switch(wrong_field,
          interpretatie_b1 = "Lees de optie die verandering in X1 combineert met constante X2.",
          delta_r2 = "Trek de R² van het kleinere model af van die van het uitgebreide model.",
          modelverbetering = "Plaats p en α naast elkaar en kies de code die bij p < α hoort.",
          "Lees de bijbehorende genummerde vraag opnieuw."
        )
        message <- paste(
          paste0("**Waarschijnlijke redenering:** ", likely),
          paste0("**Waarom dit niet klopt:** ", why),
          "**Denkregel:** een partiële coëfficiënt beschrijft een gecontroleerde verandering, ΔR² de extra verklaarde variantie en de p-waarde de significantie van die verbetering.",
          paste0("**Volgende stap:** ", next_step),
          sep = "\n\n"
        )
      }
      get_reporter()$add_message(message, type = "markdown")
      generated == expected
    })
  })
})
