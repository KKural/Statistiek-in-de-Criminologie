context({
  testcase("", {
    testEqual("", function(env) {
      expected_value <- 2; value <- if (exists("onderzoeksopzet", envir = env)) suppressWarnings(as.numeric(get("onderzoeksopzet", envir = env))) else NA_real_
      valid <- length(value) == 1L && is.finite(value); assign("results_2_13", list(valid = valid, value = value), envir = globalenv()); valid && abs(value - expected_value) <= 0.0005
    }, TRUE, comparator = function(generated, expected, ...) {
      results <- get("results_2_13", envir = globalenv())
      if (isTRUE(generated == expected)) message <- paste("**Bevestiging:** je antwoord past bij het leerdoel van deze korte oefening.", "**Denkregel:** Een interventie met een voor-na-vergelijking maar zonder randomisatie is quasi-experimenteel.", "**Transferstap:** Controleer afzonderlijk of er een interventie, tijdsvergelijking en randomisatie is.", sep = "\n\n")
      else if (!results$valid) message <- paste("**Waarschijnlijke redenering:** het antwoord ontbreekt, bevat tekst of is niet één eindig getal.", "**Waarom dit niet klopt:** deze oefening verwacht precies één waarde of optienummer.", "**Denkregel:** Een interventie met een voor-na-vergelijking maar zonder randomisatie is quasi-experimenteel.", "**Volgende stap:** Controleer afzonderlijk of er een interventie, tijdsvergelijking en randomisatie is.", sep = "\n\n")
      else { value <- results$value; likely <- "Je hebt een verwant begrip of een andere schaal gekozen."
        if (abs(value - 1) <= 0.0005) likely <- "Je neemt randomisatie aan terwijl die ontbreekt."
        if (abs(value - 3) <= 0.0005) likely <- "Je negeert de interventie en de vergelijking tussen twee meetmomenten."
        if (abs(value - 4) <= 0.0005) likely <- "De gegevens bestaan uit aantallen delicten, niet uit interviewmateriaal."
        message <- paste(paste0("**Waarschijnlijke redenering:** ", likely), "**Waarom dit niet klopt:** Een interventie met een voor-na-vergelijking maar zonder randomisatie is quasi-experimenteel.", "**Denkregel:** Een interventie met een voor-na-vergelijking maar zonder randomisatie is quasi-experimenteel.", "**Volgende stap:** Controleer afzonderlijk of er een interventie, tijdsvergelijking en randomisatie is.", sep = "\n\n") }
      get_reporter()$add_message(message, type = "markdown"); generated == expected
    })
  })
})
