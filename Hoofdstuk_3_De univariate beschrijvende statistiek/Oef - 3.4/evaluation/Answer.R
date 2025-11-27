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
          
          # Check each frequency individually with detailed explanations
          feedback_parts <- c(feedback_parts, "**STAP 1.1 - FREQUENTIES:**")
          all_freq_correct <- TRUE
          freq_vars <- c("freq_2", "freq_14", "freq_26", "freq_30", "freq_72", "freq_143", "freq_144", "freq_150", "freq_240", "freq_1657")
          
          # Data context for human-readable descriptions  
          data_context <- list(
            freq_2 = list(expected = 1, description = "Frequentie waarde 2 (Britney & Kevin)", context = "komt 1x voor in dataset"),
            freq_14 = list(expected = 1, description = "Frequentie waarde 14 (Mario & Ali)", context = "komt 1x voor in dataset"),
            freq_26 = list(expected = 1, description = "Frequentie waarde 26 (Jennifer & Cris)", context = "komt 1x voor in dataset"),
            freq_30 = list(expected = 1, description = "Frequentie waarde 30 (Renée & Kenny)", context = "komt 1x voor in dataset"),
            freq_72 = list(expected = 1, description = "Frequentie waarde 72 (Carmen & Dennis)", context = "komt 1x voor in dataset"),
            freq_143 = list(expected = 1, description = "Frequentie waarde 143 (Kim & Kris)", context = "komt 1x voor in dataset"),
            freq_144 = list(expected = 1, description = "Frequentie waarde 144 (Britney & Jason)", context = "komt 1x voor in dataset"),
            freq_150 = list(expected = 2, description = "Frequentie waarde 150 (Drew & Nicolas)", context = "komt 2x voor: Drew Barrymore & Jeremy Thomas EN Nicolas Cage & Lisa Marie Presley"),
            freq_240 = list(expected = 1, description = "Frequentie waarde 240 (Elizabeth & Larry)", context = "komt 1x voor in dataset"),
            freq_1657 = list(expected = 1, description = "Frequentie waarde 1657 (Jennifer & Brad)", context = "komt 1x voor - extreme uitbijter die statistieken beïnvloedt")
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
            feedback_parts <- c(feedback_parts, "• Waarden die 1x voorkomen: 2, 14, 26, 30, 72, 143, 144, 240, 1657")  
            feedback_parts <- c(feedback_parts, "• Waarde die 2x voorkomt: **150** (Drew & Jeremy + Nicolas & Lisa)")
            feedback_parts <- c(feedback_parts, "• Totaal aantal celebrity huwelijken: **11**")
          } else {
            feedback_parts[1] <- "**❌ STAP 1.1 - FREQUENTIES:** Fouten gevonden"
          }
          
          # Check each percentage individually with detailed calculation explanations  
          feedback_parts <- c(feedback_parts, "**STAP 1.2 - PERCENTAGES:**")
          all_percent_correct <- TRUE
          percent_vars <- c("percent_2", "percent_14", "percent_26", "percent_30", "percent_72", "percent_143", "percent_144", "percent_150", "percent_240", "percent_1657")
          
          # Expected percentages with calculation explanations
          percent_context <- list(
            percent_2 = list(expected = 9.1, freq = 1, description = "Percentage waarde 2", calculation = "(1/11) × 100 = 9.1%"),
            percent_14 = list(expected = 9.1, freq = 1, description = "Percentage waarde 14", calculation = "(1/11) × 100 = 9.1%"),
            percent_26 = list(expected = 9.1, freq = 1, description = "Percentage waarde 26", calculation = "(1/11) × 100 = 9.1%"),
            percent_30 = list(expected = 9.1, freq = 1, description = "Percentage waarde 30", calculation = "(1/11) × 100 = 9.1%"),
            percent_72 = list(expected = 9.1, freq = 1, description = "Percentage waarde 72", calculation = "(1/11) × 100 = 9.1%"),
            percent_143 = list(expected = 9.1, freq = 1, description = "Percentage waarde 143", calculation = "(1/11) × 100 = 9.1%"),
            percent_144 = list(expected = 9.1, freq = 1, description = "Percentage waarde 144", calculation = "(1/11) × 100 = 9.1%"),
            percent_150 = list(expected = 18.2, freq = 2, description = "Percentage waarde 150", calculation = "(2/11) × 100 = 18.2%"),
            percent_240 = list(expected = 9.1, freq = 1, description = "Percentage waarde 240", calculation = "(1/11) × 100 = 9.1%"),
            percent_1657 = list(expected = 9.1, freq = 1, description = "Percentage waarde 1657", calculation = "(1/11) × 100 = 9.1%")
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
                  
                  # Specific error diagnosis
                  if (percent_var == "percent_150") {
                    if (abs(student_val_num - 9.1) < 0.1) {
                      feedback_parts <- c(feedback_parts, paste0("  • **", description, ":** Je gaf ", student_val, "%, maar je gebruikte frequentie = 1 terwijl 150 twee keer voorkomt. Bereken: ", calculation, ". Juiste antwoord is **", expected_val, "%**"))
                    } else if (abs(student_val_num - 0.18) < 0.01) {
                      feedback_parts <- c(feedback_parts, paste0("  • **", description, ":** Je gaf ", student_val, " maar vergat te vermenigvuldigen met 100. Bereken: ", calculation, ". Juiste antwoord is **", expected_val, "%**"))
                    } else {
                      feedback_parts <- c(feedback_parts, paste0("  • **", description, ":** Je gaf ", student_val, "%. Bereken: ", calculation, ". Juiste antwoord is **", expected_val, "%**"))
                    }
                  } else if (percent_var == "percent_1657" && abs(student_val_num - 0) < 0.1) {
                    feedback_parts <- c(feedback_parts, paste0("  • **", description, ":** Je gaf ", student_val, "%, maar 1657 komt wel 1x voor in de dataset. Bereken: ", calculation, ". Juiste antwoord is **", expected_val, "%**"))
                  } else {
                    feedback_parts <- c(feedback_parts, paste0("  • **", description, ":** Je gaf ", student_val, "%. Bereken: ", calculation, ". Juiste antwoord is **", expected_val, "%**"))
                  }
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
            feedback_parts <- c(feedback_parts, "📊 **Percentage berekening formule:** (frequentie ÷ totaal) × 100")
            feedback_parts <- c(feedback_parts, "• Waarden met frequentie 1: elk 9.1% van totaal (1/11 × 100)")
            feedback_parts <- c(feedback_parts, "• Waarde 150 met frequentie 2: 18.2% van totaal (2/11 × 100)")
          } else {
            # Find the header and replace it
            header_index <- which(feedback_parts == "**STAP 1.2 - PERCENTAGES:**")
            if (length(header_index) > 0) {
              feedback_parts[header_index] <- "**❌ STAP 1.2 - PERCENTAGES:** Fouten gevonden"
            }
          }
          
          # Check each centrality measure individually with detailed explanations
          feedback_parts <- c(feedback_parts, "**STAP 1.3 - CENTRALITEIT:**")
          all_central_correct <- TRUE
          
          # Dataset: 2, 14, 26, 30, 72, 143, 144, 150, 150, 240, 1657 (gesorteerd)
          # Som: 240+144+143+72+30+26+2+150+14+150+1657 = 2628
          
          if ("gemiddelde" %in% names(results)) {
            if (!results$gemiddelde$correct) {
              all_central_correct <- FALSE
              if (results$gemiddelde$exists) {
                student_answer <- as.numeric(results$gemiddelde$value)
                if (abs(student_answer - 216.27) < 0.5) {
                  feedback_parts <- c(feedback_parts, paste0("  • **Gemiddelde (rekenkundig):** Je gaf ", student_answer, ", maar je gebruikte n=10 in plaats van n=11. Bereken: som ÷ aantal = 2628 ÷ 11 = **238.91**"))
                } else if (abs(student_answer - 143) < 0.5) {
                  feedback_parts <- c(feedback_parts, paste0("  • **Gemiddelde (rekenkundig):** Je gaf ", student_answer, ", maar dit is de mediaan! Het gemiddelde bereken je door alle waarden op te tellen en te delen door het aantal. Bereken: 2628 ÷ 11 = **238.91**"))
                } else if (abs(student_answer - 150) < 0.5) {
                  feedback_parts <- c(feedback_parts, paste0("  • **Gemiddelde (rekenkundig):** Je gaf ", student_answer, ", maar dit is de modus! Het gemiddelde bereken je door alle waarden op te tellen en te delen door het aantal. Bereken: 2628 ÷ 11 = **238.91**"))
                } else {
                  feedback_parts <- c(feedback_parts, paste0("  • **Gemiddelde (rekenkundig):** Je gaf ", student_answer, ". Bereken: (240+144+143+72+30+26+2+150+14+150+1657) ÷ 11 = 2628 ÷ 11 = **238.91**"))
                }
              } else {
                feedback_parts <- c(feedback_parts, "  • **Gemiddelde (rekenkundig):** Variabele ontbreekt ❌. Bereken: som van alle waarden ÷ aantal = 2628 ÷ 11 = **238.91**")
              }
            }
          } else {
            all_central_correct <- FALSE
            feedback_parts <- c(feedback_parts, "  • **Gemiddelde (rekenkundig):** Variabele ontbreekt ❌. Bereken: som van alle waarden ÷ aantal = 2628 ÷ 11 = **238.91**")
          }
          
          if ("mediaan" %in% names(results)) {
            if (!results$mediaan$correct) {
              all_central_correct <- FALSE
              if (results$mediaan$exists) {
                student_answer <- as.numeric(results$mediaan$value)
                if (abs(student_answer - 238.91) < 0.5) {
                  feedback_parts <- c(feedback_parts, paste0("  • **Mediaan (middelste waarde):** Je gaf ", student_answer, ", maar dit is het gemiddelde! Voor de mediaan sorteer je de data en neem je de middelste waarde. Bij n=11 is dat positie (11+1)÷2 = 6de waarde = **143**"))
                } else if (abs(student_answer - 144) < 0.5) {
                  feedback_parts <- c(feedback_parts, paste0("  • **Mediaan (middelste waarde):** Je gaf ", student_answer, ", maar dit is de 7de waarde in de gesorteerde reeks. De mediaan is de 6de waarde bij n=11. Gesorteerd: 2,14,26,30,72,**143**,144,150,150,240,1657. Juiste antwoord is **143**"))
                } else if (abs(student_answer - 150) < 0.5) {
                  feedback_parts <- c(feedback_parts, paste0("  • **Mediaan (middelste waarde):** Je gaf ", student_answer, ", maar dit is de modus! Voor de mediaan neem je de middelste waarde van de gesorteerde reeks. Bij n=11 is dat positie 6. Juiste antwoord is **143**"))
                } else {
                  feedback_parts <- c(feedback_parts, paste0("  • **Mediaan (middelste waarde):** Je gaf ", student_answer, ". Sorteer de data oplopend en neem de 6de waarde (van 11): 2,14,26,30,72,**143**,144,150,150,240,1657. Juiste antwoord is **143**"))
                }
              } else {
                feedback_parts <- c(feedback_parts, "  • **Mediaan (middelste waarde):** Variabele ontbreekt ❌. Sorteer de data en neem de 6de waarde: **143**")
              }
            }
          } else {
            all_central_correct <- FALSE
            feedback_parts <- c(feedback_parts, "  • **Mediaan (middelste waarde):** Variabele ontbreekt ❌. Sorteer de data en neem de 6de waarde: **143**")
          }
          
          if ("modus" %in% names(results)) {
            if (!results$modus$correct) {
              all_central_correct <- FALSE
              if (results$modus$exists) {
                student_answer <- as.character(results$modus$value)
                if (student_answer == "143") {
                  feedback_parts <- c(feedback_parts, paste0("  • **Modus (meest voorkomende waarde):** Je gaf ", student_answer, ", maar deze waarde komt slechts 1x voor. De modus is de waarde die het meest voorkomt. In de dataset komt **150** twee keer voor (Drew & Jeremy + Nicolas & Lisa), alle andere waarden komen 1x voor. **Correct: 150**"))
                } else if (student_answer == "238.91" || abs(suppressWarnings(as.numeric(student_answer)) - 238.91) < 0.5) {
                  feedback_parts <- c(feedback_parts, paste0("  • **Modus (meest voorkomende waarde):** Je gaf ", student_answer, ", maar dit is het gemiddelde! De modus is de waarde die het vaakst voorkomt. **150** komt 2x voor, alle andere waarden komen 1x voor. **Correct: 150**"))
                } else if (tolower(student_answer) %in% c("geen", "na", "none")) {
                  feedback_parts <- c(feedback_parts, paste0("  • **Modus (meest voorkomende waarde):** Je zei er is geen modus, maar **150** komt 2x voor (Drew Barrymore & Jeremy Thomas + Nicolas Cage & Lisa Marie Presley) terwijl alle andere waarden slechts 1x voorkomen. **Correct: 150**"))
                } else {
                  feedback_parts <- c(feedback_parts, paste0("  • **Modus (meest voorkomende waarde):** Je gaf ", student_answer, ". De modus is de waarde die het vaakst voorkomt. Tel de frequenties: **150** komt 2x voor, alle andere waarden komen 1x voor. **Correct: 150**"))
                }
              } else {
                feedback_parts <- c(feedback_parts, "  • **Modus (meest voorkomende waarde):** Variabele ontbreekt ❌. De waarde die het vaakst voorkomt is **150** (2x)")
              }
            }
          } else {
            all_central_correct <- FALSE
            feedback_parts <- c(feedback_parts, "  • **Modus (meest voorkomende waarde):** Variabele ontbreekt ❌. De waarde die het vaakst voorkomt is **150** (2x)")
          }
          
          if (all_central_correct) {
            feedback_parts <- c(feedback_parts, "")
            feedback_parts <- c(feedback_parts, "**✅ STAP 1.3 - CENTRALITEIT:** Alle centraaliteitsmaten correct berekend!")
            feedback_parts <- c(feedback_parts, "")
            feedback_parts <- c(feedback_parts, "📊 **Centraliteitsmaten samenvatting:**")
            feedback_parts <- c(feedback_parts, "• **Gemiddelde:** 238.91 (som ÷ aantal = 2628 ÷ 11)")
            feedback_parts <- c(feedback_parts, "• **Mediaan:** 143 (middelste waarde van gesorteerde reeks)")  
            feedback_parts <- c(feedback_parts, "• **Modus:** 150 (komt 2x voor, andere waarden 1x)")
            feedback_parts <- c(feedback_parts, "• **Impact uitbijter:** Jennifer Aniston (1657) trekt gemiddelde omhoog, maar mediaan blijft robuust")
          } else {
            # Find the header and replace it
            header_index <- which(feedback_parts == "**STAP 1.3 - CENTRALITEIT:**")
            if (length(header_index) > 0) {
              feedback_parts[header_index] <- "**❌ STAP 1.3 - CENTRALITEIT:** Fouten gevonden"
            }
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
          
          # Check each afwijking individually with detailed step-by-step explanations
          feedback_parts <- c(feedback_parts, "**STAP 3.1 - AFWIJKINGEN:**")
          all_afwijkingen_correct <- TRUE
          
          # Human-readable descriptions for each deviation with couple names and positions
          afwijking_context <- list(
            afwijking_240 = list(expected = 1.09, description = "Afwijking Elizabeth & Larry (X = 240)", calculation = "240 - 238.91 = 1.09", position = "1e waarde"),
            afwijking_144 = list(expected = -94.91, description = "Afwijking Britney & Jason (X = 144)", calculation = "144 - 238.91 = -94.91", position = "2e waarde"),
            afwijking_143 = list(expected = -95.91, description = "Afwijking Kim & Kris (X = 143)", calculation = "143 - 238.91 = -95.91", position = "3e waarde"),
            afwijking_72 = list(expected = -166.91, description = "Afwijking Carmen & Dennis (X = 72)", calculation = "72 - 238.91 = -166.91", position = "4e waarde"),
            afwijking_30 = list(expected = -208.91, description = "Afwijking Renée & Kenny (X = 30)", calculation = "30 - 238.91 = -208.91", position = "5e waarde"),
            afwijking_26 = list(expected = -212.91, description = "Afwijking Jennifer & Cris (X = 26)", calculation = "26 - 238.91 = -212.91", position = "6e waarde"),
            afwijking_2 = list(expected = -236.91, description = "Afwijking Britney & Kevin (X = 2)", calculation = "2 - 238.91 = -236.91", position = "7e waarde"),
            afwijking_150_1 = list(expected = -88.91, description = "Afwijking Drew & Jeremy (X = 150, 1e)", calculation = "150 - 238.91 = -88.91", position = "8e waarde"),
            afwijking_14 = list(expected = -224.91, description = "Afwijking Mario & Ali (X = 14)", calculation = "14 - 238.91 = -224.91", position = "9e waarde"),
            afwijking_150_2 = list(expected = -88.91, description = "Afwijking Nicolas & Lisa (X = 150, 2e)", calculation = "150 - 238.91 = -88.91", position = "10e waarde"),
            afwijking_1657 = list(expected = 1418.09, description = "Afwijking Jennifer & Brad (X = 1657)", calculation = "1657 - 238.91 = 1418.09", position = "11e waarde (extreme uitbijter)")
          )
          
          afwijking_vars <- names(afwijking_context)
          
          for (afw_var in afwijking_vars) {
            if (afw_var %in% names(results)) {
              if (!results[[afw_var]]$correct) {
                all_afwijkingen_correct <- FALSE
              }
            } else {
              all_afwijkingen_correct <- FALSE
            }
          }
          
          if (all_afwijkingen_correct) {
            # Remove individual messages and show overall success
            start_idx <- which(feedback_parts == "**STAP 3.1 - AFWIJKINGEN:**")
            feedback_parts <- feedback_parts[1:(start_idx-1)]
            feedback_parts <- c(feedback_parts, "**✅ STAP 3.1 - AFWIJKINGEN:** Alle afwijkingen correct berekend!")
          } else {
            # Remove individual messages and show summary error
            start_idx <- which(feedback_parts == "**STAP 3.1 - AFWIJKINGEN:**")
            feedback_parts <- feedback_parts[1:(start_idx-1)]
            feedback_parts <- c(feedback_parts, "**❌ STAP 3.1 - AFWIJKINGEN:** Fouten gevonden")
          }
          
          # Check each gekwadrateerde afwijking individually with detailed step-by-step explanations
          feedback_parts <- c(feedback_parts, "**STAP 3.2 - GEKWADRATEERDE AFWIJKINGEN:**")
          all_gekw_correct <- TRUE
          
          # Human-readable descriptions for each squared deviation with detailed calculations
          gekw_context <- list(
            gekw_afwijking_240 = list(expected = 1.1881, description = "Gekwadrateerde afwijking Elizabeth & Larry (X = 240)", calculation = "(240 - 238.91)² = (1.09)² = 1.19", deviation = 1.09),
            gekw_afwijking_144 = list(expected = 9007.9081, description = "Gekwadrateerde afwijking Britney & Jason (X = 144)", calculation = "(144 - 238.91)² = (-94.91)² = 9,007.91", deviation = -94.91),
            gekw_afwijking_143 = list(expected = 9198.7281, description = "Gekwadrateerde afwijking Kim & Kris (X = 143)", calculation = "(143 - 238.91)² = (-95.91)² = 9,198.73", deviation = -95.91),
            gekw_afwijking_72 = list(expected = 27859.1481, description = "Gekwadrateerde afwijking Carmen & Dennis (X = 72)", calculation = "(72 - 238.91)² = (-166.91)² = 27,859.15", deviation = -166.91),
            gekw_afwijking_30 = list(expected = 43643.5881, description = "Gekwadrateerde afwijking Renée & Kenny (X = 30)", calculation = "(30 - 238.91)² = (-208.91)² = 43,643.59", deviation = -208.91),
            gekw_afwijking_26 = list(expected = 45331.0681, description = "Gekwadrateerde afwijking Jennifer & Cris (X = 26)", calculation = "(26 - 238.91)² = (-212.91)² = 45,331.07", deviation = -212.91),
            gekw_afwijking_2 = list(expected = 56126.3481, description = "Gekwadrateerde afwijking Britney & Kevin (X = 2)", calculation = "(2 - 238.91)² = (-236.91)² = 56,126.35", deviation = -236.91),
            gekw_afwijking_150_1 = list(expected = 7905.0081, description = "Gekwadrateerde afwijking Drew & Jeremy (X = 150, 1e)", calculation = "(150 - 238.91)² = (-88.91)² = 7,905.01", deviation = -88.91),
            gekw_afwijking_14 = list(expected = 50584.5081, description = "Gekwadrateerde afwijking Mario & Ali (X = 14)", calculation = "(14 - 238.91)² = (-224.91)² = 50,584.51", deviation = -224.91),
            gekw_afwijking_150_2 = list(expected = 7905.0081, description = "Gekwadrateerde afwijking Nicolas & Lisa (X = 150, 2e)", calculation = "(150 - 238.91)² = (-88.91)² = 7,905.01", deviation = -88.91),
            gekw_afwijking_1657 = list(expected = 2010979.1981, description = "Gekwadrateerde afwijking Jennifer & Brad (X = 1657)", calculation = "(1657 - 238.91)² = (1418.09)² = 2,010,979.20", deviation = 1418.09)
          )
          
          gekw_vars <- names(gekw_context)
          
          for (gekw_var in gekw_vars) {
            if (gekw_var %in% names(results)) {
              if (!results[[gekw_var]]$correct) {
                all_gekw_correct <- FALSE
              }
            } else {
              all_gekw_correct <- FALSE
            }
          }
          
          if (all_gekw_correct) {
            # Remove individual messages and show overall success
            start_idx <- which(feedback_parts == "**STAP 3.2 - GEKWADRATEERDE AFWIJKINGEN:**")
            feedback_parts <- feedback_parts[1:(start_idx-1)]
            feedback_parts <- c(feedback_parts, "**✅ STAP 3.2 - GEKWADRATEERDE AFWIJKINGEN:** Alle gekwadrateerde afwijkingen correct berekend!")
          } else {
            # Remove individual messages and show summary error
            start_idx <- which(feedback_parts == "**STAP 3.2 - GEKWADRATEERDE AFWIJKINGEN:**")
            feedback_parts <- feedback_parts[1:(start_idx-1)]
            feedback_parts <- c(feedback_parts, "**❌ STAP 3.2 - GEKWADRATEERDE AFWIJKINGEN:** Fouten gevonden")
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
              # Alleen aangeven dat STAP 3.3 fout is.
              all_variance_correct <- FALSE
              # Geen extra bullet hier – uitleg komt in "Uitleg van veelgemaakte fouten".
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
            # Titel
            feedback_parts <- c(
              feedback_parts,
              "",
              "📚 **Uitleg van gemaakte fouten:**"
            )

            # helper: maak leesbare labels met uitleg hoe het berekend wordt
            make_label_with_explanation <- function(var_name, expected_val) {
              if (grepl("^gekw_afwijking_", var_name)) {
                rest <- sub("^gekw_afwijking_", "", var_name)
                xval <- as.numeric(sub("_.*$", "", rest))
                afwijking <- xval - 238.91
                return(
                  paste0(
                    "Voor de gekwadrateerde afwijking bij X = ", xval,
                    " (bereken: (", xval, " - 238.91)² = (", round(afwijking, 2),
                    ")² = ", format(expected_val, big.mark = ","), ")"
                  )
                )
              }

              if (grepl("^afwijking_", var_name)) {
                rest <- sub("^afwijking_", "", var_name)
                xval <- as.numeric(sub("_.*$", "", rest))
                return(
                  paste0(
                    "Voor de afwijking bij X = ", xval,
                    " (bereken: ", xval, " - 238.91 = ", expected_val, ")"
                  )
                )
              }

              if (var_name == "standaardafwijking") {
                return(
                  "Voor de standaardafwijking (bereken: √variantie = √226,854.09 = 476.29)"
                )
              }

              if (var_name == "gemiddelde") {
                return(
                  "Voor het gemiddelde (bereken: som van alle waarden ÷ aantal = 2628/11 = 238.91)"
                )
              }
              if (var_name == "mediaan") {
                return("Voor de mediaan (sorteer data, neem middelste waarde: 6de van 11 → 143)")
              }
              if (var_name == "modus") {
                return("Voor de modus (waarde die het meest voorkomt: 150 komt 2x voor)")
              }
              if (var_name == "variatiebreedte") {
                return("Voor de variatiebreedte (bereken: 1657 - 2 = 1655)")
              }
              if (var_name == "q1") {
                return("Voor Q1 (3de waarde in de gesorteerde data = 26)")
              }
              if (var_name == "q3") {
                return("Voor Q3 (9de waarde in de gesorteerde data = 150)")
              }
              if (var_name == "ika") {
                return("Voor de interkwartielafstand (Q3 - Q1 = 150 - 26 = 124)")
              }
              if (var_name == "sum_of_squares") {
                return("Voor de som van de gekwadrateerde afwijkingen (som alle (X-238.91)² = 2,268,540.92)")
              }
              if (var_name == "variantie") {
                return("Voor de variantie (som/(n-1) = 2,268,540.92/10 = 226,854.09)")
              }

              # default
              return("Voor dit antwoord")
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
