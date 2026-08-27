context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          expected_values <- c(
            kans_inbraak_of_geweld = 0.64,
            kans_geen_van_beide = 0.36,
            kans_met_overlap = 0.8
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
          assign("results_4_4_combined", list(values = values, expected = expected_values, valid = valid, correct = correct), envir = globalenv())
          all(correct)
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("results_4_4_combined", envir = globalenv())
          field_titles <- c(
            kans_inbraak_of_geweld = "onderdeel 1 (disjuncte som)",
            kans_geen_van_beide = "onderdeel 2 (complement)",
            kans_met_overlap = "onderdeel 3 (som met overlap)"
          )
          field_rules <- c(
            kans_inbraak_of_geweld = "Voor disjuncte gebeurtenissen tel je de twee kansen rechtstreeks op.",
            kans_geen_van_beide = "De kans op geen van beide is één min de kans op de vereniging.",
            kans_met_overlap = "Gebruik de algemene somregel en trek de gezamenlijke kans eenmaal af."
          )
          if (isTRUE(generated == expected)) {
            message <- paste(
              "**Bevestiging:** de disjuncte som, het complement en de som met overlap zijn correct.",
              "**Denkregel:** bepaal vóór het rekenen of overlap mogelijk is; bereken het complement pas nadat de vereniging vaststaat.",
              "**Transferstap:** herhaal de drie stappen voor kansen 0.20 en 0.35 met een overlap van 0.05.",
              sep = "\n\n"
            )
          } else {
            missing_fields <- names(results$expected)[!results$valid]
            wrong_fields <- names(results$expected)[results$valid & !results$correct]
            field <- if (length(missing_fields) > 0L) missing_fields[[1L]] else wrong_fields[[1L]]
            if (field %in% missing_fields) {
              likely <- paste0("Bij ", field_titles[[field]], " ontbreekt nog één eindig getal.")
              why <- "Een leeg of niet-numeriek veld kan niet met de gevraagde keuze of berekening worden vergeleken."
              next_step <- paste0("Werk ", field_titles[[field]], " uit en vul alleen het eindantwoord in.")
            } else {
              likely <- paste0("Voor ", field_titles[[field]], " vulde je ", format(results$values[[field]], trim = TRUE), " in.")
              why <- field_rules[[field]]
              next_step <- paste0("Pas de denkregel opnieuw toe op ", field_titles[[field]], ".")
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
