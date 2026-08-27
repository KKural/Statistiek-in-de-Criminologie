context({
  testcase("", {
    testEqual("", function(env) {
      expected_values <- c(n_minimum = 43); read_number <- function(name) { if (!exists(name, envir = env)) return(NA_real_); value <- suppressWarnings(as.numeric(get(name, envir = env))); if (length(value) != 1L || !is.finite(value)) return(NA_real_); value }
      values <- vapply(names(expected_values), read_number, numeric(1)); valid <- all(is.finite(values)); correct <- valid && all(abs(values - expected_values) <= 0.0005); assign("results_9_3", list(valid = valid, values = values, expected = expected_values), envir = globalenv()); correct
    }, TRUE, comparator = function(generated, expected, ...) {
      results <- get("results_9_3", envir = globalenv())
      if (isTRUE(generated == expected)) message <- paste("**Bevestiging:** je antwoord past bij het leerdoel van deze korte oefening.", "**Denkregel:** Een minimale steekproefgrootte wordt altijd naar boven afgerond zodat de vereiste precisie behouden blijft.", "**Transferstap:** Neem het eerstvolgende gehele getal boven 42.3.", sep = "\n\n")
      else if (!results$valid) message <- paste("**Waarschijnlijke redenering:** minstens één antwoord ontbreekt, bevat tekst of is niet één eindig getal.", "**Waarom dit niet klopt:** elke lege plaats verwacht precies één geldige waarde.", "**Denkregel:** Een minimale steekproefgrootte wordt altijd naar boven afgerond zodat de vereiste precisie behouden blijft.", "**Volgende stap:** Neem het eerstvolgende gehele getal boven 42.3.", sep = "\n\n")
      else { wrong_field <- names(which(abs(results$values - results$expected) > 0.0005))[[1L]]; values <- results$values; likely <- "Je hebt een verwante grootheid of verkeerde antwoordoptie gekozen."
        if (identical(wrong_field, "n_minimum") && abs(values[[wrong_field]] - 42) <= 0.0005) likely <- "Je hebt volgens de gewone afrondingsregel afgerond en daardoor de minimumvoorwaarde onderschreden."
        if (identical(wrong_field, "n_minimum") && abs(values[[wrong_field]] - 42.3) <= 0.0005) likely <- "Je hebt geen geheel aantal personen gerapporteerd."
        message <- paste(paste0("**Waarschijnlijke redenering:** ", likely), "**Waarom dit niet klopt:** Een minimale steekproefgrootte wordt altijd naar boven afgerond zodat de vereiste precisie behouden blijft.", "**Denkregel:** Een minimale steekproefgrootte wordt altijd naar boven afgerond zodat de vereiste precisie behouden blijft.", "**Volgende stap:** Neem het eerstvolgende gehele getal boven 42.3.", sep = "\n\n") }
      get_reporter()$add_message(message, type = "markdown"); generated == expected
    })
  })
})
