context({
  testcase("", {
    testEqual("", function(env) {
      expected_values <- c(interpretatie_b1 = 1, delta_r2 = 0.08, modelverbetering = 1, modelconclusie = 1, voorspelling = 16)
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
          "**Bevestiging:** de coëfficiënt, ΔR², modelverbetering, globale F-toets en voorspelling zijn alle correct geïnterpreteerd.",
          "**Denkregel:** lees regressie-output van lokaal naar globaal: coëfficiënten, verandering in R², modeltoets en toepassing op een nieuwe observatie.",
          "**Transferstap:** gebruik bij nieuwe output dezelfde volgorde en benoem telkens welke conclusie de betreffende statistiek wel en niet ondersteunt.",
          sep = "\n\n"
        )
      } else if (!results$valid) {
        missing_fields <- names(results$expected)[!is.finite(results$values)]
        message <- paste(
          paste0("**Waarschijnlijke redenering:** de volgende antwoorden ontbreken of zijn geen enkel eindig getal: ", paste(missing_fields, collapse = ", "), "."),
          "**Waarom dit niet klopt:** een volledige beoordeling van de regressie-output vereist een antwoord op elk van de vijf onderdelen.",
          "**Denkregel:** gebruik één numeriek resultaat of de opgegeven antwoordcode per lege plaats.",
          "**Volgende stap:** vul alle velden in en controleer daarna berekeningen, significantiecodes en voorspelling afzonderlijk.",
          sep = "\n\n"
        )
      } else {
        wrong_field <- names(which(abs(results$values - results$expected) > 0.0005))[[1L]]
        likely <- switch(wrong_field,
          interpretatie_b1 = "Je hebt waarschijnlijk de voorwaarde bij constante X2 of het verschil tussen gemiddeld en altijd gemist.",
          delta_r2 = "Je hebt waarschijnlijk de twee R²-waarden opgeteld of in de verkeerde richting afgetrokken.",
          modelverbetering = "Je hebt p = 0.02 waarschijnlijk niet met α = 0.05 vergeleken.",
          modelconclusie = "Je hebt de globale F-toets waarschijnlijk als bewijs over elke afzonderlijke coëfficiënt of aanname gelezen.",
          voorspelling = "Je hebt waarschijnlijk het intercept of een product van coëfficiënt en predictor weggelaten.",
          "Je hebt een onderdeel van de output verwisseld."
        )
        why <- switch(wrong_field,
          interpretatie_b1 = "b1 = 3 beschrijft de gemiddelde verandering in ŷ per eenheid X1 terwijl X2 constant blijft; dat is code 1.",
          delta_r2 = "ΔR² = 0.38 − 0.30 = 0.08.",
          modelverbetering = "0.02 is kleiner dan 0.05, dus de verbetering is significant en hoort bij code 1.",
          modelconclusie = "De globale F-toets vergelijkt het volledige predictormodel met het nulmodel; alleen code 1 drukt dat uit.",
          voorspelling = "5 + 2(1) + 3(3) = 16.",
          "Het antwoord volgt niet uit de genoemde output."
        )
        next_step <- switch(wrong_field,
          interpretatie_b1 = "Lees de optie die verandering in X1 combineert met constante X2.",
          delta_r2 = "Trek de R² van het kleinere model af van die van het uitgebreide model.",
          modelverbetering = "Plaats p en α naast elkaar en kies de code die bij p < α hoort.",
          modelconclusie = "Formuleer eerst welke modellen de globale F-toets vergelijkt.",
          voorspelling = "Vul beide predictorwaarden tussen haakjes in de volledige vergelijking in.",
          "Lees de bijbehorende genummerde vraag opnieuw."
        )
        message <- paste(
          paste0("**Waarschijnlijke redenering:** ", likely),
          paste0("**Waarom dit niet klopt:** ", why),
          "**Denkregel:** een coëfficiënt, ΔR², p-waarde, F-toets en voorspelling beantwoorden elk een andere regressievraag.",
          paste0("**Volgende stap:** ", next_step),
          sep = "\n\n"
        )
      }
      get_reporter()$add_message(message, type = "markdown")
      generated == expected
    })
  })
})
