context({
  testcase("", {
    testEqual("", function(env) {
      expected_values <- c(antwoord = 2); read_number <- function(name) { if (!exists(name, envir = env)) return(NA_real_); value <- suppressWarnings(as.numeric(get(name, envir = env))); if (length(value) != 1L || !is.finite(value)) return(NA_real_); value }
      values <- vapply(names(expected_values), read_number, numeric(1)); valid <- all(is.finite(values)); correct <- valid && all(abs(values - expected_values) <= 0.0005); assign("results_10_5", list(valid = valid, values = values, expected = expected_values), envir = globalenv()); correct
    }, TRUE, comparator = function(generated, expected, ...) {
      results <- get("results_10_5", envir = globalenv())
      if (isTRUE(generated == expected)) message <- paste("**Bevestiging:** je antwoord past bij het leerdoel van deze korte oefening.", "**Denkregel:** Een multivariaat model schat de samenhang van elke predictor met de uitkomst terwijl de andere predictors constant worden gehouden.", "**Transferstap:** Zoek de optie die expliciet onderscheid maakt tussen gezamenlijke en unieke bijdragen.", sep = "\n\n")
      else if (!results$valid) message <- paste("**Waarschijnlijke redenering:** minstens één antwoord ontbreekt, bevat tekst of is niet één eindig getal.", "**Waarom dit niet klopt:** elke lege plaats verwacht precies één geldige waarde.", "**Denkregel:** Een multivariaat model schat de samenhang van elke predictor met de uitkomst terwijl de andere predictors constant worden gehouden.", "**Volgende stap:** Zoek de optie die expliciet onderscheid maakt tussen gezamenlijke en unieke bijdragen.", sep = "\n\n")
      else { wrong_field <- names(which(abs(results$values - results$expected) > 0.0005))[[1L]]; values <- results$values; likely <- "Je hebt een verwante grootheid of verkeerde antwoordoptie gekozen."
        if (identical(wrong_field, "antwoord") && abs(values[[wrong_field]] - 1) <= 0.0005) likely <- "Controlevariabelen maken correlaties niet automatisch nul."
        if (identical(wrong_field, "antwoord") && abs(values[[wrong_field]] - 3) <= 0.0005) likely <- "Ook multivariate modellen worden met steekproefgegevens geschat."
        if (identical(wrong_field, "antwoord") && abs(values[[wrong_field]] - 4) <= 0.0005) likely <- "Statistische controle alleen bewijst geen causaliteit."
        message <- paste(paste0("**Waarschijnlijke redenering:** ", likely), "**Waarom dit niet klopt:** Een multivariaat model schat de samenhang van elke predictor met de uitkomst terwijl de andere predictors constant worden gehouden.", "**Denkregel:** Een multivariaat model schat de samenhang van elke predictor met de uitkomst terwijl de andere predictors constant worden gehouden.", "**Volgende stap:** Zoek de optie die expliciet onderscheid maakt tussen gezamenlijke en unieke bijdragen.", sep = "\n\n") }
      get_reporter()$add_message(message, type = "markdown"); generated == expected
    })
  })
})
