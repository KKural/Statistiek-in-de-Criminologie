context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          expected_values <- c(
            meetniveau_leeftijd = 4,
            nominale_variabele = 1,
            populatie_steekproef = 4,
            doel_beschrijvende_statistiek = 1,
            causale_beperking = 3
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
            "results_1_1_combined",
            list(values = values, expected = expected_values, valid = valid, correct = correct),
            envir = globalenv()
          )
          all(correct)
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("results_1_1_combined", envir = globalenv())
          field_titles <- c(
            meetniveau_leeftijd = "onderdeel 1 (meetniveau van leeftijd)",
            nominale_variabele = "onderdeel 2 (nominale variabele)",
            populatie_steekproef = "onderdeel 3 (populatie en steekproef)",
            doel_beschrijvende_statistiek = "onderdeel 4 (beschrijvende statistiek)",
            causale_beperking = "onderdeel 5 (correlatie en causaliteit)"
          )
          field_rules <- c(
            meetniveau_leeftijd = "Exacte leeftijd heeft gelijke afstanden en een betekenisvol nulpunt; daarom is de ratioschaal passend.",
            nominale_variabele = "Een nominale variabele heeft categorieën zonder natuurlijke rangorde; typen misdrijven voldoen daaraan.",
            populatie_steekproef = "De populatie is de volledige doelgroep en de steekproef is het werkelijk onderzochte deel.",
            doel_beschrijvende_statistiek = "Beschrijvende statistiek blijft bij het ordenen en samenvatten van de geobserveerde gegevens.",
            causale_beperking = "Een waargenomen samenhang sluit confounding en omgekeerde causaliteit niet uit."
          )
          if (isTRUE(generated == expected)) {
            message <- paste(
              "**Bevestiging:** alle vijf statistische basisbegrippen zijn correct geclassificeerd.",
              "**Denkregel:** controleer telkens welk kenmerk doorslaggevend is: schaal, rangorde, deel-geheelrelatie, doel van de analyse of logische reikwijdte van de conclusie.",
              "**Transferstap:** classificeer in een nieuw criminaliteitsonderzoek één variabele, de doelgroep, de steekproef en de toegestane conclusie.",
              sep = "\n\n"
            )
          } else {
            missing_fields <- names(results$expected)[!results$valid]
            wrong_fields <- names(results$expected)[results$valid & !results$correct]
            field <- if (length(missing_fields) > 0L) missing_fields[[1L]] else wrong_fields[[1L]]
            if (field %in% missing_fields) {
              likely <- paste0("Bij ", field_titles[[field]], " staat nog geen geldig optienummer.")
              why <- "Een leeg of niet-numeriek veld kan niet inhoudelijk worden beoordeeld."
              next_step <- paste0("Lees onderdeel ", field_titles[[field]], " opnieuw en vul één aangeboden optienummer in.")
            } else {
              likely <- paste0("Bij ", field_titles[[field]], " koos je optie ", format(results$values[[field]], trim = TRUE), ".")
              why <- field_rules[[field]]
              next_step <- paste0("Vergelijk de kenmerken in ", field_titles[[field]], " opnieuw met alle antwoordopties.")
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
