context({
  testcase("", {
    testEqual("", function(env) {
      expected_value <- 1; value <- if (exists("conclusie", envir = env)) suppressWarnings(as.numeric(get("conclusie", envir = env))) else NA_real_
      valid <- length(value) == 1L && is.finite(value); assign("results_7_2", list(valid = valid, value = value), envir = globalenv()); valid && abs(value - expected_value) <= 0.0005
    }, TRUE, comparator = function(generated, expected, ...) {
      results <- get("results_7_2", envir = globalenv())
      if (isTRUE(generated == expected)) message <- paste("**Bevestiging:** je antwoord past bij het leerdoel van deze korte oefening.", "**Denkregel:** Wanneer p < α verwerp je onafhankelijkheid, maar je concludeert geen causaliteit.", "**Transferstap:** Vergelijk 0.03 met 0.05 en formuleer alleen een samenhangsconclusie.", sep = "\n\n")
      else if (!results$valid) message <- paste("**Waarschijnlijke redenering:** het antwoord ontbreekt, bevat tekst of is niet één eindig getal.", "**Waarom dit niet klopt:** deze oefening verwacht precies één waarde of optienummer.", "**Denkregel:** Wanneer p < α verwerp je onafhankelijkheid, maar je concludeert geen causaliteit.", "**Volgende stap:** Vergelijk 0.03 met 0.05 en formuleer alleen een samenhangsconclusie.", sep = "\n\n")
      else { value <- results$value; likely <- "Je hebt een verwante grootheid of verkeerde antwoordoptie gekozen."
        if (abs(value - 2) <= 0.0005) likely <- "Je hebt de richting van de p-waardevergelijking omgekeerd."
        if (abs(value - 3) <= 0.0005) likely <- "Je trekt een causale conclusie uit een associatietoets."
        if (abs(value - 4) <= 0.0005) likely <- "Samenhang betekent niet dat twee variabelen identiek zijn."
        message <- paste(paste0("**Waarschijnlijke redenering:** ", likely), "**Waarom dit niet klopt:** Wanneer p < α verwerp je onafhankelijkheid, maar je concludeert geen causaliteit.", "**Denkregel:** Wanneer p < α verwerp je onafhankelijkheid, maar je concludeert geen causaliteit.", "**Volgende stap:** Vergelijk 0.03 met 0.05 en formuleer alleen een samenhangsconclusie.", sep = "\n\n") }
      get_reporter()$add_message(message, type = "markdown"); generated == expected
    })
  })
})
