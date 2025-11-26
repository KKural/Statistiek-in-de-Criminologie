context({
  testcase(
    "",
    {
      testEqual(
        " ",
        function(env) {
          # Use the provided environment (env) instead of globalenv()
          results <- list()
          
          # Check each variable and store detailed results
          # Vraag 1: Hoeveel studenten drinken "dikwijls" energiedrankjes?
          if(exists("vraag1", envir = env)) {
            current_val <- as.numeric(get("vraag1", envir = env))
            results$vraag1 <- list(
              exists = TRUE,
              value = get("vraag1", envir = env),
              correct = current_val == 10,
              expected = 10
            )
          } else {
            results$vraag1 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 10)
          }
          
          # Vraag 2: Hoeveel procent is dat?
          if(exists("vraag2", envir = env)) {
            current_val <- as.numeric(get("vraag2", envir = env))
            results$vraag2 <- list(
              exists = TRUE,
              value = get("vraag2", envir = env),
              correct = abs(current_val - 3.23) < 0.01,
              expected = 3.23
            )
          } else {
            results$vraag2 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 3.23)
          }
          
          # Vraag 3: Hoeveel procent drinkt zelden of nooit?
          if(exists("vraag3", envir = env)) {
            current_val <- as.numeric(get("vraag3", envir = env))
            results$vraag3 <- list(
              exists = TRUE,
              value = get("vraag3", envir = env),
              correct = abs(current_val - 72.58) < 0.01,
              expected = 72.58
            )
          } else {
            results$vraag3 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 72.58)
          }
          
          # Vraag 4: Welke proportie drinkt minstens dikwijls?
          if(exists("vraag4", envir = env)) {
            current_val <- as.numeric(get("vraag4", envir = env))
            results$vraag4 <- list(
              exists = TRUE,
              value = get("vraag4", envir = env),
              correct = abs(current_val - 0.2097) < 0.001,
              expected = 0.2097
            )
          } else {
            results$vraag4 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 0.2097)
          }
          
          # Vraag 5: Effect missing data
          if(exists("vraag5", envir = env)) {
            current_val <- as.numeric(get("vraag5", envir = env))
            results$vraag5 <- list(
              exists = TRUE,
              value = get("vraag5", envir = env),
              correct = current_val == 2,
              expected = 2
            )
          } else {
            results$vraag5 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 2)
          }
          
          # Vraag 6: Hoeveel drinken hoogstens af en toe?
          if(exists("vraag6", envir = env)) {
            current_val <- as.numeric(get("vraag6", envir = env))
            results$vraag6 <- list(
              exists = TRUE,
              value = get("vraag6", envir = env),
              correct = current_val == 245,
              expected = 245
            )
          } else {
            results$vraag6 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 245)
          }
          
          # Store results for use in comparator
          assign("detailed_results", results, envir = globalenv())
          
          # Return overall success
          all_correct <- all(sapply(results, function(x) x$correct))
          return(all_correct)
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          # Get detailed results from global environment
          results <- get("detailed_results", envir = globalenv())
          
          # Create detailed output showing all variables
          feedback_parts <- c("**Resultaten per vraag:**\n")
          
          question_names <- c(
            "vraag1" = "1. Hoeveel studenten drinken 'dikwijls' energiedrankjes?",
            "vraag2" = "2. Hoeveel procent is dat?",
            "vraag3" = "3. Hoeveel procent drinkt zelden of nooit?",
            "vraag4" = "4. Welke proportie drinkt minstens 'dikwijls'?",
            "vraag5" = "5. Effect van missing data (1, 2, 3, of 4)?",
            "vraag6" = "6. Hoeveel drinken hoogstens 'af en toe'?"
          )
          
          counter <- 1
          for(var_key in names(question_names)) {
            var_display <- question_names[var_key]
            result <- results[[var_key]]
            
            if(!result$exists) {
              feedback_parts <- c(feedback_parts, paste0("**", var_display, "**: *Ontbreekt* ❌"))
            } else if(result$correct) {
              feedback_parts <- c(feedback_parts, paste0("**", var_display, "**: ", result$value, " ✅"))
            } else {
              feedback_parts <- c(feedback_parts, paste0("**", var_display, "**: ", result$value, " ❌"))
            }
            counter <- counter + 1
          }
          
          if (generated == expected) {
            feedback_parts <- c(feedback_parts, "\n✅ **Alle vragen correct beantwoord!**")
            feedback_parts <- c(feedback_parts, "\n**Uitstekend!** Je beheerst het lezen van frequentietabellen perfect.")
          } else {
            
            # Add helpful tips for incorrect answers
            incorrect_vars <- sapply(results, function(x) !x$correct)
            if(any(incorrect_vars)) {
              feedback_parts <- c(feedback_parts, "\n**📚 Uitleg waarom deze antwoorden fout zijn:**")
              
              if(!results$vraag1$correct) {
                if(!results$vraag1$exists) {
                  feedback_parts <- c(feedback_parts, "• **Vraag 1**: ❌ Variabele 'vraag1' niet gevonden. Vervang ??? door: `vraag1 <- 10`")
                } else {
                  student_answer <- as.numeric(results$vraag1$value)
                  if(student_answer == 55) {
                    feedback_parts <- c(feedback_parts, "• **Vraag 1**: Je antwoordde 55, maar dat is de frequentie van 'zeer vaak'. Zoek in de kolom 'Absolute frequentie' bij rij 'Dikwijls' → **10**")
                  } else if(student_answer == 255) {
                    feedback_parts <- c(feedback_parts, "• **Vraag 1**: Je antwoordde 255, maar dat is de cumulatieve frequentie tot 'dikwijls'. De absolute frequentie van alleen 'dikwijls' is → **10**")
                  } else if(student_answer == 0.0323 || student_answer == 3.23) {
                    feedback_parts <- c(feedback_parts, "• **Vraag 1**: Je gaf de proportie/percentage, maar de vraag vraagt naar het aantal studenten (absolute frequentie) → **10**")
                  } else {
                    feedback_parts <- c(feedback_parts, "• **Vraag 1**: Zoek in de kolom 'Absolute frequentie' bij de rij 'Dikwijls' → **10** studenten")
                  }
                }
              }
              
              if(!results$vraag2$correct) {
                if(!results$vraag2$exists) {
                  feedback_parts <- c(feedback_parts, "• **Vraag 2**: ❌ Variabele 'vraag2' niet gevonden. Vervang ??? door: `vraag2 <- 3.23`")
                } else {
                  student_answer <- as.numeric(results$vraag2$value)
                  if(abs(student_answer - 0.0323) < 0.001) {
                    feedback_parts <- c(feedback_parts, "• **Vraag 2**: Je gaf de proportie (0.0323), maar de vraag vraagt naar het percentage. Vermenigvuldig met 100 → **3.23%**")
                  } else if(student_answer == 10) {
                    feedback_parts <- c(feedback_parts, "• **Vraag 2**: Je gaf de absolute frequentie (10), maar de vraag vraagt naar het percentage: 10/310 × 100 → **3.23%**")
                  } else {
                    feedback_parts <- c(feedback_parts, "• **Vraag 2**: Proportie 0.0323 × 100 = **3.23%**")
                  }
                }
              }
              
              if(!results$vraag3$correct) {
                if(!results$vraag3$exists) {
                  feedback_parts <- c(feedback_parts, "• **Vraag 3**: ❌ Variabele 'vraag3' niet gevonden. Vervang ??? door: `vraag3 <- 72.58`")
                } else {
                  student_answer <- as.numeric(results$vraag3$value)
                  if(abs(student_answer - 61.29) < 0.1) {
                    feedback_parts <- c(feedback_parts, "• **Vraag 3**: Je gaf alleen 'nooit' (61.29%), maar de vraag vraagt 'zelden OF nooit': 61.29% + 11.29% → **72.58%**")
                  } else if(abs(student_answer - 11.29) < 0.1) {
                    feedback_parts <- c(feedback_parts, "• **Vraag 3**: Je gaf alleen 'zelden' (11.29%), maar de vraag vraagt 'zelden OF nooit': 11.29% + 61.29% → **72.58%**")
                  } else {
                    feedback_parts <- c(feedback_parts, "• **Vraag 3**: 'Zelden of nooit' = tel beide proporties op: 0.6129 + 0.1129 = 0.7258 × 100 → **72.58%**")
                  }
                }
              }
              
              if(!results$vraag4$correct) {
                if(!results$vraag4$exists) {
                  feedback_parts <- c(feedback_parts, "• **Vraag 4**: ❌ Variabele 'vraag4' niet gevonden. Vervang ??? door: `vraag4 <- 0.2097`")
                } else {
                  student_answer <- as.numeric(results$vraag4$value)
                  if(abs(student_answer - 0.0323) < 0.001) {
                    feedback_parts <- c(feedback_parts, "• **Vraag 4**: Je gaf alleen 'dikwijls' (0.0323), maar 'minstens dikwijls' = 'dikwijls' + 'zeer vaak': 0.0323 + 0.1774 → **0.2097**")
                  } else if(abs(student_answer - 20.97) < 0.1) {
                    feedback_parts <- c(feedback_parts, "• **Vraag 4**: Je gaf het percentage (20.97%), maar de vraag vraagt naar de proportie (tussen 0 en 1) → **0.2097**")
                  } else {
                    feedback_parts <- c(feedback_parts, "• **Vraag 4**: 'Minstens dikwijls' betekent 'dikwijls' + 'zeer vaak': 0.0323 + 0.1774 → **0.2097**")
                  }
                }
              }
              
              if(!results$vraag5$correct) {
                if(!results$vraag5$exists) {
                  feedback_parts <- c(feedback_parts, "• **Vraag 5**: ❌ Variabele 'vraag5' niet gevonden. Vervang ??? door: `vraag5 <- 2`")
                } else {
                  student_answer <- as.numeric(results$vraag5$value)
                  if(student_answer == 1) {
                    feedback_parts <- c(feedback_parts, "• **Vraag 5**: Optie 1 is fout. Als er 50 extra studenten bijkomen, stijgt N van 310 naar 360. Alle proporties veranderen omdat de noemer groter wordt → **Optie 2**")
                  } else if(student_answer == 3) {
                    feedback_parts <- c(feedback_parts, "• **Vraag 5**: Optie 3 is fout. Als N groter wordt (310→360), kunnen proporties niet hetzelfde blijven. Alle proporties worden kleiner behalve 'zeer vaak' → **Optie 2**")
                  } else if(student_answer == 4) {
                    feedback_parts <- c(feedback_parts, "• **Vraag 5**: Optie 4 is fout. Als N verandert van 310 naar 360, veranderen alle proporties (omdat je deelt door een ander getal) → **Optie 2**")
                  } else {
                    feedback_parts <- c(feedback_parts, "• **Vraag 5**: Als 50 extra studenten 'zeer vaak' antwoorden: N wordt 360, alle proporties veranderen → **Optie 2**")
                  }
                }
              }
              
              if(!results$vraag6$correct) {
                if(!results$vraag6$exists) {
                  feedback_parts <- c(feedback_parts, "• **Vraag 6**: ❌ Variabele 'vraag6' niet gevonden. Vervang ??? door: `vraag6 <- 245`")
                } else {
                  student_answer <- as.numeric(results$vraag6$value)
                  if(student_answer == 20) {
                    feedback_parts <- c(feedback_parts, "• **Vraag 6**: Je gaf alleen 'af en toe' (20), maar 'hoogstens af en toe' = 'nooit' + 'zelden' + 'af en toe': 190 + 35 + 20 → **245**")
                  } else if(student_answer == 225) {
                    feedback_parts <- c(feedback_parts, "• **Vraag 6**: Je gaf 225 ('nooit' + 'zelden'), maar 'hoogstens af en toe' moet ook 'af en toe' zelf erbij: 225 + 20 → **245**")
                  } else {
                    feedback_parts <- c(feedback_parts, "• **Vraag 6**: 'Hoogstens af en toe' = cumulatieve frequentie tot 'af en toe': 190 + 35 + 20 → **245** studenten")
                  }
                }
              }
            }
          }
          
          # Always add educational content
          feedback_parts <- c(feedback_parts, "\n**📖 Frequentietabel begrippen:**")
          feedback_parts <- c(feedback_parts, "• **Absolute frequentie**: Het aantal observaties in elke categorie")
          feedback_parts <- c(feedback_parts, "• **Proportie**: Het aandeel (tussen 0 en 1): frequentie ÷ totaal")
          feedback_parts <- c(feedback_parts, "• **Percentage**: Proportie × 100")
          feedback_parts <- c(feedback_parts, "• **Cumulatief**: Opgeteld tot en met die categorie")
          feedback_parts <- c(feedback_parts, "• **Minstens**: Die categorie en alle hogere")
          feedback_parts <- c(feedback_parts, "• **Hoogstens**: Die categorie en alle lagere")
          
          get_reporter()$add_message(paste(feedback_parts, collapse = "\n\n"), type = "markdown")
          
          generated == expected
        }
      )
    }
  )
})