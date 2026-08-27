context({
  testcase("", {
    testEqual("", function(env) {
      expected_values <- c(cumulatieve_relatieve_frequentie_neutraal = 0.65)
      read_number <- function(name) {
        if (!exists(name, envir = env)) return(NA_real_)
        value <- suppressWarnings(as.numeric(get(name, envir = env)))
        if (length(value) != 1L || !is.finite(value)) return(NA_real_)
        value
      }
      values <- vapply(names(expected_values), read_number, numeric(1))
      valid <- all(is.finite(values))
      correct <- valid && all(abs(values - expected_values) <= 0.0005)
      assign("results_3_2_3", list(valid = valid, values = values, expected = expected_values), envir = globalenv())
      correct
    }, TRUE, comparator = function(generated, expected, ...) {
      results <- get("results_3_2_3", envir = globalenv())
      if (isTRUE(generated == expected)) {
        message <- paste("**Bevestiging:** je antwoord past bij het leerdoel van deze korte oefening.", "**Denkregel:** Een cumulatieve proportie telt alle relatieve frequenties tot en met de gekozen grens op.", "**Transferstap:** Tel de eerste drie proporties met behoud van de schaal 0–1.", sep = "\n\n")
      } else if (!results$valid) {
        message <- paste("**Waarschijnlijke redenering:** minstens één antwoord ontbreekt, bevat tekst of is niet één eindig getal.", "**Waarom dit niet klopt:** elke lege plaats verwacht precies één berekende waarde of geldig optienummer.", "**Denkregel:** Een cumulatieve proportie telt alle relatieve frequenties tot en met de gekozen grens op.", "**Volgende stap:** Tel de eerste drie proporties met behoud van de schaal 0–1.", sep = "\n\n")
      } else {
        wrong_field <- names(which(abs(results$values - results$expected) > 0.0005))[[1L]]
        values <- results$values
        likely <- "Je hebt een verwante grootheid, verkeerde schaal of verkeerde antwoordoptie gebruikt."
              if (identical(wrong_field, "cumulatieve_relatieve_frequentie_neutraal") && abs(values[[wrong_field]] - 0.35) <= 0.0005) likely <- "Je hebt alleen de relatieve frequentie van neutraal genomen."
              if (identical(wrong_field, "cumulatieve_relatieve_frequentie_neutraal") && abs(values[[wrong_field]] - 65) <= 0.0005) likely <- "Je hebt een percentage ingevuld in plaats van een proportie."
        message <- paste(paste0("**Waarschijnlijke redenering:** ", likely), "**Waarom dit niet klopt:** Een cumulatieve proportie telt alle relatieve frequenties tot en met de gekozen grens op.", "**Denkregel:** Een cumulatieve proportie telt alle relatieve frequenties tot en met de gekozen grens op.", "**Volgende stap:** Tel de eerste drie proporties met behoud van de schaal 0–1.", sep = "\n\n")
      }
      get_reporter()$add_message(message, type = "markdown")
      generated == expected
    })
  })
})
