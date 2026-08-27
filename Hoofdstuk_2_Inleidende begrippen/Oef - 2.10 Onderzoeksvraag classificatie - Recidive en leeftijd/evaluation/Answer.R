context({
  testcase("", {
    testEqual("", function(env) {
      expected_value <- 3; value <- if (exists("type_onderzoeksvraag", envir = env)) suppressWarnings(as.numeric(get("type_onderzoeksvraag", envir = env))) else NA_real_
      valid <- length(value) == 1L && is.finite(value); assign("results_2_10", list(valid = valid, value = value), envir = globalenv()); valid && abs(value - expected_value) <= 0.0005
    }, TRUE, comparator = function(generated, expected, ...) {
      results <- get("results_2_10", envir = globalenv())
      if (isTRUE(generated == expected)) message <- paste("**Bevestiging:** je antwoord past bij het leerdoel van deze korte oefening.", "**Denkregel:** Een vraag met een voorspeller en een uitkomst die invloed of voorspelling onderzoekt is bivariaat verklarend.", "**Transferstap:** Markeer eerst de twee variabelen en daarna het woord ‘voorspelt’.", sep = "\n\n")
      else if (!results$valid) message <- paste("**Waarschijnlijke redenering:** het antwoord ontbreekt, bevat tekst of is niet één eindig getal.", "**Waarom dit niet klopt:** deze oefening verwacht precies één waarde of optienummer.", "**Denkregel:** Een vraag met een voorspeller en een uitkomst die invloed of voorspelling onderzoekt is bivariaat verklarend.", "**Volgende stap:** Markeer eerst de twee variabelen en daarna het woord ‘voorspelt’.", sep = "\n\n")
      else { value <- results$value; likely <- "Je hebt een verwant begrip of een andere schaal gekozen."
        if (abs(value - 1) <= 0.0005) likely <- "Je hebt slechts één variabele herkend."
        if (abs(value - 2) <= 0.0005) likely <- "Je ziet twee variabelen maar negeert de verklarende richting."
        if (abs(value - 4) <= 0.0005) likely <- "De vraag specificeert kwantitatieve variabelen en een toetsbare relatie."
        message <- paste(paste0("**Waarschijnlijke redenering:** ", likely), "**Waarom dit niet klopt:** Een vraag met een voorspeller en een uitkomst die invloed of voorspelling onderzoekt is bivariaat verklarend.", "**Denkregel:** Een vraag met een voorspeller en een uitkomst die invloed of voorspelling onderzoekt is bivariaat verklarend.", "**Volgende stap:** Markeer eerst de twee variabelen en daarna het woord ‘voorspelt’.", sep = "\n\n") }
      get_reporter()$add_message(message, type = "markdown"); generated == expected
    })
  })
})
