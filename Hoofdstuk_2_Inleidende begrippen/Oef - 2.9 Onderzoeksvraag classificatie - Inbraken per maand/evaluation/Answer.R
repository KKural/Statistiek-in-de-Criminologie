context({
  testcase("", {
    testEqual("", function(env) {
      expected_value <- 4; value <- if (exists("meetniveau", envir = env)) suppressWarnings(as.numeric(get("meetniveau", envir = env))) else NA_real_
      valid <- length(value) == 1L && is.finite(value); assign("results_2_9", list(valid = valid, value = value), envir = globalenv()); valid && abs(value - expected_value) <= 0.0005
    }, TRUE, comparator = function(generated, expected, ...) {
      results <- get("results_2_9", envir = globalenv())
      if (isTRUE(generated == expected)) message <- paste("**Bevestiging:** je antwoord past bij het leerdoel van deze korte oefening.", "**Denkregel:** Een telling heeft gelijke afstanden en een werkelijk nulpunt: nul betekent geen gebeurtenissen.", "**Transferstap:** Controleer of verschillen én verhoudingen betekenisvol zijn.", sep = "\n\n")
      else if (!results$valid) message <- paste("**Waarschijnlijke redenering:** het antwoord ontbreekt, bevat tekst of is niet één eindig getal.", "**Waarom dit niet klopt:** deze oefening verwacht precies één waarde of optienummer.", "**Denkregel:** Een telling heeft gelijke afstanden en een werkelijk nulpunt: nul betekent geen gebeurtenissen.", "**Volgende stap:** Controleer of verschillen én verhoudingen betekenisvol zijn.", sep = "\n\n")
      else { value <- results$value; likely <- "Je hebt een verwant begrip of een andere schaal gekozen."
        if (abs(value - 1) <= 0.0005) likely <- "Je behandelt de aantallen als categoriecodes zonder numerieke betekenis."
        if (abs(value - 2) <= 0.0005) likely <- "Je ziet alleen de rangorde en mist de betekenis van afstanden."
        if (abs(value - 3) <= 0.0005) likely <- "Je herkent gelijke afstanden maar mist het werkelijke nulpunt."
        message <- paste(paste0("**Waarschijnlijke redenering:** ", likely), "**Waarom dit niet klopt:** Een telling heeft gelijke afstanden en een werkelijk nulpunt: nul betekent geen gebeurtenissen.", "**Denkregel:** Een telling heeft gelijke afstanden en een werkelijk nulpunt: nul betekent geen gebeurtenissen.", "**Volgende stap:** Controleer of verschillen én verhoudingen betekenisvol zijn.", sep = "\n\n") }
      get_reporter()$add_message(message, type = "markdown"); generated == expected
    })
  })
})
