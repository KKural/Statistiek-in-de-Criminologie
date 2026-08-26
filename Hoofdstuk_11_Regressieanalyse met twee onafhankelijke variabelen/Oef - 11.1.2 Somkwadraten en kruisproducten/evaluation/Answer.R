# Eén zelfstandige testcase met gerichte feedback per veld.
context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          expected <- c(
            SSx1 = 10,
            SSx2 = 30,
            SSy = 80,
            SSx1x2 = 0,
            SSx1y = -22,
            SSx2y = 30
          )
          tolerance <- c(
            SSx1 = 0,
            SSx2 = 0,
            SSy = 0,
            SSx1x2 = 0,
            SSx1y = 0,
            SSx2y = 0
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
          choice_fields <- character()
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
            if (field %in% choice_fields && !(value %in% 1:4)) {
              return(list(ok = FALSE, reason = "invalid_choice", value = value,
                          expected = expected[[field]]))
            }
            ok <- abs(value - expected[[field]]) <= tolerance[[field]]
            list(ok = isTRUE(ok), reason = if (ok) "ok" else "wrong",
                 value = value, expected = expected[[field]])
          })
          names(results) <- names(expected)
          assign("split_results_11_1_2", results, envir = globalenv())
          all(vapply(results, function(item) isTRUE(item$ok), logical(1)))
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("split_results_11_1_2", envir = globalenv())
          labels <- c(
            SSx1 = "SS X1",
            SSx2 = "SS X2",
            SSy = "SS Y",
            SSx1x2 = "kruisproductsom X1-X2",
            SSx1y = "kruisproductsom X1-Y",
            SSx2y = "kruisproductsom X2-Y"
          )
          digits <- c(
            SSx1 = 0,
            SSx2 = 0,
            SSy = 0,
            SSx1x2 = 0,
            SSx1y = 0,
            SSx2y = 0
          )
          diagnoses <- c(
            SSx1 = "Je hebt mogelijk ruwe kwadraten gebruikt of de somkwadraat al gedeeld tot een variantie.",
            SSx2 = "Je hebt mogelijk rond het verkeerde gemiddelde gecentreerd of een X2-waarde overgeslagen.",
            SSy = "Je hebt mogelijk gewone afwijkingen in plaats van gekwadrateerde afwijkingen gesommeerd.",
            SSx1x2 = "Je hebt mogelijk ongecentreerde producten gebruikt of de tekens van rijproducten genegeerd.",
            SSx1y = "Je hebt mogelijk het negatieve teken van één of meer kruisproducten verloren.",
            SSx2y = "Je hebt mogelijk een covariantie gerapporteerd in plaats van de onverdeelde kruisproductsom."
          )
          choice_fields <- character()
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
              "\n\n**Denkregel:** SS sommeert gekwadrateerde gecentreerde waarden; een kruisproductsom behoudt de tekens van de rijgewijze gecentreerde producten en blijft onverdeeld.",
              "\n\n**Transferstap:** Gebruik bij nieuwe meervoudige regressiedata vaste kolomnamen voor afwijkingen en kruisproducten om combinaties niet te verwisselen."
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
              "\n\n**Denkregel:** SS sommeert gekwadrateerde gecentreerde waarden; een kruisproductsom behoudt de tekens van de rijgewijze gecentreerde producten en blijft onverdeeld.",
              "\n\n**Volgende stap:** Maak voor het eerste fout gemelde veld een kleine afwijkingstabel en controleer per rij het centrum, teken en product vóór je sommeert.",
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
