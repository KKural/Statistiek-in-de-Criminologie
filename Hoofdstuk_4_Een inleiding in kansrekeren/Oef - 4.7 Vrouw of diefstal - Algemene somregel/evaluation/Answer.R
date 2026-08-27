context({
  testcase("", {
    testEqual("", function(env) {
      expected_value <- 0.8; value <- if (exists("kans_a_of_b", envir = env)) suppressWarnings(as.numeric(get("kans_a_of_b", envir = env))) else NA_real_
      valid <- length(value) == 1L && is.finite(value); assign("results_4_7", list(valid = valid, value = value), envir = globalenv()); valid && abs(value - expected_value) <= 0.0005
    }, TRUE, comparator = function(generated, expected, ...) {
      results <- get("results_4_7", envir = globalenv())
      if (isTRUE(generated == expected)) message <- paste("**Bevestiging:** je antwoord past bij het leerdoel van deze korte oefening.", "**Denkregel:** P(A ∪ B) = P(A) + P(B) − P(A ∩ B); trek de overlap eenmaal af.", "**Transferstap:** Tel 0.60 en 0.50 op en corrigeer daarna voor de dubbel getelde overlap.", sep = "\n\n")
      else if (!results$valid) message <- paste("**Waarschijnlijke redenering:** het antwoord ontbreekt, bevat tekst of is niet één eindig getal.", "**Waarom dit niet klopt:** deze oefening verwacht precies één waarde of optienummer.", "**Denkregel:** P(A ∪ B) = P(A) + P(B) − P(A ∩ B); trek de overlap eenmaal af.", "**Volgende stap:** Tel 0.60 en 0.50 op en corrigeer daarna voor de dubbel getelde overlap.", sep = "\n\n")
      else { value <- results$value; likely <- "Je hebt een verwante grootheid of verkeerde antwoordoptie gekozen."
        if (abs(value - 1.1) <= 0.0005) likely <- "Je hebt de kansen opgeteld zonder de overlap af te trekken."
        if (abs(value - 0.3) <= 0.0005) likely <- "Je hebt alleen de doorsnede ingevuld in plaats van de unie."
        message <- paste(paste0("**Waarschijnlijke redenering:** ", likely), "**Waarom dit niet klopt:** P(A ∪ B) = P(A) + P(B) − P(A ∩ B); trek de overlap eenmaal af.", "**Denkregel:** P(A ∪ B) = P(A) + P(B) − P(A ∩ B); trek de overlap eenmaal af.", "**Volgende stap:** Tel 0.60 en 0.50 op en corrigeer daarna voor de dubbel getelde overlap.", sep = "\n\n") }
      get_reporter()$add_message(message, type = "markdown"); generated == expected
    })
  })
})
