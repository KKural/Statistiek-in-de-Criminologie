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
            current_val <- get("mediaan", envir = env)
            results$mediaan <- list(
              exists = TRUE,
              value = current_val,
              correct = as.numeric(current_val) == 143,
              expected = 143
            )
          } else {
            results$mediaan <- list(exists = FALSE, value = NA, correct = FALSE, expected = 143)
          }
          
          if (exists("modus", envir = env)) {
            current_val <- get("modus", envir = env)
            results$modus <- list(
              exists = TRUE,
              value = current_val,
              correct = as.numeric(current_val) == 150,
              expected = 150
            )
          } else {
            results$modus <- list(exists = FALSE, value = NA, correct = FALSE, expected = 150)
          }
          
          # -----------------------------
          # STAP 3: SPREIDINGSMATEN
          # -----------------------------
          
          if (exists("variatiebreedte", envir = env)) {
            current_val <- get("variatiebreedte", envir = env)
            results$variatiebreedte <- list(
              exists = TRUE,
              value = current_val,
              correct = as.numeric(current_val) == 1655,
              expected = 1655
            )
          } else {
            results$variatiebreedte <- list(exists = FALSE, value = NA, correct = FALSE, expected = 1655)
          }
          
          if (exists("q1", envir = env)) {
            current_val <- get("q1", envir = env)
            results$q1 <- list(
              exists = TRUE,
              value = current_val,
              correct = as.numeric(current_val) == 26,
              expected = 26
            )
          } else {
            results$q1 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 26)
          }
          
          if (exists("q3", envir = env)) {
            current_val <- get("q3", envir = env)
            results$q3 <- list(
              exists = TRUE,
              value = current_val,
              correct = as.numeric(current_val) == 150,
              expected = 150
            )
          } else {
            results$q3 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 150)
          }
          
          if (exists("ika", envir = env)) {
            current_val <- get("ika", envir = env)
            results$ika <- list(
              exists = TRUE,
              value = current_val,
              correct = as.numeric(current_val) == 124,
              expected = 124
            )
          } else {
            results$ika <- list(exists = FALSE, value = NA, correct = FALSE, expected = 124)
          }
          
          # -----------------------------
          # STAP 4: GEAVANCEERDE BEREKENINGEN
          # -----------------------------
          
          # Individual afwijkingen for all 11 marriages
          afwijking_vars <- c("afwijking_240", "afwijking_144", "afwijking_143", "afwijking_72", "afwijking_30",
                             "afwijking_26", "afwijking_2", "afwijking_150_1", "afwijking_14", "afwijking_150_2", "afwijking_1657")
          
          expected_afwijkingen <- c(1.09, -94.91, -95.91, -166.91, -208.91, -212.91, -236.91, -88.91, -224.91, -88.91, 1418.09)
          
          for (i in 1:length(afwijking_vars)) {
            var_name <- afwijking_vars[i]
            expected_val <- expected_afwijkingen[i]
            
            if (exists(var_name, envir = env)) {
              current_val <- as.numeric(get(var_name, envir = env))
              results[[var_name]] <- list(
                exists = TRUE,
                value = current_val,
                correct = abs(current_val - expected_val) < 0.01,
                expected = expected_val
              )
            } else {
              results[[var_name]] <- list(exists = FALSE, value = NA, correct = FALSE, expected = expected_val)
            }
          }
          
          # Individual gekwadrateerde afwijkingen
          gekw_vars <- c("gekw_afwijking_240", "gekw_afwijking_144", "gekw_afwijking_143", "gekw_afwijking_72", "gekw_afwijking_30",
                        "gekw_afwijking_26", "gekw_afwijking_2", "gekw_afwijking_150_1", "gekw_afwijking_14", "gekw_afwijking_150_2", "gekw_afwijking_1657")
          
          expected_gekw <- c(1.1881, 9007.9081, 9198.7281, 27859.1481, 43643.5881, 45331.0681, 56126.3481, 7905.0081, 50584.5081, 7905.0081, 2010979.1981)
          
          for (i in 1:length(gekw_vars)) {
            var_name <- gekw_vars[i]
            expected_val <- expected_gekw[i]
            
            if (exists(var_name, envir = env)) {
              current_val <- as.numeric(get(var_name, envir = env))
              results[[var_name]] <- list(
                exists = TRUE,
                value = current_val,
                correct = abs(current_val - expected_val) < 0.01,
                expected = expected_val
              )
            } else {
              results[[var_name]] <- list(exists = FALSE, value = NA, correct = FALSE, expected = expected_val)
            }
          }
          
          # Final calculations
          if (exists("sum_of_squares", envir = env)) {
            current_val <- as.numeric(get("sum_of_squares", envir = env))
            results$sum_of_squares <- list(
              exists = TRUE,
              value = current_val,
              correct = abs(current_val - 2268540.92) < 0.01,
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
              correct = abs(current_val - 226854.09) < 0.01,
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
              correct = abs(current_val - 476.29) < 0.01,
              expected = 476.29
            )
          } else {
            results$standaardafwijking <- list(exists = FALSE, value = NA, correct = FALSE, expected = 476.29)
          }
          
          # Create vectors for validation if all individual variables exist
          all_afwijkingen_exist <- all(sapply(afwijking_vars, function(var) exists(var, envir = env)))
          if (all_afwijkingen_exist) {
            afwijkingen <- sapply(afwijking_vars, function(var) as.numeric(get(var, envir = env)))
            assign("afwijkingen", afwijkingen, envir = env)
          }
          
          all_gekw_exist <- all(sapply(gekw_vars, function(var) exists(var, envir = env)))
          if (all_gekw_exist) {
            gekwadrateerde_afwijkingen <- sapply(gekw_vars, function(var) as.numeric(get(var, envir = env)))
            assign("gekwadrateerde_afwijkingen", gekwadrateerde_afwijkingen, envir = env)
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
          
          feedback_parts <- c()
          correct_count <- sum(sapply(results, function(x) x$correct))
          total_questions <- length(results)
          
          # ----------------------------------------
          # COMPREHENSIVE ERROR ANALYSIS (COMMON MISTAKES)
          # ----------------------------------------
          
          if (correct_count != total_questions) {
            feedback_parts <- c(feedback_parts, "", "📚 **Uitleg van veelgemaakte fouten:**")
            
            # ======================
            # STAP 1 - FREQUENCY ERRORS
            # ======================
            
            # Individual frequency checks with specific error patterns
            freq_errors <- c()
            
            # Check all frequency variables for common errors
            if ("freq_2" %in% names(results) && !results$freq_2$correct && results$freq_2$exists) {
              student_f2 <- as.numeric(results$freq_2$value)
              if (!is.na(student_f2)) {
                if (student_f2 == 0) {
                  freq_errors <- c(freq_errors, paste0("freq_2: Je gaf ", student_f2, ", maar 2 dagen bestaat wel in de data (Britney Spears). Correct: **1**"))
                } else if (student_f2 > 1) {
                  freq_errors <- c(freq_errors, paste0("freq_2: Je gaf ", student_f2, ", maar 2 is unieke waarde, komt 1x voor. Correct: **1**"))
                } else {
                  freq_errors <- c(freq_errors, paste0("freq_2: Je gaf ", student_f2, ", maar correct antwoord is **1**"))
                }
              }
            }
            
            if ("freq_150" %in% names(results) && !results$freq_150$correct && results$freq_150$exists) {
              student_f150 <- as.numeric(results$freq_150$value)
              if (!is.na(student_f150)) {
                if (student_f150 == 1) {
                  freq_errors <- c(freq_errors, paste0("freq_150: Je gaf ", student_f150, ", maar 150 komt 2x voor (Brad Pitt en Angelina Jolie). Correct: **2**"))
                } else if (student_f150 == 3) {
                  freq_errors <- c(freq_errors, paste0("freq_150: Je gaf ", student_f150, ", maar je telde andere waarden mee. Tel alleen exact 150. Correct: **2**"))
                } else {
                  freq_errors <- c(freq_errors, paste0("freq_150: Je gaf ", student_f150, ", maar correct antwoord is **2**"))
                }
              }
            }
            
            if ("freq_1657" %in% names(results) && !results$freq_1657$correct && results$freq_1657$exists) {
              student_f1657 <- as.numeric(results$freq_1657$value)
              if (!is.na(student_f1657)) {
                if (student_f1657 == 0) {
                  freq_errors <- c(freq_errors, paste0("freq_1657: Je gaf ", student_f1657, ", maar Jennifer Aniston's extreme waarde (1657 dagen) bestaat wel! Correct: **1**"))
                } else if (student_f1657 > 1) {
                  freq_errors <- c(freq_errors, paste0("freq_1657: Je gaf ", student_f1657, ", maar 1657 is unieke extreme waarde, komt 1x voor. Correct: **1**"))
                } else {
                  freq_errors <- c(freq_errors, paste0("freq_1657: Je gaf ", student_f1657, ", maar correct antwoord is **1**"))
                }
              }
            }
            
            # Check other specific frequencies that might cause confusion
            if ("freq_143" %in% names(results) && !results$freq_143$correct && results$freq_143$exists) {
              student_f143 <- as.numeric(results$freq_143$value)
              if (!is.na(student_f143)) {
                if (student_f143 == 0) {
                  freq_errors <- c(freq_errors, paste0("freq_143: Je gaf ", student_f143, ", maar 143 dagen bestaat (Kim Kardashian). Correct: **1**"))
                } else if (student_f143 > 1) {
                  freq_errors <- c(freq_errors, paste0("freq_143: Je gaf ", student_f143, ", maar 143 komt 1x voor, niet vaker. Correct: **1**"))
                } else {
                  freq_errors <- c(freq_errors, paste0("freq_143: Je gaf ", student_f143, ", maar correct antwoord is **1**"))
                }
              }
            }
            
            if ("freq_144" %in% names(results) && !results$freq_144$correct && results$freq_144$exists) {
              student_f144 <- as.numeric(results$freq_144$value)
              if (!is.na(student_f144)) {
                if (student_f144 == 0) {
                  freq_errors <- c(freq_errors, paste0("freq_144: Je gaf ", student_f144, ", maar 144 dagen bestaat (Britney Spears & Jason Alexander). Correct: **1**"))
                } else if (student_f144 > 1) {
                  freq_errors <- c(freq_errors, paste0("freq_144: Je gaf ", student_f144, ", maar 144 komt 1x voor. Correct: **1**"))
                } else {
                  freq_errors <- c(freq_errors, paste0("freq_144: Je gaf ", student_f144, ", maar correct antwoord is **1**"))
                }
              }
            }
            
            if (length(freq_errors) > 0) {
              feedback_parts <- c(feedback_parts, "• **FREQUENTIE FOUTEN:**")
              feedback_parts <- c(feedback_parts, paste0("  - ", freq_errors))
            }
            
            # PERCENTAGE ERRORS - Detailed analysis
            percent_errors <- c()
            
            # Check common percentage calculation errors
            if ("percent_2" %in% names(results) && !results$percent_2$correct && results$percent_2$exists) {
              student_p2 <- as.numeric(results$percent_2$value)
              if (!is.na(student_p2)) {
                if (abs(student_p2 - 1) < 0.1) {
                  percent_errors <- c(percent_errors, paste0("percent_2: Je gaf ", student_p2, ", maar je gaf de frequentie ipv percentage. Correct: 1/11 × 100 = **9.1%**"))
                } else if (abs(student_p2 - 0.091) < 0.001) {
                  percent_errors <- c(percent_errors, paste0("percent_2: Je gaf ", student_p2, ", maar je vergat ×100. Correct: 1/11 = 0.091 → ×100 = **9.1%**"))
                } else {
                  percent_errors <- c(percent_errors, paste0("percent_2: Je gaf ", student_p2, ", maar correct antwoord is **9.1%**"))
                }
              }
            }
            
            if ("percent_150" %in% names(results) && !results$percent_150$correct && results$percent_150$exists) {
              student_p150 <- as.numeric(results$percent_150$value)
              if (!is.na(student_p150)) {
                if (abs(student_p150 - 2) < 0.1) {
                  percent_errors <- c(percent_errors, paste0("percent_150: Je gaf ", student_p150, ", maar je gaf de frequentie ipv percentage. Correct: 2/11 × 100 = **18.2%**"))
                } else if (abs(student_p150 - 0.182) < 0.001) {
                  percent_errors <- c(percent_errors, paste0("percent_150: Je gaf ", student_p150, ", maar je vergat ×100. Correct: 2/11 = 0.182 → ×100 = **18.2%**"))
                } else if (abs(student_p150 - 9.1) < 0.1) {
                  percent_errors <- c(percent_errors, paste0("percent_150: Je gaf ", student_p150, ", maar 150 komt 2x voor, niet 1x. Correct: (2/11) × 100 = **18.2%**"))
                } else {
                  percent_errors <- c(percent_errors, paste0("percent_150: Je gaf ", student_p150, ", maar correct antwoord is **18.2%**"))
                }
              }
            }
            
            if ("percent_1657" %in% names(results) && !results$percent_1657$correct && results$percent_1657$exists) {
              student_p1657 <- as.numeric(results$percent_1657$value)
              if (!is.na(student_p1657)) {
                if (abs(student_p1657 - 1) < 0.1) {
                  percent_errors <- c(percent_errors, paste0("percent_1657: Je gaf ", student_p1657, ", maar je gaf de frequentie ipv percentage. Correct: 1/11 × 100 = **9.1%**"))
                } else if (student_p1657 == 0) {
                  percent_errors <- c(percent_errors, paste0("percent_1657: Je gaf ", student_p1657, ", maar extreme waarde bestaat! Jennifer: Correct: 1/11 × 100 = **9.1%**"))
                } else {
                  percent_errors <- c(percent_errors, paste0("percent_1657: Je gaf ", student_p1657, ", maar correct antwoord is **9.1%**"))
                }
              }
            }
            
            # Check for wrong denominators
            most_percent_vars <- c("percent_2", "percent_14", "percent_26", "percent_30", "percent_72", "percent_143", "percent_144", "percent_240", "percent_1657")
            for (var in most_percent_vars) {
              if (var %in% names(results) && !results[[var]]$correct && results[[var]]$exists) {
                student_val <- as.numeric(results[[var]]$value)
                if (!is.na(student_val) && abs(student_val - 10) < 0.1) {
                  percent_errors <- c(percent_errors, paste0(var, ": Je gebruikte verkeerde noemer. Gebruik 11, niet 10: (1/11) × 100 = 9.1%"))
                  break # Only show this error once
                }
              }
            }
            
            if (length(percent_errors) > 0) {
              feedback_parts <- c(feedback_parts, "• **PERCENTAGE FOUTEN:**")
              feedback_parts <- c(feedback_parts, paste0("  - ", percent_errors))
            }
            
            # MODUS ERRORS - Multiple error types
            if ("modus" %in% names(results) && !results$modus$correct && results$modus$exists) {
              student_modus <- results$modus$value
              if (is.numeric(student_modus)) {
                if (student_modus == 2) {
                  feedback_parts <- c(feedback_parts, "• **MODUS FOUT:** Je gaf de frequentie (2), maar modus is de WAARDE die het meest voorkomt → 150")
                } else if (student_modus %in% c(2, 14, 26, 30, 72, 143, 144, 240, 1657)) {
                  feedback_parts <- c(feedback_parts, paste0("• **MODUS FOUT:** ", student_modus, " komt 1x voor. 150 komt 2x voor (meest) → modus = 150"))
                } else if (length(student_modus) > 1) {
                  feedback_parts <- c(feedback_parts, "• **MODUS FOUT:** Geef één waarde. De waarde die het MEEST voorkomt is 150 (2x)")
                }
              }
            }
            
            # MEDIAAN ERRORS - Position vs value confusion with extreme values
            if ("mediaan" %in% names(results) && !results$mediaan$correct && results$mediaan$exists) {
              student_mediaan <- as.numeric(results$mediaan$value)
              if (!is.na(student_mediaan)) {
                if (student_mediaan == 6) {
                  feedback_parts <- c(feedback_parts, "• **MEDIAAN FOUT:** Je gaf de positie (6), maar mediaan is de WAARDE op die positie = 143")
                } else if (student_mediaan == 150) {
                  feedback_parts <- c(feedback_parts, "• **MEDIAAN FOUT:** 150 is de modus. Mediaan = middelste waarde (6de van 11) = 143")
                } else if (abs(student_mediaan - 238.91) < 0.01) {
                  feedback_parts <- c(feedback_parts, "• **MEDIAAN FOUT:** Je gaf het gemiddelde. Mediaan = middelste waarde na sorteren = 143")
                } else if (student_mediaan == 1657) {
                  feedback_parts <- c(feedback_parts, "• **MEDIAAN FOUT:** 1657 is extreme waarde. Sorteer data: middelste (6de) = 143")
                }
              }
            }
            
            # GEMIDDELDE ERRORS - With extreme value impact
            if ("gemiddelde" %in% names(results) && !results$gemiddelde$correct && results$gemiddelde$exists) {
              student_gem <- as.numeric(results$gemiddelde$value)
              if (!is.na(student_gem)) {
                if (abs(student_gem - 144.7) < 1) {
                  feedback_parts <- c(feedback_parts, "• **GEMIDDELDE EXTREME WAARDE:** Je vergat Jennifer (1657)! Som = 2+14+26+30+72+143+144+150+150+240+1657 = 2628")
                } else if (abs(student_gem - 261.8) < 1) {
                  feedback_parts <- c(feedback_parts, "• **GEMIDDELDE FOUT:** Rekenfout. Check som: 2628/11 = 238.91")
                } else if (student_gem == 143) {
                  feedback_parts <- c(feedback_parts, "• **GEMIDDELDE FOUT:** Je gaf de mediaan (143). Gemiddelde = som/aantal = 2628/11 = 238.91")
                } else if (abs(student_gem - 238.8) < 0.1) {
                  feedback_parts <- c(feedback_parts, "• **GEMIDDELDE FOUT:** Je deelde door 10 ipv 11. Gemiddelde = 2628/11 = 238.91")
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
                  feedback_parts <- c(feedback_parts, "• **VARIATIEBREEDTE FOUT:** Je deed 1657+2=1659, maar range = max-min = 1657-2 = 1655")
                } else if (student_vb == 238) {
                  feedback_parts <- c(feedback_parts, "• **VARIATIEBREEDTE FOUT:** Je gebruikte verkeerde waarden. Range = hoogste(1657) - laagste(2) = 1655")
                } else if (student_vb < 1000) {
                  feedback_parts <- c(feedback_parts, "• **VARIATIEBREEDTE FOUT:** Te klein. Jennifer's extreme waarde (1657) - minimum(2) = 1655 dagen")
                }
              }
            }
            
            # Q1 ERRORS - Detailed position analysis
            if ("q1" %in% names(results) && !results$q1$correct && results$q1$exists) {
              student_q1 <- as.numeric(results$q1$value)
              if (!is.na(student_q1)) {
                if (student_q1 == 3) {
                  feedback_parts <- c(feedback_parts, "• **Q1 FOUT:** Je gaf de positie (3), maar Q1 is de WAARDE op die positie = 26")
                } else if (student_q1 == 14) {
                  feedback_parts <- c(feedback_parts, "• **Q1 FOUT:** Te laag. Q1 = 25% positie = 3de waarde in gesorteerde data = 26")
                } else if (student_q1 == 30) {
                  feedback_parts <- c(feedback_parts, "• **Q1 FOUT:** Te hoog. Q1 = 25% van 11 = 3de waarde = 26 dagen")
                } else if (student_q1 == 2) {
                  feedback_parts <- c(feedback_parts, "• **Q1 FOUT:** Dit is de minimum waarde. Q1 = 25% positie = 3de waarde = 26")
                }
              }
            }
            
            # Q3 ERRORS  
            if ("q3" %in% names(results) && !results$q3$correct && results$q3$exists) {
              student_q3 <- as.numeric(results$q3$value)
              if (!is.na(student_q3)) {
                if (student_q3 == 9) {
                  feedback_parts <- c(feedback_parts, "• **Q3 FOUT:** Je gaf de positie (9), maar Q3 is de WAARDE op die positie = 150")
                } else if (student_q3 == 240 || student_q3 == 1657) {
                  feedback_parts <- c(feedback_parts, "• **Q3 FOUT:** Te hoog. Q3 = 75% positie = 9de waarde = 150 (voor de extreme waarden)")
                } else if (student_q3 == 143 || student_q3 == 144) {
                  feedback_parts <- c(feedback_parts, "• **Q3 FOUT:** Te laag. Q3 = 75% van gesorteerde data = 9de waarde = 150")
                }
              }
            }
            
            # IKA ERRORS
            if ("ika" %in% names(results) && !results$ika$correct && results$ika$exists) {
              student_ika <- as.numeric(results$ika$value)
              if (!is.na(student_ika)) {
                if (student_ika < 0) {
                  feedback_parts <- c(feedback_parts, "• **IKA FOUT:** Negatief getal? IKA = Q3 - Q1 = 150 - 26 = 124 (altijd positief)")
                } else if (student_ika == 1655) {
                  feedback_parts <- c(feedback_parts, "• **IKA FOUT:** Je berekende de variatiebreedte. IKA = Q3 - Q1 = 150 - 26 = 124")
                } else if (student_ika == 26) {
                  feedback_parts <- c(feedback_parts, "• **IKA FOUT:** Je gaf Q1. IKA = Q3 - Q1 = 150 - 26 = 124")
                } else if (abs(student_ika - 117) < 1) {
                  feedback_parts <- c(feedback_parts, "• **IKA FOUT:** Check je Q1 en Q3 waarden. IKA = 150 - 26 = 124")
                }
              }
            }
            
            # ======================
            # STAP 4 - ADVANCED CALCULATION ERRORS
            # ======================
            
            # AFWIJKING SIGN ERRORS - Check multiple deviations
            deviation_sign_errors <- 0
            if ("afwijking_1657" %in% names(results) && !results$afwijking_1657$correct && results$afwijking_1657$exists) {
              student_afw <- as.numeric(results$afwijking_1657$value)
              if (!is.na(student_afw) && student_afw < 0) {
                deviation_sign_errors <- deviation_sign_errors + 1
              }
            }
            if ("afwijking_2" %in% names(results) && !results$afwijking_2$correct && results$afwijking_2$exists) {
              student_afw <- as.numeric(results$afwijking_2$value)
              if (!is.na(student_afw) && student_afw > 0) {
                deviation_sign_errors <- deviation_sign_errors + 1
              }
            }
            
            if (deviation_sign_errors > 0) {
              feedback_parts <- c(feedback_parts, "• **AFWIJKING TEKEN FOUT:** Let op tekens! 1657-238.91 = +1418.09 (positief), 2-238.91 = -236.91 (negatief)")
            }
            
            # MEAN ERROR IN DEVIATIONS
            if ("afwijking_1657" %in% names(results) && !results$afwijking_1657$correct && results$afwijking_1657$exists) {
              student_afw <- as.numeric(results$afwijking_1657$value)
              if (!is.na(student_afw) && abs(student_afw - 1418) < 1) {
                feedback_parts <- c(feedback_parts, "• **AFWIJKING GEMIDDELDE FOUT:** Je gebruikte afrond gemiddelde. Gebruik 238.91: 1657 - 238.91 = 1418.09")
              }
            }
            
            # SQUARED DEVIATIONS - Common mistakes with extreme values
            if ("gekw_afwijking_1657" %in% names(results) && !results$gekw_afwijking_1657$correct && results$gekw_afwijking_1657$exists) {
              student_gekw <- as.numeric(results$gekw_afwijking_1657$value)
              if (!is.na(student_gekw)) {
                if (student_gekw == -2010979.1981) {
                  feedback_parts <- c(feedback_parts, "• **GEKWADRATEERDE AFWIJKING TEKEN:** Kwadraat is altijd positief! (1418.09)² = 2,010,979.20")
                } else if (abs(student_gekw - 1418.09) < 0.01) {
                  feedback_parts <- c(feedback_parts, "• **GEKWADRATEERDE AFWIJKING:** Je vergat te kwadrateren. (1418.09)² = 2,010,979.20")
                } else if (abs(student_gekw - 1418) < 1) {
                  feedback_parts <- c(feedback_parts, "• **GEKWADRATEERDE AFWIJKING AFROND:** Gebruik exacte afwijking: (1418.09)² = 2,010,979.20")
                }
              }
            }
            
            # SUM OF SQUARES ERRORS
            if ("sum_of_squares" %in% names(results) && !results$sum_of_squares$correct && results$sum_of_squares$exists) {
              student_ss <- as.numeric(results$sum_of_squares$value)
              if (!is.na(student_ss)) {
                if (abs(student_ss - 2628) < 10) {
                  feedback_parts <- c(feedback_parts, "• **SOM KWADRATEN FOUT:** Je somde originele waarden ipv gekwadrateerde afwijkingen. Som van (afwijking)² = 2,268,540.92")
                } else if (student_ss < 1000000) {
                  feedback_parts <- c(feedback_parts, "• **SOM KWADRATEN FOUT:** Te laag. Jennifer's extreme waarde draagt 2,010,979 bij! Totale som = 2,268,540.92")
                } else if (student_ss > 3000000) {
                  feedback_parts <- c(feedback_parts, "• **SOM KWADRATEN FOUT:** Te hoog. Controleer je gekwadrateerde afwijkingen. Correcte som = 2,268,540.92")
                }
              }
            }
            
            # VARIANCE ERRORS - n vs n-1 with extreme values
            if ("variantie" %in% names(results) && !results$variantie$correct && results$variantie$exists) {
              student_var <- as.numeric(results$variantie$value)
              if (!is.na(student_var)) {
                if (abs(student_var - 206231.9) < 10) {
                  feedback_parts <- c(feedback_parts, paste0("• **VARIANTIE:** Je gaf ", format(student_var, big.mark=","), ", maar je deelde door n=11. Gebruik n-1=10 voor steekproef: 2,268,540.92/10 = **226,854.09**"))
                } else if (abs(student_var - 2268540.92) < 100) {
                  feedback_parts <- c(feedback_parts, paste0("• **VARIANTIE:** Je gaf ", format(student_var, big.mark=","), ", maar dit is de som van kwadraten. Variantie = som/(n-1) = **226,854.09**"))
                } else if (abs(student_var - 238.91) < 1) {
                  feedback_parts <- c(feedback_parts, paste0("• **VARIANTIE:** Je gaf ", student_var, ", maar dit is het gemiddelde. Variantie = som gekwadrateerde afwijkingen/(n-1) = **226,854.09**"))
                } else if (student_var < 100000) {
                  feedback_parts <- c(feedback_parts, paste0("• **VARIANTIE:** Je gaf ", format(student_var, big.mark=","), ", maar dit is te laag. Extreme waarde (Jennifer) zorgt voor hoge variantie: **226,854.09**"))
                } else {
                  feedback_parts <- c(feedback_parts, paste0("• **VARIANTIE:** Je gaf ", format(student_var, big.mark=","), ", maar correct antwoord is **226,854.09**"))
                }
              }
            }
            
            # STANDARD DEVIATION ERRORS
            if ("standaardafwijking" %in% names(results) && !results$standaardafwijking$correct && results$standaardafwijking$exists) {
              student_sd <- as.numeric(results$standaardafwijking$value)
              if (!is.na(student_sd)) {
                if (abs(student_sd - 226854.09) < 100) {
                  feedback_parts <- c(feedback_parts, paste0("• **STANDAARDAFWIJKING:** Je gaf ", format(student_sd, big.mark=","), ", maar je vergat de wortel. SD = √variantie = √226,854.09 = **476.29**"))
                } else if (abs(student_sd - 2268540.92) < 1000) {
                  feedback_parts <- c(feedback_parts, paste0("• **STANDAARDAFWIJKING:** Je gaf ", format(student_sd, big.mark=","), ", maar dit is som van kwadraten. SD = √(som/(n-1)) = **476.29**"))
                } else if (student_sd < 300) {
                  feedback_parts <- c(feedback_parts, paste0("• **STANDAARDAFWIJKING:** Je gaf ", student_sd, ", maar dit is te laag. Extreme waarde zorgt voor hoge spreiding: **476.29**"))
                } else if (student_sd > 600) {
                  feedback_parts <- c(feedback_parts, paste0("• **STANDAARDAFWIJKING:** Je gaf ", student_sd, ", maar dit is te hoog. Check variantie berekening: **476.29**"))
                } else {
                  feedback_parts <- c(feedback_parts, paste0("• **STANDAARDAFWIJKING:** Je gaf ", student_sd, ", maar correct antwoord is **476.29**"))
                }
              }
            }
          }

          feedback_parts <- c(
            feedback_parts,
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
            paste(feedback_parts, collapse = "\n\n"),
            type = "markdown"
          )
          
          # Final result
          generated == expected
        }
      )
    }
  )
})
