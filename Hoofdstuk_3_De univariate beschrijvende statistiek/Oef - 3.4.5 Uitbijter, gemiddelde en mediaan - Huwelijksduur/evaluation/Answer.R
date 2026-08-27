context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          read_number <- function(name) {
            if (!exists(name, envir = env)) return(NA_real_)
            value <- suppressWarnings(as.numeric(get(name, envir = env)))
            if (length(value) != 1L || !is.finite(value)) return(NA_real_)
            value
          }
          read_text <- function(name) {
            if (!exists(name, envir = env)) return("")
            value <- as.character(get(name, envir = env))
            if (length(value) != 1L) return("")
            tolower(trimws(value))
          }
          values <- c(gemiddelde = read_number("gemiddelde"), mediaan = read_number("mediaan"))
          maat <- read_text("beste_centraliteitsmaat")
          valid <- all(is.finite(values)) && nzchar(maat)
          correct <- valid && abs(values[["gemiddelde"]] - 120) <= 0.0001 &&
            abs(values[["mediaan"]] - 50) <= 0.0001 && identical(maat, "mediaan")
          assign(
            "results_3_4_5",
            list(valid = valid, values = values, maat = maat),
            envir = globalenv()
          )
          correct
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("results_3_4_5", envir = globalenv())
          if (isTRUE(generated == expected)) {
            message <- paste(
              "**Bevestiging:** je berekeningen en keuze laten correct zien dat de uitbijter het gemiddelde omhoog trekt terwijl de mediaan robuust blijft.",
              "**Denkregel:** bij een sterke uitbijter beschrijft de mediaan de typische centrale positie vaak beter dan het gemiddelde.",
              "**Transferstap:** vergelijk bij een nieuwe scheve reeks altijd gemiddelde en mediaan voordat je een centraliteitsmaat kiest.",
              sep = "\n\n"
            )
          } else {
            if (!results$valid) {
              likely <- "Minstens één getal ontbreekt of de gekozen maat is niet als tekst tussen aanhalingstekens ingevuld."
              why <- "De oefening verwacht twee eindige getallen en exact het woord gemiddelde of mediaan."
              next_step <- "Vul beide berekeningen in en typ de gekozen maat tussen dubbele aanhalingstekens."
            } else if (abs(results$values[["gemiddelde"]] - 50) <= 0.0001 &&
                       abs(results$values[["mediaan"]] - 120) <= 0.0001) {
              likely <- "Je hebt gemiddelde en mediaan verwisseld."
              why <- "Het gemiddelde gebruikt alle vijf waarden; de mediaan is de middelste geordende waarde."
              next_step <- "Bereken som gedeeld door vijf voor het gemiddelde en neem positie drie voor de mediaan."
            } else if (identical(results$maat, "gemiddelde")) {
              likely <- "Je hebt het gemiddelde gekozen omdat het alle waarden gebruikt, zonder de sterke uitbijter mee te wegen in je keuze."
              why <- "De extreme duur trekt het gemiddelde ver weg van de vier typische waarden."
              next_step <- "Vergelijk de twee berekende maten met de vier waarden tussen 30 en 60 dagen."
            } else if (!results$maat %in% c("gemiddelde", "mediaan")) {
              likely <- "Je hebt een andere term of spelling gebruikt dan één van de twee gevraagde maten."
              why <- "De invoer wordt beoordeeld als exact gemiddelde of mediaan."
              next_step <- "Kies één van die twee woorden en plaats het tussen dubbele aanhalingstekens."
            } else {
              likely <- "Minstens één centraliteitsmaat is met een verkeerde rekenregel bepaald."
              why <- "Het gemiddelde gebruikt de som van alle waarden; de mediaan gebruikt de middelste positie na ordening."
              next_step <- "Bereken beide maten afzonderlijk en kies pas daarna de meest representatieve."
            }
            message <- paste(
              paste0("**Waarschijnlijke redenering:** ", likely),
              paste0("**Waarom dit niet klopt:** ", why),
              "**Denkregel:** een uitbijter beïnvloedt het gemiddelde sterk, maar de mediaan veel minder.",
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
