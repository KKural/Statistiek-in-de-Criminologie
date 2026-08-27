context({
  testcase("", {
    testEqual("", function(env) {
      expected_values <- c(ss_binnen = 8)
      read_number <- function(name) { if (!exists(name, envir = env)) return(NA_real_); value <- suppressWarnings(as.numeric(get(name, envir = env))); if (length(value) != 1L || !is.finite(value)) return(NA_real_); value }
      values <- vapply(names(expected_values), read_number, numeric(1)); valid <- all(is.finite(values)); correct <- valid && all(abs(values - expected_values) <= 0.0005)
      assign("results_9_4_2", list(valid = valid, values = values, expected = expected_values), envir = globalenv()); correct
    }, TRUE, comparator = function(generated, expected, ...) {
      results <- get("results_9_4_2", envir = globalenv())
      if (isTRUE(generated == expected)) message <- paste("**Bevestiging:** je antwoord past bij het leerdoel van deze korte oefening.", "**Denkregel:** Binnengroepsvariatie gebruikt afwijkingen ten opzichte van het eigen groepsgemiddelde.", "**Transferstap:** Bereken de afwijkingen -2, 0 en 2, kwadrateer en tel op.", sep = "\n\n")
      else if (!results$valid) message <- paste("**Waarschijnlijke redenering:** minstens één antwoord ontbreekt, bevat tekst of is niet één eindig getal.", "**Waarom dit niet klopt:** elke lege plaats verwacht precies één geldige waarde.", "**Denkregel:** Binnengroepsvariatie gebruikt afwijkingen ten opzichte van het eigen groepsgemiddelde.", "**Volgende stap:** Bereken de afwijkingen -2, 0 en 2, kwadrateer en tel op.", sep = "\n\n")
      else { wrong_field <- names(which(abs(results$values - results$expected) > 0.0005))[[1L]]; values <- results$values; likely <- "Je hebt een verwante tussenstap, verkeerde deler of verkeerde antwoordoptie gebruikt."
        if (identical(wrong_field, "ss_binnen") && abs(values[[wrong_field]] - 4) <= 0.0005) likely <- "Je hebt absolute afwijkingen opgeteld zonder ze te kwadrateren."
        if (identical(wrong_field, "ss_binnen") && abs(values[[wrong_field]] - 16) <= 0.0005) likely <- "Je hebt een verkeerde referentiewaarde of een extra factor gebruikt."
        message <- paste(paste0("**Waarschijnlijke redenering:** ", likely), "**Waarom dit niet klopt:** Binnengroepsvariatie gebruikt afwijkingen ten opzichte van het eigen groepsgemiddelde.", "**Denkregel:** Binnengroepsvariatie gebruikt afwijkingen ten opzichte van het eigen groepsgemiddelde.", "**Volgende stap:** Bereken de afwijkingen -2, 0 en 2, kwadrateer en tel op.", sep = "\n\n") }
      get_reporter()$add_message(message, type = "markdown"); generated == expected
    })
  })
})
