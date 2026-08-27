context({
  testcase("", {
    testEqual("", function(env) {
      expected_value <- 3; value <- if (exists("frequentie_vaak", envir = env)) suppressWarnings(as.numeric(get("frequentie_vaak", envir = env))) else NA_real_
      valid <- length(value) == 1L && is.finite(value); assign("results_3_1", list(valid = valid, value = value), envir = globalenv()); valid && abs(value - expected_value) <= 0.0005
    }, TRUE, comparator = function(generated, expected, ...) {
      results <- get("results_3_1", envir = globalenv())
      if (isTRUE(generated == expected)) message <- paste("**Bevestiging:** je antwoord past bij het leerdoel van deze korte oefening.", "**Denkregel:** Een absolute frequentie is het aantal exacte voorkomens van de gekozen categorie.", "**Transferstap:** Markeer elk woord ‘vaak’ en tel de markeringen.", sep = "\n\n")
      else if (!results$valid) message <- paste("**Waarschijnlijke redenering:** het antwoord ontbreekt, bevat tekst of is niet één eindig getal.", "**Waarom dit niet klopt:** deze oefening verwacht precies één waarde of optienummer.", "**Denkregel:** Een absolute frequentie is het aantal exacte voorkomens van de gekozen categorie.", "**Volgende stap:** Markeer elk woord ‘vaak’ en tel de markeringen.", sep = "\n\n")
      else { value <- results$value; likely <- "Je hebt een verwant begrip of een andere schaal gekozen."
        if (abs(value - 8) <= 0.0005) likely <- "Je hebt het totale aantal antwoorden ingevuld."
        if (abs(value - 0.375) <= 0.0005) likely <- "Je hebt de relatieve frequentie ingevuld in plaats van de telling."
        message <- paste(paste0("**Waarschijnlijke redenering:** ", likely), "**Waarom dit niet klopt:** Een absolute frequentie is het aantal exacte voorkomens van de gekozen categorie.", "**Denkregel:** Een absolute frequentie is het aantal exacte voorkomens van de gekozen categorie.", "**Volgende stap:** Markeer elk woord ‘vaak’ en tel de markeringen.", sep = "\n\n") }
      get_reporter()$add_message(message, type = "markdown"); generated == expected
    })
  })
})
