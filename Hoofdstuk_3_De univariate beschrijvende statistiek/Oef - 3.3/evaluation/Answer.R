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
          afwijking_vars <- c("afwijking_24_1", "afwijking_36_1", "afwijking_35", "afwijking_28_1", "afwijking_24_2",
                             "afwijking_28_2", "afwijking_24_3", "afwijking_36_2", "afwijking_32_1", "afwijking_36_3",
                             "afwijking_40_1", "afwijking_38", "afwijking_36_4", "afwijking_34", "afwijking_40_2",
                             "afwijking_36_5", "afwijking_32_2", "afwijking_36_6", "afwijking_40_3", "afwijking_36_7")
          
          expected_afwijkingen <- c(-9.55, 2.45, 1.45, -5.55, -9.55, -5.55, -9.55, 2.45, -1.55, 2.45,
                                   6.45, 4.45, 2.45, 0.45, 6.45, 2.45, -1.55, 2.45, 6.45, 2.45)
          
          for (i in 1:length(afwijking_vars)) {
            var_name <- afwijking_vars[i]
            expected_val <- expected_afwijkingen[i]
            
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
          
          feedback_lines <- c()
          correct_count <- sum(sapply(results, function(x) x$correct))
          total_questions <- length(results)
          
          # ----------------------
          # STAP 1 FEEDBACK
          # ----------------------
          freq_correct <- all(sapply(paste0("freq_", c(24, 28, 32, 34, 35, 36, 38, 40)), 
                                    function(x) results[[x]]$correct))
          
          if (freq_correct) {
            feedback_lines <- c(feedback_lines, "**STAP 1 - FREQUENTIES:** Correct geteld! ✅")
          } else {
            feedback_lines <- c(feedback_lines, "**STAP 1 - FREQUENTIES:** Data: 24(3x), 28(2x), 32(2x), 34(1x), 35(1x), 36(7x), 38(1x), 40(3x) ❌")
          }
          
          percent_correct <- all(sapply(paste0("percent_", c(24, 28, 32, 34, 35, 36, 38, 40)), 
                                       function(x) results[[x]]$correct))
          
          if (percent_correct) {
            feedback_lines <- c(feedback_lines, "**STAP 1 - PERCENTAGES:** (frequentie/20) * 100 ✅")
          } else {
            feedback_lines <- c(feedback_lines, "**STAP 1 - PERCENTAGES:** Gebruik formule (frequentie/20) * 100 ❌")
          }
          
          if (results$modus$correct && results$mediaan$correct && results$gemiddelde$correct) {
            feedback_lines <- c(feedback_lines, "**STAP 1 - CENTRALITEIT:** Modus=36 (meest frequent), Mediaan=36 (middelste), Gemiddelde=33.55 ✅")
          } else {
            feedback_lines <- c(feedback_lines, "**STAP 1 - CENTRALITEIT:** Modus=36, Mediaan=36, Gemiddelde=33.55 ❌")
          }
          
          # ----------------------
          # STAP 2 FEEDBACK
          # ----------------------
          if (results$variatiebreedte$correct && results$q1$correct && results$q3$correct && results$ika$correct) {
            feedback_lines <- c(feedback_lines, "**STAP 2 - SPREIDING:** Range=16, Q1=30, Q3=36, IKA=6 ✅")
          } else {
            feedback_lines <- c(feedback_lines, "**STAP 2 - SPREIDING:** Variatiebreedte=40-24=16, Q1=30, Q3=36, IKA=36-30=6 ❌")
          }
          
          if (results$meest_relevante_centraliteit$correct && results$meest_relevante_spreiding$correct && results$reden$correct) {
            feedback_lines <- c(feedback_lines, "**STAP 2 - KEUZES:** Intervaldata → gemiddelde en standaardafwijking gebruiken alle informatie ✅")
          } else {
            feedback_lines <- c(feedback_lines, "**STAP 2 - KEUZES:** Bij intervaldata: gemiddelde, interkwartielafstand, 'gebruikt alle informatie' ❌")
          }
          
          # ----------------------
          # STAP 3 FEEDBACK
          # ----------------------
          afwijking_vars <- c("afwijking_24_1", "afwijking_36_1", "afwijking_35", "afwijking_28_1", "afwijking_24_2",
                             "afwijking_28_2", "afwijking_24_3", "afwijking_36_2", "afwijking_32_1", "afwijking_36_3",
                             "afwijking_40_1", "afwijking_38", "afwijking_36_4", "afwijking_34", "afwijking_40_2",
                             "afwijking_36_5", "afwijking_32_2", "afwijking_36_6", "afwijking_40_3", "afwijking_36_7")
          
          afwijkingen_correct <- all(sapply(afwijking_vars, function(x) results[[x]]$correct))
          
          if (afwijkingen_correct) {
            feedback_lines <- c(feedback_lines, "**STAP 3 - AFWIJKINGEN:** X - 33.55 voor elke waarde ✅")
          } else {
            feedback_lines <- c(feedback_lines, "**STAP 3 - AFWIJKINGEN:** Bereken X - 33.55 voor elke datawaarde ❌")
          }
          
          gekw_vars <- c("gekw_afwijking_24_1", "gekw_afwijking_36_1", "gekw_afwijking_35", "gekw_afwijking_28_1", "gekw_afwijking_24_2",
                        "gekw_afwijking_28_2", "gekw_afwijking_24_3", "gekw_afwijking_36_2", "gekw_afwijking_32_1", "gekw_afwijking_36_3",
                        "gekw_afwijking_40_1", "gekw_afwijking_38", "gekw_afwijking_36_4", "gekw_afwijking_34", "gekw_afwijking_40_2",
                        "gekw_afwijking_36_5", "gekw_afwijking_32_2", "gekw_afwijking_36_6", "gekw_afwijking_40_3", "gekw_afwijking_36_7")
          
          gekw_correct <- all(sapply(gekw_vars, function(x) results[[x]]$correct))
          
          if (gekw_correct) {
            feedback_lines <- c(feedback_lines, "**STAP 3 - GEKWADRATEERDE AFWIJKINGEN:** (afwijking)² ✅")
          } else {
            feedback_lines <- c(feedback_lines, "**STAP 3 - GEKWADRATEERDE AFWIJKINGEN:** Kwadrateer elke afwijking ❌")
          }
          
          if (results$sum_of_squares$correct && results$variantie$correct && results$standaardafwijking$correct && results$variatiecoefficient$correct) {
            feedback_lines <- c(feedback_lines, "**STAP 3 - VARIANTIE:** Som=528.95, Variantie=528.95/19=27.8295, SD=5.2763, CV=0.1573 ✅")
          } else {
            feedback_lines <- c(feedback_lines, "**STAP 3 - VARIANTIE:** Som gekwadrateerde afwijkingen = 528.95, variantie = som/(n-1), SD = √variantie ❌")
          }
          
          # ----------------------------------------
          # EXTRA UITLEG BIJ FOUTEN (COMMON MISTAKES)
          # ----------------------------------------
          
          if (correct_count != total_questions) {
            feedback_lines <- c(feedback_lines, "", "📚 **Uitleg van veelgemaakte fouten:**")
            
            # FREQUENCY ERRORS
            if (!freq_correct) {
              feedback_lines <- c(
                feedback_lines,
                "• **FREQUENTIE FOUT:** Tel elke waarde in de data. 24 komt 3x voor, 36 komt 7x voor, etc."
              )
            }
            
            # PERCENTAGE ERRORS  
            if (!percent_correct) {
              feedback_lines <- c(
                feedback_lines,
                "• **PERCENTAGE FOUT:** Gebruik (frequentie/20) × 100. Bijv: 36 komt 7x voor → (7/20) × 100 = 35%"
              )
            }
            
            # CENTRALITY ERRORS
            if (!results$modus$correct && results$modus$exists) {
              student_modus <- as.numeric(results$modus$value)
              if (!is.na(student_modus) && student_modus != 36) {
                feedback_lines <- c(
                  feedback_lines,
                  "• **MODUS FOUT:** Modus = meest voorkomende waarde. 36 komt 7x voor (meest frequent) → modus = 36"
                )
              }
            }
            
            if (!results$mediaan$correct && results$mediaan$exists) {
              student_mediaan <- as.numeric(results$mediaan$value)
              if (!is.na(student_mediaan) && student_mediaan != 36) {
                feedback_lines <- c(
                  feedback_lines,
                  "• **MEDIAAN FOUT:** Sorteer data eerst! 20 waarden → mediaan = gemiddelde van 10de en 11de waarde = (36+36)/2 = 36"
                )
              }
            }
            
            if (!results$gemiddelde$correct && results$gemiddelde$exists) {
              student_gem <- as.numeric(results$gemiddelde$value)
              if (!is.na(student_gem)) {
                feedback_lines <- c(
                  feedback_lines,
                  paste0("• **GEMIDDELDE FOUT:** Som alle waarden / aantal waarden = 671/20 = 33.55 (je had: ", student_gem, ")")
                )
              }
            }
            
            # QUARTILE ERRORS
            if (!results$q1$correct && results$q1$exists) {
              student_q1 <- as.numeric(results$q1$value)
              if (!is.na(student_q1) && student_q1 != 30) {
                feedback_lines <- c(
                  feedback_lines,
                  "• **Q1 FOUT:** Q1 = 25% positie = 5.25ste waarde. In gesorteerde data is dit tussen 28 en 32 → Q1 = 30"
                )
              }
            }
            
            if (!results$q3$correct && results$q3$exists) {
              student_q3 <- as.numeric(results$q3$value)
              if (!is.na(student_q3) && student_q3 != 36) {
                feedback_lines <- c(
                  feedback_lines,
                  "• **Q3 FOUT:** Q3 = 75% positie = 15.75ste waarde. In gesorteerde data → Q3 = 36"
                )
              }
            }
            
            # PARAMETER CHOICE ERRORS
            if (!results$meest_relevante_centraliteit$correct && results$meest_relevante_centraliteit$exists) {
              student_cent <- tolower(trimws(as.character(results$meest_relevante_centraliteit$value)))
              if (student_cent %in% c("modus", "mediaan")) {
                feedback_lines <- c(
                  feedback_lines,
                  "• **CENTRALITEIT KEUZE FOUT:** Bij intervaldata gebruik je het GEMIDDELDE omdat dit alle informatie gebruikt (niet alleen rangorde)"
                )
              }
            }
            
            if (!results$meest_relevante_spreiding$correct && results$meest_relevante_spreiding$exists) {
              student_spr <- tolower(trimws(as.character(results$meest_relevante_spreiding$value)))
              if (student_spr == "variatiebreedte") {
                feedback_lines <- c(
                  feedback_lines,
                  "• **SPREIDING KEUZE FOUT:** Variatiebreedte is gevoelig voor uitbijters. INTERKWARTIELAFSTAND is robuuster"
                )
              }
            }
            
            # DEVIATION ERRORS - Check a few key ones
            if (!results$afwijking_24_1$correct && results$afwijking_24_1$exists) {
              student_afw <- as.numeric(results$afwijking_24_1$value)
              if (!is.na(student_afw)) {
                if (student_afw == 9.55) {
                  feedback_lines <- c(
                    feedback_lines,
                    "• **AFWIJKING TEKEN FOUT:** 24 - 33.55 = -9.55 (negatief!). Let op het teken bij afwijkingen"
                  )
                } else if (abs(student_afw - (-9.55)) > 0.01) {
                  feedback_lines <- c(
                    feedback_lines,
                    "• **AFWIJKING BEREKENING FOUT:** 24 - 33.55 = -9.55 (gebruik decimale punt, niet komma)"
                  )
                }
              }
            }
            
            # VARIANCE CALCULATION ERRORS
            if (!results$variantie$correct && results$variantie$exists) {
              student_var <- as.numeric(results$variantie$value)
              if (!is.na(student_var)) {
                if (abs(student_var - 26.4475) < 0.01) {
                  feedback_lines <- c(
                    feedback_lines,
                    "• **VARIANTIE n FOUT:** Je deelde door n=20, maar gebruik n-1=19 voor steekproefvariantie: 528.95/19 = 27.8295"
                  )
                } else if (student_var == 528.95) {
                  feedback_lines <- c(
                    feedback_lines,
                    "• **VARIANTIE FOUT:** Je gaf de som van kwadraten, maar variantie = som/(n-1) = 528.95/19 = 27.8295"
                  )
                }
              }
            }
            
            if (!results$standaardafwijking$correct && results$standaardafwijking$exists) {
              student_sd <- as.numeric(results$standaardafwijking$value)
              if (!is.na(student_sd) && abs(student_sd - 27.8295) < 0.01) {
                feedback_lines <- c(
                  feedback_lines,
                  "• **STANDAARDAFWIJKING FOUT:** Je gaf de variantie, maar SD = √variantie = √27.8295 = 5.2763"
                )
              }
            }
            
            if (!results$variatiecoefficient$correct && results$variatiecoefficient$exists) {
              student_cv <- as.numeric(results$variatiecoefficient$value)
              if (!is.na(student_cv) && student_cv > 1) {
                feedback_lines <- c(
                  feedback_lines,
                  "• **VARIATIECOËFFICIËNT FOUT:** CV = SD/gemiddelde = 5.2763/33.55 = 0.1573 (geen percentage!)"
                )
              }
            }
          }
          
          feedback_lines <- c(
            feedback_lines,
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
