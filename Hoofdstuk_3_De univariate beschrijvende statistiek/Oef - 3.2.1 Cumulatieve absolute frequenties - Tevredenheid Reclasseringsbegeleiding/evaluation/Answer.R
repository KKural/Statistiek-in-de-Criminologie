context({
  testcase("", {
    testEqual("", function(env) {
      expected_values <- c(cumulatieve_frequentie_neutraal = 20)
      read_number <- function(name) {
        if (!exists(name, envir = env)) return(NA_real_)
        value <- suppressWarnings(as.numeric(get(name, envir = env)))
        if (length(value) != 1L || !is.finite(value)) return(NA_real_)
        value
      }
      values <- vapply(names(expected_values), read_number, numeric(1))
      valid <- all(is.finite(values))
      correct <- valid && all(abs(values - expected_values) <= 0.0005)
      assign("results_3_2_1", list(valid = valid, values = values, expected = expected_values), envir = globalenv())
      correct
    }, TRUE, comparator = function(generated, expected, ...) {
      results <- get("results_3_2_1", envir = globalenv())
      if (isTRUE(generated == expected)) {
        message <- paste("**Bevestiging:** je antwoord past bij het leerdoel van deze korte oefening.", "**Denkregel:** Tel de frequentie van de grenscategorie én alle voorafgaande categorieën op.", "**Transferstap:** Tel 5, 8 en 7; neem geen categorieën na neutraal mee.", sep = "\n\n")
      } else if (!results$valid) {
        message <- paste("**Waarschijnlijke redenering:** minstens één antwoord ontbreekt, bevat tekst of is niet één eindig getal.", "**Waarom dit niet klopt:** elke lege plaats verwacht precies één berekende waarde of geldig optienummer.", "**Denkregel:** Tel de frequentie van de grenscategorie én alle voorafgaande categorieën op.", "**Volgende stap:** Tel 5, 8 en 7; neem geen categorieën na neutraal mee.", sep = "\n\n")
      } else {
        wrong_field <- names(which(abs(results$values - results$expected) > 0.0005))[[1L]]
        values <- results$values
        likely <- "Je hebt een verwante grootheid, verkeerde schaal of verkeerde antwoordoptie gebruikt."
              if (identical(wrong_field, "cumulatieve_frequentie_neutraal") && abs(values[[wrong_field]] - 7) <= 0.0005) likely <- "Je hebt alleen de gewone frequentie van de grenscategorie genomen."
              if (identical(wrong_field, "cumulatieve_frequentie_neutraal") && abs(values[[wrong_field]] - 13) <= 0.0005) likely <- "Je hebt de grenscategorie zelf niet meegeteld."
        message <- paste(paste0("**Waarschijnlijke redenering:** ", likely), "**Waarom dit niet klopt:** Tel de frequentie van de grenscategorie én alle voorafgaande categorieën op.", "**Denkregel:** Tel de frequentie van de grenscategorie én alle voorafgaande categorieën op.", "**Volgende stap:** Tel 5, 8 en 7; neem geen categorieën na neutraal mee.", sep = "\n\n")
      }
      get_reporter()$add_message(message, type = "markdown")
      generated == expected
    })
  })
})
