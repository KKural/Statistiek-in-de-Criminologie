# Eén zelfstandige testcase met gerichte feedback per veld.
context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          expected <- c(
            determinant_D = 300,
            b1 = -2.20,
            b2 = 1.00,
            intercept_a = 17.60,
            voorspelling = 19.00,
            R_kwadraat = 0.9800
          )
          tolerance <- c(
            determinant_D = 0,
            b1 = 0.0050001,
            b2 = 0.0050001,
            intercept_a = 0.0050001,
            voorspelling = 0.0050001,
            R_kwadraat = 0.0000501
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
          assign("split_results_11_1_3", results, envir = globalenv())
          all(vapply(results, function(item) isTRUE(item$ok), logical(1)))
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("split_results_11_1_3", envir = globalenv())
          labels <- c(
            determinant_D = "determinant D",
            b1 = "regressiegewicht b1",
            b2 = "regressiegewicht b2",
            intercept_a = "intercept a",
            voorspelling = "voorspelde Y",
            R_kwadraat = "R-kwadraat"
          )
          digits <- c(
            determinant_D = 0,
            b1 = 2,
            b2 = 2,
            intercept_a = 2,
            voorspelling = 2,
            R_kwadraat = 4
          )
          diagnoses <- c(
            determinant_D = "Je hebt mogelijk een tussenproduct of de vierkantswortel gerapporteerd in plaats van de determinant.",
            b1 = "Je hebt mogelijk het negatieve teken van de X1-Y-kruisproductsom verloren of tellertermen verwisseld.",
            b2 = "Je hebt mogelijk de X1- en X2-formule door elkaar gehaald of niet door de determinant gedeeld.",
            intercept_a = "Je hebt mogelijk alleen het Y-gemiddelde gebruikt of een minteken bij een negatief regressiegewicht verkeerd verwerkt.",
            voorspelling = "Je hebt mogelijk het intercept weggelaten of X2 = 7 in plaats van de gevraagde X2 = 8 gebruikt.",
            R_kwadraat = "Je hebt mogelijk R in plaats van R-kwadraat berekend of een onjuiste somkwadraat als deler gebruikt."
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
              "\n\n**Denkregel:** Houd determinant, regressiegewichten, intercept, voorspelling en model-fit als opeenvolgende maar verschillende grootheden uit elkaar.",
              "\n\n**Transferstap:** Controleer in een nieuw model een voorspelling door eerst a, daarna b1X1 en b2X2 als drie aparte termen te noteren."
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
              "\n\n**Denkregel:** Houd determinant, regressiegewichten, intercept, voorspelling en model-fit als opeenvolgende maar verschillende grootheden uit elkaar.",
              "\n\n**Volgende stap:** Schrijf voor het eerste fout gemelde veld alleen de symbolische stap met de verstrekte tussenresultaten uit en controleer haakjes en tekens vóór de berekening.",
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
