context({
  testcase("", {
    testEqual("", function(env) {
      expected_value <- 1; value <- if (exists("variabelentype", envir = env)) suppressWarnings(as.numeric(get("variabelentype", envir = env))) else NA_real_
      valid <- length(value) == 1L && is.finite(value); assign("results_2_14", list(valid = valid, value = value), envir = globalenv()); valid && abs(value - expected_value) <= 0.0005
    }, TRUE, comparator = function(generated, expected, ...) {
      results <- get("results_2_14", envir = globalenv())
      if (isTRUE(generated == expected)) message <- paste("**Bevestiging:** je antwoord past bij het leerdoel van deze korte oefening.", "**Denkregel:** Numerieke tellingen of ratio’s waarop betekenisvolle rekenbewerkingen mogelijk zijn, zijn kwantitatief.", "**Transferstap:** Beoordeel elke variabele op haar waarden, niet op het onderwerp.", sep = "\n\n")
      else if (!results$valid) message <- paste("**Waarschijnlijke redenering:** het antwoord ontbreekt, bevat tekst of is niet één eindig getal.", "**Waarom dit niet klopt:** deze oefening verwacht precies één waarde of optienummer.", "**Denkregel:** Numerieke tellingen of ratio’s waarop betekenisvolle rekenbewerkingen mogelijk zijn, zijn kwantitatief.", "**Volgende stap:** Beoordeel elke variabele op haar waarden, niet op het onderwerp.", sep = "\n\n")
      else { value <- results$value; likely <- "Je hebt een verwant begrip of een andere schaal gekozen."
        if (abs(value - 2) <= 0.0005) likely <- "Je behandelt numerieke ratio’s als categorieën."
        if (abs(value - 3) <= 0.0005) likely <- "Ook het diefstalcijfer is een kwantitatieve ratio."
        if (abs(value - 4) <= 0.0005) likely <- "Ook politiedichtheid is een kwantitatieve ratio."
        message <- paste(paste0("**Waarschijnlijke redenering:** ", likely), "**Waarom dit niet klopt:** Numerieke tellingen of ratio’s waarop betekenisvolle rekenbewerkingen mogelijk zijn, zijn kwantitatief.", "**Denkregel:** Numerieke tellingen of ratio’s waarop betekenisvolle rekenbewerkingen mogelijk zijn, zijn kwantitatief.", "**Volgende stap:** Beoordeel elke variabele op haar waarden, niet op het onderwerp.", sep = "\n\n") }
      get_reporter()$add_message(message, type = "markdown"); generated == expected
    })
  })
})
