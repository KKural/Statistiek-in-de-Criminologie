# Eén zelfstandige testcase met gerichte feedback per veld.
context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          expected <- c(
            Cov_XY = 1.3571,
            Cov_XZ = 1.4286,
            Cov_YZ = 1.0714,
            r_XY = 0.4600,
            r_XZ = 0.4309,
            r_YZ = 0.5268
          )
          tolerance <- c(
            Cov_XY = 0.0000501,
            Cov_XZ = 0.0000501,
            Cov_YZ = 0.0000501,
            r_XY = 0.0000501,
            r_XZ = 0.0000501,
            r_YZ = 0.0000501
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
          assign("split_results_10_1_4", results, envir = globalenv())
          all(vapply(results, function(item) isTRUE(item$ok), logical(1)))
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("split_results_10_1_4", envir = globalenv())
          labels <- c(
            Cov_XY = "covariantie XY",
            Cov_XZ = "covariantie XZ",
            Cov_YZ = "covariantie YZ",
            r_XY = "correlatie XY",
            r_XZ = "correlatie XZ",
            r_YZ = "correlatie YZ"
          )
          digits <- c(
            Cov_XY = 4,
            Cov_XZ = 4,
            Cov_YZ = 4,
            r_XY = 4,
            r_XZ = 4,
            r_YZ = 4
          )
          diagnoses <- c(
            Cov_XY = "Je hebt mogelijk de onverdeelde SCP ingevoerd of door n in plaats van n − 1 gedeeld.",
            Cov_XZ = "Je hebt mogelijk SCP XY gebruikt of de steekproefdeler vergeten.",
            Cov_YZ = "Je hebt mogelijk een teken of kolomcombinatie verwisseld.",
            r_XY = "Je hebt mogelijk de covariantie als correlatie overgenomen of door slechts één standaarddeviatie gedeeld.",
            r_XZ = "Je hebt mogelijk te vroeg afgerond of niet de bijbehorende SS- en SCP-waarden samen gebruikt.",
            r_YZ = "Je hebt mogelijk een andere covariantie of standaarddeviatiecombinatie gebruikt."
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
              "\n\n**Denkregel:** Covariantie deelt de passende SCP door n − 1; correlatie standaardiseert precies die covariantie met de twee bijbehorende standaarddeviaties.",
              "\n\n**Transferstap:** Gebruik bij een nieuwe correlatiematrix consequente letterparen zodat XY, XZ en YZ niet door elkaar raken."
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
              "\n\n**Denkregel:** Covariantie deelt de passende SCP door n − 1; correlatie standaardiseert precies die covariantie met de twee bijbehorende standaarddeviaties.",
              "\n\n**Volgende stap:** Label bij het eerste fout gemelde veld beide variabelen en controleer vervolgens of SCP, covariantie en beide SD's dezelfde lettercombinatie dragen.",
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
