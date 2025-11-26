context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          # Use the provided environment (env) instead of globalenv()
          results <- list()
          
          # Data: 24, 36, 35, 28, 24, 28, 24, 36, 32, 36, 40, 38, 36, 34, 40, 36, 32, 36, 40, 36
          
          # STAP 0 - Frequentietabel
          # Frequency variables
          if (exists("freq_24", envir = env)) {
            current_val <- as.numeric(get("freq_24", envir = env))
            results$freq_24 <- list(
              exists = TRUE,
              value = get("freq_24", envir = env),
              correct = current_val == 3,
              expected = 3
            )
          } else {
            results$freq_24 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 3)
          }
          
          if (exists("freq_28", envir = env)) {
            current_val <- as.numeric(get("freq_28", envir = env))
            results$freq_28 <- list(
              exists = TRUE,
              value = get("freq_28", envir = env),
              correct = current_val == 2,
              expected = 2
            )
          } else {
            results$freq_28 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 2)
          }
          
          if (exists("freq_32", envir = env)) {
            current_val <- as.numeric(get("freq_32", envir = env))
            results$freq_32 <- list(
              exists = TRUE,
              value = get("freq_32", envir = env),
              correct = current_val == 2,
              expected = 2
            )
          } else {
            results$freq_32 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 2)
          }
          
          if (exists("freq_34", envir = env)) {
            current_val <- as.numeric(get("freq_34", envir = env))
            results$freq_34 <- list(
              exists = TRUE,
              value = get("freq_34", envir = env),
              correct = current_val == 1,
              expected = 1
            )
          } else {
            results$freq_34 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 1)
          }
          
          if (exists("freq_35", envir = env)) {
            current_val <- as.numeric(get("freq_35", envir = env))
            results$freq_35 <- list(
              exists = TRUE,
              value = get("freq_35", envir = env),
              correct = current_val == 1,
              expected = 1
            )
          } else {
            results$freq_35 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 1)
          }
          
          if (exists("freq_36", envir = env)) {
            current_val <- as.numeric(get("freq_36", envir = env))
            results$freq_36 <- list(
              exists = TRUE,
              value = get("freq_36", envir = env),
              correct = current_val == 7,
              expected = 7
            )
          } else {
            results$freq_36 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 7)
          }
          
          if (exists("freq_38", envir = env)) {
            current_val <- as.numeric(get("freq_38", envir = env))
            results$freq_38 <- list(
              exists = TRUE,
              value = get("freq_38", envir = env),
              correct = current_val == 1,
              expected = 1
            )
          } else {
            results$freq_38 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 1)
          }
          
          if (exists("freq_40", envir = env)) {
            current_val <- as.numeric(get("freq_40", envir = env))
            results$freq_40 <- list(
              exists = TRUE,
              value = get("freq_40", envir = env),
              correct = current_val == 3,
              expected = 3
            )
          } else {
            results$freq_40 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 3)
          }
          
          # Percentage variables
          if (exists("percent_24", envir = env)) {
            current_val <- as.numeric(get("percent_24", envir = env))
            results$percent_24 <- list(
              exists = TRUE,
              value = get("percent_24", envir = env),
              correct = abs(current_val - 15.0) < 0.1,
              expected = 15.0
            )
          } else {
            results$percent_24 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 15.0)
          }
          
          if (exists("percent_28", envir = env)) {
            current_val <- as.numeric(get("percent_28", envir = env))
            results$percent_28 <- list(
              exists = TRUE,
              value = get("percent_28", envir = env),
              correct = abs(current_val - 10.0) < 0.1,
              expected = 10.0
            )
          } else {
            results$percent_28 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 10.0)
          }
          
          if (exists("percent_32", envir = env)) {
            current_val <- as.numeric(get("percent_32", envir = env))
            results$percent_32 <- list(
              exists = TRUE,
              value = get("percent_32", envir = env),
              correct = abs(current_val - 10.0) < 0.1,
              expected = 10.0
            )
          } else {
            results$percent_32 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 10.0)
          }
          
          if (exists("percent_34", envir = env)) {
            current_val <- as.numeric(get("percent_34", envir = env))
            results$percent_34 <- list(
              exists = TRUE,
              value = get("percent_34", envir = env),
              correct = abs(current_val - 5.0) < 0.1,
              expected = 5.0
            )
          } else {
            results$percent_34 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 5.0)
          }
          
          if (exists("percent_35", envir = env)) {
            current_val <- as.numeric(get("percent_35", envir = env))
            results$percent_35 <- list(
              exists = TRUE,
              value = get("percent_35", envir = env),
              correct = abs(current_val - 5.0) < 0.1,
              expected = 5.0
            )
          } else {
            results$percent_35 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 5.0)
          }
          
          if (exists("percent_36", envir = env)) {
            current_val <- as.numeric(get("percent_36", envir = env))
            results$percent_36 <- list(
              exists = TRUE,
              value = get("percent_36", envir = env),
              correct = abs(current_val - 35.0) < 0.1,
              expected = 35.0
            )
          } else {
            results$percent_36 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 35.0)
          }
          
          if (exists("percent_38", envir = env)) {
            current_val <- as.numeric(get("percent_38", envir = env))
            results$percent_38 <- list(
              exists = TRUE,
              value = get("percent_38", envir = env),
              correct = abs(current_val - 5.0) < 0.1,
              expected = 5.0
            )
          } else {
            results$percent_38 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 5.0)
          }
          
          if (exists("percent_40", envir = env)) {
            current_val <- as.numeric(get("percent_40", envir = env))
            results$percent_40 <- list(
              exists = TRUE,
              value = get("percent_40", envir = env),
              correct = abs(current_val - 15.0) < 0.1,
              expected = 15.0
            )
          } else {
            results$percent_40 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 15.0)
          }
          
          # STAP 1 - Basic statistics
          if (exists("modus", envir = env)) {
            current_val <- as.numeric(get("modus", envir = env))
            results$modus <- list(
              exists = TRUE,
              value = get("modus", envir = env),
              correct = current_val == 36,
              expected = 36
            )
          } else {
            results$modus <- list(exists = FALSE, value = NA, correct = FALSE, expected = 36)
          }
          
          if (exists("mediaan", envir = env)) {
            current_val <- as.numeric(get("mediaan", envir = env))
            results$mediaan <- list(
              exists = TRUE,
              value = get("mediaan", envir = env),
              correct = current_val == 36,
              expected = 36
            )
          } else {
            results$mediaan <- list(exists = FALSE, value = NA, correct = FALSE, expected = 36)
          }
          
          if (exists("gemiddelde", envir = env)) {
            current_val <- as.numeric(get("gemiddelde", envir = env))
            results$gemiddelde <- list(
              exists = TRUE,
              value = get("gemiddelde", envir = env),
              correct = abs(current_val - 33.55) < 0.01,
              expected = 33.55
            )
          } else {
            results$gemiddelde <- list(exists = FALSE, value = NA, correct = FALSE, expected = 33.55)
          }
          
          if (exists("variatiebreedte", envir = env)) {
            current_val <- as.numeric(get("variatiebreedte", envir = env))
            results$variatiebreedte <- list(
              exists = TRUE,
              value = get("variatiebreedte", envir = env),
              correct = current_val == 16,
              expected = 16
            )
          } else {
            results$variatiebreedte <- list(exists = FALSE, value = NA, correct = FALSE, expected = 16)
          }
          
          if (exists("q1", envir = env)) {
            current_val <- as.numeric(get("q1", envir = env))
            results$q1 <- list(
              exists = TRUE,
              value = get("q1", envir = env),
              correct = current_val == 30,
              expected = 30
            )
          } else {
            results$q1 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 30)
          }
          
          if (exists("q3", envir = env)) {
            current_val <- as.numeric(get("q3", envir = env))
            results$q3 <- list(
              exists = TRUE,
              value = get("q3", envir = env),
              correct = current_val == 36,
              expected = 36
            )
          } else {
            results$q3 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 36)
          }
          
          if (exists("ika", envir = env)) {
            current_val <- as.numeric(get("ika", envir = env))
            results$ika <- list(
              exists = TRUE,
              value = get("ika", envir = env),
              correct = current_val == 6,
              expected = 6
            )
          } else {
            results$ika <- list(exists = FALSE, value = NA, correct = FALSE, expected = 6)
          }
          
          # Parameter choices
          if (exists("meest_relevante_centraliteit", envir = env)) {
            current_val <- tolower(trimws(as.character(get("meest_relevante_centraliteit", envir = env))))
            results$meest_relevante_centraliteit <- list(
              exists = TRUE,
              value = get("meest_relevante_centraliteit", envir = env),
              correct = current_val == "gemiddelde",
              expected = "gemiddelde"
            )
          } else {
            results$meest_relevante_centraliteit <- list(exists = FALSE, value = NA, correct = FALSE, expected = "gemiddelde")
          }
          
          if (exists("meest_relevante_spreiding", envir = env)) {
            current_val <- tolower(trimws(as.character(get("meest_relevante_spreiding", envir = env))))
            results$meest_relevante_spreiding <- list(
              exists = TRUE,
              value = get("meest_relevante_spreiding", envir = env),
              correct = current_val == "interkwartielafstand",
              expected = "interkwartielafstand"
            )
          } else {
            results$meest_relevante_spreiding <- list(exists = FALSE, value = NA, correct = FALSE, expected = "interkwartielafstand")
          }
          
          if (exists("reden", envir = env)) {
            current_val <- tolower(trimws(as.character(get("reden", envir = env))))
            results$reden <- list(
              exists = TRUE,
              value = get("reden", envir = env),
              correct = current_val == "gebruikt alle informatie",
              expected = "gebruikt alle informatie"
            )
          } else {
            results$reden <- list(exists = FALSE, value = NA, correct = FALSE, expected = "gebruikt alle informatie")
          }
          
          # STAP 2 - Advanced calculations
          if (exists("afwijkingen", envir = env)) {
            current_val <- get("afwijkingen", envir = env)
            expected_vec <- c(-9.55, 2.45, 1.45, -5.55, -9.55, -5.55, -9.55, 2.45, -1.55, 2.45, 6.45, 4.45, 2.45, 0.45, 6.45, 2.45, -1.55, 2.45, 6.45, 2.45)
            
            results$afwijkingen <- list(
              exists = TRUE,
              value = current_val,
              correct = is.numeric(current_val) && length(current_val) == 20 && 
                        all(abs(as.numeric(current_val) - expected_vec) < 0.01),
              expected = expected_vec
            )
          } else {
            results$afwijkingen <- list(exists = FALSE, value = NA, correct = FALSE, expected = "vector van 20 afwijkingen")
          }
          
          if (exists("gekwadrateerde_afwijkingen", envir = env)) {
            current_val <- get("gekwadrateerde_afwijkingen", envir = env)
            expected_vec2 <- c(91.2025, 6.0025, 2.1025, 30.8025, 91.2025, 30.8025, 91.2025, 6.0025, 2.4025, 6.0025, 41.6025, 19.8025, 6.0025, 0.2025, 41.6025, 6.0025, 2.4025, 6.0025, 41.6025, 6.0025)
            
            results$gekwadrateerde_afwijkingen <- list(
              exists = TRUE,
              value = current_val,
              correct = is.numeric(current_val) && length(current_val) == 20 && 
                        all(abs(as.numeric(current_val) - expected_vec2) < 0.01),
              expected = expected_vec2
            )
          } else {
            results$gekwadrateerde_afwijkingen <- list(exists = FALSE, value = NA, correct = FALSE, expected = "vector van 20 gekwadrateerde afwijkingen")
          }
          
          # STAP 3 - Variance and standard deviation
          if (exists("sum_of_squares", envir = env)) {
            current_val <- as.numeric(get("sum_of_squares", envir = env))
            results$sum_of_squares <- list(
              exists = TRUE,
              value = get("sum_of_squares", envir = env),
              correct = abs(current_val - 528.95) < 0.01,
              expected = 528.95
            )
          } else {
            results$sum_of_squares <- list(exists = FALSE, value = NA, correct = FALSE, expected = 528.95)
          }
          
          if (exists("variantie", envir = env)) {
            current_val <- as.numeric(get("variantie", envir = env))
            results$variantie <- list(
              exists = TRUE,
              value = get("variantie", envir = env),
              correct = abs(current_val - 27.8295) < 0.01,
              expected = 27.8295
            )
          } else {
            results$variantie <- list(exists = FALSE, value = NA, correct = FALSE, expected = 27.8295)
          }
          
          if (exists("standaardafwijking", envir = env)) {
            current_val <- as.numeric(get("standaardafwijking", envir = env))
            results$standaardafwijking <- list(
              exists = TRUE,
              value = get("standaardafwijking", envir = env),
              correct = abs(current_val - 5.2763) < 0.01,
              expected = 5.2763
            )
          } else {
            results$standaardafwijking <- list(exists = FALSE, value = NA, correct = FALSE, expected = 5.2763)
          }
          
          if (exists("variatiecoefficient", envir = env)) {
            current_val <- as.numeric(get("variatiecoefficient", envir = env))
            results$variatiecoefficient <- list(
              exists = TRUE,
              value = get("variatiecoefficient", envir = env),
              correct = abs(current_val - 0.1573) < 0.01,
              expected = 0.1573
            )
          } else {
            results$variatiecoefficient <- list(exists = FALSE, value = NA, correct = FALSE, expected = 0.1573)
          }
          
          # Store results for use in comparator
          assign("detailed_results", results, envir = globalenv())
          
          # Return overall success
          all_correct <- all(sapply(results, function(x) x$correct))
          return(all_correct)
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          # Get detailed results from global environment
          results <- get("detailed_results", envir = globalenv())
          
          # Create detailed feedback showing all variables
          feedback_lines <- c()
          correct_count <- sum(sapply(results, function(x) x$correct))
          total_questions <- length(results)
          
          # ----------------------
          # FREQUENTIETABEL FEEDBACK
          # ----------------------
          if (results$freq_24$exists && results$freq_24$correct) {
            feedback_lines <- c(feedback_lines, "**FREQUENTIE 24 uren:** 3 personen ✅")
          } else if (results$freq_24$exists) {
            feedback_lines <- c(feedback_lines, paste0("**FREQUENTIE 24 uren:** ", results$freq_24$value, " (verwacht: 3) ❌"))
          } else {
            feedback_lines <- c(feedback_lines, "**FREQUENTIE 24 uren:** Ontbreekt (verwacht: 3) ❌")
          }
          
          if (results$freq_28$exists && results$freq_28$correct) {
            feedback_lines <- c(feedback_lines, "**FREQUENTIE 28 uren:** 2 personen ✅")
          } else if (results$freq_28$exists) {
            feedback_lines <- c(feedback_lines, paste0("**FREQUENTIE 28 uren:** ", results$freq_28$value, " (verwacht: 2) ❌"))
          } else {
            feedback_lines <- c(feedback_lines, "**FREQUENTIE 28 uren:** Ontbreekt (verwacht: 2) ❌")
          }
          
          if (results$freq_32$exists && results$freq_32$correct) {
            feedback_lines <- c(feedback_lines, "**FREQUENTIE 32 uren:** 2 personen ✅")
          } else if (results$freq_32$exists) {
            feedback_lines <- c(feedback_lines, paste0("**FREQUENTIE 32 uren:** ", results$freq_32$value, " (verwacht: 2) ❌"))
          } else {
            feedback_lines <- c(feedback_lines, "**FREQUENTIE 32 uren:** Ontbreekt (verwacht: 2) ❌")
          }
          
          if (results$freq_34$exists && results$freq_34$correct) {
            feedback_lines <- c(feedback_lines, "**FREQUENTIE 34 uren:** 1 persoon ✅")
          } else if (results$freq_34$exists) {
            feedback_lines <- c(feedback_lines, paste0("**FREQUENTIE 34 uren:** ", results$freq_34$value, " (verwacht: 1) ❌"))
          } else {
            feedback_lines <- c(feedback_lines, "**FREQUENTIE 34 uren:** Ontbreekt (verwacht: 1) ❌")
          }
          
          if (results$freq_35$exists && results$freq_35$correct) {
            feedback_lines <- c(feedback_lines, "**FREQUENTIE 35 uren:** 1 persoon ✅")
          } else if (results$freq_35$exists) {
            feedback_lines <- c(feedback_lines, paste0("**FREQUENTIE 35 uren:** ", results$freq_35$value, " (verwacht: 1) ❌"))
          } else {
            feedback_lines <- c(feedback_lines, "**FREQUENTIE 35 uren:** Ontbreekt (verwacht: 1) ❌")
          }
          
          if (results$freq_36$exists && results$freq_36$correct) {
            feedback_lines <- c(feedback_lines, "**FREQUENTIE 36 uren:** 7 personen (MODUS!) ✅")
          } else if (results$freq_36$exists) {
            feedback_lines <- c(feedback_lines, paste0("**FREQUENTIE 36 uren:** ", results$freq_36$value, " (verwacht: 7 - MODUS!) ❌"))
          } else {
            feedback_lines <- c(feedback_lines, "**FREQUENTIE 36 uren:** Ontbreekt (verwacht: 7 - MODUS!) ❌")
          }
          
          if (results$freq_38$exists && results$freq_38$correct) {
            feedback_lines <- c(feedback_lines, "**FREQUENTIE 38 uren:** 1 persoon ✅")
          } else if (results$freq_38$exists) {
            feedback_lines <- c(feedback_lines, paste0("**FREQUENTIE 38 uren:** ", results$freq_38$value, " (verwacht: 1) ❌"))
          } else {
            feedback_lines <- c(feedback_lines, "**FREQUENTIE 38 uren:** Ontbreekt (verwacht: 1) ❌")
          }
          
          if (results$freq_40$exists && results$freq_40$correct) {
            feedback_lines <- c(feedback_lines, "**FREQUENTIE 40 uren:** 3 personen ✅")
          } else if (results$freq_40$exists) {
            feedback_lines <- c(feedback_lines, paste0("**FREQUENTIE 40 uren:** ", results$freq_40$value, " (verwacht: 3) ❌"))
          } else {
            feedback_lines <- c(feedback_lines, "**FREQUENTIE 40 uren:** Ontbreekt (verwacht: 3) ❌")
          }
          
          # Percentages
          if (results$percent_24$exists && results$percent_24$correct) {
            feedback_lines <- c(feedback_lines, "**PERCENTAGE 24 uren:** (3/20) × 100 = 15.0% ✅")
          } else if (results$percent_24$exists) {
            feedback_lines <- c(feedback_lines, paste0("**PERCENTAGE 24 uren:** ", results$percent_24$value, "% (verwacht: 15.0%) ❌"))
          } else {
            feedback_lines <- c(feedback_lines, "**PERCENTAGE 24 uren:** Ontbreekt (verwacht: 15.0%) ❌")
          }
          
          if (results$percent_28$exists && results$percent_28$correct) {
            feedback_lines <- c(feedback_lines, "**PERCENTAGE 28 uren:** (2/20) × 100 = 10.0% ✅")
          } else if (results$percent_28$exists) {
            feedback_lines <- c(feedback_lines, paste0("**PERCENTAGE 28 uren:** ", results$percent_28$value, "% (verwacht: 10.0%) ❌"))
          } else {
            feedback_lines <- c(feedback_lines, "**PERCENTAGE 28 uren:** Ontbreekt (verwacht: 10.0%) ❌")
          }
          
          if (results$percent_32$exists && results$percent_32$correct) {
            feedback_lines <- c(feedback_lines, "**PERCENTAGE 32 uren:** (2/20) × 100 = 10.0% ✅")
          } else if (results$percent_32$exists) {
            feedback_lines <- c(feedback_lines, paste0("**PERCENTAGE 32 uren:** ", results$percent_32$value, "% (verwacht: 10.0%) ❌"))
          } else {
            feedback_lines <- c(feedback_lines, "**PERCENTAGE 32 uren:** Ontbreekt (verwacht: 10.0%) ❌")
          }
          
          if (results$percent_34$exists && results$percent_34$correct) {
            feedback_lines <- c(feedback_lines, "**PERCENTAGE 34 uren:** (1/20) × 100 = 5.0% ✅")
          } else if (results$percent_34$exists) {
            feedback_lines <- c(feedback_lines, paste0("**PERCENTAGE 34 uren:** ", results$percent_34$value, "% (verwacht: 5.0%) ❌"))
          } else {
            feedback_lines <- c(feedback_lines, "**PERCENTAGE 34 uren:** Ontbreekt (verwacht: 5.0%) ❌")
          }
          
          if (results$percent_35$exists && results$percent_35$correct) {
            feedback_lines <- c(feedback_lines, "**PERCENTAGE 35 uren:** (1/20) × 100 = 5.0% ✅")
          } else if (results$percent_35$exists) {
            feedback_lines <- c(feedback_lines, paste0("**PERCENTAGE 35 uren:** ", results$percent_35$value, "% (verwacht: 5.0%) ❌"))
          } else {
            feedback_lines <- c(feedback_lines, "**PERCENTAGE 35 uren:** Ontbreekt (verwacht: 5.0%) ❌")
          }
          
          if (results$percent_36$exists && results$percent_36$correct) {
            feedback_lines <- c(feedback_lines, "**PERCENTAGE 36 uren:** (7/20) × 100 = 35.0% ✅")
          } else if (results$percent_36$exists) {
            feedback_lines <- c(feedback_lines, paste0("**PERCENTAGE 36 uren:** ", results$percent_36$value, "% (verwacht: 35.0%) ❌"))
          } else {
            feedback_lines <- c(feedback_lines, "**PERCENTAGE 36 uren:** Ontbreekt (verwacht: 35.0%) ❌")
          }
          
          if (results$percent_38$exists && results$percent_38$correct) {
            feedback_lines <- c(feedback_lines, "**PERCENTAGE 38 uren:** (1/20) × 100 = 5.0% ✅")
          } else if (results$percent_38$exists) {
            feedback_lines <- c(feedback_lines, paste0("**PERCENTAGE 38 uren:** ", results$percent_38$value, "% (verwacht: 5.0%) ❌"))
          } else {
            feedback_lines <- c(feedback_lines, "**PERCENTAGE 38 uren:** Ontbreekt (verwacht: 5.0%) ❌")
          }
          
          if (results$percent_40$exists && results$percent_40$correct) {
            feedback_lines <- c(feedback_lines, "**PERCENTAGE 40 uren:** (3/20) × 100 = 15.0% ✅")
          } else if (results$percent_40$exists) {
            feedback_lines <- c(feedback_lines, paste0("**PERCENTAGE 40 uren:** ", results$percent_40$value, "% (verwacht: 15.0%) ❌"))
          } else {
            feedback_lines <- c(feedback_lines, "**PERCENTAGE 40 uren:** Ontbreekt (verwacht: 15.0%) ❌")
          }
          
          # ----------------------
          # CENTRALITY & STATISTICS
          # ----------------------
          
          if (results$modus$exists && results$modus$correct) {
            feedback_lines <- c(feedback_lines, "**MODUS:** 36 (hoogste frequentie: 7×) ✅")
          } else if (results$modus$exists) {
            feedback_lines <- c(feedback_lines, paste0("**MODUS:** ", results$modus$value, " (verwacht: 36) ❌"))
          } else {
            feedback_lines <- c(feedback_lines, "**MODUS:** Ontbreekt (verwacht: 36) ❌")
          }
          
          if (results$mediaan$exists && results$mediaan$correct) {
            feedback_lines <- c(feedback_lines, "**MEDIAAN:** 36 (middelste waarde van gesorteerde data) ✅")
          } else if (results$mediaan$exists) {
            feedback_lines <- c(feedback_lines, paste0("**MEDIAAN:** ", results$mediaan$value, " (verwacht: 36) ❌"))
          } else {
            feedback_lines <- c(feedback_lines, "**MEDIAAN:** Ontbreekt (verwacht: 36) ❌")
          }
          
          if (results$gemiddelde$exists && results$gemiddelde$correct) {
            feedback_lines <- c(feedback_lines, "**GEMIDDELDE:** (Som alle waarden) ÷ 20 = 671 ÷ 20 = 33.55 ✅")
          } else if (results$gemiddelde$exists) {
            feedback_lines <- c(feedback_lines, paste0("**GEMIDDELDE:** ", results$gemiddelde$value, " (verwacht: 33.55) ❌"))
          } else {
            feedback_lines <- c(feedback_lines, "**GEMIDDELDE:** Ontbreekt (verwacht: 33.55) ❌")
          }
          
          if (results$variatiebreedte$exists && results$variatiebreedte$correct) {
            feedback_lines <- c(feedback_lines, "**VARIATIEBREEDTE:** Hoogste - laagste = 40 - 24 = 16 ✅")
          } else if (results$variatiebreedte$exists) {
            feedback_lines <- c(feedback_lines, paste0("**VARIATIEBREEDTE:** ", results$variatiebreedte$value, " (verwacht: 16) ❌"))
          } else {
            feedback_lines <- c(feedback_lines, "**VARIATIEBREEDTE:** Ontbreekt (verwacht: 16) ❌")
          }
          
          if (results$q1$exists && results$q1$correct) {
            feedback_lines <- c(feedback_lines, "**Q1:** 25% positie = 5,25ste waarde → 30 ✅")
          } else if (results$q1$exists) {
            feedback_lines <- c(feedback_lines, paste0("**Q1:** ", results$q1$value, " (verwacht: 30) ❌"))
          } else {
            feedback_lines <- c(feedback_lines, "**Q1:** Ontbreekt (verwacht: 30) ❌")
          }
          
          if (results$q3$exists && results$q3$correct) {
            feedback_lines <- c(feedback_lines, "**Q3:** 75% positie = 15,75ste waarde → 36 ✅")
          } else if (results$q3$exists) {
            feedback_lines <- c(feedback_lines, paste0("**Q3:** ", results$q3$value, " (verwacht: 36) ❌"))
          } else {
            feedback_lines <- c(feedback_lines, "**Q3:** Ontbreekt (verwacht: 36) ❌")
          }
          
          if (results$ika$exists && results$ika$correct) {
            feedback_lines <- c(feedback_lines, "**IKA:** Q3 - Q1 = 36 - 30 = 6 ✅")
          } else if (results$ika$exists) {
            feedback_lines <- c(feedback_lines, paste0("**IKA:** ", results$ika$value, " (verwacht: 6) ❌"))
          } else {
            feedback_lines <- c(feedback_lines, "**IKA:** Ontbreekt (verwacht: 6) ❌")
          }
          
          if (results$meest_relevante_centraliteit$exists && results$meest_relevante_centraliteit$correct) {
            feedback_lines <- c(feedback_lines, "**BESTE CENTRALITEIT:** Gemiddelde (gebruikt alle informatie) ✅")
          } else if (results$meest_relevante_centraliteit$exists) {
            feedback_lines <- c(feedback_lines, paste0("**BESTE CENTRALITEIT:** ", results$meest_relevante_centraliteit$value, " (verwacht: gemiddelde) ❌"))
          } else {
            feedback_lines <- c(feedback_lines, "**BESTE CENTRALITEIT:** Ontbreekt (verwacht: gemiddelde) ❌")
          }
          
          if (results$meest_relevante_spreiding$exists && results$meest_relevante_spreiding$correct) {
            feedback_lines <- c(feedback_lines, "**BESTE SPREIDING:** Interkwartielafstand (robuust) ✅")
          } else if (results$meest_relevante_spreiding$exists) {
            feedback_lines <- c(feedback_lines, paste0("**BESTE SPREIDING:** ", results$meest_relevante_spreiding$value, " (verwacht: interkwartielafstand) ❌"))
          } else {
            feedback_lines <- c(feedback_lines, "**BESTE SPREIDING:** Ontbreekt (verwacht: interkwartielafstand) ❌")
          }
          
          if (results$reden$exists && results$reden$correct) {
            feedback_lines <- c(feedback_lines, "**REDEN:** Gebruikt alle informatie (niet alleen rang of uitschieters) ✅")
          } else if (results$reden$exists) {
            feedback_lines <- c(feedback_lines, paste0("**REDEN:** ", results$reden$value, " (verwacht: gebruikt alle informatie) ❌"))
          } else {
            feedback_lines <- c(feedback_lines, "**REDEN:** Ontbreekt (verwacht: gebruikt alle informatie) ❌")
          }
          
          # ----------------------
          # ADVANCED CALCULATIONS
          # ----------------------
          
          if (results$afwijkingen$exists && results$afwijkingen$correct) {
            feedback_lines <- c(feedback_lines, "**AFWIJKINGEN:** Alle 20 waarden - 33.55 ✅")
          } else if (results$afwijkingen$exists) {
            feedback_lines <- c(feedback_lines, "**AFWIJKINGEN:** Verkeerde vector (verwacht: 20 afwijkingen) ❌")
          } else {
            feedback_lines <- c(feedback_lines, "**AFWIJKINGEN:** Ontbreekt (verwacht: 20 afwijkingen) ❌")
          }
          
          if (results$gekwadrateerde_afwijkingen$exists && results$gekwadrateerde_afwijkingen$correct) {
            feedback_lines <- c(feedback_lines, "**GEKWADRATEERDE AFWIJKINGEN:** (Elke afwijking)² ✅")
          } else if (results$gekwadrateerde_afwijkingen$exists) {
            feedback_lines <- c(feedback_lines, "**GEKWADRATEERDE AFWIJKINGEN:** Verkeerde vector (verwacht: 20 gekwadrateerde waarden) ❌")
          } else {
            feedback_lines <- c(feedback_lines, "**GEKWADRATEERDE AFWIJKINGEN:** Ontbreekt (verwacht: 20 gekwadrateerde waarden) ❌")
          }
          
          if (results$sum_of_squares$exists && results$sum_of_squares$correct) {
            feedback_lines <- c(feedback_lines, "**SOM GEKWADRATEERDE AFWIJKINGEN:** Σ(Xi - X̄)² = 528.95 ✅")
          } else if (results$sum_of_squares$exists) {
            feedback_lines <- c(feedback_lines, paste0("**SOM GEKWADRATEERDE AFWIJKINGEN:** ", results$sum_of_squares$value, " (verwacht: 528.95) ❌"))
          } else {
            feedback_lines <- c(feedback_lines, "**SOM GEKWADRATEERDE AFWIJKINGEN:** Ontbreekt (verwacht: 528.95) ❌")
          }
          
          if (results$variantie$exists && results$variantie$correct) {
            feedback_lines <- c(feedback_lines, "**VARIANTIE:** Sum of squares ÷ (n-1) = 528.95 ÷ 19 = 27.8295 ✅")
          } else if (results$variantie$exists) {
            feedback_lines <- c(feedback_lines, paste0("**VARIANTIE:** ", results$variantie$value, " (verwacht: 27.8295) ❌"))
          } else {
            feedback_lines <- c(feedback_lines, "**VARIANTIE:** Ontbreekt (verwacht: 27.8295) ❌")
          }
          
          if (results$standaardafwijking$exists && results$standaardafwijking$correct) {
            feedback_lines <- c(feedback_lines, "**STANDAARDAFWIJKING:** √variantie = √27.8295 = 5.2763 ✅")
          } else if (results$standaardafwijking$exists) {
            feedback_lines <- c(feedback_lines, paste0("**STANDAARDAFWIJKING:** ", results$standaardafwijking$value, " (verwacht: 5.2763) ❌"))
          } else {
            feedback_lines <- c(feedback_lines, "**STANDAARDAFWIJKING:** Ontbreekt (verwacht: 5.2763) ❌")
          }
          
          if (results$variatiecoefficient$exists && results$variatiecoefficient$correct) {
            feedback_lines <- c(feedback_lines, "**VARIATIECOËFFICIËNT:** SD ÷ gemiddelde = 5.2763 ÷ 33.55 = 0.1573 ✅")
          } else if (results$variatiecoefficient$exists) {
            feedback_lines <- c(feedback_lines, paste0("**VARIATIECOËFFICIËNT:** ", results$variatiecoefficient$value, " (verwacht: 0.1573) ❌"))
          } else {
            feedback_lines <- c(feedback_lines, "**VARIATIECOËFFICIËNT:** Ontbreekt (verwacht: 0.1573) ❌")
          }
          
          feedback_lines <- c(
            feedback_lines,
            "",
            paste0("**", correct_count, " van ", total_questions, " juist**"),
            "",
            "🔍 **BELANGRIJKE REGELS VOOR INTERVAL DATA:**",
            "• **Frequenties**: Tel exact hoe vaak elke waarde voorkomt",
            "• **Percentages**: (frequentie ÷ totaal) × 100", 
            "• **Gemiddelde is TOEGESTAAN** bij interval data (gebruikt alle info)",
            "• **Data**: 24, 36, 35, 28, 24, 28, 24, 36, 32, 36, 40, 38, 36, 34, 40, 36, 32, 36, 40, 36",
            "• **N = 20 personen**, som = 671, gemiddelde = 33.55"
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
