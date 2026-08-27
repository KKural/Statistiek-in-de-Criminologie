context({
  testcase("", {
    testEqual("", function(env) {
      expected_values <- c(modelconclusie = 1)
      read_number <- function(name) { if (!exists(name, envir = env)) return(NA_real_); value <- suppressWarnings(as.numeric(get(name, envir = env))); if (length(value) != 1L || !is.finite(value)) return(NA_real_); value }
      values <- vapply(names(expected_values), read_number, numeric(1)); valid <- all(is.finite(values)); correct <- valid && all(abs(values - expected_values) <= 0.0005)
      assign("results_11_7_1", list(valid = valid, values = values, expected = expected_values), envir = globalenv()); correct
    }, TRUE, comparator = function(generated, expected, ...) {
      results <- get("results_11_7_1", envir = globalenv())
      if (isTRUE(generated == expected)) message <- paste("**Bevestiging:** je antwoord past bij het leerdoel van deze korte oefening.", "**Denkregel:** De globale F-toets vergelijkt het volledige regressiemodel met een nulmodel; zij test niet afzonderlijk elke coëfficiënt of assumptie.", "**Transferstap:** Koppel de kleine p-waarde uitsluitend aan de globale modelvergelijking.", sep = "\n\n")
      else if (!results$valid) message <- paste("**Waarschijnlijke redenering:** minstens één antwoord ontbreekt, bevat tekst of is niet één eindig getal.", "**Waarom dit niet klopt:** elke lege plaats verwacht precies één geldige waarde.", "**Denkregel:** De globale F-toets vergelijkt het volledige regressiemodel met een nulmodel; zij test niet afzonderlijk elke coëfficiënt of assumptie.", "**Volgende stap:** Koppel de kleine p-waarde uitsluitend aan de globale modelvergelijking.", sep = "\n\n")
      else { wrong_field <- names(which(abs(results$values - results$expected) > 0.0005))[[1L]]; values <- results$values; likely <- "Je hebt een verwante grootheid, verkeerde richting of verkeerde antwoordoptie gebruikt."
        if (identical(wrong_field, "modelconclusie") && abs(values[[wrong_field]] - 2) <= 0.0005) likely <- "Je trekt uit de globale F-toets een conclusie over iedere afzonderlijke coëfficiënt."
        if (identical(wrong_field, "modelconclusie") && abs(values[[wrong_field]] - 3) <= 0.0005) likely <- "Je gebruikt de F-toets ten onrechte als normaliteitstoets."
        if (identical(wrong_field, "modelconclusie") && abs(values[[wrong_field]] - 4) <= 0.0005) likely <- "Significantie betekent niet dat het model alle variantie verklaart."
        message <- paste(paste0("**Waarschijnlijke redenering:** ", likely), "**Waarom dit niet klopt:** De globale F-toets vergelijkt het volledige regressiemodel met een nulmodel; zij test niet afzonderlijk elke coëfficiënt of assumptie.", "**Denkregel:** De globale F-toets vergelijkt het volledige regressiemodel met een nulmodel; zij test niet afzonderlijk elke coëfficiënt of assumptie.", "**Volgende stap:** Koppel de kleine p-waarde uitsluitend aan de globale modelvergelijking.", sep = "\n\n") }
      get_reporter()$add_message(message, type = "markdown"); generated == expected
    })
  })
})
