context({
  testcase("", {
    testEqual("", function(env) {
      expected_value <- 24; value <- if (exists("gemiddelde", envir = env)) suppressWarnings(as.numeric(get("gemiddelde", envir = env))) else NA_real_
      valid <- length(value) == 1L && is.finite(value); assign("results_3_3_3", list(valid = valid, value = value), envir = globalenv()); valid && abs(value - expected_value) <= 0.0005
    }, TRUE, comparator = function(generated, expected, ...) {
      results <- get("results_3_3_3", envir = globalenv())
      if (isTRUE(generated == expected)) message <- paste("**Bevestiging:** je antwoord past bij het leerdoel van deze korte oefening.", "**Denkregel:** Gemiddelde = som van de waarden / aantal waarden.", "**Transferstap:** Tel de drie werkuren op en deel door drie.", sep = "\n\n")
      else if (!results$valid) message <- paste("**Waarschijnlijke redenering:** het antwoord ontbreekt, bevat tekst of is niet één eindig getal.", "**Waarom dit niet klopt:** deze oefening verwacht precies één waarde of optienummer.", "**Denkregel:** Gemiddelde = som van de waarden / aantal waarden.", "**Volgende stap:** Tel de drie werkuren op en deel door drie.", sep = "\n\n")
      else { value <- results$value; likely <- "Je hebt een verwante grootheid of verkeerde antwoordoptie gekozen."
        if (abs(value - 72) <= 0.0005) likely <- "Je hebt de som ingevuld zonder door het aantal waarden te delen."
        if (abs(value - 28) <= 0.0005) likely <- "Je hebt de grootste waarneming gekozen in plaats van het gemiddelde."
        message <- paste(paste0("**Waarschijnlijke redenering:** ", likely), "**Waarom dit niet klopt:** Gemiddelde = som van de waarden / aantal waarden.", "**Denkregel:** Gemiddelde = som van de waarden / aantal waarden.", "**Volgende stap:** Tel de drie werkuren op en deel door drie.", sep = "\n\n") }
      get_reporter()$add_message(message, type = "markdown"); generated == expected
    })
  })
})
