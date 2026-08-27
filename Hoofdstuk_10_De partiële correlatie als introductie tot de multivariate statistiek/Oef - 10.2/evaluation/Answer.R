context({
  testcase("", {
    testEqual("", function(env) {
      expected_values <- c(relatietype = 1); read_number <- function(name) { if (!exists(name, envir = env)) return(NA_real_); value <- suppressWarnings(as.numeric(get(name, envir = env))); if (length(value) != 1L || !is.finite(value)) return(NA_real_); value }
      values <- vapply(names(expected_values), read_number, numeric(1)); valid <- all(is.finite(values)); correct <- valid && all(abs(values - expected_values) <= 0.0005); assign("results_10_2", list(valid = valid, values = values, expected = expected_values), envir = globalenv()); correct
    }, TRUE, comparator = function(generated, expected, ...) {
      results <- get("results_10_2", envir = globalenv())
      if (isTRUE(generated == expected)) message <- paste("**Bevestiging:** je antwoord past bij het leerdoel van deze korte oefening.", "**Denkregel:** Wanneer een verband sterk afneemt na controle, droeg de controlevariabele substantieel bij aan de oorspronkelijke samenhang.", "**Transferstap:** Vergelijk eerst grootte en richting vóór en na controle.", sep = "\n\n")
      else if (!results$valid) message <- paste("**Waarschijnlijke redenering:** minstens één antwoord ontbreekt, bevat tekst of is niet één eindig getal.", "**Waarom dit niet klopt:** elke lege plaats verwacht precies één geldige waarde.", "**Denkregel:** Wanneer een verband sterk afneemt na controle, droeg de controlevariabele substantieel bij aan de oorspronkelijke samenhang.", "**Volgende stap:** Vergelijk eerst grootte en richting vóór en na controle.", sep = "\n\n")
      else { wrong_field <- names(which(abs(results$values - results$expected) > 0.0005))[[1L]]; values <- results$values; likely <- "Je hebt een verwante grootheid of verkeerde antwoordoptie gekozen."
        if (identical(wrong_field, "relatietype") && abs(values[[wrong_field]] - 2) <= 0.0005) likely <- "Bij suppressie wordt het gecontroleerde verband juist sterker zichtbaar."
        if (identical(wrong_field, "relatietype") && abs(values[[wrong_field]] - 3) <= 0.0005) likely <- "De daling van 0.60 naar 0.10 is inhoudelijk groot."
        if (identical(wrong_field, "relatietype") && abs(values[[wrong_field]] - 4) <= 0.0005) likely <- "Een correlatiepatroon bewijst geen perfect causaal verband."
        message <- paste(paste0("**Waarschijnlijke redenering:** ", likely), "**Waarom dit niet klopt:** Wanneer een verband sterk afneemt na controle, droeg de controlevariabele substantieel bij aan de oorspronkelijke samenhang.", "**Denkregel:** Wanneer een verband sterk afneemt na controle, droeg de controlevariabele substantieel bij aan de oorspronkelijke samenhang.", "**Volgende stap:** Vergelijk eerst grootte en richting vóór en na controle.", sep = "\n\n") }
      get_reporter()$add_message(message, type = "markdown"); generated == expected
    })
  })
})
