context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          expected_values <- c(teken_afwijking = 1)
          read_number <- function(name) {
            if (!exists(name, envir = env)) return(NA_real_)
            value <- suppressWarnings(as.numeric(get(name, envir = env)))
            if (length(value) != 1L || !is.finite(value)) return(NA_real_)
            value
          }
          values <- vapply(names(expected_values), read_number, numeric(1))
          valid <- all(is.finite(values))
          correct <- valid && all(abs(values - expected_values) <= 0.0000001)
          assign("results_3_3_6", list(valid = valid, values = values), envir = globalenv())
          correct
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("results_3_3_6", envir = globalenv())
          values <- results$values
          if (isTRUE(generated == expected)) {
            message <- paste(
              "**Bevestiging:** je herkent dat een waarde boven het gemiddelde een positieve afwijking heeft.",
              "**Denkregel:** vergelijk eerst de waarneming met het gemiddelde: hoger is positief, gelijk is nul, lager is negatief.",
              "**Transferstap:** bepaal voortaan vóór elke berekening welk teken je uitkomst moet hebben.",
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
              if (values[["teken_afwijking"]] == 2) {
                likely <- "Je hebt de afwijking als nul beschouwd omdat beide getallen werkuren voorstellen."
                why <- "Een afwijking is alleen nul wanneer waarneming en gemiddelde exact gelijk zijn."
                next_step <- "Vergelijk 34 en 30: bepaal eerst welke waarde groter is."
              } else if (values[["teken_afwijking"]] == 3) {
                likely <- "Je hebt gemiddelde min waarneming gebruikt."
                why <- "De vaste volgorde is waarneming min gemiddelde."
                next_step <- "Schrijf 34 − 30 en beoordeel het teken van die uitkomst."
              } else {
                likely <- "Je invoer verwijst niet naar één van de drie aangeboden tekens."
                why <- "Alleen de optienummers 1, 2 en 3 horen bij deze vraag."
                next_step <- "Kies het nummer dat hoort bij positief, nul of negatief."
              }
            }
            message <- paste(
              paste0("**Waarschijnlijke redenering:** ", likely),
              paste0("**Waarom dit niet klopt:** ", why),
              "**Denkregel:** vergelijk eerst de waarneming met het gemiddelde: hoger is positief, gelijk is nul, lager is negatief.",
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
