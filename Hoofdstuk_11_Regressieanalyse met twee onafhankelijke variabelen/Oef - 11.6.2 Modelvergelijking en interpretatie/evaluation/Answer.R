context({
  testcase("", {
    testEqual("", function(env) {
      expected_values <- c(delta_r2 = 0.08, conclusie = 1)
      read_number <- function(name) { if (!exists(name, envir = env)) return(NA_real_); value <- suppressWarnings(as.numeric(get(name, envir = env))); if (length(value) != 1L || !is.finite(value)) return(NA_real_); value }
      values <- vapply(names(expected_values), read_number, numeric(1)); valid <- all(is.finite(values)); correct <- valid && all(abs(values - expected_values) <= 0.0005)
      assign("results_11_6_2", list(valid = valid, values = values, expected = expected_values), envir = globalenv()); correct
    }, TRUE, comparator = function(generated, expected, ...) {
      results <- get("results_11_6_2", envir = globalenv())
      if (isTRUE(generated == expected)) message <- paste("**Bevestiging:** je antwoord past bij het leerdoel van deze korte oefening.", "**Denkregel:** ΔR² = R²_nieuw − R²_oud; beoordeel de toevoeging met de p-waarde van de modelvergelijking.", "**Transferstap:** Trek eerst de R²-waarden af en vergelijk daarna 0.02 met 0.05.", sep = "\n\n")
      else if (!results$valid) message <- paste("**Waarschijnlijke redenering:** minstens één antwoord ontbreekt, bevat tekst of is niet één eindig getal.", "**Waarom dit niet klopt:** elke lege plaats verwacht precies één geldige waarde.", "**Denkregel:** ΔR² = R²_nieuw − R²_oud; beoordeel de toevoeging met de p-waarde van de modelvergelijking.", "**Volgende stap:** Trek eerst de R²-waarden af en vergelijk daarna 0.02 met 0.05.", sep = "\n\n")
      else { wrong_field <- names(which(abs(results$values - results$expected) > 0.0005))[[1L]]; values <- results$values; likely <- "Je hebt een verwante grootheid, verkeerde richting of verkeerde antwoordoptie gebruikt."
        if (identical(wrong_field, "delta_r2") && abs(values[[wrong_field]] - 0.68) <= 0.0005) likely <- "Je hebt de twee R²-waarden opgeteld in plaats van het verschil te nemen."
        if (identical(wrong_field, "delta_r2") && abs(values[[wrong_field]] - 0.21) <= 0.0005) likely <- "Je hebt een relatieve procentuele groei berekend in plaats van het absolute R²-verschil."
        if (identical(wrong_field, "conclusie") && abs(values[[wrong_field]] - 2) <= 0.0005) likely <- "Je hebt p = 0.02 niet correct met α = 0.05 vergeleken."
        message <- paste(paste0("**Waarschijnlijke redenering:** ", likely), "**Waarom dit niet klopt:** ΔR² = R²_nieuw − R²_oud; beoordeel de toevoeging met de p-waarde van de modelvergelijking.", "**Denkregel:** ΔR² = R²_nieuw − R²_oud; beoordeel de toevoeging met de p-waarde van de modelvergelijking.", "**Volgende stap:** Trek eerst de R²-waarden af en vergelijk daarna 0.02 met 0.05.", sep = "\n\n") }
      get_reporter()$add_message(message, type = "markdown"); generated == expected
    })
  })
})
