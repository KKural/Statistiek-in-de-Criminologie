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
          # STAP 1.1 FEEDBACK - FREQUENTIES
          # ----------------------
          
          feedback_parts <- c(feedback_parts, "**STAP 1.1 - FREQUENTIES:**")
          all_freq_correct <- TRUE
          freq_vars <- c("freq_24", "freq_28", "freq_32", "freq_34", "freq_35", "freq_36", "freq_38", "freq_40")
          
          data_context <- list(
            freq_24 = list(expected = 3, description = "Frequentie waarde 24", context = "komt 3x voor in dataset"),
            freq_28 = list(expected = 2, description = "Frequentie waarde 28", context = "komt 2x voor in dataset"),
            freq_32 = list(expected = 2, description = "Frequentie waarde 32", context = "komt 2x voor in dataset"),
            freq_34 = list(expected = 1, description = "Frequentie waarde 34", context = "komt 1x voor in dataset"),
            freq_35 = list(expected = 1, description = "Frequentie waarde 35", context = "komt 1x voor in dataset"),
            freq_36 = list(expected = 7, description = "Frequentie waarde 36", context = "komt 7x voor - meest frequent"),
            freq_38 = list(expected = 1, description = "Frequentie waarde 38", context = "komt 1x voor in dataset"),
            freq_40 = list(expected = 3, description = "Frequentie waarde 40", context = "komt 3x voor in dataset")
          )
          
          for (freq_var in freq_vars) {
            if (freq_var %in% names(results)) {
              if (!results[[freq_var]]$correct) {
                all_freq_correct <- FALSE
                student_val <- if (results[[freq_var]]$exists) as.numeric(results[[freq_var]]$value) else "Ontbreekt"
                expected_val <- data_context[[freq_var]]$expected
                description <- data_context[[freq_var]]$description
                context <- data_context[[freq_var]]$context
                
                if (results[[freq_var]]$exists) {
                  feedback_parts <- c(feedback_parts, paste0("  • **", description, ":** Je gaf ", student_val, ", maar ", context, ". Juiste antwoord is **", expected_val, "**"))
                } else {
                  feedback_parts <- c(feedback_parts, paste0("  • **", description, ":** Variabele ontbreekt ❌"))
                }
              }
            } else {
              all_freq_correct <- FALSE
              description <- data_context[[freq_var]]$description
              feedback_parts <- c(feedback_parts, paste0("  • **", description, ":** Variabele ontbreekt ❌"))
            }
          }
          
          if (all_freq_correct) {
            feedback_parts <- c(feedback_parts, "")
            feedback_parts <- c(feedback_parts, "**✅ STAP 1.1 - FREQUENTIES:** Alle frequenties correct geteld!")
            feedback_parts <- c(feedback_parts, "")
            feedback_parts <- c(feedback_parts, "📊 **Frequentietabel overzicht:**")
            feedback_parts <- c(feedback_parts, "• Data: 24(3x), 28(2x), 32(2x), 34(1x), 35(1x), 36(7x), 38(1x), 40(3x)")
            feedback_parts <- c(feedback_parts, "• Modus: 36 komt het vaakst voor (7x)")
            feedback_parts <- c(feedback_parts, "• Totaal aantal observaties: **20**")
          } else {
            feedback_parts[1] <- "**❌ STAP 1.1 - FREQUENTIES:** Fouten gevonden"
          }
          
          # ----------------------
          # STAP 1.2 FEEDBACK - PERCENTAGES
          # ----------------------
          
          feedback_parts <- c(feedback_parts, "**STAP 1.2 - PERCENTAGES:**")
          all_percent_correct <- TRUE
          percent_vars <- c("percent_24", "percent_28", "percent_32", "percent_34", "percent_35", "percent_36", "percent_38", "percent_40")
          
          percent_context <- list(
            percent_24 = list(expected = 15.0, freq = 3, description = "Percentage waarde 24", calculation = "(3/20) × 100 = 15.0%"),
            percent_28 = list(expected = 10.0, freq = 2, description = "Percentage waarde 28", calculation = "(2/20) × 100 = 10.0%"),
            percent_32 = list(expected = 10.0, freq = 2, description = "Percentage waarde 32", calculation = "(2/20) × 100 = 10.0%"),
            percent_34 = list(expected = 5.0, freq = 1, description = "Percentage waarde 34", calculation = "(1/20) × 100 = 5.0%"),
            percent_35 = list(expected = 5.0, freq = 1, description = "Percentage waarde 35", calculation = "(1/20) × 100 = 5.0%"),
            percent_36 = list(expected = 35.0, freq = 7, description = "Percentage waarde 36", calculation = "(7/20) × 100 = 35.0%"),
            percent_38 = list(expected = 5.0, freq = 1, description = "Percentage waarde 38", calculation = "(1/20) × 100 = 5.0%"),
            percent_40 = list(expected = 15.0, freq = 3, description = "Percentage waarde 40", calculation = "(3/20) × 100 = 15.0%")
          )
          
          for (percent_var in percent_vars) {
            if (percent_var %in% names(results)) {
              if (!results[[percent_var]]$correct) {
                all_percent_correct <- FALSE
                student_val <- if (results[[percent_var]]$exists) as.numeric(results[[percent_var]]$value) else "Ontbreekt"
                expected_val <- percent_context[[percent_var]]$expected
                description <- percent_context[[percent_var]]$description
                calculation <- percent_context[[percent_var]]$calculation
                freq_val <- percent_context[[percent_var]]$freq
                
                if (results[[percent_var]]$exists) {
                  student_val_num <- as.numeric(student_val)
                  feedback_parts <- c(feedback_parts, paste0("  • **", description, ":** Je gaf ", student_val, "%. Bereken: ", calculation, ". Juiste antwoord is **", expected_val, "%**"))
                } else {
                  feedback_parts <- c(feedback_parts, paste0("  • **", description, ":** Variabele ontbreekt ❌. Bereken: ", calculation, ". Juiste antwoord is **", expected_val, "%**"))
                }
              }
            } else {
              all_percent_correct <- FALSE
              description <- percent_context[[percent_var]]$description
              expected_val <- percent_context[[percent_var]]$expected
              calculation <- percent_context[[percent_var]]$calculation
              feedback_parts <- c(feedback_parts, paste0("  • **", description, ":** Variabele ontbreekt ❌. Bereken: ", calculation, ". Juiste antwoord is **", expected_val, "%**"))
            }
          }
          
          if (all_percent_correct) {
            feedback_parts <- c(feedback_parts, "")
            feedback_parts <- c(feedback_parts, "**✅ STAP 1.2 - PERCENTAGES:** Alle percentages correct berekend!")
            feedback_parts <- c(feedback_parts, "")
            feedback_parts <- c(feedback_parts, "📊 **Percentage berekening formule:** (frequentie ÷ 20) × 100")
          } else {
            header_index <- which(feedback_parts == "**STAP 1.2 - PERCENTAGES:**")
            if (length(header_index) > 0) {
              feedback_parts[header_index] <- "**❌ STAP 1.2 - PERCENTAGES:** Fouten gevonden"
            }
          }
          
          # ----------------------
          # STAP 1.3 FEEDBACK - CENTRALITEIT
          # ----------------------
          
          feedback_parts <- c(feedback_parts, "**STAP 1.3 - CENTRALITEIT:**")
          all_central_correct <- results$modus$correct && results$mediaan$correct && results$gemiddelde$correct
          
          if (!all_central_correct) {
            feedback_parts[length(feedback_parts)] <- "**❌ STAP 1.3 - CENTRALITEIT:** Fouten gevonden"
            
            if (!results$modus$correct && results$modus$exists) {
              student_val <- results$modus$value
              feedback_parts <- c(feedback_parts, paste0("  • **Modus:** Je gaf ", student_val, ", maar correct is **36** (komt 7x voor - hoogste frequentie)"))
            }
            
            if (!results$mediaan$correct && results$mediaan$exists) {
              student_val <- results$mediaan$value
              feedback_parts <- c(feedback_parts, paste0("  • **Mediaan:** Je gaf ", student_val, ", maar correct is **36** (middelste waarde = 11de van 20 gesorteerde waarden)"))
            }
            
            if (!results$gemiddelde$correct && results$gemiddelde$exists) {
              student_val <- as.numeric(results$gemiddelde$value)
              if (abs(student_val - 12) < 0.01) {
                feedback_parts <- c(feedback_parts, "  • **Gemiddelde:** Je gaf 12, maar dit is fout. Je gebruikte waarschijnlijk een verkeerde berekeningsmethode. Som alle waarden (671) en deel door aantal observaties (20): 671/20 = **33.55**")
              } else {
                feedback_parts <- c(feedback_parts, paste0("  • **Gemiddelde:** Je gaf ", student_val, ", maar correct is **33.55** (som = 671, aantal = 20, 671/20 = 33.55)"))
              }
            }
          } else {
            feedback_parts[length(feedback_parts)] <- "**✅ STAP 1.3 - CENTRALITEIT:** Alle centraliteitsmaten correct berekend!"
            feedback_parts <- c(feedback_parts, "")
            feedback_parts <- c(feedback_parts, "📊 **Centraliteitsmaten samenvatting:**")
            feedback_parts <- c(feedback_parts, "• **Modus:** 36 (komt 7x voor)")
            feedback_parts <- c(feedback_parts, "• **Mediaan:** 36 (middelste waarde)")
            feedback_parts <- c(feedback_parts, "• **Gemiddelde:** 33.55 (som ÷ aantal = 671 ÷ 20)")
          }
          
          # ----------------------------------------
          # EXTRA UITLEG BIJ FOUTEN
          # ----------------------------------------
          
          if (correct_count != total_questions) {
            feedback_parts <- c(
              feedback_parts,
              "",
              "📚 **Uitleg van veelgemaakte fouten:**"
            )

            # helper: maak leesbare labels met uitleg
            make_label_with_explanation <- function(var_name, expected_val) {
              if (grepl("^gekw_afwijking_", var_name)) {
                rest <- sub("^gekw_afwijking_", "", var_name)
                xval <- as.numeric(sub("_.*$", "", rest))
                afwijking <- xval - 33.55
                return(
                  paste0(
                    "Voor de gekwadrateerde afwijking bij X = ", xval,
                    " (bereken: (", xval, " - 33.55)² = (", round(afwijking, 2),
                    ")² = **", round(expected_val, 2), "**)"
                  )
                )
              }

              if (grepl("^afwijking_", var_name)) {
                rest <- sub("^afwijking_", "", var_name)
                xval <- as.numeric(sub("_.*$", "", rest))
                return(
                  paste0(
                    "Voor de afwijking bij X = ", xval,
                    " (bereken: ", xval, " - 33.55 = **", round(expected_val, 2), "**)"
                  )
                )
              }

              if (var_name == "standaardafwijking") {
                return("Voor de standaardafwijking (bereken: √variantie = √27.8295 = **5.2763**)")
              }

              if (var_name == "variatiecoefficient") {
                return("Voor de variatiecoëfficiënt (bereken: SD/gemiddelde = 5.2763/33.55 = **0.1573**)")
              }

              if (var_name == "gemiddelde") {
                return("Voor het gemiddelde (bereken: som van alle waarden ÷ aantal = 671/20 = **33.55**)")
              }
              if (var_name == "mediaan") {
                return("Voor de mediaan (sorteer data, neem 11de waarde van 20 = **36**)")
              }
              if (var_name == "modus") {
                return("Voor de modus (waarde die het meest voorkomt: 36 komt 7x voor = **36**)")
              }
              if (var_name == "sum_of_squares") {
                return("Voor de som van de gekwadrateerde afwijkingen (som alle (X-33.55)² = **528.95**)")
              }
              if (var_name == "variantie") {
                return("Voor de variantie (som/(n-1) = 528.95/19 = **27.8295**)")
              }

              return(paste0("Voor dit antwoord = **", round(expected_val, 4), "**"))
            }

            # alle foute maar ingevulde variabelen
            wrong_keys <- names(results)[sapply(results, function(x) x$exists && !x$correct)]

            for (key in wrong_keys) {
              student_val  <- results[[key]]$value
              expected_val <- results[[key]]$expected

              if (is.numeric(student_val)) {
                student_str   <- format(as.numeric(student_val), digits = 6, big.mark = ",")
                expected_str  <- format(as.numeric(expected_val), digits = 6, big.mark = ",")
              } else {
                student_str  <- as.character(student_val)
                expected_str <- as.character(expected_val)
              }

              feedback_parts <- c(
                feedback_parts,
                paste0(
                  "• ", make_label_with_explanation(key, expected_val),
                  ": je gaf ", student_str,
                  ", maar juiste antwoord is **", expected_str, "**."
                )
              )
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
