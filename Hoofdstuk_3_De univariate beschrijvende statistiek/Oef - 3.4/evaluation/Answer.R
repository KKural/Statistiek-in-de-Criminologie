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
          
          # Individual afwijking (deviation) variables
          afwijking_vars_individual <- list(
            "afwijking_240" = 1.09,
            "afwijking_144" = -94.91,
            "afwijking_143" = -95.91,
            "afwijking_72" = -166.91,
            "afwijking_30" = -208.91,
            "afwijking_26" = -212.91,
            "afwijking_2" = -236.91,
            "afwijking_150_1" = -88.91,
            "afwijking_14" = -224.91,
            "afwijking_150_2" = -88.91,
            "afwijking_1657" = 1418.09
          )
          
          for (var_name in names(afwijking_vars_individual)) {
            expected_val <- afwijking_vars_individual[[var_name]]
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
          
          # Individual gekwadrateerde afwijking (squared deviation) variables
          gekw_vars_individual <- list(
            "gekw_afwijking_240" = 1.1881,
            "gekw_afwijking_144" = 9007.9081,
            "gekw_afwijking_143" = 9198.7281,
            "gekw_afwijking_72" = 27859.1481,
            "gekw_afwijking_30" = 43643.5881,
            "gekw_afwijking_26" = 45331.0681,
            "gekw_afwijking_2" = 56126.3481,
            "gekw_afwijking_150_1" = 7905.0081,
            "gekw_afwijking_14" = 50584.5081,
            "gekw_afwijking_150_2" = 7905.0081,
            "gekw_afwijking_1657" = 2010979.1981
          )
          
          for (var_name in names(gekw_vars_individual)) {
            expected_val <- gekw_vars_individual[[var_name]]
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
          
          # Check each frequency individually
          feedback_parts <- c(feedback_parts, "**STAP 1.1 - FREQUENTIES:**")
          all_freq_correct <- TRUE
          freq_vars <- c("freq_2", "freq_14", "freq_26", "freq_30", "freq_72", "freq_143", "freq_144", "freq_150", "freq_240", "freq_1657")
          
          for (freq_var in freq_vars) {
            if (freq_var %in% names(results)) {
              if (!results[[freq_var]]$correct) {
                all_freq_correct <- FALSE
                student_val <- as.numeric(results[[freq_var]]$value)
                expected_val <- results[[freq_var]]$expected
                
                if (freq_var == "freq_150" && student_val == 1) {
                  feedback_parts <- c(feedback_parts, paste0("  • ", freq_var, ": Je gaf ", student_val, ", maar 150 komt 2x voor! Correct: **", expected_val, "**"))
                } else if (freq_var == "freq_1657" && student_val == 0) {
                  feedback_parts <- c(feedback_parts, paste0("  • ", freq_var, ": Je gaf ", student_val, ", maar Jennifer Aniston (1657) staat wel in data! Correct: **", expected_val, "**"))
                } else {
                  feedback_parts <- c(feedback_parts, paste0("  • ", freq_var, ": Je gaf ", student_val, ", maar correct is **", expected_val, "**"))
                }
              }
            } else {
              all_freq_correct <- FALSE
              feedback_parts <- c(feedback_parts, paste0("  • ", freq_var, ": Ontbreekt ❌"))
            }
          }
          
          if (all_freq_correct) {
            feedback_parts[length(feedback_parts)] <- "**STAP 1.1 - FREQUENTIES:** Alle frequenties correct geteld! ✅"
          } else {
            feedback_parts[1] <- "**STAP 1.1 - FREQUENTIES:** ❌"
          }
          
          # Check each percentage individually  
          feedback_parts <- c(feedback_parts, "**STAP 1.2 - PERCENTAGES:**")
          all_percent_correct <- TRUE
          percent_vars <- c("percent_2", "percent_14", "percent_26", "percent_30", "percent_72", "percent_143", "percent_144", "percent_150", "percent_240", "percent_1657")
          
          for (percent_var in percent_vars) {
            if (percent_var %in% names(results)) {
              if (!results[[percent_var]]$correct) {
                all_percent_correct <- FALSE
                student_val <- as.numeric(results[[percent_var]]$value)
                expected_val <- results[[percent_var]]$expected
                
                if (percent_var == "percent_150" && abs(student_val - 9.1) < 0.1) {
                  feedback_parts <- c(feedback_parts, paste0("  • ", percent_var, ": Je gaf ", student_val, "%, maar je gebruikte freq=1 ipv freq=2. Correct: **", expected_val, "%**"))
                } else if (percent_var == "percent_150" && abs(student_val - 0.18) < 0.01) {
                  feedback_parts <- c(feedback_parts, paste0("  • ", percent_var, ": Je gaf ", student_val, ", maar vergat ×100. Correct: **", expected_val, "%**"))
                } else if (percent_var == "percent_1657" && abs(student_val - 0) < 0.1) {
                  feedback_parts <- c(feedback_parts, paste0("  • ", percent_var, ": Je gaf ", student_val, "%, maar 1657 komt wel voor. Correct: **", expected_val, "%**"))
                } else {
                  feedback_parts <- c(feedback_parts, paste0("  • ", percent_var, ": Je gaf ", student_val, "%, maar correct is **", expected_val, "%**"))
                }
              }
            } else {
              all_percent_correct <- FALSE
              feedback_parts <- c(feedback_parts, paste0("  • ", percent_var, ": Ontbreekt ❌"))
            }
          }
          
          if (all_percent_correct) {
            feedback_parts[length(feedback_parts)] <- "**STAP 1.2 - PERCENTAGES:** Alle percentages correct berekend! ✅"
          } else {
            feedback_parts[length(feedback_parts) - length(percent_vars)] <- "**STAP 1.2 - PERCENTAGES:** ❌"
          }
          
          # Check each centrality measure individually
          feedback_parts <- c(feedback_parts, "**STAP 1.3 - CENTRALITEIT:**")
          all_central_correct <- TRUE
          
          if ("gemiddelde" %in% names(results)) {
            if (!results$gemiddelde$correct) {
              all_central_correct <- FALSE
              if (results$gemiddelde$exists) {
                student_answer <- as.numeric(results$gemiddelde$value)
                if (abs(student_answer - 216.27) < 0.5) {
                  feedback_parts <- c(feedback_parts, paste0("  • Gemiddelde: Je gaf ", student_answer, ", maar je gebruikte n=10 ipv n=11. Correct: **238.91**"))
                } else if (abs(student_answer - 143) < 0.5) {
                  feedback_parts <- c(feedback_parts, paste0("  • Gemiddelde: Je gaf ", student_answer, ", maar dit is de mediaan! Correct: **238.91**"))
                } else {
                  feedback_parts <- c(feedback_parts, paste0("  • Gemiddelde: Je gaf ", student_answer, ", maar correct is **238.91**"))
                }
              } else {
                feedback_parts <- c(feedback_parts, "  • Gemiddelde: Ontbreekt ❌")
              }
            }
          } else {
            all_central_correct <- FALSE
            feedback_parts <- c(feedback_parts, "  • Gemiddelde: Ontbreekt ❌")
          }
          
          if ("mediaan" %in% names(results)) {
            if (!results$mediaan$correct) {
              all_central_correct <- FALSE
              if (results$mediaan$exists) {
                student_answer <- as.numeric(results$mediaan$value)
                if (abs(student_answer - 238.91) < 0.5) {
                  feedback_parts <- c(feedback_parts, paste0("  • Mediaan: Je gaf ", student_answer, ", maar dit is het gemiddelde! Correct: **143**"))
                } else if (abs(student_answer - 144) < 0.5) {
                  feedback_parts <- c(feedback_parts, paste0("  • Mediaan: Je gaf ", student_answer, ", maar dit is 7de waarde. Mediaan is 6de waarde: **143**"))
                } else {
                  feedback_parts <- c(feedback_parts, paste0("  • Mediaan: Je gaf ", student_answer, ", maar correct is **143** (6de waarde van 11)"))
                }
              } else {
                feedback_parts <- c(feedback_parts, "  • Mediaan: Ontbreekt ❌")
              }
            }
          } else {
            all_central_correct <- FALSE
            feedback_parts <- c(feedback_parts, "  • Mediaan: Ontbreekt ❌")
          }
          
          if ("modus" %in% names(results)) {
            if (!results$modus$correct) {
              all_central_correct <- FALSE
              if (results$modus$exists) {
                student_answer <- as.character(results$modus$value)
                if (student_answer == "143") {
                  feedback_parts <- c(feedback_parts, paste0("  • Modus: Je gaf ", student_answer, ", maar dit komt 1x voor. **150** komt 2x voor!"))
                } else {
                  feedback_parts <- c(feedback_parts, paste0("  • Modus: Je gaf ", student_answer, ", maar correct is **150** (komt 2x voor)"))
                }
              } else {
                feedback_parts <- c(feedback_parts, "  • Modus: Ontbreekt ❌")
              }
            }
          } else {
            all_central_correct <- FALSE
            feedback_parts <- c(feedback_parts, "  • Modus: Ontbreekt ❌")
          }
          
          if (all_central_correct) {
            feedback_parts[length(feedback_parts) - 2] <- "**STAP 1.3 - CENTRALITEIT:** Gemiddelde=238.91, Mediaan=143, Modus=150 ✅"
            # Remove individual success messages since overall is correct
            feedback_parts <- feedback_parts[!grepl("^\\s*•", feedback_parts)]
          } else {
            feedback_parts[1] <- "**STAP 1.3 - CENTRALITEIT:** ❌"
          }
          
          # ----------------------
          # STAP 2 FEEDBACK - SPREIDINGSMATEN
          # ----------------------
          
          # Check each spread measure individually
          feedback_parts <- c(feedback_parts, "**STAP 2.1 - SPREIDING:**")
          all_spread_correct <- TRUE
          
          if ("variatiebreedte" %in% names(results)) {
            if (!results$variatiebreedte$correct) {
              all_spread_correct <- FALSE
              if (results$variatiebreedte$exists) {
                student_answer <- as.numeric(results$variatiebreedte$value)
                if (abs(student_answer - 1659) < 0.5) {
                  feedback_parts <- c(feedback_parts, paste0("  • Range: Je gaf ", student_answer, ", maar je deed 1657+2. Range = max-min = **1655**"))
                } else if (abs(student_answer - 238) < 0.5) {
                  feedback_parts <- c(feedback_parts, paste0("  • Range: Je gaf ", student_answer, ", maar je vergat extreme waarde 1657! Correct: **1655**"))
                } else {
                  feedback_parts <- c(feedback_parts, paste0("  • Range: Je gaf ", student_answer, ", maar correct is 1657-2 = **1655**"))
                }
              } else {
                feedback_parts <- c(feedback_parts, "  • Range: Ontbreekt ❌")
              }
            }
          } else {
            all_spread_correct <- FALSE
            feedback_parts <- c(feedback_parts, "  • Range: Ontbreekt ❌")
          }
          
          if ("q1" %in% names(results)) {
            if (!results$q1$correct) {
              all_spread_correct <- FALSE
              if (results$q1$exists) {
                student_answer <- as.numeric(results$q1$value)
                if (abs(student_answer - 14) < 0.5) {
                  feedback_parts <- c(feedback_parts, paste0("  • Q1: Je gaf ", student_answer, ", maar dit is 2de waarde. Q1 is 3de waarde: **26**"))
                } else if (abs(student_answer - 30) < 0.5) {
                  feedback_parts <- c(feedback_parts, paste0("  • Q1: Je gaf ", student_answer, ", maar dit is 4de waarde. Q1 is 3de waarde: **26**"))
                } else {
                  feedback_parts <- c(feedback_parts, paste0("  • Q1: Je gaf ", student_answer, ", maar correct is **26**"))
                }
              } else {
                feedback_parts <- c(feedback_parts, "  • Q1: Ontbreekt ❌")
              }
            }
          } else {
            all_spread_correct <- FALSE
            feedback_parts <- c(feedback_parts, "  • Q1: Ontbreekt ❌")
          }
          
          if ("q3" %in% names(results)) {
            if (!results$q3$correct) {
              all_spread_correct <- FALSE
              if (results$q3$exists) {
                student_answer <- as.numeric(results$q3$value)
                if (abs(student_answer - 144) < 0.5) {
                  feedback_parts <- c(feedback_parts, paste0("  • Q3: Je gaf ", student_answer, ", maar dit is 7de waarde. Q3 is 9de waarde: **150**"))
                } else if (abs(student_answer - 240) < 0.5) {
                  feedback_parts <- c(feedback_parts, paste0("  • Q3: Je gaf ", student_answer, ", maar dit is 10de waarde. Q3 is 9de waarde: **150**"))
                } else {
                  feedback_parts <- c(feedback_parts, paste0("  • Q3: Je gaf ", student_answer, ", maar correct is **150**"))
                }
              } else {
                feedback_parts <- c(feedback_parts, "  • Q3: Ontbreekt ❌")
              }
            }
          } else {
            all_spread_correct <- FALSE
            feedback_parts <- c(feedback_parts, "  • Q3: Ontbreekt ❌")
          }
          
          if ("ika" %in% names(results)) {
            if (!results$ika$correct) {
              all_spread_correct <- FALSE
              if (results$ika$exists) {
                student_answer <- as.numeric(results$ika$value)
                if (abs(student_answer - 176) < 0.5) {
                  feedback_parts <- c(feedback_parts, paste0("  • IKA: Je gaf ", student_answer, ", maar je deed Q3+Q1. IKA = Q3-Q1 = **124**"))
                } else if (abs(student_answer - 1655) < 0.5) {
                  feedback_parts <- c(feedback_parts, paste0("  • IKA: Je gaf ", student_answer, ", maar dit is de range! IKA = Q3-Q1 = **124**"))
                } else {
                  feedback_parts <- c(feedback_parts, paste0("  • IKA: Je gaf ", student_answer, ", maar correct is 150-26 = **124**"))
                }
              } else {
                feedback_parts <- c(feedback_parts, "  • IKA: Ontbreekt ❌")
              }
            }
          } else {
            all_spread_correct <- FALSE
            feedback_parts <- c(feedback_parts, "  • IKA: Ontbreekt ❌")
          }
          
          if (all_spread_correct) {
            # Remove individual messages and show overall success
            start_idx <- which(feedback_parts == "**STAP 2.1 - SPREIDING:**")
            feedback_parts <- feedback_parts[1:(start_idx-1)]
            feedback_parts <- c(feedback_parts, "**STAP 2.1 - SPREIDING:** Range=1655, Q1=26, Q3=150, IKA=124 ✅")
          } else {
            feedback_parts[which(feedback_parts == "**STAP 2.1 - SPREIDING:**")] <- "**STAP 2.1 - SPREIDING:** ❌"
          }
          
          # ----------------------
          # STAP 3 FEEDBACK - GEAVANCEERDE BEREKENINGEN
          # ----------------------
          
          # Check each afwijking individually
          feedback_parts <- c(feedback_parts, "**STAP 3.1 - AFWIJKINGEN:**")
          all_afwijkingen_correct <- TRUE
          afwijking_vars <- c("afwijking_240", "afwijking_144", "afwijking_143", "afwijking_72", "afwijking_30", "afwijking_26", "afwijking_2", "afwijking_150_1", "afwijking_14", "afwijking_150_2", "afwijking_1657")
          
          for (afw_var in afwijking_vars) {
            if (afw_var %in% names(results)) {
              if (!results[[afw_var]]$correct) {
                all_afwijkingen_correct <- FALSE
                if (results[[afw_var]]$exists) {
                  student_val <- as.numeric(results[[afw_var]]$value)
                  expected_val <- results[[afw_var]]$expected
                  
                  # Specific error messages for common mistakes
                  if (afw_var == "afwijking_2" && abs(student_val - 236.91) < 0.1) {
                    feedback_parts <- c(feedback_parts, paste0("  • ", afw_var, ": Je gaf ", student_val, ", maar je vergat het minteken. Correct: **", expected_val, "**"))
                  } else if (afw_var == "afwijking_1657" && abs(student_val - 1657) < 1) {
                    feedback_parts <- c(feedback_parts, paste0("  • ", afw_var, ": Je gaf ", student_val, ", maar dit is de originele waarde. 1657-238.91 = **", expected_val, "**"))
                  } else if (abs(student_val - 238.91) < 1) {
                    feedback_parts <- c(feedback_parts, paste0("  • ", afw_var, ": Je gaf ", student_val, ", maar dit is het gemiddelde. Correct: **", expected_val, "**"))
                  } else {
                    feedback_parts <- c(feedback_parts, paste0("  • ", afw_var, ": Je gaf ", student_val, ", maar correct is **", expected_val, "**"))
                  }
                } else {
                  all_afwijkingen_correct <- FALSE
                  feedback_parts <- c(feedback_parts, paste0("  • ", afw_var, ": Ontbreekt ❌"))
                }
              }
            } else {
              all_afwijkingen_correct <- FALSE
              feedback_parts <- c(feedback_parts, paste0("  • ", afw_var, ": Ontbreekt ❌"))
            }
          }
          
          if (all_afwijkingen_correct) {
            feedback_parts[length(feedback_parts) - length(afwijking_vars)] <- "**STAP 3.1 - AFWIJKINGEN:** X - 238.91 voor elke waarde ✅"
            # Remove individual success messages
            feedback_parts <- feedback_parts[!grepl(paste0("^\\s*•\\s*(", paste(afwijking_vars, collapse="|"), ")"), feedback_parts)]
          } else {
            feedback_parts[1] <- "**STAP 3.1 - AFWIJKINGEN:** ❌"
          }
          
          # Check each gekwadrateerde afwijking individually
          feedback_parts <- c(feedback_parts, "**STAP 3.2 - GEKWADRATEERDE AFWIJKINGEN:**")
          all_gekw_correct <- TRUE
          gekw_vars <- c("gekw_afwijking_240", "gekw_afwijking_144", "gekw_afwijking_143", "gekw_afwijking_72", "gekw_afwijking_30", "gekw_afwijking_26", "gekw_afwijking_2", "gekw_afwijking_150_1", "gekw_afwijking_14", "gekw_afwijking_150_2", "gekw_afwijking_1657")
          
          for (gekw_var in gekw_vars) {
            if (gekw_var %in% names(results)) {
              if (!results[[gekw_var]]$correct) {
                all_gekw_correct <- FALSE
                if (results[[gekw_var]]$exists) {
                  student_val <- as.numeric(results[[gekw_var]]$value)
                  expected_val <- results[[gekw_var]]$expected
                  
                  # Specific error messages for common mistakes
                  if (gekw_var == "gekw_afwijking_2" && abs(student_val - 4) < 0.1) {
                    feedback_parts <- c(feedback_parts, paste0("  • ", gekw_var, ": Je gaf 4 (2²), maar moet zijn (2-238.91)² = **", format(expected_val, big.mark=","), "**"))
                  } else if (gekw_var == "gekw_afwijking_1657" && abs(student_val - 2743649) < 1000) {
                    feedback_parts <- c(feedback_parts, paste0("  • ", gekw_var, ": Je gaf 1657², moet zijn (1657-238.91)² = **", format(expected_val, big.mark=","), "**"))
                  } else if (gekw_var == "gekw_afwijking_150_1" && abs(student_val - 22500) < 100) {
                    feedback_parts <- c(feedback_parts, paste0("  • ", gekw_var, ": Je gaf 150², moet zijn (150-238.91)² = **", format(expected_val, big.mark=","), "**"))
                  } else if (gekw_var == "gekw_afwijking_150_2" && abs(student_val - 22500) < 100) {
                    feedback_parts <- c(feedback_parts, paste0("  • ", gekw_var, ": Je gaf 150², moet zijn (150-238.91)² = **", format(expected_val, big.mark=","), "**"))
                  } else if (student_val < 0) {
                    feedback_parts <- c(feedback_parts, paste0("  • ", gekw_var, ": Je gaf ", student_val, ", maar kwadraten zijn altijd positief! Correct: **", format(expected_val, big.mark=","), "**"))
                  } else {
                    feedback_parts <- c(feedback_parts, paste0("  • ", gekw_var, ": Je gaf ", format(student_val, big.mark=","), ", maar correct is **", format(expected_val, big.mark=","), "**"))
                  }
                } else {
                  all_gekw_correct <- FALSE
                  feedback_parts <- c(feedback_parts, paste0("  • ", gekw_var, ": Ontbreekt ❌"))
                }
              }
            } else {
              all_gekw_correct <- FALSE
              feedback_parts <- c(feedback_parts, paste0("  • ", gekw_var, ": Ontbreekt ❌"))
            }
          }
          
          if (all_gekw_correct) {
            feedback_parts[length(feedback_parts) - length(gekw_vars)] <- "**STAP 3.2 - GEKWADRATEERDE AFWIJKINGEN:** (afwijking)² ✅"
            # Remove individual success messages
            feedback_parts <- feedback_parts[!grepl(paste0("^\\s*•\\s*(", paste(gekw_vars, collapse="|"), ")"), feedback_parts)]
          } else {
            feedback_parts[1] <- "**STAP 3.2 - GEKWADRATEERDE AFWIJKINGEN:** ❌"
          }
          
          # Check each variance calculation individually
          feedback_parts <- c(feedback_parts, "**STAP 3.3 - VARIANTIE:**")
          all_variance_correct <- TRUE
          
          if ("sum_of_squares" %in% names(results)) {
            if (!results$sum_of_squares$correct) {
              all_variance_correct <- FALSE
              if (results$sum_of_squares$exists) {
                student_answer <- as.numeric(results$sum_of_squares$value)
                if (abs(student_answer - 226854.09) < 100) {
                  feedback_parts <- c(feedback_parts, paste0("  • Som gekwadrateerde afwijkingen: Je gaf ", format(student_answer, big.mark=","), ", maar je deelde al door n-1. We willen de som: **2,268,540.92**"))
                } else if (student_answer < 1000000) {
                  feedback_parts <- c(feedback_parts, paste0("  • Som gekwadrateerde afwijkingen: Je gaf ", format(student_answer, big.mark=","), ", maar dit is te laag door extreme waarde 1657. Correct: **2,268,540.92**"))
                } else {
                  feedback_parts <- c(feedback_parts, paste0("  • Som gekwadrateerde afwijkingen: Je gaf ", format(student_answer, big.mark=","), ", maar correct is **2,268,540.92**"))
                }
              } else {
                feedback_parts <- c(feedback_parts, "  • Som gekwadrateerde afwijkingen: Ontbreekt ❌")
              }
            }
          } else {
            all_variance_correct <- FALSE
            feedback_parts <- c(feedback_parts, "  • Som gekwadrateerde afwijkingen: Ontbreekt ❌")
          }
          
          if ("variantie" %in% names(results)) {
            if (!results$variantie$correct) {
              all_variance_correct <- FALSE
              if (results$variantie$exists) {
                student_answer <- as.numeric(results$variantie$value)
                if (abs(student_answer - 206230.84) < 100) {
                  feedback_parts <- c(feedback_parts, paste0("  • Variantie: Je gaf ", format(student_answer, big.mark=","), ", maar je deelde door n=11. Voor steekproef gebruik n-1=10: **226,854.09**"))
                } else if (abs(student_answer - 2268540.92) < 100) {
                  feedback_parts <- c(feedback_parts, paste0("  • Variantie: Je gaf ", format(student_answer, big.mark=","), ", maar je vergat te delen door n-1. Correct: **226,854.09**"))
                } else {
                  feedback_parts <- c(feedback_parts, paste0("  • Variantie: Je gaf ", format(student_answer, big.mark=","), ", maar correct is som/(n-1) = **226,854.09**"))
                }
              } else {
                feedback_parts <- c(feedback_parts, "  • Variantie: Ontbreekt ❌")
              }
            }
          } else {
            all_variance_correct <- FALSE
            feedback_parts <- c(feedback_parts, "  • Variantie: Ontbreekt ❌")
          }
          
          if ("standaardafwijking" %in% names(results)) {
            if (!results$standaardafwijking$correct) {
              all_variance_correct <- FALSE
              if (results$standaardafwijking$exists) {
                student_answer <- as.numeric(results$standaardafwijking$value)
                if (abs(student_answer - 226854.09) < 100) {
                  feedback_parts <- c(feedback_parts, paste0("  • Standaardafwijking: Je gaf ", format(student_answer, big.mark=","), ", maar je vergat de wortel. SD = √variantie = **476.29**"))
                } else if (abs(student_answer - 454.12) < 1) {
                  feedback_parts <- c(feedback_parts, paste0("  • Standaardafwijking: Je gaf ", student_answer, ", maar je gebruikte n=11 ipv n-1=10. Correct: **476.29**"))
                } else {
                  feedback_parts <- c(feedback_parts, paste0("  • Standaardafwijking: Je gaf ", student_answer, ", maar correct is √variantie = **476.29**"))
                }
              } else {
                feedback_parts <- c(feedback_parts, "  • Standaardafwijking: Ontbreekt ❌")
              }
            }
          } else {
            all_variance_correct <- FALSE
            feedback_parts <- c(feedback_parts, "  • Standaardafwijking: Ontbreekt ❌")
          }
          
          if (all_variance_correct) {
            # Remove individual messages and show overall success
            start_idx <- which(feedback_parts == "**STAP 3.3 - VARIANTIE:**")
            feedback_parts <- feedback_parts[1:(start_idx-1)]
            feedback_parts <- c(feedback_parts, "**STAP 3.3 - VARIANTIE:** Som=2,268,540.92, Variantie=226,854.09, SD=476.29 ✅")
          } else {
            feedback_parts[which(feedback_parts == "**STAP 3.3 - VARIANTIE:**")] <- "**STAP 3.3 - VARIANTIE:** ❌"
          }
          
          # ----------------------------------------
          # EXTRA UITLEG BIJ FOUTEN (zoals in 3.2)
          # ----------------------------------------
          
          if (correct_count != total_questions) {
            # Titel + kort overzicht (jouw antwoord → juiste antwoord)
            feedback_parts <- c(
              feedback_parts,
              "",
              "📚 **Uitleg van veelgemaakte fouten:**",
              "",
              "• Overzicht fouten (jouw antwoord → juiste antwoord):"
            )
            
            # helper: maak leesbare labels met uitleg hoe het berekend wordt
            make_label_with_explanation <- function(var_name, expected_val) {
              # gekwadrateerde afwijkingen → X-waarde eruit halen
              if (grepl("^gekw_afwijking_", var_name)) {
                rest <- sub("^gekw_afwijking_", "", var_name)   # bv. "2" or "150_1"
                xval <- as.numeric(sub("_.*$", "", rest))       # "2" → 2, "150_1" → 150
                afwijking <- xval - 238.91
                return(paste0("Voor de gekwadrateerde afwijking bij X = ", xval, 
                             " (bereken: (", xval, " - 238.91)² = (", round(afwijking, 2), ")² = ", format(expected_val, big.mark=","), ")"))
              }
              
              # afwijkingen
              if (grepl("^afwijking_", var_name)) {
                rest <- sub("^afwijking_", "", var_name)
                xval <- as.numeric(sub("_.*$", "", rest))
                return(paste0("Voor de afwijking bij X = ", xval,
                             " (bereken: ", xval, " - 238.91 = ", expected_val, ")"))
              }
              
              # frequenties
              if (grepl("^freq_", var_name)) {
                xval <- sub("^freq_", "", var_name)
                return(paste0("Voor de frequentie van waarde ", xval,
                             " (tel hoe vaak ", xval, " voorkomt in de dataset)"))
              }
              
              # percentages
              if (grepl("^percent_", var_name)) {
                xval <- sub("^percent_", "", var_name)
                freq_var <- paste0("freq_", xval)
                if (freq_var %in% names(results)) {
                  freq_val <- results[[freq_var]]$expected
                  return(paste0("Voor het percentage van waarde ", xval,
                               " (bereken: (", freq_val, "/11) × 100 = ", expected_val, "%)"))
                } else {
                  return(paste0("Voor het percentage van waarde ", xval,
                               " (bereken: (frequentie/11) × 100)"))
                }
              }
              
              # standaard-maten met berekening uitleg
              if (var_name == "gemiddelde") {
                return("Voor het gemiddelde (bereken: som van alle waarden ÷ aantal = 2628/11 = 238.91)")
              }
              if (var_name == "mediaan") {
                return("Voor de mediaan (sorteer data, neem middelste waarde: 6de van 11 → 143)")
              }
              if (var_name == "modus") {
                return("Voor de modus (waarde die het meest voorkomt: 150 komt 2x voor)")
              }
              if (var_name == "variatiebreedte") {
                return("Voor de variatiebreedte (bereken: maximum - minimum = 1657 - 2 = 1655)")
              }
              if (var_name == "q1") {
                return("Voor Q1 (25% positie = 3de waarde in gesorteerde data = 26)")
              }
              if (var_name == "q3") {
                return("Voor Q3 (75% positie = 9de waarde in gesorteerde data = 150)")
              }
              if (var_name == "ika") {
                return("Voor de interkwartielafstand (bereken: Q3 - Q1 = 150 - 26 = 124)")
              }
              if (var_name == "sum_of_squares") {
                return("Voor de som van de gekwadrateerde afwijkingen (som alle (X-238.91)² waarden = 2,268,540.92)")
              }
              if (var_name == "variantie") {
                return("Voor de variantie (bereken: som gekwadrateerde afwijkingen/(n-1) = 2,268,540.92/10 = 226,854.09)")
              }
              if (var_name == "standaardafwijking") {
                return("Voor de standaardafwijking (bereken: √variantie = √226,854.09 = 476.29)")
              }
              
              # default: mocht er iets nieuw bijkomen
              return("Voor dit antwoord")
            }
            
            # Automatisch lijstje met alle foute maar bestaande variabelen
            wrong_keys <- names(results)[sapply(results, function(x) x$exists && !x$correct)]
            
            for (key in wrong_keys) {
              student_val  <- results[[key]]$value
              expected_val <- results[[key]]$expected
              
              # Netjes formatteren (ook grote getallen)
              if (is.numeric(student_val)) {
                student_str <- format(as.numeric(student_val), digits = 6, big.mark = ",")
              } else {
                student_str <- as.character(student_val)
              }
              
              if (is.numeric(expected_val)) {
                expected_str <- format(as.numeric(expected_val), digits = 6, big.mark = ",")
              } else {
                expected_str <- as.character(expected_val)
              }
              
              feedback_parts <- c(
                feedback_parts,
                paste0("  • ", make_label_with_explanation(key, expected_val), ": je gaf ", student_str, ".")
              )
            }
            
            # --- vanaf hier mag je je bestaande, meer didactische uitleg laten staan ---
            
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
