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

            # Correct probability but not converted to percentage
            if (abs(val_num - 0.3830) < 0.0001 || abs(val_num - 0.383) < 0.001) {
              return("Je gebruikte de kans in decimaalvorm (0.3830) in plaats van het percentage. Vermenigvuldig met 100: 0.3830 × 100 = 38.30%.")
            }
            
            # Complement errors - calculated 100% - 38.30% or as decimal
            if (abs(val_num - 61.70) < 0.1) {
              return("Je berekende de complementaire kans (100% - 38.30% = 61.70%). Voor het interval P(32 ≤ X ≤ 34) moet je P(Z ≤ 0.5) - P(Z ≤ -0.5) = 0.6915 - 0.3085 = 0.3830 = 38.30% berekenen.")
            }
            if (abs(val_num - 0.6170) < 0.001) {
              return("Je berekende de complementaire kans in decimaalvorm (0.6170). Voor het interval P(32 ≤ X ≤ 34) bereken je: P(Z ≤ 0.5) - P(Z ≤ -0.5) = 0.3830 = 38.30%.")
            }
            
            # Used only one tail (half the interval)
            if (abs(val_num - 19.15) < 0.1) {
              return("Je berekende waarschijnlijk slechts één kant van het interval. Voor P(32 ≤ X ≤ 34) heb je beide Z-waarden nodig: P(Z ≤ 0.5) - P(Z ≤ -0.5) = 38.30%, niet de helft.")
            }
            
            # Used much smaller value - might be calculation error or wrong approach
            if (abs(val_num - 7.935) < 0.1 || (val_num > 5 && val_num < 15)) {
              return("Je antwoord is veel te klein voor dit interval. Controleer je berekening: P(32 ≤ X ≤ 34) = P(Z ≤ 0.5) - P(Z ≤ -0.5) = 0.6915 - 0.3085 = 0.3830 = 38.30%.")
            }
            
            # Doubled the correct answer
            if (abs(val_num - 76.60) < 0.1) {
              return("Je antwoord is te groot - waarschijnlijk heb je ergens dubbel geteld. Voor het interval P(32 ≤ X ≤ 34): Z₁ = -0.5, Z₂ = 0.5 → P(-0.5 ≤ Z ≤ 0.5) = 0.6915 - 0.3085 = 38.30%.")
            }
            
            # Confused with empirical rule (68%)
            if (abs(val_num - 68.30) < 0.5 || abs(val_num - 68.27) < 0.5) {
              return("Je gebruikte waarschijnlijk de empirische regel (68% binnen 1σ). Maar hier gaat het om een specifiek interval [32,34]. Bereken: Z₁ = -0.5, Z₂ = 0.5 → P(-0.5 ≤ Z ≤ 0.5) = 38.30%.")
            }
            
            # Assumed 50% (symmetric around mean)
            if (abs(val_num - 50.0) < 0.1) {
              return("Je nam waarschijnlijk aan dat het 50% is omdat het interval symmetrisch is rond μ = 33. Maar de breedte van het interval bepaalt de kans. Bereken correct: P(32 ≤ X ≤ 34) = 38.30%.")
            }
            
            # Specific wrong calculation errors
            if (abs(val_num - 138.30) < 0.1) {
              return("Je antwoord 138.30% is veel te groot - kansen kunnen niet boven 100% zijn! Waarschijnlijk heb je ergens verkeerd opgeteld. Bereken correct: P(32 ≤ X ≤ 34) = P(Z ≤ 0.5) - P(Z ≤ -0.5) = 38.30%.")
            }
            
            # Invalid ranges
            if (val_num < 0) {
              if (abs(val_num - (-38.30)) < 0.1) {
                return("Je kreeg -38.30% - kansen kunnen niet negatief zijn! Controleer je tekens in de berekening. Het juiste antwoord is +38.30%.")
              }
              return("Kansen kunnen niet negatief zijn! Controleer je berekening. Het juiste antwoord is 38.30%.")
            }
            if (val_num > 100) {
              return("Kansen kunnen niet groter dan 100% zijn! Controleer of je niet ergens te veel vermenigvuldigde. Het juiste antwoord is 38.30%.")
            }

            # Generic wrong answer with step-by-step guidance
            return(paste0(
              "Je gaf ", val, "%, maar dit is fout.\n\n**Correcte berekening:**\n",
              "1. Z₁ = (32-33)/2 = -0.5, Z₂ = (34-33)/2 = 0.5\n",
              "2. P(Z ≤ -0.5) = 0.3085, P(Z ≤ 0.5) = 0.6915 (uit Z-tabel)\n",
              "3. P(-0.5 ≤ Z ≤ 0.5) = 0.6915 - 0.3085 = 0.3830\n",
              "4. 0.3830 × 100% = **38.30%**"
            ))
          }

          wrong_msg_b <- function(val) {
            val_num <- parse_num(val)
            if (is.na(val_num)) {
              return("Je antwoord kon niet als getal geïnterpreteerd worden. Het juiste antwoord is 15.87%.")
            }

            # Correct probability but not converted to percentage
            if (abs(val_num - 0.1587) < 0.0001) {
              return("Je gebruikte de kans in decimaalvorm (0.1587) in plaats van het percentage. Vermenigvuldig met 100: 0.1587 × 100 = 15.87%.")
            }
            
            # Complement error - calculated P(X ≤ 35) instead of P(X > 35)
            if (abs(val_num - 84.13) < 0.1) {
              return("Je berekende P(X ≤ 35) = 84.13% in plaats van P(X > 35). Voor 'meer dan 35cl' moet je het complement nemen: P(X > 35) = 1 - P(X ≤ 35) = 1 - 0.8413 = 0.1587 = 15.87%.")
            }
            if (abs(val_num - 0.8413) < 0.001) {
              return("Je berekende P(X ≤ 35) in decimaalvorm (0.8413) in plaats van P(X > 35). Voor 'meer dan 35cl': P(X > 35) = 1 - 0.8413 = 0.1587 = 15.87%.")
            }
            
            # Doubled the correct answer
            if (abs(val_num - 31.74) < 0.1) {
              return("Je antwoord is te groot - waarschijnlijk heb je ergens dubbel geteld. Voor P(X > 35): Z = (35-33)/2 = 1 → P(Z > 1) = 1 - 0.8413 = 15.87%.")
            }
            
            # Used half value
            if (abs(val_num - 7.935) < 0.1 || abs(val_num - 7.94) < 0.1) {
              return("Je antwoord is te klein - waarschijnlijk heb je ergens gedeeld door 2. Voor P(X > 35): Z = 1 → P(Z > 1) = 1 - 0.8413 = 15.87%.")
            }
            
            # Assumed 50% for anything above mean
            if (abs(val_num - 50.0) < 0.1) {
              return("Je nam waarschijnlijk aan dat alles boven het gemiddelde 50% is. Maar X = 35 ligt 1 standaarddeviatie boven μ = 33. Bereken: P(X > 35) = P(Z > 1) = 15.87%.")
            }
            
            # Wrong Z-table value
            if (abs(val_num - 34.13) < 0.1) {
              return("Je gebruikte waarschijnlijk een verkeerde Z-tabelwaarde. Voor Z = (35-33)/2 = 1: P(Z ≤ 1) = 0.8413, dus P(Z > 1) = 1 - 0.8413 = 15.87%.")
            }
            
            # Confused with empirical rule (68%)
            if (abs(val_num - 68.27) < 0.5 || abs(val_num - 68.3) < 0.5) {
              return("Je gebruikte waarschijnlijk de empirische regel. Maar hier gaat het om P(X > 35), niet om een interval. Bereken: Z = 1 → P(Z > 1) = 15.87%.")
            }
            
            # Specific wrong calculation errors
            if (abs(val_num - 115.87) < 0.1) {
              return("Je antwoord 115.87% is veel te groot - kansen kunnen niet boven 100% zijn! Controleer je berekening. Het juiste antwoord: P(X > 35) = 1 - 0.8413 = 15.87%.")
            }
            
            # Invalid ranges
            if (val_num < 0) {
              if (abs(val_num - (-15.87)) < 0.1) {
                return("Je kreeg -15.87% - kansen kunnen niet negatief zijn! Controleer je tekens in de berekening. Het juiste antwoord is +15.87%.")
              }
              return("Kansen kunnen niet negatief zijn! Controleer je berekening. Het juiste antwoord is 15.87%.")
            }
            if (val_num > 100) {
              return("Kansen kunnen niet groter dan 100% zijn! Controleer of je ergens een rekenfout maakte. Het juiste antwoord is 15.87%.")
            }

            # Generic wrong answer with step-by-step guidance
            return(paste0(
              "Je gaf ", val, "%, maar dit is fout.\n\n**Correcte berekening:**\n",
              "1. Z = (35-33)/2 = 1\n",
              "2. P(Z ≤ 1) = 0.8413 (uit Z-tabel)\n",
              "3. P(X > 35) = P(Z > 1) = 1 - P(Z ≤ 1) = 1 - 0.8413 = 0.1587\n",
              "4. 0.1587 × 100% = **15.87%**"
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
