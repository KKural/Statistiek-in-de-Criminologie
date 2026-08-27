context({
  testcase("", {
    testEqual("", function(env) {
      expected_values <- c(pearson_r = 1)
      read_number <- function(name) {
        if (!exists(name, envir = env)) return(NA_real_)
        value <- suppressWarnings(as.numeric(get(name, envir = env)))
        if (length(value) != 1L || !is.finite(value)) return(NA_real_)
        value
      }
      values <- vapply(names(expected_values), read_number, numeric(1))
      valid <- all(is.finite(values))
      correct <- valid && all(abs(values - expected_values) <= 0.0005)
      assign("results_8_1_2", list(valid = valid, values = values, expected = expected_values), envir = globalenv())
      correct
    }, TRUE, comparator = function(generated, expected, ...) {
      results <- get("results_8_1_2", envir = globalenv())
      if (isTRUE(generated == expected)) {
        message <- paste("**Bevestiging:** je antwoord past bij het leerdoel van deze korte oefening.", "**Denkregel:** Pearson r deelt de covariantie door het product van beide standaardafwijkingen en ligt tussen -1 en 1.", "**Transferstap:** Bereken eerst 2 × 3 en deel daarna de covariantie door dit product.", sep = "\n\n")
      } else if (!results$valid) {
        message <- paste("**Waarschijnlijke redenering:** minstens één antwoord ontbreekt, bevat tekst of is niet één eindig getal.", "**Waarom dit niet klopt:** elke lege plaats verwacht precies één berekende waarde of geldig optienummer.", "**Denkregel:** Pearson r deelt de covariantie door het product van beide standaardafwijkingen en ligt tussen -1 en 1.", "**Volgende stap:** Bereken eerst 2 × 3 en deel daarna de covariantie door dit product.", sep = "\n\n")
      } else {
        wrong_field <- names(which(abs(results$values - results$expected) > 0.0005))[[1L]]
        values <- results$values
        likely <- "Je hebt een verwante grootheid, verkeerde schaal of verkeerde antwoordoptie gebruikt."
              if (identical(wrong_field, "pearson_r") && abs(values[[wrong_field]] - 6) <= 0.0005) likely <- "Je hebt de covariantie overgenomen zonder te standaardiseren."
              if (identical(wrong_field, "pearson_r") && abs(values[[wrong_field]] - 0.5) <= 0.0005) likely <- "Je hebt slechts door één schaalfactor of door een verkeerde noemer gedeeld."
        message <- paste(paste0("**Waarschijnlijke redenering:** ", likely), "**Waarom dit niet klopt:** Pearson r deelt de covariantie door het product van beide standaardafwijkingen en ligt tussen -1 en 1.", "**Denkregel:** Pearson r deelt de covariantie door het product van beide standaardafwijkingen en ligt tussen -1 en 1.", "**Volgende stap:** Bereken eerst 2 × 3 en deel daarna de covariantie door dit product.", sep = "\n\n")
      }
      get_reporter()$add_message(message, type = "markdown")
      generated == expected
    })
  })
})
