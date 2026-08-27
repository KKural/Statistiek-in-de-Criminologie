context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          expected_values <- c(gemiddelde = 24, afwijking_20 = -4)
          read_number <- function(name) {
            if (!exists(name, envir = env)) return(NA_real_)
            value <- suppressWarnings(as.numeric(get(name, envir = env)))
            if (length(value) != 1L || !is.finite(value)) return(NA_real_)
            value
          }
          values <- vapply(names(expected_values), read_number, numeric(1))
          valid <- all(is.finite(values))
          correct <- valid && all(abs(values - expected_values) <= 0.0000001)
          assign("results_3_3_5", list(valid = valid, values = values), envir = globalenv())
          correct
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("results_3_3_5", envir = globalenv())
          values <- results$values
          if (isTRUE(generated == expected)) {
            message <- paste(
              "**Bevestiging:** je gemiddelde en de getekende afwijking van 20 uur zijn correct.",
              "**Denkregel:** afwijking = waarneming − gemiddelde; onder het gemiddelde betekent negatief.",
              "**Transferstap:** voorspel bij een nieuwe waarneming eerst het teken en bereken daarna pas de grootte.",
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
              if (abs(values[["afwijking_20"]] - 4) < 0.0001) {
                likely <- "Je hebt de absolute afstand genomen of de aftrekking omgekeerd."
                why <- "Een afwijking behoudt haar teken en wordt berekend als waarneming min gemiddelde."
                next_step <- "Schrijf letterlijk 20 min je berekende gemiddelde en behoud het minteken."
              } else if (abs(values[["gemiddelde"]] - 24) < 0.0001) {
                likely <- "Het gemiddelde klopt, maar de afwijking gebruikt een verkeerd teken of een verkeerde bewerking."
                why <- "De afwijking moet rechtstreeks uit 20 min het gemiddelde volgen."
                next_step <- "Vul je correcte gemiddelde in de formule waarneming − gemiddelde in."
              } else {
                likely <- "Het gemiddelde is niet berekend met alle drie waarden."
                why <- "De referentiewaarde voor de afwijking moet het rekenkundige gemiddelde van de volledige korte reeks zijn."
                next_step <- "Tel 20, 24 en 28 op en deel door drie voordat je de afwijking berekent."
              }
            }
            message <- paste(
              paste0("**Waarschijnlijke redenering:** ", likely),
              paste0("**Waarom dit niet klopt:** ", why),
              "**Denkregel:** afwijking = waarneming − gemiddelde; onder het gemiddelde betekent negatief.",
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
