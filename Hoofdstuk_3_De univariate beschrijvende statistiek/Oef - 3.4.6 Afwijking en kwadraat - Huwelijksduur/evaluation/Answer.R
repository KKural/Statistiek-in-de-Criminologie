context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          expected_values <- c(gemiddelde = 30, afwijking_20 = -10, gekwadrateerde_afwijking_20 = 100)
          read_number <- function(name) {
            if (!exists(name, envir = env)) return(NA_real_)
            value <- suppressWarnings(as.numeric(get(name, envir = env)))
            if (length(value) != 1L || !is.finite(value)) return(NA_real_)
            value
          }
          values <- vapply(names(expected_values), read_number, numeric(1))
          valid <- all(is.finite(values))
          correct <- valid && all(abs(values - expected_values) <= 0.0000001)
          assign("results_3_4_6", list(valid = valid, values = values), envir = globalenv())
          correct
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("results_3_4_6", envir = globalenv())
          values <- results$values
          if (isTRUE(generated == expected)) {
            message <- paste(
              "**Bevestiging:** je hebt vanuit de korte reeks het gemiddelde, de getekende afwijking en het kwadraat correct berekend.",
              "**Denkregel:** gemiddelde = som / aantal; afwijking = x − gemiddelde; kwadrateer daarna de volledige afwijking.",
              "**Transferstap:** gebruik dezelfde drie stappen om de bijdrage van een andere waarneming aan de spreiding te bepalen.",
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
              if (abs(values[["afwijking_20"]] - 10) < 0.0001) {
                likely <- "Je hebt de absolute afstand genomen of de aftrekking omgekeerd."
                why <- "Twintig ligt onder het gemiddelde en heeft daarom een negatieve getekende afwijking."
                next_step <- "Bereken 20 min het gemiddelde en behoud het minteken."
              } else if (values[["gekwadrateerde_afwijking_20"]] < 0) {
                likely <- "Je hebt het minteken na het kwadrateren behouden."
                why <- "Een gekwadrateerde afwijking kan niet negatief zijn."
                next_step <- "Plaats de volledige afwijking tussen haakjes en vermenigvuldig haar met zichzelf."
              } else if (abs(values[["gekwadrateerde_afwijking_20"]] - 10) < 0.0001) {
                likely <- "Je hebt de grootte van de afwijking gekopieerd zonder te kwadrateren."
                why <- "De bijdrage aan de som van kwadraten gebruikt afwijking maal afwijking."
                next_step <- "Vermenigvuldig de afwijking met zichzelf."
              } else if (abs(values[["gemiddelde"]] - 30) < 0.0001) {
                likely <- "Het gemiddelde klopt, maar een vervolgstap gebruikt een verkeerd teken of een verkeerde bewerking."
                why <- "Beide vervolgwaarden moeten rechtstreeks uit 20 − gemiddelde volgen."
                next_step <- "Bereken eerst de getekende afwijking en kwadrateer die pas daarna."
              }
            }
            message <- paste(
              paste0("**Waarschijnlijke redenering:** ", likely),
              paste0("**Waarom dit niet klopt:** ", why),
              "**Denkregel:** gemiddelde = som / aantal; afwijking = x − gemiddelde; kwadrateer daarna de volledige afwijking.",
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
