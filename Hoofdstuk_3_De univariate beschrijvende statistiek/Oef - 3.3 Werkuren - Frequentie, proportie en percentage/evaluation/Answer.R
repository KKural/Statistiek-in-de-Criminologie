context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          expected_values <- c(
            frequentie_32 = 3,
            proportie_32 = 0.375,
            percentage_32 = 37.5
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
          assign("results_3_3_1_combined", list(values = values, expected = expected_values, valid = valid, correct = correct), envir = globalenv())
          all(correct)
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("results_3_3_1_combined", envir = globalenv())
          field_titles <- c(
            frequentie_32 = "onderdeel 1 (absolute frequentie)",
            proportie_32 = "onderdeel 2 (proportie)",
            percentage_32 = "onderdeel 3 (percentage)"
          )
          field_rules <- c(
            frequentie_32 = "Tel alleen de waarden die exact gelijk zijn aan 32.",
            proportie_32 = "De proportie is de absolute frequentie gedeeld door alle acht waarnemingen.",
            percentage_32 = "Het percentage is de proportie maal 100 en wordt zonder procentteken ingevuld."
          )
          if (isTRUE(generated == expected)) {
            message <- paste(
              "**Bevestiging:** de absolute frequentie, proportie en het percentage voor 32 uur zijn correct.",
              "**Denkregel:** ga steeds in deze volgorde: tellen, delen door het totaal, vermenigvuldigen met 100.",
              "**Transferstap:** zet de frequentie van 24 uur uit dezelfde reeks om naar een proportie en percentage.",
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
