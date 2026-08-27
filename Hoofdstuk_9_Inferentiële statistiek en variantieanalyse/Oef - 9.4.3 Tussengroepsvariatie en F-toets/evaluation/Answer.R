context({
  testcase("", {
    testEqual("", function(env) {
      expected_values <- c(f_ratio = 4, significant = 1)
      read_number <- function(name) { if (!exists(name, envir = env)) return(NA_real_); value <- suppressWarnings(as.numeric(get(name, envir = env))); if (length(value) != 1L || !is.finite(value)) return(NA_real_); value }
      values <- vapply(names(expected_values), read_number, numeric(1)); valid <- all(is.finite(values)); correct <- valid && all(abs(values - expected_values) <= 0.0005)
      assign("results_9_4_3", list(valid = valid, values = values, expected = expected_values), envir = globalenv()); correct
    }, TRUE, comparator = function(generated, expected, ...) {
      results <- get("results_9_4_3", envir = globalenv())
      if (isTRUE(generated == expected)) message <- paste("**Bevestiging:** je antwoord past bij het leerdoel van deze korte oefening.", "**Denkregel:** F = MS_tussen / MS_binnen; de toets is significant wanneer F groter is dan de kritieke waarde.", "**Transferstap:** Bereken eerst de verhouding en vergelijk die vervolgens met 3.2.", sep = "\n\n")
      else if (!results$valid) message <- paste("**Waarschijnlijke redenering:** minstens één antwoord ontbreekt, bevat tekst of is niet één eindig getal.", "**Waarom dit niet klopt:** elke lege plaats verwacht precies één geldige waarde.", "**Denkregel:** F = MS_tussen / MS_binnen; de toets is significant wanneer F groter is dan de kritieke waarde.", "**Volgende stap:** Bereken eerst de verhouding en vergelijk die vervolgens met 3.2.", sep = "\n\n")
      else { wrong_field <- names(which(abs(results$values - results$expected) > 0.0005))[[1L]]; values <- results$values; likely <- "Je hebt een verwante tussenstap, verkeerde deler of verkeerde antwoordoptie gebruikt."
        if (identical(wrong_field, "f_ratio") && abs(values[[wrong_field]] - 0.25) <= 0.0005) likely <- "Je hebt teller en noemer van de F-ratio omgekeerd."
        if (identical(wrong_field, "significant") && abs(values[[wrong_field]] - 2) <= 0.0005) likely <- "Je hebt de gevonden F-waarde niet correct met de kritieke grens vergeleken."
        message <- paste(paste0("**Waarschijnlijke redenering:** ", likely), "**Waarom dit niet klopt:** F = MS_tussen / MS_binnen; de toets is significant wanneer F groter is dan de kritieke waarde.", "**Denkregel:** F = MS_tussen / MS_binnen; de toets is significant wanneer F groter is dan de kritieke waarde.", "**Volgende stap:** Bereken eerst de verhouding en vergelijk die vervolgens met 3.2.", sep = "\n\n") }
      get_reporter()$add_message(message, type = "markdown"); generated == expected
    })
  })
})
