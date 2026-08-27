context({
  testcase("", {
    testEqual("", function(env) {
      expected_value <- 30; value <- if (exists("mediaan", envir = env)) suppressWarnings(as.numeric(get("mediaan", envir = env))) else NA_real_
      valid <- length(value) == 1L && is.finite(value); assign("results_3_4_4", list(valid = valid, value = value), envir = globalenv()); valid && abs(value - expected_value) <= 0.0005
    }, TRUE, comparator = function(generated, expected, ...) {
      results <- get("results_3_4_4", envir = globalenv())
      if (isTRUE(generated == expected)) message <- paste("**Bevestiging:** je antwoord past bij het leerdoel van deze korte oefening.", "**Denkregel:** Bij een oneven aantal geordende waarden is de mediaan de middelste positie.", "**Transferstap:** Neem positie drie; laat de extreme laatste waarde de positie niet veranderen.", sep = "\n\n")
      else if (!results$valid) message <- paste("**Waarschijnlijke redenering:** het antwoord ontbreekt, bevat tekst of is niet één eindig getal.", "**Waarom dit niet klopt:** deze oefening verwacht precies één waarde of optienummer.", "**Denkregel:** Bij een oneven aantal geordende waarden is de mediaan de middelste positie.", "**Volgende stap:** Neem positie drie; laat de extreme laatste waarde de positie niet veranderen.", sep = "\n\n")
      else { value <- results$value; likely <- "Je hebt een verwante grootheid of verkeerde antwoordoptie gekozen."
        if (abs(value - 80) <= 0.0005) likely <- "Je hebt het gemiddelde berekend, dat door de uitbijter omhoog wordt getrokken."
        if (abs(value - 300) <= 0.0005) likely <- "Je hebt de grootste waarde gekozen in plaats van de middelste."
        message <- paste(paste0("**Waarschijnlijke redenering:** ", likely), "**Waarom dit niet klopt:** Bij een oneven aantal geordende waarden is de mediaan de middelste positie.", "**Denkregel:** Bij een oneven aantal geordende waarden is de mediaan de middelste positie.", "**Volgende stap:** Neem positie drie; laat de extreme laatste waarde de positie niet veranderen.", sep = "\n\n") }
      get_reporter()$add_message(message, type = "markdown"); generated == expected
    })
  })
})
