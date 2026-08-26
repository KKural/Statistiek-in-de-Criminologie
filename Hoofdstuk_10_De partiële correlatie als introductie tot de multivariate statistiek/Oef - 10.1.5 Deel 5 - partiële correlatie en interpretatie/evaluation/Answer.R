# Eén zelfstandige testcase met gerichte feedback per veld.
context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          expected <- c(
            r_XY_teller = 0.2330,
            r_XY_noemer = 0.7670,
            r_XY_Z = 0.3038,
            conclusie_type = 2
          )
          tolerance <- c(
            r_XY_teller = 0.0000501,
            r_XY_noemer = 0.0000501,
            r_XY_Z = 0.0000501,
            conclusie_type = 0
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

          choice_fields <- c("conclusie_type")
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
          assign("split_results_10_1_5", results, envir = globalenv())
          all(vapply(results, function(item) isTRUE(item$ok), logical(1)))
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("split_results_10_1_5", envir = globalenv())
          labels <- c(
            r_XY_teller = "teller partiële correlatie",
            r_XY_noemer = "noemer partiële correlatie",
            r_XY_Z = "partiële correlatie XY gecontroleerd voor Z",
            conclusie_type = "type verandering na controle"
          )
          digits <- c(
            r_XY_teller = 4,
            r_XY_noemer = 4,
            r_XY_Z = 4,
            conclusie_type = 0
          )
          diagnoses <- c(
            r_XY_teller = "Je hebt mogelijk een productterm opgeteld in plaats van afgetrokken of met een andere correlatie gewerkt.",
            r_XY_noemer = "Je hebt mogelijk slechts één correctiefactor gebruikt of de wortel vergeten.",
            r_XY_Z = "Je hebt mogelijk ongeronde componenten gebruikt of teller en noemer omgekeerd.",
            conclusie_type = "Je hebt mogelijk alleen naar het teken gekeken in plaats van de bivariate en partiële sterkte te vergelijken."
          )
          choice_fields <- c("conclusie_type")

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
              "\n\n**Denkregel:** Beoordeel het controle-effect met ongeronde tussenresultaten en rond alleen de gevraagde eindwaarden af.",
              "\n\n**Transferstap:** Vergelijk bij een nieuwe controlevariabele altijd r XY vóór en na controle en benoem richting én grootte van de verandering."
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
              "\n\n**Denkregel:** Beoordeel het controle-effect met ongeronde tussenresultaten en rond alleen de gevraagde eindwaarden af.",
              "\n\n**Volgende stap:** Herbereken alleen het eerste fout gemelde onderdeel met de drie weergegeven correlaties en vergelijk daarna de bivariate en partiële sterkte.",
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
