context({
  testcase("", {
    testEqual("", function(env) {
      expected_values <- c(scp_xy = -4)
      read_number <- function(name) { if (!exists(name, envir = env)) return(NA_real_); value <- suppressWarnings(as.numeric(get(name, envir = env))); if (length(value) != 1L || !is.finite(value)) return(NA_real_); value }
      values <- vapply(names(expected_values), read_number, numeric(1)); valid <- all(is.finite(values)); correct <- valid && all(abs(values - expected_values) <= 0.0005)
      assign("results_10_1_2", list(valid = valid, values = values, expected = expected_values), envir = globalenv()); correct
    }, TRUE, comparator = function(generated, expected, ...) {
      results <- get("results_10_1_2", envir = globalenv())
      if (isTRUE(generated == expected)) message <- paste("**Bevestiging:** je antwoord past bij het leerdoel van deze korte oefening.", "**Denkregel:** Vermenigvuldig afwijkingen per waarneming en tel de getekende producten op.", "**Transferstap:** Bereken de drie gepaarde producten en behoud hun tekens.", sep = "\n\n")
      else if (!results$valid) message <- paste("**Waarschijnlijke redenering:** minstens één antwoord ontbreekt, bevat tekst of is niet één eindig getal.", "**Waarom dit niet klopt:** elke lege plaats verwacht precies één geldige waarde.", "**Denkregel:** Vermenigvuldig afwijkingen per waarneming en tel de getekende producten op.", "**Volgende stap:** Bereken de drie gepaarde producten en behoud hun tekens.", sep = "\n\n")
      else { wrong_field <- names(which(abs(results$values - results$expected) > 0.0005))[[1L]]; values <- results$values; likely <- "Je hebt een verwante tussenstap, verkeerde deler of verkeerde antwoordoptie gebruikt."
        if (identical(wrong_field, "scp_xy") && abs(values[[wrong_field]] - 4) <= 0.0005) likely <- "Je hebt het negatieve teken van de gepaarde producten verloren."
        if (identical(wrong_field, "scp_xy") && abs(values[[wrong_field]] - 0) <= 0.0005) likely <- "Je hebt de afwijkingen afzonderlijk gesommeerd in plaats van kruisproducten te vormen."
        message <- paste(paste0("**Waarschijnlijke redenering:** ", likely), "**Waarom dit niet klopt:** Vermenigvuldig afwijkingen per waarneming en tel de getekende producten op.", "**Denkregel:** Vermenigvuldig afwijkingen per waarneming en tel de getekende producten op.", "**Volgende stap:** Bereken de drie gepaarde producten en behoud hun tekens.", sep = "\n\n") }
      get_reporter()$add_message(message, type = "markdown"); generated == expected
    })
  })
})
