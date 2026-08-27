context({
  testcase("", {
    testEqual("", function(env) {
      expected_value <- 1; value <- if (exists("type_onderzoeksvraag", envir = env)) suppressWarnings(as.numeric(get("type_onderzoeksvraag", envir = env))) else NA_real_
      valid <- length(value) == 1L && is.finite(value); assign("results_2_15", list(valid = valid, value = value), envir = globalenv()); valid && abs(value - expected_value) <= 0.0005
    }, TRUE, comparator = function(generated, expected, ...) {
      results <- get("results_2_15", envir = globalenv())
      if (isTRUE(generated == expected)) message <- paste("**Bevestiging:** je antwoord past bij het leerdoel van deze korte oefening.", "**Denkregel:** Een vraag die één variabele samenvat zonder vergelijking of relatie is univariaat beschrijvend.", "**Transferstap:** Tel het aantal bestudeerde variabelen en zoek of een verband wordt gevraagd.", sep = "\n\n")
      else if (!results$valid) message <- paste("**Waarschijnlijke redenering:** het antwoord ontbreekt, bevat tekst of is niet één eindig getal.", "**Waarom dit niet klopt:** deze oefening verwacht precies één waarde of optienummer.", "**Denkregel:** Een vraag die één variabele samenvat zonder vergelijking of relatie is univariaat beschrijvend.", "**Volgende stap:** Tel het aantal bestudeerde variabelen en zoek of een verband wordt gevraagd.", sep = "\n\n")
      else { value <- results$value; likely <- "Je hebt een verwant begrip of een andere schaal gekozen."
        if (abs(value - 2) <= 0.0005) likely <- "Je hebt een tweede variabele verondersteld die niet in de vraag staat."
        if (abs(value - 3) <= 0.0005) likely <- "Er wordt geen verklaring of voorspeller onderzocht."
        if (abs(value - 4) <= 0.0005) likely <- "Er is geen gemanipuleerde interventie of experiment."
        message <- paste(paste0("**Waarschijnlijke redenering:** ", likely), "**Waarom dit niet klopt:** Een vraag die één variabele samenvat zonder vergelijking of relatie is univariaat beschrijvend.", "**Denkregel:** Een vraag die één variabele samenvat zonder vergelijking of relatie is univariaat beschrijvend.", "**Volgende stap:** Tel het aantal bestudeerde variabelen en zoek of een verband wordt gevraagd.", sep = "\n\n") }
      get_reporter()$add_message(message, type = "markdown"); generated == expected
    })
  })
})
