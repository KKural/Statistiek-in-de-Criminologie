context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          expected_values <- c(ontbrekende_afwijking = 2, som_afwijkingen = 0)
          read_number <- function(name) {
            if (!exists(name, envir = env)) return(NA_real_)
            value <- suppressWarnings(as.numeric(get(name, envir = env)))
            if (length(value) != 1L || !is.finite(value)) return(NA_real_)
            value
          }
          values <- vapply(names(expected_values), read_number, numeric(1))
          valid <- all(is.finite(values))
          correct <- valid && all(abs(values - expected_values) <= 0.0000001)
          assign("results_3_3_9", list(valid = valid, values = values), envir = globalenv())
          correct
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("results_3_3_9", envir = globalenv())
          values <- results$values
          if (isTRUE(generated == expected)) {
            message <- paste(
              "**Bevestiging:** je gebruikt correct dat de getekende afwijkingen rond het gemiddelde tot nul optellen.",
              "**Denkregel:** voor elke waarde geldt afwijking = x − gemiddelde; de som van alle afwijkingen rond het gemiddelde is nul.",
              "**Transferstap:** gebruik de nul-som als snelle controle nadat je een reeks afwijkingen hebt berekend.",
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
              if (abs(values[["ontbrekende_afwijking"]] + 2) < 0.0001) {
                likely <- "Je hebt gemiddelde min waarneming gebruikt voor de laatste waarde."
                why <- "De afwijking gebruikt steeds waarneming min gemiddelde."
                next_step <- "Bereken 6 − 4 en tel daarna alle drie getekende afwijkingen op."
              } else if (abs(values[["som_afwijkingen"]] - 4) < 0.0001) {
                likely <- "Je hebt absolute afstanden opgeteld."
                why <- "De nul-som-eigenschap geldt voor getekende afwijkingen, inclusief negatieve waarden."
                next_step <- "Behoud het minteken van de eerste afwijking en tel opnieuw op."
              } else if (abs(values[["ontbrekende_afwijking"]] - 2) < 0.0001) {
                likely <- "De ontbrekende afwijking klopt, maar de optelling van de tekens niet."
                why <- "Tegengestelde afwijkingen met dezelfde grootte heffen elkaar op."
                next_step <- "Tel -2, 0 en je ontbrekende afwijking zorgvuldig met teken op."
              }
            }
            message <- paste(
              paste0("**Waarschijnlijke redenering:** ", likely),
              paste0("**Waarom dit niet klopt:** ", why),
              "**Denkregel:** voor elke waarde geldt afwijking = x − gemiddelde; de som van alle afwijkingen rond het gemiddelde is nul.",
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
