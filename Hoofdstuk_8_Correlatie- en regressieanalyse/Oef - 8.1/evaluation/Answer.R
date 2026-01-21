context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          results <- list()

          x <- c(29, 40, 54, 55, 72)
          y <- c(0.49, 1.59, 1.69, 1.82, 3.10)

          exp_verklarende <- 1
          exp_r <- as.numeric(cor(x, y, method = "pearson"))
          exp_r_round <- round(exp_r, 3)
          exp_verandert <- 2

          parse_num <- function(val) {
            if (is.character(val)) {
              val <- gsub(",", ".", val, fixed = TRUE)
              val <- gsub("%", "", val, fixed = TRUE)
            }
            suppressWarnings(as.numeric(val))
          }

          check_numeric <- function(varname, expected, tol = 0.01) {
            if (!exists(varname, envir = env)) {
              return(list(exists = FALSE, value = NA, value_num = NA, correct = FALSE, expected = expected))
            }
            raw <- get(varname, envir = env)
            num <- parse_num(raw)
            ok <- !is.na(num) && abs(num - expected) <= tol
            list(exists = TRUE, value = raw, value_num = num, correct = ok, expected = expected)
          }

          check_choice <- function(varname, expected, choices) {
            r <- check_numeric(varname, expected, tol = 0.0)
            r$choices <- choices
            r
          }

          check_text <- function(varname) {
            if (!exists(varname, envir = env)) {
              return(list(exists = FALSE, value = NA, correct = FALSE))
            }
            raw <- get(varname, envir = env)
            if (!is.character(raw)) raw <- as.character(raw)
            text <- tolower(raw)

            has_not_change <- grepl("\\b(niet|onveranderd|zelfde|blijft)\\b", text)
            has_reason <- grepl("lineair|transformatie|schaal|eenheid|standaard|z-?score|vermenig|constante", text)
            ok <- has_not_change && has_reason
            list(exists = TRUE, value = raw, correct = ok, has_not_change = has_not_change, has_reason = has_reason)
          }

          results$verklarende_variabele <- check_choice(
            "verklarende_variabele",
            exp_verklarende,
            c("1 = prijs", "2 = ontbossing")
          )

          results$pearson_r <- check_numeric("pearson_r", exp_r_round, tol = 0.01)

          results$correlatie_verandert <- check_choice(
            "correlatie_verandert",
            exp_verandert,
            c("1 = ja", "2 = nee")
          )

          results$verklaring_euro <- check_text("verklaring_euro")

          assign("detailed_results", results, envir = globalenv())
          all(sapply(results, function(r) isTRUE(r$correct)))
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("detailed_results", envir = globalenv())

          feedback <- "**Feedback per vraag:**\n\n"

          # 1) verklarende variabele
          r <- results$verklarende_variabele
          if (!r$exists) {
            feedback <- paste0(feedback, "❌ 1) Verklarende variabele — geen antwoord.\n\nKies 1 (prijs) of 2 (ontbossing).\n\n")
          } else if (r$correct) {
            feedback <- paste0(feedback, "✅ 1) Verklarende variabele — correct.\n\n")
          } else {
            feedback <- paste0(
              feedback,
              "❌ 1) Verklarende variabele — fout (",
              r$value,
              ").\n\nDe verklarende variabele is de variabele die je inhoudelijk als oorzaak/verklaring ziet (X).\n\n"
            )
          }

          # 2) Pearson r
          r <- results$pearson_r
          if (!r$exists) {
            feedback <- paste0(feedback, "❌ 2) Pearson's r — geen antwoord.\n\nBereken r en rond af op 3 decimalen.\n\n")
          } else if (r$correct) {
            feedback <- paste0(feedback, "✅ 2) Pearson's r — correct.\n\n")
          } else if (is.na(r$value_num)) {
            feedback <- paste0(feedback, "❌ 2) Pearson's r — fout.\n\nJe antwoord kon niet als getal geinterpreteerd worden. Gebruik een decimaal getal (bv. 0.123).\n\n")
          } else if (abs(r$value_num) > 1.01) {
            feedback <- paste0(feedback, "❌ 2) Pearson's r — fout.\n\nCorrelatie ligt altijd tussen -1 en 1. Controleer of je ergens met percentages of afronding fout ging.\n\n")
          } else {
            feedback <- paste0(
              feedback,
              "❌ 2) Pearson's r — fout (",
              r$value,
              ").\n\nControleer:\n- Covariantie: tel (x - xgem)*(y - ygem) op.\n- Deel door (n-1) voor de steekproefcovariantie.\n- Deel daarna door (s_x * s_y).\n\n"
            )
          }

          # 3) verandert correlatie?
          r <- results$correlatie_verandert
          if (!r$exists) {
            feedback <- paste0(feedback, "❌ 3) Verandert de correlatie? — geen antwoord.\n\nKies 1 (ja) of 2 (nee).\n\n")
          } else if (r$correct) {
            feedback <- paste0(feedback, "✅ 3) Verandert de correlatie? — correct.\n\n")
          } else {
            feedback <- paste0(
              feedback,
              "❌ 3) Verandert de correlatie? — fout (",
              r$value,
              ").\n\nDenk aan wat er gebeurt als je alle x-waarden omzet via x' = a*x + b (eenheden/schaal).\n\n"
            )
          }

          # 3) verklaring
          r <- results$verklaring_euro
          if (!r$exists) {
            feedback <- paste0(feedback, "❌ 3) Verklaring — geen antwoord.\n\nSchrijf 1-3 zinnen waarom de correlatie wel/niet verandert bij een eenhedenomzetting.\n\n")
          } else if (r$correct) {
            feedback <- paste0(feedback, "✅ 3) Verklaring — correct.\n\n")
          } else {
            missing_reason <- !isTRUE(r$has_reason)
            missing_concl <- !isTRUE(r$has_not_change)
            feedback <- paste0(feedback, "❌ 3) Verklaring — nog onvolledig.\n\n")
            if (missing_concl) {
              feedback <- paste0(feedback, "- Voeg duidelijk toe of de correlatie verandert of niet.\n")
            }
                if (missing_reason) {
                  feedback <- paste0(feedback, "- Leg uit dat een omzetting naar euro een lineaire transformatie is (vermenigvuldigen met een constante en eventueel een verschuiving) en wat dat betekent voor Pearson's r.\n")
                }
                feedback <- paste0(feedback, "\n")
              }

          get_reporter()$add_message(feedback, type = "markdown")
          generated == expected
        }
      )
    }
  )
})
