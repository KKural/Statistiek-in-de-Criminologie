context({
  testcase("", {
    testEqual("", function(env) {
      expected_values <- c(ondergrens = 26.08, bovengrens = 33.92); read_number <- function(name) { if (!exists(name, envir = env)) return(NA_real_); value <- suppressWarnings(as.numeric(get(name, envir = env))); if (length(value) != 1L || !is.finite(value)) return(NA_real_); value }
      values <- vapply(names(expected_values), read_number, numeric(1)); valid <- all(is.finite(values)); correct <- valid && all(abs(values - expected_values) <= 0.0005); assign("results_9_2", list(valid = valid, values = values, expected = expected_values), envir = globalenv()); correct
    }, TRUE, comparator = function(generated, expected, ...) {
      results <- get("results_9_2", envir = globalenv())
      if (isTRUE(generated == expected)) message <- paste("**Bevestiging:** je antwoord past bij het leerdoel van deze korte oefening.", "**Denkregel:** Een tweezijdig interval is schatting ± kritieke waarde × standaardfout.", "**Transferstap:** Bereken eerst de foutenmarge en trek die af of tel haar op bij 30.", sep = "\n\n")
      else if (!results$valid) message <- paste("**Waarschijnlijke redenering:** minstens één antwoord ontbreekt, bevat tekst of is niet één eindig getal.", "**Waarom dit niet klopt:** elke lege plaats verwacht precies één geldige waarde.", "**Denkregel:** Een tweezijdig interval is schatting ± kritieke waarde × standaardfout.", "**Volgende stap:** Bereken eerst de foutenmarge en trek die af of tel haar op bij 30.", sep = "\n\n")
      else { wrong_field <- names(which(abs(results$values - results$expected) > 0.0005))[[1L]]; values <- results$values; likely <- "Je hebt een verwante grootheid of verkeerde antwoordoptie gekozen."
        if (identical(wrong_field, "ondergrens") && abs(values[[wrong_field]] - 28.04) <= 0.0005) likely <- "Je hebt alleen de kritieke waarde afgetrokken zonder met de standaardfout te vermenigvuldigen."
        if (identical(wrong_field, "bovengrens") && abs(values[[wrong_field]] - 31.96) <= 0.0005) likely <- "Je hebt alleen de kritieke waarde opgeteld zonder de standaardfout te gebruiken."
        if (identical(wrong_field, "ondergrens") && abs(values[[wrong_field]] - 33.92) <= 0.0005) likely <- "Je hebt de onder- en bovengrens verwisseld."
        message <- paste(paste0("**Waarschijnlijke redenering:** ", likely), "**Waarom dit niet klopt:** Een tweezijdig interval is schatting ± kritieke waarde × standaardfout.", "**Denkregel:** Een tweezijdig interval is schatting ± kritieke waarde × standaardfout.", "**Volgende stap:** Bereken eerst de foutenmarge en trek die af of tel haar op bij 30.", sep = "\n\n") }
      get_reporter()$add_message(message, type = "markdown"); generated == expected
    })
  })
})
