context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          expected_values <- c(
            gemiddelde_werkuren = 24,
            afwijking_20 = -4,
            teken_afwijking_34 = 1
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
          assign("results_3_3_5_combined", list(values = values, expected = expected_values, valid = valid, correct = correct), envir = globalenv())
          all(correct)
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("results_3_3_5_combined", envir = globalenv())
          field_titles <- c(
            gemiddelde_werkuren = "onderdeel 1 (gemiddelde)",
            afwijking_20 = "onderdeel 2 (afwijking van 20)",
            teken_afwijking_34 = "onderdeel 3 (teken van 34 min 30)"
          )
          field_rules <- c(
            gemiddelde_werkuren = "Het gemiddelde van 20, 24 en 28 is de som gedeeld door drie.",
            afwijking_20 = "Gebruik waarneming min gemiddelde; een waarde onder het gemiddelde geeft een negatieve afwijking.",
            teken_afwijking_34 = "Een waarneming boven het gemiddelde heeft een positieve afwijking."
          )
          if (isTRUE(generated == expected)) {
            message <- paste(
              "**Bevestiging:** het gemiddelde, de getekende afwijking en de tekeninterpretatie zijn correct.",
              "**Denkregel:** houd altijd dezelfde volgorde aan: waarneming min gemiddelde; onder is negatief en boven is positief.",
              "**Transferstap:** bereken en interpreteer de afwijking van 28 uur ten opzichte van het gemiddelde 24.",
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
