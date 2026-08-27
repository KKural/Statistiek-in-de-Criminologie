context({
  testcase("", {
    testEqual("", function(env) {
      expected_values <- c(oddsratio = 2, interpretatie = 1)
      read_number <- function(name) {
        if (!exists(name, envir = env)) return(NA_real_)
        value <- suppressWarnings(as.numeric(get(name, envir = env)))
        if (length(value) != 1L || !is.finite(value)) return(NA_real_)
        value
      }
      values <- vapply(names(expected_values), read_number, numeric(1))
      valid <- all(is.finite(values))
      correct <- valid && all(abs(values - expected_values) <= 0.0005)
      assign("results_7_1_2", list(valid = valid, values = values, expected = expected_values), envir = globalenv())
      correct
    }, TRUE, comparator = function(generated, expected, ...) {
      results <- get("results_7_1_2", envir = globalenv())
      if (isTRUE(generated == expected)) {
        message <- paste("**Bevestiging:** je antwoord past bij het leerdoel van deze korte oefening.", "**Denkregel:** Een oddsratio vergelijkt odds, niet rechtstreeks kansen; de volgorde van teller en noemer bepaalt de richting.", "**Transferstap:** Deel 0.50 door 0.25 en koppel de verhouding aan groep A versus B.", sep = "\n\n")
      } else if (!results$valid) {
        message <- paste("**Waarschijnlijke redenering:** minstens één antwoord ontbreekt, bevat tekst of is niet één eindig getal.", "**Waarom dit niet klopt:** elke lege plaats verwacht precies één berekende waarde of geldig optienummer.", "**Denkregel:** Een oddsratio vergelijkt odds, niet rechtstreeks kansen; de volgorde van teller en noemer bepaalt de richting.", "**Volgende stap:** Deel 0.50 door 0.25 en koppel de verhouding aan groep A versus B.", sep = "\n\n")
      } else {
        wrong_field <- names(which(abs(results$values - results$expected) > 0.0005))[[1L]]
        values <- results$values
        likely <- "Je hebt een verwante grootheid, verkeerde schaal of verkeerde antwoordoptie gebruikt."
              if (identical(wrong_field, "oddsratio") && abs(values[[wrong_field]] - 0.5) <= 0.0005) likely <- "Je hebt de verhouding omgekeerd en B door A gedeeld."
              if (identical(wrong_field, "interpretatie") && abs(values[[wrong_field]] - 2) <= 0.0005) likely <- "Je verwart een verhouding van odds met een verhouding van kansen."
              if (identical(wrong_field, "interpretatie") && abs(values[[wrong_field]] - 3) <= 0.0005) likely <- "Je hebt de richting van de vergelijking omgekeerd."
        message <- paste(paste0("**Waarschijnlijke redenering:** ", likely), "**Waarom dit niet klopt:** Een oddsratio vergelijkt odds, niet rechtstreeks kansen; de volgorde van teller en noemer bepaalt de richting.", "**Denkregel:** Een oddsratio vergelijkt odds, niet rechtstreeks kansen; de volgorde van teller en noemer bepaalt de richting.", "**Volgende stap:** Deel 0.50 door 0.25 en koppel de verhouding aan groep A versus B.", sep = "\n\n")
      }
      get_reporter()$add_message(message, type = "markdown")
      generated == expected
    })
  })
})
