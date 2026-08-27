context({
  testcase("", {
    testEqual("", function(env) {
      expected_values <- c(relatietype = 3); read_number <- function(name) { if (!exists(name, envir = env)) return(NA_real_); value <- suppressWarnings(as.numeric(get(name, envir = env))); if (length(value) != 1L || !is.finite(value)) return(NA_real_); value }
      values <- vapply(names(expected_values), read_number, numeric(1)); valid <- all(is.finite(values)); correct <- valid && all(abs(values - expected_values) <= 0.0005); assign("results_10_3", list(valid = valid, values = values, expected = expected_values), envir = globalenv()); correct
    }, TRUE, comparator = function(generated, expected, ...) {
      results <- get("results_10_3", envir = globalenv())
      if (isTRUE(generated == expected)) message <- paste("**Bevestiging:** je antwoord past bij het leerdoel van deze korte oefening.", "**Denkregel:** Bij suppressie maskeert Z een deel van het verband, waardoor |r_XY.Z| duidelijk groter wordt dan |r_XY|.", "**Transferstap:** Vergelijk de absolute correlatie vóór en na controle; let ook op de gecorrigeerde positieve r_YZ.", sep = "\n\n")
      else if (!results$valid) message <- paste("**Waarschijnlijke redenering:** minstens één antwoord ontbreekt, bevat tekst of is niet één eindig getal.", "**Waarom dit niet klopt:** elke lege plaats verwacht precies één geldige waarde.", "**Denkregel:** Bij suppressie maskeert Z een deel van het verband, waardoor |r_XY.Z| duidelijk groter wordt dan |r_XY|.", "**Volgende stap:** Vergelijk de absolute correlatie vóór en na controle; let ook op de gecorrigeerde positieve r_YZ.", sep = "\n\n")
      else { wrong_field <- names(which(abs(results$values - results$expected) > 0.0005))[[1L]]; values <- results$values; likely <- "Je hebt een verwante grootheid of verkeerde antwoordoptie gekozen."
        if (identical(wrong_field, "relatietype") && abs(values[[wrong_field]] - 1) <= 0.0005) likely <- "Een schijnverband zou na controle juist sterk afnemen."
        if (identical(wrong_field, "relatietype") && abs(values[[wrong_field]] - 2) <= 0.0005) likely <- "De grote verandering laat zien dat Z wel degelijk een belangrijke rol speelt."
        if (identical(wrong_field, "relatietype") && abs(values[[wrong_field]] - 4) <= 0.0005) likely <- "Het gecontroleerde verband wordt sterker in plaats van te verdwijnen."
        message <- paste(paste0("**Waarschijnlijke redenering:** ", likely), "**Waarom dit niet klopt:** Bij suppressie maskeert Z een deel van het verband, waardoor |r_XY.Z| duidelijk groter wordt dan |r_XY|.", "**Denkregel:** Bij suppressie maskeert Z een deel van het verband, waardoor |r_XY.Z| duidelijk groter wordt dan |r_XY|.", "**Volgende stap:** Vergelijk de absolute correlatie vóór en na controle; let ook op de gecorrigeerde positieve r_YZ.", sep = "\n\n") }
      get_reporter()$add_message(message, type = "markdown"); generated == expected
    })
  })
})
