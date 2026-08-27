context({
  testcase("", {
    testEqual("", function(env) {
      expected_value <- 2; value <- if (exists("afhankelijke_variabele", envir = env)) suppressWarnings(as.numeric(get("afhankelijke_variabele", envir = env))) else NA_real_
      valid <- length(value) == 1L && is.finite(value); assign("results_2_12", list(valid = valid, value = value), envir = globalenv()); valid && abs(value - expected_value) <= 0.0005
    }, TRUE, comparator = function(generated, expected, ...) {
      results <- get("results_2_12", envir = globalenv())
      if (isTRUE(generated == expected)) message <- paste("**Bevestiging:** je antwoord past bij het leerdoel van deze korte oefening.", "**Denkregel:** De afhankelijke variabele is de uitkomst die tussen de groepen wordt vergeleken.", "**Transferstap:** Vraag wat gemeten wordt nadat de groepen op basis van geslacht zijn gevormd.", sep = "\n\n")
      else if (!results$valid) message <- paste("**Waarschijnlijke redenering:** het antwoord ontbreekt, bevat tekst of is niet één eindig getal.", "**Waarom dit niet klopt:** deze oefening verwacht precies één waarde of optienummer.", "**Denkregel:** De afhankelijke variabele is de uitkomst die tussen de groepen wordt vergeleken.", "**Volgende stap:** Vraag wat gemeten wordt nadat de groepen op basis van geslacht zijn gevormd.", sep = "\n\n")
      else { value <- results$value; likely <- "Je hebt een verwant begrip of een andere schaal gekozen."
        if (abs(value - 1) <= 0.0005) likely <- "Je hebt de groepsindelende variabele als uitkomst gekozen."
        if (abs(value - 3) <= 0.0005) likely <- "De twee variabelen hebben in deze vraag verschillende rollen."
        if (abs(value - 4) <= 0.0005) likely <- "Een verschilvraag heeft wel degelijk een gemeten uitkomst."
        message <- paste(paste0("**Waarschijnlijke redenering:** ", likely), "**Waarom dit niet klopt:** De afhankelijke variabele is de uitkomst die tussen de groepen wordt vergeleken.", "**Denkregel:** De afhankelijke variabele is de uitkomst die tussen de groepen wordt vergeleken.", "**Volgende stap:** Vraag wat gemeten wordt nadat de groepen op basis van geslacht zijn gevormd.", sep = "\n\n") }
      get_reporter()$add_message(message, type = "markdown"); generated == expected
    })
  })
})
