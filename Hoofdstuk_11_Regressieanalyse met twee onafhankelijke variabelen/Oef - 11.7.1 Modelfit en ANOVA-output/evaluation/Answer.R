# Eén zelfstandige testcase met gerichte feedback per vraag.
context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          expected <- c(
            vraag1 = 2,
            vraag2 = 4,
            vraag3 = 3,
            vraag4 = 4,
            vraag5 = 3
          )
          tolerance <- c(
            vraag1 = 0,
            vraag2 = 0,
            vraag3 = 0,
            vraag4 = 0,
            vraag5 = 0
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
            }
            suppressWarnings(as.numeric(value))
          }
          choice_fields <- c("vraag1", "vraag2", "vraag3", "vraag4", "vraag5")
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
            if (!(value %in% 1:4)) {
              return(list(ok = FALSE, reason = "invalid_choice", value = value,
                          expected = expected[[field]]))
            }
            ok <- value == expected[[field]]
            list(ok = isTRUE(ok), reason = if (ok) "ok" else "wrong",
                 value = value, expected = expected[[field]])
          })
          names(results) <- names(expected)
          assign("split_results_11_7_1", results, envir = globalenv())
          all(vapply(results, function(item) isTRUE(item$ok), logical(1)))
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("split_results_11_7_1", envir = globalenv())
          labels <- c(
            vraag1 = "Multiple R",
            vraag2 = "verklaarde variantie",
            vraag3 = "niet-verklaarde variantie",
            vraag4 = "steekproefgrootte",
            vraag5 = "F-toets en modelsignificantie"
          )
          diagnoses <- c(
            vraag1 = "Je hebt mogelijk R-kwadraat gelezen in plaats van Multiple R of de verkeerde rij afgerond.",
            vraag2 = "Je hebt mogelijk Multiple R als percentage geïnterpreteerd in plaats van R-kwadraat.",
            vraag3 = "Je hebt mogelijk de verklaarde en resterende fractie verwisseld.",
            vraag4 = "Je hebt mogelijk een vrijheidsgraad uit de ANOVA-tabel als aantal observaties gelezen.",
            vraag5 = "Je hebt mogelijk de F-waarde met een regressiecoëfficiënt verwisseld of de p-waarde in de verkeerde richting beoordeeld."
          )
          if (isTRUE(generated)) {
            confirmations <- vapply(names(results), function(field) {
              paste0("- ", labels[[field]], ": **optie ",
                     as.integer(results[[field]]$expected), "**")
            }, character(1))
            message <- paste0(
              "✅ **Bevestiging:** alle gekozen opties zijn correct.\n\n",
              paste(confirmations, collapse = "\n"),
              "\n\n**Denkregel:** Lees eerst het rijlabel, behoud de schaal van de statistiek en koppel een significantiebeslissing aan de bijbehorende p-waarde.",
              "\n\n**Transferstap:** Maak bij nieuwe regressie-output een onderscheid tussen samenhang, verklaarde variantie, steekproefgrootte en de totale modeltoets."
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
              "Zonder een gekozen optie kan deze vraag niet worden beoordeeld."
            } else if (identical(item$reason, "invalid_choice")) {
              "De beoordelaar verwacht precies één van de vier vermelde optienummers."
            } else {
              paste0("De gekozen optie combineert de begrippen of beslisregel bij ",
                     tolower(labels[[first]]), " niet correct.")
            }
            message <- paste0(
              "❌ **Waarschijnlijke redenering:** ", likely,
              "\n\n**Waarom dit niet klopt:** ", why,
              "\n\n**Denkregel:** Lees eerst het rijlabel, behoud de schaal van de statistiek en koppel een significantiebeslissing aan de bijbehorende p-waarde.",
              "\n\n**Volgende stap:** Wijs in de tabel voor de eerste fout gemelde vraag exact één rij en kolom aan voordat je afrondt, omzet naar procent of beslist.",
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
