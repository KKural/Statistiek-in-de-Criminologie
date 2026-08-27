context({
  testcase("", {
    testEqual("", function(env) {
      expected_values <- c(afhankelijke_variabele = 3)
      read_number <- function(name) { if (!exists(name, envir = env)) return(NA_real_); value <- suppressWarnings(as.numeric(get(name, envir = env))); if (length(value) != 1L || !is.finite(value)) return(NA_real_); value }
      values <- vapply(names(expected_values), read_number, numeric(1)); valid <- all(is.finite(values)); correct <- valid && all(abs(values - expected_values) <= 0.0005)
      assign("results_11_1_1", list(valid = valid, values = values, expected = expected_values), envir = globalenv()); correct
    }, TRUE, comparator = function(generated, expected, ...) {
      results <- get("results_11_1_1", envir = globalenv())
      if (isTRUE(generated == expected)) message <- paste("**Bevestiging:** je antwoord past bij het leerdoel van deze korte oefening.", "**Denkregel:** De afhankelijke variabele is de uitkomst die door de predictors wordt verklaard of voorspeld.", "**Transferstap:** Zoek welke variabele links van het gelijkteken in het regressiemodel staat.", sep = "\n\n")
      else if (!results$valid) message <- paste("**Waarschijnlijke redenering:** minstens één antwoord ontbreekt, bevat tekst of is niet één eindig getal.", "**Waarom dit niet klopt:** elke lege plaats verwacht precies één geldige waarde.", "**Denkregel:** De afhankelijke variabele is de uitkomst die door de predictors wordt verklaard of voorspeld.", "**Volgende stap:** Zoek welke variabele links van het gelijkteken in het regressiemodel staat.", sep = "\n\n")
      else { wrong_field <- names(which(abs(results$values - results$expected) > 0.0005))[[1L]]; values <- results$values; likely <- "Je hebt een verwante grootheid, verkeerde richting of verkeerde antwoordoptie gebruikt."
        if (identical(wrong_field, "afhankelijke_variabele") && abs(values[[wrong_field]] - 1) <= 0.0005) likely <- "Je hebt een predictor gekozen omdat die een mogelijke verklaring vormt."
        if (identical(wrong_field, "afhankelijke_variabele") && abs(values[[wrong_field]] - 2) <= 0.0005) likely <- "Je hebt de tweede predictor als uitkomst gelezen."
        message <- paste(paste0("**Waarschijnlijke redenering:** ", likely), "**Waarom dit niet klopt:** De afhankelijke variabele is de uitkomst die door de predictors wordt verklaard of voorspeld.", "**Denkregel:** De afhankelijke variabele is de uitkomst die door de predictors wordt verklaard of voorspeld.", "**Volgende stap:** Zoek welke variabele links van het gelijkteken in het regressiemodel staat.", sep = "\n\n") }
      get_reporter()$add_message(message, type = "markdown"); generated == expected
    })
  })
})
