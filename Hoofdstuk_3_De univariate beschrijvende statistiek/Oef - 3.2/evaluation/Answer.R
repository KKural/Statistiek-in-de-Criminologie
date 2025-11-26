context({
  testcase(
    "Controle van ordinale data-analyse stappen",
    {
      testEqual(
        "Controleer je stap-voor-stap antwoorden",
        function(env) {
          # Use the provided environment (env) instead of globalenv()
          results <- list()
          
          # Check each variable and store detailed results
          
          # Frequency table calculations
          # Cumulatieve absolute frequenties
          if (exists("cum_abs", envir = env)) {
            current_val <- get("cum_abs", envir = env)
            expected_vec <- c(33, 117, 219, 282, 330)
            ok <- is.numeric(current_val) &&
                  length(current_val) == length(expected_vec) &&
                  all(current_val == expected_vec)
          
            results$cum_abs <- list(
              exists  = TRUE,
              value   = current_val,
              correct = ok,
              expected = expected_vec
            )
          } else {
            results$cum_abs <- list(exists = FALSE, value = NA,
                                    correct = FALSE,
                                    expected = c(33,117,219,282,330))
          }
          
          # Relatieve frequenties
          if (exists("rel_freq", envir = env)) {
            current_val <- get("rel_freq", envir = env)
            expected_vec <- c(0.10, 0.2545, 0.3091, 0.1909, 0.1455)
            ok <- is.numeric(current_val) &&
                  length(current_val) == length(expected_vec) &&
                  all(abs(current_val - expected_vec) < 0.0005)
          
            results$rel_freq <- list(
              exists  = TRUE,
              value   = current_val,
              correct = ok,
              expected = expected_vec
            )
          } else {
            results$rel_freq <- list(exists = FALSE, value = NA,
                                     correct = FALSE,
                                     expected = c(0.10,0.2545,0.3091,0.1909,0.1455))
          }
          
          # Cumulatieve relatieve frequenties
          if (exists("cum_rel", envir = env)) {
            current_val <- get("cum_rel", envir = env)
            expected_vec <- c(0.10, 0.3545, 0.6636, 0.8545, 1.0000)
            ok <- is.numeric(current_val) &&
                  length(current_val) == length(expected_vec) &&
                  all(abs(current_val - expected_vec) < 0.0005)
          
            results$cum_rel <- list(
              exists  = TRUE,
              value   = current_val,
              correct = ok,
              expected = expected_vec
            )
          } else {
            results$cum_rel <- list(exists = FALSE, value = NA,
                                    correct = FALSE,
                                    expected = c(0.10,0.3545,0.6636,0.8545,1.0000))
          }
          
          # Meetniveau
          if(exists("meetniveau", envir = env)) {
            current_val <- as.character(get("meetniveau", envir = env))
            results$meetniveau <- list(
              exists = TRUE,
              value = current_val,
              correct = tolower(trimws(current_val)) == "ordinaal",
              expected = "ordinaal"
            )
          } else {
            results$meetniveau <- list(exists = FALSE, value = NA, correct = FALSE, expected = "ordinaal")
          }
          
          # Modus
          if(exists("modus", envir = env)) {
            current_val <- as.character(get("modus", envir = env))
            results$modus <- list(
              exists = TRUE,
              value = current_val,
              correct = tolower(trimws(current_val)) == "noch tevreden, noch ontevreden",
              expected = "noch tevreden, noch ontevreden"
            )
          } else {
            results$modus <- list(exists = FALSE, value = NA, correct = FALSE, expected = "noch tevreden, noch ontevreden")
          }
          
          # Mediaan
          if(exists("mediaan", envir = env)) {
            current_val <- as.character(get("mediaan", envir = env))
            results$mediaan <- list(
              exists = TRUE,
              value = current_val,
              correct = tolower(trimws(current_val)) == "noch tevreden, noch ontevreden",
              expected = "noch tevreden, noch ontevreden"
            )
          } else {
            results$mediaan <- list(exists = FALSE, value = NA, correct = FALSE, expected = "noch tevreden, noch ontevreden")
          }
          
          # Meest relevante centraliteit
          if(exists("meest_relevante_centraliteit", envir = env)) {
            current_val <- as.character(get("meest_relevante_centraliteit", envir = env))
            results$meest_relevante <- list(
              exists = TRUE,
              value = current_val,
              correct = tolower(trimws(current_val)) == "mediaan",
              expected = "mediaan"
            )
          } else {
            results$meest_relevante <- list(exists = FALSE, value = NA, correct = FALSE, expected = "mediaan")
          }
          
          # Q1
          if(exists("q1", envir = env)) {
            current_val <- as.character(get("q1", envir = env))
            results$q1 <- list(
              exists = TRUE,
              value = current_val,
              correct = tolower(trimws(current_val)) == "ontevreden",
              expected = "ontevreden"
            )
          } else {
            results$q1 <- list(exists = FALSE, value = NA, correct = FALSE, expected = "ontevreden")
          }
          
          # Q3
          if(exists("q3", envir = env)) {
            current_val <- as.character(get("q3", envir = env))
            results$q3 <- list(
              exists = TRUE,
              value = current_val,
              correct = tolower(trimws(current_val)) == "tevreden",
              expected = "tevreden"
            )
          } else {
            results$q3 <- list(exists = FALSE, value = NA, correct = FALSE, expected = "tevreden")
          }
          
          # Variatiebreedte
          if(exists("variatiebreedte", envir = env)) {
            current_val <- as.character(get("variatiebreedte", envir = env))
            var_val <- tolower(trimws(current_val))
            results$variatiebreedte <- list(
              exists = TRUE,
              value = current_val,
              correct = var_val %in% c("zeer ontevreden tot zeer tevreden", "van zeer ontevreden tot zeer tevreden"),
              expected = "zeer ontevreden tot zeer tevreden"
            )
          } else {
            results$variatiebreedte <- list(exists = FALSE, value = NA, correct = FALSE, expected = "zeer ontevreden tot zeer tevreden")
          }
          
          # Totaal N (step 3)
          if(exists("totaal_n", envir = env)) {
            current_val <- get("totaal_n", envir = env)
            results$totaal_n <- list(
              exists = TRUE,
              value = current_val,
              correct = as.numeric(current_val) == 330,
              expected = 330
            )
          } else {
            results$totaal_n <- list(exists = FALSE, value = NA, correct = FALSE, expected = 330)
          }
          
          # IKA
          if(exists("ika", envir = env)) {
            current_val <- as.character(get("ika", envir = env))
            ika_val <- tolower(trimws(current_val))
            results$ika <- list(
              exists = TRUE,
              value = current_val,
              correct = ika_val %in% c("ontevreden tot tevreden", "van ontevreden tot tevreden"),
              expected = "ontevreden tot tevreden"
            )
          } else {
            results$ika <- list(exists = FALSE, value = NA, correct = FALSE, expected = "ontevreden tot tevreden")
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
          
          # Generate feedback for each question
          # Frequency table feedback
          if (results$cum_abs$exists && results$cum_abs$correct) {
            feedback_lines <- c(feedback_lines,
              "**FREQUENTIETABEL - CUMULATIEVE ABS.:** Gebruik cumsum(abs_freq) ✅")
          } else {
            feedback_lines <- c(feedback_lines,
              "**FREQUENTIETABEL - CUMULATIEVE ABS.:** Verwacht c(33, 117, 219, 282, 330) ❌")
          }
          
          if (results$rel_freq$exists && results$rel_freq$correct) {
            feedback_lines <- c(feedback_lines,
              "**FREQUENTIETABEL - RELATIEVE FREQ.:** abs_freq / 330 ✅")
          } else {
            feedback_lines <- c(feedback_lines,
              "**FREQUENTIETABEL - RELATIEVE FREQ.:** Controleer abs_freq / totaal N ❌")
          }
          
          if (results$cum_rel$exists && results$cum_rel$correct) {
            feedback_lines <- c(feedback_lines,
              "**FREQUENTIETABEL - CUMULATIEVE REL.:** cumsum(rel_freq) ✅")
          } else {
            feedback_lines <- c(feedback_lines,
              "**FREQUENTIETABEL - CUMULATIEVE REL.:** Verwacht c(0.10, 0.3545, 0.6636, 0.8545, 1.00) ❌")
          }
          
          if(results$meetniveau$exists && results$meetniveau$correct) {
            feedback_lines <- c(feedback_lines, "**STAP 1 - MEETNIVEAU:** Ordinaal (rangorde maar geen gelijke afstanden) ✅")
          } else {
            feedback_lines <- c(feedback_lines, "**STAP 1 - MEETNIVEAU:** Expected 'ordinaal' ❌")
          }
          
          if(results$totaal_n$exists && results$totaal_n$correct) {
            feedback_lines <- c(feedback_lines, "**STAP 3 - TOTAAL N:** 33+84+102+63+48 = 330 ✅")
          } else {
            feedback_lines <- c(feedback_lines, "**STAP 3 - TOTAAL N:** Expected 330 ❌")
          }
          
          if(results$modus$exists && results$modus$correct) {
            feedback_lines <- c(feedback_lines, "**STAP 4.1 - MODUS:** Categorie met hoogste frequentie (102) ✅")
          } else {
            feedback_lines <- c(feedback_lines, "**STAP 4.1 - MODUS:** Expected 'noch tevreden, noch ontevreden' ❌")
          }
          
          if(results$mediaan$exists && results$mediaan$correct) {
            feedback_lines <- c(feedback_lines, "**STAP 4.2 - MEDIAAN:** 165,5ste waarneming (N/2 = 330/2 = 165) ✅")
          } else {
            feedback_lines <- c(feedback_lines, "**STAP 4.2 - MEDIAAN:** Expected 'noch tevreden, noch ontevreden' ❌")
          }
          
          if(results$meest_relevante$exists && results$meest_relevante$correct) {
            feedback_lines <- c(feedback_lines, "**STAP 4.3 - MEEST RELEVANT:** Mediaan geeft meer informatie dan modus ✅")
          } else {
            feedback_lines <- c(feedback_lines, "**STAP 4.3 - MEEST RELEVANT:** Expected 'mediaan' ❌")
          }
          
          if(results$q1$exists && results$q1$correct) {
            feedback_lines <- c(feedback_lines, "**STAP 5.1 - Q1:** 82,5ste waarneming (25% van 330 = 82,5) ✅")
          } else {
            feedback_lines <- c(feedback_lines, "**STAP 5.1 - Q1:** Expected 'ontevreden' ❌")
          }
          
          if(results$q3$exists && results$q3$correct) {
            feedback_lines <- c(feedback_lines, "**STAP 5.1 - Q3:** 247,5ste waarneming (75% van 330 = 247,5) ✅")
          } else {
            feedback_lines <- c(feedback_lines, "**STAP 5.1 - Q3:** Expected 'tevreden' ❌")
          }
          
          if(results$variatiebreedte$exists && results$variatiebreedte$correct) {
            feedback_lines <- c(feedback_lines, "**STAP 5.2 - VARIATIEBREEDTE:** Van laagste tot hoogste categorie ✅")
          } else {
            feedback_lines <- c(feedback_lines, "**STAP 5.2 - VARIATIEBREEDTE:** Expected 'zeer ontevreden tot zeer tevreden' ❌")
          }
          
          if(results$ika$exists && results$ika$correct) {
            feedback_lines <- c(feedback_lines, "**STAP 5.3 - IKA:** Bereik Q1 tot Q3 (middelste 50% van data) ✅")
          } else {
            feedback_lines <- c(feedback_lines, "**STAP 5.3 - IKA:** Expected 'ontevreden tot tevreden' ❌")
          }
          
          if (correct_count == total_questions) {
            feedback_lines <- c(feedback_lines, "", "✅ **Alle stappen correct beantwoord!**")
            feedback_lines <- c(feedback_lines, "**Uitstekend!** Je beheerst ordinale data-analyse perfect.")
          }
          
          feedback_lines <- c(feedback_lines, "", 
                             paste("**SCORE:**", correct_count, "van", total_questions, "correct! 🎉"),
                             "",
                             "**📚 STAP-VOOR-STAP SAMENVATTING:**",
                             "• STAP 1: Meetniveau bepalen",
                             "• STAP 3: Totaal N berekenen (som alle frequenties)", 
                             "• STAP 4: Centraliteit (modus, mediaan, meest relevant)",
                             "• STAP 5: Spreiding (Q1, Q3, variatiebreedte, IKA)")
          
          # show markdown feedback
          get_reporter()$add_message(paste(feedback_lines, collapse = "\n\n"),
                                     type = "markdown")
          
          # final result
          generated == expected
        }
      )
    }
  )
})