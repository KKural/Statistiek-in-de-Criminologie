context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          results <- list()

          # Expected correct answers
          exp_z1_a <- -3       # (20 - 42.5) / 7.5
          exp_z2_a <- -2.33    # (25 - 42.5) / 7.5
          exp_p_z1_a <- 0.0013 # P(Z ≤ -3)
          exp_p_z2_a <- 0.0099 # P(Z ≤ -2.33)
          exp_verschil_a <- 0.0086 # 0.0099 - 0.0013
          exp_a <- 0.86        # 0.0086 * 100
          exp_b <- 8.08        # P(X < 32) = 8.08%
          exp_c <- 96.41       # P(X > 29) = 96.41%

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

          # Check all answers for question a (all steps)
          results$z1_a <- check_value("z1_a", exp_z1_a, tol = 0.05)
          results$z2_a <- check_value("z2_a", exp_z2_a, tol = 0.05)
          results$p_z1_a <- check_value("p_z1_a", exp_p_z1_a, tol = 0.001)
          results$p_z2_a <- check_value("p_z2_a", exp_p_z2_a, tol = 0.001)
          results$verschil_a <- check_value("verschil_a", exp_verschil_a, tol = 0.001)
          results$vraag_a <- check_value("vraag_a", exp_a, tol = 0.05, expect_percent = TRUE)
          
          # Check final answers for b and c (expecting percentage strings)
          results$vraag_b <- check_value("vraag_b", exp_b, tol = 0.05, expect_percent = TRUE)
          results$vraag_c <- check_value("vraag_c", exp_c, tol = 0.05, expect_percent = TRUE)

          assign("detailed_results", results, envir = globalenv())

          all_correct <- all(sapply(results, function(x) x$correct))
          return(all_correct)
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("detailed_results", envir = globalenv())

          qnames <- c(
            z1_a = "a.1) Z-score voor X = 20",
            z2_a = "a.2) Z-score voor X = 25",
            p_z1_a = "a.3) P(Z ≤ z1_a)",
            p_z2_a = "a.4) P(Z ≤ z2_a)",
            verschil_a = "a.5) Verschil tussen kansen",
            vraag_a = "a.6) Eindantwoord percentage",
            vraag_b = "b) Kans boete lager dan 32€",
            vraag_c = "c) Kans boete hoger dan 29€"
          )

          # Helper function for parsing student answers
          parse_num <- function(val) {
            if (is.character(val) && grepl("%$", val)) {
              val <- gsub("%$", "", val)
            }
            suppressWarnings(as.numeric(val))
          }

          # Detailed feedback functions for each step

          # For z1_a (z-score for X = 20)
          wrong_msg_z1_a <- function(val) {
            val_num <- parse_num(val)
            if (is.na(val_num)) return("Je antwoord kon niet als getal geïnterpreteerd worden. Het juiste antwoord is -3.")
            
            if (abs(val_num - 3) < 0.05) return("Je gaf 3, maar dit is fout. Je hebt waarschijnlijk μ - x gebruikt in plaats van x - μ. De formule is (20 - 42.5) / 7.5 = -3.")
            if (abs(val_num - (-22.5)) < 0.5) return("Je gaf -22.5, maar dit is fout. Je vergat te delen door σ. De formule is (20 - 42.5) / 7.5 = -3.")
            if (abs(val_num - 22.5) < 0.5) return("Je gaf 22.5, maar dit is fout. Je vergat te delen door σ en gebruikte het verkeerde teken. De formule is (20 - 42.5) / 7.5 = -3.")
            if (abs(val_num) < 1) return("Je Z-score is te klein. Controleer of je door de juiste waarde deelde (σ = 7.5). De formule is (20 - 42.5) / 7.5 = -3.")
            if (abs(val_num) > 10) return("Je Z-score is te groot. Controleer of je wel door σ deelde. De formule is (20 - 42.5) / 7.5 = -3.")
            return(paste0("Je gaf ", val, ", maar dit is fout. Gebruik de formule: Z = (X - μ) / σ = (20 - 42.5) / 7.5 = -3."))
          }

          # For z2_a (z-score for X = 25)
          wrong_msg_z2_a <- function(val) {
            val_num <- parse_num(val)
            if (is.na(val_num)) return("Je antwoord kon niet als getal geïnterpreteerd worden. Het juiste antwoord is -2.33.")
            
            if (abs(val_num - 2.33) < 0.05) return("Je gaf 2.33, maar dit is fout. Je hebt waarschijnlijk μ - x gebruikt in plaats van x - μ. De formule is (25 - 42.5) / 7.5 = -2.33.")
            if (abs(val_num - (-17.5)) < 0.5) return("Je gaf -17.5, maar dit is fout. Je vergat te delen door σ. De formule is (25 - 42.5) / 7.5 = -2.33.")
            if (abs(val_num - 17.5) < 0.5) return("Je gaf 17.5, maar dit is fout. Je vergat te delen door σ en gebruikte het verkeerde teken. De formule is (25 - 42.5) / 7.5 = -2.33.")
            if (abs(val_num) < 1) return("Je Z-score is te klein. Controleer of je door de juiste waarde deelde (σ = 7.5). De formule is (25 - 42.5) / 7.5 = -2.33.")
            if (abs(val_num) > 10) return("Je Z-score is te groot. Controleer of je wel door σ deelde. De formule is (25 - 42.5) / 7.5 = -2.33.")
            return(paste0("Je gaf ", val, ", maar dit is fout. Gebruik de formule: Z = (X - μ) / σ = (25 - 42.5) / 7.5 = -2.33."))
          }

          # For p_z1_a (P(Z ≤ -3))
          wrong_msg_p_z1_a <- function(val) {
            val_num <- parse_num(val)
            if (is.na(val_num)) return("Je antwoord kon niet als getal geïnterpreteerd worden. Het juiste antwoord is 0.0013.")
            
            if (abs(val_num - 0.9987) < 0.001) return("Je gaf 0.9987, maar dit is fout. Je nam het complement P(Z > -3) in plaats van P(Z ≤ -3). Zoek Z = -3 op in de tabel: P(Z ≤ -3) = 0.0013.")
            if (abs(val_num - 0.13) < 0.01 || abs(val_num - 13) < 1) return("Je gaf een percentage, maar hier moet je de kans als decimaal geven. P(Z ≤ -3) = 0.0013 (niet 0.13% of 13%).")
            if (abs(val_num - 1.3) < 0.1) return("Je hebt waarschijnlijk een komma en punt verwisseld. Het juiste antwoord is 0.0013.")
            return(paste0("Je gaf ", val, ", maar dit is fout. Zoek Z = -3 op in de standaardnormale tabel: P(Z ≤ -3) ≈ 0.0013."))
          }

          # For p_z2_a (P(Z ≤ -2.33))
          wrong_msg_p_z2_a <- function(val) {
            val_num <- parse_num(val)
            if (is.na(val_num)) return("Je antwoord kon niet als getal geïnterpreteerd worden. Het juiste antwoord is 0.0099.")
            
            if (abs(val_num - 0.9901) < 0.001) return("Je gaf 0.9901, maar dit is fout. Je nam het complement P(Z > -2.33) in plaats van P(Z ≤ -2.33). Zoek Z = -2.33 op in de tabel: P(Z ≤ -2.33) = 0.0099.")
            if (abs(val_num - 0.99) < 0.01 || abs(val_num - 99) < 1) return("Je gaf een percentage, maar hier moet je de kans als decimaal geven. P(Z ≤ -2.33) = 0.0099 (niet 0.99% of 99%).")
            if (abs(val_num - 9.9) < 0.1) return("Je hebt waarschijnlijk een komma en punt verwisseld. Het juiste antwoord is 0.0099.")
            return(paste0("Je gaf ", val, ", maar dit is fout. Zoek Z = -2.33 op in de standaardnormale tabel: P(Z ≤ -2.33) ≈ 0.0099."))
          }

          # For verschil_a (difference 0.0099 - 0.0013 = 0.0086)
          wrong_msg_verschil_a <- function(val) {
            val_num <- parse_num(val)
            if (is.na(val_num)) return("Je antwoord kon niet als getal geïnterpreteerd worden. Het juiste antwoord is 0.0086.")
            
            if (abs(val_num - (-0.0086)) < 0.001) return("Je gaf -0.0086, maar dit is fout. Je hebt de aftrekking omgekeerd: het moet 0.0099 - 0.0013 = 0.0086 zijn.")
            if (abs(val_num - 0.0112) < 0.001) return("Je gaf 0.0112, maar dit is fout. Je hebt de kansen opgeteld in plaats van afgetrokken: het moet 0.0099 - 0.0013 = 0.0086 zijn.")
            if (abs(val_num - 0.0013) < 0.001) return("Je gaf 0.0013, maar dit is fout. Je hebt alleen de eerste kans gebruikt. Bereken het verschil: 0.0099 - 0.0013 = 0.0086.")
            if (abs(val_num - 0.0099) < 0.001) return("Je gaf 0.0099, maar dit is fout. Je hebt alleen de tweede kans gebruikt. Bereken het verschil: 0.0099 - 0.0013 = 0.0086.")
            return(paste0("Je gaf ", val, ", maar dit is fout. Bereken het verschil tussen de twee kansen: 0.0099 - 0.0013 = 0.0086."))
          }

          # Feedback for wrong answers - question a
          wrong_msg_a <- function(val) {
            if (abs(val - 0.86) < 0.01) return("✅ Juist!")
            if (abs(val - 0.0086) < 0.001) return("Je gaf 0.0086, maar dit is fout. Geef het antwoord als **percentage** (0.86, niet 0.0086). Het juiste antwoord is 0.86.")
            if (abs(val - 86) < 1) return("Je gaf 86, maar dit is fout. Geef het antwoord als decimaal percentage (0.86, niet 86). Het juiste antwoord is 0.86.")
            if (abs(val - 0.13) < 0.01) return("Je gaf 0.13, maar dit is fout. Controleer je berekening. Het juiste antwoord is 0.86.")
            return(paste0("Je gaf ", val, ", maar dit is fout. Bereken handmatig: Z-scores, zoek kansen op in tabel, bereken verschil en zet om in %. Het juiste antwoord is 0.86."))
          }

          # Feedback for wrong answers - question b
          wrong_msg_b <- function(val) {
            val_num <- parse_num(val)
            if (is.na(val_num)) return("Je antwoord kon niet als getal geïnterpreteerd worden. Het juiste antwoord is 8.08%.")
            
            if (abs(val_num - 8.08) < 0.01) return("✅ Juist!")
            
            # Correct probability but needs percentage conversion
            if (abs(val_num - 0.0808) < 0.001) {
              return("Je gaf 0.0808, dit is de juiste kans in decimaalvorm, maar je moet het als percentage uitdrukken. **Stappen:** 1) Z = (32-42.5)/7.5 = -1.40, 2) P(Z ≤ -1.4) = 0.0808, 3) **0.0808 → 8.08%**. Het juiste antwoord is 8.08%.")
            }
            
            # Complement error
            if (abs(val_num - 91.92) < 0.1 || abs(val_num - 0.9192) < 0.001) {
              return("Je gaf een antwoord rond 91.92%, maar dit is fout. Je berekende P(X > 32) in plaats van P(X < 32). **Stappen:** 1) Z = (32-42.5)/7.5 = -1.40, 2) P(Z ≤ -1.4) = 0.0808 (niet het complement!), 3) 0.0808 → 8.08%. Het juiste antwoord is 8.08%.")
            }
            
            # Too large answers (double percentage conversion)
            if (val_num > 50) {
              return("Je antwoord is te groot (>50%). Voor X = 32 (ver onder het gemiddelde μ = 42.5) moet de kans klein zijn. **Stappen:** 1) Z = (32-42.5)/7.5 = -1.40, 2) P(Z ≤ -1.4) = 0.0808, 3) 0.0808 → 8.08%. Het juiste antwoord is 8.08%.")
            }
            
            # Generic wrong answer
            if (val_num < 8.08) {
              return(paste0("Je gaf ", val, "%, dit is te laag. Controleer je berekening: **Stappen:** 1) Z = (32-42.5)/7.5 = -1.40, 2) Zoek P(Z ≤ -1.4) ≈ 0.0808 in de tabel, 3) Zet om naar percentage: 8.08%. Het juiste antwoord is 8.08%."))
            } else {
              return(paste0("Je gaf ", val, "%, dit is te hoog. Controleer je berekening: **Stappen:** 1) Z = (32-42.5)/7.5 = -1.40, 2) Zoek P(Z ≤ -1.4) ≈ 0.0808 in de tabel, 3) Zet om naar percentage: 8.08%. Het juiste antwoord is 8.08%."))
            }
          }

          # Feedback for wrong answers - question c
          wrong_msg_c <- function(val) {
            val_num <- parse_num(val)
            if (is.na(val_num)) return("Je antwoord kon niet als getal geïnterpreteerd worden. Het juiste antwoord is 96.41%.")
            
            if (abs(val_num - 96.41) < 0.01) return("✅ Juist!")
            
            # Correct probability but needs percentage conversion
            if (abs(val_num - 0.9641) < 0.001) {
              return("Je gaf 0.9641, dit is de juiste kans in decimaalvorm, maar je moet het als percentage uitdrukken. **Stappen:** 1) Z = (29-42.5)/7.5 = -1.80, 2) P(Z ≤ -1.8) = 0.0359, 3) P(X > 29) = 1 - 0.0359 = 0.9641, 4) **0.9641 → 96.41%**. Het juiste antwoord is 96.41%.")
            }
            
            # Forgot complement
            if (abs(val_num - 3.59) < 0.1 || abs(val_num - 0.0359) < 0.001) {
              return("Je gaf een antwoord rond 3.59%, maar dit is fout. Je berekende P(X < 29) en vergat het complement te nemen voor P(X > 29). **Stappen:** 1) Z = (29-42.5)/7.5 = -1.80, 2) P(Z ≤ -1.8) = 0.0359, 3) **P(X > 29) = 1 - 0.0359 = 0.9641**, 4) 96.41%. Het juiste antwoord is 96.41%.")
            }
            
            # Answer too small (probably wrong tail or missed complement)
            if (val_num < 50) {
              return(paste0("Je gaf ", val, "%, dit is te laag. Je hebt waarschijnlijk de verkeerde staart gebruikt of het complement vergeten. **Stappen:** 1) Z = (29-42.5)/7.5 = -1.80, 2) P(Z ≤ -1.8) = 0.0359, 3) P(X > 29) = 1 - 0.0359 = 0.9641, 4) 96.41%. Het juiste antwoord is 96.41%."))
            }
            
            # Answer > 100% (impossible)
            if (val_num > 100) {
              return("Je antwoord is groter dan 100%, maar kansen kunnen niet meer dan 100% zijn. Je hebt waarschijnlijk een keer te vaak met 100 vermenigvuldigd. **Stappen:** 1) Z = (29-42.5)/7.5 = -1.80, 2) P(Z ≤ -1.8) = 0.0359, 3) P(X > 29) = 1 - 0.0359 = 0.9641, 4) 96.41%. Het juiste antwoord is 96.41%.")
            }
            
            # Generic wrong answer
            return(paste0("Je gaf ", val, "%. Controleer je berekening stap voor stap: **Stappen:** 1) Z = (29-42.5)/7.5 = -1.80, 2) Zoek P(Z ≤ -1.8) ≈ 0.0359 in de tabel, 3) P(X > 29) = 1 - 0.0359 = 0.9641, 4) Zet om naar percentage: 96.41%. Het juiste antwoord is 96.41%."))
          }

          # Build feedback string directly with proper line breaks
          feedback_text <- "**Resultaten per vraag:**\n\n"
          
          # Question A - all steps
          feedback_text <- paste0(feedback_text, "**Vraag A:**\n")
          for (q in c("z1_a", "z2_a", "p_z1_a", "p_z2_a", "verschil_a", "vraag_a")) {
            if (results[[q]]$exists) {
              if (results[[q]]$correct) {
                feedback_text <- paste0(feedback_text, "✅ ", qnames[[q]], " **Correct! (", results[[q]]$value, ")**\n\n")
              } else {
                # Use specific diagnostic functions for each step
                if (q == "z1_a") msg <- wrong_msg_z1_a(results[[q]]$value)
                else if (q == "z2_a") msg <- wrong_msg_z2_a(results[[q]]$value)
                else if (q == "p_z1_a") msg <- wrong_msg_p_z1_a(results[[q]]$value)
                else if (q == "p_z2_a") msg <- wrong_msg_p_z2_a(results[[q]]$value)
                else if (q == "verschil_a") msg <- wrong_msg_verschil_a(results[[q]]$value)
                else if (q == "vraag_a") msg <- wrong_msg_a(results[[q]]$value)
                else msg <- paste0("Je gaf ", results[[q]]$value, ", maar dit is fout. Het juiste antwoord is ", results[[q]]$expected, ".")
                
                feedback_text <- paste0(feedback_text, "❌ ", qnames[[q]], " **Fout.** ", msg, "\n\n")
              }
            } else {
              feedback_text <- paste0(feedback_text, "❌ ", qnames[[q]], " **Je hebt geen antwoord gegeven.**\n\n")
            }
          }
          
          # Question B
          feedback_text <- paste0(feedback_text, "**Vraag B:**\n")
          q <- "vraag_b"
          if (results[[q]]$exists) {
            if (results[[q]]$correct) {
              feedback_text <- paste0(feedback_text, "✅ ", qnames[[q]], " **Correct! (", results[[q]]$value, ")**\n\n")
            } else {
              msg <- wrong_msg_b(results[[q]]$value)
              feedback_text <- paste0(feedback_text, "❌ ", qnames[[q]], " **Fout.** ", msg, "\n\n")
            }
          } else {
            feedback_text <- paste0(feedback_text, "❌ ", qnames[[q]], " **Je hebt geen antwoord gegeven.**\n\n")
          }
          
          # Question C
          feedback_text <- paste0(feedback_text, "**Vraag C:**\n")
          q <- "vraag_c"
          if (results[[q]]$exists) {
            if (results[[q]]$correct) {
              feedback_text <- paste0(feedback_text, "✅ ", qnames[[q]], " **Correct! (", results[[q]]$value, ")**\n\n")
            } else {
              msg <- wrong_msg_c(results[[q]]$value)
              feedback_text <- paste0(feedback_text, "❌ ", qnames[[q]], " **Fout.** ", msg, "\n\n")
            }
          } else {
            feedback_text <- paste0(feedback_text, "❌ ", qnames[[q]], " **Je hebt geen antwoord gegeven.**\n\n")
          }

          get_reporter()$add_message(feedback_text, type = "markdown")
          generated == expected
        }
      )
    }
  )
})
