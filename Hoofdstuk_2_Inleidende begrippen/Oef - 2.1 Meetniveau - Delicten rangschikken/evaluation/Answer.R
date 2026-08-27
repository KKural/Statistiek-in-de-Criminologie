context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          expected_values <- c(
            meetniveau_ernst_delict = 2,
            meetniveau_empathieschaal = 2,
            meetniveau_nationaliteit = 1,
            meetniveau_motivatieschaal = 2,
            meetniveau_aantal_diefstallen = 4
          )
          read_number <- function(name) {
            if (!exists(name, envir = env)) return(NA_real_)
            value <- suppressWarnings(as.numeric(get(name, envir = env)))
            if (length(value) != 1L || !is.finite(value)) return(NA_real_)
            value
          }
          values <- vapply(names(expected_values), read_number, numeric(1))
          valid <- is.finite(values)
          correct <- valid & abs(values - expected_values) <= 0.0005
          assign(
            "results_2_1_combined",
            list(values = values, expected = expected_values, valid = valid, correct = correct),
            envir = globalenv()
          )
          all(correct)
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("results_2_1_combined", envir = globalenv())
          field_titles <- c(
            meetniveau_ernst_delict = "onderdeel 1 (ernst van delicten)",
            meetniveau_empathieschaal = "onderdeel 2 (empathieschaal)",
            meetniveau_nationaliteit = "onderdeel 3 (nationaliteit)",
            meetniveau_motivatieschaal = "onderdeel 4 (motivatieschaal)",
            meetniveau_aantal_diefstallen = "onderdeel 5 (aantal diefstallen)"
          )
          field_rules <- c(
            meetniveau_ernst_delict = "De categorieën hebben een rangorde, maar de afstanden in ernst zijn niet meetbaar; dit is ordinaal.",
            meetniveau_empathieschaal = "De antwoordcategorieën zijn geordend, maar gelijke betekenisafstanden zijn niet gegarandeerd; dit is ordinaal.",
            meetniveau_nationaliteit = "Nationaliteiten zijn categorieën zonder natuurlijke rangorde; dit is nominaal.",
            meetniveau_motivatieschaal = "Cijfers op een beoordelingsschaal bewijzen geen gelijke afstanden; de geordende antwoorden zijn ordinaal.",
            meetniveau_aantal_diefstallen = "Een telling heeft gelijke afstanden en een werkelijk nulpunt; dit is ratio."
          )
          if (isTRUE(generated == expected)) {
            message <- paste(
              "**Bevestiging:** alle vijf meetniveaus zijn correct bepaald.",
              "**Denkregel:** controleer achtereenvolgens of er categorieën, rangorde, gelijke afstanden en een betekenisvol nulpunt zijn.",
              "**Transferstap:** classificeer op dezelfde manier type sanctie, veiligheidsbeleving en detentieduur.",
              sep = "\n\n"
            )
          } else {
            missing_fields <- names(results$expected)[!results$valid]
            wrong_fields <- names(results$expected)[results$valid & !results$correct]
            field <- if (length(missing_fields) > 0L) missing_fields[[1L]] else wrong_fields[[1L]]
            if (field %in% missing_fields) {
              likely <- paste0("Bij ", field_titles[[field]], " staat nog geen geldig antwoord.")
              why <- "Een leeg of niet-numeriek veld kan niet inhoudelijk worden beoordeeld."
              next_step <- paste0("Vul bij ", field_titles[[field]], " één aangeboden optienummer in.")
            } else {
              likely <- paste0("Bij ", field_titles[[field]], " koos je optie ", format(results$values[[field]], trim = TRUE), ".")
              why <- field_rules[[field]]
              next_step <- paste0("Controleer bij ", field_titles[[field]], " welk kenmerk de classificatie bepaalt.")
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
