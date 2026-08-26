# Eén zelfstandige testcase met gerichte feedback per veld.
context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          expected <- c(
            afhankelijke_variabele = 3,
            gemiddelde_x1 = 3.00,
            gemiddelde_x2 = 7.00,
            gemiddelde_y = 18.00
          )
          tolerance <- c(
            afhankelijke_variabele = 0,
            gemiddelde_x1 = 0.0050001,
            gemiddelde_x2 = 0.0050001,
            gemiddelde_y = 0.0050001
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
          choice_fields <- c("afhankelijke_variabele")
          choice_ranges <- list(afhankelijke_variabele = 1:3)
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
          assign("split_results_11_1_1", results, envir = globalenv())
          all(vapply(results, function(item) isTRUE(item$ok), logical(1)))
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("split_results_11_1_1", envir = globalenv())
          labels <- c(
            afhankelijke_variabele = "afhankelijke variabele",
            gemiddelde_x1 = "gemiddelde X1",
            gemiddelde_x2 = "gemiddelde X2",
            gemiddelde_y = "gemiddelde Y"
          )
          digits <- c(
            afhankelijke_variabele = 0,
            gemiddelde_x1 = 2,
            gemiddelde_x2 = 2,
            gemiddelde_y = 2
          )
          diagnoses <- c(
            afhankelijke_variabele = "Je hebt mogelijk een predictor gekozen omdat die inhoudelijk belangrijk lijkt, in plaats van de te verklaren uitkomst.",
            gemiddelde_x1 = "Je hebt mogelijk de ruwe som ingevoerd of door n − 1 gedeeld.",
            gemiddelde_x2 = "Je hebt mogelijk een waarde uit X1 gebruikt of door de verkeerde groepsgrootte gedeeld.",
            gemiddelde_y = "Je hebt mogelijk een Y-waarneming overgeslagen of te vroeg afgerond."
          )
          choice_fields <- c("afhankelijke_variabele")
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
              "\n\n**Denkregel:** Bepaal eerst welke variabele wordt verklaard; gemiddelden gebruiken daarna alle vijf waarden en n = 5.",
              "\n\n**Transferstap:** Label in een nieuw regressieprobleem eerst Y, X1 en X2 voordat je berekeningen of interpretaties uitvoert."
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
              "\n\n**Denkregel:** Bepaal eerst welke variabele wordt verklaard; gemiddelden gebruiken daarna alle vijf waarden en n = 5.",
              "\n\n**Volgende stap:** Markeer in de onderzoeksvraag de uitkomst en schrijf voor het eerste fout gemelde gemiddelde de som en deler expliciet uit.",
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
