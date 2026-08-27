context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          expected_values <- c(kwadraat_20 = 400, kwadraat_100 = 3600, grootste_bijdrage = 2)
          read_number <- function(name) {
            if (!exists(name, envir = env)) return(NA_real_)
            value <- suppressWarnings(as.numeric(get(name, envir = env)))
            if (length(value) != 1L || !is.finite(value)) return(NA_real_)
            value
          }
          values <- vapply(names(expected_values), read_number, numeric(1))
          valid <- all(is.finite(values))
          correct <- valid && all(abs(values - expected_values) <= 0.0000001)
          assign("results_3_4_7", list(valid = valid, values = values), envir = globalenv())
          correct
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("results_3_4_7", envir = globalenv())
          values <- results$values
          if (isTRUE(generated == expected)) {
            message <- paste(
              "**Bevestiging:** je ziet in de kwadraten dat de verst verwijderde waarde het sterkst bijdraagt aan de spreiding.",
              "**Denkregel:** bijdrage aan de som van kwadraten = (waarneming − gemiddelde)^2; een grotere afstand groeit kwadratisch.",
              "**Transferstap:** gebruik de afstand tot het gemiddelde om te voorspellen welke uitbijter de variantie domineert.",
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
              if (abs(values[["kwadraat_20"]] - 20) < 0.0001 || abs(values[["kwadraat_100"]] - 100) < 0.0001) {
                likely <- "Je hebt een waarneming overgenomen in plaats van haar afwijking te kwadrateren."
                why <- "De bijdrage wordt berekend vanuit de afstand tot het gegeven gemiddelde, niet vanuit de ruwe waarde."
                next_step <- "Trek eerst 40 af van elke waarneming en kwadrateer daarna."
              } else if (values[["kwadraat_20"]] < 0 || values[["kwadraat_100"]] < 0) {
                likely <- "Je hebt bij een kwadraat een negatief teken behouden."
                why <- "Beide gekwadrateerde afwijkingen moeten niet-negatief zijn."
                next_step <- "Kwadrateer telkens de volledige afwijking tussen haakjes."
              } else if (values[["grootste_bijdrage"]] == 1) {
                likely <- "Je hebt de laagste waarneming gekozen in plaats van de grootste afstand tot het gemiddelde."
                why <- "Niet hoog of laag op zichzelf, maar de absolute afstand tot 40 bepaalt de bijdrage."
                next_step <- "Vergelijk de twee berekende kwadraten en kies het huwelijk met het grootste kwadraat."
              } else if (values[["grootste_bijdrage"]] < 1 || values[["grootste_bijdrage"]] > 2) {
                likely <- "Je keuze verwijst niet naar huwelijk A of B."
                why <- "Alleen optie 1 of 2 is geldig."
                next_step <- "Kies het nummer van het huwelijk met het grootste berekende kwadraat."
              }
            }
            message <- paste(
              paste0("**Waarschijnlijke redenering:** ", likely),
              paste0("**Waarom dit niet klopt:** ", why),
              "**Denkregel:** bijdrage aan de som van kwadraten = (waarneming − gemiddelde)^2; een grotere afstand groeit kwadratisch.",
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
