# Eén zelfstandige testcase met gerichte feedback per veld.
context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          expected <- c(
            SS_between = 37052506.67,
            df_between = 2,
            MS_between = 18526253.33,
            F_ratio = 265.08,
            eta_kwadraat = 0.9515,
            significant_anova = 1
          )
          tolerance <- c(
            SS_between = 0.0050001,
            df_between = 0,
            MS_between = 0.0050001,
            F_ratio = 0.0050001,
            eta_kwadraat = 0.0000501,
            significant_anova = 0
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

          choice_fields <- c("significant_anova")
          choice_ranges <- list(significant_anova = 1:2)
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
            if (field %in% choice_fields && !(value %in% choice_ranges[[field]])) {
              return(list(ok = FALSE, reason = "invalid_choice", value = value,
                          expected = expected[[field]]))
            }
            ok <- abs(value - expected[[field]]) <= tolerance[[field]]
            list(ok = isTRUE(ok), reason = if (ok) "ok" else "wrong",
                 value = value, expected = expected[[field]])
          })
          names(results) <- names(expected)
          assign("split_results_9_4_3", results, envir = globalenv())
          all(vapply(results, function(item) isTRUE(item$ok), logical(1)))
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("split_results_9_4_3", envir = globalenv())
          labels <- c(
            SS_between = "SS between",
            df_between = "vrijheidsgraden between",
            MS_between = "MS between",
            F_ratio = "F-ratio",
            eta_kwadraat = "eta-kwadraat",
            significant_anova = "significantiebeslissing"
          )
          digits <- c(
            SS_between = 2,
            df_between = 0,
            MS_between = 2,
            F_ratio = 2,
            eta_kwadraat = 4,
            significant_anova = 0
          )
          diagnoses <- c(
            SS_between = "Je hebt mogelijk groepsafstanden niet met de groepsgrootte gewogen of met een afgerond grand mean gerekend.",
            df_between = "Je hebt mogelijk de vrijheidsgraden binnen groepen gebruikt.",
            MS_between = "Je hebt mogelijk SS between nog niet door de bijbehorende vrijheidsgraad gedeeld.",
            F_ratio = "Je hebt mogelijk teller en noemer van de F-verhouding omgewisseld of afgeronde waarden gebruikt.",
            eta_kwadraat = "Je hebt mogelijk alleen SS between of alleen SS within als totale variatie gebruikt.",
            significant_anova = "Je hebt mogelijk de F-waarde en de kritieke grens in de verkeerde richting vergeleken."
          )
          choice_fields <- c("significant_anova")

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
              "\n\n**Denkregel:** Een ANOVA houdt SS, df en MS per bron gescheiden; F vergelijkt de tussen- en binnengroepsinformatie en η² gebruikt de totale variatie.",
              "\n\n**Transferstap:** Leg bij een nieuwe ANOVA naast elk getal het label between, within of total voordat je een toets- of effectgrootte berekent."
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
              "\n\n**Denkregel:** Een ANOVA houdt SS, df en MS per bron gescheiden; F vergelijkt de tussen- en binnengroepsinformatie en η² gebruikt de totale variatie.",
              "\n\n**Volgende stap:** Noteer voor het eerste fout gemelde veld welke bron van variatie en welke vrijheidsgraad nodig zijn, reken met de ongeronde waarden en rond pas de uitkomst af.",
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
