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
          # INDIVIDUELE BEREKENINGEN
          # -----------------------------
          
          # 1. Cumulatieve absolute frequenties
          cum_abs_vars <- list(
            "cumulatieve_absolute_frequenties_zeer_ontevreden"              = 33,
            "cumulatieve_absolute_frequenties_ontevreden"                   = 117,
            "cumulatieve_absolute_frequenties_noch_tevreden_noch_ontevreden" = 219,
            "cumulatieve_absolute_frequenties_tevreden"                     = 282,
            "cumulatieve_absolute_frequenties_zeer_tevreden"                = 330
          )
          
          for (var_name in names(cum_abs_vars)) {
            if (exists(var_name, envir = env)) {
              current_val  <- as.numeric(get(var_name, envir = env))
              expected_val <- cum_abs_vars[[var_name]]
              
              results[[var_name]] <- list(
                exists   = TRUE,
                value    = current_val,
                correct  = abs(current_val - expected_val) < 0.5,
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
          
          # 2. Relatieve frequenties
          rel_freq_vars <- list(
            "relatieve_frequenties_zeer_ontevreden"              = 0.1000,
            "relatieve_frequenties_ontevreden"                   = 0.2545,
            "relatieve_frequenties_noch_tevreden_noch_ontevreden" = 0.3091,
            "relatieve_frequenties_tevreden"                     = 0.1909,
            "relatieve_frequenties_zeer_tevreden"                = 0.1455
          )
          
          for (var_name in names(rel_freq_vars)) {
            if (exists(var_name, envir = env)) {
              current_val  <- as.numeric(get(var_name, envir = env))
              expected_val <- rel_freq_vars[[var_name]]
              
              results[[var_name]] <- list(
                exists   = TRUE,
                value    = current_val,
                correct  = abs(current_val - expected_val) < 0.001,
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
          
          # 3. Cumulatieve relatieve frequenties
          cum_rel_vars <- list(
            "cumulatieve_relatieve_frequenties_zeer_ontevreden"              = 0.1000,
            "cumulatieve_relatieve_frequenties_ontevreden"                   = 0.3545,
            "cumulatieve_relatieve_frequenties_noch_tevreden_noch_ontevreden" = 0.6636,
            "cumulatieve_relatieve_frequenties_tevreden"                     = 0.8545,
            "cumulatieve_relatieve_frequenties_zeer_tevreden"                = 1.0000
          )
          
          for (var_name in names(cum_rel_vars)) {
            if (exists(var_name, envir = env)) {
              current_val  <- as.numeric(get(var_name, envir = env))
              expected_val <- cum_rel_vars[[var_name]]
              
              results[[var_name]] <- list(
                exists   = TRUE,
                value    = current_val,
                correct  = abs(current_val - expected_val) < 0.001,
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
          
          # 4. Meetniveau
          if (exists("meetniveau", envir = env)) {
            current_val <- as.character(get("meetniveau", envir = env))
            results$meetniveau <- list(
              exists   = TRUE,
              value    = current_val,
              correct  = tolower(trimws(current_val)) == "ordinaal",
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
          
          # 5. Totaal N
          if (exists("totaal_n", envir = env)) {
            current_val <- as.numeric(get("totaal_n", envir = env))
            results$totaal_n <- list(
              exists   = TRUE,
              value    = current_val,
              correct  = current_val == 330,
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
          
          # 6. Modus
          if (exists("modus", envir = env)) {
            current_val <- as.character(get("modus", envir = env))
            results$modus <- list(
              exists   = TRUE,
              value    = current_val,
              correct  = tolower(trimws(current_val)) == "noch tevreden, noch ontevreden",
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
          
          # 7. Mediaan
          if (exists("mediaan", envir = env)) {
            current_val <- as.character(get("mediaan", envir = env))
            results$mediaan <- list(
              exists   = TRUE,
              value    = current_val,
              correct  = tolower(trimws(current_val)) == "noch tevreden, noch ontevreden",
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
          
          # 8. Meest relevante centraliteitsmaat
          if (exists("meest_relevante_centraliteit", envir = env)) {
            current_val <- as.character(get("meest_relevante_centraliteit", envir = env))
            results$meest_relevante_centraliteit <- list(
              exists   = TRUE,
              value    = current_val,
              correct  = tolower(trimws(current_val)) == "mediaan",
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
          
          # 9. Q1
          if (exists("q1", envir = env)) {
            current_val <- as.character(get("q1", envir = env))
            results$q1 <- list(
              exists   = TRUE,
              value    = current_val,
              correct  = tolower(trimws(current_val)) == "ontevreden",
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
          
          # 10. Q3
          if (exists("q3", envir = env)) {
            current_val <- as.character(get("q3", envir = env))
            results$q3 <- list(
              exists   = TRUE,
              value    = current_val,
              correct  = tolower(trimws(current_val)) == "tevreden",
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
          
          # 11. Variatiebreedte (ordinaal)
          if (exists("variatiebreedte", envir = env)) {
            current_val <- as.character(get("variatiebreedte", envir = env))
            results$variatiebreedte <- list(
              exists   = TRUE,
              value    = current_val,
              correct  = tolower(trimws(current_val)) %in% c("zeer ontevreden tot zeer tevreden", "5 categorieën"),
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
          
          # 12. IKA (ordinaal)
          if (exists("ika", envir = env)) {
            current_val <- as.character(get("ika", envir = env))
            results$ika <- list(
              exists   = TRUE,
              value    = current_val,
              correct  = tolower(trimws(current_val)) %in% c("ontevreden tot tevreden", "3 categorieën"),
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
          
          # -----------------------------
          # OPSLAAN RESULTATEN VOOR COMPARATOR
          # -----------------------------
          assign("detailed_results", results, envir = globalenv())
          
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
          # STAP 1.1 FEEDBACK - CUMULATIEVE ABSOLUTE FREQUENTIES
          # ----------------------
          cum_abs_vars <- c("cumulatieve_absolute_frequenties_zeer_ontevreden", 
                           "cumulatieve_absolute_frequenties_ontevreden",
                           "cumulatieve_absolute_frequenties_noch_tevreden_noch_ontevreden",
                           "cumulatieve_absolute_frequenties_tevreden",
                           "cumulatieve_absolute_frequenties_zeer_tevreden")
          
          cum_abs_all_correct <- TRUE
          for (var in cum_abs_vars) {
            if (var %in% names(results) && !results[[var]]$correct) {
              cum_abs_all_correct <- FALSE
              student_val <- if (results[[var]]$exists) as.numeric(results[[var]]$value) else "Ontbreekt"
              expected_val <- results[[var]]$expected
              cat_name <- sub("^cumulatieve_absolute_frequenties_", "", var)
              cat_display <- switch(cat_name,
                "zeer_ontevreden" = "zeer ontevreden",
                "ontevreden" = "ontevreden",
                "noch_tevreden_noch_ontevreden" = "noch tevreden, noch ontevreden",
                "tevreden" = "tevreden",
                "zeer_tevreden" = "zeer tevreden",
                cat_name
              )
              
              if (results[[var]]$exists) {
                feedback_parts <- c(feedback_parts, paste0("  • **", cat_display, ":** Je gaf ", student_val, ", maar juiste antwoord is **", expected_val, "**"))
              } else {
                feedback_parts <- c(feedback_parts, paste0("  • **", cat_display, ":** Variabele ontbreekt ❌"))
              }
            }
          }
          if (cum_abs_all_correct) {
            feedback_parts <- c(feedback_parts, "**✅ STAP 1.1 - CUMULATIEVE ABSOLUTE FREQUENTIES:** Allemaal correct!")
            feedback_parts <- c(feedback_parts, "• Waarden: 33, 117, 219, 282, 330")
          } else {
            feedback_parts <- c(feedback_parts, "**❌ STAP 1.1 - CUMULATIEVE ABSOLUTE FREQUENTIES:** Fouten gevonden")
          }
          feedback_parts <- c(feedback_parts, "")
          
          # ----------------------
          # STAP 1.2 FEEDBACK - RELATIEVE FREQUENTIES
          # ----------------------
          feedback_parts <- c(feedback_parts, "")
          rel_freq_vars <- c("relatieve_frequenties_zeer_ontevreden",
                            "relatieve_frequenties_ontevreden",
                            "relatieve_frequenties_noch_tevreden_noch_ontevreden",
                            "relatieve_frequenties_tevreden",
                            "relatieve_frequenties_zeer_tevreden")
          
          rel_freq_all_correct <- TRUE
          for (var in rel_freq_vars) {
            if (var %in% names(results) && !results[[var]]$correct) {
              rel_freq_all_correct <- FALSE
              student_val <- if (results[[var]]$exists) format(as.numeric(results[[var]]$value), digits=4) else "Ontbreekt"
              expected_val <- format(as.numeric(results[[var]]$expected), digits=4)
              cat_name <- sub("^relatieve_frequenties_", "", var)
              cat_display <- switch(cat_name,
                "zeer_ontevreden" = "zeer ontevreden",
                "ontevreden" = "ontevreden",
                "noch_tevreden_noch_ontevreden" = "noch tevreden, noch ontevreden",
                "tevreden" = "tevreden",
                "zeer_tevreden" = "zeer tevreden",
                cat_name
              )
              
              if (results[[var]]$exists) {
                feedback_parts <- c(feedback_parts, paste0("  • **", cat_display, ":** Je gaf ", student_val, ", maar juiste antwoord is **", expected_val, "**"))
              } else {
                feedback_parts <- c(feedback_parts, paste0("  • **", cat_display, ":** Variabele ontbreekt ❌"))
              }
            }
          }
          if (rel_freq_all_correct) {
            feedback_parts <- c(feedback_parts, "**✅ STAP 1.2 - RELATIEVE FREQUENTIES:** Allemaal correct!")
            feedback_parts <- c(feedback_parts, "• Waarden: 0.1000, 0.2545, 0.3091, 0.1909, 0.1455")
          } else {
            feedback_parts <- c(feedback_parts, "**❌ STAP 1.2 - RELATIEVE FREQUENTIES:** Fouten gevonden")
          }
          feedback_parts <- c(feedback_parts, "")
          
          # ----------------------
          # STAP 1.3 FEEDBACK - CUMULATIEVE RELATIEVE FREQUENTIES
          # ----------------------
          feedback_parts <- c(feedback_parts, "")
          cum_rel_vars <- c("cumulatieve_relatieve_frequenties_zeer_ontevreden",
                           "cumulatieve_relatieve_frequenties_ontevreden",
                           "cumulatieve_relatieve_frequenties_noch_tevreden_noch_ontevreden",
                           "cumulatieve_relatieve_frequenties_tevreden",
                           "cumulatieve_relatieve_frequenties_zeer_tevreden")
          
          cum_rel_all_correct <- TRUE
          for (var in cum_rel_vars) {
            if (var %in% names(results) && !results[[var]]$correct) {
              cum_rel_all_correct <- FALSE
              student_val <- if (results[[var]]$exists) format(as.numeric(results[[var]]$value), digits=4) else "Ontbreekt"
              expected_val <- format(as.numeric(results[[var]]$expected), digits=4)
              cat_name <- sub("^cumulatieve_relatieve_frequenties_", "", var)
              cat_display <- switch(cat_name,
                "zeer_ontevreden" = "zeer ontevreden",
                "ontevreden" = "ontevreden",
                "noch_tevreden_noch_ontevreden" = "noch tevreden, noch ontevreden",
                "tevreden" = "tevreden",
                "zeer_tevreden" = "zeer tevreden",
                cat_name
              )
              
              if (results[[var]]$exists) {
                feedback_parts <- c(feedback_parts, paste0("  • **", cat_display, ":** Je gaf ", student_val, ", maar juiste antwoord is **", expected_val, "**"))
              } else {
                feedback_parts <- c(feedback_parts, paste0("  • **", cat_display, ":** Variabele ontbreekt ❌"))
              }
            }
          }
          if (cum_rel_all_correct) {
            feedback_parts <- c(feedback_parts, "**✅ STAP 1.3 - CUMULATIEVE RELATIEVE FREQUENTIES:** Allemaal correct!")
            feedback_parts <- c(feedback_parts, "• Waarden: 0.1000, 0.3545, 0.6636, 0.8545, 1.0000")
          } else {
            feedback_parts <- c(feedback_parts, "**❌ STAP 1.3 - CUMULATIEVE RELATIEVE FREQUENTIES:** Fouten gevonden")
          }
          
          if (generated != expected) {
            feedback_parts <- c(feedback_parts, "")
            feedback_parts <- c(feedback_parts, "📚 **Uitleg van gemaakte fouten:**")
            feedback_parts <- c(feedback_parts, "")
            feedback_parts <- c(feedback_parts, "**STAP 2 - OVERIGE VRAGEN:**")
            
            # Helper function for all variables
            make_label_with_explanation <- function(var_name, expected_val) {
              # Meetniveau
              if (var_name == "meetniveau") {
                return("**Meetniveau** (tevredenheid heeft alleen rangorde: zeer ontevreden ... zeer tevreden)")
              }
              
              # Totaal N
              if (var_name == "totaal_n") {
                return("**Totaal aantal respondenten (N)**")
              }
              
              # Modus
              if (var_name == "modus") {
                return("**Modus** (categorie die het vaakst voorkomt: noch tevreden, noch ontevreden)")
              }
              
              # Mediaan
              if (var_name == "mediaan") {
                return("**Mediaan** (middelste categorie bij rangorde: noch tevreden, noch ontevreden)")
              }
              
              # Meest relevante centraliteitsmaat
              if (var_name == "meest_relevante_centraliteit") {
                return("**Meest relevante centraliteitsmaat** (voor ordinale data: mediaan)")
              }
              
              # Q1 and Q3
              if (var_name == "q1") {
                return("**Q1 (eerste kwartiel)** (25e percentiel categorie)")
              }
              if (var_name == "q3") {
                return("**Q3 (derde kwartiel)** (75e percentiel categorie)")
              }
              
              # Variatiebreedte
              if (var_name == "variatiebreedte") {
                return("**Variatiebreedte** (bereik: van zeer ontevreden tot zeer tevreden)")
              }
              
              # IKA
              if (var_name == "ika") {
                return("**IKA (interkwartielafstand)** (bereik middelste 50%: van Q1 tot Q3)")
              }
              
              return(paste0("**", var_name, "**"))
            }
            
            # Only show filled-in but wrong answers (like 3.3 does)
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
            "📊 **BELANGRIJKE REGELS VOOR ORDINALE DATA:**",
            "• **Meetniveau:** ordinaal (heeft rangorde, geen gelijke afstanden)",
            "• **Modus & Mediaan:** beide geschikt voor ordinale data",
            "• **Gemiddelde:** NIET geschikt voor ordinale data",
            "• **Q1 & Q3:** bepaal via cumulatieve percentages",
            "• **IKA:** bereik van Q1 tot Q3 (middelste 50% van data)"
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
