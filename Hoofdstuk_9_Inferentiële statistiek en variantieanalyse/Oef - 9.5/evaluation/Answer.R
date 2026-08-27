context({
  testcase("", {
    testEqual("", function(env) {
      expected_values <- c(antwoord = 3); read_number <- function(name) { if (!exists(name, envir = env)) return(NA_real_); value <- suppressWarnings(as.numeric(get(name, envir = env))); if (length(value) != 1L || !is.finite(value)) return(NA_real_); value }
      values <- vapply(names(expected_values), read_number, numeric(1)); valid <- all(is.finite(values)); correct <- valid && all(abs(values - expected_values) <= 0.0005); assign("results_9_5", list(valid = valid, values = values, expected = expected_values), envir = globalenv()); correct
    }, TRUE, comparator = function(generated, expected, ...) {
      results <- get("results_9_5", envir = globalenv())
      if (isTRUE(generated == expected)) message <- paste("**Bevestiging:** je antwoord past bij het leerdoel van deze korte oefening.", "**Denkregel:** Bij vaste vrijheidsgraden ligt een grotere F verder in de rechterstaart en hoort daar een kleinere p-waarde bij.", "**Transferstap:** Denk aan p als het staartoppervlak voorbij de waargenomen F.", sep = "\n\n")
      else if (!results$valid) message <- paste("**Waarschijnlijke redenering:** minstens één antwoord ontbreekt, bevat tekst of is niet één eindig getal.", "**Waarom dit niet klopt:** elke lege plaats verwacht precies één geldige waarde.", "**Denkregel:** Bij vaste vrijheidsgraden ligt een grotere F verder in de rechterstaart en hoort daar een kleinere p-waarde bij.", "**Volgende stap:** Denk aan p als het staartoppervlak voorbij de waargenomen F.", sep = "\n\n")
      else { wrong_field <- names(which(abs(results$values - results$expected) > 0.0005))[[1L]]; values <- results$values; likely <- "Je hebt een verwante grootheid of verkeerde antwoordoptie gekozen."
        if (identical(wrong_field, "antwoord") && abs(values[[wrong_field]] - 1) <= 0.0005) likely <- "Je hebt de richting tussen toetsingsgrootheid en staartkans omgekeerd."
        if (identical(wrong_field, "antwoord") && abs(values[[wrong_field]] - 2) <= 0.0005) likely <- "Je negeert dat de waargenomen toetsingsgrootheid de staartgrens bepaalt."
        if (identical(wrong_field, "antwoord") && abs(values[[wrong_field]] - 4) <= 0.0005) likely <- "Een p-waarde is een kans en kan niet negatief zijn."
        message <- paste(paste0("**Waarschijnlijke redenering:** ", likely), "**Waarom dit niet klopt:** Bij vaste vrijheidsgraden ligt een grotere F verder in de rechterstaart en hoort daar een kleinere p-waarde bij.", "**Denkregel:** Bij vaste vrijheidsgraden ligt een grotere F verder in de rechterstaart en hoort daar een kleinere p-waarde bij.", "**Volgende stap:** Denk aan p als het staartoppervlak voorbij de waargenomen F.", sep = "\n\n") }
      get_reporter()$add_message(message, type = "markdown"); generated == expected
    })
  })
})
