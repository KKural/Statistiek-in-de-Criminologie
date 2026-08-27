context({
  testcase("", {
    testEqual("", function(env) {
      expected_values <- c(verwachte_frequentie = 12); read_number <- function(name) { if (!exists(name, envir = env)) return(NA_real_); value <- suppressWarnings(as.numeric(get(name, envir = env))); if (length(value) != 1L || !is.finite(value)) return(NA_real_); value }
      values <- vapply(names(expected_values), read_number, numeric(1)); valid <- all(is.finite(values)); correct <- valid && all(abs(values - expected_values) <= 0.0005); assign("results_9_1", list(valid = valid, values = values, expected = expected_values), envir = globalenv()); correct
    }, TRUE, comparator = function(generated, expected, ...) {
      results <- get("results_9_1", envir = globalenv())
      if (isTRUE(generated == expected)) message <- paste("**Bevestiging:** je antwoord past bij het leerdoel van deze korte oefening.", "**Denkregel:** Onder onafhankelijkheid is E = rijtotaal × kolomtotaal / N.", "**Transferstap:** Vermenigvuldig eerst de twee marginale totalen en deel daarna door 100.", sep = "\n\n")
      else if (!results$valid) message <- paste("**Waarschijnlijke redenering:** minstens één antwoord ontbreekt, bevat tekst of is niet één eindig getal.", "**Waarom dit niet klopt:** elke lege plaats verwacht precies één geldige waarde.", "**Denkregel:** Onder onafhankelijkheid is E = rijtotaal × kolomtotaal / N.", "**Volgende stap:** Vermenigvuldig eerst de twee marginale totalen en deel daarna door 100.", sep = "\n\n")
      else { wrong_field <- names(which(abs(results$values - results$expected) > 0.0005))[[1L]]; values <- results$values; likely <- "Je hebt een verwante grootheid of verkeerde antwoordoptie gekozen."
        if (identical(wrong_field, "verwachte_frequentie") && abs(values[[wrong_field]] - 70) <= 0.0005) likely <- "Je hebt marginale totalen opgeteld in plaats van vermenigvuldigd."
        if (identical(wrong_field, "verwachte_frequentie") && abs(values[[wrong_field]] - 1200) <= 0.0005) likely <- "Je hebt niet door het totale aantal waarnemingen gedeeld."
        message <- paste(paste0("**Waarschijnlijke redenering:** ", likely), "**Waarom dit niet klopt:** Onder onafhankelijkheid is E = rijtotaal × kolomtotaal / N.", "**Denkregel:** Onder onafhankelijkheid is E = rijtotaal × kolomtotaal / N.", "**Volgende stap:** Vermenigvuldig eerst de twee marginale totalen en deel daarna door 100.", sep = "\n\n") }
      get_reporter()$add_message(message, type = "markdown"); generated == expected
    })
  })
})
