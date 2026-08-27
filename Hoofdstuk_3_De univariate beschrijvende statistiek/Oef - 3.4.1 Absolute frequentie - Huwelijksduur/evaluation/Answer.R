context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          expected_values <- c(
            frequentie_60 = 2,
            relatieve_frequentie_120 = 0.33,
            percentage_120 = 33.33,
            cumulatieve_frequentie_90 = 4,
            cumulatief_percentage_90 = 66.67
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
          assign("results_3_4_1_combined", list(values = values, expected = expected_values, valid = valid, correct = correct), envir = globalenv())
          all(correct)
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("results_3_4_1_combined", envir = globalenv())
          field_titles <- c(
            frequentie_60 = "onderdeel 1 (frequentie van 60)",
            relatieve_frequentie_120 = "onderdeel 2 (relatieve frequentie van 120)",
            percentage_120 = "onderdeel 3 (percentage van 120)",
            cumulatieve_frequentie_90 = "onderdeel 4 (cumulatieve frequentie tot 90)",
            cumulatief_percentage_90 = "onderdeel 5 (cumulatief percentage tot 90)"
          )
          field_rules <- c(
            frequentie_60 = "De duur 60 komt tweemaal in de reeks voor.",
            relatieve_frequentie_120 = "De duur 120 komt tweemaal voor bij zes waarnemingen; gebruik de breuk twee zesde.",
            percentage_120 = "Zet de ongeronde relatieve frequentie twee zesde om naar een percentage.",
            cumulatieve_frequentie_90 = "Tot en met 90 omvat de waarden 30, 60, 60 en 90.",
            cumulatief_percentage_90 = "De cumulatieve proportie is vier zesde; vermenigvuldig die ongeronde breuk met 100."
          )
          if (isTRUE(generated == expected)) {
            message <- paste(
              "**Bevestiging:** alle vijf gewone en cumulatieve frequentiematen zijn correct.",
              "**Denkregel:** bepaal eerst welke waarnemingen meetellen, deel daarna door het totaal en vermenigvuldig alleen voor een percentage met 100.",
              "**Transferstap:** bereken dezelfde vijf soorten maten voor de grenswaarde 60 en de categorie 90.",
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
