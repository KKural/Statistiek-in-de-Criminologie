context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          expected_values <- c(
            type_vraag_leeftijd_recidive = 3,
            uitkomst_recidive_geslacht = 2,
            opzet_cameratoezicht = 2,
            type_vraag_gemiddelde_leeftijd = 1
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
            "results_2_10_combined",
            list(values = values, expected = expected_values, valid = valid, correct = correct),
            envir = globalenv()
          )
          all(correct)
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("results_2_10_combined", envir = globalenv())
          field_titles <- c(
            type_vraag_leeftijd_recidive = "onderdeel 1 (leeftijd en recidive)",
            uitkomst_recidive_geslacht = "onderdeel 2 (recidive en geslacht)",
            opzet_cameratoezicht = "onderdeel 3 (cameratoezicht)",
            type_vraag_gemiddelde_leeftijd = "onderdeel 4 (gemiddelde leeftijd)"
          )
          field_rules <- c(
            type_vraag_leeftijd_recidive = "De vraag bevat een voorspeller en een uitkomst en vraagt naar voorspelling; dit is bivariaat verklarend.",
            uitkomst_recidive_geslacht = "Recidive is de uitkomst die tussen de geslachtsgroepen wordt vergeleken.",
            opzet_cameratoezicht = "Een interventie met een voor-na-vergelijking maar zonder randomisatie is quasi-experimenteel.",
            type_vraag_gemiddelde_leeftijd = "De vraag vat één variabele samen en onderzoekt geen verschil of relatie; dit is univariaat beschrijvend."
          )
          if (isTRUE(generated == expected)) {
            message <- paste(
              "**Bevestiging:** alle vier onderzoeksvragen, variabelerollen en onderzoeksopzetten zijn correct onderscheiden.",
              "**Denkregel:** tel eerst de variabelen, zoek daarna naar een voorspeller of vergelijking en controleer ten slotte of er interventie en randomisatie zijn.",
              "**Transferstap:** classificeer een nieuwe vraag over politiedichtheid en diefstallen en benoem daarbij voorspeller, uitkomst en onderzoeksopzet.",
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
