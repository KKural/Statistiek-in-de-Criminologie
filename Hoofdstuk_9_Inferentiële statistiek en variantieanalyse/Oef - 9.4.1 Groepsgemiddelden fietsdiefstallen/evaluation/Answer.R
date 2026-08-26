# Eén zelfstandige testcase met gerichte feedback per veld.
context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          expected <- c(
            gemiddelde_groot = 3190,
            gemiddelde_middel = 1580,
            gemiddelde_ruraal = 484,
            grand_mean = 1751.33
          )
          tolerance <- c(
            gemiddelde_groot = 0,
            gemiddelde_middel = 0,
            gemiddelde_ruraal = 0,
            grand_mean = 0.0050001
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
            raw <- get(field, envir = env, inherits = FALSE)
            value <- parse_one(raw)
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
          assign("split_results_9_4_1", results, envir = globalenv())
          all(vapply(results, function(item) isTRUE(item$ok), logical(1)))
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("split_results_9_4_1", envir = globalenv())
          labels <- c(
            gemiddelde_groot = "gemiddelde grootsteden",
            gemiddelde_middel = "gemiddelde middelgrote steden",
            gemiddelde_ruraal = "gemiddelde rurale gemeenten",
            grand_mean = "grand mean"
          )
          digits <- c(
            gemiddelde_groot = 0,
            gemiddelde_middel = 0,
            gemiddelde_ruraal = 0,
            grand_mean = 2
          )
          diagnoses <- c(
            gemiddelde_groot = "Je hebt mogelijk de som of een andere groepsdeler gebruikt bij het gemiddelde van de grootsteden.",
            gemiddelde_middel = "Je hebt mogelijk waarden uit een andere kolom meegenomen of niet door tien gedeeld.",
            gemiddelde_ruraal = "Je hebt mogelijk een rurale observatie overgeslagen of te vroeg afgerond.",
            grand_mean = "Je hebt mogelijk de drie groepsgemiddelden ongewogen verwerkt of een tussentijds resultaat te vroeg afgerond."
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
              "\n\n**Denkregel:** Een gemiddelde gebruikt alle waarnemingen in de bedoelde groep en de bijbehorende groepsgrootte als deler.",
              "\n\n**Transferstap:** Controleer bij een nieuwe gegroepeerde dataset altijd eerst of de groepen even groot zijn voordat je groepsgemiddelden combineert."
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
              "\n\n**Denkregel:** Een gemiddelde gebruikt alle waarnemingen in de bedoelde groep en de bijbehorende groepsgrootte als deler.",
              "\n\n**Volgende stap:** Schrijf voor het eerste fout gemelde gemiddelde eerst de som en de juiste n op, voer de deling opnieuw uit en rond pas het eindresultaat af.",
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
