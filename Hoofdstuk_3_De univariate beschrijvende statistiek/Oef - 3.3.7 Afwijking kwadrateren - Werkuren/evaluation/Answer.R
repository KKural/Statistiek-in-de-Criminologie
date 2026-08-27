context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          expected_values <- c(
            afwijking_26 = -4,
            gekwadrateerde_afwijking_26 = 16,
            reden_kwadrateren = 2
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
          assign("results_3_3_7_combined", list(values = values, expected = expected_values, valid = valid, correct = correct), envir = globalenv())
          all(correct)
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("results_3_3_7_combined", envir = globalenv())
          field_titles <- c(
            afwijking_26 = "onderdeel 1 (getekende afwijking)",
            gekwadrateerde_afwijking_26 = "onderdeel 2 (gekwadrateerde afwijking)",
            reden_kwadrateren = "onderdeel 3 (reden voor kwadrateren)"
          )
          field_rules <- c(
            afwijking_26 = "Gebruik waarneming min gemiddelde: 26 min 30 is negatief.",
            gekwadrateerde_afwijking_26 = "Bij het kwadrateren hoort de volledige negatieve afwijking tussen haakjes; het resultaat is niet negatief.",
            reden_kwadrateren = "Kwadrateren voorkomt dat positieve en negatieve afwijkingen elkaar in de som opheffen."
          )
          if (isTRUE(generated == expected)) {
            message <- paste(
              "**Bevestiging:** de afwijking, het kwadraat en de reden voor kwadrateren zijn correct.",
              "**Denkregel:** bereken eerst de getekende afwijking en kwadrateer daarna de volledige waarde inclusief haar teken.",
              "**Transferstap:** voer dezelfde drie denkstappen uit voor een waarneming van 35 bij een gemiddelde van 30.",
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
