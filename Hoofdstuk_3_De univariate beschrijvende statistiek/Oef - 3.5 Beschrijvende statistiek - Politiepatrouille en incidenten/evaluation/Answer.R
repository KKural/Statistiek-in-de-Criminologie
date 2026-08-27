context({
  testcase("", {
    testEqual("", function(env) {
      expected_value <- 1; value <- if (exists("spreidingsmaat", envir = env)) suppressWarnings(as.numeric(get("spreidingsmaat", envir = env))) else NA_real_
      valid <- length(value) == 1L && is.finite(value); assign("results_3_5", list(valid = valid, value = value), envir = globalenv()); valid && abs(value - expected_value) <= 0.0005
    }, TRUE, comparator = function(generated, expected, ...) {
      results <- get("results_3_5", envir = globalenv())
      if (isTRUE(generated == expected)) message <- paste("**Bevestiging:** je antwoord past bij het leerdoel van deze korte oefening.", "**Denkregel:** Bij kwantitatieve, ongeveer symmetrische data zonder sterke uitbijters past de standaardafwijking bij het gemiddelde.", "**Transferstap:** Controleer meetniveau, verdelingsvorm en uitbijters voordat je de maat kiest.", sep = "\n\n")
      else if (!results$valid) message <- paste("**Waarschijnlijke redenering:** het antwoord ontbreekt, bevat tekst of is niet één eindig getal.", "**Waarom dit niet klopt:** deze oefening verwacht precies één waarde of optienummer.", "**Denkregel:** Bij kwantitatieve, ongeveer symmetrische data zonder sterke uitbijters past de standaardafwijking bij het gemiddelde.", "**Volgende stap:** Controleer meetniveau, verdelingsvorm en uitbijters voordat je de maat kiest.", sep = "\n\n")
      else { value <- results$value; likely <- "Je hebt een verwante grootheid of verkeerde antwoordoptie gekozen."
        if (abs(value - 2) <= 0.0005) likely <- "Je kiest een robuuste maat terwijl de context geen sterke uitbijters of scheefheid vermeldt."
        if (abs(value - 3) <= 0.0005) likely <- "De modus is een centrummaat en geen spreidingsmaat."
        if (abs(value - 4) <= 0.0005) likely <- "De mediaan is eveneens een centrummaat."
        message <- paste(paste0("**Waarschijnlijke redenering:** ", likely), "**Waarom dit niet klopt:** Bij kwantitatieve, ongeveer symmetrische data zonder sterke uitbijters past de standaardafwijking bij het gemiddelde.", "**Denkregel:** Bij kwantitatieve, ongeveer symmetrische data zonder sterke uitbijters past de standaardafwijking bij het gemiddelde.", "**Volgende stap:** Controleer meetniveau, verdelingsvorm en uitbijters voordat je de maat kiest.", sep = "\n\n") }
      get_reporter()$add_message(message, type = "markdown"); generated == expected
    })
  })
})
