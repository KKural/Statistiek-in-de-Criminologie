# Eén zelfstandige testcase met gerichte feedback per veld.
context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          expected <- c(
            Var_X = 4.8095,
            Var_Y = 1.8095,
            Var_Z = 2.2857,
            SD_X = 2.1931,
            SD_Y = 1.3452,
            SD_Z = 1.5119
          )
          tolerance <- c(
            Var_X = 0.0000501,
            Var_Y = 0.0000501,
            Var_Z = 0.0000501,
            SD_X = 0.0000501,
            SD_Y = 0.0000501,
            SD_Z = 0.0000501
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
          assign("split_results_10_1_3", results, envir = globalenv())
          all(vapply(results, function(item) isTRUE(item$ok), logical(1)))
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("split_results_10_1_3", envir = globalenv())
          labels <- c(
            Var_X = "variantie X",
            Var_Y = "variantie Y",
            Var_Z = "variantie Z",
            SD_X = "standaarddeviatie X",
            SD_Y = "standaarddeviatie Y",
            SD_Z = "standaarddeviatie Z"
          )
          digits <- c(
            Var_X = 4,
            Var_Y = 4,
            Var_Z = 4,
            SD_X = 4,
            SD_Y = 4,
            SD_Z = 4
          )
          diagnoses <- c(
            Var_X = "Je hebt mogelijk door n gedeeld in plaats van door n − 1, of SS X zelf ingevoerd.",
            Var_Y = "Je hebt mogelijk een andere SS gebruikt of de steekproefdeler niet toegepast.",
            Var_Z = "Je hebt mogelijk vóór de deling minder dan vier decimalen behouden.",
            SD_X = "Je hebt mogelijk de variantie als standaarddeviatie overgenomen of niet de vierkantswortel gebruikt.",
            SD_Y = "Je hebt mogelijk de wortel uit de ongeronde in plaats van de vastgelegde variantie genomen.",
            SD_Z = "Je hebt mogelijk een andere variantie onder de wortel gebruikt."
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
              "\n\n**Denkregel:** Een steekproefvariantie gebruikt SS/(n − 1); bereken de standaarddeviatie uit de ongeronde variantie en rond alleen het eindresultaat af.",
              "\n\n**Transferstap:** Schrijf in een nieuwe analyse de keten SS → variantie → standaarddeviatie uit met de gebruikte deler en afronding."
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
              "\n\n**Denkregel:** Een steekproefvariantie gebruikt SS/(n − 1); bereken de standaarddeviatie uit de ongeronde variantie en rond alleen het eindresultaat af.",
              "\n\n**Volgende stap:** Controleer bij het eerste fout gemelde veld eerst of je in de variantie- of standaarddeviatiestap zit en gebruik alleen het vastgelegde invoerresultaat.",
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
