context({
  testcase("", {
    testEqual("", function(env) {
      expected_values <- c(kruisproductsom = 4)
      read_number <- function(name) {
        if (!exists(name, envir = env)) return(NA_real_)
        value <- suppressWarnings(as.numeric(get(name, envir = env)))
        if (length(value) != 1L || !is.finite(value)) return(NA_real_)
        value
      }
      values <- vapply(names(expected_values), read_number, numeric(1))
      valid <- all(is.finite(values))
      correct <- valid && all(abs(values - expected_values) <= 0.0005)
      assign("results_8_1_1", list(valid = valid, values = values, expected = expected_values), envir = globalenv())
      correct
    }, TRUE, comparator = function(generated, expected, ...) {
      results <- get("results_8_1_1", envir = globalenv())
      if (isTRUE(generated == expected)) {
        message <- paste("**Bevestiging:** je antwoord past bij het leerdoel van deze korte oefening.", "**Denkregel:** Vermenigvuldig de gepaarde afwijkingen en tel de producten met hun teken op.", "**Transferstap:** Bereken per rij het product en tel daarna de drie producten.", sep = "\n\n")
      } else if (!results$valid) {
        message <- paste("**Waarschijnlijke redenering:** minstens één antwoord ontbreekt, bevat tekst of is niet één eindig getal.", "**Waarom dit niet klopt:** elke lege plaats verwacht precies één berekende waarde of geldig optienummer.", "**Denkregel:** Vermenigvuldig de gepaarde afwijkingen en tel de producten met hun teken op.", "**Volgende stap:** Bereken per rij het product en tel daarna de drie producten.", sep = "\n\n")
      } else {
        wrong_field <- names(which(abs(results$values - results$expected) > 0.0005))[[1L]]
        values <- results$values
        likely <- "Je hebt een verwante grootheid, verkeerde schaal of verkeerde antwoordoptie gebruikt."
              if (identical(wrong_field, "kruisproductsom") && abs(values[[wrong_field]] - -4) <= 0.0005) likely <- "Je hebt bij minstens één gepaard product het teken omgekeerd."
              if (identical(wrong_field, "kruisproductsom") && abs(values[[wrong_field]] - 0) <= 0.0005) likely <- "Je hebt de afwijkingen afzonderlijk opgeteld in plaats van gepaarde producten te vormen."
        message <- paste(paste0("**Waarschijnlijke redenering:** ", likely), "**Waarom dit niet klopt:** Vermenigvuldig de gepaarde afwijkingen en tel de producten met hun teken op.", "**Denkregel:** Vermenigvuldig de gepaarde afwijkingen en tel de producten met hun teken op.", "**Volgende stap:** Bereken per rij het product en tel daarna de drie producten.", sep = "\n\n")
      }
      get_reporter()$add_message(message, type = "markdown")
      generated == expected
    })
  })
})
