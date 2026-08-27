context({
  testcase("", {
    testEqual("", function(env) {
      expected_values <- c(gemiddelde_x = 2.5)
      read_number <- function(name) { if (!exists(name, envir = env)) return(NA_real_); value <- suppressWarnings(as.numeric(get(name, envir = env))); if (length(value) != 1L || !is.finite(value)) return(NA_real_); value }
      values <- vapply(names(expected_values), read_number, numeric(1)); valid <- all(is.finite(values)); correct <- valid && all(abs(values - expected_values) <= 0.0005)
      assign("results_10_1_1", list(valid = valid, values = values, expected = expected_values), envir = globalenv()); correct
    }, TRUE, comparator = function(generated, expected, ...) {
      results <- get("results_10_1_1", envir = globalenv())
      if (isTRUE(generated == expected)) message <- paste("**Bevestiging:** je antwoord past bij het leerdoel van deze korte oefening.", "**Denkregel:** Het gemiddelde is de som van alle waarden gedeeld door het aantal waarden.", "**Transferstap:** Tel 1, 2, 3 en 4 op en deel door vier.", sep = "\n\n")
      else if (!results$valid) message <- paste("**Waarschijnlijke redenering:** minstens één antwoord ontbreekt, bevat tekst of is niet één eindig getal.", "**Waarom dit niet klopt:** elke lege plaats verwacht precies één geldige waarde.", "**Denkregel:** Het gemiddelde is de som van alle waarden gedeeld door het aantal waarden.", "**Volgende stap:** Tel 1, 2, 3 en 4 op en deel door vier.", sep = "\n\n")
      else { wrong_field <- names(which(abs(results$values - results$expected) > 0.0005))[[1L]]; values <- results$values; likely <- "Je hebt een verwante tussenstap, verkeerde deler of verkeerde antwoordoptie gebruikt."
        if (identical(wrong_field, "gemiddelde_x") && abs(values[[wrong_field]] - 10) <= 0.0005) likely <- "Je hebt de som ingevuld zonder door het aantal waarnemingen te delen."
        if (identical(wrong_field, "gemiddelde_x") && abs(values[[wrong_field]] - 4) <= 0.0005) likely <- "Je hebt de grootste waarde gebruikt in plaats van het gemiddelde."
        message <- paste(paste0("**Waarschijnlijke redenering:** ", likely), "**Waarom dit niet klopt:** Het gemiddelde is de som van alle waarden gedeeld door het aantal waarden.", "**Denkregel:** Het gemiddelde is de som van alle waarden gedeeld door het aantal waarden.", "**Volgende stap:** Tel 1, 2, 3 en 4 op en deel door vier.", sep = "\n\n") }
      get_reporter()$add_message(message, type = "markdown"); generated == expected
    })
  })
})
