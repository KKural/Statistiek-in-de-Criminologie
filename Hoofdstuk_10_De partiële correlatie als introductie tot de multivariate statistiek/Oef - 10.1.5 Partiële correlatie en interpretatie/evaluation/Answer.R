context({
  testcase("", {
    testEqual("", function(env) {
      expected_values <- c(r_xy_z = 0.504)
      read_number <- function(name) { if (!exists(name, envir = env)) return(NA_real_); value <- suppressWarnings(as.numeric(get(name, envir = env))); if (length(value) != 1L || !is.finite(value)) return(NA_real_); value }
      values <- vapply(names(expected_values), read_number, numeric(1)); valid <- all(is.finite(values)); correct <- valid && all(abs(values - expected_values) <= 0.0005)
      assign("results_10_1_5", list(valid = valid, values = values, expected = expected_values), envir = globalenv()); correct
    }, TRUE, comparator = function(generated, expected, ...) {
      results <- get("results_10_1_5", envir = globalenv())
      if (isTRUE(generated == expected)) message <- paste("**Bevestiging:** je antwoord past bij het leerdoel van deze korte oefening.", "**Denkregel:** Trek in de teller het product r_XZ·r_YZ af en deel door de volledige wortelnoemer.", "**Transferstap:** Werk teller en noemer afzonderlijk uit en rond pas de uiteindelijke verhouding af.", sep = "\n\n")
      else if (!results$valid) message <- paste("**Waarschijnlijke redenering:** minstens één antwoord ontbreekt, bevat tekst of is niet één eindig getal.", "**Waarom dit niet klopt:** elke lege plaats verwacht precies één geldige waarde.", "**Denkregel:** Trek in de teller het product r_XZ·r_YZ af en deel door de volledige wortelnoemer.", "**Volgende stap:** Werk teller en noemer afzonderlijk uit en rond pas de uiteindelijke verhouding af.", sep = "\n\n")
      else { wrong_field <- names(which(abs(results$values - results$expected) > 0.0005))[[1L]]; values <- results$values; likely <- "Je hebt een verwante tussenstap, verkeerde deler of verkeerde antwoordoptie gebruikt."
        if (identical(wrong_field, "r_xy_z") && abs(values[[wrong_field]] - 0.6) <= 0.0005) likely <- "Je hebt de bivariate correlatie overgenomen zonder voor Z te controleren."
        if (identical(wrong_field, "r_xy_z") && abs(values[[wrong_field]] - 0.4) <= 0.0005) likely <- "Je hebt een van de correlaties uit de formule overgenomen in plaats van de partiële correlatie te berekenen."
        message <- paste(paste0("**Waarschijnlijke redenering:** ", likely), "**Waarom dit niet klopt:** Trek in de teller het product r_XZ·r_YZ af en deel door de volledige wortelnoemer.", "**Denkregel:** Trek in de teller het product r_XZ·r_YZ af en deel door de volledige wortelnoemer.", "**Volgende stap:** Werk teller en noemer afzonderlijk uit en rond pas de uiteindelijke verhouding af.", sep = "\n\n") }
      get_reporter()$add_message(message, type = "markdown"); generated == expected
    })
  })
})
