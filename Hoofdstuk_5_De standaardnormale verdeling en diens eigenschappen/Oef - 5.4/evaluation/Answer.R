context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          results <- list()

          # Expected answers for Exercise 5.4: Trappist Beer Quality Control
          # Normal distribution N(33, 2) - bottle contents in cl
          
          # Question A - P(32 ≤ X ≤ 34) = 38.30%
          exp_a <- 38.30
          
          # Question B - P(X > 35) = 15.87%  
          exp_b <- 15.87

          # Helper function to check each answer
          check_value <- function(varname, expected, tol = 0.01, expect_percent = FALSE) {
            if (!exists(varname, envir = env)) {
              return(list(exists = FALSE, value = NA, correct = FALSE, expected = expected))
            }
            val <- get(varname, envir = env)
            
            if (expect_percent) {
              # Handle percentage strings like "8.08%"
              if (is.character(val) && grepl("%$", val)) {
                val_num <- suppressWarnings(as.numeric(gsub("%$", "", val)))
              } else {
                val_num <- suppressWarnings(as.numeric(val))
              }
            } else {
              val_num <- suppressWarnings(as.numeric(val))
            }
            
            correct <- !is.na(val_num) && abs(val_num - expected) < tol
            return(list(exists = TRUE, value = val, correct = correct, expected = expected))
          }

          # Check final answers only
          results$vraag_a <- check_value("vraag_a", exp_a, tol = 0.01, expect_percent = FALSE)
          results$vraag_b <- check_value("vraag_b", exp_b, tol = 0.01, expect_percent = FALSE)

          assign("detailed_results", results, envir = globalenv())

          all_correct <- all(sapply(results, function(x) x$correct))
          return(all_correct)
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("detailed_results", envir = globalenv())

          qnames <- c(
            vraag_a = "a) Percentage flesjes tussen 32cl en 34cl",
            vraag_b = "b) Percentage flesjes meer dan 35cl"
          )

          # Helper function for parsing student answers
          parse_num <- function(val) {
            if (is.character(val) && grepl("%$", val)) {
              val <- gsub("%$", "", val)
            }
            suppressWarnings(as.numeric(val))
          }

          # --- DIAGNOSTIC FUNCTIONS ---

          wrong_msg_a <- function(val) {
            val_num <- parse_num(val)
            if (is.na(val_num)) {
              return("Je antwoord kon niet als getal geïnterpreteerd worden. Het juiste antwoord is 38.30%.")
            }

            # correct probability but not converted to %
            if (abs(val_num - 0.3830) < 0.0001) {
              return("Je gebruikte de kans in decimaalvorm (0.3830) in plaats van het percentage. Vermenigvuldig met 100: 0.3830 × 100 = 38.30%.")
            }
            # complement instead of interval
            if (abs(val_num - 61.70) < 0.1 || abs(val_num - 0.6170) < 0.001) {
              return("Je berekende waarschijnlijk de complementaire kans i.p.v. de kans in het interval. Controleer: P(32 ≤ X ≤ 34) = P(Z ≤ 0.5) - P(Z ≤ -0.5).")
            }
            # percentage but wrong magnitude
            if (val_num > 100 || val_num < 0) {
              return("Kansen kunnen niet kleiner dan 0% of groter dan 100% zijn. Controleer je berekening en het gebruik van de Z-tabel.")
            }

            return(paste0(
              "Je gaf ", val, ", maar dit is fout. Bereken eerst Z-scores (Z = (X - μ)/σ), zoek de kansen in de Z-tabel en neem het verschil: ",
              "Z₁ = -0.5, Z₂ = 0.5 → P(-0.5 ≤ Z ≤ 0.5) = 0.3830 = 38.30%."
            ))
          }

          wrong_msg_b <- function(val) {
            val_num <- parse_num(val)
            if (is.na(val_num)) {
              return("Je antwoord kon niet als getal geïnterpreteerd worden. Het juiste antwoord is 15.87%.")
            }

            # correct probability but not converted to %
            if (abs(val_num - 0.1587) < 0.0001) {
              return("Je gebruikte de kans in decimaalvorm (0.1587) in plaats van het percentage. Vermenigvuldig met 100: 0.1587 × 100 = 15.87%.")
            }
            # complement used (P(X ≤ 35) ipv P(X > 35))
            if (abs(val_num - 84.13) < 0.1 || abs(val_num - 0.8413) < 0.001) {
              return("Je gebruikte waarschijnlijk P(X ≤ 35) in plaats van P(X > 35). Vergeet niet: P(X > 35) = 1 − P(X ≤ 35).")
            }
            if (val_num > 100 || val_num < 0) {
              return("Kansen kunnen niet kleiner dan 0% of groter dan 100% zijn. Controleer je Z-waarde en of je het complement correct nam.")
            }

            return(paste0(
              "Je gaf ", val, ", maar dit is fout. Bereken eerst Z = (35 − 33) / 2 = 1, zoek P(Z ≤ 1) = 0.8413 en neem dan het complement: ",
              "P(X > 35) = 1 − 0.8413 = 0.1587 = 15.87%."
            ))
          }

          # --- BUILD FEEDBACK TEXT ---

          feedback_text <- "**Resultaten per vraag:**\n\n"

          # Vraag A
          q <- "vraag_a"
          if (results[[q]]$exists) {
            if (results[[q]]$correct) {
              feedback_text <- paste0(
                feedback_text,
                "✅ ", qnames[[q]],
                " **Correct! (", round(as.numeric(results[[q]]$value), 2), "%)**\n\n"
              )
            } else {
              msg <- wrong_msg_a(results[[q]]$value)
              feedback_text <- paste0(
                feedback_text,
                "❌ ", qnames[[q]], " **Fout.**\n\n",
                msg, "\n\n"
              )
            }
          } else {
            feedback_text <- paste0(
              feedback_text,
              "❌ ", qnames[[q]],
              " **Je hebt geen antwoord gegeven.**\n\n"
            )
          }

          # Vraag B
          q <- "vraag_b"
          if (results[[q]]$exists) {
            if (results[[q]]$correct) {
              feedback_text <- paste0(
                feedback_text,
                "✅ ", qnames[[q]],
                " **Correct! (", round(as.numeric(results[[q]]$value), 2), "%)**\n\n"
              )
            } else {
              msg <- wrong_msg_b(results[[q]]$value)
              feedback_text <- paste0(
                feedback_text,
                "❌ ", qnames[[q]], " **Fout.**\n\n",
                msg, "\n\n"
              )
            }
          } else {
            feedback_text <- paste0(
              feedback_text,
              "❌ ", qnames[[q]],
              " **Je hebt geen antwoord gegeven.**\n\n"
            )
          }

          # Extra uitleg (zoals in je oude oefening)
          feedback_text <- paste0(
            feedback_text,
            "**Gegeven:** N(33, 2) — μ = 33 cl, σ = 2 cl\n\n",
            "**Vraag a:** Z₁ = (32−33)/2 = −0.5, Z₂ = (34−33)/2 = 0.5 → P(−0.5 ≤ Z ≤ 0.5) = 0.6915 − 0.3085 = 0.3830 = 38.30%.\n\n",
            "**Vraag b:** Z = (35−33)/2 = 1 → P(Z > 1) = 1 − 0.8413 = 0.1587 = 15.87%.\n\n",
            "**Z-tabel:** https://www.belfactorij.nl/voorinloggen/kansverdelingen/Normaal.htm"
          )

          get_reporter()$add_message(feedback_text, type = "markdown")
          generated == expected
        }
      )
    }
  )
})
