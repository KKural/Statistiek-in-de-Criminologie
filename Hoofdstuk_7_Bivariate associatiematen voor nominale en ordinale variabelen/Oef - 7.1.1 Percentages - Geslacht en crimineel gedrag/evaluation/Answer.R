context({
  testcase("", {
    testEqual("", function(env) {
      expected_values <- c(percentage_crimineel_mannen = 25)
      read_number <- function(name) {
        if (!exists(name, envir = env)) return(NA_real_)
        value <- suppressWarnings(as.numeric(get(name, envir = env)))
        if (length(value) != 1L || !is.finite(value)) return(NA_real_)
        value
      }
      values <- vapply(names(expected_values), read_number, numeric(1))
      valid <- all(is.finite(values))
      correct <- valid && all(abs(values - expected_values) <= 0.0005)
      assign("results_7_1_1", list(valid = valid, values = values, expected = expected_values), envir = globalenv())
      correct
    }, TRUE, comparator = function(generated, expected, ...) {
      results <- get("results_7_1_1", envir = globalenv())
      if (isTRUE(generated == expected)) {
        message <- paste("**Bevestiging:** je antwoord past bij het leerdoel van deze korte oefening.", "**Denkregel:** Een conditioneel percentage deelt de cel door het totaal van de gekozen groep.", "**Transferstap:** Gebruik 30 als teller en 120 mannen als noemer; vermenigvuldig met 100.", sep = "\n\n")
      } else if (!results$valid) {
        message <- paste("**Waarschijnlijke redenering:** minstens één antwoord ontbreekt, bevat tekst of is niet één eindig getal.", "**Waarom dit niet klopt:** elke lege plaats verwacht precies één berekende waarde of geldig optienummer.", "**Denkregel:** Een conditioneel percentage deelt de cel door het totaal van de gekozen groep.", "**Volgende stap:** Gebruik 30 als teller en 120 mannen als noemer; vermenigvuldig met 100.", sep = "\n\n")
      } else {
        wrong_field <- names(which(abs(results$values - results$expected) > 0.0005))[[1L]]
        values <- results$values
        likely <- "Je hebt een verwante grootheid, verkeerde schaal of verkeerde antwoordoptie gebruikt."
              if (identical(wrong_field, "percentage_crimineel_mannen") && abs(values[[wrong_field]] - 30) <= 0.0005) likely <- "Je hebt de celfrequentie ingevuld in plaats van een percentage."
              if (identical(wrong_field, "percentage_crimineel_mannen") && abs(values[[wrong_field]] - 0.25) <= 0.0005) likely <- "Je hebt de proportie ingevuld zonder naar procenten om te zetten."
        message <- paste(paste0("**Waarschijnlijke redenering:** ", likely), "**Waarom dit niet klopt:** Een conditioneel percentage deelt de cel door het totaal van de gekozen groep.", "**Denkregel:** Een conditioneel percentage deelt de cel door het totaal van de gekozen groep.", "**Volgende stap:** Gebruik 30 als teller en 120 mannen als noemer; vermenigvuldig met 100.", sep = "\n\n")
      }
      get_reporter()$add_message(message, type = "markdown")
      generated == expected
    })
  })
})
