context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          expected_values <- c(
            mediaan_eerste_reeks = 30,
            gemiddelde_met_uitbijter = 120,
            mediaan_met_uitbijter = 50,
            beste_centraliteitsmaat = 2
          )
          read_number <- function(name) {
            if (!exists(name, envir = env)) return(NA_real_)
            value <- suppressWarnings(as.numeric(get(name, envir = env)))
            if (length(value) != 1L || !is.finite(value)) return(NA_real_)
            value
          }
          values <- vapply(names(expected_values), read_number, numeric(1))
          valid <- is.finite(values)
          correct <- valid & abs(values - expected_values) <= 0.005
          assign("results_3_4_4_combined", list(values = values, expected = expected_values, valid = valid, correct = correct), envir = globalenv())
          all(correct)
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("results_3_4_4_combined", envir = globalenv())
          field_titles <- c(
            mediaan_eerste_reeks = "onderdeel 1 (eerste mediaan)",
            gemiddelde_met_uitbijter = "onderdeel 2 (gemiddelde met uitbijter)",
            mediaan_met_uitbijter = "onderdeel 3 (mediaan met uitbijter)",
            beste_centraliteitsmaat = "onderdeel 4 (beste centraliteitsmaat)"
          )
          field_rules <- c(
            mediaan_eerste_reeks = "Bij vijf geordende waarden is de mediaan de derde waarde.",
            gemiddelde_met_uitbijter = "Het gemiddelde gebruikt alle vijf waarden, inclusief 420, en is de som gedeeld door vijf.",
            mediaan_met_uitbijter = "De mediaan is de derde waarde van de geordende reeks en blijft 50.",
            beste_centraliteitsmaat = "De sterke uitbijter trekt het gemiddelde omhoog; de mediaan blijft dichter bij de vier typische waarden."
          )
          if (isTRUE(generated == expected)) {
            message <- paste(
              "**Bevestiging:** beide medianen, het gemiddelde en de maatkeuze bij de uitbijter zijn correct.",
              "**Denkregel:** bereken gemiddelde en mediaan afzonderlijk en beoordeel daarna hoeveel een extreme waarde elk van beide beïnvloedt.",
              "**Transferstap:** vervang de uitbijter 420 door 70 en beoordeel opnieuw welke centrummaat het meest informatief is.",
              sep = "\n\n"
            )
          } else {
            missing_fields <- names(results$expected)[!results$valid]
            wrong_fields <- names(results$expected)[results$valid & !results$correct]
            field <- if (length(missing_fields) > 0L) missing_fields[[1L]] else wrong_fields[[1L]]
            if (field %in% missing_fields) {
              likely <- paste0("Bij ", field_titles[[field]], " ontbreekt nog één eindig getal.")
              why <- "Een leeg of niet-numeriek veld kan niet met de gevraagde berekening of keuze worden vergeleken."
              next_step <- paste0("Voer de berekening of classificatie voor ", field_titles[[field]], " uit en vul alleen het eindantwoord in.")
            } else {
              likely <- paste0("Voor ", field_titles[[field]], " vulde je ", format(results$values[[field]], trim = TRUE), " in.")
              why <- field_rules[[field]]
              next_step <- paste0("Herbereken of heroverweeg ", field_titles[[field]], " met de genoemde denkregel.")
            }
            message <- paste(
              paste0("**Waarschijnlijke redenering:** ", likely),
              paste0("**Waarom dit niet klopt:** ", why),
              paste0("**Denkregel:** ", field_rules[[field]]),
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
