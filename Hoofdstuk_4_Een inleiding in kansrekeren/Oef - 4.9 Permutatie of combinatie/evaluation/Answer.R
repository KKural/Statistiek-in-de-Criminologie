context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          expected_values <- c(
            telmethode_lotto = 4,
            aantal_multiset_rangschikkingen = 560,
            permutaties_7 = 5040,
            permutaties_10 = 3628800
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
          assign("results_4_9_combined", list(values = values, expected = expected_values, valid = valid, correct = correct), envir = globalenv())
          all(correct)
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("results_4_9_combined", envir = globalenv())
          field_titles <- c(
            telmethode_lotto = "onderdeel 1 (lottoselectie)",
            aantal_multiset_rangschikkingen = "onderdeel 2 (multisetpermutatie)",
            permutaties_7 = "onderdeel 3 (zeven dossiers)",
            permutaties_10 = "onderdeel 4 (tien examenvragen)"
          )
          field_rules <- c(
            telmethode_lotto = "Omdat de volgorde niet telt, gebruik je een combinatie en deel je ook door 6!.",
            aantal_multiset_rangschikkingen = "Begin met 8! en deel door de faculteiten van de aantallen onderling gelijke labels.",
            permutaties_7 = "Voor zeven verschillende objecten waarvan de volledige volgorde telt, gebruik je 7!.",
            permutaties_10 = "Voor tien verschillende objecten waarvan de volledige volgorde telt, gebruik je 10!."
          )
          if (isTRUE(generated == expected)) {
            message <- paste(
              "**Bevestiging:** de telmethode en alle drie aantallen zijn correct.",
              "**Denkregel:** vraag eerst of volgorde telt en controleer daarna of alle objecten verschillend zijn; kies pas dan de formule.",
              "**Transferstap:** bepaal de formule voor vijf gekozen dossiers uit twaalf en voor het rangschikken van de letters A, A, B, C.",
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
