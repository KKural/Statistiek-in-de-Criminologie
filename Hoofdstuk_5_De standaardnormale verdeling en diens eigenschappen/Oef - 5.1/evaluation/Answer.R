context({
  testcase("", {
    testEqual("", function(env) {
      expected_value <- 2; value <- if (exists("z_score", envir = env)) suppressWarnings(as.numeric(get("z_score", envir = env))) else NA_real_
      valid <- length(value) == 1L && is.finite(value); assign("results_5_1", list(valid = valid, value = value), envir = globalenv()); valid && abs(value - expected_value) <= 0.0005
    }, TRUE, comparator = function(generated, expected, ...) {
      results <- get("results_5_1", envir = globalenv())
      if (isTRUE(generated == expected)) message <- paste("**Bevestiging:** je antwoord past bij het leerdoel van deze korte oefening.", "**Denkregel:** Een z-score drukt de afstand tot het gemiddelde uit in standaardafwijkingen.", "**Transferstap:** Bereken eerst 72 − 60 en deel daarna door 6.", sep = "\n\n")
      else if (!results$valid) message <- paste("**Waarschijnlijke redenering:** het antwoord ontbreekt, bevat tekst of is niet één eindig getal.", "**Waarom dit niet klopt:** deze oefening verwacht precies één waarde of optienummer.", "**Denkregel:** Een z-score drukt de afstand tot het gemiddelde uit in standaardafwijkingen.", "**Volgende stap:** Bereken eerst 72 − 60 en deel daarna door 6.", sep = "\n\n")
      else { value <- results$value; likely <- "Je hebt een verwante grootheid of verkeerde antwoordoptie gekozen."
        if (abs(value - 12) <= 0.0005) likely <- "Je hebt alleen de afstand tot het gemiddelde berekend."
        if (abs(value - 22) <= 0.0005) likely <- "Je hebt gedeeld of afgetrokken in de verkeerde volgorde."
        message <- paste(paste0("**Waarschijnlijke redenering:** ", likely), "**Waarom dit niet klopt:** Een z-score drukt de afstand tot het gemiddelde uit in standaardafwijkingen.", "**Denkregel:** Een z-score drukt de afstand tot het gemiddelde uit in standaardafwijkingen.", "**Volgende stap:** Bereken eerst 72 − 60 en deel daarna door 6.", sep = "\n\n") }
      get_reporter()$add_message(message, type = "markdown"); generated == expected
    })
  })
})
