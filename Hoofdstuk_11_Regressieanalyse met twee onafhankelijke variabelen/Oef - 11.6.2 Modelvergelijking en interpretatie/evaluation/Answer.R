# Eén zelfstandige testcase met gerichte feedback per vraag.
context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          expected <- c(
            vraag8 = 1,
            vraag9 = 1,
            vraag10 = 1,
            vraag11 = 2,
            vraag12 = 2,
            vraag13 = 3,
            vraag14 = 3
          )
          tolerance <- c(
            vraag8 = 0,
            vraag9 = 0,
            vraag10 = 0,
            vraag11 = 0,
            vraag12 = 0,
            vraag13 = 0,
            vraag14 = 0
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
          choice_fields <- c("vraag8", "vraag9", "vraag10", "vraag11", "vraag12", "vraag13", "vraag14")
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
          assign("split_results_11_6_2", results, envir = globalenv())
          all(vapply(results, function(item) isTRUE(item$ok), logical(1)))
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("split_results_11_6_2", envir = globalenv())
          labels <- c(
            vraag8 = "multicollineariteit",
            vraag9 = "delta R-kwadraat",
            vraag10 = "ceteris-paribusinterpretatie",
            vraag11 = "volledig positief betrouwbaarheidsinterval",
            vraag12 = "relatief sterkste predictor",
            vraag13 = "residuele vrijheidsgraden",
            vraag14 = "tekenomslag en suppressie"
          )
          diagnoses <- c(
            vraag8 = "Je hebt mogelijk een residu- of uitkomstassumptie gekozen in plaats van een relatie tussen predictors.",
            vraag9 = "Je hebt mogelijk een verandering in model-fit verward met een individuele coëfficiënt of residu.",
            vraag10 = "Je hebt mogelijk een regressiegewicht als correlatie of percentage gelezen en de controle voor andere predictors vergeten.",
            vraag11 = "Je hebt mogelijk alleen naar de grootte van het interval gekeken en niet naar zijn ligging ten opzichte van nul.",
            vraag12 = "Je hebt mogelijk coëfficiënten in verschillende meeteenheden rechtstreeks vergeleken.",
            vraag13 = "Je hebt mogelijk alleen één parameter afgetrokken en het intercept niet meegeteld.",
            vraag14 = "Je hebt mogelijk een tekenomslag automatisch als rekenfout gezien en de rol van gedeelde variantie niet overwogen."
          )
          if (isTRUE(generated)) {
            confirmations <- vapply(names(results), function(field) {
              paste0("- ", labels[[field]], ": **optie ",
                     as.integer(results[[field]]$expected), "**")
            }, character(1))
            message <- paste0(
              "✅ **Bevestiging:** alle gekozen opties zijn correct.\n\n",
              paste(confirmations, collapse = "\n"),
              "\n\n**Denkregel:** Koppel modelvergelijking, coëfficiëntinterpretatie en diagnostiek elk aan hun eigen statistiek; vergelijk relatieve effecten alleen op een gemeenschappelijke schaal.",
              "\n\n**Transferstap:** Controleer in een nieuw model of een onverwachte coëfficiënt verandert door schaal, overlap, controle of echte inhoudelijke richting."
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
              "\n\n**Denkregel:** Koppel modelvergelijking, coëfficiëntinterpretatie en diagnostiek elk aan hun eigen statistiek; vergelijk relatieve effecten alleen op een gemeenschappelijke schaal.",
              "\n\n**Volgende stap:** Benoem bij de eerste fout gemelde vraag eerst de centrale grootheid en schrijf de bijbehorende definitie of vrijheidsgradenstructuur in woorden.",
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
