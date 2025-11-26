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
          freq_correct <- all(sapply(freq_vars, function(x) results[[x]]$correct))
          
          if (freq_correct) {
            feedback_lines <- c(feedback_lines, "**FREQUENTIES:** Alle waarden juist geteld ✅")
          } else {
            feedback_lines <- c(feedback_lines, "**FREQUENTIES:** Tel hoe vaak elke waarde voorkomt. 150 komt 2x voor! ❌")
          }
          
          # Check percentages
          percent_vars <- c("percent_2", "percent_14", "percent_26", "percent_30", "percent_72", "percent_143", "percent_144", "percent_150", "percent_240", "percent_1657")
          percent_correct <- all(sapply(percent_vars, function(x) results[[x]]$correct))
          
          if (percent_correct) {
            feedback_lines <- c(feedback_lines, "**PERCENTAGES:** (Frequentie/11) × 100 juist berekend ✅")
          } else {
            feedback_lines <- c(feedback_lines, "**PERCENTAGES:** Formule: (freq/11) × 100. Meeste = 9.1%, 150 = 18.2% ❌")
          }
          
          # Basic calculations feedback
          if (results$gemiddelde$correct) {
            feedback_lines <- c(feedback_lines, "**GEMIDDELDE:** Som = 2628, n = 11 → 2628/11 = 238.91 ✅")
          } else {
            feedback_lines <- c(feedback_lines, "**GEMIDDELDE:** Som alle waarden (2628) / aantal (11) = 238.91 ❌")
          }
          
          if (results$mediaan$correct) {
            feedback_lines <- c(feedback_lines, "**MEDIAAN:** Gesorteerd: 6de waarde van 11 = 143 dagen ✅")
          } else {
            feedback_lines <- c(feedback_lines, "**MEDIAAN:** Sorteer eerst! 6de waarde = 143 dagen ❌")
          }
          
          if (results$modus$correct) {
            feedback_lines <- c(feedback_lines, "**MODUS:** Meest voorkomende waarde = 150 (komt 2x voor) ✅")
          } else {
            feedback_lines <- c(feedback_lines, "**MODUS:** Welke waarde heeft de hoogste frequentie? 150 komt 2x voor ❌")
          }
          
          if (results$variatiebreedte$correct && results$q1$correct && results$q3$correct && results$ika$correct) {
            feedback_lines <- c(feedback_lines, "**SPREIDING:** Range=1655, Q1=26, Q3=150, IKA=124 ✅")
          } else {
            feedback_lines <- c(feedback_lines, "**SPREIDING:** Range=1657-2=1655, Q1=26, Q3=150, IKA=150-26=124 ❌")
          }
          
          # Check deviations
          deviation_vars <- c("afwijking_240", "afwijking_144", "afwijking_143", "afwijking_72", "afwijking_30",
                             "afwijking_26", "afwijking_2", "afwijking_150_1", "afwijking_14", "afwijking_150_2", "afwijking_1657")
          
          deviations_correct <- all(sapply(deviation_vars, function(x) results[[x]]$correct))
          
          if (deviations_correct) {
            feedback_lines <- c(feedback_lines, "**AFWIJKINGEN:** X - 238.91 voor alle waarden ✅")
          } else {
            feedback_lines <- c(feedback_lines, "**AFWIJKINGEN:** Bereken waarde - 238.91 voor elke observatie ❌")
          }
          
          # Check squared deviations
          squared_vars <- c("gekw_afwijking_240", "gekw_afwijking_144", "gekw_afwijking_143", "gekw_afwijking_72", "gekw_afwijking_30",
                           "gekw_afwijking_26", "gekw_afwijking_2", "gekw_afwijking_150_1", "gekw_afwijking_14", "gekw_afwijking_150_2", "gekw_afwijking_1657")
          
          squared_correct <- all(sapply(squared_vars, function(x) results[[x]]$correct))
          
          if (squared_correct) {
            feedback_lines <- c(feedback_lines, "**GEKWADRATEERDE AFWIJKINGEN:** (afwijking)² ✅")
          } else {
            feedback_lines <- c(feedback_lines, "**GEKWADRATEERDE AFWIJKINGEN:** Kwadrateer elke afwijking ❌")
          }
          
          if (results$sum_of_squares$correct && results$variantie$correct && results$standaardafwijking$correct) {
            feedback_lines <- c(feedback_lines, "**VARIANTIE ANALYSE:** SS=2268540.92, Variantie=226854.09, SD=476.29 ✅")
          } else {
            feedback_lines <- c(feedback_lines, "**VARIANTIE ANALYSE:** Som kwadraten/10, dan √variantie ❌")
          }
          
          # Error analysis
          if (correct_count != total_questions) {
            feedback_lines <- c(feedback_lines, "", "📚 **Veelgemaakte fouten bij extreme waarden:**")
            
            if (!results$freq_150$correct && results$freq_150$exists) {
              student_freq <- as.numeric(results$freq_150$value)
              if (!is.na(student_freq) && student_freq == 1) {
                feedback_lines <- c(feedback_lines, "• **FREQUENTIE FOUT:** 150 komt 2 keer voor in de data!")
              }
            }
            
            if (!results$percent_150$correct && results$percent_150$exists) {
              student_perc <- as.numeric(results$percent_150$value)
              if (!is.na(student_perc) && abs(student_perc - 9.1) < 0.1) {
                feedback_lines <- c(feedback_lines, "• **PERCENTAGE FOUT:** 150 komt 2x voor: (2/11) × 100 = 18.2%")
              }
            }
            
            if (!results$modus$correct && results$modus$exists) {
              student_modus <- as.numeric(results$modus$value)
              if (!is.na(student_modus) && student_modus == 143) {
                feedback_lines <- c(feedback_lines, "• **MODUS FOUT:** Modus ≠ mediaan. Modus = meest voorkomende waarde = 150")
              }
            }
            
            if (!results$mediaan$correct && results$mediaan$exists) {
              student_med <- as.numeric(results$mediaan$value)
              if (!is.na(student_med) && abs(student_med - 238.91) < 1) {
                feedback_lines <- c(feedback_lines, "• **MEDIAAN FOUT:** Je gaf het gemiddelde. Mediaan = middelste waarde na sorteren = 143")
              }
            }
            
            if (!results$q1$correct && results$q1$exists) {
              student_q1 <- as.numeric(results$q1$value)
              if (!is.na(student_q1) && student_q1 == 30) {
                feedback_lines <- c(feedback_lines, "• **Q1 FOUT:** Onderste helft heeft 5 waarden: 2,14,26,30,72 → mediaan = 26")
              }
            }
            
            if (!results$variantie$correct && results$variantie$exists) {
              student_var <- as.numeric(results$variantie$value)
              if (!is.na(student_var) && abs(student_var - 206231) < 100) {
                feedback_lines <- c(feedback_lines, "• **VARIANTIE n FOUT:** Gebruik n-1=10, niet n=11: 2268540.92/10 = 226854.09")
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