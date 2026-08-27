context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          expected_values <- c(
            som_werkuren = 72,
            gemiddelde_werkuren = 24,
            keuze_centraliteitsmaat = 3,
            keuze_spreidingsmaat = 3,
            reden_maatkeuze = 3
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
          assign("results_3_3_3_combined", list(values = values, expected = expected_values, valid = valid, correct = correct), envir = globalenv())
          all(correct)
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("results_3_3_3_combined", envir = globalenv())
          field_titles <- c(
            som_werkuren = "onderdeel 1 (som)",
            gemiddelde_werkuren = "onderdeel 2 (gemiddelde)",
            keuze_centraliteitsmaat = "onderdeel 3 (centrummaat)",
            keuze_spreidingsmaat = "onderdeel 4 (spreidingsmaat)",
            reden_maatkeuze = "onderdeel 5 (reden)"
          )
          field_rules <- c(
            som_werkuren = "Tel 20, 24 en 28 op voordat je door het aantal waarnemingen deelt.",
            gemiddelde_werkuren = "Het gemiddelde is de som van 72 gedeeld door drie.",
            keuze_centraliteitsmaat = "Bij symmetrische ratiodata zonder uitbijter is het gemiddelde een passende centrummaat.",
            keuze_spreidingsmaat = "De standaardafwijking vormt met het gemiddelde een samenhangend paar dat alle afstanden gebruikt.",
            reden_maatkeuze = "Gemiddelde en standaardafwijking benutten alle numerieke waarden en afstanden in de reeks."
          )
          if (isTRUE(generated == expected)) {
            message <- paste(
              "**Bevestiging:** de rekenstappen en alle drie keuzes voor de samenvatting zijn correct.",
              "**Denkregel:** bereken eerst het centrum en beoordeel daarna meetniveau, verdelingsvorm en uitbijters voordat je het maatpaar kiest.",
              "**Transferstap:** voeg een extreme waarde van 100 uur toe en beoordeel welke maatkeuze daardoor verandert.",
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
