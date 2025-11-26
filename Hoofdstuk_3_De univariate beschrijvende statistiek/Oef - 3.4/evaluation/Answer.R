context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          # Use the provided environment (env) instead of globalenv()
          results <- list()
          
          # -----------------------------
          # STAP 1: FREQUENTIETABEL
          # -----------------------------
          
          # Frequenties
          if (exists("freq_2", envir = env)) {
            current_val <- get("freq_2", envir = env)
            results$freq_2 <- list(
              exists = TRUE,
              value = current_val,
              correct = as.numeric(current_val) == 1,
              expected = 1
            )
          } else {
            results$freq_2 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 1)
          }
          
          if (exists("freq_14", envir = env)) {
            current_val <- get("freq_14", envir = env)
            results$freq_14 <- list(
              exists = TRUE,
              value = current_val,
              correct = as.numeric(current_val) == 1,
              expected = 1
            )
          } else {
            results$freq_14 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 1)
          }
          
          if (exists("freq_26", envir = env)) {
            current_val <- get("freq_26", envir = env)
            results$freq_26 <- list(
              exists = TRUE,
              value = current_val,
              correct = as.numeric(current_val) == 1,
              expected = 1
            )
          } else {
            results$freq_26 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 1)
          }
          
          if (exists("freq_30", envir = env)) {
            current_val <- get("freq_30", envir = env)
            results$freq_30 <- list(
              exists = TRUE,
              value = current_val,
              correct = as.numeric(current_val) == 1,
              expected = 1
            )
          } else {
            results$freq_30 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 1)
          }
          
          if (exists("freq_72", envir = env)) {
            current_val <- get("freq_72", envir = env)
            results$freq_72 <- list(
              exists = TRUE,
              value = current_val,
              correct = as.numeric(current_val) == 1,
              expected = 1
            )
          } else {
            results$freq_72 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 1)
          }
          
          if (exists("freq_143", envir = env)) {
            current_val <- get("freq_143", envir = env)
            results$freq_143 <- list(
              exists = TRUE,
              value = current_val,
              correct = as.numeric(current_val) == 1,
              expected = 1
            )
          } else {
            results$freq_143 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 1)
          }
          
          if (exists("freq_144", envir = env)) {
            current_val <- get("freq_144", envir = env)
            results$freq_144 <- list(
              exists = TRUE,
              value = current_val,
              correct = as.numeric(current_val) == 1,
              expected = 1
            )
          } else {
            results$freq_144 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 1)
          }
          
          if (exists("freq_150", envir = env)) {
            current_val <- get("freq_150", envir = env)
            results$freq_150 <- list(
              exists = TRUE,
              value = current_val,
              correct = as.numeric(current_val) == 2,
              expected = 2
            )
          } else {
            results$freq_150 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 2)
          }
          
          if (exists("freq_240", envir = env)) {
            current_val <- get("freq_240", envir = env)
            results$freq_240 <- list(
              exists = TRUE,
              value = current_val,
              correct = as.numeric(current_val) == 1,
              expected = 1
            )
          } else {
            results$freq_240 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 1)
          }
          
          if (exists("freq_1657", envir = env)) {
            current_val <- get("freq_1657", envir = env)
            results$freq_1657 <- list(
              exists = TRUE,
              value = current_val,
              correct = as.numeric(current_val) == 1,
              expected = 1
            )
          } else {
            results$freq_1657 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 1)
          }
          
          # Percentages
          if (exists("percent_2", envir = env)) {
            current_val <- as.numeric(get("percent_2", envir = env))
            results$percent_2 <- list(
              exists = TRUE,
              value = current_val,
              correct = abs(current_val - 9.1) < 0.1,
              expected = 9.1
            )
          } else {
            results$percent_2 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 9.1)
          }
          
          if (exists("percent_14", envir = env)) {
            current_val <- as.numeric(get("percent_14", envir = env))
            results$percent_14 <- list(
              exists = TRUE,
              value = current_val,
              correct = abs(current_val - 9.1) < 0.1,
              expected = 9.1
            )
          } else {
            results$percent_14 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 9.1)
          }
          
          if (exists("percent_26", envir = env)) {
            current_val <- as.numeric(get("percent_26", envir = env))
            results$percent_26 <- list(
              exists = TRUE,
              value = current_val,
              correct = abs(current_val - 9.1) < 0.1,
              expected = 9.1
            )
          } else {
            results$percent_26 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 9.1)
          }
          
          if (exists("percent_30", envir = env)) {
            current_val <- as.numeric(get("percent_30", envir = env))
            results$percent_30 <- list(
              exists = TRUE,
              value = current_val,
              correct = abs(current_val - 9.1) < 0.1,
              expected = 9.1
            )
          } else {
            results$percent_30 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 9.1)
          }
          
          if (exists("percent_72", envir = env)) {
            current_val <- as.numeric(get("percent_72", envir = env))
            results$percent_72 <- list(
              exists = TRUE,
              value = current_val,
              correct = abs(current_val - 9.1) < 0.1,
              expected = 9.1
            )
          } else {
            results$percent_72 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 9.1)
          }
          
          if (exists("percent_143", envir = env)) {
            current_val <- as.numeric(get("percent_143", envir = env))
            results$percent_143 <- list(
              exists = TRUE,
              value = current_val,
              correct = abs(current_val - 9.1) < 0.1,
              expected = 9.1
            )
          } else {
            results$percent_143 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 9.1)
          }
          
          if (exists("percent_144", envir = env)) {
            current_val <- as.numeric(get("percent_144", envir = env))
            results$percent_144 <- list(
              exists = TRUE,
              value = current_val,
              correct = abs(current_val - 9.1) < 0.1,
              expected = 9.1
            )
          } else {
            results$percent_144 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 9.1)
          }
          
          if (exists("percent_150", envir = env)) {
            current_val <- as.numeric(get("percent_150", envir = env))
            results$percent_150 <- list(
              exists = TRUE,
              value = current_val,
              correct = abs(current_val - 18.2) < 0.1,
              expected = 18.2
            )
          } else {
            results$percent_150 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 18.2)
          }
          
          if (exists("percent_240", envir = env)) {
            current_val <- as.numeric(get("percent_240", envir = env))
            results$percent_240 <- list(
              exists = TRUE,
              value = current_val,
              correct = abs(current_val - 9.1) < 0.1,
              expected = 9.1
            )
          } else {
            results$percent_240 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 9.1)
          }
          
          if (exists("percent_1657", envir = env)) {
            current_val <- as.numeric(get("percent_1657", envir = env))
            results$percent_1657 <- list(
              exists = TRUE,
              value = current_val,
              correct = abs(current_val - 9.1) < 0.1,
              expected = 9.1
            )
          } else {
            results$percent_1657 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 9.1)
          }
          
          # -----------------------------
          # STAP 2: CENTRALITEITSMATEN
          # -----------------------------
          
          if (exists("gemiddelde", envir = env)) {
            current_val <- as.numeric(get("gemiddelde", envir = env))
            results$gemiddelde <- list(
              exists = TRUE,
              value = current_val,
              correct = abs(current_val - 238.91) < 0.01,
              expected = 238.91
            )
          } else {
            results$gemiddelde <- list(exists = FALSE, value = NA, correct = FALSE, expected = 238.91)
          }
          
          if (exists("mediaan", envir = env)) {
            current_val <- as.numeric(get("mediaan", envir = env))
            results$mediaan <- list(
              exists = TRUE,
              value = current_val,
              correct = current_val == 143,
              expected = 143
            )
          } else {
            results$mediaan <- list(exists = FALSE, value = NA, correct = FALSE, expected = 143)
          }
          
          if (exists("modus", envir = env)) {
            current_val <- as.numeric(get("modus", envir = env))
            results$modus <- list(
              exists = TRUE,
              value = current_val,
              correct = current_val == 150,
              expected = 150
            )
          } else {
            results$modus <- list(exists = FALSE, value = NA, correct = FALSE, expected = 150)
          }
          
          # -----------------------------
          # STAP 3: SPREIDINGSMATEN
          # -----------------------------
          
          if (exists("variatiebreedte", envir = env)) {
            current_val <- as.numeric(get("variatiebreedte", envir = env))
            results$variatiebreedte <- list(
              exists = TRUE,
              value = current_val,
              correct = current_val == 1655,
              expected = 1655
            )
          } else {
            results$variatiebreedte <- list(exists = FALSE, value = NA, correct = FALSE, expected = 1655)
          }
          
          if (exists("q1", envir = env)) {
            current_val <- as.numeric(get("q1", envir = env))
            results$q1 <- list(
              exists = TRUE,
              value = current_val,
              correct = current_val == 26,
              expected = 26
            )
          } else {
            results$q1 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 26)
          }
          
          if (exists("q3", envir = env)) {
            current_val <- as.numeric(get("q3", envir = env))
            results$q3 <- list(
              exists = TRUE,
              value = current_val,
              correct = current_val == 150,
              expected = 150
            )
          } else {
            results$q3 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 150)
          }
          
          if (exists("ika", envir = env)) {
            current_val <- as.numeric(get("ika", envir = env))
            results$ika <- list(
              exists = TRUE,
              value = current_val,
              correct = current_val == 124,
              expected = 124
            )
          } else {
            results$ika <- list(exists = FALSE, value = NA, correct = FALSE, expected = 124)
          }
          
          # -----------------------------
          # STAP 4: VARIANTIE-ANALYSE
          # -----------------------------
          
          # Expected deviations (rounded to 2 decimals)
          expected_deviations <- c(1.09, -94.91, -95.91, -166.91, -208.91, -212.91, 
                                  -236.91, -88.91, -224.91, -88.91, 1418.09)
          deviation_vars <- c("afwijking_240", "afwijking_144", "afwijking_143", "afwijking_72", "afwijking_30",
                             "afwijking_26", "afwijking_2", "afwijking_150_1", "afwijking_14", "afwijking_150_2", "afwijking_1657")
          
          for (i in 1:length(deviation_vars)) {
            var_name <- deviation_vars[i]
            expected_val <- expected_deviations[i]
            
            if (exists(var_name, envir = env)) {
              current_val <- as.numeric(get(var_name, envir = env))
              results[[var_name]] <- list(
                exists = TRUE,
                value = current_val,
                correct = abs(current_val - expected_val) < 0.1,
                expected = expected_val
              )
            } else {
              results[[var_name]] <- list(exists = FALSE, value = NA, correct = FALSE, expected = expected_val)
            }
          }
          
          # Expected squared deviations  
          expected_squared <- c(1.19, 9007.91, 9198.73, 27858.95, 43643.39, 45330.67,
                               56126.35, 7904.99, 50584.51, 7904.99, 2010979.25)
          squared_vars <- c("gekw_afwijking_240", "gekw_afwijking_144", "gekw_afwijking_143", "gekw_afwijking_72", "gekw_afwijking_30",
                           "gekw_afwijking_26", "gekw_afwijking_2", "gekw_afwijking_150_1", "gekw_afwijking_14", "gekw_afwijking_150_2", "gekw_afwijking_1657")
          
          for (i in 1:length(squared_vars)) {
            var_name <- squared_vars[i]
            expected_val <- expected_squared[i]
            
            if (exists(var_name, envir = env)) {
              current_val <- as.numeric(get(var_name, envir = env))
              results[[var_name]] <- list(
                exists = TRUE,
                value = current_val,
                correct = abs(current_val - expected_val) < 1,
                expected = expected_val
              )
            } else {
              results[[var_name]] <- list(exists = FALSE, value = NA, correct = FALSE, expected = expected_val)
            }
          }
          
          if (exists("sum_of_squares", envir = env)) {
            current_val <- as.numeric(get("sum_of_squares", envir = env))
            results$sum_of_squares <- list(
              exists = TRUE,
              value = current_val,
              correct = abs(current_val - 2268540.92) < 1,
              expected = 2268540.92
            )
          } else {
            results$sum_of_squares <- list(exists = FALSE, value = NA, correct = FALSE, expected = 2268540.92)
          }
          
          if (exists("variantie", envir = env)) {
            current_val <- as.numeric(get("variantie", envir = env))
            results$variantie <- list(
              exists = TRUE,
              value = current_val,
              correct = abs(current_val - 226854.09) < 1,
              expected = 226854.09
            )
          } else {
            results$variantie <- list(exists = FALSE, value = NA, correct = FALSE, expected = 226854.09)
          }
          
          if (exists("standaardafwijking", envir = env)) {
            current_val <- as.numeric(get("standaardafwijking", envir = env))
            results$standaardafwijking <- list(
              exists = TRUE,
              value = current_val,
              correct = abs(current_val - 476.29) < 1,
              expected = 476.29
            )
          } else {
            results$standaardafwijking <- list(exists = FALSE, value = NA, correct = FALSE, expected = 476.29)
          }
          
          # Store results for comparator
          assign("detailed_results", results, envir = globalenv())
          
          # Overall success
          all_correct <- all(sapply(results, function(x) x$correct))
          return(all_correct)
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("detailed_results", envir = globalenv())
          
          feedback_lines <- c()
          correct_count <- sum(sapply(results, function(x) x$correct))
          total_questions <- length(results)
          
          # Check frequency table
          freq_vars <- c("freq_2", "freq_14", "freq_26", "freq_30", "freq_72", "freq_143", "freq_144", "freq_150", "freq_240", "freq_1657")
          freq_correct <- all(sapply(freq_vars, function(x) x %in% names(results) && results[[x]]$correct))
          
          if (freq_correct) {
            feedback_lines <- c(feedback_lines, "**FREQUENTIES:** Alle waarden juist geteld ✅")
          } else {
            feedback_lines <- c(feedback_lines, "**FREQUENTIES:** Tel hoe vaak elke waarde voorkomt. 150 komt 2x voor! ❌")
          }
          
          # Check percentages
          percent_vars <- c("percent_2", "percent_14", "percent_26", "percent_30", "percent_72", "percent_143", "percent_144", "percent_150", "percent_240", "percent_1657")
          percent_correct <- all(sapply(percent_vars, function(x) x %in% names(results) && results[[x]]$correct))
          
          if (percent_correct) {
            feedback_lines <- c(feedback_lines, "**PERCENTAGES:** (Frequentie/11) × 100 juist berekend ✅")
          } else {
            feedback_lines <- c(feedback_lines, "**PERCENTAGES:** Formule: (freq/11) × 100. Meeste = 9.1%, 150 = 18.2% ❌")
          }
          
          # Basic calculations feedback
          if ("gemiddelde" %in% names(results) && results$gemiddelde$correct) {
            feedback_lines <- c(feedback_lines, "**GEMIDDELDE:** Som = 2628, n = 11 → 2628/11 = 238.91 ✅")
          } else {
            feedback_lines <- c(feedback_lines, "**GEMIDDELDE:** Som alle waarden (2628) / aantal (11) = 238.91 ❌")
          }
          
          if ("mediaan" %in% names(results) && results$mediaan$correct) {
            feedback_lines <- c(feedback_lines, "**MEDIAAN:** Gesorteerd: 6de waarde van 11 = 143 dagen ✅")
          } else {
            feedback_lines <- c(feedback_lines, "**MEDIAAN:** Sorteer eerst! 6de waarde = 143 dagen ❌")
          }
          
          if ("modus" %in% names(results) && results$modus$correct) {
            feedback_lines <- c(feedback_lines, "**MODUS:** Meest voorkomende waarde = 150 (komt 2x voor) ✅")
          } else {
            feedback_lines <- c(feedback_lines, "**MODUS:** Welke waarde heeft de hoogste frequentie? 150 komt 2x voor ❌")
          }
          
          spread_vars <- c("variatiebreedte", "q1", "q3", "ika")
          spread_correct <- all(sapply(spread_vars, function(x) x %in% names(results) && results[[x]]$correct))
          
          if (spread_correct) {
            feedback_lines <- c(feedback_lines, "**SPREIDING:** Range=1655, Q1=26, Q3=150, IKA=124 ✅")
          } else {
            feedback_lines <- c(feedback_lines, "**SPREIDING:** Range=1657-2=1655, Q1=26, Q3=150, IKA=150-26=124 ❌")
          }
          
          # Check deviations
          deviation_vars <- c("afwijking_240", "afwijking_144", "afwijking_143", "afwijking_72", "afwijking_30",
                             "afwijking_26", "afwijking_2", "afwijking_150_1", "afwijking_14", "afwijking_150_2", "afwijking_1657")
          
          deviations_correct <- all(sapply(deviation_vars, function(x) x %in% names(results) && results[[x]]$correct))
          
          if (deviations_correct) {
            feedback_lines <- c(feedback_lines, "**AFWIJKINGEN:** X - 238.91 voor alle waarden ✅")
          } else {
            feedback_lines <- c(feedback_lines, "**AFWIJKINGEN:** Bereken waarde - 238.91 voor elke observatie ❌")
          }
          
          # Check squared deviations
          squared_vars <- c("gekw_afwijking_240", "gekw_afwijking_144", "gekw_afwijking_143", "gekw_afwijking_72", "gekw_afwijking_30",
                           "gekw_afwijking_26", "gekw_afwijking_2", "gekw_afwijking_150_1", "gekw_afwijking_14", "gekw_afwijking_150_2", "gekw_afwijking_1657")
          
          squared_correct <- all(sapply(squared_vars, function(x) x %in% names(results) && results[[x]]$correct))
          
          if (squared_correct) {
            feedback_lines <- c(feedback_lines, "**GEKWADRATEERDE AFWIJKINGEN:** (afwijking)² ✅")
          } else {
            feedback_lines <- c(feedback_lines, "**GEKWADRATEERDE AFWIJKINGEN:** Kwadrateer elke afwijking ❌")
          }
          
          variance_vars <- c("sum_of_squares", "variantie", "standaardafwijking") 
          variance_correct <- all(sapply(variance_vars, function(x) x %in% names(results) && results[[x]]$correct))
          
          if (variance_correct) {
            feedback_lines <- c(feedback_lines, "**VARIANTIE ANALYSE:** SS=2268540.92, Variantie=226854.09, SD=476.29 ✅")
          } else {
            feedback_lines <- c(feedback_lines, "**VARIANTIE ANALYSE:** Som kwadraten/10, dan √variantie ❌")
          }
          
          # ----------------------------------------
          # COMPREHENSIVE ERROR ANALYSIS (COMMON MISTAKES)
          # ----------------------------------------
          
          if (correct_count != total_questions) {
            feedback_lines <- c(feedback_lines, "", "📚 **Uitleg van veelgemaakte fouten:**")
            
            # ======================
            # STAP 1 - FREQUENCY ERRORS
            # ======================
            
            # Individual frequency checks with specific error patterns
            freq_errors <- c()
            
            if ("freq_150" %in% names(results) && !results$freq_150$correct && results$freq_150$exists) {
              student_f150 <- as.numeric(results$freq_150$value)
              if (!is.na(student_f150)) {
                if (student_f150 == 1) {
                  freq_errors <- c(freq_errors, "freq_150: Je telde 1, maar 150 komt 2x voor in de data (BELANGRIJK!)")
                } else if (student_f150 >= 3) {
                  freq_errors <- c(freq_errors, "freq_150: Te hoog geteld. Tel precies: 150 komt exact 2x voor")
                }
              }
            }
            
            if ("freq_1657" %in% names(results) && !results$freq_1657$correct && results$freq_1657$exists) {
              student_f1657 <- as.numeric(results$freq_1657$value)
              if (!is.na(student_f1657)) {
                if (student_f1657 == 0) {
                  freq_errors <- c(freq_errors, "freq_1657: Jennifer Aniston (1657 dagen) staat WEL in de data!")
                } else if (student_f1657 >= 2) {
                  freq_errors <- c(freq_errors, "freq_1657: Extreme waarde komt maar 1x voor")
                }
              }
            }
            
            if (length(freq_errors) > 0) {
              feedback_lines <- c(feedback_lines, "• **FREQUENTIE FOUTEN:**")
              feedback_lines <- c(feedback_lines, paste0("  - ", freq_errors))
            }
            
            # PERCENTAGE ERRORS - Detailed analysis
            percent_errors <- c()
            
            if ("percent_150" %in% names(results) && !results$percent_150$correct && results$percent_150$exists) {
              student_p150 <- as.numeric(results$percent_150$value)
              if (!is.na(student_p150)) {
                if (abs(student_p150 - 2) < 0.1) {
                  percent_errors <- c(percent_errors, "percent_150: Je gaf de frequentie (2) ipv percentage. 2/11 × 100 = 18.2%")
                } else if (abs(student_p150 - 0.18) < 0.01) {
                  percent_errors <- c(percent_errors, "percent_150: Je vergat ×100. 2/11 = 0.182 → ×100 = 18.2%")
                } else if (abs(student_p150 - 9.1) < 0.1) {
                  percent_errors <- c(percent_errors, "percent_150: 150 komt 2x voor, niet 1x. (2/11) × 100 = 18.2%")
                }
              }
            }
            
            if ("percent_1657" %in% names(results) && !results$percent_1657$correct && results$percent_1657$exists) {
              student_p1657 <- as.numeric(results$percent_1657$value)
              if (!is.na(student_p1657)) {
                if (student_p1657 == 0) {
                  percent_errors <- c(percent_errors, "percent_1657: Jennifer Aniston staat in de data: (1/11) × 100 = 9.1%")
                } else if (abs(student_p1657 - 0.09) < 0.01) {
                  percent_errors <- c(percent_errors, "percent_1657: Vergeet niet ×100. 1/11 = 0.091 → ×100 = 9.1%")
                }
              }
            }
            
            if (length(percent_errors) > 0) {
              feedback_lines <- c(feedback_lines, "• **PERCENTAGE FOUTEN:**")
              feedback_lines <- c(feedback_lines, paste0("  - ", percent_errors))
            }
            
            # MODUS ERRORS - Multiple error types
            if ("modus" %in% names(results) && !results$modus$correct && results$modus$exists) {
              student_modus <- results$modus$value
              if (is.numeric(student_modus)) {
                if (student_modus == 2) {
                  feedback_lines <- c(feedback_lines, "• **MODUS FOUT:** Je gaf de frequentie (2), maar modus is de WAARDE die het meest voorkomt → 150")
                } else if (student_modus == 143) {
                  feedback_lines <- c(feedback_lines, "• **MODUS FOUT:** Je gaf de mediaan (143). Modus = meest voorkomende waarde = 150 (komt 2x voor)")
                } else if (abs(student_modus - 238.91) < 1) {
                  feedback_lines <- c(feedback_lines, "• **MODUS FOUT:** Je gaf het gemiddelde. Modus = waarde met hoogste frequentie = 150")
                } else if (student_modus %in% c(2, 14, 26, 30, 72, 143, 144, 240, 1657)) {
                  feedback_lines <- c(feedback_lines, paste0("• **MODUS FOUT:** ", student_modus, " komt maar 1x voor. 150 komt 2x voor (meest) → modus = 150"))
                }
              }
            }
            
            # MEDIAAN ERRORS - Position vs value confusion
            if ("mediaan" %in% names(results) && !results$mediaan$correct && results$mediaan$exists) {
              student_mediaan <- as.numeric(results$mediaan$value)
              if (!is.na(student_mediaan)) {
                if (student_mediaan == 6) {
                  feedback_lines <- c(feedback_lines, "• **MEDIAAN FOUT:** Je gaf de positie (6), maar mediaan is de WAARDE op die positie. Gesorteerd: 6de waarde = 143")
                } else if (student_mediaan == 150) {
                  feedback_lines <- c(feedback_lines, "• **MEDIAAN FOUT:** Je gaf de modus (150). Mediaan = middelste waarde na sorteren = 143 dagen")
                } else if (abs(student_mediaan - 238.91) < 1) {
                  feedback_lines <- c(feedback_lines, "• **MEDIAAN FOUT:** Je gaf het gemiddelde (238.91). Mediaan = middelste waarde na sorteren = 143")
                } else if (student_mediaan %in% c(2, 14, 26, 30, 72, 144, 240, 1657)) {
                  feedback_lines <- c(feedback_lines, "• **MEDIAAN FOUT:** Sorteer eerst! Gesorteerd: 2,14,26,30,72,143,144,150,150,240,1657 → 6de waarde = 143")
                }
              }
            }
            
            # GEMIDDELDE ERRORS - Calculation mistakes with extreme values
            if ("gemiddelde" %in% names(results) && !results$gemiddelde$correct && results$gemiddelde$exists) {
              student_gem <- as.numeric(results$gemiddelde$value)
              if (!is.na(student_gem)) {
                if (abs(student_gem - 143) < 1) {
                  feedback_lines <- c(feedback_lines, "• **GEMIDDELDE FOUT:** Je gaf de mediaan (143). Gemiddelde = som/aantal. Jennifer's extreme waarde (1657) verhoogt het gemiddelde!")
                } else if (abs(student_gem - 150) < 1) {
                  feedback_lines <- c(feedback_lines, "• **GEMIDDELDE FOUT:** Je gaf de modus (150). Gemiddelde = 2628/11 = 238.91 (hoger door extreme waarde)")
                } else if (abs(student_gem - 271.45) < 0.1) {
                  feedback_lines <- c(feedback_lines, "• **GEMIDDELDE n-1 FOUT:** Je deelde door 10 ipv 11. Gemiddelde = som/n = 2628/11 = 238.91")
                } else if (student_gem < 200) {
                  feedback_lines <- c(feedback_lines, "• **GEMIDDELDE BEREKENING:** Check je som. Inclusief Jennifer (1657): som = 2628, dan 2628/11 = 238.91")
                } else if (student_gem > 280) {
                  feedback_lines <- c(feedback_lines, "• **GEMIDDELDE SOM FOUT:** Som te hoog berekend. Correct: 2+14+26+30+72+143+144+150+150+240+1657 = 2628")
                }
              }
            }
            
            # ======================
            # STAP 3 - SPREIDING ERRORS
            # ======================
            
            # VARIATIEBREEDTE ERRORS - Extreme values impact
            if ("variatiebreedte" %in% names(results) && !results$variatiebreedte$correct && results$variatiebreedte$exists) {
              student_vb <- as.numeric(results$variatiebreedte$value)
              if (!is.na(student_vb)) {
                if (student_vb == 1659) {
                  feedback_lines <- c(feedback_lines, "• **VARIATIEBREEDTE FOUT:** Je deed 1657+2=1659, maar range = max-min = 1657-2 = 1655")
                } else if (student_vb == 238) {
                  feedback_lines <- c(feedback_lines, "• **VARIATIEBREEDTE FOUT:** Je gebruikte verkeerde waarden. Range = hoogste(1657) - laagste(2) = 1655")
                } else if (student_vb < 1000) {
                  feedback_lines <- c(feedback_lines, "• **VARIATIEBREEDTE FOUT:** Te klein. Jennifer's extreme waarde (1657) - minimum(2) = 1655 dagen")
                }
              }
            }
            
            # Q1 ERRORS - Detailed position analysis
            if ("q1" %in% names(results) && !results$q1$correct && results$q1$exists) {
              student_q1 <- as.numeric(results$q1$value)
              if (!is.na(student_q1)) {
                if (student_q1 == 3) {
                  feedback_lines <- c(feedback_lines, "• **Q1 FOUT:** Je gaf de positie (3), maar Q1 is de WAARDE op die positie = 26")
                } else if (student_q1 == 14) {
                  feedback_lines <- c(feedback_lines, "• **Q1 FOUT:** Te laag. Q1 = 25% positie = 3de waarde in gesorteerde data = 26")
                } else if (student_q1 == 30) {
                  feedback_lines <- c(feedback_lines, "• **Q1 FOUT:** Te hoog. Q1 = 25% van 11 = 3de waarde = 26 dagen")
                } else if (student_q1 == 2) {
                  feedback_lines <- c(feedback_lines, "• **Q1 FOUT:** Dit is de minimum waarde. Q1 = 25% positie = 3de waarde = 26")
                }
              }
            }
            
            # Q3 ERRORS  
            if ("q3" %in% names(results) && !results$q3$correct && results$q3$exists) {
              student_q3 <- as.numeric(results$q3$value)
              if (!is.na(student_q3)) {
                if (student_q3 == 9) {
                  feedback_lines <- c(feedback_lines, "• **Q3 FOUT:** Je gaf de positie (9), maar Q3 is de WAARDE op die positie = 150")
                } else if (student_q3 == 240 || student_q3 == 1657) {
                  feedback_lines <- c(feedback_lines, "• **Q3 FOUT:** Te hoog. Q3 = 75% positie = 9de waarde = 150 (voor de extreme waarden)")
                } else if (student_q3 == 143 || student_q3 == 144) {
                  feedback_lines <- c(feedback_lines, "• **Q3 FOUT:** Te laag. Q3 = 75% van gesorteerde data = 9de waarde = 150")
                }
              }
            }
            
            # IKA ERRORS
            if ("ika" %in% names(results) && !results$ika$correct && results$ika$exists) {
              student_ika <- as.numeric(results$ika$value)
              if (!is.na(student_ika)) {
                if (student_ika < 0) {
                  feedback_lines <- c(feedback_lines, "• **IKA FOUT:** Negatief getal? IKA = Q3 - Q1 = 150 - 26 = 124 (altijd positief)")
                } else if (student_ika == 1655) {
                  feedback_lines <- c(feedback_lines, "• **IKA FOUT:** Je berekende de variatiebreedte. IKA = Q3 - Q1 = 150 - 26 = 124")
                } else if (student_ika == 176) {
                  feedback_lines <- c(feedback_lines, "• **IKA PLUS FOUT:** Je deed Q3 + Q1. Correct: IKA = Q3 - Q1 = 150 - 26 = 124")
                } else if (student_ika > 200) {
                  feedback_lines <- c(feedback_lines, "• **IKA FOUT:** Te groot. IKA = Q3 - Q1 = 150 - 26 = 124 (middelste 50%)")
                }
              }
            }
            
            # ======================
            # STAP 4 - VARIANCE CALCULATION ERRORS
            # ======================
            
            # AFWIJKING SIGN ERRORS - Check specific deviations
            deviation_sign_errors <- 0
            if ("afwijking_2" %in% names(results) && !results$afwijking_2$correct && results$afwijking_2$exists) {
              student_afw <- as.numeric(results$afwijking_2$value)
              if (!is.na(student_afw) && student_afw == 236.91) {
                deviation_sign_errors <- deviation_sign_errors + 1
              }
            }
            if ("afwijking_1657" %in% names(results) && !results$afwijking_1657$correct && results$afwijking_1657$exists) {
              student_afw <- as.numeric(results$afwijking_1657$value)
              if (!is.na(student_afw) && student_afw == -1418.09) {
                deviation_sign_errors <- deviation_sign_errors + 1
              }
            }
            
            if (deviation_sign_errors > 0) {
              feedback_lines <- c(feedback_lines, "• **AFWIJKING TEKEN FOUT:** Let op tekens! 2-238.91 = -236.91 (negatief), 1657-238.91 = +1418.09 (positief)")
            }
            
            # MEAN ERROR IN DEVIATIONS
            if ("afwijking_150_1" %in% names(results) && !results$afwijking_150_1$correct && results$afwijking_150_1$exists) {
              student_afw <- as.numeric(results$afwijking_150_1$value)
              if (!is.na(student_afw) && abs(student_afw - 7) < 1) {
                feedback_lines <- c(feedback_lines, "• **AFWIJKING GEMIDDELDE FOUT:** Je gebruikte verkeerd gemiddelde. Gebruik 238.91: 150 - 238.91 = -88.91")
              } else if (!is.na(student_afw) && abs(student_afw - (-93)) < 1) {
                feedback_lines <- c(feedback_lines, "• **AFWIJKING GEMIDDELDE FOUT:** Check gemiddelde berekening. Correct: 150 - 238.91 = -88.91")
              }
            }
            
            # SQUARED DEVIATIONS - Common mistakes with extreme values
            if ("gekw_afwijking_1657" %in% names(results) && !results$gekw_afwijking_1657$correct && results$gekw_afwijking_1657$exists) {
              student_gekw <- as.numeric(results$gekw_afwijking_1657$value)
              if (!is.na(student_gekw)) {
                if (student_gekw < 0) {
                  feedback_lines <- c(feedback_lines, "• **GEKWADRATEERDE AFWIJKING TEKEN:** Kwadraat is altijd positief! (1418.09)² = 2,010,979.25")
                } else if (abs(student_gekw - 1418.09) < 1) {
                  feedback_lines <- c(feedback_lines, "• **GEKWADRATEERDE AFWIJKING:** Je vergat te kwadrateren. (1418.09)² = 2,010,979.25 (niet 1418.09)")
                } else if (student_gekw > 2500000) {
                  feedback_lines <- c(feedback_lines, "• **GEKWADRATEERDE AFWIJKING FOUT:** Te hoog. Check: (1657-238.91)² = (1418.09)² = 2,010,979.25")
                }
              }
            }
            
            if ("gekw_afwijking_2" %in% names(results) && !results$gekw_afwijking_2$correct && results$gekw_afwijking_2$exists) {
              student_gekw <- as.numeric(results$gekw_afwijking_2$value)
              if (!is.na(student_gekw)) {
                if (student_gekw < 0) {
                  feedback_lines <- c(feedback_lines, "• **GEKWADRATEERDE AFWIJKING TEKEN:** Kwadraat is altijd positief! (-236.91)² = 56,126.35")
                } else if (abs(student_gekw - 236.91) < 1) {
                  feedback_lines <- c(feedback_lines, "• **GEKWADRATEERDE AFWIJKING:** Je vergat te kwadrateren. (-236.91)² = 56,126.35")
                }
              }
            }
            
            # SUM OF SQUARES ERRORS
            if ("sum_of_squares" %in% names(results) && !results$sum_of_squares$correct && results$sum_of_squares$exists) {
              student_ss <- as.numeric(results$sum_of_squares$value)
              if (!is.na(student_ss)) {
                if (abs(student_ss - 2628) < 10) {
                  feedback_lines <- c(feedback_lines, "• **SOM KWADRATEN FOUT:** Je somde originele waarden ipv gekwadrateerde afwijkingen. Som van (afwijking)² = 2,268,540.92")
                } else if (student_ss < 1000000) {
                  feedback_lines <- c(feedback_lines, "• **SOM KWADRATEN FOUT:** Te laag. Jennifer's extreme waarde draagt 2,010,979 bij! Totale som = 2,268,540.92")
                } else if (student_ss > 3000000) {
                  feedback_lines <- c(feedback_lines, "• **SOM KWADRATEN FOUT:** Te hoog. Controleer je gekwadrateerde afwijkingen. Correcte som = 2,268,540.92")
                }
              }
            }
            
            # VARIANCE ERRORS - n vs n-1 with extreme values
            if ("variantie" %in% names(results) && !results$variantie$correct && results$variantie$exists) {
              student_var <- as.numeric(results$variantie$value)
              if (!is.na(student_var)) {
                if (abs(student_var - 206231.9) < 10) {
                  feedback_lines <- c(feedback_lines, "• **VARIANTIE n-1 FOUT:** Je deelde door n=11, gebruik n-1=10 voor steekproef: 2,268,540.92/10 = 226,854.09")
                } else if (abs(student_var - 2268540.92) < 100) {
                  feedback_lines <- c(feedback_lines, "• **VARIANTIE FORMULE FOUT:** Je gaf som van kwadraten. Variantie = som/(n-1) = 2,268,540.92/10 = 226,854.09")
                } else if (abs(student_var - 238.91) < 1) {
                  feedback_lines <- c(feedback_lines, "• **VARIANTIE FOUT:** Je gaf het gemiddelde. Variantie = som gekwadrateerde afwijkingen/(n-1) = 226,854.09")
                } else if (student_var < 100000) {
                  feedback_lines <- c(feedback_lines, "• **VARIANTIE TE LAAG:** Extreme waarde (Jennifer) zorgt voor hoge variantie. Check berekening: 2,268,540.92/10 = 226,854.09")
                }
              }
            }
            
            # STANDARD DEVIATION ERRORS
            if ("standaardafwijking" %in% names(results) && !results$standaardafwijking$correct && results$standaardafwijking$exists) {
              student_sd <- as.numeric(results$standaardafwijking$value)
              if (!is.na(student_sd)) {
                if (abs(student_sd - 226854.09) < 100) {
                  feedback_lines <- c(feedback_lines, "• **STANDAARDAFWIJKING WORTEL FOUT:** Je gaf variantie. SD = √variantie = √226,854.09 = 476.29")
                } else if (abs(student_sd - 2268540.92) < 1000) {
                  feedback_lines <- c(feedback_lines, "• **STANDAARDAFWIJKING FOUT:** Je gaf som van kwadraten. SD = √(som/(n-1)) = √226,854.09 = 476.29")
                } else if (student_sd < 300) {
                  feedback_lines <- c(feedback_lines, "• **STANDAARDAFWIJKING TE LAAG:** Extreme waarde zorgt voor hoge spreiding. Correcte SD = 476.29 dagen")
                } else if (student_sd > 600) {
                  feedback_lines <- c(feedback_lines, "• **STANDAARDAFWIJKING TE HOOG:** Check variantie berekening. SD = √226,854.09 = 476.29")
                }
              }
            }
          }
          
          feedback_lines <- c(
            feedback_lines,
            "",
            paste0("**", correct_count, " van ", total_questions, " juist**"),
            "",
            "🔍 **BELANGRIJKE REGELS VOOR EXTREME WAARDEN:**",
            "• **Mediaan is robuuster** dan gemiddelde bij uitbijters",
            "• **Jennifer Aniston (1657 dagen)** is duidelijke uitbijter",
            "• **IKA minder gevoelig** voor extreme waarden dan range",
            "• **Standaardafwijking hoog** door extreme spreiding",
            "• **Bij steekproef: variantie = SS/(n-1)**"
          )
          
          # Show markdown feedback
          get_reporter()$add_message(
            paste(feedback_lines, collapse = "\n\n"),
            type = "markdown"
          )
          
          # Final result
          generated == expected
        }
      )
    }
  )
})