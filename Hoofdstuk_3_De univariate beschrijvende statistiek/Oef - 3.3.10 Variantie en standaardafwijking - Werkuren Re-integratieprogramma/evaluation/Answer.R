context({
  testcase("", {
    testEqual("", function(env) {
      expected_value <- 20; value <- if (exists("steekproefvariantie", envir = env)) suppressWarnings(as.numeric(get("steekproefvariantie", envir = env))) else NA_real_
      valid <- length(value) == 1L && is.finite(value); assign("results_3_3_10", list(valid = valid, value = value), envir = globalenv()); valid && abs(value - expected_value) <= 0.0005
    }, TRUE, comparator = function(generated, expected, ...) {
      results <- get("results_3_3_10", envir = globalenv())
      if (isTRUE(generated == expected)) message <- paste("**Bevestiging:** je antwoord past bij het leerdoel van deze korte oefening.", "**Denkregel:** Een steekproefvariantie deelt SS door n − 1.", "**Transferstap:** Gebruik vier vrijheidsgraden en deel 80 door 4.", sep = "\n\n")
      else if (!results$valid) message <- paste("**Waarschijnlijke redenering:** het antwoord ontbreekt, bevat tekst of is niet één eindig getal.", "**Waarom dit niet klopt:** deze oefening verwacht precies één waarde of optienummer.", "**Denkregel:** Een steekproefvariantie deelt SS door n − 1.", "**Volgende stap:** Gebruik vier vrijheidsgraden en deel 80 door 4.", sep = "\n\n")
      else { value <- results$value; likely <- "Je hebt een verwante grootheid of verkeerde antwoordoptie gekozen."
        if (abs(value - 16) <= 0.0005) likely <- "Je hebt door n gedeeld en de populatievariantie berekend."
        if (abs(value - 80) <= 0.0005) likely <- "Je hebt SS overgenomen zonder door de vrijheidsgraden te delen."
        message <- paste(paste0("**Waarschijnlijke redenering:** ", likely), "**Waarom dit niet klopt:** Een steekproefvariantie deelt SS door n − 1.", "**Denkregel:** Een steekproefvariantie deelt SS door n − 1.", "**Volgende stap:** Gebruik vier vrijheidsgraden en deel 80 door 4.", sep = "\n\n") }
      get_reporter()$add_message(message, type = "markdown"); generated == expected
    })
  })
})
