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
          # STAP 1: FREQUENTIETABEL EN CENTRALITEIT
          # -----------------------------
          
          # Frequenties
          if (exists("freq_24", envir = env)) {
            current_val <- get("freq_24", envir = env)
            results$freq_24 <- list(
              exists = TRUE,
              value = current_val,
              correct = as.numeric(current_val) == 3,
              expected = 3
            )
          } else {
            results$freq_24 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 3)
          }
          
          if (exists("freq_28", envir = env)) {
            current_val <- get("freq_28", envir = env)
            results$freq_28 <- list(
              exists = TRUE,
              value = current_val,
              correct = as.numeric(current_val) == 2,
              expected = 2
            )
          } else {
            results$freq_28 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 2)
          }
          
          if (exists("freq_32", envir = env)) {
            current_val <- get("freq_32", envir = env)
            results$freq_32 <- list(
              exists = TRUE,
              value = current_val,
              correct = as.numeric(current_val) == 2,
              expected = 2
            )
          } else {
            results$freq_32 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 2)
          }
          
          if (exists("freq_34", envir = env)) {
            current_val <- get("freq_34", envir = env)
            results$freq_34 <- list(
              exists = TRUE,
              value = current_val,
              correct = as.numeric(current_val) == 1,
              expected = 1
            )
          } else {
            results$freq_34 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 1)
          }
          
          if (exists("freq_35", envir = env)) {
            current_val <- get("freq_35", envir = env)
            results$freq_35 <- list(
              exists = TRUE,
              value = current_val,
              correct = as.numeric(current_val) == 1,
              expected = 1
            )
          } else {
            results$freq_35 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 1)
          }
          
          if (exists("freq_36", envir = env)) {
            current_val <- get("freq_36", envir = env)
            results$freq_36 <- list(
              exists = TRUE,
              value = current_val,
              correct = as.numeric(current_val) == 7,
              expected = 7
            )
          } else {
            results$freq_36 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 7)
          }
          
          if (exists("freq_38", envir = env)) {
            current_val <- get("freq_38", envir = env)
            results$freq_38 <- list(
              exists = TRUE,
              value = current_val,
              correct = as.numeric(current_val) == 1,
              expected = 1
            )
          } else {
            results$freq_38 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 1)
          }
          
          if (exists("freq_40", envir = env)) {
            current_val <- get("freq_40", envir = env)
            results$freq_40 <- list(
              exists = TRUE,
              value = current_val,
              correct = as.numeric(current_val) == 3,
              expected = 3
            )
          } else {
            results$freq_40 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 3)
          }
          
          # Percentages
          if (exists("percent_24", envir = env)) {
            current_val <- get("percent_24", envir = env)
            results$percent_24 <- list(
              exists = TRUE,
              value = current_val,
              correct = as.numeric(current_val) == 15,
              expected = 15
            )
          } else {
            results$percent_24 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 15)
          }
          
          if (exists("percent_28", envir = env)) {
            current_val <- get("percent_28", envir = env)
            results$percent_28 <- list(
              exists = TRUE,
              value = current_val,
              correct = as.numeric(current_val) == 10,
              expected = 10
            )
          } else {
            results$percent_28 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 10)
          }
          
          if (exists("percent_32", envir = env)) {
            current_val <- get("percent_32", envir = env)
            results$percent_32 <- list(
              exists = TRUE,
              value = current_val,
              correct = as.numeric(current_val) == 10,
              expected = 10
            )
          } else {
            results$percent_32 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 10)
          }
          
          if (exists("percent_34", envir = env)) {
            current_val <- get("percent_34", envir = env)
            results$percent_34 <- list(
              exists = TRUE,
              value = current_val,
              correct = as.numeric(current_val) == 5,
              expected = 5
            )
          } else {
            results$percent_34 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 5)
          }
          
          if (exists("percent_35", envir = env)) {
            current_val <- get("percent_35", envir = env)
            results$percent_35 <- list(
              exists = TRUE,
              value = current_val,
              correct = as.numeric(current_val) == 5,
              expected = 5
            )
          } else {
            results$percent_35 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 5)
          }
          
          if (exists("percent_36", envir = env)) {
            current_val <- get("percent_36", envir = env)
            results$percent_36 <- list(
              exists = TRUE,
              value = current_val,
              correct = as.numeric(current_val) == 35,
              expected = 35
            )
          } else {
            results$percent_36 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 35)
          }
          
          if (exists("percent_38", envir = env)) {
            current_val <- get("percent_38", envir = env)
            results$percent_38 <- list(
              exists = TRUE,
              value = current_val,
              correct = as.numeric(current_val) == 5,
              expected = 5
            )
          } else {
            results$percent_38 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 5)
          }
          
          if (exists("percent_40", envir = env)) {
            current_val <- get("percent_40", envir = env)
            results$percent_40 <- list(
              exists = TRUE,
              value = current_val,
              correct = as.numeric(current_val) == 15,
              expected = 15
            )
          } else {
            results$percent_40 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 15)
          }
          
          # Centraliteitsmaten
          if (exists("modus", envir = env)) {
            current_val <- get("modus", envir = env)
            results$modus <- list(
              exists = TRUE,
              value = current_val,
              correct = as.numeric(current_val) == 36,
              expected = 36
            )
          } else {
            results$modus <- list(exists = FALSE, value = NA, correct = FALSE, expected = 36)
          }
          
          if (exists("mediaan", envir = env)) {
            current_val <- get("mediaan", envir = env)
            results$mediaan <- list(
              exists = TRUE,
              value = current_val,
              correct = as.numeric(current_val) == 36,
              expected = 36
            )
          } else {
            results$mediaan <- list(exists = FALSE, value = NA, correct = FALSE, expected = 36)
          }
          
          if (exists("gemiddelde", envir = env)) {
            current_val <- as.numeric(get("gemiddelde", envir = env))
            results$gemiddelde <- list(
              exists = TRUE,
              value = current_val,
              correct = abs(current_val - 33.55) < 0.005,
              expected = 33.55
            )
          } else {
            results$gemiddelde <- list(exists = FALSE, value = NA, correct = FALSE, expected = 33.55)
          }
          
          # -----------------------------
          # STAP 2: SPREIDINGSMATEN EN PARAMETER KEUZES
          # -----------------------------
          
          if (exists("variatiebreedte", envir = env)) {
            current_val <- get("variatiebreedte", envir = env)
            results$variatiebreedte <- list(
              exists = TRUE,
              value = current_val,
              correct = as.numeric(current_val) == 16,
              expected = 16
            )
          } else {
            results$variatiebreedte <- list(exists = FALSE, value = NA, correct = FALSE, expected = 16)
          }
          
          if (exists("q1", envir = env)) {
            current_val <- get("q1", envir = env)
            results$q1 <- list(
              exists = TRUE,
              value = current_val,
              correct = as.numeric(current_val) == 30,
              expected = 30
            )
          } else {
            results$q1 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 30)
          }
          
          if (exists("q3", envir = env)) {
            current_val <- get("q3", envir = env)
            results$q3 <- list(
              exists = TRUE,
              value = current_val,
              correct = as.numeric(current_val) == 36,
              expected = 36
            )
          } else {
            results$q3 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 36)
          }
          
          if (exists("ika", envir = env)) {
            current_val <- get("ika", envir = env)
            results$ika <- list(
              exists = TRUE,
              value = current_val,
              correct = as.numeric(current_val) == 6,
              expected = 6
            )
          } else {
            results$ika <- list(exists = FALSE, value = NA, correct = FALSE, expected = 6)
          }
          
          # Parameter keuzes
          if (exists("meest_relevante_centraliteit", envir = env)) {
            current_val <- as.character(get("meest_relevante_centraliteit", envir = env))
            results$meest_relevante_centraliteit <- list(
              exists = TRUE,
              value = current_val,
              correct = tolower(trimws(current_val)) == "gemiddelde",
              expected = "gemiddelde"
            )
          } else {
            results$meest_relevante_centraliteit <- list(exists = FALSE, value = NA, correct = FALSE, expected = "gemiddelde")
          }
          
          if (exists("meest_relevante_spreiding", envir = env)) {
            current_val <- as.character(get("meest_relevante_spreiding", envir = env))
            results$meest_relevante_spreiding <- list(
              exists = TRUE,
              value = current_val,
              correct = tolower(trimws(current_val)) == "interkwartielafstand",
              expected = "interkwartielafstand"
            )
          } else {
            results$meest_relevante_spreiding <- list(exists = FALSE, value = NA, correct = FALSE, expected = "interkwartielafstand")
          }
          
          if (exists("reden", envir = env)) {
            current_val <- as.character(get("reden", envir = env))
            results$reden <- list(
              exists = TRUE,
              value = current_val,
              correct = tolower(trimws(current_val)) == "gebruikt alle informatie",
              expected = "gebruikt alle informatie"
            )
          } else {
            results$reden <- list(exists = FALSE, value = NA, correct = FALSE, expected = "gebruikt alle informatie")
          }
          
          # -----------------------------
          # STAP 3: GEAVANCEERDE SPREIDINGSBEREKENINGEN
          # -----------------------------
          
          # Individual afwijkingen
          afwijking_vars <- c(
            "afwijking_24_1", "afwijking_36_1", "afwijking_35", "afwijking_28_1", "afwijking_24_2",
            "afwijking_28_2", "afwijking_24_3", "afwijking_36_2", "afwijking_32_1", "afwijking_36_3",
            "afwijking_40_1", "afwijking_38", "afwijking_36_4", "afwijking_34", "afwijking_40_2",
            "afwijking_36_5", "afwijking_32_2", "afwijking_36_6", "afwijking_40_3", "afwijking_36_7"
          )

          expected_afwijkingen <- c(
            -9.55,  2.45,  1.45, -5.55, -9.55,
            -5.55, -9.55,  2.45, -1.55,  2.45,
             6.45,  4.45,  2.45,  0.45,  6.45,
             2.45, -1.55,  2.45,  6.45,  2.45
          )

          for (i in seq_along(afwijking_vars)) {
            var_name     <- afwijking_vars[i]
            expected_val <- expected_afwijkingen[i]
            
            if (exists(var_name, envir = env)) {
              current_val <- as.numeric(get(var_name, envir = env))
              results[[var_name]] <- list(
                exists   = TRUE,
                value    = current_val,
                correct  = abs(current_val - expected_val) < 0.005,
                expected = expected_val
              )
            } else {
              results[[var_name]] <- list(
                exists   = FALSE,
                value    = NA,
                correct  = FALSE,
                expected = expected_val
              )
            }
          }
          
          # Individual gekwadrateerde afwijkingen
          gekw_vars <- c("gekw_afwijking_24_1", "gekw_afwijking_36_1", "gekw_afwijking_35", "gekw_afwijking_28_1", "gekw_afwijking_24_2",
                        "gekw_afwijking_28_2", "gekw_afwijking_24_3", "gekw_afwijking_36_2", "gekw_afwijking_32_1", "gekw_afwijking_36_3",
                        "gekw_afwijking_40_1", "gekw_afwijking_38", "gekw_afwijking_36_4", "gekw_afwijking_34", "gekw_afwijking_40_2",
                        "gekw_afwijking_36_5", "gekw_afwijking_32_2", "gekw_afwijking_36_6", "gekw_afwijking_40_3", "gekw_afwijking_36_7")
          
          expected_gekw <- c(91.2025, 6.0025, 2.1025, 30.8025, 91.2025, 30.8025, 91.2025, 6.0025, 2.4025, 6.0025,
                            41.6025, 19.8025, 6.0025, 0.2025, 41.6025, 6.0025, 2.4025, 6.0025, 41.6025, 6.0025)
          
          for (i in 1:length(gekw_vars)) {
            var_name <- gekw_vars[i]
            expected_val <- expected_gekw[i]
            
            if (exists(var_name, envir = env)) {
              current_val <- as.numeric(get(var_name, envir = env))
              results[[var_name]] <- list(
                exists = TRUE,
                value = current_val,
                correct = abs(current_val - expected_val) < 0.005,
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
              correct = abs(current_val - 528.95) < 0.005,
              expected = 528.95
            )
          } else {
            results$sum_of_squares <- list(exists = FALSE, value = NA, correct = FALSE, expected = 528.95)
          }
          
          if (exists("variantie", envir = env)) {
            current_val <- as.numeric(get("variantie", envir = env))
            results$variantie <- list(
              exists = TRUE,
              value = current_val,
              correct = abs(current_val - 27.8295) < 0.005,
              expected = 27.8295
            )
          } else {
            results$variantie <- list(exists = FALSE, value = NA, correct = FALSE, expected = 27.8295)
          }
          
          if (exists("standaardafwijking", envir = env)) {
            current_val <- as.numeric(get("standaardafwijking", envir = env))
            results$standaardafwijking <- list(
              exists = TRUE,
              value = current_val,
              correct = abs(current_val - 5.2763) < 0.005,
              expected = 5.2763
            )
          } else {
            results$standaardafwijking <- list(exists = FALSE, value = NA, correct = FALSE, expected = 5.2763)
          }
          
          if (exists("variatiecoefficient", envir = env)) {
            current_val <- as.numeric(get("variatiecoefficient", envir = env))
            results$variatiecoefficient <- list(
              exists = TRUE,
              value = current_val,
              correct = abs(current_val - 0.1573) < 0.005,
              expected = 0.1573
            )
          } else {
            results$variatiecoefficient <- list(exists = FALSE, value = NA, correct = FALSE, expected = 0.1573)
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
          # STAP 1 FEEDBACK
          # ----------------------
          freq_correct <- all(sapply(paste0("freq_", c(24, 28, 32, 34, 35, 36, 38, 40)), 
                                    function(x) results[[x]]$correct))
          
          if (freq_correct) {
            feedback_parts <- c(feedback_parts, "**STAP 1.1 - FREQUENTIES:** Correct geteld! ✅")
          } else {
            feedback_parts <- c(feedback_parts, "**STAP 1.1 - FREQUENTIES:** Data: 24(3x), 28(2x), 32(2x), 34(1x), 35(1x), 36(7x), 38(1x), 40(3x) ❌")
          }
          
          percent_correct <- all(sapply(paste0("percent_", c(24, 28, 32, 34, 35, 36, 38, 40)), 
                                       function(x) results[[x]]$correct))
          
          if (percent_correct) {
            feedback_parts <- c(feedback_parts, "**STAP 1.2 - PERCENTAGES:** (frequentie/20) * 100 ✅")
          } else {
            feedback_parts <- c(feedback_parts, "**STAP 1.2 - PERCENTAGES:** Gebruik formule (frequentie/20) * 100 ❌")
          }
          
          if (results$modus$correct && results$mediaan$correct && results$gemiddelde$correct) {
            feedback_parts <- c(feedback_parts, "**STAP 1.3 - CENTRALITEIT:** Modus=36 (meest frequent), Mediaan=36 (middelste), Gemiddelde=33.55 ✅")
          } else {
            feedback_parts <- c(feedback_parts, "**STAP 1.3 - CENTRALITEIT:** ❌")
            if (!results$gemiddelde$correct && results$gemiddelde$exists) {
              student_answer <- as.numeric(results$gemiddelde$value)
              if (abs(student_answer - 12) < 0.01) {
                feedback_parts <- c(feedback_parts, "  • Gemiddelde: Je gaf 12, maar dit is fout. Je gebruikte waarschijnlijk een verkeerde berekeningsmethode. Som alle waarden (671) en deel door aantal observaties (20): 671/20 = **33.55**")
              } else {
                feedback_parts <- c(feedback_parts, paste0("  • Gemiddelde: Je gaf ", student_answer, ", maar correct is **33.55**"))
              }
            }
            if (!results$mediaan$correct && results$mediaan$exists) {
              student_answer <- as.numeric(results$mediaan$value)
              feedback_parts <- c(feedback_parts, paste0("  • Mediaan: Je gaf ", student_answer, ", maar correct is **36** (11de waarde van 20)"))
            }
            if (!results$modus$correct && results$modus$exists) {
              student_answer <- as.character(results$modus$value)
              feedback_parts <- c(feedback_parts, paste0("  • Modus: Je gaf ", student_answer, ", maar correct is **36** (komt 7x voor)"))
            }
          }
          
          # ----------------------
          # STAP 2 FEEDBACK
          # ----------------------
          if (results$variatiebreedte$correct && results$q1$correct && results$q3$correct && results$ika$correct) {
            feedback_parts <- c(feedback_parts, "**STAP 2.1 - SPREIDING:** Range=16, Q1=30, Q3=36, IKA=6 ✅")
          } else {
            feedback_parts <- c(feedback_parts, "**STAP 2.1 - SPREIDING:** ❌")
            if (!results$variatiebreedte$correct && results$variatiebreedte$exists) {
              student_answer <- as.numeric(results$variatiebreedte$value)
              feedback_parts <- c(feedback_parts, paste0("  • Range: Je gaf ", student_answer, ", maar correct is 40-24 = **16**"))
            }
            if (!results$q1$correct && results$q1$exists) {
              student_answer <- as.numeric(results$q1$value)
              feedback_parts <- c(feedback_parts, paste0("  • Q1: Je gaf ", student_answer, ", maar correct is **30**"))
            }
            if (!results$q3$correct && results$q3$exists) {
              student_answer <- as.numeric(results$q3$value)
              feedback_parts <- c(feedback_parts, paste0("  • Q3: Je gaf ", student_answer, ", maar correct is **36**"))
            }
            if (!results$ika$correct && results$ika$exists) {
              student_answer <- as.numeric(results$ika$value)
              feedback_parts <- c(feedback_parts, paste0("  • IKA: Je gaf ", student_answer, ", maar correct is 36-30 = **6**"))
            }
          }
          
          if (results$meest_relevante_centraliteit$correct && results$meest_relevante_spreiding$correct && results$reden$correct) {
            feedback_parts <- c(feedback_parts, "**STAP 2.2 - KEUZES:** Intervaldata → gemiddelde en standaardafwijking gebruiken alle informatie ✅")
          } else {
            feedback_parts <- c(feedback_parts, "**STAP 2.2 - KEUZES:** Bij intervaldata: gemiddelde, interkwartielafstand, 'gebruikt alle informatie' ❌")
          }
          
          # ----------------------
          # STAP 3 FEEDBACK
          # ----------------------
          afwijking_vars <- c("afwijking_24_1", "afwijking_36_1", "afwijking_35", "afwijking_28_1", "afwijking_24_2",
                             "afwijking_28_2", "afwijking_24_3", "afwijking_36_2", "afwijking_32_1", "afwijking_36_3",
                             "afwijking_40_1", "afwijking_38", "afwijking_36_4", "afwijking_34", "afwijking_40_2",
                             "afwijking_36_5", "afwijking_32_2", "afwijking_36_6", "afwijking_40_3", "afwijking_36_7")
          
          afwijkingen_correct <- all(sapply(afwijking_vars, function(x) {
            x %in% names(results) && isTRUE(results[[x]]$correct)
          }))
          
          if (afwijkingen_correct) {
            feedback_parts <- c(feedback_parts, "**STAP 3.1 - AFWIJKINGEN:** X - 33.55 voor elke waarde ✅")
          } else {
            feedback_parts <- c(feedback_parts, "**STAP 3.1 - AFWIJKINGEN:** Bereken X - 33.55 voor elke datawaarde ❌")
            
            wrong_afw <- afwijking_vars[
              sapply(afwijking_vars, function(v) {
                v %in% names(results) && isTRUE(results[[v]]$exists) && !isTRUE(results[[v]]$correct)
              })
            ]
            
            if (length(wrong_afw) > 0) {
              feedback_parts <- c(feedback_parts, "  • **Foute afwijkingen (X - 33.55):**")
              
              for (v in wrong_afw) {
                res          <- results[[v]]
                student_val  <- suppressWarnings(as.numeric(res$value))
                expected_val <- res$expected
                
                feedback_parts <- c(
                  feedback_parts,
                  paste0("    - ", v, ": je gaf ", student_val, ", moet zijn ", round(expected_val, 2))
                )
              }
            }
          }
          
          gekw_vars <- c("gekw_afwijking_24_1", "gekw_afwijking_36_1", "gekw_afwijking_35", "gekw_afwijking_28_1", "gekw_afwijking_24_2",
                        "gekw_afwijking_28_2", "gekw_afwijking_24_3", "gekw_afwijking_36_2", "gekw_afwijking_32_1", "gekw_afwijking_36_3",
                        "gekw_afwijking_40_1", "gekw_afwijking_38", "gekw_afwijking_36_4", "gekw_afwijking_34", "gekw_afwijking_40_2",
                        "gekw_afwijking_36_5", "gekw_afwijking_32_2", "gekw_afwijking_36_6", "gekw_afwijking_40_3", "gekw_afwijking_36_7")
                          
          gekw_correct <- all(sapply(gekw_vars, function(x) {
            x %in% names(results) && results[[x]]$correct
          }))

          if (gekw_correct) {
            feedback_parts <- c(
              feedback_parts,
              "**STAP 3.2 - GEKWADRATEERDE AFWIJKINGEN:** (afwijking)² ✅"
            )
          } else {
            feedback_parts <- c(
              feedback_parts,
              "**STAP 3.2 - GEKWADRATEERDE AFWIJKINGEN:** Kwadrateer elke afwijking (X - 33.55)² ❌"
            )
          }

          
          if (results$sum_of_squares$correct && results$variantie$correct && results$standaardafwijking$correct && results$variatiecoefficient$correct) {
            feedback_parts <- c(
              feedback_parts,
              "**STAP 3.3 - VARIANTIE:** Som=528.95, Variantie=528.95/19=27.8295, SD=5.2763, CV=0.1573 ✅"
            )
          } else {
            # Alleen een korte statusregel, geen details
            feedback_parts <- c(
              feedback_parts,
              "**STAP 3.3 - VARIANTIE:** ❌"
            )
          }
          
          # ----------------------------------------
          # COMPREHENSIVE ERROR ANALYSIS (COMMON MISTAKES)
          # ----------------------------------------
          
          if (correct_count != total_questions) {
            feedback_parts <- c(feedback_parts, "", "📚 **Uitleg van veelgemaakte fouten:**")
            
            # =============================
            # ALLE FOUTE ANTWOORDEN MET BEREKENING
            # =============================
            
            # FREQUENTIES - Met berekening
            freq_vars <- c("freq_24", "freq_28", "freq_32", "freq_34", "freq_35", "freq_36", "freq_38", "freq_40")
            freq_names <- c("24", "28", "32", "34", "35", "36", "38", "40")
            freq_explanations <- c(
              "Tel hoe vaak 24 voorkomt in dataset: 24, 24, 24 = 3x",
              "Tel hoe vaak 28 voorkomt in dataset: 28, 28 = 2x", 
              "Tel hoe vaak 32 voorkomt in dataset: 32, 32 = 2x",
              "Tel hoe vaak 34 voorkomt in dataset: 34 = 1x",
              "Tel hoe vaak 35 voorkomt in dataset: 35 = 1x",
              "Tel hoe vaak 36 voorkomt in dataset: 36, 36, 36, 36, 36, 36, 36 = 7x (meest frequent)",
              "Tel hoe vaak 38 voorkomt in dataset: 38 = 1x",
              "Tel hoe vaak 40 voorkomt in dataset: 40, 40, 40 = 3x"
            )
            
            for (i in seq_along(freq_vars)) {
              var_name <- freq_vars[i]
              if (!results[[var_name]]$correct && results[[var_name]]$exists) {
                student_val <- as.numeric(results[[var_name]]$value)
                expected_val <- results[[var_name]]$expected
                feedback_parts <- c(feedback_parts, 
                  paste0("• **", var_name, ":** Je gaf ", student_val, ", maar correct is **", expected_val, "** → ", freq_explanations[i]))
              }
            }
            
            # PERCENTAGES - Met berekening  
            percent_vars <- c("percent_24", "percent_28", "percent_32", "percent_34", "percent_35", "percent_36", "percent_38", "percent_40")
            percent_names <- c("24", "28", "32", "34", "35", "36", "38", "40")
            percent_freqs <- c(3, 2, 2, 1, 1, 7, 1, 3)
            
            for (i in seq_along(percent_vars)) {
              var_name <- percent_vars[i]
              if (!results[[var_name]]$correct && results[[var_name]]$exists) {
                student_val <- as.numeric(results[[var_name]]$value)
                expected_val <- results[[var_name]]$expected
                freq <- percent_freqs[i]
                feedback_parts <- c(feedback_parts, 
                  paste0("• **", var_name, ":** Je gaf ", student_val, ", maar correct is **", expected_val, "%** → (", freq, "/20) × 100 = ", expected_val, "%"))
              }
            }
            
            # CENTRALITEITSMATEN - Met berekening
            if (!results$modus$correct && results$modus$exists) {
              student_val <- results$modus$value
              feedback_parts <- c(feedback_parts, 
                paste0("• **modus:** Je gaf ", student_val, ", maar correct is **36** → Modus = waarde die het meest voorkomt. 36 komt 7x voor (hoogste frequentie)"))
            }
            
            if (!results$mediaan$correct && results$mediaan$exists) {
              student_val <- results$mediaan$value
              feedback_parts <- c(feedback_parts, 
                paste0("• **mediaan:** Je gaf ", student_val, ", maar correct is **36** → Mediaan = middelste waarde. Data gesorteerd (20 waarden): positie (20+1)/2 = 10.5, dus gemiddelde van 10de en 11de waarde = (36+36)/2 = 36"))
            }
            
            if (!results$gemiddelde$correct && results$gemiddelde$exists) {
              student_val <- as.numeric(results$gemiddelde$value)
              if (abs(student_val - 12) < 0.01) {
                feedback_parts <- c(feedback_parts, 
                  "• **gemiddelde:** Je gaf 12, maar dit is fout. Je gebruikte een verkeerde berekeningsmethode. Het juiste antwoord is **33.55** → Som = (24×3 + 28×2 + 32×2 + 34×1 + 35×1 + 36×7 + 38×1 + 40×3) = 671. Gemiddelde = 671/20 = 33.55")
              } else {
                feedback_parts <- c(feedback_parts, 
                  paste0("• **gemiddelde:** Je gaf ", student_val, ", maar correct is **33.55** → Som = (24×3 + 28×2 + 32×2 + 34×1 + 35×1 + 36×7 + 38×1 + 40×3) = 671. Gemiddelde = 671/20 = 33.55"))
              }
            }
            
            # SPREIDINGSMATEN - Met berekening
            if (!results$variatiebreedte$correct && results$variatiebreedte$exists) {
              student_val <- as.numeric(results$variatiebreedte$value)
              feedback_parts <- c(feedback_parts, 
                paste0("• **variatiebreedte:** Je gaf ", student_val, ", maar correct is **16** → Range = Maximum - Minimum = 40 - 24 = 16"))
            }
            
            if (!results$q1$correct && results$q1$exists) {
              student_val <- as.numeric(results$q1$value)
              feedback_parts <- c(feedback_parts, 
                paste0("• **q1:** Je gaf ", student_val, ", maar correct is **30** → Q1 positie = 0.25 × (20+1) = 5.25. Tussen 5de waarde (28) en 6de waarde (32): 28 + 0.25×(32-28) = 30"))
            }
            
            if (!results$q3$correct && results$q3$exists) {
              student_val <- as.numeric(results$q3$value)
              feedback_parts <- c(feedback_parts, 
                paste0("• **q3:** Je gaf ", student_val, ", maar correct is **36** → Q3 positie = 0.75 × (20+1) = 15.75. Op 15de en 16de positie staat 36: Q3 = 36"))
            }
            
            if (!results$ika$correct && results$ika$exists) {
              student_val <- as.numeric(results$ika$value)
              feedback_parts <- c(feedback_parts, 
                paste0("• **ika:** Je gaf ", student_val, ", maar correct is **6** → IKA = Q3 - Q1 = 36 - 30 = 6"))
            }
            
            # PARAMETER KEUZES - Met uitleg
            if (!results$meest_relevante_centraliteit$correct && results$meest_relevante_centraliteit$exists) {
              student_val <- as.character(results$meest_relevante_centraliteit$value)
              feedback_parts <- c(feedback_parts, 
                paste0("• **meest_relevante_centraliteit:** Je gaf '", student_val, "', maar correct is **'gemiddelde'** → Bij intervaldata gebruikt gemiddelde alle informatie van dataset"))
            }
            
            if (!results$meest_relevante_spreiding$correct && results$meest_relevante_spreiding$exists) {
              student_val <- as.character(results$meest_relevante_spreiding$value)
              feedback_parts <- c(feedback_parts, 
                paste0("• **meest_relevante_spreiding:** Je gaf '", student_val, "', maar correct is **'interkwartielafstand'** → IKA is robuust voor uitbijters, past bij gemiddelde"))
            }
            
            if (!results$reden$correct && results$reden$exists) {
              student_val <- as.character(results$reden$value)
              feedback_parts <- c(feedback_parts, 
                paste0("• **reden:** Je gaf '", student_val, "', maar correct is **'gebruikt alle informatie'** → Gemiddelde neemt alle datawaarden mee in berekening"))
            }
            
            # AFWIJKINGEN - Met berekening
            afwijking_vars <- c("afwijking_24_1", "afwijking_36_1", "afwijking_35", "afwijking_28_1", "afwijking_24_2",
                               "afwijking_28_2", "afwijking_24_3", "afwijking_36_2", "afwijking_32_1", "afwijking_36_3",
                               "afwijking_40_1", "afwijking_38", "afwijking_36_4", "afwijking_34", "afwijking_40_2",
                               "afwijking_36_5", "afwijking_32_2", "afwijking_36_6", "afwijking_40_3", "afwijking_36_7")
            
            data_values <- c(24, 36, 35, 28, 24, 28, 24, 36, 32, 36, 40, 38, 36, 34, 40, 36, 32, 36, 40, 36)
            data_positions <- c("1e", "2e", "3e", "4e", "5e", "6e", "7e", "8e", "9e", "10e", "11e", "12e", "13e", "14e", "15e", "16e", "17e", "18e", "19e", "20e")
            
            for (i in seq_along(afwijking_vars)) {
              var_name <- afwijking_vars[i]
              if (var_name %in% names(results) && !results[[var_name]]$correct && results[[var_name]]$exists) {
                student_val <- as.numeric(results[[var_name]]$value)
                expected_val <- results[[var_name]]$expected
                x_val <- data_values[i]
                pos <- data_positions[i]
                feedback_parts <- c(feedback_parts, 
                  paste0("• **Afwijking ", pos, " waarde (X = ", x_val, "):** Je gaf ", student_val, ", maar correct is **", expected_val, "** → ", x_val, " - 33.55 = ", expected_val))
              }
            }
            
            # GEKWADRATEERDE AFWIJKINGEN - Met berekening
            gekw_vars <- c("gekw_afwijking_24_1", "gekw_afwijking_36_1", "gekw_afwijking_35", "gekw_afwijking_28_1", "gekw_afwijking_24_2",
                          "gekw_afwijking_28_2", "gekw_afwijking_24_3", "gekw_afwijking_36_2", "gekw_afwijking_32_1", "gekw_afwijking_36_3",
                          "gekw_afwijking_40_1", "gekw_afwijking_38", "gekw_afwijking_36_4", "gekw_afwijking_34", "gekw_afwijking_40_2",
                          "gekw_afwijking_36_5", "gekw_afwijking_32_2", "gekw_afwijking_36_6", "gekw_afwijking_40_3", "gekw_afwijking_36_7")
            
            expected_afwijkingen_for_gekw <- c(-9.55, 2.45, 1.45, -5.55, -9.55, -5.55, -9.55, 2.45, -1.55, 2.45,
                                              6.45, 4.45, 2.45, 0.45, 6.45, 2.45, -1.55, 2.45, 6.45, 2.45)
            gekw_data_values <- c(24, 36, 35, 28, 24, 28, 24, 36, 32, 36, 40, 38, 36, 34, 40, 36, 32, 36, 40, 36)
            gekw_data_positions <- c("1e", "2e", "3e", "4e", "5e", "6e", "7e", "8e", "9e", "10e", "11e", "12e", "13e", "14e", "15e", "16e", "17e", "18e", "19e", "20e")
            
            for (i in seq_along(gekw_vars)) {
              var_name <- gekw_vars[i]
              if (var_name %in% names(results) && !results[[var_name]]$correct && results[[var_name]]$exists) {
                student_val <- as.numeric(results[[var_name]]$value)
                expected_val <- results[[var_name]]$expected
                afwijking_val <- expected_afwijkingen_for_gekw[i]
                x_val <- gekw_data_values[i]
                pos <- gekw_data_positions[i]
                feedback_parts <- c(feedback_parts, 
                  paste0("• **Gekwadrateerde afwijking ", pos, " waarde (X = ", x_val, "):** Je gaf ", student_val, ", maar correct is **", expected_val, "** → (", afwijking_val, ")² = ", expected_val))
              }
            }
            
            # FINALE BEREKENINGEN - Met berekening
            if (!results$sum_of_squares$correct && results$sum_of_squares$exists) {
              student_val <- as.numeric(results$sum_of_squares$value)
              feedback_parts <- c(feedback_parts, 
                paste0("• **sum_of_squares:** Je gaf ", student_val, ", maar correct is **528.95** → Som van alle gekwadrateerde afwijkingen = 91.2025 + 6.0025 + ... + 6.0025 = 528.95"))
            }
            
            if (!results$variantie$correct && results$variantie$exists) {
              student_val <- as.numeric(results$variantie$value)
              feedback_parts <- c(feedback_parts, 
                paste0("• **variantie:** Je gaf ", student_val, ", maar correct is **27.8295** → Variantie = som_gekwadrateerde_afwijkingen / (n-1) = 528.95 / 19 = 27.8295"))
            }
            
            if (!results$standaardafwijking$correct && results$standaardafwijking$exists) {
              student_val <- as.numeric(results$standaardafwijking$value)
              feedback_parts <- c(feedback_parts, 
                paste0("• **standaardafwijking:** Je gaf ", student_val, ", maar correct is **5.2763** → SD = √variantie = √27.8295 = 5.2763"))
            }
            
            if (!results$variatiecoefficient$correct && results$variatiecoefficient$exists) {
              student_val <- as.numeric(results$variatiecoefficient$value)
              feedback_parts <- c(feedback_parts, 
                paste0("• **variatiecoefficient:** Je gaf ", student_val, ", maar correct is **0.1573** → CV = standaardafwijking / gemiddelde = 5.2763 / 33.55 = 0.1573"))
            }
            

          }




          feedback_parts <- c(
            feedback_parts,
            "",
            paste0("**", correct_count, " van ", total_questions, " juist**"),
            "",
            "🔍 **BELANGRIJKE REGELS VOOR INTERVALDATA:**",
            "• **Alle centraliteitsmaten** zijn toegestaan (modus, mediaan, gemiddelde)",
            "• **Gemiddelde is meest informatief** bij intervaldata",
            "• **Afwijkingen kunnen negatief zijn** (X - μ)",
            "• **Variantie = som gekwadrateerde afwijkingen / (n-1)**",
            "• **Standaardafwijking = √variantie**",
            "• **Variatiecoëfficiënt = SD/gemiddelde** (voor vergelijking tussen datasets)"
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
