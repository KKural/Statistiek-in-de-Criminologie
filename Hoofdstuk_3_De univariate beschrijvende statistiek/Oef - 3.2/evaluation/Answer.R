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
          
          # Absolute frequencies for calculation chain
          abs_freqs <- c(33, 84, 102, 63, 48)
          cumsum_expected <- c(33, 33+84, 33+84+102, 33+84+102+63, 330)
          
          cum_abs_all_correct <- TRUE
          cum_abs_errors <- list()
          
          for (idx in seq_along(cum_abs_vars)) {
            var <- cum_abs_vars[idx]
            if (var %in% names(results) && !results[[var]]$correct) {
              cum_abs_all_correct <- FALSE
              student_val <- if (results[[var]]$exists) as.numeric(results[[var]]$value) else NA
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
              
              # Build calculation chain for context
              if (idx == 1) {
                calc_chain <- "33"
              } else if (idx == 2) {
                calc_chain <- "33 + 84"
              } else if (idx == 3) {
                calc_chain <- "33 + 84 + 102"
              } else if (idx == 4) {
                calc_chain <- "33 + 84 + 102 + 63"
              } else {
                calc_chain <- "33 + 84 + 102 + 63 + 48"
              }
              
              if (!is.na(student_val)) {
                diff <- abs(student_val - expected_val)
                error_insight <- if (diff == abs_freqs[idx]) {
                  " (je gebruikte alleen de absolute frequentie, niet cumulatief!)"
                } else if (idx > 1 && diff == sum(abs_freqs[1:(idx-1)])) {
                  " (je vergat een categorie!)"
                } else {
                  ""
                }
                cum_abs_errors[[length(cum_abs_errors)+1]] <- list(
                  category = cat_display,
                  student = student_val,
                  expected = expected_val,
                  calculation = calc_chain,
                  insight = error_insight
                )
              } else {
                cum_abs_errors[[length(cum_abs_errors)+1]] <- list(
                  category = cat_display,
                  student = "Ontbreekt",
                  expected = expected_val,
                  calculation = calc_chain,
                  insight = ""
                )
              }
            }
          }
          
          if (cum_abs_all_correct) {
            feedback_parts <- c(feedback_parts, "**✅ STAP 1.1 - CUMULATIEVE ABSOLUTE FREQUENTIES:** Allemaal correct!")
            feedback_parts <- c(feedback_parts, "• Berekening: 33 → 33+84=117 → 33+84+102=219 → 219+63=282 → 282+48=330")
          } else {
            feedback_parts <- c(feedback_parts, "**❌ STAP 1.1 - CUMULATIEVE ABSOLUTE FREQUENTIES:** Fouten gevonden")
            for (error in cum_abs_errors) {
              feedback_parts <- c(feedback_parts, 
                paste0("  • **", error$category, ":** Je gaf ", error$student, 
                       ", maar juiste antwoord is **", error$expected, 
                       "** (berekening: ", error$calculation, ")", error$insight))
            }
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
          
          abs_freqs_rf <- c(33, 84, 102, 63, 48)
          rel_freq_expected <- c(0.1000, 0.2545, 0.3091, 0.1909, 0.1455)
          
          rel_freq_all_correct <- TRUE
          rel_freq_errors <- list()
          
          for (idx in seq_along(rel_freq_vars)) {
            var <- rel_freq_vars[idx]
            if (var %in% names(results) && !results[[var]]$correct) {
              rel_freq_all_correct <- FALSE
              student_val <- if (results[[var]]$exists) as.numeric(results[[var]]$value) else NA
              expected_val <- results[[var]]$expected
              cat_name <- sub("^relatieve_frequenties_", "", var)
              cat_display <- switch(cat_name,
                "zeer_ontevreden" = "zeer ontevreden",
                "ontevreden" = "ontevreden",
                "noch_tevreden_noch_ontevreden" = "noch tevreden, noch ontevreden",
                "tevreden" = "tevreden",
                "zeer_tevreden" = "zeer tevreden",
                cat_name
              )
              
              # Build calculation for context
              calc_formula <- paste0(abs_freqs_rf[idx], " ÷ 330")
              
              if (!is.na(student_val)) {
                # Check for common errors
                error_insight <- ""
                if (abs(student_val - abs_freqs_rf[idx]) < 0.01) {
                  error_insight <- " (je gebruikte alleen de absolute frequentie, niet gedeeld door N!)"
                } else if (abs(student_val - (student_val * 100)) < 0.01 && student_val < 1) {
                  error_insight <- " (check je decimale precision)"
                }
                
                rel_freq_errors[[length(rel_freq_errors)+1]] <- list(
                  category = cat_display,
                  student = format(student_val, digits=4),
                  expected = format(expected_val, digits=4),
                  calculation = calc_formula,
                  insight = error_insight
                )
              } else {
                rel_freq_errors[[length(rel_freq_errors)+1]] <- list(
                  category = cat_display,
                  student = "Ontbreekt",
                  expected = format(expected_val, digits=4),
                  calculation = calc_formula,
                  insight = ""
                )
              }
            }
          }
          
          if (rel_freq_all_correct) {
            feedback_parts <- c(feedback_parts, "**✅ STAP 1.2 - RELATIEVE FREQUENTIES:** Allemaal correct!")
            feedback_parts <- c(feedback_parts, "• Formule: absolute frequentie ÷ 330 (totaal aantal)")
            feedback_parts <- c(feedback_parts, "• Controle: alle waarden samen = 0.1 + 0.2545 + 0.3091 + 0.1909 + 0.1455 = 1.0000 ✓")
          } else {
            feedback_parts <- c(feedback_parts, "**❌ STAP 1.2 - RELATIEVE FREQUENTIES:** Fouten gevonden")
            for (error in rel_freq_errors) {
              feedback_parts <- c(feedback_parts,
                paste0("  • **", error$category, ":** Je gaf ", error$student,
                       ", maar juiste antwoord is **", error$expected,
                       "** (berekening: ", error$calculation, " = ", error$expected, ")", error$insight))
            }
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
          
          cum_rel_expected_vals <- c(0.1000, 0.3545, 0.6636, 0.8545, 1.0000)
          rel_freq_for_cum <- c(0.1000, 0.2545, 0.3091, 0.1909, 0.1455)
          
          cum_rel_all_correct <- TRUE
          cum_rel_errors <- list()
          
          for (idx in seq_along(cum_rel_vars)) {
            var <- cum_rel_vars[idx]
            if (var %in% names(results) && !results[[var]]$correct) {
              cum_rel_all_correct <- FALSE
              student_val <- if (results[[var]]$exists) as.numeric(results[[var]]$value) else NA
              expected_val <- results[[var]]$expected
              cat_name <- sub("^cumulatieve_relatieve_frequenties_", "", var)
              cat_display <- switch(cat_name,
                "zeer_ontevreden" = "zeer ontevreden",
                "ontevreden" = "ontevreden",
                "noch_tevreden_noch_ontevreden" = "noch tevreden, noch ontevreden",
                "tevreden" = "tevreden",
                "zeer_tevreden" = "zeer tevreden",
                cat_name
              )
              
              # Build cumulative calculation
              if (idx == 1) {
                calc_chain <- "0.1000"
              } else if (idx == 2) {
                calc_chain <- "0.1000 + 0.2545"
              } else if (idx == 3) {
                calc_chain <- "0.1000 + 0.2545 + 0.3091"
              } else if (idx == 4) {
                calc_chain <- "0.1000 + 0.2545 + 0.3091 + 0.1909"
              } else {
                calc_chain <- "0.1000 + 0.2545 + 0.3091 + 0.1909 + 0.1455"
              }
              
              if (!is.na(student_val)) {
                error_insight <- ""
                if (abs(student_val - rel_freq_for_cum[idx]) < 0.001) {
                  error_insight <- " (je gebruikte de gewone relatieve frequentie, niet cumulatief!)"
                } else if (idx == length(cum_rel_vars) && abs(student_val - 1.0) > 0.01) {
                  error_insight <- " (laatste categorie moet ALTIJD 1.0000 zijn!)"
                }
                
                cum_rel_errors[[length(cum_rel_errors)+1]] <- list(
                  category = cat_display,
                  student = format(student_val, digits=4),
                  expected = format(expected_val, digits=4),
                  calculation = calc_chain,
                  insight = error_insight
                )
              } else {
                cum_rel_errors[[length(cum_rel_errors)+1]] <- list(
                  category = cat_display,
                  student = "Ontbreekt",
                  expected = format(expected_val, digits=4),
                  calculation = calc_chain,
                  insight = ""
                )
              }
            }
          }
          
          if (cum_rel_all_correct) {
            feedback_parts <- c(feedback_parts, "**✅ STAP 1.3 - CUMULATIEVE RELATIEVE FREQUENTIES:** Allemaal correct!")
            feedback_parts <- c(feedback_parts, "• Berekening: 0.1 → 0.1+0.2545=0.3545 → +0.3091=0.6636 → +0.1909=0.8545 → +0.1455=1.0000")
            feedback_parts <- c(feedback_parts, "• Controle: laatste waarde moet ALTIJD 1.0000 zijn ✓")
          } else {
            feedback_parts <- c(feedback_parts, "**❌ STAP 1.3 - CUMULATIEVE RELATIEVE FREQUENTIES:** Fouten gevonden")
            for (error in cum_rel_errors) {
              feedback_parts <- c(feedback_parts,
                paste0("  • **", error$category, ":** Je gaf ", error$student,
                       ", maar juiste antwoord is **", error$expected,
                       "** (berekening: ", error$calculation, " = ", error$expected, ")", error$insight))
            }
          }
          
          if (generated != expected) {
            feedback_parts <- c(feedback_parts, "")
            feedback_parts <- c(feedback_parts, "📚 **Uitleg van gemaakte fouten:**")
            feedback_parts <- c(feedback_parts, "")
            feedback_parts <- c(feedback_parts, "**STAP 2 - OVERIGE VRAGEN:**")
            
            # Helper function with detailed error context and pedagogical insights
            make_label_with_explanation <- function(var_name, student_val, expected_val) {
              # Meetniveau - Why ordinaal?
              if (var_name == "meetniveau") {
                if (tolower(trimws(student_val)) == "nominaal") {
                  return("**Meetniveau:** ❌ 'nominaal' - FOUT! Tevredenheid heeft een RANGORDE (zeer ontevreden < ontevreden < ...). Dit is ordinaal!")
                } else if (tolower(trimws(student_val)) == "interval") {
                  return("**Meetniveau:** ❌ 'interval' - FOUT! We kunnen geen gelijke afstanden aannemen tussen categorieën. Dit is ordinaal.")
                } else {
                  return("**Meetniveau:** ❌ Juiste antwoord is 'ordinaal' (tevredenheid heeft rangorde)")
                }
              }
              
              # Totaal N
              if (var_name == "totaal_n") {
                return("**Totaal N:** Som van alle frequenties: 33+84+102+63+48 = 330")
              }
              
              # Modus - which has highest frequency?
              if (var_name == "modus") {
                return("**Modus:** ❌ Het vaakst voorkomende: 'noch tevreden, noch ontevreden' (102 keer - hoogste frequentie)")
              }
              
              # Mediaan - position 50%
              if (var_name == "mediaan") {
                return("**Mediaan:** ❌ Middelste categorie: N/2 = 330/2 = 165. Dit ligt in 'noch tevreden, noch ontevreden' (cum freq: 219)")
              }
              
              # Centraliteitsmaat - why mediaan for ordinal?
              if (var_name == "meest_relevante_centraliteit") {
                if (tolower(trimws(student_val)) == "modus") {
                  return("**Meest relevante:** ❌ Modus geeft minder informatie. Voor ordinale data: mediaan is beter (geeft middelste waarde)")
                } else if (tolower(trimws(student_val)) == "gemiddelde") {
                  return("**Meest relevante:** ❌ Gemiddelde is NIET geschikt voor ordinale data! Mediaan is correct.")
                } else {
                  return("**Meest relevante:** ❌ Juiste antwoord: 'mediaan' (best voor ordinale data)")
                }
              }
              
              # Q1 - 25th percentile
              if (var_name == "q1") {
                return("**Q1 (eerste kwartiel):** ❌ Position = N/4 = 330/4 = 82.5 ≈ 83. Ligt in 'ontevreden' (cum freq: 117)")
              }
              
              # Q3 - 75th percentile
              if (var_name == "q3") {
                return("**Q3 (derde kwartiel):** ❌ Position = 3×N/4 = 3×330/4 = 247.5 ≈ 248. Ligt in 'tevreden' (cum freq: 282)")
              }
              
              # Variatiebreedte - range
              if (var_name == "variatiebreedte") {
                return("**Variatiebreedte:** ❌ Bereik van laagste tot hoogste: 'zeer ontevreden tot zeer tevreden' (of: '5 categorieën')")
              }
              
              # IKA - interquartile range
              if (var_name == "ika") {
                if (tolower(trimws(student_val)) == "2" || tolower(trimws(student_val)) == "2 categorieën") {
                  return("**IKA:** ❌ Position Q3 - Position Q1 = 248 - 83 = 165 positions. Maar categorisch: Q3-Q1 bereik = 'ontevreden tot tevreden' (3 categorieën: ontevreden, noch tevreden noch ontevreden, tevreden)")
                } else {
                  return("**IKA:** ❌ Bereik middelste 50%: Q1='ontevreden', Q3='tevreden', dus antwoord = 'ontevreden tot tevreden'")
                }
              }
              
              return(paste0("**", var_name, "**"))
            }
            
            # Only show filled-in but wrong answers
            wrong_keys <- names(results)[sapply(results, function(x) x$exists && !x$correct)]
            
            for (key in wrong_keys) {
              student_val  <- results[[key]]$value
              expected_val <- results[[key]]$expected
              
              feedback_parts <- c(
                feedback_parts,
                paste0(
                  "• ", make_label_with_explanation(key, student_val, expected_val)
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
            "",
            "**1. MEETNIVEAU:**",
            "   • Ordinaal = waarden hebben RANGORDE (volgorde)",
            "   • Voorbeeld: zeer ontevreden < ontevreden < noch < tevreden < zeer tevreden",
            "",
            "**2. MATEN VAN CENTRALITEIT:**",
            "   • ✅ MODUS: Voorkomen categorie (altijd geschikt)",
            "   • ✅ MEDIAAN: Middelste waarde (geschikt voor ordinaal)",
            "   • ❌ GEMIDDELDE: NIET geschikt (kan niet met rangorde)",
            "",
            "**3. KWARTIELEN (Q1, Q3):**",
            "   • Q1 (25e percentiel): Position = N/4 = 82.5 → afgerond 83",
            "   • Q3 (75e percentiel): Position = 3N/4 = 247.5 → afgerond 248",
            "   • Kijk welke categorie die positie bereikt via cumulatieve frequenties",
            "",
            "**4. INTERKWARTIELAFSTAND (IKA):**",
            "   • Bereik van Q1 tot Q3 (middelste 50% van data)",
            "   • Voor ordinaal: categorie-bereik (bijv. 'ontevreden tot tevreden')",
            "",
            "**5. VARIANTIE & SPREIDING:**",
            "   • Variatiebreedte: van laagste tot hoogste categorie aanwezig",
            "   • IKA: van Q1 tot Q3 (stabiel middelste gedeelte)",
            "",
            "💡 **CONTROLE-TIPS:**",
            "   • Cumulatieve frequenties ALTIJD oplopend!",
            "   • Laatste cumulatief = N (330)",
            "   • Relatieve frequenties: som = 1.0000",
            "   • Cumulatieve relatieve: eindwaarde ALTIJD 1.0000"
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
