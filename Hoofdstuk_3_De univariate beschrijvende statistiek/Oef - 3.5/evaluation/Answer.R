context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          # Use the provided environment (env) instead of globalenv()
          results <- list()
          
          # Expected values
          expected_mean <- 6
          expected_deviations <- c(-4, 1, 4, -1, 0, 2, -3, -2, 3)
          expected_squared <- c(16, 1, 16, 1, 0, 4, 9, 4, 9)
          expected_ss <- 60
          expected_variance <- 7.5
          expected_sd <- 2.74
          
          # -----------------------------
          # STEP 1: MEAN CALCULATION
          # -----------------------------
          
          if (exists("gemiddelde_incidenten", envir = env)) {
            current_val <- as.numeric(get("gemiddelde_incidenten", envir = env))
            results$gemiddelde_incidenten <- list(
              exists = TRUE,
              value = current_val,
              correct = abs(current_val - expected_mean) < 0.01,
              expected = expected_mean
            )
          } else {
            results$gemiddelde_incidenten <- list(exists = FALSE, value = NA, correct = FALSE, expected = expected_mean)
          }
          
          # -----------------------------
          # STEP 2: DEVIATIONS
          # -----------------------------
          
          if (exists("afwijkingen", envir = env)) {
            current_val <- as.numeric(get("afwijkingen", envir = env))
            results$afwijkingen <- list(
              exists = TRUE,
              value = current_val,
              correct = length(current_val) == length(expected_deviations) &&
                all(abs(current_val - expected_deviations) < 0.01),
              expected = expected_deviations
            )
          } else {
            results$afwijkingen <- list(exists = FALSE, value = NA, correct = FALSE, expected = expected_deviations)
          }
          
          if (exists("gekwadrateerde_afwijkingen", envir = env)) {
            current_val <- as.numeric(get("gekwadrateerde_afwijkingen", envir = env))
            results$gekwadrateerde_afwijkingen <- list(
              exists = TRUE,
              value = current_val,
              correct = length(current_val) == length(expected_squared) &&
                all(abs(current_val - expected_squared) < 0.01),
              expected = expected_squared
            )
          } else {
            results$gekwadrateerde_afwijkingen <- list(exists = FALSE, value = NA, correct = FALSE, expected = expected_squared)
          }
          
          if (exists("sum_of_squares", envir = env)) {
            current_val <- as.numeric(get("sum_of_squares", envir = env))
            results$sum_of_squares <- list(
              exists = TRUE,
              value = current_val,
              correct = abs(current_val - expected_ss) < 0.01,
              expected = expected_ss
            )
          } else {
            results$sum_of_squares <- list(exists = FALSE, value = NA, correct = FALSE, expected = expected_ss)
          }
          
          # -----------------------------
          # STEP 3: VARIANCE & SD
          # -----------------------------
          
          if (exists("variantie_incidenten", envir = env)) {
            current_val <- as.numeric(get("variantie_incidenten", envir = env))
            results$variantie_incidenten <- list(
              exists = TRUE,
              value = current_val,
              correct = abs(current_val - expected_variance) < 0.01,
              expected = expected_variance
            )
          } else {
            results$variantie_incidenten <- list(exists = FALSE, value = NA, correct = FALSE, expected = expected_variance)
          }
          
          if (exists("standaarddeviatie_incidenten", envir = env)) {
            current_val <- as.numeric(get("standaarddeviatie_incidenten", envir = env))
            results$standaarddeviatie_incidenten <- list(
              exists = TRUE,
              value = current_val,
              correct = abs(current_val - expected_sd) < 0.01,
              expected = expected_sd
            )
          } else {
            results$standaarddeviatie_incidenten <- list(exists = FALSE, value = NA, correct = FALSE, expected = expected_sd)
          }
          
          if (exists("gekozen_spreidingsmaat", envir = env)) {
            current_val <- as.numeric(get("gekozen_spreidingsmaat", envir = env))
            results$gekozen_spreidingsmaat <- list(
              exists = TRUE,
              value = current_val,
              correct = abs(current_val - expected_sd) < 0.01,
              expected = expected_sd
            )
          } else {
            results$gekozen_spreidingsmaat <- list(exists = FALSE, value = NA, correct = FALSE, expected = expected_sd)
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
          # STEP-BY-STEP FEEDBACK
          # ----------------------
          
          if (results$gemiddelde_incidenten$correct) {
            feedback_lines <- c(feedback_lines, "**STAP 1 - GEMIDDELDE:** Som=54, n=9 → 54/9 = 6 ✅")
          } else {
            feedback_lines <- c(feedback_lines, "**STAP 1 - GEMIDDELDE:** Som alle incidenten (54) / aantal (9) = 6 ❌")
          }
          
          if (results$afwijkingen$correct) {
            feedback_lines <- c(feedback_lines, "**STAP 2 - AFWIJKINGEN:** X - 6 voor elke waarde ✅")
          } else {
            feedback_lines <- c(feedback_lines, "**STAP 2 - AFWIJKINGEN:** Bereken incident - 6 voor elke waarde ❌")
          }
          
          if (results$gekwadrateerde_afwijkingen$correct) {
            feedback_lines <- c(feedback_lines, "**STAP 2 - KWADRATEN:** (afwijking)² voor elke waarde ✅")
          } else {
            feedback_lines <- c(feedback_lines, "**STAP 2 - KWADRATEN:** Kwadrateer elke afwijking: (-4)²=16, (1)²=1, enz. ❌")
          }
          
          if (results$sum_of_squares$correct) {
            feedback_lines <- c(feedback_lines, "**STAP 2 - SOM KWADRATEN:** 16+1+16+1+0+4+9+4+9 = 60 ✅")
          } else {
            feedback_lines <- c(feedback_lines, "**STAP 2 - SOM KWADRATEN:** Tel alle gekwadrateerde afwijkingen op = 60 ❌")
          }
          
          if (results$variantie_incidenten$correct) {
            feedback_lines <- c(feedback_lines, "**STAP 3 - VARIANTIE:** SS/(n-1) = 60/8 = 7.5 ✅")
          } else {
            feedback_lines <- c(feedback_lines, "**STAP 3 - VARIANTIE:** Steekproefvariantie = 60/(9-1) = 60/8 = 7.5 ❌")
          }
          
          if (results$standaarddeviatie_incidenten$correct && results$gekozen_spreidingsmaat$correct) {
            feedback_lines <- c(feedback_lines, "**STAP 3 - STANDAARDDEVIATIE:** √7.5 = 2.74 (juiste keuze!) ✅")
          } else {
            feedback_lines <- c(feedback_lines, "**STAP 3 - STANDAARDDEVIATIE:** √7.5 = 2.74, dit is de juiste spreidingsmaat ❌")
          }
          
          # ----------------------------------------
          # COMPREHENSIVE ERROR ANALYSIS (COMMON MISTAKES)
          # ----------------------------------------
          
          if (correct_count != total_questions) {
            feedback_lines <- c(feedback_lines, "", "📚 **Uitleg van veelgemaakte fouten:**")
            
            # ======================
            # MEAN CALCULATION ERRORS
            # ======================
            
            if (!results$gemiddelde_incidenten$correct && results$gemiddelde_incidenten$exists) {
              student_mean <- as.numeric(results$gemiddelde_incidenten$value)
              if (!is.na(student_mean)) {
                if (abs(student_mean - 5.4) < 0.01) {
                  feedback_lines <- c(feedback_lines, "• **GEMIDDELDE n-1 FOUT:** Je deelde door 10 ipv 9. Gemiddelde = som/n = 54/9 = 6")
                } else if (abs(student_mean - 6.75) < 0.01) {
                  feedback_lines <- c(feedback_lines, "• **GEMIDDELDE SOM FOUT:** Check je som. Correct: 2+7+10+5+6+8+3+4+9 = 54, dan 54/9 = 6")
                } else if (student_mean < 5 || student_mean > 8) {
                  feedback_lines <- c(feedback_lines, "• **GEMIDDELDE BEREKENING:** Data: 2,7,10,5,6,8,3,4,9. Som = 54, gemiddelde = 54/9 = 6")
                } else if (abs(student_mean - 6.67) < 0.01) {
                  feedback_lines <- c(feedback_lines, "• **GEMIDDELDE AFRONDINGSFOUT:** Gebruik exacte waarde: 54/9 = 6.000")
                }
              }
            }
            
            # ======================
            # DEVIATION CALCULATION ERRORS
            # ======================
            
            if (!results$afwijkingen$correct && results$afwijkingen$exists) {
              student_dev <- as.numeric(results$afwijkingen$value)
              if (length(student_dev) == length(expected_deviations)) {
                # Check for sign errors
                sign_errors <- sum(abs(student_dev + expected_deviations) < 0.01)
                if (sign_errors >= 3) {
                  feedback_lines <- c(feedback_lines, "• **AFWIJKING TEKEN FOUT:** Let op richting! 2-6 = -4 (negatief), 10-6 = +4 (positief)")
                }
                
                # Check for wrong mean usage
                if (all(abs(student_dev - (c(2,7,10,5,6,8,3,4,9) - 5.4)) < 0.1)) {
                  feedback_lines <- c(feedback_lines, "• **AFWIJKING GEMIDDELDE FOUT:** Gebruik correct gemiddelde (6): 2-6=-4, 7-6=1, enz.")
                }
                
                # Check for absolute values
                if (all(student_dev >= 0) && sum(abs(student_dev - abs(expected_deviations))) < 1) {
                  feedback_lines <- c(feedback_lines, "• **AFWIJKING ABSOLUTE FOUT:** Behoud tekens! Afwijkingen kunnen negatief zijn: 2-6=-4")
                }
              } else if (length(student_dev) == 1) {
                feedback_lines <- c(feedback_lines, "• **AFWIJKING VECTOR FOUT:** Bereken voor ELKE waarde: incidenten - gemiddelde_incidenten")
              }
            }
            
            # ======================
            # SQUARED DEVIATIONS ERRORS
            # ======================
            
            if (!results$gekwadrateerde_afwijkingen$correct && results$gekwadrateerde_afwijkingen$exists) {
              student_sq <- as.numeric(results$gekwadrateerde_afwijkingen$value)
              if (length(student_sq) == length(expected_squared)) {
                # Check if they used original values instead of deviations
                original_squared <- c(2,7,10,5,6,8,3,4,9)^2
                if (all(abs(student_sq - original_squared) < 0.01)) {
                  feedback_lines <- c(feedback_lines, "• **GEKWADRATEERD ORIGINEEL FOUT:** Kwadrateer de AFWIJKINGEN, niet de originele waarden!")
                }
                
                # Check for negative squared values
                if (any(student_sq < 0)) {
                  feedback_lines <- c(feedback_lines, "• **GEKWADRATEERD NEGATIEF FOUT:** Kwadraat is altijd positief: (-4)² = 16, niet -16")
                }
                
                # Check for wrong mean in deviations
                wrong_mean_sq <- (c(2,7,10,5,6,8,3,4,9) - 5.4)^2
                if (all(abs(student_sq - wrong_mean_sq) < 0.1)) {
                  feedback_lines <- c(feedback_lines, "• **GEKWADRATEERD GEMIDDELDE FOUT:** Gebruik juist gemiddelde (6) in afwijkingen")
                }
              } else if (length(student_sq) == 1) {
                feedback_lines <- c(feedback_lines, "• **GEKWADRATEERD VECTOR FOUT:** Kwadrateer ELKE afwijking: afwijkingen^2")
              }
            }
            
            # ======================
            # SUM OF SQUARES ERRORS
            # ======================
            
            if (!results$sum_of_squares$correct && results$sum_of_squares$exists) {
              student_ss <- as.numeric(results$sum_of_squares$value)
              if (!is.na(student_ss)) {
                if (abs(student_ss - 54) < 1) {
                  feedback_lines <- c(feedback_lines, "• **SOM KWADRATEN ORIGINEEL FOUT:** Je somde originele waarden. Som gekwadrateerde AFWIJKINGEN = 60")
                } else if (abs(student_ss - 385) < 5) {  # sum of original squared values
                  feedback_lines <- c(feedback_lines, "• **SOM KWADRATEN VERKEERD:** Je somde gekwadrateerde originele waarden. Gebruik gekwadrateerde AFWIJKINGEN")
                } else if (student_ss < 50) {
                  feedback_lines <- c(feedback_lines, "• **SOM KWADRATEN TE LAAG:** Check berekening: 16+1+16+1+0+4+9+4+9 = 60")
                } else if (student_ss > 70) {
                  feedback_lines <- c(feedback_lines, "• **SOM KWADRATEN TE HOOG:** Controleer gekwadrateerde afwijkingen. Correcte som = 60")
                }
              }
            }
            
            # ======================
            # VARIANCE ERRORS
            # ======================
            
            if (!results$variantie_incidenten$correct && results$variantie_incidenten$exists) {
              student_var <- as.numeric(results$variantie_incidenten$value)
              if (!is.na(student_var)) {
                if (abs(student_var - 6.67) < 0.05) {
                  feedback_lines <- c(feedback_lines, "• **VARIANTIE n FOUT:** Je deelde door n=9. Voor steekproefvariantie: 60/(n-1) = 60/8 = 7.5")
                } else if (abs(student_var - 60) < 1) {
                  feedback_lines <- c(feedback_lines, "• **VARIANTIE FORMULE FOUT:** Je gaf som van kwadraten. Variantie = SS/(n-1) = 60/8 = 7.5")
                } else if (abs(student_var - 6) < 0.01) {
                  feedback_lines <- c(feedback_lines, "• **VARIANTIE GEMIDDELDE FOUT:** Je gaf het gemiddelde. Variantie = som gekwadrateerde afwijkingen/(n-1)")
                } else if (student_var < 5) {
                  feedback_lines <- c(feedback_lines, "• **VARIANTIE TE LAAG:** Check berekening. Steekproefvariantie = 60/8 = 7.5")
                } else if (student_var > 10) {
                  feedback_lines <- c(feedback_lines, "• **VARIANTIE TE HOOG:** Controleer sum of squares en noemer. Correct: 60/8 = 7.5")
                }
              }
            }
            
            # ======================
            # STANDARD DEVIATION ERRORS
            # ======================
            
            if (!results$standaarddeviatie_incidenten$correct && results$standaarddeviatie_incidenten$exists) {
              student_sd <- as.numeric(results$standaarddeviatie_incidenten$value)
              if (!is.na(student_sd)) {
                if (abs(student_sd - 7.5) < 0.01) {
                  feedback_lines <- c(feedback_lines, "• **STANDAARDDEVIATIE WORTEL FOUT:** Je gaf variantie. SD = √variantie = √7.5 = 2.74")
                } else if (abs(student_sd - 60) < 1) {
                  feedback_lines <- c(feedback_lines, "• **STANDAARDDEVIATIE SS FOUT:** Je gaf sum of squares. SD = √(SS/(n-1)) = √7.5 = 2.74")
                } else if (abs(student_sd - 2.58) < 0.05) {
                  feedback_lines <- c(feedback_lines, "• **STANDAARDDEVIATIE n FOUT:** Je gebruikte n ipv n-1. SD = √(60/8) = √7.5 = 2.74")
                } else if (abs(student_sd - 2.7) < 0.05) {
                  feedback_lines <- c(feedback_lines, "• **STANDAARDDEVIATIE AFRONDINGSFOUT:** Rond af op 2 decimalen: √7.5 = 2.74")
                } else if (student_sd > 5) {
                  feedback_lines <- c(feedback_lines, "• **STANDAARDDEVIATIE TE HOOG:** Check variantie berekening. SD = √7.5 = 2.74")
                }
              }
            }
            
            # ======================
            # CHOICE OF SPREAD MEASURE ERRORS
            # ======================
            
            if (!results$gekozen_spreidingsmaat$correct && results$gekozen_spreidingsmaat$exists) {
              student_choice <- as.numeric(results$gekozen_spreidingsmaat$value)
              if (!is.na(student_choice)) {
                if (abs(student_choice - 7.5) < 0.01) {
                  feedback_lines <- c(feedback_lines, "• **SPREIDINGSMAAT KEUZE FOUT:** Je koos variantie (7.5). Voor interpretatie is standaarddeviatie beter (2.74)")
                } else if (abs(student_choice - 7.85) < 0.01) {
                  feedback_lines <- c(feedback_lines, "• **SPREIDINGSMAAT MEERKEUZE FOUT:** 7.85 is een foute optie. Juiste standaarddeviatie = 2.74")
                } else if (abs(student_choice - 2.8) < 0.01) {
                  feedback_lines <- c(feedback_lines, "• **SPREIDINGSMAAT AFRONDINGSFOUT:** Te ruwe afronding. Precieze waarde = 2.74")
                } else {
                  feedback_lines <- c(feedback_lines, "• **SPREIDINGSMAAT FOUT:** Voor interval data is standaarddeviatie (2.74) de meest informatieve maat")
                }
              }
            }
          }
          
          feedback_lines <- c(
            feedback_lines,
            "",
            paste0("**", correct_count, " van ", total_questions, " juist**"),
            "",
            "🔍 **BELANGRIJKE REGELS VOOR SPREIDINGSMATEN:**",
            "• **Voor interval/ratio data:** standaarddeviatie is meest informatief",
            "• **Steekproefvariantie:** gebruik n-1 in noemer (niet n)",
            "• **Afwijkingen kunnen negatief zijn** (X - μ), maar kwadraten altijd positief",
            "• **Standaarddeviatie = √variantie** (zelfde eenheid als originele data)",
            "• **Som van gekwadrateerde afwijkingen ≠ som van gekwadrateerde waarden**",
            "• **Voor criminologisch onderzoek:** standaarddeviatie geeft spreiding in aantal incidenten"
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
