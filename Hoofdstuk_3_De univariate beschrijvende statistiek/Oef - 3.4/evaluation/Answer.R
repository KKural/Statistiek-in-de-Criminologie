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
          # STAP 1 FEEDBACK
          # ----------------------
          
          # Check frequencies first
          freq_vars <- c("freq_2", "freq_14", "freq_26", "freq_30", "freq_72", "freq_143", "freq_144", "freq_150", "freq_240", "freq_1657")
          freq_correct <- all(sapply(freq_vars[freq_vars %in% names(results)], function(x) results[[x]]$correct))
          
          if (freq_correct) {
            feedback_parts <- c(feedback_parts, "**STAP 1.1 - FREQUENTIES:** Correct geteld! ✅")
          } else {
            feedback_parts <- c(feedback_parts, "**STAP 1.1 - FREQUENTIES:** Data: 2(1x), 14(1x), 26(1x), 30(1x), 72(1x), 143(1x), 144(1x), 150(2x), 240(1x), 1657(1x) ❌")
          }
          
          # Check percentages
          percent_vars <- c("percent_2", "percent_14", "percent_26", "percent_30", "percent_72", "percent_143", "percent_144", "percent_150", "percent_240", "percent_1657")
          percent_correct <- all(sapply(percent_vars[percent_vars %in% names(results)], function(x) results[[x]]$correct))
          
          if (percent_correct) {
            feedback_parts <- c(feedback_parts, "**STAP 1.2 - PERCENTAGES:** (frequentie/11) * 100 ✅")
          } else {
            feedback_parts <- c(feedback_parts, "**STAP 1.2 - PERCENTAGES:** Gebruik formule (frequentie/11) * 100 ❌")
          }
          
          # Check central tendency measures
          if ("gemiddelde" %in% names(results) && results$gemiddelde$correct && "mediaan" %in% names(results) && results$mediaan$correct && "modus" %in% names(results) && results$modus$correct) {
            feedback_parts <- c(feedback_parts, "**STAP 1.3 - CENTRALITEIT:** Gemiddelde=238.91, Mediaan=143, Modus=150 ✅")
          } else {
            feedback_parts <- c(feedback_parts, "**STAP 1.3 - CENTRALITEIT:** ❌")
            if ("gemiddelde" %in% names(results) && !results$gemiddelde$correct && results$gemiddelde$exists) {
              student_answer <- as.numeric(results$gemiddelde$value)
              feedback_parts <- c(feedback_parts, paste0("  • Gemiddelde: Je gaf ", student_answer, ", maar correct is **238.91**"))
            }
            if ("mediaan" %in% names(results) && !results$mediaan$correct && results$mediaan$exists) {
              student_answer <- as.numeric(results$mediaan$value)
              feedback_parts <- c(feedback_parts, paste0("  • Mediaan: Je gaf ", student_answer, ", maar correct is **143** (6de waarde van 11)"))
            }
            if ("modus" %in% names(results) && !results$modus$correct && results$modus$exists) {
              student_answer <- as.character(results$modus$value)
              feedback_parts <- c(feedback_parts, paste0("  • Modus: Je gaf ", student_answer, ", maar correct is **150** (komt 2x voor)"))
            }
          }
          
          # ----------------------
          # STAP 2 FEEDBACK
          # ----------------------
          
          # Check spread measures
          if ("variatiebreedte" %in% names(results) && results$variatiebreedte$correct && "q1" %in% names(results) && results$q1$correct && "q3" %in% names(results) && results$q3$correct && "ika" %in% names(results) && results$ika$correct) {
            feedback_parts <- c(feedback_parts, "**STAP 2.1 - SPREIDING:** Range=1655, Q1=26, Q3=150, IKA=124 ✅")
          } else {
            feedback_parts <- c(feedback_parts, "**STAP 2.1 - SPREIDING:** ❌")
            if ("variatiebreedte" %in% names(results) && !results$variatiebreedte$correct && results$variatiebreedte$exists) {
              student_answer <- as.numeric(results$variatiebreedte$value)
              feedback_parts <- c(feedback_parts, paste0("  • Range: Je gaf ", student_answer, ", maar correct is 1657-2 = **1655**"))
            }
            if ("q1" %in% names(results) && !results$q1$correct && results$q1$exists) {
              student_answer <- as.numeric(results$q1$value)
              feedback_parts <- c(feedback_parts, paste0("  • Q1: Je gaf ", student_answer, ", maar correct is **26**"))
            }
            if ("q3" %in% names(results) && !results$q3$correct && results$q3$exists) {
              student_answer <- as.numeric(results$q3$value)
              feedback_parts <- c(feedback_parts, paste0("  • Q3: Je gaf ", student_answer, ", maar correct is **150**"))
            }
            if ("ika" %in% names(results) && !results$ika$correct && results$ika$exists) {
              student_answer <- as.numeric(results$ika$value)
              feedback_parts <- c(feedback_parts, paste0("  • IKA: Je gaf ", student_answer, ", maar correct is 150-26 = **124**"))
            }
          }
          
          # ----------------------
          # STAP 3 FEEDBACK
          # ----------------------
          
          # Check afwijkingen
          afwijking_vars <- c("afwijking_2", "afwijking_14", "afwijking_26", "afwijking_30", "afwijking_72", "afwijking_143", "afwijking_144", "afwijking_150_1", "afwijking_150_2", "afwijking_240", "afwijking_1657")
          afwijkingen_correct <- all(sapply(afwijking_vars[afwijking_vars %in% names(results)], function(x) results[[x]]$correct))
          
          if (afwijkingen_correct) {
            feedback_parts <- c(feedback_parts, "**STAP 3.1 - AFWIJKINGEN:** X - 238.91 voor elke waarde ✅")
          } else {
            feedback_parts <- c(feedback_parts, "**STAP 3.1 - AFWIJKINGEN:** Bereken X - 238.91 voor elke datawaarde ❌")
          }
          
          # Check gekwadrateerde afwijkingen
          gekw_vars <- c("gekw_afwijking_2", "gekw_afwijking_14", "gekw_afwijking_26", "gekw_afwijking_30", "gekw_afwijking_72", "gekw_afwijking_143", "gekw_afwijking_144", "gekw_afwijking_150_1", "gekw_afwijking_150_2", "gekw_afwijking_240", "gekw_afwijking_1657")
          gekw_correct <- all(sapply(gekw_vars[gekw_vars %in% names(results)], function(x) results[[x]]$correct))
          
          if (gekw_correct) {
            feedback_parts <- c(feedback_parts, "**STAP 3.2 - GEKWADRATEERDE AFWIJKINGEN:** (afwijking)² ✅")
          } else {
            feedback_parts <- c(feedback_parts, "**STAP 3.2 - GEKWADRATEERDE AFWIJKINGEN:** Kwadrateer elke afwijking ❌")
          }
          
          # Check variance calculations
          if ("sum_of_squares" %in% names(results) && results$sum_of_squares$correct && "variantie" %in% names(results) && results$variantie$correct && "standaardafwijking" %in% names(results) && results$standaardafwijking$correct) {
            feedback_parts <- c(feedback_parts, "**STAP 3.3 - VARIANTIE:** Som=2,268,540.92, Variantie=226,854.09, SD=476.29 ✅")
          } else {
            feedback_parts <- c(feedback_parts, "**STAP 3.3 - VARIANTIE:** ❌")
            if ("sum_of_squares" %in% names(results) && !results$sum_of_squares$correct && results$sum_of_squares$exists) {
              student_answer <- as.numeric(results$sum_of_squares$value)
              feedback_parts <- c(feedback_parts, paste0("  • Som gekwadrateerde afwijkingen: Je gaf ", format(student_answer, big.mark=","), ", maar correct is **2,268,540.92**"))
            }
            if ("variantie" %in% names(results) && !results$variantie$correct && results$variantie$exists) {
              student_answer <- as.numeric(results$variantie$value)
              feedback_parts <- c(feedback_parts, paste0("  • Variantie: Je gaf ", format(student_answer, big.mark=","), ", maar correct is som/(n-1) = **226,854.09**"))
            }
            if ("standaardafwijking" %in% names(results) && !results$standaardafwijking$correct && results$standaardafwijking$exists) {
              student_answer <- as.numeric(results$standaardafwijking$value)
              feedback_parts <- c(feedback_parts, paste0("  • Standaardafwijking: Je gaf ", student_answer, ", maar correct is √variantie = **476.29**"))
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
