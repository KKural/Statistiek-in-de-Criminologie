context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          expected_values <- c(
            meetniveau_aantal_inbraken = 4,
            meetniveau_percentage_onveilig = 4,
            type_politiedichtheid_en_diefstallen = 1
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
            "results_2_9_combined",
            list(values = values, expected = expected_values, valid = valid, correct = correct),
            envir = globalenv()
          )
          all(correct)
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("results_2_9_combined", envir = globalenv())
          field_titles <- c(
            meetniveau_aantal_inbraken = "onderdeel 1 (aantal inbraken)",
            meetniveau_percentage_onveilig = "onderdeel 2 (percentage onveiligheid)",
            type_politiedichtheid_en_diefstallen = "onderdeel 3 (politiedichtheid en diefstallen)"
          )
          field_rules <- c(
            meetniveau_aantal_inbraken = "Een telling heeft gelijke afstanden en nul betekent geen gebeurtenissen; daarom is het meetniveau ratio.",
            meetniveau_percentage_onveilig = "Het percentage is numeriek, heeft gelijke afstanden en een betekenisvol nulpunt; daarom is het meetniveau ratio.",
            type_politiedichtheid_en_diefstallen = "Beide variabelen zijn numerieke aantallen per vaste populatie-eenheid en dus kwantitatief."
          )
          if (isTRUE(generated == expected)) {
            message <- paste(
              "**Bevestiging:** de drie kwantitatieve variabelen en hun meeteigenschappen zijn correct geclassificeerd.",
              "**Denkregel:** beoordeel de waarden die de variabele kan aannemen, inclusief de betekenis van nul, en niet alleen het onderwerp van de variabele.",
              "**Transferstap:** vergelijk een delictcategorie, een ernstscore en een aantal delicten per 1.000 inwoners op dezelfde kenmerken.",
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
