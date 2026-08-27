context({
  testcase("", {
    testEqual("", function(env) {
      expected_value <- 4; value <- if (exists("meetniveau", envir = env)) suppressWarnings(as.numeric(get("meetniveau", envir = env))) else NA_real_
      valid <- length(value) == 1L && is.finite(value); assign("results_2_11", list(valid = valid, value = value), envir = globalenv()); valid && abs(value - expected_value) <= 0.0005
    }, TRUE, comparator = function(generated, expected, ...) {
      results <- get("results_2_11", envir = globalenv())
      if (isTRUE(generated == expected)) message <- paste("**Bevestiging:** je antwoord past bij het leerdoel van deze korte oefening.", "**Denkregel:** Een percentage heeft gelijke afstanden en een betekenisvol nulpunt wanneer 0% betekent dat niemand de eigenschap heeft.", "**Transferstap:** Controleer wat 0% betekent en of 20% tweemaal 10% is.", sep = "\n\n")
      else if (!results$valid) message <- paste("**Waarschijnlijke redenering:** het antwoord ontbreekt, bevat tekst of is niet één eindig getal.", "**Waarom dit niet klopt:** deze oefening verwacht precies één waarde of optienummer.", "**Denkregel:** Een percentage heeft gelijke afstanden en een betekenisvol nulpunt wanneer 0% betekent dat niemand de eigenschap heeft.", "**Volgende stap:** Controleer wat 0% betekent en of 20% tweemaal 10% is.", sep = "\n\n")
      else { value <- results$value; likely <- "Je hebt een verwant begrip of een andere schaal gekozen."
        if (abs(value - 1) <= 0.0005) likely <- "Je verwart gemeentelabels met de gemeten percentagevariabele."
        if (abs(value - 2) <= 0.0005) likely <- "Je gebruikt alleen de ordening en negeert numerieke afstanden."
        if (abs(value - 3) <= 0.0005) likely <- "Je mist dat 0% hier een werkelijk nulpunt is."
        message <- paste(paste0("**Waarschijnlijke redenering:** ", likely), "**Waarom dit niet klopt:** Een percentage heeft gelijke afstanden en een betekenisvol nulpunt wanneer 0% betekent dat niemand de eigenschap heeft.", "**Denkregel:** Een percentage heeft gelijke afstanden en een betekenisvol nulpunt wanneer 0% betekent dat niemand de eigenschap heeft.", "**Volgende stap:** Controleer wat 0% betekent en of 20% tweemaal 10% is.", sep = "\n\n") }
      get_reporter()$add_message(message, type = "markdown"); generated == expected
    })
  })
})
