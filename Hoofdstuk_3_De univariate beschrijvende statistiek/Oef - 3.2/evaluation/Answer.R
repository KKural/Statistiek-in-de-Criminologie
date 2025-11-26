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
          
          # Check if frequentietabel exists
          if (exists("frequentietabel", envir = env)) {
            tabel <- get("frequentietabel", envir = env)
            if (is.data.frame(tabel) && nrow(tabel) == 5) {
              results$frequentietabel <- list(
                exists = TRUE,
                value = "Data frame gevonden",
                correct = TRUE,
                expected = "Data frame met 5 rijen"
              )
            } else {
              results$frequentietabel <- list(
                exists = TRUE, 
                value = "Foutieve tabel structuur",
                correct = FALSE,
                expected = "Data frame met 5 rijen"
              )
            }
          } else {
            results$frequentietabel <- list(exists = FALSE, value = NA,
                                          correct = FALSE, 
                                          expected = "Data frame met 5 rijen")
          }
          
          # Frequency table calculations
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
            results$cumulatieve_absolute_frequenties <- list(exists = FALSE, value = NA,
                                    correct = FALSE,
                                    expected = c(33,117,219,282,330))
          }
          
          # Relatieve frequenties
          if (exists("relatieve_frequenties", envir = env)) {
            current_val <- get("relatieve_frequenties", envir = env)
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
            results$relatieve_frequenties <- list(exists = FALSE, value = NA,
                                     correct = FALSE,
                                     expected = c(0.1000,0.2545,0.3100,0.1909,0.1455))
          }
          
          # Cumulatieve relatieve frequenties
          if (exists("cumulatieve_relatieve_frequenties", envir = env)) {
            current_val <- get("cumulatieve_relatieve_frequenties", envir = env)
            expected_vec <- c("0,1000", "0,3545", "0,6636", "0,8545", "1,0000")
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
            results$cumulatieve_relatieve_frequenties <- list(exists = FALSE, value = NA,
                                    correct = FALSE,
                                    expected = c(0.1000,0.3545,0.6636,0.8545,1.0000))
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
          if (results$frequentietabel$exists && results$frequentietabel$correct) {
            feedback_lines <- c(feedback_lines,
              "**FREQUENTIETABEL STRUCTUUR:** Data frame correct aangemaakt ✅")
          } else {
            feedback_lines <- c(feedback_lines,
              "**FREQUENTIETABEL STRUCTUUR:** Maak data.frame met alle kolommen ❌")
          }
          
          if (results$cumulatieve_absolute_frequenties$exists && results$cumulatieve_absolute_frequenties$correct) {
            feedback_lines <- c(feedback_lines,
              "**CUMULATIEVE ABSOLUTE:** cumsum(absolute_frequenties) ✅")
          } else {
            feedback_lines <- c(feedback_lines,
              "**CUMULATIEVE ABSOLUTE:** Verwacht c(33, 117, 219, 282, 330) ❌")
          }
          
          if (results$relatieve_frequenties$exists && results$relatieve_frequenties$correct) {
            feedback_lines <- c(feedback_lines,
              "**FREQUENTIETABEL - RELATIEVE FREQ.:** absolute_frequenties / 330 ✅")
          } else {
            feedback_lines <- c(feedback_lines,
              "**FREQUENTIETABEL - RELATIEVE FREQ.:** Controleer absolute_frequenties / totaal N ❌")
          }
          
          if (results$cumulatieve_relatieve_frequenties$exists && results$cumulatieve_relatieve_frequenties$correct) {
            feedback_lines <- c(feedback_lines,
              "**FREQUENTIETABEL - CUMULATIEVE REL.:** cumsum(relatieve_frequenties) ✅")
          } else {
            feedback_lines <- c(feedback_lines,
              "**FREQUENTIETABEL - CUMULATIEVE REL.:** Verwacht c(0,1000; 0,3545; 0,6636; 0,8545; 1,0000) ❌")
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
          } else {
            # Add detailed error explanations for common mistakes
            feedback_lines <- c(feedback_lines, "", "📚 **Uitleg van veelgemaakte fouten:**")
            
            # Check for specific common errors
            
            # ERROR A: Wrong centrality measures
            if (!results$meetniveau$correct && results$meetniveau$exists) {
              if (tolower(trimws(as.character(results$meetniveau$value))) %in% c("interval", "ratio", "numeriek")) {
                feedback_lines <- c(feedback_lines, "• **MEETNIVEAU FOUT:** Dit is ordinaal, niet interval! Ordinale data hebben rangorde maar geen gelijke afstanden.")
              }
            }
            
            # ERROR B: Wrong quartile interpretation  
            if (!results$q1$correct && results$q1$exists) {
              student_q1 <- as.character(results$q1$value)
              if (grepl("^0\\.|^[0-9]+\\.[0-9]|^[0-9]+$", student_q1)) {
                feedback_lines <- c(feedback_lines, "• **Q1 FOUT:** Je gaf een getal, maar Q1 moet een CATEGORIE zijn! Q1 = 82,5ste persoon valt in categorie 'ontevreden'.")
              } else if (tolower(trimws(student_q1)) == "zeer ontevreden") {
                feedback_lines <- c(feedback_lines, "• **Q1 FOUT:** Check cumulatieve frequenties! 82,5ste persoon: 33 < 82,5 maar 33+84=117 ≥ 82,5 → 'ontevreden'.")
              }
            }
            
            if (!results$q3$correct && results$q3$exists) {
              student_q3 <- as.character(results$q3$value)
              if (grepl("^0\\.|^[0-9]+\\.[0-9]|^[0-9]+$", student_q3)) {
                feedback_lines <- c(feedback_lines, "• **Q3 FOUT:** Je gaf een getal, maar Q3 moet een CATEGORIE zijn! Q3 = 247,5ste persoon valt in categorie 'tevreden'.")
              } else if (tolower(trimws(student_q3)) == "zeer tevreden") {
                feedback_lines <- c(feedback_lines, "• **Q3 FOUT:** Check cumulatieve frequenties! 247,5ste persoon: 219 < 247,5 maar 219+63=282 ≥ 247,5 → 'tevreden'.")
              }
            }
            
            # ERROR C: Wrong median interpretation
            if (!results$mediaan$correct && results$mediaan$exists) {
              student_median <- as.character(results$mediaan$value)
              if (grepl("^165|^3$|^0\\.5", student_median)) {
                feedback_lines <- c(feedback_lines, "• **MEDIAAN FOUT:** Je gaf een getal/positie, maar mediaan moet een CATEGORIE zijn! 165,5ste persoon = 'noch tevreden, noch ontevreden'.")
              } else if (tolower(trimws(student_median)) %in% c("tevreden", "zeer tevreden", "ontevreden", "zeer ontevreden")) {
                feedback_lines <- c(feedback_lines, "• **MEDIAAN FOUT:** Check cumulatieve frequenties! 165,5ste persoon: 117 < 165,5 maar 117+102=219 ≥ 165,5 → 'noch tevreden, noch ontevreden'.")
              }
            }
            
            # ERROR D: Wrong IKA calculation
            if (!results$ika$correct && results$ika$exists) {
              student_ika <- as.character(results$ika$value)
              if (grepl("^[0-9]|^1$|^2$|^3$", student_ika)) {
                feedback_lines <- c(feedback_lines, "• **IKA FOUT:** Je probeerde Q3-Q1 = 4-2 = 2? Dat kan niet bij ordinale data! IKA = bereik van categorieŽn 'ontevreden tot tevreden'.")
              } else if (grepl("zeer.*zeer", tolower(student_ika))) {
                feedback_lines <- c(feedback_lines, "• **IKA FOUT:** IKA ≠ variatiebreedte! IKA = bereik Q1 tot Q3 (middelste 50%), niet van laagste tot hoogste.")
              }
            }
            
            # ERROR E: Wrong totaal_n
            if (!results$totaal_n$correct && results$totaal_n$exists) {
              student_n <- as.numeric(results$totaal_n$value)
              if (student_n == 5) {
                feedback_lines <- c(feedback_lines, "• **TOTAAL N FOUT:** Je telde categorieŽn (5) i.p.v. respondenten! Tel absolute frequenties: 33+84+102+63+48 = 330.")
              } else if (student_n != 330) {
                feedback_lines <- c(feedback_lines, "• **TOTAAL N FOUT:** Check je berekening! Som alle absolute frequenties: 33+84+102+63+48 = 330.")
              }
            }
            
            # ERROR F: Wrong frequency table calculations
            if (!results$cumulatieve_absolute_frequenties$correct && results$cumulatieve_absolute_frequenties$exists) {
              student_cum <- results$cumulatieve_absolute_frequenties$value
              if (is.numeric(student_cum) && length(student_cum) >= 2) {
                if (all(student_cum == c(33, 84, 102, 63, 48))) {
                  feedback_lines <- c(feedback_lines, "• **CUMULATIEF FOUT:** Je gaf absolute frequenties! Cumulatief = opgeteld: 33, 33+84=117, 117+102=219, enz.")
                } else if (student_cum[2] < student_cum[1]) {
                  feedback_lines <- c(feedback_lines, "• **CUMULATIEF FOUT:** Verkeerde volgorde! Ordinale data moeten in oorspronkelijke rangorde blijven.")
                }
              }
            }
            
            if (!results$relatieve_frequenties$correct && results$relatieve_frequenties$exists) {
              student_rel <- results$relatieve_frequenties$value
              if (is.numeric(student_rel) && length(student_rel) >= 1) {
                if (any(student_rel > 50)) {
                  feedback_lines <- c(feedback_lines, "• **RELATIEF FOUT:** Je gebruikte percentages (×100)! Gebruik proporties: 33/330 = 0,1000, niet 10,00.")
                } else if (any(student_rel > 1)) {
                  feedback_lines <- c(feedback_lines, "• **RELATIEF FOUT:** Te grote waarden! Relatieve frequentie = absolute_frequentie / 330.")
                } else {
                  feedback_lines <- c(feedback_lines, "• **RELATIEF FOUT:** Check je berekening! Verwacht: 0,1000; 0,2545; 0,3100; 0,1909; 0,1455")
                }
              }
            }
            
            if (!results$cumulatieve_relatieve_frequenties$correct && results$cumulatieve_relatieve_frequenties$exists) {
              student_cum_rel <- results$cumulatieve_relatieve_frequenties$value
              if (is.numeric(student_cum_rel) && length(student_cum_rel) >= 1) {
                if (!is.na(student_cum_rel[length(student_cum_rel)]) && abs(student_cum_rel[length(student_cum_rel)] - 1.0) > 0.01) {
                  feedback_lines <- c(feedback_lines, "• **CUM. RELATIEF FOUT:** Laatste waarde moet 1,0000 zijn! Check cumsum(relatieve_frequenties).")
                } else {
                  feedback_lines <- c(feedback_lines, "• **CUM. RELATIEF FOUT:** Check cumsum()! Verwacht: 0,1000; 0,3545; 0,6636; 0,8545; 1,0000")
                }
              }
            }
            
            # ERROR G: Wrong measurement level implications
            if (!results$meest_relevante$correct && results$meest_relevante$exists) {
              if (tolower(trimws(as.character(results$meest_relevante$value))) == "modus") {
                feedback_lines <- c(feedback_lines, "• **MEEST RELEVANT FOUT:** Voor ordinale data geeft de mediaan meer informatie dan modus (toont rangorde).")
              } else if (tolower(trimws(as.character(results$meest_relevante$value))) %in% c("gemiddelde", "mean")) {
                feedback_lines <- c(feedback_lines, "• **MEEST RELEVANT FOUT:** Gemiddelde mag niet bij ordinale data! Alleen modus en mediaan zijn toegestaan.")
              }
            }
          }
          
          feedback_lines <- c(feedback_lines, "", 
                             paste("**SCORE:**", correct_count, "van", total_questions, "correct! 🎉"),
                             "",
                             "**📚 STAP-VOOR-STAP SAMENVATTING:**",
                             "• STAP 1: Meetniveau bepalen",
                             "• STAP 3: Totaal N berekenen (som alle frequenties)", 
                             "• STAP 4: Centraliteit (modus, mediaan, meest relevant)",
                             "• STAP 5: Spreiding (Q1, Q3, variatiebreedte, IKA)",
                             "",
                             "🔍 **BELANGRIJKE REGELS VOOR ORDINALE DATA:**",
                             "• **Kwartielen zijn CATEGORIEAŽN**, geen getallen!",
                             "• **Gebruik cumulatieve frequenties** om kwartielen te vinden",
                             "• **Gemiddelde is VERBODEN** bij ordinale data",
                             "• **IKA = bereik categorieŽn**, niet Q3-Q1",
                             "• **Behoud de oorspronkelijke rangorde** van categorieŽn")
          
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