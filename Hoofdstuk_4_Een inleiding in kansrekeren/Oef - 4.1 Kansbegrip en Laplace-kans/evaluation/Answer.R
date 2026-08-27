context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          expected_values <- c(
            basisregel_kans = 2,
            algemene_somregel = 2,
            relatie_gebeurtenissen = 2
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
          assign("results_4_1_combined", list(values = values, expected = expected_values, valid = valid, correct = correct), envir = globalenv())
          all(correct)
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("results_4_1_combined", envir = globalenv())
          field_titles <- c(
            basisregel_kans = "onderdeel 1 (kans en Laplace)",
            algemene_somregel = "onderdeel 2 (somregel met overlap)",
            relatie_gebeurtenissen = "onderdeel 3 (disjunct en onafhankelijk)"
          )
          field_rules <- c(
            basisregel_kans = "Een kans is een aandeel tussen nul en één; de Laplace-formule geldt wanneer de elementaire uitkomsten even waarschijnlijk zijn.",
            algemene_somregel = "Bij mogelijke overlap worden de gezamenlijke uitkomsten eerst dubbel geteld en daarom eenmaal afgetrokken.",
            relatie_gebeurtenissen = "Disjuncte gebeurtenissen met beide een positieve kans kunnen niet onafhankelijk zijn, want hun gezamenlijke kans is nul."
          )
          if (isTRUE(generated == expected)) {
            message <- paste(
              "**Bevestiging:** alle drie fundamentele kansbegrippen en relaties zijn correct gekozen.",
              "**Denkregel:** controleer eerst de grenzen van een kans, daarna eventuele overlap en ten slotte afzonderlijk disjunctie en onafhankelijkheid.",
              "**Transferstap:** teken voor twee nieuwe gebeurtenissen een venndiagram en bepaal welke somregel en onafhankelijkheidscontrole nodig zijn.",
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
