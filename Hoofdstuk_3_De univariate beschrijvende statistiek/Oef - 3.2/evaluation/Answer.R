context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          results <- list()
          
          # Individual cumulatieve absolute frequenties
          cum_abs_vars <- list(
            "cumulatieve_absolute_frequenties_zeer_ontevreden" = 33,
            "cumulatieve_absolute_frequenties_ontevreden" = 117,
            "cumulatieve_absolute_frequenties_noch_tevreden_noch_ontevreden" = 219,
            "cumulatieve_absolute_frequenties_tevreden" = 282,
            "cumulatieve_absolute_frequenties_zeer_tevreden" = 330
          )
          
          for (var_name in names(cum_abs_vars)) {
            if (exists(var_name, envir = env)) {
              current_val <- as.numeric(get(var_name, envir = env))
              expected_val <- cum_abs_vars[[var_name]]
              
              results[[var_name]] <- list(
                exists  = TRUE,
                value   = current_val,
                correct = abs(current_val - expected_val) < 0.5,
                expected = expected_val
              )
            } else {
              results[[var_name]] <- list(
                exists   = FALSE,
                value    = NA,
                correct  = FALSE,
                expected = cum_abs_vars[[var_name]]
              )
            }
          }

          # Individual relatieve frequenties
          rel_freq_vars <- list(
            "relatieve_frequenties_zeer_ontevreden" = 0.1000,
            "relatieve_frequenties_ontevreden" = 0.2545,
            "relatieve_frequenties_noch_tevreden_noch_ontevreden" = 0.3100,
            "relatieve_frequenties_tevreden" = 0.1909,
            "relatieve_frequenties_zeer_tevreden" = 0.1455
          )
          
          for (var_name in names(rel_freq_vars)) {
            if (exists(var_name, envir = env)) {
              current_val <- as.numeric(get(var_name, envir = env))
              expected_val <- rel_freq_vars[[var_name]]
              
              results[[var_name]] <- list(
                exists  = TRUE,
                value   = current_val,
                correct = abs(current_val - expected_val) < 0.0005,
                expected = expected_val
              )
            } else {
              results[[var_name]] <- list(
                exists   = FALSE,
                value    = NA,
                correct  = FALSE,
                expected = rel_freq_vars[[var_name]]
              )
            }
          }

          # Individual cumulatieve relatieve frequenties
          cum_rel_vars <- list(
            "cumulatieve_relatieve_frequenties_zeer_ontevreden" = 0.1000,
            "cumulatieve_relatieve_frequenties_ontevreden" = 0.3545,
            "cumulatieve_relatieve_frequenties_noch_tevreden_noch_ontevreden" = 0.6636,
            "cumulatieve_relatieve_frequenties_tevreden" = 0.8545,
            "cumulatieve_relatieve_frequenties_zeer_tevreden" = 1.0000
          )
          
          for (var_name in names(cum_rel_vars)) {
            if (exists(var_name, envir = env)) {
              current_val <- as.numeric(get(var_name, envir = env))
              expected_val <- cum_rel_vars[[var_name]]
              
              results[[var_name]] <- list(
                exists  = TRUE,
                value   = current_val,
                correct = abs(current_val - expected_val) < 0.0005,
                expected = expected_val
              )
            } else {
              results[[var_name]] <- list(
                exists   = FALSE,
                value    = NA,
                correct  = FALSE,
                expected = cum_rel_vars[[var_name]]
              )
            }
          }
          
          # Meetniveau
          if (exists("meetniveau", envir = env)) {
            current_val <- as.character(get("meetniveau", envir = env))
            results$meetniveau <- list(
              exists  = TRUE,
              value   = current_val,
              correct = tolower(trimws(current_val)) == "ordinaal",
              expected = "ordinaal"
            )
          } else {
            results$meetniveau <- list(
              exists   = FALSE,
              value    = NA,
              correct  = FALSE,
              expected = "ordinaal"
            )
          }
          
          # Totaal N
          if (exists("totaal_n", envir = env)) {
            current_val <- as.numeric(get("totaal_n", envir = env))
            results$totaal_n <- list(
              exists  = TRUE,
              value   = current_val,
              correct = current_val == 330,
              expected = 330
            )
          } else {
            results$totaal_n <- list(
              exists   = FALSE,
              value    = NA,
              correct  = FALSE,
              expected = 330
            )
          }
          
          # Modus
          if (exists("modus", envir = env)) {
            current_val <- as.character(get("modus", envir = env))
            results$modus <- list(
              exists  = TRUE,
              value   = current_val,
              correct = tolower(trimws(current_val)) == "noch tevreden, noch ontevreden",
              expected = "noch tevreden, noch ontevreden"
            )
          } else {
            results$modus <- list(
              exists   = FALSE,
              value    = NA,
              correct  = FALSE,
              expected = "noch tevreden, noch ontevreden"
            )
          }
          
          # Mediaan
          if (exists("mediaan", envir = env)) {
            current_val <- as.character(get("mediaan", envir = env))
            results$mediaan <- list(
              exists  = TRUE,
              value   = current_val,
              correct = tolower(trimws(current_val)) == "noch tevreden, noch ontevreden",
              expected = "noch tevreden, noch ontevreden"
            )
          } else {
            results$mediaan <- list(
              exists   = FALSE,
              value    = NA,
              correct  = FALSE,
              expected = "noch tevreden, noch ontevreden"
            )
          }
          
          # Meest relevante centraliteit
          if (exists("meest_relevante_centraliteit", envir = env)) {
            current_val <- as.character(get("meest_relevante_centraliteit", envir = env))
            results$meest_relevante_centraliteit <- list(
              exists  = TRUE,
              value   = current_val,
              correct = tolower(trimws(current_val)) == "mediaan",
              expected = "mediaan"
            )
          } else {
            results$meest_relevante_centraliteit <- list(
              exists   = FALSE,
              value    = NA,
              correct  = FALSE,
              expected = "mediaan"
            )
          }
          
          # Q1
          if (exists("q1", envir = env)) {
            current_val <- as.character(get("q1", envir = env))
            results$q1 <- list(
              exists  = TRUE,
              value   = current_val,
              correct = tolower(trimws(current_val)) == "ontevreden",
              expected = "ontevreden"
            )
          } else {
            results$q1 <- list(
              exists   = FALSE,
              value    = NA,
              correct  = FALSE,
              expected = "ontevreden"
            )
          }
          
          # Q3
          if (exists("q3", envir = env)) {
            current_val <- as.character(get("q3", envir = env))
            results$q3 <- list(
              exists  = TRUE,
              value   = current_val,
              correct = tolower(trimws(current_val)) == "tevreden",
              expected = "tevreden"
            )
          } else {
            results$q3 <- list(
              exists   = FALSE,
              value    = NA,
              correct  = FALSE,
              expected = "tevreden"
            )
          }
          
          # Variatiebreedte
          if (exists("variatiebreedte", envir = env)) {
            current_val <- as.character(get("variatiebreedte", envir = env))
            results$variatiebreedte <- list(
              exists  = TRUE,
              value   = current_val,
              correct = tolower(trimws(current_val)) %in% c("zeer ontevreden tot zeer tevreden", "5 categorieën"),
              expected = "zeer ontevreden tot zeer tevreden"
            )
          } else {
            results$variatiebreedte <- list(
              exists   = FALSE,
              value    = NA,
              correct  = FALSE,
              expected = "zeer ontevreden tot zeer tevreden"
            )
          }
          
          # IKA
          if (exists("ika", envir = env)) {
            current_val <- as.character(get("ika", envir = env))
            results$ika <- list(
              exists  = TRUE,
              value   = current_val,
              correct = tolower(trimws(current_val)) %in% c("ontevreden tot tevreden", "3 categorieën"),
              expected = "ontevreden tot tevreden"
            )
          } else {
            results$ika <- list(
              exists   = FALSE,
              value    = NA,
              correct  = FALSE,
              expected = "ontevreden tot tevreden"
            )
          }
          
          # Count correct answers
          all_correct <- all(sapply(results, function(x) x$correct))
          return(all_correct)
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          
          # Count correct answers
          all_vars <- c(
            names(cum_abs_vars), names(rel_freq_vars), names(cum_rel_vars),
            "meetniveau", "totaal_n", "modus", "mediaan", "meest_relevante_centraliteit", 
            "q1", "q3", "variatiebreedte", "ika"
          )
          
          correct_count <- 0
          for (var_name in all_vars) {
            if (exists(var_name, results) && results[[var_name]]$correct) {
              correct_count <- correct_count + 1
            }
          }
          total_questions <- length(all_vars)
          
          feedback_parts <- c()
          
          if (generated == expected) {
            feedback_parts <- c(feedback_parts, "✅ **Alle antwoorden correct! Goed gedaan.**")
          } else {
            feedback_parts <- c(feedback_parts, paste0("**Resultaat: ", correct_count, " van ", total_questions, " correct**"))
            feedback_parts <- c(feedback_parts, "", "📚 **Uitleg van veelgemaakte fouten:**")
            
            # MEETNIVEAU fout
            if (exists("meetniveau", results) && !results$meetniveau$correct && results$meetniveau$exists) {
              if (tolower(trimws(as.character(results$meetniveau$value))) %in% c("interval", "ratio", "numeriek")) {
                feedback_parts <- c(feedback_parts, "• **MEETNIVEAU FOUT:** Dit is ordinaal, niet interval! Ordinale data hebben rangorde maar geen gelijke afstanden.")
              }
            }
            
            # Add other specific error feedback as needed
          }
          
          get_reporter()$add_message(
            paste(feedback_parts, collapse = "\n\n"),
            type = "markdown"
          )
          
          generated == expected
        }
      )
    }
  )
})