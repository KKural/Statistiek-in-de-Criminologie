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
          # FREQUENTIETABEL: BEREKENINGEN
          # -----------------------------
          
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
          
          # ---------------
          # MEETNIVEAU ETC.
          # ---------------
          
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
            results$meest_relevante <- list(
              exists  = TRUE,
              value   = current_val,
              correct = tolower(trimws(current_val)) == "mediaan",
              expected = "mediaan"
            )
          } else {
            results$meest_relevante <- list(
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
            var_val <- tolower(trimws(current_val))
            results$variatiebreedte <- list(
              exists  = TRUE,
              value   = current_val,
              correct = var_val %in% c("zeer ontevreden tot zeer tevreden",
                                       "van zeer ontevreden tot zeer tevreden"),
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
          
          # Totaal N
          if (exists("totaal_n", envir = env)) {
            current_val <- get("totaal_n", envir = env)
            results$totaal_n <- list(
              exists  = TRUE,
              value   = current_val,
              correct = as.numeric(current_val) == 330,
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
          
          # IKA
          if (exists("ika", envir = env)) {
            current_val <- as.character(get("ika", envir = env))
            ika_val <- tolower(trimws(current_val))
            results$ika <- list(
              exists  = TRUE,
              value   = current_val,
              correct = ika_val %in% c("ontevreden tot tevreden",
                                       "van ontevreden tot tevreden"),
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
          
          # ----------------------
          # FREQUENTIETABEL FEEDBACK
          # ----------------------
          if (results$cumulatieve_absolute_frequenties$exists &&
              results$cumulatieve_absolute_frequenties$correct) {
            feedback_lines <- c(
              feedback_lines,
              "**STAP 1.1 FREQUENTIETABEL - CUMULATIEVE ABS.:** cumsum(absolute_frequenties) ✅"
            )
          } else {
            feedback_lines <- c(
              feedback_lines,
              "**STAP 1.1 FREQUENTIETABEL - CUMULATIEVE ABS.:** De correcte vector is c(33, 117, 219, 282, 330) ❌"
            )
          }
          
          if (results$relatieve_frequenties$exists &&
              results$relatieve_frequenties$correct) {
            feedback_lines <- c(
              feedback_lines,
              "**STAP 1.2 FREQUENTIETABEL - RELATIEVE FREQ.:** absolute_frequenties / 330 ✅"
            )
          } else {
            feedback_lines <- c(
              feedback_lines,
              "**STAP 1.2 FREQUENTIETABEL - RELATIEVE FREQ.:** Controleer absolute_frequenties / totaal N ❌"
            )
          }
          
          if (results$cumulatieve_relatieve_frequenties$exists &&
              results$cumulatieve_relatieve_frequenties$correct) {
            feedback_lines <- c(
              feedback_lines,
              "**STAP 1.3 FREQUENTIETABEL - CUMULATIEVE REL.:** cumsum(relatieve_frequenties) ✅"
            )
          } else {
            feedback_lines <- c(
              feedback_lines,
              "**STAP 1.3 FREQUENTIETABEL - CUMULATIEVE REL.:** De correcte vector is c(0.1000, 0.3545, 0.6636, 0.8545, 1.0000) ❌"
            )
          }
          
          # ----------------------
          # OVERIGE STAPPEN
          # ----------------------
          
          if (results$meetniveau$exists && results$meetniveau$correct) {
            feedback_lines <- c(
              feedback_lines,
              "**STAP 2.1 - MEETNIVEAU:** Ordinaal (rangorde maar geen gelijke afstanden) ✅"
            )
          } else {
            feedback_lines <- c(
              feedback_lines,
              "**STAP 2.1 - MEETNIVEAU:** Expected 'ordinaal' ❌"
            )
          }
          
          if (results$totaal_n$exists && results$totaal_n$correct) {
            feedback_lines <- c(
              feedback_lines,
              "**STAP 2.2 - TOTAAL N:** 33+84+102+63+48 = 330 ✅"
            )
          } else {
            feedback_lines <- c(
              feedback_lines,
              "**STAP 2.2 - TOTAAL N:** ❌"
            )
          }
          
          if (results$modus$exists && results$modus$correct) {
            feedback_lines <- c(
              feedback_lines,
              "**STAP 3.1 - MODUS:** Categorie met hoogste frequentie (102) → **'Noch tevreden, noch ontevreden'** ✅"
            )
          } else {
            feedback_lines <- c(
              feedback_lines,
              "**STAP 3.1 - MODUS:** Categorie met hoogste frequentie (102) → **'Noch tevreden, noch ontevreden'** ❌"
            )
          }
          
          if (results$mediaan$exists && results$mediaan$correct) {
            feedback_lines <- c(
              feedback_lines,
              "**STAP 3.2 - MEDIAAN:** 165,5ste waarneming (N/2 = 330/2 = 165) → **'Noch tevreden, noch ontevreden'** ✅"
            )
          } else {
            feedback_lines <- c(
              feedback_lines,
              "**STAP 3.2 - MEDIAAN:** 165,5ste waarneming (N/2 = 330/2 = 165) → **'Noch tevreden, noch ontevreden'** ❌"
            )
          }
          
          if (results$meest_relevante$exists && results$meest_relevante$correct) {
            feedback_lines <- c(
              feedback_lines,
              "**STAP 3.3 - MEEST RELEVANT:** Mediaan geeft meer informatie dan modus → **'mediaan'** ✅"
            )
          } else {
            feedback_lines <- c(
              feedback_lines,
              "**STAP 3.3 - MEEST RELEVANT:** Mediaan geeft meer informatie dan modus → **'mediaan'** ❌"
            )
          }
          
          if (results$q1$exists && results$q1$correct) {
            feedback_lines <- c(
              feedback_lines,
              "**STAP 4.1 - Q1:** 82,5ste waarneming (25% van 330 = 82,5) → **'Ontevreden'** ✅"
            )
          } else {
            feedback_lines <- c(
              feedback_lines,
              "**STAP 4.1 - Q1:** 82,5ste waarneming (25% van 330 = 82,5) → **'Ontevreden'** ❌"
            )
          }
                             
          if (results$q3$exists && results$q3$correct) {
            # Alles juist → toon correcte categorie met ✅
            feedback_lines <- c(
              feedback_lines,
              "**STAP 4.2 - Q3:** 247,5ste waarneming (75% van 330 = 247,5) → **'Tevreden'** ✅"
            )
          } else if (!results$q3$exists) {
            # Niets ingevuld
            feedback_lines <- c(
              feedback_lines,
              "**STAP 4.2 - Q3:** Je gaf niets in. Het juiste antwoord is **'Tevreden'** ❌"
            )
          } else {
            # Wel iets ingevuld maar fout → toon het antwoord van de student
            student_q3_raw <- as.character(results$q3$value)
            feedback_lines <- c(
              feedback_lines,
              paste0(
                "**STAP 4.2 - Q3:** 247,5ste waarneming (75% van 330 = 247,5) → ",
                "je antwoord: **'", student_q3_raw, "'** ❌ (juiste categorie: **'Tevreden'**)"
              )
            )
          }

          if (results$variatiebreedte$exists && results$variatiebreedte$correct) {
            feedback_lines <- c(
              feedback_lines,
              "**STAP 4.3 - VARIATIEBREEDTE:** Van laagste tot hoogste categorie → **'Zeer ontevreden tot Zeer tevreden'** ✅"
            )
          } else {
            feedback_lines <- c(
              feedback_lines,
              "**STAP 4.3 - VARIATIEBREEDTE:** Van laagste tot hoogste categorie → **'Zeer ontevreden tot Zeer tevreden'** ❌"
            )
          }
          
          if (results$ika$exists && results$ika$correct) {
            feedback_lines <- c(
              feedback_lines,
              "**STAP 4.4 - IKA:** Bereik Q1 tot Q3 (middelste 50% van data) → **'Ontevreden tot Tevreden'** ✅"
            )
          } else {
            feedback_lines <- c(
              feedback_lines,
              "**STAP 4.4 - IKA:** Bereik Q1 tot Q3 (middelste 50% van data) → **'Ontevreden tot Tevreden'** ❌"
            )
          }
          
          # ----------------------------------------
          # EXTRA UITLEG BIJ FOUTEN (COMMON MISTAKES)
          # ----------------------------------------
          
          if (correct_count != total_questions) {
            feedback_lines <- c(feedback_lines, "", "📚 **Uitleg van veelgemaakte fouten:**")
            
            # MEETNIVEAU fout
            if (!results$meetniveau$correct && results$meetniveau$exists) {
              if (tolower(trimws(as.character(results$meetniveau$value))) %in% c("interval", "ratio", "numeriek")) {
                feedback_lines <- c(
                  feedback_lines,
                  "• **MEETNIVEAU FOUT:** Dit is ordinaal, niet interval! Ordinale data hebben rangorde maar geen gelijke afstanden."
                )
              }
            }
            
            # Q1 fout
            if (!results$q1$correct && results$q1$exists) {
              student_q1 <- as.character(results$q1$value)
              if (grepl("^0\\.|^[0-9]+\\.[0-9]|^[0-9]+$", student_q1)) {
                feedback_lines <- c(
                  feedback_lines,
                  "• **Q1 FOUT:** Je gaf een getal, maar Q1 moet een categorie zijn. Het juiste antwoord is 'Ontevreden'."
                )
              } else if (tolower(trimws(student_q1)) == "zeer ontevreden") {
                feedback_lines <- c(
                  feedback_lines,
                  "• **Q1 FOUT:** Je gaf 'Zeer ontevreden', maar dat is fout. De 82,5ste persoon valt in 'Ontevreden'. Het juiste antwoord is 'Ontevreden'."
                )
              }
            }
            
                       # Q3 fout
            if (!results$q3$correct) {
              if (!results$q3$exists) {
                # Leeg gelaten
                feedback_lines <- c(
                  feedback_lines,
                  "• **Q3 FOUT:** Je gaf niets in. Q3 hoort de categorie te zijn waarin de 247,5ste waarneming valt. Het juiste antwoord is **'Tevreden'**."
                )
              } else {
                student_q3_raw <- as.character(results$q3$value)
                student_q3 <- tolower(trimws(student_q3_raw))
                
                feedback_lines <- c(
                  feedback_lines,
                  paste0(
                    "• **Q3 FOUT:** Je gaf ", student_q3_raw,
                    ", maar dit is fout. Q3 is de categorie waarin de 247,5ste waarneming valt (75% van 330 = 247,5). ",
                    "Die waarneming ligt in de categorie **'Tevreden'**. Het juiste antwoord is **'Tevreden'**."
                  )
                )
              }
            }          
            # Mediaan fout
            if (!results$mediaan$correct && results$mediaan$exists) {
              student_median <- as.character(results$mediaan$value)
              if (grepl("^165|^3$|^0\\.5", student_median)) {
                feedback_lines <- c(
                  feedback_lines,
                  "• **MEDIAAN FOUT:** Je gaf een getal, maar de mediaan moet een categorie zijn. Het juiste antwoord is 'Noch tevreden, noch ontevreden'."
                )
              } else if (tolower(trimws(student_median)) %in% c("tevreden", "zeer tevreden", "ontevreden", "zeer ontevreden")) {
                feedback_lines <- c(
                  feedback_lines,
                  "• **MEDIAAN FOUT:** Je gaf '", student_median, "', maar dit is fout. De mediaan ligt in 'Noch tevreden, noch ontevreden'. Het juiste antwoord is 'Noch tevreden, noch ontevreden'."
                )
              }
            }
            
            # IKA fout
            if (!results$ika$correct && results$ika$exists) {
              student_ika <- as.character(results$ika$value)
              if (grepl("^[0-9]", student_ika)) {
                feedback_lines <- c(
                  feedback_lines,
                  "• **IKA FOUT:** Je gaf een getal, maar IKA is een bereik van categorieën. Het juiste antwoord is 'Ontevreden tot Tevreden'."
                )
              } else if (grepl("zeer", tolower(student_ika))) {
                feedback_lines <- c(
                  feedback_lines,
                  "• **IKA FOUT:** Je gebruikte de volledige schaal. IKA gaat van Q1 tot Q3. Het juiste antwoord is 'Ontevreden tot Tevreden'."
                )
              }
            }
            
            # Totaal N fout – **updated to your preferred style**
            if (!results$totaal_n$correct && results$totaal_n$exists) {
              student_n <- suppressWarnings(as.numeric(results$totaal_n$value))
              if (!is.na(student_n)) {
                if (student_n == 5) {
                  feedback_lines <- c(
                    feedback_lines,
                    "• **TOTAAL N FOUT:** Je gaf 5, maar dit is fout. Je telde het aantal categorieën in plaats van het aantal respondenten. Het juiste antwoord is 330."
                  )
                } else {
                  feedback_lines <- c(
                    feedback_lines,
                    paste0("• **TOTAAL N FOUT:** Je gaf ", student_n, ", maar dit is fout. Som alle absolute frequenties: 33+84+102+63+48 = 330. Het juiste antwoord is 330.")
                  )
                }
              } else {
                feedback_lines <- c(
                  feedback_lines,
                  "• **TOTAAL N FOUT:** Je gaf een ongeldige waarde. Som alle absolute frequenties: 33+84+102+63+48 = 330. Het juiste antwoord is 330."
                )
              }
            }
            
            # Individual variable feedback with specific error messages
            
            # CUMULATIEVE ABSOLUTE FREQUENTIES - Individual feedback
            cum_abs_labels <- list(
              "cumulatieve_absolute_frequenties_zeer_ontevreden" = "Zeer ontevreden (33)",
              "cumulatieve_absolute_frequenties_ontevreden" = "Ontevreden (33+84=117)", 
              "cumulatieve_absolute_frequenties_noch_tevreden_noch_ontevreden" = "Noch tevreden, noch ontevreden (33+84+102=219)",
              "cumulatieve_absolute_frequenties_tevreden" = "Tevreden (33+84+102+63=282)",
              "cumulatieve_absolute_frequenties_zeer_tevreden" = "Zeer tevreden (33+84+102+63+48=330)"
            )
            
            for (var_name in names(cum_abs_labels)) {
              if (exists(var_name, results) && !results[[var_name]]$correct) {
                if (!results[[var_name]]$exists) {
                  feedback_lines <- c(feedback_lines, 
                    paste0("• **", cum_abs_labels[[var_name]], ":** Variabele ontbreekt ❌"))
                } else {
                  student_val <- results[[var_name]]$value
                  expected_val <- results[[var_name]]$expected
                  
                  # Specific wrong answer patterns
                  if (var_name == "cumulatieve_absolute_frequenties_zeer_ontevreden" && student_val == 0) {
                    feedback_lines <- c(feedback_lines,
                      paste0("• **", cum_abs_labels[[var_name]], ":** Je gaf 0, maar cumulatief begint met de eerste categorie. Het juiste antwoord is **33** ❌"))
                  } else if (var_name == "cumulatieve_absolute_frequenties_ontevreden" && student_val == 84) {
                    feedback_lines <- c(feedback_lines,
                      paste0("• **", cum_abs_labels[[var_name]], ":** Je gaf 84, maar dit is de absolute frequentie. Cumulatief = 33+84 = **117** ❌"))
                  } else {
                    feedback_lines <- c(feedback_lines,
                      paste0("• **", cum_abs_labels[[var_name]], ":** Je gaf ", student_val, ", maar het juiste antwoord is **", expected_val, "** ❌"))
                  }
                }
              }
            }
            
            # RELATIEVE FREQUENTIES - Individual feedback  
            rel_freq_labels <- list(
              "relatieve_frequenties_zeer_ontevreden" = "Zeer ontevreden (33/330=0.1000)",
              "relatieve_frequenties_ontevreden" = "Ontevreden (84/330=0.2545)",
              "relatieve_frequenties_noch_tevreden_noch_ontevreden" = "Noch tevreden, noch ontevreden (102/330=0.3100)",
              "relatieve_frequenties_tevreden" = "Tevreden (63/330=0.1909)",
              "relatieve_frequenties_zeer_tevreden" = "Zeer tevreden (48/330=0.1455)"
            )
            
            for (var_name in names(rel_freq_labels)) {
              if (exists(var_name, results) && !results[[var_name]]$correct) {
                if (!results[[var_name]]$exists) {
                  feedback_lines <- c(feedback_lines,
                    paste0("• **", rel_freq_labels[[var_name]], ":** Variabele ontbreekt ❌"))
                } else {
                  student_val <- results[[var_name]]$value
                  expected_val <- results[[var_name]]$expected
                  
                  # Check for percentage instead of proportion
                  if (abs(student_val - expected_val * 100) < 0.1) {
                    feedback_lines <- c(feedback_lines,
                      paste0("• **", rel_freq_labels[[var_name]], ":** Je gaf ", student_val, ", maar dit is het percentage. Proportie = **", expected_val, "** ❌"))
                  } else {
                    feedback_lines <- c(feedback_lines,
                      paste0("• **", rel_freq_labels[[var_name]], ":** Je gaf ", round(student_val, 4), ", maar het juiste antwoord is **", expected_val, "** ❌"))
                  }
                }
              }
            }
            
            # CUMULATIEVE RELATIEVE FREQUENTIES - Individual feedback
            cum_rel_labels <- list(
              "cumulatieve_relatieve_frequenties_zeer_ontevreden" = "Zeer ontevreden (0.1000)",
              "cumulatieve_relatieve_frequenties_ontevreden" = "Ontevreden (0.1000+0.2545=0.3545)",
              "cumulatieve_relatieve_frequenties_noch_tevreden_noch_ontevreden" = "Noch tevreden, noch ontevreden (0.3545+0.3100=0.6636)",
              "cumulatieve_relatieve_frequenties_tevreden" = "Tevreden (0.6636+0.1909=0.8545)", 
              "cumulatieve_relatieve_frequenties_zeer_tevreden" = "Zeer tevreden (0.8545+0.1455=1.0000)"
            )
            
            for (var_name in names(cum_rel_labels)) {
              if (exists(var_name, results) && !results[[var_name]]$correct) {
                if (!results[[var_name]]$exists) {
                  feedback_lines <- c(feedback_lines,
                    paste0("• **", cum_rel_labels[[var_name]], ":** Variabele ontbreekt ❌"))
                } else {
                  student_val <- results[[var_name]]$value
                  expected_val <- results[[var_name]]$expected
                  feedback_lines <- c(feedback_lines,
                    paste0("• **", cum_rel_labels[[var_name]], ":** Je gaf ", round(student_val, 4), ", maar het juiste antwoord is **", expected_val, "** ❌"))
                }
              }
            }
            
            # Meest relevante maat fout
            if (!results$meest_relevante$correct &&
                results$meest_relevante$exists) {
              mr <- tolower(trimws(as.character(results$meest_relevante$value)))
              if (mr == "modus") {
                feedback_lines <- c(
                  feedback_lines,
                  "• **MEEST RELEVANT FOUT:** Je gaf 'modus', maar dit is fout. Voor ordinale data is de mediaan de meest informatieve maat. Het juiste antwoord is 'mediaan'."
                )
              } else if (mr %in% c("gemiddelde", "mean")) {
                feedback_lines <- c(
                  feedback_lines,
                  "• **MEEST RELEVANT FOUT:** Je gaf 'gemiddelde', maar dit is fout. Gemiddelde mag niet bij ordinale data. Het juiste antwoord is 'mediaan'."
                )
              }
            }
          }
          
          feedback_lines <- c(
            feedback_lines,
            "",
            paste0("**", correct_count, " van ", total_questions, " juist**"),
            "",
            "🔍 **BELANGRIJKE REGELS VOOR ORDINALE DATA:**",
            "• Kwartielen zijn categorieën, geen getallen.",
            "• Gebruik cumulatieve frequenties om kwartielen te vinden.",
            "• Gemiddelde is verboden bij ordinale data.",
            "• IKA = bereik van categorieën (Q1 tot Q3).",
            "• Behoud altijd de rangorde van de categorieën."
          )
          
          get_reporter()$add_message(
            paste(feedback_lines, collapse = "\n\n"),
            type = "markdown"
          )
          
          generated == expected
        }
      )
    }
  )
})
