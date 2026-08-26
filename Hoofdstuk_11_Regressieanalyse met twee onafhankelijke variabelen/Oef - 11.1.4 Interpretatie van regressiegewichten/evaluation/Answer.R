# Eén zelfstandige testcase met gerichte feedback per veld.
context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          expected <- c(
            richting_b1 = 2,
            sterkste_predictor = 1
          )
          tolerance <- c(
            richting_b1 = 0,
            sterkste_predictor = 0
          )
          parse_one <- function(value) {
            if (length(value) != 1L) return(NA_real_)
            if (is.character(value)) {
              value <- trimws(value)
              if (!nzchar(value)) return(NA_real_)
              if (grepl("^[A-Da-d]$", value)) {
                return(match(toupper(value), c("A", "B", "C", "D")))
              }
              value <- gsub(",", ".", value, fixed = TRUE)
              value <- gsub("%", "", value, fixed = TRUE)
            }
            suppressWarnings(as.numeric(value))
          }
          choice_fields <- c("richting_b1", "sterkste_predictor")
          choice_ranges <- list(richting_b1 = 1:2, sterkste_predictor = 1:2)
          results <- lapply(names(expected), function(field) {
            if (!exists(field, envir = env, inherits = FALSE)) {
              return(list(ok = FALSE, reason = "missing", value = NA_real_,
                          expected = expected[[field]]))
            }
            value <- parse_one(get(field, envir = env, inherits = FALSE))
            if (is.na(value) || !is.finite(value)) {
              return(list(ok = FALSE, reason = "missing", value = value,
                          expected = expected[[field]]))
            }
            if (field %in% choice_fields && !(value %in% choice_ranges[[field]])) {
              return(list(ok = FALSE, reason = "invalid_choice", value = value,
                          expected = expected[[field]]))
            }
            ok <- abs(value - expected[[field]]) <= tolerance[[field]]
            list(ok = isTRUE(ok), reason = if (ok) "ok" else "wrong",
                 value = value, expected = expected[[field]])
          })
          names(results) <- names(expected)
          assign("split_results_11_1_4", results, envir = globalenv())
          all(vapply(results, function(item) isTRUE(item$ok), logical(1)))
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("split_results_11_1_4", envir = globalenv())
          labels <- c(
            richting_b1 = "richting van b1",
            sterkste_predictor = "sterkste relatieve predictor"
          )
          digits <- c(
            richting_b1 = 0,
            sterkste_predictor = 0
          )
          diagnoses <- c(
            richting_b1 = "Je hebt mogelijk de grootte van b1 beoordeeld zonder eerst het negatieve teken te lezen.",
            sterkste_predictor = "Je hebt mogelijk de ongestandaardiseerde b-waarden rechtstreeks vergeleken of alleen naar een positief teken gekeken."
          )
          choice_fields <- c("richting_b1", "sterkste_predictor")
          format_expected <- function(field, value) {
            if (field %in% choice_fields) return(sprintf("optie %d", as.integer(value)))
            sprintf(paste0("%.", digits[[field]], "f"), value)
          }
          if (isTRUE(generated)) {
            confirmations <- vapply(names(results), function(field) {
              paste0("- ", labels[[field]], ": **",
                     format_expected(field, results[[field]]$expected), "**")
            }, character(1))
            message <- paste0(
              "✅ **Bevestiging:** alle gevraagde onderdelen zijn correct.\n\n",
              paste(confirmations, collapse = "\n"),
              "\n\n**Denkregel:** Het teken van b geeft de richting; relatieve sterkte vergelijk je via absolute gestandaardiseerde coëfficiënten op dezelfde schaal.",
              "\n\n**Transferstap:** Scheid bij een nieuwe regressietabel steeds drie vragen: richting, grootte in oorspronkelijke eenheden en relatieve gestandaardiseerde sterkte."
            )
          } else {
            failed <- names(results)[!vapply(results, function(item) isTRUE(item$ok), logical(1))]
            first <- failed[[1L]]
            item <- results[[first]]
            likely <- if (identical(item$reason, "missing")) {
              paste0("Voor ", labels[[first]], " is geen geldige eindige enkelvoudige waarde ontvangen; het veld kan ontbreken, NA bevatten of een ongeldige invoer hebben.")
            } else if (identical(item$reason, "invalid_choice")) {
              paste0("Je invoer bij ", labels[[first]], " valt buiten de antwoordopties die in de opdracht zijn vermeld.")
            } else diagnoses[[first]]
            why <- if (identical(item$reason, "missing")) {
              "Zonder een eindige invoer kan deze berekeningsstap niet worden beoordeeld."
            } else if (identical(item$reason, "invalid_choice")) {
              "De beoordelaar verwacht precies één van de vermelde optienummers."
            } else {
              paste0("De ingevoerde waarde past niet bij ", tolower(labels[[first]]),
                     " onder de opgegeven reken- en afrondingsafspraken.")
            }
            message <- paste0(
              "❌ **Waarschijnlijke redenering:** ", likely,
              "\n\n**Waarom dit niet klopt:** ", why,
              "\n\n**Denkregel:** Het teken van b geeft de richting; relatieve sterkte vergelijk je via absolute gestandaardiseerde coëfficiënten op dezelfde schaal.",
              "\n\n**Volgende stap:** Bereken voor beide predictors het gestandaardiseerde effect met de weergegeven b- en SD-waarden en vergelijk daarna de absolute waarden.",
              if (length(failed) > 1L) paste0(
                "\n\nControleer daarna ook: ",
                paste(vapply(failed[-1L], function(field) labels[[field]], character(1)),
                      collapse = ", "), "."
              ) else ""
            )
          }
          get_reporter()$add_message(message, type = "markdown")
          generated == expected
        }
      )
    }
  )
})
