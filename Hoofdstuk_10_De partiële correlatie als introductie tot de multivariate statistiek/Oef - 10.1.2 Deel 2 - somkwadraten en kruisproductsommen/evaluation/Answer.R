# Eén zelfstandige testcase met gerichte feedback per veld.
context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          expected <- c(
            SS_X = 28.8571,
            SS_Y = 10.8571,
            SS_Z = 13.7143,
            SCP_XY = 8.1429,
            SCP_XZ = 8.5714,
            SCP_YZ = 6.4286
          )
          tolerance <- c(
            SS_X = 0.0000501,
            SS_Y = 0.0000501,
            SS_Z = 0.0000501,
            SCP_XY = 0.0000501,
            SCP_XZ = 0.0000501,
            SCP_YZ = 0.0000501
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
          assign("split_results_10_1_2", results, envir = globalenv())
          all(vapply(results, function(item) isTRUE(item$ok), logical(1)))
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("split_results_10_1_2", envir = globalenv())
          labels <- c(
            SS_X = "SS X",
            SS_Y = "SS Y",
            SS_Z = "SS Z",
            SCP_XY = "SCP XY",
            SCP_XZ = "SCP XZ",
            SCP_YZ = "SCP YZ"
          )
          digits <- c(
            SS_X = 4,
            SS_Y = 4,
            SS_Z = 4,
            SCP_XY = 4,
            SCP_XZ = 4,
            SCP_YZ = 4
          )
          diagnoses <- c(
            SS_X = "Je hebt mogelijk de afwijkingen niet rond het vastgelegde X-gemiddelde berekend of na het sommeren gedeeld.",
            SS_Y = "Je hebt mogelijk gewone afwijkingen in plaats van gekwadrateerde afwijkingen gesommeerd.",
            SS_Z = "Je hebt mogelijk met het ongeronde gemiddelde gewerkt in plaats van de vastgelegde vierdecimalenwaarde.",
            SCP_XY = "Je hebt mogelijk de tekens van de X- en Y-afwijkingen genegeerd of een covariantie gerapporteerd.",
            SCP_XZ = "Je hebt mogelijk een rijproduct uit de verkeerde kolomcombinatie gebruikt.",
            SCP_YZ = "Je hebt mogelijk vóór het rijproduct afgerond of door n − 1 gedeeld."
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
              "\n\n**Denkregel:** SS sommeert ongeronde gekwadrateerde afwijkingen; SCP sommeert ongeronde getekende kruisproducten en wordt in deze stap nog niet gedeeld.",
              "\n\n**Transferstap:** Gebruik bij nieuwe ruwe data afzonderlijke kolommen voor afwijkingen, kwadraten en kruisproducten om grootheden niet te verwisselen."
            )
          } else {
            failed <- names(results)[!vapply(results, function(item) isTRUE(item$ok), logical(1))]
            first <- failed[[1L]]
            item <- results[[first]]
            likely <- if (identical(item$reason, "missing")) {
              paste0("Voor ", labels[[first]], " is geen geldige eindige enkelvoudige waarde ontvangen; het veld kan ontbreken, NA bevatten of een ongeldige invoer hebben.")
            } else if (identical(item$reason, "invalid_choice")) {
              paste0("Je invoer bij ", labels[[first]], " valt buiten de antwoordopties die in de opdracht zijn vermeld.")
            } else {
              diagnoses[[first]]
            }
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
              "\n\n**Denkregel:** SS sommeert ongeronde gekwadrateerde afwijkingen; SCP sommeert ongeronde getekende kruisproducten en wordt in deze stap nog niet gedeeld.",
              "\n\n**Volgende stap:** Maak voor het eerste fout gemelde veld een rijtabel met de twee benodigde afwijkingskolommen en controleer afronding, teken en sommatie.",
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
