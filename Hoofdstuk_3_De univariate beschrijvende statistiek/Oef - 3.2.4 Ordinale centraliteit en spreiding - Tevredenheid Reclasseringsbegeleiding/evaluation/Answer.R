context({
  testcase("", {
    testEqual("", function(env) {
      expected_values <- c(samenvattingspaar = 2)
      read_number <- function(name) {
        if (!exists(name, envir = env)) return(NA_real_)
        value <- suppressWarnings(as.numeric(get(name, envir = env)))
        if (length(value) != 1L || !is.finite(value)) return(NA_real_)
        value
      }
      values <- vapply(names(expected_values), read_number, numeric(1))
      valid <- all(is.finite(values))
      correct <- valid && all(abs(values - expected_values) <= 0.0005)
      assign("results_3_2_4", list(valid = valid, values = values, expected = expected_values), envir = globalenv())
      correct
    }, TRUE, comparator = function(generated, expected, ...) {
      results <- get("results_3_2_4", envir = globalenv())
      if (isTRUE(generated == expected)) {
        message <- paste("**Bevestiging:** je antwoord past bij het leerdoel van deze korte oefening.", "**Denkregel:** Bij ordinale gegevens gebruik je rangorde, maar veronderstel je geen gelijke numerieke afstanden.", "**Transferstap:** Kies maten die op posities en rangorde steunen.", sep = "\n\n")
      } else if (!results$valid) {
        message <- paste("**Waarschijnlijke redenering:** minstens één antwoord ontbreekt, bevat tekst of is niet één eindig getal.", "**Waarom dit niet klopt:** elke lege plaats verwacht precies één berekende waarde of geldig optienummer.", "**Denkregel:** Bij ordinale gegevens gebruik je rangorde, maar veronderstel je geen gelijke numerieke afstanden.", "**Volgende stap:** Kies maten die op posities en rangorde steunen.", sep = "\n\n")
      } else {
        wrong_field <- names(which(abs(results$values - results$expected) > 0.0005))[[1L]]
        values <- results$values
        likely <- "Je hebt een verwante grootheid, verkeerde schaal of verkeerde antwoordoptie gebruikt."
              if (identical(wrong_field, "samenvattingspaar") && abs(values[[wrong_field]] - 1) <= 0.0005) likely <- "Je behandelt de categorieafstanden alsof ze exact numeriek gelijk zijn."
              if (identical(wrong_field, "samenvattingspaar") && abs(values[[wrong_field]] - 3) <= 0.0005) likely <- "De modus kan, maar variantie vereist betekenisvolle numerieke afstanden."
              if (identical(wrong_field, "samenvattingspaar") && abs(values[[wrong_field]] - 4) <= 0.0005) likely <- "Beide maten veronderstellen kwantitatieve afstanden en verhoudingen."
        message <- paste(paste0("**Waarschijnlijke redenering:** ", likely), "**Waarom dit niet klopt:** Bij ordinale gegevens gebruik je rangorde, maar veronderstel je geen gelijke numerieke afstanden.", "**Denkregel:** Bij ordinale gegevens gebruik je rangorde, maar veronderstel je geen gelijke numerieke afstanden.", "**Volgende stap:** Kies maten die op posities en rangorde steunen.", sep = "\n\n")
      }
      get_reporter()$add_message(message, type = "markdown")
      generated == expected
    })
  })
})
