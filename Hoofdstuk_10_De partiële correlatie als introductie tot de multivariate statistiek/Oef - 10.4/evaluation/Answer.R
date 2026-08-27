context({
  testcase("", {
    testEqual("", function(env) {
      expected_values <- c(conclusie = 3); read_number <- function(name) { if (!exists(name, envir = env)) return(NA_real_); value <- suppressWarnings(as.numeric(get(name, envir = env))); if (length(value) != 1L || !is.finite(value)) return(NA_real_); value }
      values <- vapply(names(expected_values), read_number, numeric(1)); valid <- all(is.finite(values)); correct <- valid && all(abs(values - expected_values) <= 0.0005); assign("results_10_4", list(valid = valid, values = values, expected = expected_values), envir = globalenv()); correct
    }, TRUE, comparator = function(generated, expected, ...) {
      results <- get("results_10_4", envir = globalenv())
      if (isTRUE(generated == expected)) message <- paste("**Bevestiging:** je antwoord past bij het leerdoel van deze korte oefening.", "**Denkregel:** Een kleine verandering in grootte en hetzelfde teken wijzen erop dat Z weinig van het verband verklaart of onderdrukt.", "**Transferstap:** Vergelijk het absolute verschil tussen de twee correlaties.", sep = "\n\n")
      else if (!results$valid) message <- paste("**Waarschijnlijke redenering:** minstens één antwoord ontbreekt, bevat tekst of is niet één eindig getal.", "**Waarom dit niet klopt:** elke lege plaats verwacht precies één geldige waarde.", "**Denkregel:** Een kleine verandering in grootte en hetzelfde teken wijzen erop dat Z weinig van het verband verklaart of onderdrukt.", "**Volgende stap:** Vergelijk het absolute verschil tussen de twee correlaties.", sep = "\n\n")
      else { wrong_field <- names(which(abs(results$values - results$expected) > 0.0005))[[1L]]; values <- results$values; likely <- "Je hebt een verwante grootheid of verkeerde antwoordoptie gekozen."
        if (identical(wrong_field, "conclusie") && abs(values[[wrong_field]] - 1) <= 0.0005) likely <- "Het verband blijft bijna even sterk en verdwijnt dus niet."
        if (identical(wrong_field, "conclusie") && abs(values[[wrong_field]] - 2) <= 0.0005) likely <- "Suppressie zou een duidelijke versterking veroorzaken."
        if (identical(wrong_field, "conclusie") && abs(values[[wrong_field]] - 4) <= 0.0005) likely <- "Beide correlaties liggen duidelijk boven nul."
        message <- paste(paste0("**Waarschijnlijke redenering:** ", likely), "**Waarom dit niet klopt:** Een kleine verandering in grootte en hetzelfde teken wijzen erop dat Z weinig van het verband verklaart of onderdrukt.", "**Denkregel:** Een kleine verandering in grootte en hetzelfde teken wijzen erop dat Z weinig van het verband verklaart of onderdrukt.", "**Volgende stap:** Vergelijk het absolute verschil tussen de twee correlaties.", sep = "\n\n") }
      get_reporter()$add_message(message, type = "markdown"); generated == expected
    })
  })
})
