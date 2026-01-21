context({
  testcase(
    "Koffieprijs en ontbossing",
    {
      testEqual(
        "",
        function(env) {
          results <- list()

          # Data
          x <- c(29, 40, 54, 55, 72)
          y <- c(0.49, 1.59, 1.69, 1.82, 3.10)
          n <- length(x)

          # Verwachte waarden (uit de tabel)
          exp_verklarende <- 1 # prijs
          
          # Gemiddelden
          exp_gemiddelde_x <- 50
          exp_gemiddelde_y <- 1.738
          
          # Sommen
          exp_SSx <- 1066
          exp_SSy <- 3.4434
          exp_SSxy <- 57.87
          
          # Varianties
          exp_variantie_x <- 266.5
          exp_variantie_y <- 0.8609
          
          # Standaardafwijkingen
          exp_sd_x <- 16.3248
          exp_sd_y <- 0.9278
          
          # Covariantie
          exp_covariantie <- 14.4675
          
          # Pearson's r
          exp_r <- 0.9552
          
          # Verandert correlatie bij valuta-omzetting?
          exp_verandert <- 2 # nee

          # Helper functions
          parse_num <- function(val) {
            if (is.character(val)) {
              val <- gsub(",", ".", val, fixed = TRUE)
              val <- gsub("%", "", val, fixed = TRUE)
            }
            suppressWarnings(as.numeric(val))
          }

          check_numeric <- function(varname, expected, tolerance = 0.01, decimals = 2) {
            if (!exists(varname, envir = env)) {
              return(list(exists = FALSE, value = NA, value_num = NA, correct = FALSE, expected = expected, tolerance = tolerance))
            }
            raw <- get(varname, envir = env)
            num <- parse_num(raw)
            ok <- !is.na(num) && abs(num - expected) <= tolerance
            list(exists = TRUE, value = raw, value_num = num, correct = ok, expected = expected, tolerance = tolerance, decimals = decimals)
          }

          check_choice <- function(varname, expected, choices) {
            if (!exists(varname, envir = env)) {
              return(list(exists = FALSE, value = NA, value_num = NA, correct = FALSE, expected = expected, choices = choices))
            }
            raw <- get(varname, envir = env)
            num <- parse_num(raw)
            ok <- !is.na(num) && num == expected
            list(exists = TRUE, value = raw, value_num = num, correct = ok, expected = expected, choices = choices)
          }

          check_text <- function(varname) {
            if (!exists(varname, envir = env)) {
              return(list(exists = FALSE, value = NA, correct = FALSE))
            }

            raw <- get(varname, envir = env)
            if (!is.character(raw)) raw <- as.character(raw)
            text <- tolower(raw)

            has_some_length <- nchar(gsub("\\s+", "", text)) >= 15
            has_conclusion <- grepl("\\b(niet|onveranderd|zelfde|blijft|verandert)\\b", text)
            has_reason <- grepl("lineair|transformatie|schaal|eenheid|standaard|z-?score|vermenig|constante", text)

            ok <- has_some_length && has_conclusion && has_reason
            list(
              exists = TRUE,
              value = raw,
              correct = ok,
              has_some_length = has_some_length,
              has_conclusion = has_conclusion,
              has_reason = has_reason
            )
          }

          # Check all values
          results$verklarende_variabele <- check_choice("verklarende_variabele", exp_verklarende, c("1 = prijs", "2 = ontbossing"))
          results$gemiddelde_x <- check_numeric("gemiddelde_x", exp_gemiddelde_x, 0.01, 2)
          results$gemiddelde_y <- check_numeric("gemiddelde_y", exp_gemiddelde_y, 0.0001, 4)
          results$SSx <- check_numeric("SSx", exp_SSx, 1, 0)
          results$SSy <- check_numeric("SSy", exp_SSy, 0.0001, 4)
          results$SSxy <- check_numeric("SSxy", exp_SSxy, 0.01, 2)
          results$variantie_x <- check_numeric("variantie_x", exp_variantie_x, 0.1, 1)
          results$variantie_y <- check_numeric("variantie_y", exp_variantie_y, 0.0001, 4)
          results$sd_x <- check_numeric("sd_x", exp_sd_x, 0.0001, 4)
          results$sd_y <- check_numeric("sd_y", exp_sd_y, 0.0001, 4)
          results$covariantie <- check_numeric("covariantie", exp_covariantie, 0.0001, 4)
          results$pearson_r <- check_numeric("pearson_r", exp_r, 0.0001, 4)
          results$correlatie_verandert <- check_choice("correlatie_verandert", exp_verandert, c("1 = ja", "2 = nee"))
          results$verklaring_euro <- check_text("verklaring_euro")

          assign("detailed_results", results, envir = globalenv())
          all(sapply(results, function(r) isTRUE(r$correct)))
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("detailed_results", envir = globalenv())

          feedback <- "**Feedback per vraag:**\n\n"
          
          # Helper function for numeric feedback
          give_numeric_feedback <- function(num, label, r) {
            if (!r$exists) {
              paste0("[FOUT] ", num, ") ", label, ": geen antwoord.\n\n")
            } else if (r$correct) {
              paste0("[OK] ", num, ") ", label, ": correct (", r$value, ").\n\n")
            } else {
              paste0(
                "[FOUT] ", num, ") ", label, ": fout (", r$value, ").\n\n",
                "Verwacht: ", round(r$expected, r$decimals), " (±", r$tolerance, ")\n",
                "Controleer je berekening.\n\n"
              )
            }
          }

          # Deel A: Basis
          feedback <- paste0(feedback, "### Deel A: Basisvragen\n\n")
          r <- results$verklarende_variabele
          if (!r$exists) {
            feedback <- paste0(feedback, "[FOUT] 1) Verklarende variabele: geen antwoord.\n\n")
          } else if (r$correct) {
            feedback <- paste0(feedback, "[OK] 1) Verklarende variabele: correct.\n\n")
          } else {
            feedback <- paste0(feedback, "[FOUT] 1) Verklarende variabele: fout (", r$value, ").\n\nTip: de verklarende variabele (X) is diegene die inhoudelijk als oorzaak wordt gebruikt.\n\n")
          }

          # Deel B: Gemiddelden
          feedback <- paste0(feedback, "### Deel B: Gemiddelden\n\n")
          feedback <- paste0(feedback, give_numeric_feedback(2, "Gemiddelde X (x̄)", results$gemiddelde_x))
          feedback <- paste0(feedback, give_numeric_feedback(3, "Gemiddelde Y (ȳ)", results$gemiddelde_y))

          # Deel C: Sommen
          feedback <- paste0(feedback, "### Deel C: Afwijkingen en sommen\n\n")
          feedback <- paste0(feedback, give_numeric_feedback(4, "SSx (som gekwadrateerde afwijkingen X)", results$SSx))
          feedback <- paste0(feedback, give_numeric_feedback(5, "SSy (som gekwadrateerde afwijkingen Y)", results$SSy))
          feedback <- paste0(feedback, give_numeric_feedback(6, "SSxy (som kruisproducten)", results$SSxy))

          # Deel D: Varianties en SD
          feedback <- paste0(feedback, "### Deel D: Varianties en standaardafwijkingen\n\n")
          feedback <- paste0(feedback, give_numeric_feedback(7, "Variantie X (s²x)", results$variantie_x))
          feedback <- paste0(feedback, give_numeric_feedback(8, "Variantie Y (s²y)", results$variantie_y))
          feedback <- paste0(feedback, give_numeric_feedback(9, "Standaardafwijking X (sx)", results$sd_x))
          feedback <- paste0(feedback, give_numeric_feedback(10, "Standaardafwijking Y (sy)", results$sd_y))
          feedback <- paste0(feedback, give_numeric_feedback(11, "Covariantie (s²xy)", results$covariantie))

          # Deel E: Pearson's r
          feedback <- paste0(feedback, "### Deel E: Pearson's correlatie\n\n")
          feedback <- paste0(feedback, give_numeric_feedback(12, "Pearson's r", results$pearson_r))

          # Deel F: Interpretatie
          feedback <- paste0(feedback, "### Deel F: Interpretatie\n\n")
          r <- results$correlatie_verandert
          if (!r$exists) {
            feedback <- paste0(feedback, "[FOUT] 13a) Verandert de correlatie?: geen antwoord.\n\n")
          } else if (r$correct) {
            feedback <- paste0(feedback, "[OK] 13a) Verandert de correlatie?: correct.\n\n")
          } else {
            feedback <- paste0(feedback, "[FOUT] 13a) Verandert de correlatie?: fout (", r$value, ").\n\nTip: lineaire transformaties veranderen correlaties niet.\n\n")
          }

          r <- results$verklaring_euro
          if (!r$exists) {
            feedback <- paste0(feedback, "[FOUT] 13b) Verklaring: geen antwoord.\n\n")
          } else if (r$correct) {
            feedback <- paste0(feedback, "[OK] 13b) Verklaring: correct.\n\n")
          } else {
            feedback <- paste0(feedback, "[FOUT] 13b) Verklaring: nog onvolledig.\n\n")
            if (!isTRUE(r$has_some_length)) feedback <- paste0(feedback, "- Schrijf minimaal 1-3 zinnen.\n")
            if (!isTRUE(r$has_conclusion)) feedback <- paste0(feedback, "- Vermeld of de correlatie verandert.\n")
            if (!isTRUE(r$has_reason)) feedback <- paste0(feedback, "- Leg uit waarom (lineaire transformatie).\n")
            feedback <- paste0(feedback, "\n")
          }

          get_reporter()$add_message(feedback, type = "markdown")
          generated == expected
        }
      )
    }
  )
})
