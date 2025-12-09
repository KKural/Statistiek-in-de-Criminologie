context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          results <- list()

          # Expected correct answers - MATHEMATICALLY PRECISE
          exp_z1_a <- -3.0                    # (20 - 42.5) / 7.5 = -22.5/7.5 = -3.0 exactly
          exp_z2_a <- round(-17.5/7.5, 2)    # (25 - 42.5) / 7.5 = -17.5/7.5 = -2.33 (rounded)
          exp_p_z1_a <- 0.0013               # P(Z ≤ -3.0) from table
          exp_p_z2_a <- 0.0099               # P(Z ≤ -2.33) from table
          exp_verschil_a <- 0.0086           # 0.0099 - 0.0013
          exp_a <- 0.86                      # 0.0086 * 100
          
          # Question B - P(X < 32) - MATHEMATICALLY PRECISE
          exp_z1_b <- round(-10.5/7.5, 2)    # (32 - 42.5) / 7.5 = -10.5/7.5 = -1.40 exactly
          exp_p_z1_b <- 0.0808               # P(Z ≤ -1.40) from table
          exp_b <- 8.08                      # 0.0808 * 100
          
          # Question C - P(X > 29) - MATHEMATICALLY PRECISE
          exp_z1_c <- round(-13.5/7.5, 2)    # (29 - 42.5) / 7.5 = -13.5/7.5 = -1.80 exactly
          exp_p_z1_c <- 0.0359               # P(Z ≤ -1.80) from table
          exp_complement_c <- 0.9641  # 1 - 0.0359
          exp_c <- 96.41       # 0.9641 * 100

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

          # Check all answers for question a (all steps) - PRECISE MATCHING
          results$z1_a <- check_value("z1_a", exp_z1_a, tol = 0.001)
          results$z2_a <- check_value("z2_a", exp_z2_a, tol = 0.001)
          results$p_z1_a <- check_value("p_z1_a", exp_p_z1_a, tol = 0.0001)
          results$p_z2_a <- check_value("p_z2_a", exp_p_z2_a, tol = 0.0001)
          results$verschil_a <- check_value("verschil_a", exp_verschil_a, tol = 0.0001)
          results$vraag_a <- check_value("vraag_a", exp_a, tol = 0.001, expect_percent = FALSE)
          
          # Check only final answers for questions B and C - PRECISE MATCHING
          results$vraag_b <- check_value("vraag_b", exp_b, tol = 0.001, expect_percent = FALSE)
          results$vraag_c <- check_value("vraag_c", exp_c, tol = 0.001, expect_percent = FALSE)

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
            
            if (abs(val_num - 2.33) < 0.01) return("Je gaf 2.33, maar dit is fout. Je hebt waarschijnlijk μ - x gebruikt in plaats van x - μ. De formule is (25 - 42.5) / 7.5 = -2.33.")
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
            
            if (abs(val_num - 0.9987) < 0.0001) return("Je gaf 0.9987, maar dit is fout. Je nam het complement P(Z > -3) in plaats van P(Z ≤ -3). **Formule:** P(Z ≤ z) uit tabel. Zoek Z = -3 op in de tabel: P(Z ≤ -3) = 0.0013.")
            if (abs(val_num - 0.13) < 0.001 || abs(val_num - 13) < 0.1) return("Je gaf een percentage, maar hier moet je de kans als decimaal geven. **Formule:** P(Z ≤ z) uit tabel. P(Z ≤ -3) = 0.0013 (niet 0.13% of 13%).")
            if (abs(val_num - 1.3) < 0.01) return("Je hebt waarschijnlijk een komma en punt verwisseld. **Formule:** P(Z ≤ z) uit tabel. Het juiste antwoord is 0.0013.")
            return(paste0("Je gaf ", val, ", maar dit is fout. **Formule:** P(Z ≤ z) uit standaardnormale tabel. Zoek Z = -3 op: P(Z ≤ -3) ≈ 0.0013."))
          }

          # For p_z2_a (P(Z ≤ -2.33))
          wrong_msg_p_z2_a <- function(val) {
            val_num <- parse_num(val)
            if (is.na(val_num)) return("Je antwoord kon niet als getal geïnterpreteerd worden. Het juiste antwoord is 0.0099.")
            
            if (abs(val_num - 0.9901) < 0.0001) return("Je gaf 0.9901, maar dit is fout. Je nam het complement P(Z > -2.33) in plaats van P(Z ≤ -2.33). **Formule:** P(Z ≤ z) uit tabel. Zoek Z = -2.33 op in de tabel: P(Z ≤ -2.33) = 0.0099.")
            if (abs(val_num - 0.99) < 0.001 || abs(val_num - 99) < 0.1) return("Je gaf een percentage, maar hier moet je de kans als decimaal geven. **Formule:** P(Z ≤ z) uit tabel. P(Z ≤ -2.33) = 0.0099 (niet 0.99% of 99%).")
            if (abs(val_num - 9.9) < 0.01) return("Je hebt waarschijnlijk een komma en punt verwisseld. **Formule:** P(Z ≤ z) uit tabel. Het juiste antwoord is 0.0099.")
            return(paste0("Je gaf ", val, ", maar dit is fout. **Formule:** P(Z ≤ z) uit standaardnormale tabel. Zoek Z = -2.33 op: P(Z ≤ -2.33) ≈ 0.0099."))
          }

          # For verschil_a (difference 0.0099 - 0.0013 = 0.0086)
          wrong_msg_verschil_a <- function(val) {
            val_num <- parse_num(val)
            if (is.na(val_num)) return("Je antwoord kon niet als getal geïnterpreteerd worden. Het juiste antwoord is 0.0086.")
            
            if (abs(val_num - (-0.0086)) < 0.0001) return("Je gaf -0.0086, maar dit is fout. Je hebt de aftrekking omgekeerd. **Formule:** P(20 < X < 25) = P(X < 25) - P(X < 20). Het moet 0.0099 - 0.0013 = 0.0086 zijn.")
            if (abs(val_num - 0.0112) < 0.0001) return("Je gaf 0.0112, maar dit is fout. Je hebt de kansen opgeteld in plaats van afgetrokken. **Formule:** P(20 < X < 25) = P(X < 25) - P(X < 20). Het moet 0.0099 - 0.0013 = 0.0086 zijn.")
            if (abs(val_num - 0.0013) < 0.0001) return("Je gaf 0.0013, maar dit is fout. Je hebt alleen de eerste kans gebruikt. **Formule:** P(20 < X < 25) = P(X < 25) - P(X < 20). Bereken het verschil: 0.0099 - 0.0013 = 0.0086.")
            if (abs(val_num - 0.0099) < 0.0001) return("Je gaf 0.0099, maar dit is fout. Je hebt alleen de tweede kans gebruikt. **Formule:** P(20 < X < 25) = P(X < 25) - P(X < 20). Bereken het verschil: 0.0099 - 0.0013 = 0.0086.")
            return(paste0("Je gaf ", val, ", maar dit is fout. **Formule:** P(20 < X < 25) = P(X < 25) - P(X < 20). Bereken het verschil: 0.0099 - 0.0013 = 0.0086."))
          }

          # Feedback for wrong answers - question a
          wrong_msg_a <- function(val) {
            val_num <- parse_num(val)
            if (is.na(val_num)) return("Je antwoord kon niet als getal geïnterpreteerd worden. Het juiste antwoord is 0.86.")
            
            if (abs(val_num - 0.86) < 0.001) return("✅ Juist!")
            if (abs(val_num - 0.0086) < 0.0001) return("Je gaf 0.0086, maar dit is fout. Dit is de kans in decimaalvorm. **Formule:** Percentage = kans × 100. Zet om naar percentage: 0.0086 × 100 = 0.86. Het juiste antwoord is 0.86.")
            if (abs(val_num - 86) < 0.1) return("Je gaf 86, maar dit is fout. Je vermenigvuldigde een keer te veel met 100. **Formule:** Percentage = kans × 100. Het juiste antwoord is 0.86.")
            if (abs(val_num - 0.13) < 0.001) return("Je gaf 0.13, maar dit is fout. Controleer je berekening van het verschil. **Formule:** P(a < X < b) = P(X < b) - P(X < a), dan × 100 voor percentage. Het juiste antwoord is 0.86.")
            return(paste0("Je gaf ", val, ", maar dit is fout. **Formules:** Z = (X - μ)/σ, P(Z ≤ z) uit tabel, P(a < X < b) = P(X < b) - P(X < a), Percentage = kans × 100. Het juiste antwoord is 0.86."))
          }

          # For z1_b (z-score for X = 32)
          wrong_msg_z1_b <- function(val) {
            val_num <- parse_num(val)
            if (is.na(val_num)) return("Je antwoord kon niet als getal geïnterpreteerd worden. Het juiste antwoord is -1.40.")
            
            if (abs(val_num - 1.40) < 0.05) return("Je gaf 1.40, maar dit is fout. Je hebt waarschijnlijk μ - x gebruikt in plaats van x - μ. **Formule:** Z = (X - μ)/σ = (32 - 42.5) / 7.5 = -1.40.")
            if (abs(val_num - (-10.5)) < 0.5) return("Je gaf -10.5, maar dit is fout. Je vergat te delen door σ. **Formule:** Z = (X - μ)/σ = (32 - 42.5) / 7.5 = -1.40.")
            if (abs(val_num - 10.5) < 0.5) return("Je gaf 10.5, maar dit is fout. Je vergat te delen door σ en gebruikte het verkeerde teken. **Formule:** Z = (X - μ)/σ = (32 - 42.5) / 7.5 = -1.40.")
            if (abs(val_num) < 0.5) return("Je Z-score is te klein. Controleer of je door de juiste waarde deelde (σ = 7.5). **Formule:** Z = (X - μ)/σ = (32 - 42.5) / 7.5 = -1.40.")
            if (abs(val_num) > 5) return("Je Z-score is te groot. Controleer of je wel door σ deelde. **Formule:** Z = (X - μ)/σ = (32 - 42.5) / 7.5 = -1.40.")
            return(paste0("Je gaf ", val, ", maar dit is fout. **Formule:** Z = (X - μ)/σ = (32 - 42.5) / 7.5 = -1.40."))
          }

          # For p_z1_b (P(Z ≤ -1.40))
          wrong_msg_p_z1_b <- function(val) {
            val_num <- parse_num(val)
            if (is.na(val_num)) return("Je antwoord kon niet als getal geïnterpreteerd worden. Het juiste antwoord is 0.0808.")
            
            if (abs(val_num - 0.9192) < 0.001) return("Je gaf 0.9192, maar dit is fout. Je nam het complement P(Z > -1.40) in plaats van P(Z ≤ -1.40). **Formule:** P(Z ≤ z) uit tabel. Zoek Z = -1.40 op in de tabel: P(Z ≤ -1.40) = 0.0808.")
            if (abs(val_num - 8.08) < 0.1 || abs(val_num - 80.8) < 1) return("Je gaf een percentage, maar hier moet je de kans als decimaal geven. **Formule:** P(Z ≤ z) uit tabel. P(Z ≤ -1.40) = 0.0808 (niet 8.08% of 80.8%).")
            if (abs(val_num - 80.8) < 1) return("Je hebt waarschijnlijk een komma en punt verwisseld. **Formule:** P(Z ≤ z) uit tabel. Het juiste antwoord is 0.0808.")
            return(paste0("Je gaf ", val, ", maar dit is fout. **Formule:** P(Z ≤ z) uit standaardnormale tabel. Zoek Z = -1.40 op: P(Z ≤ -1.40) ≈ 0.0808."))
          }

          # Comprehensive feedback for wrong answers - question b
          wrong_msg_b <- function(val) {
            val_num <- parse_num(val)
            if (is.na(val_num)) return("Je antwoord kon niet als getal geïnterpreteerd worden. Het juiste antwoord is 8.08.")
            
            if (abs(val_num - 8.08) < 0.001) return("✅ Juist!")
            
            # Analyze what went wrong based on the final answer and provide step-by-step guidance
            
            # Correct probability but needs percentage conversion
            if (abs(val_num - 0.0808) < 0.0001) {
              return("Je vergat te vermenigvuldigen met 100.\n\nStap 1: Z = (32-42.5)/7.5 = -1.40\n\nStap 2: P(Z ≤ -1.40) = 0.0808\n\nStap 3: 0.0808 × 100 = 8.08")
            }
            
            # Complement error (got P(X > 32) instead of P(X < 32))
            if (abs(val_num - 91.92) < 0.01 || abs(val_num - 0.9192) < 0.0001) {
              return("Je berekende P(X > 32) in plaats van P(X < 32).\n\nStap 1: Z = (32-42.5)/7.5 = -1.40\n\nStap 2: P(Z ≤ -1.40) = 0.0808 (niet het complement!)\n\nStap 3: 0.0808 × 100 = 8.08")
            }
            
            # Wrong Z-score calculation (probably used positive Z)
            if (abs(val_num - 91.08) < 0.1) {
              return("Je gebruikte +1.40 in plaats van -1.40.\n\nStap 1: Z = (32-42.5)/7.5 = -1.40\n\nStap 2: P(Z ≤ -1.40) = 0.0808\n\nStap 3: 0.0808 × 100 = 8.08")
            }
            
            # Used wrong formula (probably calculated difference from mean)
            if (abs(val_num - 140) < 1) {
              return("Je vergat te delen door σ.\n\nStap 1: Z = (32-42.5)/7.5 = -1.40\n\nStap 2: P(Z ≤ -1.40) = 0.0808\n\nStap 3: 0.0808 × 100 = 8.08")
            }
            
            # Generic guidance based on answer range
            if (val_num < 0.1) {
              return("Je antwoord is veel te klein.\n\nStap 1: Z = (32-42.5)/7.5 = -1.40\n\nStap 2: P(Z ≤ -1.40) = 0.0808\n\nStap 3: 0.0808 × 100 = 8.08")
            } else if (val_num > 50) {
              return("Je antwoord is veel te groot. Voor X = 32 (onder gemiddelde) moet de kans klein zijn.\n\nStap 1: Z = (32-42.5)/7.5 = -1.40\n\nStap 2: P(Z ≤ -1.40) = 0.0808\n\nStap 3: 0.0808 × 100 = 8.08")
            } else {
              return("Stap 1: Z = (32-42.5)/7.5 = -1.40\n\nStap 2: Zoek P(Z ≤ -1.40) ≈ 0.0808 in de tabel\n\nStap 3: 0.0808 × 100 = 8.08")
            }
          }

          # For z1_c (z-score for X = 29)
          wrong_msg_z1_c <- function(val) {
            val_num <- parse_num(val)
            if (is.na(val_num)) return("Je antwoord kon niet als getal geïnterpreteerd worden. Het juiste antwoord is -1.80.")
            
            if (abs(val_num - 1.80) < 0.05) return("Je gaf 1.80, maar dit is fout. Je hebt waarschijnlijk μ - x gebruikt in plaats van x - μ. **Formule:** Z = (X - μ)/σ = (29 - 42.5) / 7.5 = -1.80.")
            if (abs(val_num - (-13.5)) < 0.5) return("Je gaf -13.5, maar dit is fout. Je vergat te delen door σ. **Formule:** Z = (X - μ)/σ = (29 - 42.5) / 7.5 = -1.80.")
            if (abs(val_num - 13.5) < 0.5) return("Je gaf 13.5, maar dit is fout. Je vergat te delen door σ en gebruikte het verkeerde teken. **Formule:** Z = (X - μ)/σ = (29 - 42.5) / 7.5 = -1.80.")
            if (abs(val_num) < 0.5) return("Je Z-score is te klein. Controleer of je door de juiste waarde deelde (σ = 7.5). **Formule:** Z = (X - μ)/σ = (29 - 42.5) / 7.5 = -1.80.")
            if (abs(val_num) > 5) return("Je Z-score is te groot. Controleer of je wel door σ deelde. **Formule:** Z = (X - μ)/σ = (29 - 42.5) / 7.5 = -1.80.")
            return(paste0("Je gaf ", val, ", maar dit is fout. **Formule:** Z = (X - μ)/σ = (29 - 42.5) / 7.5 = -1.80."))
          }

          # For p_z1_c (P(Z ≤ -1.80))
          wrong_msg_p_z1_c <- function(val) {
            val_num <- parse_num(val)
            if (is.na(val_num)) return("Je antwoord kon niet als getal geïnterpreteerd worden. Het juiste antwoord is 0.0359.")
            
            if (abs(val_num - 0.9641) < 0.001) return("Je gaf 0.9641, maar dit is fout. Je nam het complement P(Z > -1.80) in plaats van P(Z ≤ -1.80). **Formule:** P(Z ≤ z) uit tabel. Zoek Z = -1.80 op in de tabel: P(Z ≤ -1.80) = 0.0359.")
            if (abs(val_num - 3.59) < 0.1 || abs(val_num - 35.9) < 1) return("Je gaf een percentage, maar hier moet je de kans als decimaal geven. **Formule:** P(Z ≤ z) uit tabel. P(Z ≤ -1.80) = 0.0359 (niet 3.59% of 35.9%).")
            if (abs(val_num - 35.9) < 1) return("Je hebt waarschijnlijk een komma en punt verwisseld. **Formule:** P(Z ≤ z) uit tabel. Het juiste antwoord is 0.0359.")
            return(paste0("Je gaf ", val, ", maar dit is fout. **Formule:** P(Z ≤ z) uit standaardnormale tabel. Zoek Z = -1.80 op: P(Z ≤ -1.80) ≈ 0.0359."))
          }

          # For complement_c (1 - 0.0359 = 0.9641)
          wrong_msg_complement_c <- function(val) {
            val_num <- parse_num(val)
            if (is.na(val_num)) return("Je antwoord kon niet als getal geïnterpreteerd worden. Het juiste antwoord is 0.9641.")
            
            if (abs(val_num - 0.0359) < 0.0001) return("Je gaf 0.0359, maar dit is fout. Je hebt het complement niet berekend. **Formule:** P(X > a) = 1 - P(X < a). Bereken: 1 - 0.0359 = 0.9641.")
            if (abs(val_num - (-0.0359)) < 0.0001) return("Je gaf -0.0359, maar dit is fout. Je hebt waarschijnlijk verkeerd afgetrokken. **Formule:** P(X > a) = 1 - P(X < a). Bereken: 1 - 0.0359 = 0.9641.")
            if (abs(val_num - 1.0359) < 0.0001) return("Je gaf 1.0359, maar dit is fout. Je hebt opgeteld in plaats van afgetrokken. **Formule:** P(X > a) = 1 - P(X < a). Bereken: 1 - 0.0359 = 0.9641.")
            return(paste0("Je gaf ", val, ", maar dit is fout. **Formule:** P(X > a) = 1 - P(X < a). Bereken het complement: 1 - 0.0359 = 0.9641."))
          }

          # Comprehensive feedback for wrong answers - question c
          wrong_msg_c <- function(val) {
            val_num <- parse_num(val)
            if (is.na(val_num)) return("Je antwoord kon niet als getal geïnterpreteerd worden. Het juiste antwoord is 96.41.")
            
            if (abs(val_num - 96.41) < 0.001) return("✅ Juist!")
            
            # Analyze what went wrong based on the final answer and provide step-by-step guidance
            
            # Correct probability but needs percentage conversion
            if (abs(val_num - 0.9641) < 0.0001) {
              return("Je vergat te vermenigvuldigen met 100.\n\nStap 1: Z = (29-42.5)/7.5 = -1.80\n\nStap 2: P(Z ≤ -1.80) = 0.0359\n\nStap 3: P(X > 29) = 1 - 0.0359 = 0.9641\n\nStap 4: 0.9641 × 100 = 96.41")
            }
            
            # Forgot to take complement (got P(X < 29) instead of P(X > 29))
            if (abs(val_num - 3.59) < 0.01 || abs(val_num - 0.0359) < 0.0001) {
              return("Je vergat het complement te nemen voor P(X > 29).\n\nStap 1: Z = (29-42.5)/7.5 = -1.80\n\nStap 2: P(Z ≤ -1.80) = 0.0359\n\nStap 3: P(X > 29) = 1 - 0.0359 = 0.9641\n\nStap 4: 0.9641 × 100 = 96.41")
            }
            
            # Used positive Z-score (got P(X > 29) with wrong Z)
            if (abs(val_num - 4.41) < 0.1) {
              return("Je gebruikte +1.80 in plaats van -1.80.\n\nStap 1: Z = (29-42.5)/7.5 = -1.80\n\nStap 2: P(Z ≤ -1.80) = 0.0359\n\nStap 3: P(X > 29) = 1 - 0.0359 = 0.9641\n\nStap 4: 0.9641 × 100 = 96.41")
            }
            
            # Calculated wrong direction but got complement right
            if (abs(val_num - 95.59) < 0.1) {
              return("Controleer de exacte waarde in de Z-tabel.\n\nStap 1: Z = (29-42.5)/7.5 = -1.80\n\nStap 2: P(Z ≤ -1.80) = 0.0359\n\nStap 3: P(X > 29) = 1 - 0.0359 = 0.9641\n\nStap 4: 0.9641 × 100 = 96.41")
            }
            
            # Answer > 100% (impossible)
            if (val_num > 100) {
              return("Kansen kunnen niet meer dan 100% zijn!\n\nStap 1: Z = (29-42.5)/7.5 = -1.80\n\nStap 2: P(Z ≤ -1.80) = 0.0359\n\nStap 3: P(X > 29) = 1 - 0.0359 = 0.9641\n\nStap 4: 0.9641 × 100 = 96.41")
            }
            
            # Generic guidance based on answer range
            if (val_num < 50) {
              return("Je antwoord is te laag. Vergat je het complement te nemen?\n\nStap 1: Z = (29-42.5)/7.5 = -1.80\n\nStap 2: P(Z ≤ -1.80) = 0.0359\n\nStap 3: P(X > 29) = 1 - 0.0359 = 0.9641\n\nStap 4: 0.9641 × 100 = 96.41")
            } else {
              return("Stap 1: Z = (29-42.5)/7.5 = -1.80\n\nStap 2: Zoek P(Z ≤ -1.80) ≈ 0.0359 in de tabel\n\nStap 3: P(X > 29) = 1 - 0.0359 = 0.9641\n\nStap 4: 0.9641 × 100 = 96.41")
            }
          }

          # Build feedback string with clean formatting and proper spacing
          feedback_text <- "**Resultaten per vraag:**\n\n"
          
          # Question A - all steps with spacing
          feedback_text <- paste0(feedback_text, "**Vraag A:**\n\n")
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
          
          # Question B - final answer only with clean formatting
          feedback_text <- paste0(feedback_text, "**Vraag B:**\n\n")
          q <- "vraag_b"
          if (results[[q]]$exists) {
            if (results[[q]]$correct) {
              feedback_text <- paste0(feedback_text, "✅ ", qnames[[q]], " **Correct! (", results[[q]]$value, ")**\n\n")
            } else {
              msg <- wrong_msg_b(results[[q]]$value)
              feedback_text <- paste0(feedback_text, "❌ ", qnames[[q]], " **Fout.**\n\n", msg, "\n\n")
            }
          } else {
            feedback_text <- paste0(feedback_text, "❌ ", qnames[[q]], " **Je hebt geen antwoord gegeven.**\n\nStap 1: Z = (32-42.5)/7.5 = -1.40\n\nStap 2: P(Z ≤ -1.40) = 0.0808\n\nStap 3: 0.0808 × 100 = 8.08\n\n")
          }
          
          # Question C - final answer only with clean formatting
          feedback_text <- paste0(feedback_text, "**Vraag C:**\n\n")
          q <- "vraag_c"
          if (results[[q]]$exists) {
            if (results[[q]]$correct) {
              feedback_text <- paste0(feedback_text, "✅ ", qnames[[q]], " **Correct! (", results[[q]]$value, ")**\n\n")
            } else {
              msg <- wrong_msg_c(results[[q]]$value)
              feedback_text <- paste0(feedback_text, "❌ ", qnames[[q]], " **Fout.**\n\n", msg, "\n\n")
            }
          } else {
            feedback_text <- paste0(feedback_text, "❌ ", qnames[[q]], " **Je hebt geen antwoord gegeven.**\n\nStap 1: Z = (29-42.5)/7.5 = -1.80\n\nStap 2: P(Z ≤ -1.80) = 0.0359\n\nStap 3: P(X > 29) = 1 - 0.0359 = 0.9641\n\nStap 4: 0.9641 × 100 = 96.41\n\n")
          }

          get_reporter()$add_message(feedback_text, type = "markdown")
          generated == expected
        }
      )
    }
  )
})
