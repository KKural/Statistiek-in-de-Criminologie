context({
  testcase("", {
    testEqual("", function(env) {
      expected_values <- c(groepsgemiddelde = 4)
      read_number <- function(name) { if (!exists(name, envir = env)) return(NA_real_); value <- suppressWarnings(as.numeric(get(name, envir = env))); if (length(value) != 1L || !is.finite(value)) return(NA_real_); value }
      values <- vapply(names(expected_values), read_number, numeric(1)); valid <- all(is.finite(values)); correct <- valid && all(abs(values - expected_values) <= 0.0005)
      assign("results_9_4_1", list(valid = valid, values = values, expected = expected_values), envir = globalenv()); correct
    }, TRUE, comparator = function(generated, expected, ...) {
      results <- get("results_9_4_1", envir = globalenv())
      if (isTRUE(generated == expected)) message <- paste("**Bevestiging:** je antwoord past bij het leerdoel van deze korte oefening.", "**Denkregel:** Een groepsgemiddelde gebruikt alleen de waarnemingen uit die groep: som gedeeld door groepsgrootte.", "**Transferstap:** Tel de drie waarden op en deel door drie.", sep = "\n\n")
      else if (!results$valid) message <- paste("**Waarschijnlijke redenering:** minstens één antwoord ontbreekt, bevat tekst of is niet één eindig getal.", "**Waarom dit niet klopt:** elke lege plaats verwacht precies één geldige waarde.", "**Denkregel:** Een groepsgemiddelde gebruikt alleen de waarnemingen uit die groep: som gedeeld door groepsgrootte.", "**Volgende stap:** Tel de drie waarden op en deel door drie.", sep = "\n\n")
      else { wrong_field <- names(which(abs(results$values - results$expected) > 0.0005))[[1L]]; values <- results$values; likely <- "Je hebt een verwante tussenstap, verkeerde deler of verkeerde antwoordoptie gebruikt."
        if (identical(wrong_field, "groepsgemiddelde") && abs(values[[wrong_field]] - 12) <= 0.0005) likely <- "Je hebt de groepssom ingevuld zonder door de groepsgrootte te delen."
        if (identical(wrong_field, "groepsgemiddelde") && abs(values[[wrong_field]] - 3) <= 0.0005) likely <- "Je hebt de groepsgrootte ingevuld in plaats van het gemiddelde."
        message <- paste(paste0("**Waarschijnlijke redenering:** ", likely), "**Waarom dit niet klopt:** Een groepsgemiddelde gebruikt alleen de waarnemingen uit die groep: som gedeeld door groepsgrootte.", "**Denkregel:** Een groepsgemiddelde gebruikt alleen de waarnemingen uit die groep: som gedeeld door groepsgrootte.", "**Volgende stap:** Tel de drie waarden op en deel door drie.", sep = "\n\n") }
      get_reporter()$add_message(message, type = "markdown"); generated == expected
    })
  })
})
