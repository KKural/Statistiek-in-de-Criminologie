context({
  testcase(
    "",
    {
      testEqual(
        " ",
        function(env) {
          # Use the provided environment (env) instead of globalenv()
          results <- list()
          
          # Helper: safely coerce to numeric (like in your right system)
          safe_as_numeric <- function(x, env) {
            if (is.numeric(x)) {
              return(as.numeric(x))
            } else {
              out <- suppressWarnings(as.numeric(x))
              if (!all(is.na(out))) return(out)
              # try eval if it's an expression
              tryCatch({
                out2 <- suppressWarnings(as.numeric(eval(x, envir = env)))
                out2
              }, error = function(e) {
                NA_real_
              })
            }
          }
          
          # =========================
          # EXPECTED VALUES
          # =========================
          expected_vraag1 <- 10        # aantal 'dikwijls'
          expected_vraag2 <- 3.23      # percentage 'dikwijls'
          expected_vraag3 <- 72.58     # % zelden of nooit
          expected_vraag4 <- 0.2097    # proportie minstens dikwijls
          expected_vraag5 <- 2         # juiste antwoord meerkeuze
          expected_vraag6 <- 245       # hoogstens af en toe (N)
          
          # =========================
          # VRAAG 1
          # =========================
          if (exists("vraag1", envir = env)) {
            raw_val    <- get("vraag1", envir = env)
            current_val <- safe_as_numeric(raw_val, env)
            
            results$vraag1 <- list(
              exists  = TRUE,
              value   = raw_val,
              correct = !is.na(current_val) && current_val == expected_vraag1,
              expected = expected_vraag1
            )
          } else {
            results$vraag1 <- list(
              exists  = FALSE,
              value   = NA,
              correct = FALSE,
              expected = expected_vraag1
            )
          }
          
          # =========================
          # VRAAG 2
          # =========================
          if (exists("vraag2", envir = env)) {
            raw_val    <- get("vraag2", envir = env)
            current_val <- safe_as_numeric(raw_val, env)
            
            results$vraag2 <- list(
              exists  = TRUE,
              value   = raw_val,
              correct = !is.na(current_val) && abs(current_val - expected_vraag2) < 0.01,
              expected = expected_vraag2
            )
          } else {
            results$vraag2 <- list(
              exists  = FALSE,
              value   = NA,
              correct = FALSE,
              expected = expected_vraag2
            )
          }
          
          # =========================
          # VRAAG 3
          # =========================
          if (exists("vraag3", envir = env)) {
            raw_val    <- get("vraag3", envir = env)
            current_val <- safe_as_numeric(raw_val, env)
            
            results$vraag3 <- list(
              exists  = TRUE,
              value   = raw_val,
              correct = !is.na(current_val) && abs(current_val - expected_vraag3) < 0.01,
              expected = expected_vraag3
            )
          } else {
            results$vraag3 <- list(
              exists  = FALSE,
              value   = NA,
              correct = FALSE,
              expected = expected_vraag3
            )
          }
          
          # =========================
          # VRAAG 4
          # =========================
          if (exists("vraag4", envir = env)) {
            raw_val    <- get("vraag4", envir = env)
            current_val <- safe_as_numeric(raw_val, env)
            
            results$vraag4 <- list(
              exists  = TRUE,
              value   = raw_val,
              correct = !is.na(current_val) && abs(current_val - expected_vraag4) < 0.001,
              expected = expected_vraag4
            )
          } else {
            results$vraag4 <- list(
              exists  = FALSE,
              value   = NA,
              correct = FALSE,
              expected = expected_vraag4
            )
          }
          
          # =========================
          # VRAAG 5
          # =========================
          if (exists("vraag5", envir = env)) {
            raw_val    <- get("vraag5", envir = env)
            current_val <- safe_as_numeric(raw_val, env)
            
            results$vraag5 <- list(
              exists  = TRUE,
              value   = raw_val,
              correct = !is.na(current_val) && current_val == expected_vraag5,
              expected = expected_vraag5
            )
          } else {
            results$vraag5 <- list(
              exists  = FALSE,
              value   = NA,
              correct = FALSE,
              expected = expected_vraag5
            )
          }
          
          # =========================
          # VRAAG 6
          # =========================
          if (exists("vraag6", envir = env)) {
            raw_val    <- get("vraag6", envir = env)
            current_val <- safe_as_numeric(raw_val, env)
            
            results$vraag6 <- list(
              exists  = TRUE,
              value   = raw_val,
              correct = !is.na(current_val) && current_val == expected_vraag6,
              expected = expected_vraag6
            )
          } else {
            results$vraag6 <- list(
              exists  = FALSE,
              value   = NA,
              correct = FALSE,
              expected = expected_vraag6
            )
          }
          
          # Store results for use in comparator (same pattern)
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
          
          for(var_key in names(question_names)) {
            var_display <- question_names[var_key]
            result <- results[[var_key]]
            
            if (!result$exists) {
              feedback_parts <- c(
                feedback_parts,
                paste0("**", var_display, "**: *Ontbreekt* ❌")
              )
            } else if (result$correct) {
              feedback_parts <- c(
                feedback_parts,
                paste0("**", var_display, "**: ", result$value, " ✅")
              )
            } else {
              feedback_parts <- c(
                feedback_parts,
                paste0("**", var_display, "**: ", result$value, " ❌")
              )
            }
          }
          
          if (generated == expected) {
            feedback_parts <- c(
              feedback_parts,
              "\n✅ **Alle vragen correct beantwoord!**",
              "\n**Uitstekend!** Je beheerst het lezen van frequentietabellen perfect."
            )
          } else {
            # Add helpful tips for incorrect answers
            incorrect_vars <- sapply(results, function(x) !x$correct)
            if (any(incorrect_vars)) {
              feedback_parts <- c(
                feedback_parts,
                "\n**📚 Uitleg waarom deze antwoorden fout zijn:**"
              )
              
              # ---- Vraag 1 ----
              if (!results$vraag1$correct) {
                if (!results$vraag1$exists) {
                  feedback_parts <- c(
                    feedback_parts,
                    "• **Vraag 1**: ❌ Variabele `vraag1` niet gevonden. Vervang `???` door: `vraag1 <- 10`"
                  )
                } else {
                  student_answer <- suppressWarnings(as.numeric(results$vraag1$value))
                  if (!is.na(student_answer) && student_answer == 55) {
                    feedback_parts <- c(
                      feedback_parts,
                      "• **Vraag 1**: Je antwoordde 55, maar dat is de frequentie van 'zeer vaak'. Zoek in de kolom *Absolute frequentie* bij rij **'dikwijls'** → **10**."
                    )
                  } else if (!is.na(student_answer) && student_answer == 255) {
                    feedback_parts <- c(
                      feedback_parts,
                      "• **Vraag 1**: Je antwoordde 255, maar dat is de *cumulatieve* frequentie tot 'dikwijls'. De absolute frequentie van **alleen** 'dikwijls' is → **10**."
                    )
                  } else if (!is.na(student_answer) &&
                             (abs(student_answer - 0.0323) < 0.0001 ||
                              abs(student_answer - 3.23)   < 0.01)) {
                    feedback_parts <- c(
                      feedback_parts,
                      "• **Vraag 1**: Je gaf een proportie of percentage, maar de vraag vraagt naar het **aantal studenten** (absolute frequentie) → **10**."
                    )
                  } else {
                    feedback_parts <- c(
                      feedback_parts,
                      "• **Vraag 1**: Kijk in de rij 'dikwijls' onder *Absolute frequentie*: daar staat **10** studenten."
                    )
                  }
                }
              }
              
              # ---- Vraag 2 ----
              if (!results$vraag2$correct) {
                if (!results$vraag2$exists) {
                  feedback_parts <- c(
                    feedback_parts,
                    "• **Vraag 2**: ❌ Variabele `vraag2` niet gevonden. Vervang `???` door: `vraag2 <- 3.23`"
                  )
                } else {
                  student_answer <- suppressWarnings(as.numeric(results$vraag2$value))
                  if (!is.na(student_answer) && abs(student_answer - 0.0323) < 0.001) {
                    feedback_parts <- c(
                      feedback_parts,
                      "• **Vraag 2**: Je gaf de **proportie** (0.0323), maar de vraag vraagt naar het **percentage**. Vermenigvuldig met 100 → **3.23%**."
                    )
                  } else if (!is.na(student_answer) && student_answer == 10) {
                    feedback_parts <- c(
                      feedback_parts,
                      "• **Vraag 2**: Je gaf de absolute frequentie (10), maar de vraag vraagt naar het **percentage**: 10/310 × 100 → **3.23%**."
                    )
                  } else {
                    feedback_parts <- c(
                      feedback_parts,
                      "• **Vraag 2**: Bereken: (aantal 'dikwijls' / totaal) × 100 = 10/310 × 100 ≈ **3.23%**."
                    )
                  }
                }
              }
              
              # ---- Vraag 3 ----
              if (!results$vraag3$correct) {
                if (!results$vraag3$exists) {
                  feedback_parts <- c(
                    feedback_parts,
                    "• **Vraag 3**: ❌ Variabele `vraag3` niet gevonden. Vervang `???` door: `vraag3 <- 72.58`"
                  )
                } else {
                  student_answer <- suppressWarnings(as.numeric(results$vraag3$value))
                  if (!is.na(student_answer) && abs(student_answer - 61.29) < 0.1) {
                    feedback_parts <- c(
                      feedback_parts,
                      "• **Vraag 3**: Je gaf alleen 'nooit' (61.29%), maar de vraag vraagt **'zelden of nooit'**: 61.29% + 11.29% → **72.58%**."
                    )
                  } else if (!is.na(student_answer) && abs(student_answer - 11.29) < 0.1) {
                    feedback_parts <- c(
                      feedback_parts,
                      "• **Vraag 3**: Je gaf alleen 'zelden' (11.29%), maar de vraag vraagt **'zelden of nooit'**: 11.29% + 61.29% → **72.58%**."
                    )
                  } else {
                    feedback_parts <- c(
                      feedback_parts,
                      "• **Vraag 3**: Tel de percentages van 'zelden' en 'nooit' op: 11.29% + 61.29% = **72.58%**."
                    )
                  }
                }
              }
              
              # ---- Vraag 4 ----
              if (!results$vraag4$correct) {
                if (!results$vraag4$exists) {
                  feedback_parts <- c(
                    feedback_parts,
                    "• **Vraag 4**: ❌ Variabele `vraag4` niet gevonden. Vervang `???` door: `vraag4 <- 0.2097`"
                  )
                } else {
                  student_answer <- suppressWarnings(as.numeric(results$vraag4$value))
                  if (!is.na(student_answer) && abs(student_answer - 0.0323) < 0.001) {
                    feedback_parts <- c(
                      feedback_parts,
                      "• **Vraag 4**: Je nam alleen 'dikwijls' (0.0323), maar 'minstens dikwijls' = 'dikwijls' + 'zeer vaak': 0.0323 + 0.1774 → **0.2097**."
                    )
                  } else if (!is.na(student_answer) && abs(student_answer - 20.97) < 0.1) {
                    feedback_parts <- c(
                      feedback_parts,
                      "• **Vraag 4**: Je gaf het **percentage** (20.97%), maar de vraag vraagt naar de **proportie** (tussen 0 en 1) → **0.2097**."
                    )
                  } else {
                    feedback_parts <- c(
                      feedback_parts,
                      "• **Vraag 4**: 'Minstens dikwijls' = proportie 'dikwijls' + 'zeer vaak': 0.0323 + 0.1774 = **0.2097**."
                    )
                  }
                }
              }
              
              # ---- Vraag 5 ----
              if (!results$vraag5$correct) {
                if (!results$vraag5$exists) {
                  feedback_parts <- c(
                    feedback_parts,
                    "• **Vraag 5**: ❌ Variabele `vraag5` niet gevonden. Vervang `???` door: `vraag5 <- 2`"
                  )
                } else {
                  student_answer <- suppressWarnings(as.numeric(results$vraag5$value))
                  if (!is.na(student_answer) && student_answer == 1) {
                    feedback_parts <- c(
                      feedback_parts,
                      "• **Vraag 5**: Optie 1 is fout. Als 50 extra studenten 'zeer vaak' antwoorden, stijgt N van 310 naar 360. **Alle proporties veranderen** omdat je door een ander totaal deelt → **optie 2**."
                    )
                  } else if (!is.na(student_answer) && student_answer == 3) {
                    feedback_parts <- c(
                      feedback_parts,
                      "• **Vraag 5**: Optie 3 is fout. De proporties kunnen niet gelijk blijven als N verandert van 310 naar 360. → **optie 2**."
                    )
                  } else if (!is.na(student_answer) && student_answer == 4) {
                    feedback_parts <- c(
                      feedback_parts,
                      "• **Vraag 5**: Optie 4 is fout. Als N verandert, veranderen de proporties automatisch (andere noemer). → **optie 2**."
                    )
                  } else {
                    feedback_parts <- c(
                      feedback_parts,
                      "• **Vraag 5**: Het juiste antwoord is **2**: alle proporties veranderen, ook die van 'zeer vaak'."
                    )
                  }
                }
              }
              
              # ---- Vraag 6 ----
              if (!results$vraag6$correct) {
                if (!results$vraag6$exists) {
                  feedback_parts <- c(
                    feedback_parts,
                    "• **Vraag 6**: ❌ Variabele `vraag6` niet gevonden. Vervang `???` door: `vraag6 <- 245`"
                  )
                } else {
                  student_answer <- suppressWarnings(as.numeric(results$vraag6$value))
                  if (!is.na(student_answer) && student_answer == 20) {
                    feedback_parts <- c(
                      feedback_parts,
                      "• **Vraag 6**: Je nam alleen 'af en toe' (20), maar 'hoogstens af en toe' = 'nooit' + 'zelden' + 'af en toe': 190 + 35 + 20 = **245**."
                    )
                  } else if (!is.na(student_answer) && student_answer == 225) {
                    feedback_parts <- c(
                      feedback_parts,
                      "• **Vraag 6**: Je telde 'nooit' + 'zelden' (225), maar 'hoogstens af en toe' moet ook 'af en toe' erbij: 225 + 20 = **245**."
                    )
                  } else {
                    feedback_parts <- c(
                      feedback_parts,
                      "• **Vraag 6**: 'Hoogstens af en toe' = cumulatieve frequentie tot en met 'af en toe': 190 + 35 + 20 = **245** studenten."
                    )
                  }
                }
              }
            }
          }
          
          # Extra uitleg (als in je andere systeem)
          feedback_parts <- c(
            feedback_parts,
            "",
            "**📖 Frequentietabel begrippen:**",
            "• **Absolute frequentie**: aantal observaties in elke categorie",
            "• **Proportie**: aandeel tussen 0 en 1 (frequentie ÷ totaal)",
            "• **Percentage**: proportie × 100",
            "• **Cumulatief**: opgeteld tot en met die categorie",
            "• **Minstens**: die categorie en alle hogere",
            "• **Hoogstens**: die categorie en alle lagere"
          )
          
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
