context({
  testcase("", {
    testEqual("", function(env) {
      expected_value <- 0.16; value <- if (exists("kans_boven_grens", envir = env)) suppressWarnings(as.numeric(get("kans_boven_grens", envir = env))) else NA_real_
      valid <- length(value) == 1L && is.finite(value); assign("results_5_2", list(valid = valid, value = value), envir = globalenv()); valid && abs(value - expected_value) <= 0.0005
    }, TRUE, comparator = function(generated, expected, ...) {
      results <- get("results_5_2", envir = globalenv())
      if (isTRUE(generated == expected)) message <- paste("**Bevestiging:** je antwoord past bij het leerdoel van deze korte oefening.", "**Denkregel:** Voor complementaire gebeurtenissen geldt P(X > grens) = 1 − P(X ≤ grens).", "**Transferstap:** Trek de gegeven cumulatieve kans af van 1.", sep = "\n\n")
      else if (!results$valid) message <- paste("**Waarschijnlijke redenering:** het antwoord ontbreekt, bevat tekst of is niet één eindig getal.", "**Waarom dit niet klopt:** deze oefening verwacht precies één waarde of optienummer.", "**Denkregel:** Voor complementaire gebeurtenissen geldt P(X > grens) = 1 − P(X ≤ grens).", "**Volgende stap:** Trek de gegeven cumulatieve kans af van 1.", sep = "\n\n")
      else { value <- results$value; likely <- "Je hebt een verwante grootheid of verkeerde antwoordoptie gekozen."
        if (abs(value - 0.84) <= 0.0005) likely <- "Je hebt de gegeven ondergrenskans overgenomen in plaats van het complement."
        if (abs(value - 1.84) <= 0.0005) likely <- "Je hebt de kans bij 1 opgeteld in plaats van ervan afgetrokken."
        message <- paste(paste0("**Waarschijnlijke redenering:** ", likely), "**Waarom dit niet klopt:** Voor complementaire gebeurtenissen geldt P(X > grens) = 1 − P(X ≤ grens).", "**Denkregel:** Voor complementaire gebeurtenissen geldt P(X > grens) = 1 − P(X ≤ grens).", "**Volgende stap:** Trek de gegeven cumulatieve kans af van 1.", sep = "\n\n") }
      get_reporter()$add_message(message, type = "markdown"); generated == expected
    })
  })
})
