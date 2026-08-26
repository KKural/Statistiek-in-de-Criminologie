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
            vraag2 = 3,
            vraag3 = 2,
            vraag4 = 2,
            vraag5 = 2,
            vraag6 = 1,
            vraag7 = 1
          )
          tolerance <- c(
            vraag1 = 0,
            vraag2 = 0,
            vraag3 = 0,
            vraag4 = 0,
            vraag5 = 0,
            vraag6 = 0,
            vraag7 = 0
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
          choice_fields <- c("vraag1", "vraag2", "vraag3", "vraag4", "vraag5", "vraag6", "vraag7")
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
          assign("split_results_11_6_1", results, envir = globalenv())
          all(vapply(results, function(item) isTRUE(item$ok), logical(1)))
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("split_results_11_6_1", envir = globalenv())
          labels <- c(
            vraag1 = "voorspelde waarde en residu",
            vraag2 = "betrouwbaarheidsinterval dat nul bevat",
            vraag3 = "niet-significante coëfficiënt",
            vraag4 = "nut van een niet-significante predictor",
            vraag5 = "veranderende coëfficiënten",
            vraag6 = "bivariaat versus multivariaat",
            vraag7 = "adjusted R-kwadraat"
          )
          diagnoses <- c(
            vraag1 = "Je hebt mogelijk een modelvoorspelling met een gemiddelde of onzekerheidsmaat verward.",
            vraag2 = "Je hebt mogelijk alleen naar het teken van de puntschatting gekeken en niet naar nul in het volledige interval.",
            vraag3 = "Je hebt mogelijk onvoldoende bewijs gelijkgesteld aan bewezen afwezigheid of inhoudelijke irrelevantie.",
            vraag4 = "Je hebt mogelijk bruikbaarheid uitsluitend aan een p-waarde gekoppeld.",
            vraag5 = "Je hebt mogelijk vergeten dat elk regressiegewicht wordt geschat terwijl de andere predictors constant worden gehouden.",
            vraag6 = "Je hebt mogelijk de verandering alleen aan de p-waarde toegeschreven en gedeelde predictorvariantie niet onderzocht.",
            vraag7 = "Je hebt mogelijk de richting van de correctie omgedraaid of R-kwadraat en adjusted R-kwadraat als identiek behandeld."
          )
          if (isTRUE(generated)) {
            confirmations <- vapply(names(results), function(field) {
              paste0("- ", labels[[field]], ": **optie ",
                     as.integer(results[[field]]$expected), "**")
            }, character(1))
            message <- paste0(
              "✅ **Bevestiging:** alle gekozen opties zijn correct.\n\n",
              paste(confirmations, collapse = "\n"),
              "\n\n**Denkregel:** Lees eerst welk niveau wordt gevraagd: observatie, coëfficiënt, predictorrol of totale model-fit; pas daarna de bijbehorende definitie of beslisregel toe.",
              "\n\n**Transferstap:** Formuleer bij een nieuwe regressie-uitkomst één voorzichtige zin over schatting, onzekerheid en modelcontext."
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
              "\n\n**Denkregel:** Lees eerst welk niveau wordt gevraagd: observatie, coëfficiënt, predictorrol of totale model-fit; pas daarna de bijbehorende definitie of beslisregel toe.",
              "\n\n**Volgende stap:** Schrap bij de eerste fout gemelde vraag eerst opties die een andere grootheid of een absolute claim gebruiken en toets de overblijvende opties aan de definitie.",
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
