context({
  testcase("", {
    testEqual("", function(env) {
      expected_values <- c(interpretatie_b1 = 2)
      read_number <- function(name) { if (!exists(name, envir = env)) return(NA_real_); value <- suppressWarnings(as.numeric(get(name, envir = env))); if (length(value) != 1L || !is.finite(value)) return(NA_real_); value }
      values <- vapply(names(expected_values), read_number, numeric(1)); valid <- all(is.finite(values)); correct <- valid && all(abs(values - expected_values) <= 0.0005)
      assign("results_11_1_4", list(valid = valid, values = values, expected = expected_values), envir = globalenv()); correct
    }, TRUE, comparator = function(generated, expected, ...) {
      results <- get("results_11_1_4", envir = globalenv())
      if (isTRUE(generated == expected)) message <- paste("**Bevestiging:** je antwoord past bij het leerdoel van deze korte oefening.", "**Denkregel:** Een negatieve partiële coëfficiënt betekent een daling in de voorspelde Y per eenheid X1, bij constante X2.", "**Transferstap:** Lees eerst het teken en vermeld daarna expliciet dat de andere predictor constant blijft.", sep = "\n\n")
      else if (!results$valid) message <- paste("**Waarschijnlijke redenering:** minstens één antwoord ontbreekt, bevat tekst of is niet één eindig getal.", "**Waarom dit niet klopt:** elke lege plaats verwacht precies één geldige waarde.", "**Denkregel:** Een negatieve partiële coëfficiënt betekent een daling in de voorspelde Y per eenheid X1, bij constante X2.", "**Volgende stap:** Lees eerst het teken en vermeld daarna expliciet dat de andere predictor constant blijft.", sep = "\n\n")
      else { wrong_field <- names(which(abs(results$values - results$expected) > 0.0005))[[1L]]; values <- results$values; likely <- "Je hebt een verwante grootheid, verkeerde richting of verkeerde antwoordoptie gebruikt."
        if (identical(wrong_field, "interpretatie_b1") && abs(values[[wrong_field]] - 1) <= 0.0005) likely <- "Je hebt het minteken van de coëfficiënt genegeerd."
        if (identical(wrong_field, "interpretatie_b1") && abs(values[[wrong_field]] - 3) <= 0.0005) likely <- "Je hebt negatief verward met afwezig; een niet-nulcoëfficiënt geeft wel een richting aan."
        message <- paste(paste0("**Waarschijnlijke redenering:** ", likely), "**Waarom dit niet klopt:** Een negatieve partiële coëfficiënt betekent een daling in de voorspelde Y per eenheid X1, bij constante X2.", "**Denkregel:** Een negatieve partiële coëfficiënt betekent een daling in de voorspelde Y per eenheid X1, bij constante X2.", "**Volgende stap:** Lees eerst het teken en vermeld daarna expliciet dat de andere predictor constant blijft.", sep = "\n\n") }
      get_reporter()$add_message(message, type = "markdown"); generated == expected
    })
  })
})
