context({
  testcase("", {
    testEqual("", function(env) {
      expected_values <- c(relatieve_frequentie_tevreden = 0.3)
      read_number <- function(name) {
        if (!exists(name, envir = env)) return(NA_real_)
        value <- suppressWarnings(as.numeric(get(name, envir = env)))
        if (length(value) != 1L || !is.finite(value)) return(NA_real_)
        value
      }
      values <- vapply(names(expected_values), read_number, numeric(1))
      valid <- all(is.finite(values))
      correct <- valid && all(abs(values - expected_values) <= 0.0005)
      assign("results_3_2_2", list(valid = valid, values = values, expected = expected_values), envir = globalenv())
      correct
    }, TRUE, comparator = function(generated, expected, ...) {
      results <- get("results_3_2_2", envir = globalenv())
      if (isTRUE(generated == expected)) {
        message <- paste("**Bevestiging:** je antwoord past bij het leerdoel van deze korte oefening.", "**Denkregel:** Relatieve frequentie = absolute frequentie / totaal en ligt tussen 0 en 1.", "**Transferstap:** Deel 12 door 40 en rond alleen het eindantwoord af.", sep = "\n\n")
      } else if (!results$valid) {
        message <- paste("**Waarschijnlijke redenering:** minstens één antwoord ontbreekt, bevat tekst of is niet één eindig getal.", "**Waarom dit niet klopt:** elke lege plaats verwacht precies één berekende waarde of geldig optienummer.", "**Denkregel:** Relatieve frequentie = absolute frequentie / totaal en ligt tussen 0 en 1.", "**Volgende stap:** Deel 12 door 40 en rond alleen het eindantwoord af.", sep = "\n\n")
      } else {
        wrong_field <- names(which(abs(results$values - results$expected) > 0.0005))[[1L]]
        values <- results$values
        likely <- "Je hebt een verwante grootheid, verkeerde schaal of verkeerde antwoordoptie gebruikt."
              if (identical(wrong_field, "relatieve_frequentie_tevreden") && abs(values[[wrong_field]] - 12) <= 0.0005) likely <- "Je hebt de absolute frequentie ingevuld zonder door het totaal te delen."
              if (identical(wrong_field, "relatieve_frequentie_tevreden") && abs(values[[wrong_field]] - 30) <= 0.0005) likely <- "Je hebt een percentage ingevuld in plaats van een proportie."
        message <- paste(paste0("**Waarschijnlijke redenering:** ", likely), "**Waarom dit niet klopt:** Relatieve frequentie = absolute frequentie / totaal en ligt tussen 0 en 1.", "**Denkregel:** Relatieve frequentie = absolute frequentie / totaal en ligt tussen 0 en 1.", "**Volgende stap:** Deel 12 door 40 en rond alleen het eindantwoord af.", sep = "\n\n")
      }
      get_reporter()$add_message(message, type = "markdown")
      generated == expected
    })
  })
})
