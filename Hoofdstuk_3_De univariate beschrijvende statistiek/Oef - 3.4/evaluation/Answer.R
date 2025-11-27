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
          
          # ----------------------
          # STAP 1 FEEDBACK - FREQUENTIETABEL EN CENTRALITEIT
          # ----------------------
          
          # Check frequencies first
          freq_vars <- c("freq_2", "freq_14", "freq_26", "freq_30", "freq_72", "freq_143", "freq_144", "freq_150", "freq_240", "freq_1657")
          freq_correct <- all(sapply(freq_vars[freq_vars %in% names(results)], function(x) results[[x]]$correct))
          
          if (freq_correct) {
            feedback_parts <- c(feedback_parts, "**STAP 1.1 - FREQUENTIES:** Correct geteld! ✅")
          } else {
            feedback_parts <- c(feedback_parts, "**STAP 1.1 - FREQUENTIES:** ❌")
            # Individual frequency errors
            if (!results$freq_2$correct && results$freq_2$exists) {
              student_f2 <- as.numeric(results$freq_2$value)
              feedback_parts <- c(feedback_parts, paste0("  • freq_2: Je gaf ", student_f2, ", maar correct is **1**"))
            }
            if (!results$freq_150$correct && results$freq_150$exists) {
              student_f150 <- as.numeric(results$freq_150$value)
              if (student_f150 == 1) {
                feedback_parts <- c(feedback_parts, paste0("  • freq_150: Je gaf ", student_f150, ", maar 150 komt 2x voor! Correct: **2**"))
              } else {
                feedback_parts <- c(feedback_parts, paste0("  • freq_150: Je gaf ", student_f150, ", maar correct is **2**"))
              }
            }
            if (!results$freq_1657$correct && results$freq_1657$exists) {
              student_f1657 <- as.numeric(results$freq_1657$value)
              if (student_f1657 == 0) {
                feedback_parts <- c(feedback_parts, paste0("  • freq_1657: Je gaf ", student_f1657, ", maar Jennifer Aniston (1657) staat wel in data! Correct: **1**"))
              } else {
                feedback_parts <- c(feedback_parts, paste0("  • freq_1657: Je gaf ", student_f1657, ", maar correct is **1**"))
              }
            }
          }
          
          # Check percentages
          percent_vars <- c("percent_2", "percent_14", "percent_26", "percent_30", "percent_72", "percent_143", "percent_144", "percent_150", "percent_240", "percent_1657")
          percent_correct <- all(sapply(percent_vars[percent_vars %in% names(results)], function(x) results[[x]]$correct))
          
          if (percent_correct) {
            feedback_parts <- c(feedback_parts, "**STAP 1.2 - PERCENTAGES:** (frequentie/11) * 100 ✅")
          } else {
            feedback_parts <- c(feedback_parts, "**STAP 1.2 - PERCENTAGES:** ❌")
            # Individual percentage errors
            if (!results$percent_150$correct && results$percent_150$exists) {
              student_p150 <- as.numeric(results$percent_150$value)
              if (abs(student_p150 - 9.1) < 0.1) {
                feedback_parts <- c(feedback_parts, paste0("  • percent_150: Je gaf ", student_p150, "%, maar je gebruikte freq=1 ipv freq=2. Correct: **18.2%**"))
              } else if (abs(student_p150 - 0.18) < 0.01) {
                feedback_parts <- c(feedback_parts, paste0("  • percent_150: Je gaf ", student_p150, ", maar vergat ×100. Correct: **18.2%**"))
              } else {
                feedback_parts <- c(feedback_parts, paste0("  • percent_150: Je gaf ", student_p150, "%, maar correct is **18.2%**"))
              }
            }
            if (!results$percent_1657$correct && results$percent_1657$exists) {
              student_p1657 <- as.numeric(results$percent_1657$value)
              if (abs(student_p1657 - 0) < 0.1) {
                feedback_parts <- c(feedback_parts, paste0("  • percent_1657: Je gaf ", student_p1657, "%, maar 1657 komt wel voor. Correct: **9.1%**"))
              } else {
                feedback_parts <- c(feedback_parts, paste0("  • percent_1657: Je gaf ", student_p1657, "%, maar correct is **9.1%**"))
              }
            }
          }
          
          # Check central tendency measures with detailed feedback
          if ("gemiddelde" %in% names(results) && results$gemiddelde$correct && "mediaan" %in% names(results) && results$mediaan$correct && "modus" %in% names(results) && results$modus$correct) {
            feedback_parts <- c(feedback_parts, "**STAP 1.3 - CENTRALITEIT:** Gemiddelde=238.91, Mediaan=143, Modus=150 ✅")
          } else {
            feedback_parts <- c(feedback_parts, "**STAP 1.3 - CENTRALITEIT:** ❌")
            if (!results$gemiddelde$correct && results$gemiddelde$exists) {
              student_answer <- as.numeric(results$gemiddelde$value)
              feedback_parts <- c(feedback_parts, paste0("  • Gemiddelde: Je gaf ", student_answer, ", maar correct is **238.91**"))
            }
            if (!results$mediaan$correct && results$mediaan$exists) {
              student_answer <- as.numeric(results$mediaan$value)
              feedback_parts <- c(feedback_parts, paste0("  • Mediaan: Je gaf ", student_answer, ", maar correct is **143** (6de waarde van 11)"))
            }
            if (!results$modus$correct && results$modus$exists) {
              student_answer <- as.character(results$modus$value)
              feedback_parts <- c(feedback_parts, paste0("  • Modus: Je gaf ", student_answer, ", maar correct is **150** (komt 2x voor)"))
            }
          }
          
          # ----------------------
          # STAP 2 FEEDBACK - SPREIDINGSMATEN
          # ----------------------
          
          # Check spread measures with detailed feedback
          if ("variatiebreedte" %in% names(results) && results$variatiebreedte$correct && "q1" %in% names(results) && results$q1$correct && "q3" %in% names(results) && results$q3$correct && "ika" %in% names(results) && results$ika$correct) {
            feedback_parts <- c(feedback_parts, "**STAP 2.1 - SPREIDING:** Range=1655, Q1=26, Q3=150, IKA=124 ✅")
          } else {
            feedback_parts <- c(feedback_parts, "**STAP 2.1 - SPREIDING:** ❌")
            if (!results$variatiebreedte$correct && results$variatiebreedte$exists) {
              student_answer <- as.numeric(results$variatiebreedte$value)
              feedback_parts <- c(feedback_parts, paste0("  • Range: Je gaf ", student_answer, ", maar correct is 1657-2 = **1655**"))
            }
            if (!results$q1$correct && results$q1$exists) {
              student_answer <- as.numeric(results$q1$value)
              feedback_parts <- c(feedback_parts, paste0("  • Q1: Je gaf ", student_answer, ", maar correct is **26**"))
            }
            if (!results$q3$correct && results$q3$exists) {
              student_answer <- as.numeric(results$q3$value)
              feedback_parts <- c(feedback_parts, paste0("  • Q3: Je gaf ", student_answer, ", maar correct is **150**"))
            }
            if (!results$ika$correct && results$ika$exists) {
              student_answer <- as.numeric(results$ika$value)
              feedback_parts <- c(feedback_parts, paste0("  • IKA: Je gaf ", student_answer, ", maar correct is 150-26 = **124**"))
            }
          }
          
          # ----------------------
          # STAP 3 FEEDBACK - GEAVANCEERDE BEREKENINGEN
          # ----------------------
          
          # Check afwijkingen
          afwijking_vars <- c("afwijking_2", "afwijking_14", "afwijking_26", "afwijking_30", "afwijking_72", "afwijking_143", "afwijking_144", "afwijking_150_1", "afwijking_150_2", "afwijking_240", "afwijking_1657")
          afwijkingen_correct <- all(sapply(afwijking_vars[afwijking_vars %in% names(results)], function(x) results[[x]]$correct))
          
          if (afwijkingen_correct) {
            feedback_parts <- c(feedback_parts, "**STAP 3.1 - AFWIJKINGEN:** X - 238.91 voor elke waarde ✅")
          } else {
            feedback_parts <- c(feedback_parts, "**STAP 3.1 - AFWIJKINGEN:** Bereken X - 238.91 voor elke datawaarde ❌")
          }
          
          # Check gekwadrateerde afwijkingen with specific error detection
          gekw_vars <- c("gekw_afwijking_2", "gekw_afwijking_14", "gekw_afwijking_26", "gekw_afwijking_30", "gekw_afwijking_72", "gekw_afwijking_143", "gekw_afwijking_144", "gekw_afwijking_150_1", "gekw_afwijking_150_2", "gekw_afwijking_240", "gekw_afwijking_1657")
          gekw_correct <- all(sapply(gekw_vars[gekw_vars %in% names(results)], function(x) results[[x]]$correct))
          
          if (gekw_correct) {
            feedback_parts <- c(feedback_parts, "**STAP 3.2 - GEKWADRATEERDE AFWIJKINGEN:** (afwijking)² ✅")
          } else {
            # Show detailed error explanations in step message like 3.3
            gekw_errors <- c()
            
            # Check specific errors for key values
            if ("gekw_afwijking_2" %in% names(results) && !results$gekw_afwijking_2$correct && results$gekw_afwijking_2$exists) {
              student_gekw2 <- as.numeric(results$gekw_afwijking_2$value)
              if (abs(student_gekw2 - 4) < 0.1) {
                gekw_errors <- c(gekw_errors, "X=2: Je gaf 4 (2²), maar moet zijn (2-238.91)² = **56,126.35**")
              } else {
                gekw_errors <- c(gekw_errors, paste0("X=2: Je gaf ", format(student_gekw2, big.mark=","), ", moet zijn **56,126.35**"))
              }
            }
            
            if ("gekw_afwijking_1657" %in% names(results) && !results$gekw_afwijking_1657$correct && results$gekw_afwijking_1657$exists) {
              student_gekw1657 <- as.numeric(results$gekw_afwijking_1657$value)
              if (abs(student_gekw1657 - 2743649) < 1000) {
                gekw_errors <- c(gekw_errors, "X=1657: Je gaf 1657², moet zijn (1657-238.91)² = **2,010,979.20**")
              } else {
                gekw_errors <- c(gekw_errors, paste0("X=1657: Je gaf ", format(student_gekw1657, big.mark=","), ", moet zijn **2,010,979.20**"))
              }
            }
            
            if ("gekw_afwijking_150_1" %in% names(results) && !results$gekw_afwijking_150_1$correct && results$gekw_afwijking_150_1$exists) {
              student_gekw150 <- as.numeric(results$gekw_afwijking_150_1$value)
              if (abs(student_gekw150 - 22500) < 100) {
                gekw_errors <- c(gekw_errors, "X=150: Je gaf 150², moet zijn (150-238.91)² = **7,905.01**")
              } else {
                gekw_errors <- c(gekw_errors, paste0("X=150: Je gaf ", format(student_gekw150, big.mark=","), ", moet zijn **7,905.01**"))
              }
            }
            
            if (length(gekw_errors) > 0) {
              feedback_parts <- c(feedback_parts, paste0("**STAP 3.2 - GEKWADRATEERDE AFWIJKINGEN:** Kwadrateer (X - gemiddelde)². ", paste(gekw_errors, collapse=" | "), " ❌"))
            } else {
              feedback_parts <- c(feedback_parts, "**STAP 3.2 - GEKWADRATEERDE AFWIJKINGEN:** Kwadrateer elke afwijking (X - 238.91)² ❌")
            }
          }
          
          # Check variance calculations with detailed feedback
          if ("sum_of_squares" %in% names(results) && results$sum_of_squares$correct && "variantie" %in% names(results) && results$variantie$correct && "standaardafwijking" %in% names(results) && results$standaardafwijking$correct) {
            feedback_parts <- c(feedback_parts, "**STAP 3.3 - VARIANTIE:** Som=2,268,540.92, Variantie=226,854.09, SD=476.29 ✅")
          } else {
            feedback_parts <- c(feedback_parts, "**STAP 3.3 - VARIANTIE:** ❌")
            if (!results$sum_of_squares$correct && results$sum_of_squares$exists) {
              student_answer <- as.numeric(results$sum_of_squares$value)
              feedback_parts <- c(feedback_parts, paste0("  • Som gekwadrateerde afwijkingen: Je gaf ", format(student_answer, big.mark=","), ", maar correct is **2,268,540.92**"))
            }
            if (!results$variantie$correct && results$variantie$exists) {
              student_answer <- as.numeric(results$variantie$value)
              feedback_parts <- c(feedback_parts, paste0("  • Variantie: Je gaf ", format(student_answer, big.mark=","), ", maar correct is som/(n-1) = **226,854.09**"))
            }
            if (!results$standaardafwijking$correct && results$standaardafwijking$exists) {
              student_answer <- as.numeric(results$standaardafwijking$value)
              feedback_parts <- c(feedback_parts, paste0("  • Standaardafwijking: Je gaf ", student_answer, ", maar correct is √variantie = **476.29**"))
            }
          }
          
          # ----------------------------------------
          # EXTRA UITLEG BIJ FOUTEN (zoals in 3.2)
          # ----------------------------------------
          
          if (correct_count != total_questions) {
            feedback_parts <- c(feedback_parts, "", "📚 **Uitleg van veelgemaakte fouten:**")
            
            # GEMIDDELDE fout
            if (!results$gemiddelde$correct) {
              if (!results$gemiddelde$exists) {
                feedback_parts <- c(
                  feedback_parts,
                  "• **GEMIDDELDE ONTBREEKT:** Variabele 'gemiddelde' niet gevonden! Som alle waarden en deel door n=11: (2+14+26+30+72+143+144+150+150+240+1657)/11 = **238.91**"
                )
              } else {
                student_answer <- as.numeric(results$gemiddelde$value)
                if (abs(student_answer - 216.27) < 0.5) {
                  feedback_parts <- c(feedback_parts, paste0("• **GEMIDDELDE FOUT:** Je gaf ", student_answer, ", maar je gebruikte waarschijnlijk n=10 in plaats van n=11. Correct antwoord is **238.91**"))
                } else if (abs(student_answer - 143) < 0.5) {
                  feedback_parts <- c(feedback_parts, paste0("• **GEMIDDELDE FOUT:** Je gaf ", student_answer, ", maar dit is de mediaan! Voor gemiddelde som je alle waarden en deel door n=11. Correct antwoord is **238.91**"))
                } else if (abs(student_answer - 150) < 0.5) {
                  feedback_parts <- c(feedback_parts, paste0("• **GEMIDDELDE FOUT:** Je gaf ", student_answer, ", maar dit is de modus! Voor gemiddelde som je alle waarden en deel door n=11. Correct antwoord is **238.91**"))
                } else {
                  feedback_parts <- c(feedback_parts, paste0("• **GEMIDDELDE FOUT:** Je gaf ", student_answer, ", maar correct antwoord is **238.91**. Som: 2+14+26+30+72+143+144+150+150+240+1657 = 2628, dan 2628/11 = 238.91"))
                }
              }
            }
            
            # MEDIAAN fout
            if (!results$mediaan$correct) {
              if (!results$mediaan$exists) {
                feedback_parts <- c(
                  feedback_parts,
                  "• **MEDIAAN ONTBREEKT:** Variabele 'mediaan' niet gevonden! Bij n=11 is mediaan de 6de waarde in gesorteerde lijst: **143**"
                )
              } else {
                student_answer <- as.numeric(results$mediaan$value)
                if (abs(student_answer - 238.91) < 0.5) {
                  feedback_parts <- c(feedback_parts, paste0("• **MEDIAAN FOUT:** Je gaf ", student_answer, ", maar dit is het gemiddelde! Voor mediaan sorteer je data en neem je de middelste waarde. Correct antwoord is **143**"))
                } else if (abs(student_answer - 72) < 0.5) {
                  feedback_parts <- c(feedback_parts, paste0("• **MEDIAAN FOUT:** Je gaf ", student_answer, ", maar dit is de 5de waarde. Bij n=11 is mediaan positie (11+1)/2 = 6. Correct antwoord is **143**"))
                } else if (abs(student_answer - 144) < 0.5) {
                  feedback_parts <- c(feedback_parts, paste0("• **MEDIAAN FOUT:** Je gaf ", student_answer, ", maar dit is de 7de waarde. Bij n=11 is mediaan de 6de waarde. Correct antwoord is **143**"))
                } else if (abs(student_answer - 150) < 0.5) {
                  feedback_parts <- c(feedback_parts, paste0("• **MEDIAAN FOUT:** Je gaf ", student_answer, ", maar dit is de 8de/9de waarde (modus). Mediaan is de 6de waarde. Correct antwoord is **143**"))
                } else {
                  feedback_parts <- c(feedback_parts, paste0("• **MEDIAAN FOUT:** Je gaf ", student_answer, ", maar correct antwoord is **143** (6de waarde van gesorteerde data: 2,14,26,30,72,**143**,144,150,150,240,1657)"))
                }
              }
            }
            
            # MODUS fout
            if (!results$modus$correct) {
              if (!results$modus$exists) {
                feedback_parts <- c(
                  feedback_parts,
                  "• **MODUS ONTBREEKT:** Variabele 'modus' niet gevonden! Zoek waarde die meest voorkomt: **150** (komt 2x voor)"
                )
              } else {
                student_answer <- as.character(results$modus$value)
                if (student_answer == "143") {
                  feedback_parts <- c(feedback_parts, paste0("• **MODUS FOUT:** Je gaf ", student_answer, ", maar dit komt maar 1x voor. Correct antwoord is **150** (komt 2x voor)"))
                } else if (student_answer == "238.91" || abs(suppressWarnings(as.numeric(student_answer)) - 238.91) < 0.5) {
                  feedback_parts <- c(feedback_parts, paste0("• **MODUS FOUT:** Je gaf ", student_answer, ", maar dit is het gemiddelde! Modus is de waarde die meest voorkomt. Correct antwoord is **150**"))
                } else if (tolower(student_answer) %in% c("geen", "na", "none")) {
                  feedback_parts <- c(feedback_parts, paste0("• **MODUS FOUT:** Je zei er is geen modus, maar **150** komt 2x voor terwijl alle andere waarden 1x voorkomen. Correct antwoord is **150**"))
                } else {
                  feedback_parts <- c(feedback_parts, paste0("• **MODUS FOUT:** Je gaf ", student_answer, ", maar correct antwoord is **150** (komt 2x voor in de dataset)"))
                }
              }
            }
            
            # RANGE fout
            if (!results$variatiebreedte$correct) {
              if (!results$variatiebreedte$exists) {
                feedback_parts <- c(
                  feedback_parts,
                  "• **RANGE ONTBREEKT:** Variabele 'variatiebreedte' niet gevonden! Range = maximum - minimum: 1657 - 2 = **1655**"
                )
              } else {
                student_answer <- as.numeric(results$variatiebreedte$value)
                if (abs(student_answer - 1659) < 0.5) {
                  feedback_parts <- c(feedback_parts, paste0("• **RANGE FOUT:** Je gaf ", student_answer, ", maar je deed 1657 + 2. Range is maximum - minimum. Correct antwoord is **1655**"))
                } else if (abs(student_answer - 238) < 0.5) {
                  feedback_parts <- c(feedback_parts, paste0("• **RANGE FOUT:** Je gaf ", student_answer, ", maar dit lijkt op 240-2. Je vergat de extreme waarde 1657! Correct antwoord is **1655**"))
                } else if (abs(student_answer - 142) < 0.5) {
                  feedback_parts <- c(feedback_parts, paste0("• **RANGE FOUT:** Je gaf ", student_answer, ", maar dit lijkt op 144-2. Je vergat de extreme waarde 1657! Correct antwoord is **1655**"))
                } else {
                  feedback_parts <- c(feedback_parts, paste0("• **RANGE FOUT:** Je gaf ", student_answer, ", maar correct antwoord is **1655** (maximum 1657 - minimum 2)"))
                }
              }
            }
            
            # Q1 fout
            if (!results$q1$correct) {
              if (!results$q1$exists) {
                feedback_parts <- c(
                  feedback_parts,
                  "• **Q1 ONTBREEKT:** Variabele 'q1' niet gevonden! Bij n=11 is Q1 de 3de waarde in gesorteerde lijst: **26**"
                )
              } else {
                student_answer <- as.numeric(results$q1$value)
                if (abs(student_answer - 14) < 0.5) {
                  feedback_parts <- c(feedback_parts, paste0("• **Q1 FOUT:** Je gaf ", student_answer, ", maar dit is de 2de waarde. Q1 is 25% punt = positie 3. Correct antwoord is **26**"))
                } else if (abs(student_answer - 30) < 0.5) {
                  feedback_parts <- c(feedback_parts, paste0("• **Q1 FOUT:** Je gaf ", student_answer, ", maar dit is de 4de waarde. Q1 is positie 3. Correct antwoord is **26**"))
                } else if (abs(student_answer - 2) < 0.5) {
                  feedback_parts <- c(feedback_parts, paste0("• **Q1 FOUT:** Je gaf ", student_answer, ", maar dit is de minimum waarde. Q1 is de 3de waarde. Correct antwoord is **26**"))
                } else {
                  feedback_parts <- c(feedback_parts, paste0("• **Q1 FOUT:** Je gaf ", student_answer, ", maar correct antwoord is **26** (3de waarde van gesorteerde data)"))
                }
              }
            }
            
            # Q3 fout
            if (!results$q3$correct) {
              if (!results$q3$exists) {
                feedback_parts <- c(
                  feedback_parts,
                  "• **Q3 ONTBREEKT:** Variabele 'q3' niet gevonden! Bij n=11 is Q3 de 9de waarde in gesorteerde lijst: **150**"
                )
              } else {
                student_answer <- as.numeric(results$q3$value)
                if (abs(student_answer - 144) < 0.5) {
                  feedback_parts <- c(feedback_parts, paste0("• **Q3 FOUT:** Je gaf ", student_answer, ", maar dit is de 7de waarde. Q3 is 75% punt = positie 9. Correct antwoord is **150**"))
                } else if (abs(student_answer - 240) < 0.5) {
                  feedback_parts <- c(feedback_parts, paste0("• **Q3 FOUT:** Je gaf ", student_answer, ", maar dit is de 10de waarde. Q3 is positie 9. Correct antwoord is **150**"))
                } else if (abs(student_answer - 1657) < 0.5) {
                  feedback_parts <- c(feedback_parts, paste0("• **Q3 FOUT:** Je gaf ", student_answer, ", maar dit is de maximum waarde. Q3 is de 9de waarde. Correct antwoord is **150**"))
                } else {
                  feedback_parts <- c(feedback_parts, paste0("• **Q3 FOUT:** Je gaf ", student_answer, ", maar correct antwoord is **150** (9de waarde van gesorteerde data)"))
                }
              }
            }
            
            # IKA fout
            if (!results$ika$correct) {
              if (!results$ika$exists) {
                feedback_parts <- c(
                  feedback_parts,
                  "• **IKA ONTBREEKT:** Variabele 'ika' niet gevonden! IKA = Q3 - Q1: 150 - 26 = **124**"
                )
              } else {
                student_answer <- as.numeric(results$ika$value)
                if (abs(student_answer - 126) < 0.5) {
                  feedback_parts <- c(feedback_parts, paste0("• **IKA FOUT:** Je gaf ", student_answer, ", maar dit suggereert Q1=24 of Q3=150. Check je kwartielen! Correct antwoord is **124**"))
                } else if (abs(student_answer - 176) < 0.5) {
                  feedback_parts <- c(feedback_parts, paste0("• **IKA FOUT:** Je gaf ", student_answer, ", maar je deed Q3 + Q1 in plaats van Q3 - Q1. Correct antwoord is **124**"))
                } else if (abs(student_answer - 1655) < 0.5) {
                  feedback_parts <- c(feedback_parts, paste0("• **IKA FOUT:** Je gaf ", student_answer, ", maar dit is de range, niet IKA! IKA = Q3 - Q1. Correct antwoord is **124**"))
                } else {
                  feedback_parts <- c(feedback_parts, paste0("• **IKA FOUT:** Je gaf ", student_answer, ", maar correct antwoord is **124** (Q3 - Q1 = 150 - 26)"))
                }
              }
            }
            
            # Som gekwadrateerde afwijkingen fout
            if (!results$sum_of_squares$correct) {
              if (!results$sum_of_squares$exists) {
                feedback_parts <- c(
                  feedback_parts,
                  "• **SOM KWADRATEN ONTBREEKT:** Variabele 'sum_of_squares' niet gevonden! Som alle (Xi - 238.91)²: **2,268,540.92**"
                )
              } else {
                student_answer <- as.numeric(results$sum_of_squares$value)
                if (abs(student_answer - 226854.09) < 100) {
                  feedback_parts <- c(feedback_parts, paste0("• **SOM KWADRATEN FOUT:** Je gaf ", format(student_answer, big.mark=","), ", maar je deelde al door n-1. We willen de som voor de deling. Correct antwoord is **2,268,540.92**"))
                } else if (abs(student_answer - 0) < 0.1) {
                  feedback_parts <- c(feedback_parts, paste0("• **SOM KWADRATEN FOUT:** Je gaf ", student_answer, ", maar dit is fout. Check of je afwijkingen correct berekende. Correct antwoord is **2,268,540.92**"))
                } else if (student_answer < 1000000) {
                  feedback_parts <- c(feedback_parts, paste0("• **SOM KWADRATEN FOUT:** Je gaf ", format(student_answer, big.mark=","), ", maar dit lijkt te laag door de extreme waarde 1657. Correct antwoord is **2,268,540.92**"))
                } else {
                  feedback_parts <- c(feedback_parts, paste0("• **SOM KWADRATEN FOUT:** Je gaf ", format(student_answer, big.mark=","), ", maar correct antwoord is **2,268,540.92**"))
                }
              }
            }
            
            # Variantie fout
            if (!results$variantie$correct) {
              if (!results$variantie$exists) {
                feedback_parts <- c(
                  feedback_parts,
                  "• **VARIANTIE ONTBREEKT:** Variabele 'variantie' niet gevonden! Voor steekproef: Som/(n-1) = 2,268,540.92/10 = **226,854.09**"
                )
              } else {
                student_answer <- as.numeric(results$variantie$value)
                if (abs(student_answer - 206230.84) < 100) {
                  feedback_parts <- c(feedback_parts, paste0("• **VARIANTIE FOUT:** Je gaf ", format(student_answer, big.mark=","), ", maar je deelde door n=11. Voor steekproef gebruik n-1=10. Correct antwoord is **226,854.09**"))
                } else if (abs(student_answer - 2268540.92) < 100) {
                  feedback_parts <- c(feedback_parts, paste0("• **VARIANTIE FOUT:** Je gaf ", format(student_answer, big.mark=","), ", maar dit is de som zelf. Je moet delen door n-1=10. Correct antwoord is **226,854.09**"))
                } else if (abs(student_answer - 238.91) < 0.5) {
                  feedback_parts <- c(feedback_parts, paste0("• **VARIANTIE FOUT:** Je gaf ", student_answer, ", maar dit is het gemiddelde! Variantie = som gekwadrateerde afwijkingen/(n-1). Correct antwoord is **226,854.09**"))
                } else {
                  feedback_parts <- c(feedback_parts, paste0("• **VARIANTIE FOUT:** Je gaf ", format(student_answer, big.mark=","), ", maar correct antwoord is **226,854.09**"))
                }
              }
            }
            
            # Standaardafwijking fout
            if (!results$standaardafwijking$correct) {
              if (!results$standaardafwijking$exists) {
                feedback_parts <- c(
                  feedback_parts,
                  "• **STANDAARDAFWIJKING ONTBREEKT:** Variabele 'standaardafwijking' niet gevonden! Standaardafwijking = √variantie = √226,854.09 = **476.29**"
                )
              } else {
                student_answer <- as.numeric(results$standaardafwijking$value)
                if (abs(student_answer - 226854.09) < 100) {
                  feedback_parts <- c(feedback_parts, paste0("• **STANDAARDAFWIJKING FOUT:** Je gaf ", format(student_answer, big.mark=","), ", maar dit is de variantie zelf. Je vergat de wortel te trekken. Correct antwoord is **476.29**"))
                } else if (abs(student_answer - 454.12) < 1) {
                  feedback_parts <- c(feedback_parts, paste0("• **STANDAARDAFWIJKING FOUT:** Je gaf ", student_answer, ", maar je gebruikte n=11 in plaats van n-1=10 bij variantie. Correct antwoord is **476.29**"))
                } else if (abs(student_answer - 2268540.92) < 100) {
                  feedback_parts <- c(feedback_parts, paste0("• **STANDAARDAFWIJKING FOUT:** Je gaf ", format(student_answer, big.mark=","), ", maar dit is de som gekwadrateerde afwijkingen. SD = √(som/(n-1)). Correct antwoord is **476.29**"))
                } else {
                  feedback_parts <- c(feedback_parts, paste0("• **STANDAARDAFWIJKING FOUT:** Je gaf ", student_answer, ", maar correct antwoord is **476.29** (√variantie = √226,854.09)"))
                }
              }
            }
            
            # Gekwadrateerde afwijkingen feedback is now handled in step message above
            
            # Afwijkingen fout - detailed analysis like in 3.2  
            afwijking_vars <- c("afwijking_2", "afwijking_14", "afwijking_26", "afwijking_30", "afwijking_72", "afwijking_143", "afwijking_144", "afwijking_150_1", "afwijking_150_2", "afwijking_240", "afwijking_1657")
            wrong_afwijkingen <- sapply(afwijking_vars, function(x) x %in% names(results) && !results[[x]]$correct)
            if (any(wrong_afwijkingen)) {
              # Check for specific common errors in deviations
              if ("afwijking_2" %in% names(results) && !results$afwijking_2$correct && results$afwijking_2$exists) {
                student_afw2 <- as.numeric(results$afwijking_2$value)
                if (abs(student_afw2 - 236.91) < 0.1) {
                  feedback_parts <- c(feedback_parts, paste0("• **AFWIJKING_2 FOUT:** Je gaf ", student_afw2, ", maar je nam de absolute waarde. Afwijkingen kunnen negatief zijn: 2-238.91 = **-236.91**"))
                } else if (abs(student_afw2 - 2) < 0.1) {
                  feedback_parts <- c(feedback_parts, paste0("• **AFWIJKING_2 FOUT:** Je gaf ", student_afw2, ", maar dit is de originele waarde. Afwijking = X - gemiddelde: 2-238.91 = **-236.91**"))
                } else {
                  feedback_parts <- c(feedback_parts, paste0("• **AFWIJKING_2 FOUT:** Je gaf ", student_afw2, ", maar correct antwoord is **-236.91** (2 - 238.91)"))
                }
              }
              
              if ("afwijking_1657" %in% names(results) && !results$afwijking_1657$correct && results$afwijking_1657$exists) {
                student_afw1657 <- as.numeric(results$afwijking_1657$value)
                if (abs(student_afw1657 - 1657) < 0.1) {
                  feedback_parts <- c(feedback_parts, paste0("• **AFWIJKING_1657 FOUT:** Je gaf ", student_afw1657, ", maar dit is de originele waarde. Afwijking = X - gemiddelde: 1657-238.91 = **1418.09**"))
                } else if (abs(student_afw1657 + 1418.09) < 0.1) {
                  feedback_parts <- c(feedback_parts, paste0("• **AFWIJKING_1657 FOUT:** Je gaf ", student_afw1657, ", maar het teken is verkeerd. Dit is een positieve afwijking: 1657-238.91 = **+1418.09**"))
                } else {
                  feedback_parts <- c(feedback_parts, paste0("• **AFWIJKING_1657 FOUT:** Je gaf ", student_afw1657, ", maar correct antwoord is **+1418.09** (1657 - 238.91)"))
                }
              }
              
              # General deviations error message
              if (sum(wrong_afwijkingen) > 2) {
                feedback_parts <- c(feedback_parts, "• **AFWIJKINGEN FOUT:** Bereken X - 238.91 voor elke waarde. Afwijkingen kunnen negatief zijn! Voorbeeld: voor X=2 → 2-238.91 = -236.91")
              }
            }
            
            # Frequency errors - specific analysis like in 3.2
            freq_vars <- c("freq_2", "freq_14", "freq_26", "freq_30", "freq_72", "freq_143", "freq_144", "freq_150", "freq_240", "freq_1657")
            wrong_freqs <- sapply(freq_vars, function(x) x %in% names(results) && !results[[x]]$correct)
            if (any(wrong_freqs)) {
              # Check for specific frequent errors
              if ("freq_150" %in% names(results) && !results$freq_150$correct && results$freq_150$exists) {
                student_f150 <- as.numeric(results$freq_150$value)
                if (student_f150 == 1) {
                  feedback_parts <- c(feedback_parts, paste0("• **FREQ_150 FOUT:** Je gaf ", student_f150, ", maar 150 komt 2x voor in de dataset (dubbel!). Correct antwoord is **2**"))
                } else {
                  feedback_parts <- c(feedback_parts, paste0("• **FREQ_150 FOUT:** Je gaf ", student_f150, ", maar correct antwoord is **2** (150 komt 2x voor)"))
                }
              }
              if ("freq_1657" %in% names(results) && !results$freq_1657$correct && results$freq_1657$exists) {
                student_f1657 <- as.numeric(results$freq_1657$value)
                if (student_f1657 == 0) {
                  feedback_parts <- c(feedback_parts, paste0("• **FREQ_1657 FOUT:** Je gaf ", student_f1657, ", maar 1657 (Jennifer Aniston) komt wel voor in de data! Correct antwoord is **1**"))
                } else {
                  feedback_parts <- c(feedback_parts, paste0("• **FREQ_1657 FOUT:** Je gaf ", student_f1657, ", maar correct antwoord is **1** (extreme uitbijter)"))
                }
              }
              # General frequency error message
              if (sum(wrong_freqs) > 2) {
                feedback_parts <- c(feedback_parts, "• **FREQUENTIES FOUT:** Tel precies: 2(1x), 14(1x), 26(1x), 30(1x), 72(1x), 143(1x), 144(1x), **150(2x)**, 240(1x), 1657(1x)")
              }
            }
            
            # Percentage errors - specific analysis like in 3.2
            percent_vars <- c("percent_2", "percent_14", "percent_26", "percent_30", "percent_72", "percent_143", "percent_144", "percent_150", "percent_240", "percent_1657")
            wrong_percents <- sapply(percent_vars, function(x) x %in% names(results) && !results[[x]]$correct)
            if (any(wrong_percents)) {
              # Check for specific common errors
              if ("percent_150" %in% names(results) && !results$percent_150$correct && results$percent_150$exists) {
                student_p150 <- as.numeric(results$percent_150$value)
                if (abs(student_p150 - 9.1) < 0.1) {
                  feedback_parts <- c(feedback_parts, paste0("• **PERCENT_150 FOUT:** Je gaf ", student_p150, "%, maar je gebruikte frequentie 1 in plaats van 2. Correct: (2/11) × 100 = **18.2%**"))
                } else if (abs(student_p150 - 0.182) < 0.01) {
                  feedback_parts <- c(feedback_parts, paste0("• **PERCENT_150 FOUT:** Je gaf ", student_p150, ", maar je vergat ×100. Dit is de proportie. Correct antwoord is **18.2%**"))
                } else {
                  feedback_parts <- c(feedback_parts, paste0("• **PERCENT_150 FOUT:** Je gaf ", student_p150, "%, maar correct antwoord is **18.2%** (2/11 × 100)"))
                }
              }
              # General percentage error message
              if (sum(wrong_percents) > 1) {
                feedback_parts <- c(feedback_parts, "• **PERCENTAGES FOUT:** Gebruik formule (frequentie/n) × 100. Bijvoorbeeld voor 150: (2/11) × 100 = 18.2%")
              }
            }
          }
          
          feedback_parts <- c(
            feedback_parts,
            "",
            paste0("**", correct_count, " van ", total_questions, " juist**"),
            "",
            "🔍 **BELANGRIJKE REGELS VOOR EXTREME WAARDEN:**",
            "• **Extreme uitbijter impact:** Jennifer Aniston (1657 dagen) beïnvloedt gemiddelde sterk",
            "• **Mediaan is robuuster** dan gemiddelde bij uitbijters (143 vs 238.91)",
            "• **Afwijkingen kunnen negatief zijn** (X - μ), maar kwadraten altijd positief",
            "• **IKA minder gevoelig** voor extreme waarden dan range (124 vs 1655)", 
            "• **Bij steekproef: variantie = SS/(n-1)** → 2,268,540.92/10 = 226,854.09",
            "• **Standaardafwijking = √variantie** → √226,854.09 = 476.29 dagen"
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
