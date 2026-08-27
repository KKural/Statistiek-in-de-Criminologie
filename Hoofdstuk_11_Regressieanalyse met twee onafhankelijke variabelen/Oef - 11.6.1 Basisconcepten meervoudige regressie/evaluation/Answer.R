context({
  testcase("", {
    testEqual("", function(env) {
      expected_values <- c(interpretatie_b1 = 1)
      read_number <- function(name) { if (!exists(name, envir = env)) return(NA_real_); value <- suppressWarnings(as.numeric(get(name, envir = env))); if (length(value) != 1L || !is.finite(value)) return(NA_real_); value }
      values <- vapply(names(expected_values), read_number, numeric(1)); valid <- all(is.finite(values)); correct <- valid && all(abs(values - expected_values) <= 0.0005)
      assign("results_11_6_1", list(valid = valid, values = values, expected = expected_values), envir = globalenv()); correct
    }, TRUE, comparator = function(generated, expected, ...) {
      results <- get("results_11_6_1", envir = globalenv())
      if (isTRUE(generated == expected)) message <- paste("**Bevestiging:** je antwoord past bij het leerdoel van deze korte oefening.", "**Denkregel:** Een partiële regressiecoëfficiënt beschrijft de gemiddelde verandering in Y bij één predictor, terwijl de andere predictor constant blijft.", "**Transferstap:** Noem X1, de verandering van 3 en de controle voor X2 in één interpretatie.", sep = "\n\n")
      else if (!results$valid) message <- paste("**Waarschijnlijke redenering:** minstens één antwoord ontbreekt, bevat tekst of is niet één eindig getal.", "**Waarom dit niet klopt:** elke lege plaats verwacht precies één geldige waarde.", "**Denkregel:** Een partiële regressiecoëfficiënt beschrijft de gemiddelde verandering in Y bij één predictor, terwijl de andere predictor constant blijft.", "**Volgende stap:** Noem X1, de verandering van 3 en de controle voor X2 in één interpretatie.", sep = "\n\n")
      else { wrong_field <- names(which(abs(results$values - results$expected) > 0.0005))[[1L]]; values <- results$values; likely <- "Je hebt een verwante grootheid, verkeerde richting of verkeerde antwoordoptie gebruikt."
        if (identical(wrong_field, "interpretatie_b1") && abs(values[[wrong_field]] - 2) <= 0.0005) likely <- "Je maakt van een gemiddelde modelrelatie een deterministische garantie voor ieder individu."
        if (identical(wrong_field, "interpretatie_b1") && abs(values[[wrong_field]] - 3) <= 0.0005) likely <- "Je hebt de uitkomst en de andere predictor verwisseld."
        if (identical(wrong_field, "interpretatie_b1") && abs(values[[wrong_field]] - 4) <= 0.0005) likely <- "Je verwart de helling met het intercept."
        message <- paste(paste0("**Waarschijnlijke redenering:** ", likely), "**Waarom dit niet klopt:** Een partiële regressiecoëfficiënt beschrijft de gemiddelde verandering in Y bij één predictor, terwijl de andere predictor constant blijft.", "**Denkregel:** Een partiële regressiecoëfficiënt beschrijft de gemiddelde verandering in Y bij één predictor, terwijl de andere predictor constant blijft.", "**Volgende stap:** Noem X1, de verandering van 3 en de controle voor X2 in één interpretatie.", sep = "\n\n") }
      get_reporter()$add_message(message, type = "markdown"); generated == expected
    })
  })
})
