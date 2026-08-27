context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          expected_values <- c(
            functie_centrale_vraag = 4,
            doel_deelvragen = 1,
            eerste_onderzoeksstap = 4,
            belang_negatieve_resultaten = 2,
            kwaliteit_steekproef = 3
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
            "results_1_2_combined",
            list(values = values, expected = expected_values, valid = valid, correct = correct),
            envir = globalenv()
          )
          all(correct)
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("results_1_2_combined", envir = globalenv())
          field_titles <- c(
            functie_centrale_vraag = "onderdeel 1 (centrale onderzoeksvraag)",
            doel_deelvragen = "onderdeel 2 (deelvragen)",
            eerste_onderzoeksstap = "onderdeel 3 (start van onderzoek)",
            belang_negatieve_resultaten = "onderdeel 4 (negatieve resultaten)",
            kwaliteit_steekproef = "onderdeel 5 (steekproefstrategie)"
          )
          field_rules <- c(
            functie_centrale_vraag = "De centrale vraag legt de hoofdfocus vast en bewaakt de samenhang van het volledige onderzoek.",
            doel_deelvragen = "Deelvragen maken de centrale vraag systematisch en hanteerbaar zonder haar te vervangen.",
            eerste_onderzoeksstap = "Een onderzoekbaar probleem ontstaat eerst uit systematische observatie en nieuwsgierige verkenning.",
            belang_negatieve_resultaten = "Selectieve publicatie van positieve uitkomsten veroorzaakt publicatiebias en vertekent het totale bewijs.",
            kwaliteit_steekproef = "Een grote steekproef herstelt geen onderdekking; het steekproefkader moet alle relevante groepen bereiken."
          )
          if (isTRUE(generated == expected)) {
            message <- paste(
              "**Bevestiging:** alle vijf stappen en kwaliteitskeuzes in het onderzoeksproces zijn correct beoordeeld.",
              "**Denkregel:** vraag bij elke stap welke functie zij vervult en welk kwaliteitsprobleem ontstaat als die stap wordt overgeslagen.",
              "**Transferstap:** ontwerp voor één criminologische vraag een centrale vraag, twee deelvragen, een passend steekproefkader en een plan om alle uitkomsten te rapporteren.",
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
