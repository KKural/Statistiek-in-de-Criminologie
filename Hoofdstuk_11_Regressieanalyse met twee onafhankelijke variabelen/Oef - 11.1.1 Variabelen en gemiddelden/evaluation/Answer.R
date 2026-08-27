context({
  testcase("", {
    testEqual("", function(env) {
      expected_values <- c(afhankelijke_variabele = 3, scp_x1y = -4, voorspelling = 10, interpretatie_b1 = 2)
      read_number <- function(name) {
        if (!exists(name, envir = env)) return(NA_real_)
        value <- suppressWarnings(as.numeric(get(name, envir = env)))
        if (length(value) != 1L || !is.finite(value)) return(NA_real_)
        value
      }
      values <- vapply(names(expected_values), read_number, numeric(1))
      valid <- all(is.finite(values))
      correct <- valid && all(abs(values - expected_values) <= 0.0005)
      assign("results_11_1_1_combined", list(values = values, expected = expected_values, valid = valid), envir = globalenv())
      correct
    }, TRUE, comparator = function(generated, expected, ...) {
      results <- get("results_11_1_1_combined", envir = globalenv())
      if (isTRUE(generated == expected)) {
        message <- paste(
          "**Bevestiging:** alle vier regressieonderdelen zijn correct: Y is de angstscore, SCP_X1Y = −4, ŷ = 10 en b1 heeft een negatieve partiële interpretatie.",
          "**Denkregel:** een regressiemodel koppelt een uitkomst aan predictors; coëfficiënten beschrijven verandering bij constante andere predictors.",
          "**Transferstap:** label bij een nieuw model eerst Y en de X-variabelen, bereken daarna pas bouwstenen, voorspellingen en interpretaties.",
          sep = "\n\n"
        )
      } else if (!results$valid) {
        missing_fields <- names(results$expected)[!is.finite(results$values)]
        message <- paste(
          paste0("**Waarschijnlijke redenering:** de volgende antwoorden ontbreken of zijn geen enkel eindig getal: ", paste(missing_fields, collapse = ", "), "."),
          "**Waarom dit niet klopt:** elk veld vertegenwoordigt een afzonderlijk onderdeel van hetzelfde regressiemodel.",
          "**Denkregel:** gebruik één numeriek resultaat of één opgegeven antwoordcode per lege plaats.",
          "**Volgende stap:** vul alle vier velden in en koppel ze aan de overeenkomstige genummerde vraag.",
          sep = "\n\n"
        )
      } else {
        wrong_field <- names(which(abs(results$values - results$expected) > 0.0005))[[1L]]
        likely <- switch(wrong_field,
          afhankelijke_variabele = "Je hebt waarschijnlijk een predictor gekozen in plaats van de variabele die wordt voorspeld.",
          scp_x1y = "Je hebt waarschijnlijk de tekens van de gecentreerde producten genegeerd.",
          voorspelling = "Je hebt waarschijnlijk het minteken voor X2 gemist of een coëfficiënt niet vermenigvuldigd.",
          interpretatie_b1 = "Je hebt waarschijnlijk alleen naar de grootte van b1 gekeken en het negatieve teken of de controle voor X2 gemist.",
          "Je hebt een regressieonderdeel verwisseld."
        )
        why <- switch(wrong_field,
          afhankelijke_variabele = "De angstscore Y wordt voorspeld en is dus de afhankelijke variabele, code 3.",
          scp_x1y = "(−1)(2) + 0(0) + 1(−2) = −4.",
          voorspelling = "5 + 2(4) − 1(3) = 10.",
          interpretatie_b1 = "b1 = −2.2 betekent dat de voorspelde Y daalt wanneer X1 stijgt, bij constante X2; dat is code 2.",
          "Het antwoord komt niet overeen met het gevraagde modelonderdeel."
        )
        next_step <- switch(wrong_field,
          afhankelijke_variabele = "Onderstreep in de onderzoeksvraag wat wordt voorspeld.",
          scp_x1y = "Schrijf de drie producten afzonderlijk uit met hun teken.",
          voorspelling = "Vul X1 en X2 eerst tussen haakjes in de volledige vergelijking in.",
          interpretatie_b1 = "Lees eerst het teken en voeg daarna de formulering bij constante X2 toe.",
          "Lees de bijbehorende genummerde vraag opnieuw."
        )
        message <- paste(
          paste0("**Waarschijnlijke redenering:** ", likely),
          paste0("**Waarom dit niet klopt:** ", why),
          "**Denkregel:** onderscheid steeds de rol van een variabele, de berekening en de inhoudelijke interpretatie.",
          paste0("**Volgende stap:** ", next_step),
          sep = "\n\n"
        )
      }
      get_reporter()$add_message(message, type = "markdown")
      generated == expected
    })
  })
})
