# Eén zelfstandige testcase met gerichte feedback per vraag.
context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          expected <- c(
            vraag6 = 3,
            vraag7 = 1,
            vraag8 = 2,
            vraag9 = 3,
            vraag10 = 3,
            vraag11 = 4
          )
          tolerance <- c(
            vraag6 = 0,
            vraag7 = 0,
            vraag8 = 0,
            vraag9 = 0,
            vraag10 = 0,
            vraag11 = 0
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
          choice_fields <- c("vraag6", "vraag7", "vraag8", "vraag9", "vraag10", "vraag11")
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
          assign("split_results_11_7_2", results, envir = globalenv())
          all(vapply(results, function(item) isTRUE(item$ok), logical(1)))
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("split_results_11_7_2", envir = globalenv())
          labels <- c(
            vraag6 = "intercept",
            vraag7 = "coëfficiënt b1",
            vraag8 = "sterkste relatieve effect",
            vraag9 = "significante parameters",
            vraag10 = "betrouwbaarheidsinterval b1",
            vraag11 = "voorspelde AngstScore"
          )
          diagnoses <- c(
            vraag6 = "Je hebt mogelijk een helling of voorspelde casescore als startwaarde gelezen.",
            vraag7 = "Je hebt mogelijk b, beta en intercept verwisseld of de ceteris-paribusvoorwaarde weggelaten.",
            vraag8 = "Je hebt mogelijk ongestandaardiseerde coëfficiënten in verschillende meeteenheden rechtstreeks vergeleken.",
            vraag9 = "Je hebt mogelijk een positieve coëfficiënt als significant beschouwd zonder p-waarden of intervallen te controleren.",
            vraag10 = "Je hebt mogelijk alleen de positieve bovengrens bekeken en niet vastgesteld of nul in het hele interval ligt.",
            vraag11 = "Je hebt mogelijk een geobserveerde score gekozen of het intercept, een coëfficiëntteken of één predictor weggelaten."
          )
          if (isTRUE(generated)) {
            confirmations <- vapply(names(results), function(field) {
              paste0("- ", labels[[field]], ": **optie ",
                     as.integer(results[[field]]$expected), "**")
            }, character(1))
            message <- paste0(
              "✅ **Bevestiging:** alle gekozen opties zijn correct.\n\n",
              paste(confirmations, collapse = "\n"),
              "\n\n**Denkregel:** Lees b voor verandering in oorspronkelijke eenheden, beta voor relatieve vergelijking, p of het interval voor onzekerheid en gebruik alle modeltermen voor een voorspelling.",
              "\n\n**Transferstap:** Controleer in nieuwe output telkens label, schaal, controlevoorwaarde en onzekerheid voordat je een regressieparameter interpreteert."
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
              "\n\n**Denkregel:** Lees b voor verandering in oorspronkelijke eenheden, beta voor relatieve vergelijking, p of het interval voor onzekerheid en gebruik alle modeltermen voor een voorspelling.",
              "\n\n**Volgende stap:** Markeer bij de eerste fout gemelde vraag de benodigde kolom en parameter; voer bij een voorspelling de drie modeltermen afzonderlijk in.",
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
