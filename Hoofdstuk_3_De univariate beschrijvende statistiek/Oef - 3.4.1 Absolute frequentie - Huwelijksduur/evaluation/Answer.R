context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          expected_values <- c(frequentie_60 = 2)
          read_number <- function(name) {
            if (!exists(name, envir = env)) return(NA_real_)
            value <- suppressWarnings(as.numeric(get(name, envir = env)))
            if (length(value) != 1L || !is.finite(value)) return(NA_real_)
            value
          }
          values <- vapply(names(expected_values), read_number, numeric(1))
          valid <- all(is.finite(values))
          correct <- valid && all(abs(values - expected_values) <= 0.0000001)
          assign("results_3_4_1", list(valid = valid, values = values), envir = globalenv())
          correct
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("results_3_4_1", envir = globalenv())
          values <- results$values
          if (isTRUE(generated == expected)) {
            message <- paste(
              "**Bevestiging:** je hebt de absolute frequentie van 60 dagen correct bepaald.",
              "**Denkregel:** een absolute frequentie is het aantal waarnemingen dat exact aan de gekozen waarde gelijk is.",
              "**Transferstap:** tel op dezelfde manier een andere duur voordat je die telling relatief maakt.",
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
              if (abs(values[["frequentie_60"]] - 60) < 0.0001) {
                likely <- "Je hebt de duur zelf ingevuld in plaats van het aantal voorkomens."
                why <- "De waarde van een categorie is niet hetzelfde als haar frequentie."
                next_step <- "Markeer elk exact voorkomen van 60 in de korte reeks en tel de markeringen."
              } else if (values[["frequentie_60"]] > 0 && values[["frequentie_60"]] < 1) {
                likely <- "Je hebt een relatieve frequentie ingevuld."
                why <- "Deze oefening vraagt eerst om het gehele aantal voorkomens."
                next_step <- "Geef alleen de telling en deel nog niet door het totaal."
              } else {
                likely <- "Je hebt een voorkomen gemist of een andere duur meegeteld."
                why <- "Alleen waarnemingen die exact 60 dagen zijn tellen mee."
                next_step <- "Vergelijk elke van de zes waarden afzonderlijk met 60."
              }
            }
            message <- paste(
              paste0("**Waarschijnlijke redenering:** ", likely),
              paste0("**Waarom dit niet klopt:** ", why),
              "**Denkregel:** een absolute frequentie is het aantal waarnemingen dat exact aan de gekozen waarde gelijk is.",
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
