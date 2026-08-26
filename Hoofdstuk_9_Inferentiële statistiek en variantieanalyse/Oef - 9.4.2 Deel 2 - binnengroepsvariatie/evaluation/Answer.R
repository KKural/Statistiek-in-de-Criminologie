# Eén zelfstandige testcase met gerichte feedback per veld.
context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          expected <- c(
            SS_within_groot = 1514000,
            SS_within_middel = 321000,
            SS_within_ruraal = 52040,
            SS_within = 1887040,
            df_within = 27,
            MS_within = 69890.37
          )
          tolerance <- c(
            SS_within_groot = 0,
            SS_within_middel = 0,
            SS_within_ruraal = 0,
            SS_within = 0,
            df_within = 0,
            MS_within = 0.0050001
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
          assign("split_results_9_4_2", results, envir = globalenv())
          all(vapply(results, function(item) isTRUE(item$ok), logical(1)))
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("split_results_9_4_2", envir = globalenv())
          labels <- c(
            SS_within_groot = "SS within grootsteden",
            SS_within_middel = "SS within middelgrote steden",
            SS_within_ruraal = "SS within rurale gemeenten",
            SS_within = "totale SS within",
            df_within = "vrijheidsgraden within",
            MS_within = "MS within"
          )
          digits <- c(
            SS_within_groot = 0,
            SS_within_middel = 0,
            SS_within_ruraal = 0,
            SS_within = 0,
            df_within = 0,
            MS_within = 2
          )
          diagnoses <- c(
            SS_within_groot = "Je hebt mogelijk een variantie gerapporteerd in plaats van de onverdeelde som van kwadraten.",
            SS_within_middel = "Je hebt mogelijk rond het grand mean gecentreerd in plaats van binnen de middelgrote groep.",
            SS_within_ruraal = "Je hebt mogelijk gewone afwijkingen opgeteld in plaats van gekwadrateerde afwijkingen.",
            SS_within = "Je hebt mogelijk niet precies de drie groepsspecifieke sommen samengevoegd.",
            df_within = "Je hebt mogelijk de vrijheidsgraden tussen groepen gebruikt of de interceptcorrectie vergeten.",
            MS_within = "Je hebt mogelijk door een onjuiste vrijheidsgraad gedeeld of vóór de deling afgerond."
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
              "\n\n**Denkregel:** Binnenvariantie centreert elke observatie rond haar eigen groepsgemiddelde; SS blijft onverdeeld en MS gebruikt de bijbehorende vrijheidsgraden.",
              "\n\n**Transferstap:** Gebruik bij een volgende ANOVA een apart controleschema voor SS, df en MS zodat een variantie niet per ongeluk als somkwadraat wordt ingevoerd."
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
              "\n\n**Denkregel:** Binnenvariantie centreert elke observatie rond haar eigen groepsgemiddelde; SS blijft onverdeeld en MS gebruikt de bijbehorende vrijheidsgraden.",
              "\n\n**Volgende stap:** Herbereken alleen het eerste fout gemelde veld en controleer of je centreerpunt, kwadratering en eventuele deler bij die grootheid horen.",
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
