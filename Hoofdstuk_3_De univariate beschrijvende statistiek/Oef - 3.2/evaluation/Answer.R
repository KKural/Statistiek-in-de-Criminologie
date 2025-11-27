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
          
          correct_count     <- sum(sapply(results, function(x) x$correct))
          total_questions   <- length(results)
          feedback_parts    <- c()
          
          if (generated == expected) {
            feedback_parts <- c(
              feedback_parts,
              paste0("✅ **Alle antwoorden correct! (", correct_count, " van ", total_questions, ")**")
            )
          } else {
            feedback_parts <- c(
              feedback_parts,
              paste0("**Resultaat: ", correct_count, " van ", total_questions, " correct**"),
              "",
              "📚 **Uitleg van gemaakte fouten:**"
            )
            
            # Helper function for all variables
            make_label_with_explanation <- function(var_name, expected_val) {
              # Cumulatieve absolute frequenties
              if (grepl("^cumulatieve_absolute_frequenties_", var_name)) {
                category <- sub("^cumulatieve_absolute_frequenties_", "", var_name)
                cat_display <- switch(category,
                  "zeer_ontevreden" = "zeer ontevreden",
                  "ontevreden" = "ontevreden",
                  "noch_tevreden_noch_ontevreden" = "noch tevreden, noch ontevreden",
                  "tevreden" = "tevreden",
                  "zeer_tevreden" = "zeer tevreden",
                  category
                )
                return(paste0("**Cumulatieve absolute frequentie (", cat_display, ")**"))
              }
              
              # Relatieve frequenties
              if (grepl("^relatieve_frequenties_", var_name)) {
                category <- sub("^relatieve_frequenties_", "", var_name)
                cat_display <- switch(category,
                  "zeer_ontevreden" = "zeer ontevreden",
                  "ontevreden" = "ontevreden",
                  "noch_tevreden_noch_ontevreden" = "noch tevreden, noch ontevreden",
                  "tevreden" = "tevreden",
                  "zeer_tevreden" = "zeer tevreden",
                  category
                )
                freq_val <- switch(category,
                  "zeer_ontevreden" = 33,
                  "ontevreden" = 84,
                  "noch_tevreden_noch_ontevreden" = 102,
                  "tevreden" = 63,
                  "zeer_tevreden" = 48,
                  "?"
                )
                return(paste0("**Relatieve frequentie (", cat_display, ")** (bereken: ", freq_val, "/330)"))
              }
              
              # Cumulatieve relatieve frequenties
              if (grepl("^cumulatieve_relatieve_frequenties_", var_name)) {
                category <- sub("^cumulatieve_relatieve_frequenties_", "", var_name)
                cat_display <- switch(category,
                  "zeer_ontevreden" = "zeer ontevreden",
                  "ontevreden" = "ontevreden",
                  "noch_tevreden_noch_ontevreden" = "noch tevreden, noch ontevreden",
                  "tevreden" = "tevreden",
                  "zeer_tevreden" = "zeer tevreden",
                  category
                )
                return(paste0("**Cumulatieve relatieve frequentie (", cat_display, ")**"))
              }
              
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
            
            # Alle foute variabelen
            wrong_keys <- names(results)[sapply(results, function(x) !x$correct)]
            
            for (key in wrong_keys) {
              student_val  <- results[[key]]$value
              expected_val <- results[[key]]$expected
              
              if (results[[key]]$exists) {
                # Ingevuld maar fout
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
              } else {
                # Ontbrekend
                if (is.numeric(expected_val)) {
                  expected_str <- format(as.numeric(expected_val), digits = 6, big.mark = ",")
                } else {
                  expected_str <- as.character(expected_val)
                }
                
                feedback_parts <- c(
                  feedback_parts,
                  paste0(
                    "• ", make_label_with_explanation(key, expected_val),
                    ": **Ontbreekt ❌** (juiste antwoord is **", expected_str, "**)"
                  )
                )
              }
            }
            
            # Specifieke uitleg voor meetniveau als niet in wrong_keys
            if (!("meetniveau" %in% wrong_keys) && !results$meetniveau$correct && results$meetniveau$exists) {
              gegeven <- tolower(trimws(as.character(results$meetniveau$value)))
              feedback_parts <- c(
                feedback_parts,
                paste0(
                  "• **Meetniveau**: Je gaf `", gegeven,
                  "`, maar tevredenheid in categorieën heeft alleen rangorde (zeer ontevreden … zeer tevreden). ",
                  "Juiste antwoord is **ordinaal**."
                )
              )
            }
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
