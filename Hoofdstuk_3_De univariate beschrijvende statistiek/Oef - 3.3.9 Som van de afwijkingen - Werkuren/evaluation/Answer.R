context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          expected_values <- c(
            ontbrekende_afwijking = 2,
            som_afwijkingen = 0,
            steekproefvariantie = 20
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
          assign("results_3_3_9_combined", list(values = values, expected = expected_values, valid = valid, correct = correct), envir = globalenv())
          all(correct)
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("results_3_3_9_combined", envir = globalenv())
          field_titles <- c(
            ontbrekende_afwijking = "onderdeel 1 (ontbrekende afwijking)",
            som_afwijkingen = "onderdeel 2 (som van afwijkingen)",
            steekproefvariantie = "onderdeel 3 (steekproefvariantie)"
          )
          field_rules <- c(
            ontbrekende_afwijking = "De afwijking van 6 ten opzichte van 4 is 6 min 4.",
            som_afwijkingen = "Getekende afwijkingen rond hun eigen rekenkundig gemiddelde tellen op tot nul.",
            steekproefvariantie = "Voor een steekproef deel je SS door n min 1; hier is de noemer vier."
          )
          if (isTRUE(generated == expected)) {
            message <- paste(
              "**Bevestiging:** de ontbrekende afwijking, nul-som en steekproefvariantie zijn correct.",
              "**Denkregel:** houd getekende afwijkingen en gekwadrateerde afwijkingen uit elkaar; alleen voor de steekproefvariantie gebruik je SS en de noemer n min 1.",
              "**Transferstap:** controleer de nul-som voor 3, 5 en 7 en bereken daarna de variantie wanneer SS gelijk is aan 8.",
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
