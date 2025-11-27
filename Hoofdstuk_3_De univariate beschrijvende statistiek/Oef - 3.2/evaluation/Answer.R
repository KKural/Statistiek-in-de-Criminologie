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
          
          # Show summary of errors if any
          if (correct_count != total_questions) {
            feedback_parts <- c(feedback_parts, "⚠️ **SAMENVATTING: Enkele antwoorden zijn onjuist. Zie hieronder welke stappen fouten bevatten:**")
            feedback_parts <- c(feedback_parts, "")
          }
          
          # ----------------------
          # STAP 1.1 FEEDBACK - CUMULATIEVE ABSOLUTE FREQUENTIES
          # ----------------------
          cum_abs_vars <- c("cumulatieve_absolute_frequenties_zeer_ontevreden", 
                           "cumulatieve_absolute_frequenties_ontevreden",
                           "cumulatieve_absolute_frequenties_noch_tevreden_noch_ontevreden",
                           "cumulatieve_absolute_frequenties_tevreden",
                           "cumulatieve_absolute_frequenties_zeer_tevreden")
          
          expected_cum_abs <- c(33, 117, 219, 282, 330)
          cat_names_display <- c("zeer ontevreden", "ontevreden", "noch tevreden, noch ontevreden", "tevreden", "zeer tevreden")
          cum_abs_errors <- c()
          
          for (i in seq_along(cum_abs_vars)) {
            var <- cum_abs_vars[i]
            expected_val <- expected_cum_abs[i]
            cat_display <- cat_names_display[i]
            
            if (var %in% names(results)) {
              if (!results[[var]]$correct) {
                cum_abs_all_correct <- FALSE
                student_val <- if (results[[var]]$exists) as.numeric(results[[var]]$value) else "Ontbreekt"
                
                if (results[[var]]$exists) {
                  cum_abs_errors <- c(cum_abs_errors, paste0("  • **", cat_display, ":** je gaf ", student_val, ", juiste antwoord is **", expected_val, "**"))
                } else {
                  cum_abs_errors <- c(cum_abs_errors, paste0("  • **", cat_display, ":** Variabele ontbreekt ❌"))
                }
              }
            } else {
              cum_abs_all_correct <- FALSE
              cum_abs_errors <- c(cum_abs_errors, paste0("  • **", cat_display, ":** Variabele ontbreekt ❌"))
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
          rel_freq_vars <- c("relatieve_frequenties_zeer_ontevreden",
                            "relatieve_frequenties_ontevreden",
                            "relatieve_frequenties_noch_tevreden_noch_ontevreden",
                            "relatieve_frequenties_tevreden",
                            "relatieve_frequenties_zeer_tevreden")
          
          expected_rel_freq <- c(0.1000, 0.2545, 0.3091, 0.1909, 0.1455)
          
          rel_freq_all_correct <- TRUE
          rel_freq_errors <- c()
          
          for (i in seq_along(rel_freq_vars)) {
            var <- rel_freq_vars[i]
            expected_val <- expected_rel_freq[i]
            cat_display <- cat_names_display[i]
            
            if (var %in% names(results)) {
              if (!results[[var]]$correct) {
                rel_freq_all_correct <- FALSE
                student_val <- if (results[[var]]$exists) format(as.numeric(results[[var]]$value), digits=4) else "Ontbreekt"
                
                if (results[[var]]$exists) {
                  rel_freq_errors <- c(rel_freq_errors, paste0("  • **", cat_display, ":** je gaf ", student_val, ", juiste antwoord is **", format(expected_val, digits=4), "**"))
                } else {
                  rel_freq_errors <- c(rel_freq_errors, paste0("  • **", cat_display, ":** Variabele ontbreekt ❌"))
                }
              }
            } else {
              rel_freq_all_correct <- FALSE
              rel_freq_errors <- c(rel_freq_errors, paste0("  • **", cat_display, ":** Variabele ontbreekt ❌"))
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
          cum_rel_vars <- c("cumulatieve_relatieve_frequenties_zeer_ontevreden",
                           "cumulatieve_relatieve_frequenties_ontevreden",
                           "cumulatieve_relatieve_frequenties_noch_tevreden_noch_ontevreden",
                           "cumulatieve_relatieve_frequenties_tevreden",
                           "cumulatieve_relatieve_frequenties_zeer_tevreden")
          
          expected_cum_rel <- c(0.1000, 0.3545, 0.6636, 0.8545, 1.0000)
          
          cum_rel_all_correct <- TRUE
          cum_rel_errors <- c()
          
          for (i in seq_along(cum_rel_vars)) {
            var <- cum_rel_vars[i]
            expected_val <- expected_cum_rel[i]
            cat_display <- cat_names_display[i]
            
            if (var %in% names(results)) {
              if (!results[[var]]$correct) {
                cum_rel_all_correct <- FALSE
                student_val <- if (results[[var]]$exists) format(as.numeric(results[[var]]$value), digits=4) else "Ontbreekt"
                
                if (results[[var]]$exists) {
                  cum_rel_errors <- c(cum_rel_errors, paste0("  • **", cat_display, ":** je gaf ", student_val, ", juiste antwoord is **", format(expected_val, digits=4), "**"))
                } else {
                  cum_rel_errors <- c(cum_rel_errors, paste0("  • **", cat_display, ":** Variabele ontbreekt ❌"))
                }
              }
            } else {
              cum_rel_all_correct <- FALSE
              cum_rel_errors <- c(cum_rel_errors, paste0("  • **", cat_display, ":** Variabele ontbreekt ❌"))
            }
          }
          
          if (cum_rel_all_correct) {
            feedback_parts <- c(feedback_parts, "**✅ STAP 1.3 - CUMULATIEVE RELATIEVE FREQUENTIES:** Allemaal correct!")
            feedback_parts <- c(feedback_parts, "• Waarden: 0.1000, 0.3545, 0.6636, 0.8545, 1.0000")
          } else {
            feedback_parts <- c(feedback_parts, "**❌ STAP 1.3 - CUMULATIEVE RELATIEVE FREQUENTIES:** Fouten gevonden")
          }
          feedback_parts <- c(feedback_parts, "")
          
          # ----------------------
          # STAP 2 - OVERIGE VRAGEN
          # ----------------------
          stap2_all_correct <- TRUE
          stap2_errors <- c()
          
          # Meetniveau
          if (!results$meetniveau$correct) {
            stap2_all_correct <- FALSE
            student_val <- if (results$meetniveau$exists) results$meetniveau$value else "Ontbreekt"
            stap2_errors <- c(stap2_errors, paste0("  • **Meetniveau:** je gaf \"", student_val, "\", juiste antwoord is **\"ordinaal\"**"))
          }
          
          # Totaal N
          if (!results$totaal_n$correct) {
            stap2_all_correct <- FALSE
            student_val <- if (results$totaal_n$exists) results$totaal_n$value else "Ontbreekt"
            stap2_errors <- c(stap2_errors, paste0("  • **Totaal N:** je gaf ", student_val, ", juiste antwoord is **330**"))
          }
          
          # Modus
          if (!results$modus$correct) {
            stap2_all_correct <- FALSE
            student_val <- if (results$modus$exists) results$modus$value else "Ontbreekt"
            stap2_errors <- c(stap2_errors, paste0("  • **Modus:** je gaf \"", student_val, "\", juiste antwoord is **\"noch tevreden, noch ontevreden\"**"))
          }
          
          # Mediaan
          if (!results$mediaan$correct) {
            stap2_all_correct <- FALSE
            student_val <- if (results$mediaan$exists) results$mediaan$value else "Ontbreekt"
            stap2_errors <- c(stap2_errors, paste0("  • **Mediaan:** je gaf \"", student_val, "\", juiste antwoord is **\"noch tevreden, noch ontevreden\"**"))
          }
          
          # Meest relevante centraliteit
          if (!results$meest_relevante_centraliteit$correct) {
            stap2_all_correct <- FALSE
            student_val <- if (results$meest_relevante_centraliteit$exists) results$meest_relevante_centraliteit$value else "Ontbreekt"
            stap2_errors <- c(stap2_errors, paste0("  • **Meest relevante centraliteitsmaat:** je gaf \"", student_val, "\", juiste antwoord is **\"mediaan\"**"))
          }
          
          # Q1
          if (!results$q1$correct) {
            stap2_all_correct <- FALSE
            student_val <- if (results$q1$exists) results$q1$value else "Ontbreekt"
            stap2_errors <- c(stap2_errors, paste0("  • **Q1 (eerste kwartiel):** je gaf \"", student_val, "\", juiste antwoord is **\"ontevreden\"**"))
          }
          
          # Q3
          if (!results$q3$correct) {
            stap2_all_correct <- FALSE
            student_val <- if (results$q3$exists) results$q3$value else "Ontbreekt"
            stap2_errors <- c(stap2_errors, paste0("  • **Q3 (derde kwartiel):** je gaf \"", student_val, "\", juiste antwoord is **\"tevreden\"**"))
          }
          
          # Variatiebreedte
          if (!results$variatiebreedte$correct) {
            stap2_all_correct <- FALSE
            student_val <- if (results$variatiebreedte$exists) results$variatiebreedte$value else "Ontbreekt"
            stap2_errors <- c(stap2_errors, paste0("  • **Variatiebreedte:** je gaf \"", student_val, "\", juiste antwoord is **\"zeer ontevreden tot zeer tevreden\"**"))
          }
          
          # IKA
          if (!results$ika$correct) {
            stap2_all_correct <- FALSE
            student_val <- if (results$ika$exists) results$ika$value else "Ontbreekt"
            stap2_errors <- c(stap2_errors, paste0("  • **IKA (interkwartielafstand):** je gaf \"", student_val, "\", juiste antwoord is **\"ontevreden tot tevreden\"**"))
          }
          
          if (stap2_all_correct) {
            feedback_parts <- c(feedback_parts, "**✅ STAP 2 - OVERIGE VRAGEN:** Allemaal correct!")
          } else {
            feedback_parts <- c(feedback_parts, "**❌ STAP 2 - OVERIGE VRAGEN:** Fouten gevonden")
          }
          feedback_parts <- c(feedback_parts, "")
          
          # ----------------------
          # GEDETAILLEERDE UITLEG BIJ FOUTEN
          # ----------------------
          if (correct_count != total_questions) {
            feedback_parts <- c(feedback_parts, "")
            feedback_parts <- c(feedback_parts, "📚 **Uitleg van gemaakte fouten:**")
            feedback_parts <- c(feedback_parts, "")
            
            # Helper function for detailed explanations
            make_explanation <- function(var_name, expected_val, student_val) {
              # Cumulatieve absolute frequenties
              if (grepl("^cumulatieve_absolute_frequenties_", var_name)) {
                cat_name <- sub("^cumulatieve_absolute_frequenties_", "", var_name)
                cat_display <- switch(cat_name,
                  "zeer_ontevreden" = "zeer ontevreden",
                  "ontevreden" = "ontevreden",
                  "noch_tevreden_noch_ontevreden" = "noch tevreden, noch ontevreden",
                  "tevreden" = "tevreden",
                  "zeer_tevreden" = "zeer tevreden",
                  cat_name
                )
                
                # Show calculation based on which cumulative
                if (cat_name == "zeer_ontevreden") {
                  return(paste0("**Cumulatieve absolute frequentie - ", cat_display, ":** Tel alle frequenties van begin tot en met deze categorie op: 33 = **33**"))
                } else if (cat_name == "ontevreden") {
                  return(paste0("**Cumulatieve absolute frequentie - ", cat_display, ":** 33 + 84 = **117**"))
                } else if (cat_name == "noch_tevreden_noch_ontevreden") {
                  return(paste0("**Cumulatieve absolute frequentie - ", cat_display, ":** 33 + 84 + 102 = **219**"))
                } else if (cat_name == "tevreden") {
                  return(paste0("**Cumulatieve absolute frequentie - ", cat_display, ":** 33 + 84 + 102 + 63 = **282**"))
                } else if (cat_name == "zeer_tevreden") {
                  return(paste0("**Cumulatieve absolute frequentie - ", cat_display, ":** 33 + 84 + 102 + 63 + 48 = **330** (totaal)"))
                }
              }
              
              # Relatieve frequenties
              if (grepl("^relatieve_frequenties_", var_name)) {
                cat_name <- sub("^relatieve_frequenties_", "", var_name)
                cat_display <- switch(cat_name,
                  "zeer_ontevreden" = "zeer ontevreden (freq: 33)",
                  "ontevreden" = "ontevreden (freq: 84)",
                  "noch_tevreden_noch_ontevreden" = "noch tevreden, noch ontevreden (freq: 102)",
                  "tevreden" = "tevreden (freq: 63)",
                  "zeer_tevreden" = "zeer tevreden (freq: 48)",
                  cat_name
                )
                return(paste0("**Relatieve frequentie - ", cat_display, ":** frequentie ÷ totaal (330) = **", format(expected_val, digits=4), "**"))
              }
              
              # Cumulatieve relatieve frequenties
              if (grepl("^cumulatieve_relatieve_frequenties_", var_name)) {
                cat_name <- sub("^cumulatieve_relatieve_frequenties_", "", var_name)
                cat_display <- switch(cat_name,
                  "zeer_ontevreden" = "zeer ontevreden",
                  "ontevreden" = "ontevreden",
                  "noch_tevreden_noch_ontevreden" = "noch tevreden, noch ontevreden",
                  "tevreden" = "tevreden",
                  "zeer_tevreden" = "zeer tevreden",
                  cat_name
                )
                return(paste0("**Cumulatieve relatieve frequentie - ", cat_display, ":** som van relatieve frequenties tot en met deze categorie = **", format(expected_val, digits=4), "**"))
              }
              
              # Meetniveau
              if (var_name == "meetniveau") {
                return("**Meetniveau:** Tevredenheid heeft een natuurlijke volgorde (zeer ontevreden < ontevreden < noch < tevreden < zeer tevreden), dus het is **ordinaal**")
              }
              
              # Totaal N
              if (var_name == "totaal_n") {
                return("**Totaal N:** Tel alle frequenties bij elkaar: 33 + 84 + 102 + 63 + 48 = **330**")
              }
              
              # Modus
              if (var_name == "modus") {
                return("**Modus:** De meest voorkomende waarde. Frequenties: zeer ontevreden(33), ontevreden(84), noch(102), tevreden(63), zeer tevreden(48). Hoogste frequentie is 102, dus **noch tevreden, noch ontevreden**")
              }
              
              # Mediaan
              if (var_name == "mediaan") {
                return("**Mediaan:** De middelste waarde. Bij N=330 ligt de mediaan bij positie (330+1)/2 = 165.5. Kijk in cumulatieve frequenties: 117 < 165.5 < 219, dus het ligt in categorie **noch tevreden, noch ontevreden**")
              }
              
              # Meest relevante centraliteit
              if (var_name == "meest_relevante_centraliteit") {
                return("**Meest relevante centraliteitsmaat:** Voor ordinale data zijn gemiddelde niet geschikt (geen gelijke afstanden). Gebruik **mediaan** (of modus). Mediaan is beter dan modus omdat het alle waarden betrekt via cumulatieve frequenties")
              }
              
              # Q1
              if (var_name == "q1") {
                return("**Q1 (eerste kwartiel):** 25e percentiel. Positie: (330+1)/4 = 82.75. Kijk in cumulatieve frequenties: 33 < 82.75 < 117, dus Q1 = **ontevreden**")
              }
              
              # Q3
              if (var_name == "q3") {
                return("**Q3 (derde kwartiel):** 75e percentiel. Positie: 3×(330+1)/4 = 247.75. Kijk in cumulatieve frequenties: 219 < 247.75 < 282, dus Q3 = **tevreden**")
              }
              
              # Variatiebreedte
              if (var_name == "variatiebreedte") {
                return("**Variatiebreedte:** Het bereik van laagste tot hoogste categorie = **zeer ontevreden tot zeer tevreden** (alle 5 categorieën)")
              }
              
              # IKA
              if (var_name == "ika") {
                return("**IKA (interkwartielafstand):** Het bereik van Q1 tot Q3 = **ontevreden tot tevreden** (middelste 50% van de data)")
              }
              
              return(paste0("**", var_name, "**"))
            }
            
            # Toon alleen foute variabelen met uitleg
            wrong_vars <- names(results)[sapply(results, function(x) x$exists && !x$correct)]
            
            if (length(wrong_vars) > 0) {
              for (var in wrong_vars) {
                student_val <- results[[var]]$value
                expected_val <- results[[var]]$expected
                
                explanation <- make_explanation(var, expected_val, student_val)
                if (is.numeric(student_val)) {
                  student_str <- format(as.numeric(student_val), digits = 4)
                } else {
                  student_str <- as.character(student_val)
                }
                if (is.numeric(expected_val)) {
                  expected_str <- format(as.numeric(expected_val), digits = 4)
                } else {
                  expected_str <- as.character(expected_val)
                }
                
                feedback_parts <- c(feedback_parts, paste0("• ", explanation, " (je gaf: ", student_str, ")"))
              }
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
