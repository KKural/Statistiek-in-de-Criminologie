context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          expected_values <- c(afwijking_26 = -4, gekwadrateerde_afwijking_26 = 16)
          read_number <- function(name) {
            if (!exists(name, envir = env)) return(NA_real_)
            value <- suppressWarnings(as.numeric(get(name, envir = env)))
            if (length(value) != 1L || !is.finite(value)) return(NA_real_)
            value
          }
          values <- vapply(names(expected_values), read_number, numeric(1))
          valid <- all(is.finite(values))
          correct <- valid && all(abs(values - expected_values) <= 0.0000001)
          assign("results_3_3_7", list(valid = valid, values = values), envir = globalenv())
          correct
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("results_3_3_7", envir = globalenv())
          values <- results$values
          if (isTRUE(generated == expected)) {
            message <- paste(
              "**Bevestiging:** je hebt zowel de getekende afwijking als het positieve kwadraat correct berekend.",
              "**Denkregel:** bereken eerst x − gemiddelde en kwadrateer daarna de volledige getekende afwijking.",
              "**Transferstap:** controleer bij elke gekwadrateerde afwijking dat de uitkomst niet negatief kan zijn.",
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
              if (values[["gekwadrateerde_afwijking_26"]] < 0) {
                likely <- "Je hebt het minteken buiten het kwadraat laten staan."
                why <- "Het kwadraat van een reëel getal is nooit negatief."
                next_step <- "Plaats de volledige afwijking tussen haakjes en kwadrateer die."
              } else if (abs(values[["afwijking_26"]] - 4) < 0.0001) {
                likely <- "Je hebt de afwijking als een absolute afstand behandeld."
                why <- "De getekende afwijking is negatief wanneer de waarneming onder het gemiddelde ligt."
                next_step <- "Bereken eerst 26 − 30 en behoud het teken; kwadrateer pas daarna."
              } else if (abs(values[["gekwadrateerde_afwijking_26"]] - 4) < 0.0001) {
                likely <- "Je hebt de grootte van de afwijking gekopieerd zonder haar met zichzelf te vermenigvuldigen."
                why <- "Kwadrateren betekent de afwijking maal zichzelf."
                next_step <- "Vermenigvuldig de volledige afwijking met dezelfde afwijking."
              }
            }
            message <- paste(
              paste0("**Waarschijnlijke redenering:** ", likely),
              paste0("**Waarom dit niet klopt:** ", why),
              "**Denkregel:** bereken eerst x − gemiddelde en kwadrateer daarna de volledige getekende afwijking.",
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
