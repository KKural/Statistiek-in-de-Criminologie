context({
  testcase("", {
    testEqual("", function(env) {
      expected_values <- c(variantie_x = 6)
      read_number <- function(name) { if (!exists(name, envir = env)) return(NA_real_); value <- suppressWarnings(as.numeric(get(name, envir = env))); if (length(value) != 1L || !is.finite(value)) return(NA_real_); value }
      values <- vapply(names(expected_values), read_number, numeric(1)); valid <- all(is.finite(values)); correct <- valid && all(abs(values - expected_values) <= 0.0005)
      assign("results_10_1_3", list(valid = valid, values = values, expected = expected_values), envir = globalenv()); correct
    }, TRUE, comparator = function(generated, expected, ...) {
      results <- get("results_10_1_3", envir = globalenv())
      if (isTRUE(generated == expected)) message <- paste("**Bevestiging:** je antwoord past bij het leerdoel van deze korte oefening.", "**Denkregel:** Een steekproefvariantie deelt de som van kwadraten door n − 1.", "**Transferstap:** Deel 18 door 3, niet door 4.", sep = "\n\n")
      else if (!results$valid) message <- paste("**Waarschijnlijke redenering:** minstens één antwoord ontbreekt, bevat tekst of is niet één eindig getal.", "**Waarom dit niet klopt:** elke lege plaats verwacht precies één geldige waarde.", "**Denkregel:** Een steekproefvariantie deelt de som van kwadraten door n − 1.", "**Volgende stap:** Deel 18 door 3, niet door 4.", sep = "\n\n")
      else { wrong_field <- names(which(abs(results$values - results$expected) > 0.0005))[[1L]]; values <- results$values; likely <- "Je hebt een verwante tussenstap, verkeerde deler of verkeerde antwoordoptie gebruikt."
        if (identical(wrong_field, "variantie_x") && abs(values[[wrong_field]] - 4.5) <= 0.0005) likely <- "Je hebt door n gedeeld en zo de populatievariantie berekend."
        if (identical(wrong_field, "variantie_x") && abs(values[[wrong_field]] - 18) <= 0.0005) likely <- "Je hebt de som van kwadraten niet door de vrijheidsgraden gedeeld."
        message <- paste(paste0("**Waarschijnlijke redenering:** ", likely), "**Waarom dit niet klopt:** Een steekproefvariantie deelt de som van kwadraten door n − 1.", "**Denkregel:** Een steekproefvariantie deelt de som van kwadraten door n − 1.", "**Volgende stap:** Deel 18 door 3, niet door 4.", sep = "\n\n") }
      get_reporter()$add_message(message, type = "markdown"); generated == expected
    })
  })
})
