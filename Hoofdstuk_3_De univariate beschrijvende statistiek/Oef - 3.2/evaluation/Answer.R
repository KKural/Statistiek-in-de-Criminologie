context({
  testcase(
    "Controle van ordinale data-analyse stappen",
    {
      testEqual(
        "Controleer je stap-voor-stap antwoorden",
        function(env) {
          # Use the provided environment (env) instead of globalenv()
          results <- list()
          
          # -----------------------------
          # FREQUENTIETABEL: BEREKENINGEN
          # -----------------------------
          
          # Cumulatieve absolute frequenties
          if (exists("cumulatieve_absolute_frequenties", envir = env)) {
            current_val <- get("cumulatieve_absolute_frequenties", envir = env)
            expected_vec <- c(33, 117, 219, 282, 330)
            
            ok <- is.numeric(current_val) &&
              length(current_val) == length(expected_vec) &&
              all(current_val == expected_vec)
            
            results$cumulatieve_absolute_frequenties <- list(
              exists  = TRUE,
              value   = current_val,
              correct = ok,
              expected = expected_vec
            )
          } else {
            results$cumulatieve_absolute_frequenties <- list(
              exists   = FALSE,
              value    = NA,
              correct  = FALSE,
              expected = c(33, 117, 219, 282, 330)
            )
          }
          
          # Relatieve frequenties (proporties, met decimale punt in R)
          if (exists("relatieve_frequenties", envir = env)) {
            current_val <- as.numeric(get("relatieve_frequenties", envir = env))
            expected_vec <- c(0.1000, 0.2545, 0.3100, 0.1909, 0.1455)
            
            ok <- is.numeric(current_val) &&
              length(current_val) == length(expected_vec) &&
              all(abs(current_val - expected_vec) < 0.0005)
            
            results$relatieve_frequenties <- list(
              exists  = TRUE,
              value   = current_val,
              correct = ok,
              expected = expected_vec
            )
          } else {
            results$relatieve_frequenties <- list(
              exists   = FALSE,
              value    = NA,
              correct  = FALSE,
              expected = c(0.1000, 0.2545, 0.3100, 0.1909, 0.1455)
            )
          }
          
          # Cumulatieve relatieve frequenties (ook met decimale punt in R)
          if (exists("cumulatieve_relatieve_frequenties", envir = env)) {
            current_val <- as.numeric(get("cumulatieve_relatieve_frequenties", envir = env))
            expected_vec <- c(0.1000, 0.3545, 0.6636, 0.8545, 1.0000)
            
            ok <- is.numeric(current_val) &&
              length(current_val) == length(expected_vec) &&
              all(abs(current_val - expected_vec) < 0.0005)
            
            results$cumulatieve_relatieve_frequenties <- list(
              exists  = TRUE,
              value   = current_val,
              correct = ok,
              expected = expected_vec
            )
          } else {
            results$cumulatieve_relatieve_frequenties <- list(
              exists   = FALSE,
              value    = NA,
              correct  = FALSE,
              expected = c(0.1000, 0.3545, 0.6636, 0.8545, 1.0000)
            )
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
              "**FREQUENTIETABEL - CUMULATIEVE ABS.:** cumsum(absolute_frequenties) ✅"
            )
          } else {
            feedback_lines <- c(
              feedback_lines,
              "**FREQUENTIETABEL - CUMULATIEVE ABS.:** De correcte vector is c(33, 117, 219, 282, 330) ❌"
            )
          }
          
          if (results$relatieve_frequenties$exists &&
              results$relatieve_frequenties$correct) {
            feedback_lines <- c(
              feedback_lines,
              "**FREQUENTIETABEL - RELATIEVE FREQ.:** absolute_frequenties / 330 ✅"
            )
          } else {
            feedback_lines <- c(
              feedback_lines,
              "**FREQUENTIETABEL - RELATIEVE FREQ.:** Controleer absolute_frequenties / totaal N ❌"
            )
          }
          
          if (results$cumulatieve_relatieve_frequenties$exists &&
              results$cumulatieve_relatieve_frequenties$correct) {
            feedback_lines <- c(
              feedback_lines,
              "**FREQUENTIETABEL - CUMULATIEVE REL.:** cumsum(relatieve_frequenties) ✅"
            )
          } else {
            feedback_lines <- c(
              feedback_lines,
              "**FREQUENTIETABEL - CUMULATIEVE REL.:** De correcte vector is c(0.1000, 0.3545, 0.6636, 0.8545, 1.0000) ❌"
            )
          }
          
          # ----------------------
          # OVERIGE STAPPEN
          # ----------------------
          
          if (results$meetniveau$exists && results$meetniveau$correct) {
            feedback_lines <- c(
              feedback_lines,
              "**STAP 1 - MEETNIVEAU:** Ordinaal (rangorde maar geen gelijke afstanden) ✅"
            )
          } else {
            feedback_lines <- c(
              feedback_lines,
              "**STAP 1 - MEETNIVEAU:** Expected 'ordinaal' ❌"
            )
          }
          
          if (results$totaal_n$exists && results$totaal_n$correct) {
            feedback_lines <- c(
              feedback_lines,
              "**STAP 3 - TOTAAL N:** 33+84+102+63+48 = 330 ✅"
            )
          } else {
            feedback_lines <- c(
              feedback_lines,
              "**STAP 3 - TOTAAL N:** Expected 330 ❌"
            )
          }
          
          if (results$modus$exists && results$modus$correct) {
            feedback_lines <- c(
              feedback_lines,
              "**STAP 4.1 - MODUS:** Categorie met hoogste frequentie (102) → **'Noch tevreden, noch ontevreden'** ✅"
            )
          } else {
            feedback_lines <- c(
              feedback_lines,
              "**STAP 4.1 - MODUS:** Categorie met hoogste frequentie (102) → **'Noch tevreden, noch ontevreden'** ❌"
            )
          }
          
          if (results$mediaan$exists && results$mediaan$correct) {
            feedback_lines <- c(
              feedback_lines,
              "**STAP 4.2 - MEDIAAN:** 165,5ste waarneming (N/2 = 330/2 = 165) → **'Noch tevreden, noch ontevreden'** ✅"
            )
          } else {
            feedback_lines <- c(
              feedback_lines,
              "**STAP 4.2 - MEDIAAN:** 165,5ste waarneming (N/2 = 330/2 = 165) → **'Noch tevreden, noch ontevreden'** ❌"
            )
          }
          
          if (results$meest_relevante$exists && results$meest_relevante$correct) {
            feedback_lines <- c(
              feedback_lines,
              "**STAP 4.3 - MEEST RELEVANT:** Mediaan geeft meer informatie dan modus → **'mediaan'** ✅"
            )
          } else {
            feedback_lines <- c(
              feedback_lines,
              "**STAP 4.3 - MEEST RELEVANT:** Mediaan geeft meer informatie dan modus → **'mediaan'** ❌"
            )
          }
          
          if (results$q1$exists && results$q1$correct) {
            feedback_lines <- c(
              feedback_lines,
              "**STAP 5.1 - Q1:** 82,5ste waarneming (25% van 330 = 82,5) → **'Ontevreden'** ✅"
            )
          } else {
            feedback_lines <- c(
              feedback_lines,
              "**STAP 5.1 - Q1:** 82,5ste waarneming (25% van 330 = 82,5) → **'Ontevreden'** ❌"
            )
          }
          
          if (results$q3$exists && results$q3$correct) {
            feedback_lines <- c(
              feedback_lines,
              "**STAP 5.1 - Q3:** 247,5ste waarneming (75% van 330 = 247,5) → **'Tevreden'** ✅"
            )
          } else {
            feedback_lines <- c(
              feedback_lines,
              "**STAP 5.1 - Q3:** 247,5ste waarneming (75% van 330 = 247,5) → **'Tevreden'** ❌"
            )
          }
          
          if (results$variatiebreedte$exists && results$variatiebreedte$correct) {
            feedback_lines <- c(
              feedback_lines,
              "**STAP 5.2 - VARIATIEBREEDTE:** Van laagste tot hoogste categorie → **'Zeer ontevreden tot Zeer tevreden'** ✅"
            )
          } else {
            feedback_lines <- c(
              feedback_lines,
              "**STAP 5.2 - VARIATIEBREEDTE:** Van laagste tot hoogste categorie → **'Zeer ontevreden tot Zeer tevreden'** ❌"
            )
          }
          
          if (results$ika$exists && results$ika$correct) {
            feedback_lines <- c(
              feedback_lines,
              "**STAP 5.3 - IKA:** Bereik Q1 tot Q3 (middelste 50% van data) → **'Ontevreden tot Tevreden'** ✅"
            )
          } else {
            feedback_lines <- c(
              feedback_lines,
              "**STAP 5.3 - IKA:** Bereik Q1 tot Q3 (middelste 50% van data) → **'Ontevreden tot Tevreden'** ❌"
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
                  "• **Q1 FOUT:** Je gaf een getal, maar Q1 moet een CATEGORIE zijn! Q1 = 82,5ste persoon valt in categorie 'ontevreden'."
                )
              } else if (tolower(trimws(student_q1)) == "zeer ontevreden") {
                feedback_lines <- c(
                  feedback_lines,
                  "• **Q1 FOUT:** Check cumulatieve frequenties! 82,5ste persoon: 33 < 82,5 maar 33+84=117 ≥ 82,5 → 'ontevreden'."
                )
              }
            }
            
            # Q3 fout
            if (!results$q3$correct && results$q3$exists) {
              student_q3 <- as.character(results$q3$value)
              if (grepl("^0\\.|^[0-9]+\\.[0-9]|^[0-9]+$", student_q3)) {
                feedback_lines <- c(
                  feedback_lines,
                  "• **Q3 FOUT:** Je gaf een getal, maar Q3 moet een CATEGORIE zijn! Q3 = 247,5ste persoon valt in categorie 'tevreden'."
                )
              } else if (tolower(trimws(student_q3)) == "zeer tevreden") {
                feedback_lines <- c(
                  feedback_lines,
                  "• **Q3 FOUT:** Check cumulatieve frequenties! 247,5ste persoon: 219 < 247,5 maar 219+63=282 ≥ 247,5 → 'tevreden'."
                )
              }
            }
            
            # Mediaan fout
            if (!results$mediaan$correct && results$mediaan$exists) {
              student_median <- as.character(results$mediaan$value)
              if (grepl("^165|^3$|^0\\.5", student_median)) {
                feedback_lines <- c(
                  feedback_lines,
                  "• **MEDIAAN FOUT:** Je gaf een getal/positie, maar mediaan moet een CATEGORIE zijn! 165,5ste persoon = 'noch tevreden, noch ontevreden'."
                )
              } else if (tolower(trimws(student_median)) %in% c("tevreden", "zeer tevreden", "ontevreden", "zeer ontevreden")) {
                feedback_lines <- c(
                  feedback_lines,
                  "• **MEDIAAN FOUT:** Check cumulatieve frequenties! 165,5ste persoon: 117 < 165,5 maar 117+102=219 ≥ 165,5 → 'noch tevreden, noch ontevreden'."
                )
              }
            }
            
            # IKA fout
            if (!results$ika$correct && results$ika$exists) {
              student_ika <- as.character(results$ika$value)
              if (grepl("^[0-9]|^1$|^2$|^3$", student_ika)) {
                feedback_lines <- c(
                  feedback_lines,
                  "• **IKA FOUT:** Je probeerde Q3-Q1 = 4-2 = 2? Dat kan niet bij ordinale data! IKA = bereik van categorieën 'ontevreden tot tevreden'."
                )
              } else if (grepl("zeer.*zeer", tolower(student_ika))) {
                feedback_lines <- c(
                  feedback_lines,
                  "• **IKA FOUT:** IKA ≠ variatiebreedte! IKA = bereik Q1 tot Q3 (middelste 50%), niet van laagste tot hoogste."
                )
              }
            }
            
            # Totaal N fout
            if (!results$totaal_n$correct && results$totaal_n$exists) {
              student_n <- suppressWarnings(as.numeric(results$totaal_n$value))
              if (!is.na(student_n) && student_n == 5) {
                feedback_lines <- c(
                  feedback_lines,
                  "• **TOTAAL N FOUT:** Je telde categorieën (5) i.p.v. respondenten! Tel absolute frequenties: 33+84+102+63+48 = 330."
                )
              } else if (!is.na(student_n) && student_n != 330) {
                feedback_lines <- c(
                  feedback_lines,
                  "• **TOTAAL N FOUT:** Check je berekening! Som alle absolute frequenties: 33+84+102+63+48 = 330."
                )
              }
            }
            
            # CUMULATIEVE ABSOLUTE FREQUENTIES fout - specifieke analyse zoals 3.1
            if (!results$cumulatieve_absolute_frequenties$correct) {
              if (!results$cumulatieve_absolute_frequenties$exists) {
                feedback_lines <- c(
                  feedback_lines,
                  "• **CUMULATIEF ABS ONTBREEKT:** Variabele 'cumulatieve_absolute_frequenties' niet gevonden! → **c(33, 117, 219, 282, 330)**"
                )
              } else {
                student_cum <- results$cumulatieve_absolute_frequenties$value
                
                # Check if they gave the original absolute frequencies
                if (is.numeric(student_cum) && length(student_cum) == 5 && all(student_cum == c(33, 84, 102, 63, 48))) {
                  feedback_lines <- c(
                    feedback_lines,
                    "• **CUMULATIEF ABS FOUT:** Je gaf de absolute frequenties c(33, 84, 102, 63, 48) maar 'cumulatief' betekent optellen: 33, dan 33+84=117, dan 117+102=219, enz. → **c(33, 117, 219, 282, 330)**"
                  )
                } 
                # Check if they calculated cumulative but in wrong order
                else if (is.numeric(student_cum) && length(student_cum) >= 2 && any(diff(student_cum) < 0)) {
                  feedback_lines <- c(
                    feedback_lines,
                    "• **CUMULATIEF ABS FOUT:** Je waarden worden kleiner! Cumulatief moet steeds groter worden → **c(33, 117, 219, 282, 330)**"
                  )
                }
                # Show their actual values for debugging
                else if (is.numeric(student_cum) && length(student_cum) == 5) {
                  student_values <- paste(round(student_cum, 0), collapse = ", ")
                  feedback_lines <- c(
                    feedback_lines,
                    paste0("• **CUMULATIEF ABS FOUT:** Je gaf c(", student_values, ") maar cumulatief = steeds optellen: 33, 33+84=117, 117+102=219, enz. → **c(33, 117, 219, 282, 330)**")
                  )
                }
                # Wrong data type or length
                else {
                  feedback_lines <- c(
                    feedback_lines,
                    "• **CUMULATIEF ABS FOUT:** Geen geldige numerieke vector van 5 elementen! → **c(33, 117, 219, 282, 330)**"
                  )
                }
              }
            }
            
            # RELATIEVE FREQUENTIES fout - specifieke analyse zoals 3.1  
            if (!results$relatieve_frequenties$correct) {
              if (!results$relatieve_frequenties$exists) {
                feedback_lines <- c(
                  feedback_lines,
                  "• **RELATIEF FREQ ONTBREEKT:** Variabele 'relatieve_frequenties' niet gevonden! → **c(0.1000, 0.2545, 0.3100, 0.1909, 0.1455)**"
                )
              } else {
                student_rel <- results$relatieve_frequenties$value
                
                # Check if they used percentages instead of proportions
                if (is.numeric(student_rel) && length(student_rel) == 5 && any(student_rel > 5)) {
                  if (all(abs(student_rel - c(10.00, 25.45, 30.91, 19.09, 14.55)) < 0.1)) {
                    feedback_lines <- c(
                      feedback_lines,
                      "• **RELATIEF FREQ FOUT:** Je gaf percentages c(10.00, 25.45, 30.91, 19.09, 14.55) maar relatieve frequenties zijn proporties tussen 0 en 1 → **c(0.1000, 0.2545, 0.3100, 0.1909, 0.1455)**"
                    )
                  } else {
                    feedback_lines <- c(
                      feedback_lines,
                      "• **RELATIEF FREQ FOUT:** Jouw waarden zijn te groot! Relatieve frequenties zijn proporties tussen 0 en 1 (33/330 = 0.1000, NIET 10.00) → **c(0.1000, 0.2545, 0.3100, 0.1909, 0.1455)**"
                    )
                  }
                }
                # Check if they gave absolute frequencies instead
                else if (is.numeric(student_rel) && length(student_rel) == 5 && all(student_rel == c(33, 84, 102, 63, 48))) {
                  feedback_lines <- c(
                    feedback_lines,
                    "• **RELATIEF FREQ FOUT:** Je gaf de absolute frequenties c(33, 84, 102, 63, 48) maar relatieve frequenties zijn proporties: deel door totaal N=330 → **c(0.1000, 0.2545, 0.3100, 0.1909, 0.1455)**"
                  )
                }
                # Check sum - should be 1.0000
                else if (is.numeric(student_rel) && length(student_rel) == 5 && abs(sum(student_rel) - 1.0) > 0.01) {
                  student_sum <- round(sum(student_rel), 4)
                  feedback_lines <- c(
                    feedback_lines,
                    paste0("• **RELATIEF FREQ FOUT:** Som van jouw waarden is ", student_sum, " maar moet 1.0000 zijn! Check of je alle waarden deelt door 330 → **c(0.1000, 0.2545, 0.3100, 0.1909, 0.1455)**")
                  )
                }
                # Show their actual values for debugging
                else if (is.numeric(student_rel) && length(student_rel) == 5) {
                  student_values <- paste(round(student_rel, 4), collapse = ", ")
                  feedback_lines <- c(
                    feedback_lines,
                    paste0("• **RELATIEF FREQ FOUT:** Je gaf c(", student_values, ") maar deel elke absolute frequentie door totaal N=330 → **c(0.1000, 0.2545, 0.3100, 0.1909, 0.1455)**")
                  )
                }
                # Wrong data type or length
                else {
                  feedback_lines <- c(
                    feedback_lines,
                    "• **RELATIEF FREQ FOUT:** Geen geldige numerieke vector van 5 elementen! → **c(0.1000, 0.2545, 0.3100, 0.1909, 0.1455)**"
                  )
                }
              }
            }
            
            # CUMULATIEVE RELATIEVE FREQUENTIES fout - geef specifieke hulp
            if (!results$cumulatieve_relatieve_frequenties$correct) {
              if (!results$cumulatieve_relatieve_frequenties$exists) {
                feedback_lines <- c(
                  feedback_lines,
                  "• **CUMULATIEF REL ONTBREEKT:** Variabele 'cumulatieve_relatieve_frequenties' niet gevonden! → **c(0.1000, 0.3545, 0.6636, 0.8545, 1.0000)**"
                )
              } else {
                student_cum_rel <- results$cumulatieve_relatieve_frequenties$value
                
                if (is.numeric(student_cum_rel) && length(student_cum_rel) >= 1) {
                  if (length(student_cum_rel) != 5) {
                    feedback_lines <- c(
                      feedback_lines,
                      "• **CUMULATIEF REL FOUT:** Vector heeft verkeerde lengte! Moet 5 elementen hebben → **c(0.1000, 0.3545, 0.6636, 0.8545, 1.0000)**"
                    )
                  } else if (abs(student_cum_rel[5] - 1.0) > 0.01) {
                    last_value <- round(student_cum_rel[5], 4)
                    feedback_lines <- c(
                      feedback_lines,
                      paste0("• **CUMULATIEF REL FOUT:** Laatste waarde is ", last_value, " maar moet 1.0000 zijn! Eerst relatieve_frequenties corrigeren → **c(0.1000, 0.3545, 0.6636, 0.8545, 1.0000)**")
                    )
                  } else if (any(diff(student_cum_rel) < 0)) {
                    feedback_lines <- c(
                      feedback_lines,
                      "• **CUMULATIEF REL FOUT:** Waarden moeten steeds groter worden! → **c(0.1000, 0.3545, 0.6636, 0.8545, 1.0000)**"
                    )
                  } else {
                    student_values <- paste(round(student_cum_rel, 4), collapse = ", ")
                    feedback_lines <- c(
                      feedback_lines,
                      paste0("• **CUMULATIEF REL FOUT:** Je gaf c(", student_values, ") maar tel steeds op: 0.1000, 0.1000+0.2545=0.3545, enz. → **c(0.1000, 0.3545, 0.6636, 0.8545, 1.0000)**")
                    )
                  }
                } else {
                  feedback_lines <- c(
                    feedback_lines,
                    "• **CUMULATIEF REL FOUT:** Geen geldige numerieke vector! → **c(0.1000, 0.3545, 0.6636, 0.8545, 1.0000)**"
                  )
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
                  "• **MEEST RELEVANT FOUT:** Voor ordinale data geeft de mediaan meer informatie dan modus (toont rangorde)."
                )
              } else if (mr %in% c("gemiddelde", "mean")) {
                feedback_lines <- c(
                  feedback_lines,
                  "• **MEEST RELEVANT FOUT:** Gemiddelde mag niet bij ordinale data! Alleen modus en mediaan zijn toegestaan."
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
            "• **Kwartielen zijn CATEGORIEËN**, geen getallen!",
            "• **Gebruik cumulatieve frequenties** om kwartielen te vinden",
            "• **Gemiddelde is VERBODEN** bij ordinale data",
            "• **IKA = bereik categorieën**, niet Q3-Q1",
            "• **Behoud de oorspronkelijke rangorde** van categorieën"
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
