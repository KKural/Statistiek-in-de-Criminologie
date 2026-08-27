context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          expected_values <- c(
            cumulatieve_frequentie_neutraal = 20,
            relatieve_frequentie_tevreden = 0.3,
            cumulatieve_relatieve_frequentie_neutraal = 0.65,
            samenvattingspaar_ordinaal = 2
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
          assign("results_3_2_1_combined", list(values = values, expected = expected_values, valid = valid, correct = correct), envir = globalenv())
          all(correct)
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("results_3_2_1_combined", envir = globalenv())
          field_titles <- c(
            cumulatieve_frequentie_neutraal = "onderdeel 1 (cumulatieve absolute frequentie)",
            relatieve_frequentie_tevreden = "onderdeel 2 (relatieve frequentie)",
            cumulatieve_relatieve_frequentie_neutraal = "onderdeel 3 (cumulatieve relatieve frequentie)",
            samenvattingspaar_ordinaal = "onderdeel 4 (ordinale samenvattingsmaten)"
          )
          field_rules <- c(
            cumulatieve_frequentie_neutraal = "Cumulatief tot en met neutraal betekent de frequenties 5, 8 en 7 optellen.",
            relatieve_frequentie_tevreden = "Een relatieve frequentie is de categoriefrequentie gedeeld door het groepstotaal: 12 gedeeld door 40.",
            cumulatieve_relatieve_frequentie_neutraal = "Tel de proporties op vanaf de laagste categorie tot en met neutraal.",
            samenvattingspaar_ordinaal = "Bij ordinale data gebruiken mediaan en interkwartielafstand de rangorde zonder gelijke afstanden te veronderstellen."
          )
          if (isTRUE(generated == expected)) {
            message <- paste(
              "**Bevestiging:** alle vier frequentie- en maatkeuzes zijn correct.",
              "**Denkregel:** let op het verschil tussen absoluut en relatief en op de woorden tot en met; kies maten die passen bij het meetniveau.",
              "**Transferstap:** maak voor een nieuwe ordinale vijfpuntsschaal één cumulatieve frequentie en motiveer het passende centrum-spreidingspaar.",
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
