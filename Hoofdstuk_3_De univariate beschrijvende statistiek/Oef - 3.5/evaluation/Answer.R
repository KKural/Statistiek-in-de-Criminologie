context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          # Use the provided environment (env) instead of globalenv()
          results <- list()
          
          # Expected values - Exercise 5: Police patrol incidents
          # Data: 2, 7, 10, 5, 6, 8, 3, 4, 9
          expected_mean <- 6  # (2+7+10+5+6+8+3+4+9)/9 = 54/9 = 6
          expected_deviations <- c(-4, 1, 4, -1, 0, 2, -3, -2, 3)  # Each value - 6
          expected_squared <- c(16, 1, 16, 1, 0, 4, 9, 4, 9)  # Square each deviation
          expected_ss <- 60  # Sum of squares: 16+1+16+1+0+4+9+4+9 = 60
          expected_variance <- 7.5  # Sample variance: 60/(9-1) = 60/8 = 7.5
          expected_sd <- sqrt(7.5)  # sqrt(7.5) = 2.7386... ≈ 2.74
          
          # -----------------------------
          # STEP 1: MEAN CALCULATION
          # -----------------------------
          
          if (exists("gemiddelde_incidenten", envir = env)) {
            current_val <- as.numeric(get("gemiddelde_incidenten", envir = env))
            results$gemiddelde_incidenten <- list(
              exists = TRUE,
              value = current_val,
              correct = abs(current_val - expected_mean) < 0.01,
              expected = expected_mean
            )
          } else {
            results$gemiddelde_incidenten <- list(exists = FALSE, value = NA, correct = FALSE, expected = expected_mean)
          }
          
          # -----------------------------
          # STEP 2: DEVIATIONS
          # -----------------------------
          
          if (exists("afwijkingen", envir = env)) {
            current_val <- get("afwijkingen", envir = env)
            # Handle both vector input and single values
            if (is.numeric(current_val)) {
              current_val <- as.numeric(current_val)
            } else {
              # Try to evaluate if it's an expression
              tryCatch({
                current_val <- as.numeric(eval(current_val, envir = env))
              }, error = function(e) {
                current_val <- NA
              })
            }
            
            results$afwijkingen <- list(
              exists = TRUE,
              value = current_val,
              correct = !any(is.na(current_val)) && length(current_val) == length(expected_deviations) && all(abs(current_val - expected_deviations) < 0.01),
              expected = expected_deviations
            )
          } else {
            results$afwijkingen <- list(exists = FALSE, value = NA, correct = FALSE, expected = expected_deviations)
          }
          
          # Individual deviations
          incidenten <- c(2, 7, 10, 5, 6, 8, 3, 4, 9)
          individual_deviations <- c("afwijking_2", "afwijking_7", "afwijking_10", "afwijking_5", "afwijking_6", 
                                   "afwijking_8", "afwijking_3", "afwijking_4", "afwijking_9")
          individual_expected_dev <- c(-4, 1, 4, -1, 0, 2, -3, -2, 3)
          
          for (i in 1:length(individual_deviations)) {
            var_name <- individual_deviations[i]
            expected_val <- individual_expected_dev[i]
            
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
          
          # -----------------------------
          # STEP 3: SQUARED DEVIATIONS
          # -----------------------------
          
          if (exists("gekwadrateerde_afwijkingen", envir = env)) {
            current_val <- get("gekwadrateerde_afwijkingen", envir = env)
            # Handle both vector input and single values
            if (is.numeric(current_val)) {
              current_val <- as.numeric(current_val)
            } else {
              # Try to evaluate if it's an expression
              tryCatch({
                current_val <- as.numeric(eval(current_val, envir = env))
              }, error = function(e) {
                current_val <- NA
              })
            }
            
            results$gekwadrateerde_afwijkingen <- list(
              exists = TRUE,
              value = current_val,
              correct = !any(is.na(current_val)) && length(current_val) == length(expected_squared) && all(abs(current_val - expected_squared) < 0.01),
              expected = expected_squared
            )
          } else {
            results$gekwadrateerde_afwijkingen <- list(exists = FALSE, value = NA, correct = FALSE, expected = expected_squared)
          }
          
          # Individual squared deviations
          individual_squared <- c("gekw_afwijking_2", "gekw_afwijking_7", "gekw_afwijking_10", "gekw_afwijking_5", "gekw_afwijking_6",
                                "gekw_afwijking_8", "gekw_afwijking_3", "gekw_afwijking_4", "gekw_afwijking_9")
          individual_expected_sq <- c(16, 1, 16, 1, 0, 4, 9, 4, 9)
          
          for (i in 1:length(individual_squared)) {
            var_name <- individual_squared[i]
            expected_val <- individual_expected_sq[i]
            
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
          
          # -----------------------------
          # STEP 4: SUM OF SQUARES
          # -----------------------------
          
          if (exists("sum_of_squares", envir = env)) {
            current_val <- get("sum_of_squares", envir = env)
            # Handle both numeric input and expressions
            if (is.numeric(current_val)) {
              current_val <- as.numeric(current_val)
            } else {
              # Try to evaluate if it's an expression
              tryCatch({
                current_val <- as.numeric(eval(current_val, envir = env))
              }, error = function(e) {
                current_val <- NA
              })
            }
            
            results$sum_of_squares <- list(
              exists = TRUE,
              value = current_val,
              correct = !is.na(current_val) && abs(current_val - expected_ss) < 0.01,
              expected = expected_ss
            )
          } else {
            results$sum_of_squares <- list(exists = FALSE, value = NA, correct = FALSE, expected = expected_ss)
          }
          
          # -----------------------------
          # STEP 5: VARIANCE
          # -----------------------------
          
          if (exists("variantie_incidenten", envir = env)) {
            current_val <- get("variantie_incidenten", envir = env)
            # Handle both numeric input and expressions
            if (is.numeric(current_val)) {
              current_val <- as.numeric(current_val)
            } else {
              # Try to evaluate if it's an expression
              tryCatch({
                current_val <- as.numeric(eval(current_val, envir = env))
              }, error = function(e) {
                current_val <- NA
              })
            }
            
            results$variantie_incidenten <- list(
              exists = TRUE,
              value = current_val,
              correct = !is.na(current_val) && abs(current_val - expected_variance) < 0.01,
              expected = expected_variance
            )
          } else {
            results$variantie_incidenten <- list(exists = FALSE, value = NA, correct = FALSE, expected = expected_variance)
          }
          
          # -----------------------------
          # STEP 6: STANDARD DEVIATION
          # -----------------------------
          
          if (exists("standaarddeviatie_incidenten", envir = env)) {
            current_val <- get("standaarddeviatie_incidenten", envir = env)
            # Handle both numeric input and expressions
            if (is.numeric(current_val)) {
              current_val <- as.numeric(current_val)
            } else {
              # Try to evaluate if it's an expression
              tryCatch({
                current_val <- as.numeric(eval(current_val, envir = env))
              }, error = function(e) {
                current_val <- NA
              })
            }
            
            results$standaarddeviatie_incidenten <- list(
              exists = TRUE,
              value = current_val,
              correct = !is.na(current_val) && (abs(current_val - expected_sd) < 0.01 || abs(current_val - 2.74) < 0.01),
              expected = expected_sd
            )
          } else {
            results$standaarddeviatie_incidenten <- list(exists = FALSE, value = NA, correct = FALSE, expected = expected_sd)
          }
          
          # -----------------------------
          # STEP 7: CHOICE OF SPREAD MEASURE
          # -----------------------------
          
          if (exists("gekozen_spreidingsmaat", envir = env)) {
            current_val <- get("gekozen_spreidingsmaat", envir = env)
            # Handle both string input and potential expressions
            if (is.character(current_val) || is.factor(current_val)) {
              current_val <- as.character(current_val)
            } else {
              # Try to evaluate if it's an expression
              tryCatch({
                current_val <- as.character(eval(current_val, envir = env))
              }, error = function(e) {
                current_val <- as.character(current_val)
              })
            }
            
            results$gekozen_spreidingsmaat <- list(
              exists = TRUE,
              value = current_val,
              correct = tolower(current_val) %in% c("standaarddeviatie", "standard_deviation", "sd", "standaardafwijking"),
              expected = "standaarddeviatie"
            )
          } else {
            results$gekozen_spreidingsmaat <- list(exists = FALSE, value = NA, correct = FALSE, expected = "standaarddeviatie")
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
          
          # ----------------------
          # STEP-BY-STEP FEEDBACK
          # ----------------------
          
          if (results$gemiddelde_incidenten$correct) {
            feedback_lines <- c(feedback_lines, "**1.1 GEMIDDELDE:** Som=54, n=9 → 54/9 = 6 ✅")
          } else {
            feedback_lines <- c(feedback_lines, "**1.1 GEMIDDELDE:** Som alle incidenten (54) / aantal (9) = 6 ❌")
          }
          
          if (results$afwijkingen$correct) {
            feedback_lines <- c(feedback_lines, "**2.1 AFWIJKINGEN:** X - 6 voor elke waarde ✅")
          } else {
            feedback_lines <- c(feedback_lines, "**2.1 AFWIJKINGEN:** Bereken incident - 6 voor elke waarde ❌")
          }
          
          if (results$gekwadrateerde_afwijkingen$correct) {
            feedback_lines <- c(feedback_lines, "**2.2 KWADRATEN:** (afwijking)² voor elke waarde ✅")
          } else {
            feedback_lines <- c(feedback_lines, "**2.2 KWADRATEN:** Kwadrateer elke afwijking: (-4)²=16, (1)²=1, enz. ❌")
          }
          
          if (results$sum_of_squares$correct) {
            feedback_lines <- c(feedback_lines, "**2.3 SOM:** 16+1+16+1+0+4+9+4+9 = 60 ✅")
          } else {
            feedback_lines <- c(feedback_lines, "**2.3 SOM:** Som alle gekwadrateerde afwijkingen = 60 ❌")
          }
          
          if (results$variantie_incidenten$correct) {
            feedback_lines <- c(feedback_lines, "**3.1 VARIANTIE:** SS/(n-1) = 60/8 = 7.5 ✅")
          } else {
            feedback_lines <- c(feedback_lines, "**3.1 VARIANTIE:** 60 / (9-1) = 60/8 = 7.5 ❌")
          }
          
          if (results$standaarddeviatie_incidenten$correct) {
            feedback_lines <- c(feedback_lines, "**3.2 STANDAARDDEVIATIE:** √7.5 = 2.74 ✅")
          } else {
            feedback_lines <- c(feedback_lines, "**3.2 STANDAARDDEVIATIE:** √variantie = √7.5 = 2.74 ❌")
          }
          
          if (results$gekozen_spreidingsmaat$correct) {
            feedback_lines <- c(feedback_lines, "**4.1 KEUZE MAAT:** Standaarddeviatie (2.74) voor interval data ✅")
          } else {
            feedback_lines <- c(feedback_lines, "**4.1 KEUZE MAAT:** Voor interval data kies standaarddeviatie (2.74) ❌")
          }
          
          # ----------------------
          # DETAILED ERROR ANALYSIS
          # ----------------------
          
          if (correct_count < total_questions) {
            feedback_lines <- c(feedback_lines, "", "🔍 **GEDETAILLEERDE FOUTANALYSE:**")
            
            # ======================
            # MEAN CALCULATION ERRORS
            # ======================
            
            if (!results$gemiddelde_incidenten$correct && results$gemiddelde_incidenten$exists) {
              student_mean <- as.numeric(results$gemiddelde_incidenten$value)
              if (!is.na(student_mean)) {
                if (abs(student_mean - 5.4) < 0.01) {
                  feedback_lines <- c(feedback_lines, "• **GEMIDDELDE n-1 FOUT:** Je deelde door 10 ipv 9. Gemiddelde = som/n = 54/9 = 6")
                } else if (abs(student_mean - 6.75) < 0.01) {
                  feedback_lines <- c(feedback_lines, "• **GEMIDDELDE SOM FOUT:** Check je som. Correct: 2+7+10+5+6+8+3+4+9 = 54, dan 54/9 = 6")
                } else if (student_mean < 5 || student_mean > 8) {
                  feedback_lines <- c(feedback_lines, "• **GEMIDDELDE BEREKENING:** Data: 2,7,10,5,6,8,3,4,9. Som = 54, gemiddelde = 54/9 = 6")
                } else if (abs(student_mean - 6.67) < 0.01) {
                  feedback_lines <- c(feedback_lines, "• **GEMIDDELDE AFRONDINGSFOUT:** Gebruik exacte waarde: 54/9 = 6.000")
                } else if (abs(student_mean - 6.5) < 0.01) {
                  feedback_lines <- c(feedback_lines, "• **GEMIDDELDE MEDIAAN FOUT:** Je berekende de mediaan. Gemiddelde = som alle waarden / aantal = 54/9 = 6")
                }
              }
            }
            
            # ======================
            # INDIVIDUAL DEVIATION ERRORS
            # ======================
            
            # Check specific individual deviations for common mistakes
            individual_dev_errors <- c()
            
            if ("afwijking_2" %in% names(results) && !results$afwijking_2$correct && results$afwijking_2$exists) {
              student_dev2 <- as.numeric(results$afwijking_2$value)
              if (!is.na(student_dev2)) {
                if (student_dev2 == 4) {
                  individual_dev_errors <- c(individual_dev_errors, "afwijking_2: Verkeerd teken! 2-6 = -4 (negatief)")
                } else if (abs(student_dev2 - (-3.6)) < 0.1) {
                  individual_dev_errors <- c(individual_dev_errors, "afwijking_2: Verkeerd gemiddelde gebruikt. 2-6 = -4")
                }
              }
            }
            
            if ("afwijking_10" %in% names(results) && !results$afwijking_10$correct && results$afwijking_10$exists) {
              student_dev10 <- as.numeric(results$afwijking_10$value)
              if (!is.na(student_dev10)) {
                if (student_dev10 == -4) {
                  individual_dev_errors <- c(individual_dev_errors, "afwijking_10: Verkeerd teken! 10-6 = +4 (positief)")
                } else if (abs(student_dev10 - 3.6) < 0.1) {
                  individual_dev_errors <- c(individual_dev_errors, "afwijking_10: Verkeerd gemiddelde gebruikt. 10-6 = 4")
                }
              }
            }
            
            if ("afwijking_6" %in% names(results) && !results$afwijking_6$correct && results$afwijking_6$exists) {
              student_dev6 <- as.numeric(results$afwijking_6$value)
              if (!is.na(student_dev6)) {
                if (abs(student_dev6) > 0.01) {
                  individual_dev_errors <- c(individual_dev_errors, "afwijking_6: 6-6 = 0 (gemiddelde heeft afwijking nul)")
                }
              }
            }
            
            if (length(individual_dev_errors) > 0) {
              feedback_lines <- c(feedback_lines, "• **INDIVIDUELE AFWIJKING FOUTEN:**")
              feedback_lines <- c(feedback_lines, paste0("  - ", individual_dev_errors))
            }
            
            # ======================
            # INDIVIDUAL SQUARED DEVIATION ERRORS  
            # ======================
            
            individual_sq_errors <- c()
            
            if ("gekw_afwijking_2" %in% names(results) && !results$gekw_afwijking_2$correct && results$gekw_afwijking_2$exists) {
              student_sq2 <- as.numeric(results$gekw_afwijking_2$value)
              if (!is.na(student_sq2)) {
                if (student_sq2 == 4) {
                  individual_sq_errors <- c(individual_sq_errors, "gekw_afwijking_2: Je vergat te kwadrateren. (-4)² = 16")
                } else if (student_sq2 == -16) {
                  individual_sq_errors <- c(individual_sq_errors, "gekw_afwijking_2: Kwadraat is altijd positief! (-4)² = 16")
                } else if (student_sq2 == 4) {
                  individual_sq_errors <- c(individual_sq_errors, "gekw_afwijking_2: Gebruik originele data, niet waarde. (2-6)² = (-4)² = 16")
                }
              }
            }
            
            if ("gekw_afwijking_6" %in% names(results) && !results$gekw_afwijking_6$correct && results$gekw_afwijking_6$exists) {
              student_sq6 <- as.numeric(results$gekw_afwijking_6$value)
              if (!is.na(student_sq6)) {
                if (student_sq6 == 36) {
                  individual_sq_errors <- c(individual_sq_errors, "gekw_afwijking_6: Je kwadrateerde originele waarde. (6-6)² = 0² = 0")
                } else if (abs(student_sq6) > 0.01) {
                  individual_sq_errors <- c(individual_sq_errors, "gekw_afwijking_6: Gemiddelde heeft afwijking 0, dus 0² = 0")
                }
              }
            }
            
            if ("gekw_afwijking_10" %in% names(results) && !results$gekw_afwijking_10$correct && results$gekw_afwijking_10$exists) {
              student_sq10 <- as.numeric(results$gekw_afwijking_10$value)
              if (!is.na(student_sq10)) {
                if (student_sq10 == 100) {
                  individual_sq_errors <- c(individual_sq_errors, "gekw_afwijking_10: Je kwadrateerde originele waarde. (10-6)² = 4² = 16")
                } else if (student_sq10 == 4) {
                  individual_sq_errors <- c(individual_sq_errors, "gekw_afwijking_10: Je vergat te kwadrateren. 4² = 16")
                }
              }
            }
            
            if (length(individual_sq_errors) > 0) {
              feedback_lines <- c(feedback_lines, "• **INDIVIDUELE GEKWADRATEERDE AFWIJKING FOUTEN:**")
              feedback_lines <- c(feedback_lines, paste0("  - ", individual_sq_errors))
            }
            
            # ======================
            # DEVIATION CALCULATION ERRORS
            # ======================
            
            if (!results$afwijkingen$correct && results$afwijkingen$exists) {
              student_dev <- as.numeric(results$afwijkingen$value)
              if (length(student_dev) == length(expected_deviations)) {
                # Check for sign errors
                sign_errors <- sum(abs(student_dev + expected_deviations) < 0.01)
                if (sign_errors >= 3) {
                  feedback_lines <- c(feedback_lines, "• **AFWIJKING TEKEN FOUT:** Let op richting! 2-6 = -4 (negatief), 10-6 = +4 (positief)")
                }
                
                # Check for wrong mean usage
                if (all(abs(student_dev - (c(2,7,10,5,6,8,3,4,9) - 5.4)) < 0.1)) {
                  feedback_lines <- c(feedback_lines, "• **AFWIJKING GEMIDDELDE FOUT:** Gebruik correct gemiddelde (6): 2-6=-4, 7-6=1, enz.")
                }
                
                # Check for absolute values
                if (all(student_dev >= 0) && sum(abs(student_dev - abs(expected_deviations))) < 1) {
                  feedback_lines <- c(feedback_lines, "• **AFWIJKING ABSOLUTE FOUT:** Behoud tekens! Afwijkingen kunnen negatief zijn: 2-6=-4")
                }
              } else if (length(student_dev) == 1) {
                feedback_lines <- c(feedback_lines, "• **AFWIJKING VECTOR FOUT:** Bereken voor ELKE waarde: incidenten - gemiddelde_incidenten")
              }
            }
            
            # ======================
            # SQUARED DEVIATIONS ERRORS
            # ======================
            
            if (!results$gekwadrateerde_afwijkingen$correct && results$gekwadrateerde_afwijkingen$exists) {
              student_sq <- as.numeric(results$gekwadrateerde_afwijkingen$value)
              if (length(student_sq) == length(expected_squared)) {
                # Check if they used original values instead of deviations
                original_squared <- c(2,7,10,5,6,8,3,4,9)^2
                if (all(abs(student_sq - original_squared) < 0.01)) {
                  feedback_lines <- c(feedback_lines, "• **GEKWADRATEERD ORIGINEEL FOUT:** Kwadrateer de AFWIJKINGEN, niet de originele waarden!")
                }
                
                # Check for negative squared values
                if (any(student_sq < 0)) {
                  feedback_lines <- c(feedback_lines, "• **GEKWADRATEERD NEGATIEF FOUT:** Kwadraat is altijd positief: (-4)² = 16, niet -16")
                }
                
                # Check for wrong mean in deviations
                wrong_mean_sq <- (c(2,7,10,5,6,8,3,4,9) - 5.4)^2
                if (all(abs(student_sq - wrong_mean_sq) < 0.1)) {
                  feedback_lines <- c(feedback_lines, "• **GEKWADRATEERD GEMIDDELDE FOUT:** Gebruik juist gemiddelde (6) in afwijkingen")
                }
              } else if (length(student_sq) == 1) {
                feedback_lines <- c(feedback_lines, "• **GEKWADRATEERD VECTOR FOUT:** Kwadrateer ELKE afwijking: afwijkingen^2")
              }
            }
            
            # ======================
            # SUM OF SQUARES ERRORS
            # ======================
            
            if (!results$sum_of_squares$correct && results$sum_of_squares$exists) {
              student_ss <- as.numeric(results$sum_of_squares$value)
              if (!is.na(student_ss)) {
                if (abs(student_ss - 60) > 1) {
                  feedback_lines <- c(feedback_lines, "• **SOM GEKWADRATEERD FOUT:** Check berekening: 16+1+16+1+0+4+9+4+9 = 60")
                } else if (student_ss < 50 || student_ss > 70) {
                  feedback_lines <- c(feedback_lines, "• **SOM GEKWADRATEERD BEREKENING:** Som alle gekwadrateerde afwijkingen = 60")
                }
              }
            }
            
            # ======================
            # VARIANCE & STANDARD DEVIATION ERRORS
            # ======================
            
            if (!results$variantie_incidenten$correct && results$variantie_incidenten$exists) {
              student_var <- as.numeric(results$variantie_incidenten$value)
              if (!is.na(student_var)) {
                if (abs(student_var - 6.67) < 0.01) {
                  feedback_lines <- c(feedback_lines, "• **VARIANTIE n FOUT:** Je deelde door n=9 ipv n-1=8. Steekproefvariantie = 60/8 = 7.5")
                } else if (abs(student_var - 60) < 0.01) {
                  feedback_lines <- c(feedback_lines, "• **VARIANTIE GEEN DELING:** Je vergat te delen door n-1. Variantie = som gekwadrateerde afwijkingen / (n-1)")
                } else if (abs(student_var - 6.0) < 0.01) {
                  feedback_lines <- c(feedback_lines, "• **VARIANTIE DELING FOUT:** Je deelde door 10. Correct: 60/8 = 7.5")
                } else if (abs(student_var - 30) < 0.01) {
                  feedback_lines <- c(feedback_lines, "• **VARIANTIE HALVE SOM:** Je gebruikte halve som. Som gekwadrateerde afwijkingen = 60, niet 30")
                } else if (student_var < 6 || student_var > 9) {
                  feedback_lines <- c(feedback_lines, "• **VARIANTIE BEREKENING:** Som gekwadrateerde afwijkingen = 60, variantie = 60/8 = 7.5")
                } else if (abs(student_var - 5.45) < 0.01) {
                  feedback_lines <- c(feedback_lines, "• **VARIANTIE SOM FOUT:** Check som gekwadrateerde afwijkingen: 16+1+16+1+0+4+9+4+9 = 60")
                }
              }
            }
            
            if (!results$standaarddeviatie_incidenten$correct && results$standaarddeviatie_incidenten$exists) {
              student_sd <- as.numeric(results$standaarddeviatie_incidenten$value)
              if (!is.na(student_sd)) {
                if (abs(student_sd - 7.5) < 0.01) {
                  feedback_lines <- c(feedback_lines, "• **STANDAARDDEVIATIE WORTEL:** Standaarddeviatie = √variantie = √7.5 = 2.74")
                } else if (abs(student_sd - 60) < 0.01) {
                  feedback_lines <- c(feedback_lines, "• **STANDAARDDEVIATIE BASIS:** Gebruik eerst variantie = 60/8 = 7.5, dan √7.5 = 2.74")
                } else if (abs(student_sd - 2.58) < 0.01) {
                  feedback_lines <- c(feedback_lines, "• **STANDAARDDEVIATIE n FOUT:** Je gebruikte n ipv n-1. √(60/8) = √7.5 = 2.74")
                } else if (abs(student_sd - 2.45) < 0.01) {
                  feedback_lines <- c(feedback_lines, "• **STANDAARDDEVIATIE DELING:** Je deelde door 10. √(60/8) = 2.74")
                } else if (abs(student_sd - 5.48) < 0.01) {
                  feedback_lines <- c(feedback_lines, "• **STANDAARDDEVIATIE HALVE:** Je gebruikte √30. Correct: √(60/8) = √7.5 = 2.74")
                } else if (abs(student_sd - 2.33) < 0.01) {
                  feedback_lines <- c(feedback_lines, "• **STANDAARDDEVIATIE SOM:** Check som gekwadrateerde afwijkingen = 60, dan √(60/8) = 2.74")
                } else if (student_sd < 2 || student_sd > 4) {
                  feedback_lines <- c(feedback_lines, "• **STANDAARDDEVIATIE BEREKENING:** √7.5 ≈ 2.74")
                } else if (abs(student_sd - 2.8) < 0.01) {
                  feedback_lines <- c(feedback_lines, "• **STANDAARDDEVIATIE AFRONDING:** 2.8 is dicht bij correct antwoord 2.74")
                }
              }
            }
            
            # ======================
            # CHOICE OF SPREAD MEASURE ERRORS
            # ======================
            
            if (!results$gekozen_spreidingsmaat$correct && results$gekozen_spreidingsmaat$exists) {
              student_choice <- tolower(as.character(results$gekozen_spreidingsmaat$value))
              if (student_choice %in% c("variantie", "variance")) {
                feedback_lines <- c(feedback_lines, "• **SPREIDINGSMAAT KEUZE FOUT:** Je koos variantie. Voor interpretatie is standaarddeviatie beter")
              } else if (student_choice %in% c("bereik", "range")) {
                feedback_lines <- c(feedback_lines, "• **SPREIDINGSMAAT KEUZE FOUT:** Bereik is gevoelig voor uitschieters. Standaarddeviatie is betrouwbaarder")
              } else {
                feedback_lines <- c(feedback_lines, "• **SPREIDINGSMAAT FOUT:** Voor interval data is 'standaarddeviatie' de meest informatieve maat")
              }
            }
            
            # ======================
            # COMPREHENSIVE PATTERN DETECTION
            # ======================
            
            # Detect systematic calculation errors across multiple variables
            systematic_errors <- c()
            
            # Check for consistent n vs n-1 confusion
            if (results$variantie_incidenten$exists && !results$variantie_incidenten$correct) {
              student_var <- as.numeric(results$variantie_incidenten$value)
              if (!is.na(student_var) && abs(student_var - 6.67) < 0.01) {
                systematic_errors <- c(systematic_errors, "n_vs_n1")
              }
            }
            
            # Check for consistent sign errors in deviations
            if ("afwijking_2" %in% names(results) && "afwijking_10" %in% names(results)) {
              if (results$afwijking_2$exists && results$afwijking_10$exists) {
                dev2 <- as.numeric(results$afwijking_2$value)
                dev10 <- as.numeric(results$afwijking_10$value)
                if (!is.na(dev2) && !is.na(dev10) && dev2 > 0 && dev10 < 0) {
                  systematic_errors <- c(systematic_errors, "sign_pattern")
                }
              }
            }
            
            # Provide systematic feedback if patterns detected
            if ("n_vs_n1" %in% systematic_errors) {
              feedback_lines <- c(feedback_lines, "• **SYSTEMATISCHE n FOUT:** Let op verschil: gemiddelde gebruikt n, variantie gebruikt n-1 voor steekproeven")
            }
            
            if ("sign_pattern" %in% systematic_errors) {
              feedback_lines <- c(feedback_lines, "• **SYSTEMATISCHE TEKEN FOUT:** Afwijkingen behouden richting: kleiner dan gemiddelde = negatief, groter = positief")
            }
          }
          
          # Add correct answers summary if not all correct (like in exercises 3.3 and 3.4)
          if (correct_count < total_questions) {
            feedback_lines <- c(
              feedback_lines,
              "",
              "📋 **CORRECTE ANTWOORDEN:**",
              "• **1.1 GEMIDDELDE:** 6",
              "• **2.1 AFWIJKINGEN:** c(-4, 1, 4, -1, 0, 2, -3, -2, 3)",
              "• **2.2 GEKWADRATEERDE AFWIJKINGEN:** c(16, 1, 16, 1, 0, 4, 9, 4, 9)",
              "• **2.3 SOM GEKWADRATEERDE AFWIJKINGEN:** 60",
              "• **3.1 VARIANTIE:** 7.5",
              "• **3.2 STANDAARDDEVIATIE:** 2.74",
              "• **4.1 KEUZE SPREIDINGSMAAT:** \"standaarddeviatie\""
            )
          }

          feedback_lines <- c(
            feedback_lines,
            "",
            paste0("**", correct_count, " van ", total_questions, " juist**"),
            "",
            "🔍 **BELANGRIJKE REGELS VOOR SPREIDINGSMATEN:**",
            "• **Voor interval/ratio data:** standaarddeviatie is meest informatief",
            "• **Steekproefvariantie:** gebruik n-1 in noemer (niet n)",
            "• **Afwijkingen kunnen negatief zijn** (X - μ), maar kwadraten altijd positief",
            "• **Standaarddeviatie = √variantie** (zelfde eenheid als originele data)",
            "• **Som van gekwadrateerde afwijkingen = 60** (16+1+16+1+0+4+9+4+9)",
            "• **Voor criminologisch onderzoek:** standaarddeviatie geeft spreiding in aantal incidenten"
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
