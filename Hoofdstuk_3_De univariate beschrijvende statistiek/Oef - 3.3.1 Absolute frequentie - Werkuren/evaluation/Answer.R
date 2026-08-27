context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          expected_values <- c(frequentie_32 = 3)
          read_number <- function(name) {
            if (!exists(name, envir = env)) return(NA_real_)
            value <- suppressWarnings(as.numeric(get(name, envir = env)))
            if (length(value) != 1L || !is.finite(value)) return(NA_real_)
            value
          }
          values <- vapply(names(expected_values), read_number, numeric(1))
          valid <- all(is.finite(values))
          correct <- valid && all(abs(values - expected_values) <= 0.0000001)
          assign("results_3_3_1", list(valid = valid, values = values), envir = globalenv())
          correct
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("results_3_3_1", envir = globalenv())
          values <- results$values
          if (isTRUE(generated == expected)) {
            message <- paste(
              "**Bevestiging:** je hebt de waarde 32 correct geteld in de korte reeks.",
              "**Denkregel:** een absolute frequentie is het aantal exacte voorkomens van de gekozen waarde.",
              "**Transferstap:** gebruik dezelfde telstap voor een andere waarde voordat je naar proporties gaat.",
              sep = "\n\n"
            )
          } else {
            if (!results$valid) {
              likely <- "Minstens één antwoord ontbreekt, bevat tekst of is niet één eindig getal."
              why <- "Elke lege plaats moet met precies één berekend getal worden ingevuld."
              next_step <- "Controleer alle invoervelden en vul uitsluitend de gevraagde eindwaarden in."
            } else {
              likely <- "Je hebt een verwante grootheid of tussenstap ingevuld."
              why <- "De ingevulde waarde beantwoordt niet precies de gevraagde statistische vraag."
              next_step <- "Lees de gevraagde bewerking opnieuw en voer alleen die stap uit."
              if (abs(values[["frequentie_32"]] - 32) < 0.0001) {
                likely <- "Je hebt de gezochte waarde zelf overgenomen in plaats van haar voorkomens te tellen."
                why <- "De categorie en haar absolute frequentie zijn verschillende grootheden."
                next_step <- "Loop eenmaal door de acht waarden en zet één telstreepje bij elk exact voorkomen van 32."
              } else if (values[["frequentie_32"]] > 0 && values[["frequentie_32"]] < 1) {
                likely <- "Je hebt een relatieve frequentie ingevuld."
                why <- "Hier wordt een aantal waarnemingen gevraagd, geen aandeel."
                next_step <- "Tel de voorkomens en laat de uitkomst als geheel aantal staan."
              } else {
                likely <- "Je telling bevat een waarde die niet gelijk is aan 32, of je hebt een voorkomen gemist."
                why <- "Alleen exacte voorkomens tellen mee voor deze absolute frequentie."
                next_step <- "Markeer elk voorkomen van 32 in de reeks en tel de markeringen."
              }
            }
            message <- paste(
              paste0("**Waarschijnlijke redenering:** ", likely),
              paste0("**Waarom dit niet klopt:** ", why),
              "**Denkregel:** een absolute frequentie is het aantal exacte voorkomens van de gekozen waarde.",
              paste0("**Volgende stap:** ", next_step),
              sep = "\n\n"
            )
          }
          get_reporter()$add_message(message, type = "markdown")
          generated == expected
        }
      )
    }
  )
})
