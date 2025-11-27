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
            raw_val     <- get("vraag1", envir = env)
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
            raw_val     <- get("vraag2", envir = env)
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
            raw_val     <- get("vraag3", envir = env)
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
            raw_val     <- get("vraag4", envir = env)
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
            raw_val     <- get("vraag5", envir = env)
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
            raw_val     <- get("vraag6", envir = env)
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
          
          for (var_key in names(question_names)) {
            var_display <- question_names[var_key]
            result      <- results[[var_key]]
            
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
                "\n**📚 Uitleg waarom deze antwoorden fout zijn (met jouw antwoord én het juiste antwoord):**"
              )
              
              # ======================
              # VRAAG 1
              # ======================
              if (!results$vraag1$correct) {
                if (!results$vraag1$exists) {
                  feedback_parts <- c(
                    feedback_parts,
                    "• **Vraag 1**: ❌ Variabele `vraag1` niet gevonden. Vervang `???` door: `vraag1 <- 10` (juiste antwoord: **10**)."
                  )
                } else {
                  student_answer <- suppressWarnings(as.numeric(results$vraag1$value))
                  if (!is.na(student_answer) && student_answer == 55) {
                    feedback_parts <- c(
                      feedback_parts,
                      paste0(
                        "• **Vraag 1**: Je gaf **", student_answer, "**, maar dit is fout. ",
                        "Dat is de frequentie van *'zeer vaak'*. De vraag gaat over *'dikwijls'*. ",
                        "In de kolom *Absolute frequentie* bij de rij **'dikwijls'** staat **10**. ",
                        "Dus: jij gaf **", student_answer, "**, het juiste antwoord is **10**."
                      )
                    )
                  } else if (!is.na(student_answer) && student_answer == 255) {
                    feedback_parts <- c(
                      feedback_parts,
                      paste0(
                        "• **Vraag 1**: Je gaf **", student_answer, "**, maar dit is fout. ",
                        "Dat is de *cumulatieve frequentie* tot en met 'dikwijls'. ",
                        "De vraag vraagt alleen naar de frequentie van 'dikwijls' zelf: **10**. ",
                        "Dus: jij gaf **", student_answer, "**, het juiste antwoord is **10**."
                      )
                    )
                  } else if (!is.na(student_answer) &&
                             (abs(student_answer - 0.0323) < 0.0001 ||
                              abs(student_answer - 3.23)   < 0.01)) {
                    feedback_parts <- c(
                      feedback_parts,
                      paste0(
                        "• **Vraag 1**: Je gaf **", student_answer, "**, maar dit is fout. ",
                        "Dat is een proportie/percentage, terwijl de vraag naar het **aantal studenten** vraagt. ",
                        "De absolute frequentie bij 'dikwijls' is **10**. ",
                        "Dus: jij gaf **", student_answer, "**, het juiste antwoord is **10**."
                      )
                    )
                  } else {
                    feedback_parts <- c(
                      feedback_parts,
                      paste0(
                        "• **Vraag 1**: Je gaf **", results$vraag1$value, "**, maar dit is fout. ",
                        "Kijk in de rij 'dikwijls' onder *Absolute frequentie*: daar staat **10** studenten. ",
                        "Dus: jij gaf **", results$vraag1$value, "**, het juiste antwoord is **10**."
                      )
                    )
                  }
                }
              }
              
              # ======================
              # VRAAG 2
              # ======================
              if (!results$vraag2$correct) {
                if (!results$vraag2$exists) {
                  feedback_parts <- c(
                    feedback_parts,
                    "• **Vraag 2**: ❌ Variabele `vraag2` niet gevonden. Vervang `???` door: `vraag2 <- 3.23` (juiste antwoord: **3.23**%)."
                  )
                } else {
                  student_answer <- suppressWarnings(as.numeric(results$vraag2$value))
                  if (!is.na(student_answer) && abs(student_answer - 0.0323) < 0.001) {
                    feedback_parts <- c(
                      feedback_parts,
                      paste0(
                        "• **Vraag 2**: Je gaf **", student_answer, "**, maar dit is fout. ",
                        "Dit is de **proportie** (0.0323). De vraag vraagt naar het **percentage**. ",
                        "Vermenigvuldig met 100: 0.0323 × 100 = **3.23**%. ",
                        "Dus: jij gaf **", student_answer, "**, het juiste antwoord is **3.23**."
                      )
                    )
                  } else if (!is.na(student_answer) && student_answer == 10) {
                    feedback_parts <- c(
                      feedback_parts,
                      paste0(
                        "• **Vraag 2**: Je gaf **", student_answer, "**, maar dit is fout. ",
                        "Dat is het aantal studenten (absolute frequentie). ",
                        "Het percentage is: 10/310 × 100 = **3.23**%. ",
                        "Dus: jij gaf **", student_answer, "**, het juiste antwoord is **3.23**."
                      )
                    )
                  } else if (!is.na(student_answer) && abs(student_answer - 20.97) < 0.1) {
                    feedback_parts <- c(
                      feedback_parts,
                      paste0(
                        "• **Vraag 2**: Je gaf **", student_answer, "**, maar dit is fout. ",
                        "Dit is eerder het percentage voor 'minstens dikwijls'. ",
                        "Voor alleen 'dikwijls' is het percentage: 10/310 × 100 = **3.23**%. ",
                        "Dus: jij gaf **", student_answer, "**, het juiste antwoord is **3.23**."
                      )
                    )
                  } else {
                    feedback_parts <- c(
                      feedback_parts,
                      paste0(
                        "• **Vraag 2**: Je gaf **", results$vraag2$value, "**, maar dit is fout. ",
                        "Bereken: (aantal 'dikwijls' / totaal) × 100 = 10/310 × 100 ≈ **3.23**%. ",
                        "Dus: jij gaf **", results$vraag2$value, "**, het juiste antwoord is **3.23**."
                      )
                    )
                  }
                }
              }
              
              # ======================
              # VRAAG 3
              # ======================
              if (!results$vraag3$correct) {
                if (!results$vraag3$exists) {
                  feedback_parts <- c(
                    feedback_parts,
                    "• **Vraag 3**: ❌ Variabele `vraag3` niet gevonden. Vervang `???` door: `vraag3 <- 72.58` (juiste antwoord: **72.58**%)."
                  )
                } else {
                  student_answer <- suppressWarnings(as.numeric(results$vraag3$value))
                  if (!is.na(student_answer) && abs(student_answer - 61.29) < 0.1) {
                    feedback_parts <- c(
                      feedback_parts,
                      paste0(
                        "• **Vraag 3**: Je gaf **", student_answer, "**, maar dit is fout. ",
                        "Je nam alleen 'nooit' (61.29%). De vraag is 'zelden OF nooit'. ",
                        "Tel beide percentages op: 61.29% + 11.29% = **72.58**%. ",
                        "Dus: jij gaf **", student_answer, "**, het juiste antwoord is **72.58**."
                      )
                    )
                  } else if (!is.na(student_answer) && abs(student_answer - 11.29) < 0.1) {
                    feedback_parts <- c(
                      feedback_parts,
                      paste0(
                        "• **Vraag 3**: Je gaf **", student_answer, "**, maar dit is fout. ",
                        "Je nam alleen 'zelden' (11.29%). De vraag is 'zelden OF nooit'. ",
                        "Tel beide percentages op: 11.29% + 61.29% = **72.58**%. ",
                        "Dus: jij gaf **", student_answer, "**, het juiste antwoord is **72.58**."
                      )
                    )
                  } else if (!is.na(student_answer) && abs(student_answer - 0.7258) < 0.001) {
                    feedback_parts <- c(
                      feedback_parts,
                      paste0(
                        "• **Vraag 3**: Je gaf **", student_answer, "**, maar dit is fout. ",
                        "Dat is de proportie (0.7258). De vraag vraagt naar het **percentage**. ",
                        "0.7258 × 100 = **72.58**%. ",
                        "Dus: jij gaf **", student_answer, "**, het juiste antwoord is **72.58**."
                      )
                    )
                  } else {
                    feedback_parts <- c(
                      feedback_parts,
                      paste0(
                        "• **Vraag 3**: Je gaf **", results$vraag3$value, "**, maar dit is fout. ",
                        "Tel de percentages van 'zelden' en 'nooit' op: 11.29% + 61.29% = **72.58**%. ",
                        "Dus: jij gaf **", results$vraag3$value, "**, het juiste antwoord is **72.58**."
                      )
                    )
                  }
                }
              }
              
              # ======================
              # VRAAG 4
              # ======================
              if (!results$vraag4$correct) {
                if (!results$vraag4$exists) {
                  feedback_parts <- c(
                    feedback_parts,
                    "• **Vraag 4**: ❌ Variabele `vraag4` niet gevonden. Vervang `???` door: `vraag4 <- 0.2097` (juiste antwoord: **0.2097**)."
                  )
                } else {
                  student_answer <- suppressWarnings(as.numeric(results$vraag4$value))
                  if (!is.na(student_answer) && abs(student_answer - 0.0323) < 0.001) {
                    feedback_parts <- c(
                      feedback_parts,
                      paste0(
                        "• **Vraag 4**: Je gaf **", student_answer, "**, maar dit is fout. ",
                        "Je nam alleen de proportie voor 'dikwijls' (0.0323). ",
                        "'Minstens dikwijls' = 'dikwijls' + 'zeer vaak': 0.0323 + 0.1774 = **0.2097**. ",
                        "Dus: jij gaf **", student_answer, "**, het juiste antwoord is **0.2097**."
                      )
                    )
                  } else if (!is.na(student_answer) && abs(student_answer - 0.1774) < 0.001) {
                    feedback_parts <- c(
                      feedback_parts,
                      paste0(
                        "• **Vraag 4**: Je gaf **", student_answer, "**, maar dit is fout. ",
                        "Je nam alleen de proportie voor 'zeer vaak' (0.1774). ",
                        "'Minstens dikwijls' = 'dikwijls' + 'zeer vaak': 0.0323 + 0.1774 = **0.2097**. ",
                        "Dus: jij gaf **", student_answer, "**, het juiste antwoord is **0.2097**."
                      )
                    )
                  } else if (!is.na(student_answer) && abs(student_answer - 20.97) < 0.1) {
                    feedback_parts <- c(
                      feedback_parts,
                      paste0(
                        "• **Vraag 4**: Je gaf **", student_answer, "**, maar dit is fout. ",
                        "Je gaf het **percentage** (20.97%). De vraag vraagt naar de **proportie** (tussen 0 en 1). ",
                        "De proportie is 20.97/100 = **0.2097**. ",
                        "Dus: jij gaf **", student_answer, "**, het juiste antwoord is **0.2097**."
                      )
                    )
                  } else {
                    feedback_parts <- c(
                      feedback_parts,
                      paste0(
                        "• **Vraag 4**: Je gaf **", results$vraag4$value, "**, maar dit is fout. ",
                        "'Minstens dikwijls' = proportie('dikwijls') + proportie('zeer vaak'): 0.0323 + 0.1774 = **0.2097**. ",
                        "Dus: jij gaf **", results$vraag4$value, "**, het juiste antwoord is **0.2097**."
                      )
                    )
                  }
                }
              }
              
              # ======================
              # VRAAG 5
              # ======================
              if (!results$vraag5$correct) {
                if (!results$vraag5$exists) {
                  feedback_parts <- c(
                    feedback_parts,
                    "• **Vraag 5**: ❌ Variabele `vraag5` niet gevonden. Vervang `???` door: `vraag5 <- 2` (juiste antwoord: **2**)."
                  )
                } else {
                  student_answer <- suppressWarnings(as.numeric(results$vraag5$value))
                  if (!is.na(student_answer) && student_answer == 1) {
                    feedback_parts <- c(
                      feedback_parts,
                      paste0(
                        "• **Vraag 5**: Je gaf **1**, maar dit is fout. ",
                        "Als 50 extra studenten 'zeer vaak' antwoorden, verandert N van 310 naar 360. ",
                        "Alle proporties veranderen omdat je door een ander totaal deelt. ",
                        "Het juiste antwoord is **2**: alle proporties veranderen. "
                      )
                    )
                  } else if (!is.na(student_answer) && student_answer == 3) {
                    feedback_parts <- c(
                      feedback_parts,
                      paste0(
                        "• **Vraag 5**: Je gaf **3**, maar dit is fout. ",
                        "Proporties kunnen niet hetzelfde blijven als N verandert van 310 naar 360. ",
                        "Het juiste antwoord is **2**: alle proporties veranderen. "
                      )
                    )
                  } else if (!is.na(student_answer) && student_answer == 4) {
                    feedback_parts <- c(
                      feedback_parts,
                      paste0(
                        "• **Vraag 5**: Je gaf **4**, maar dit is fout. ",
                        "Omdat N verandert, veranderen automatisch alle proporties. ",
                        "Het juiste antwoord is **2**: alle proporties veranderen. "
                      )
                    )
                  } else {
                    feedback_parts <- c(
                      feedback_parts,
                      paste0(
                        "• **Vraag 5**: Je gaf **", results$vraag5$value, "**, maar dit is fout. ",
                        "Het juiste antwoord is **2**: alle proporties veranderen als er 50 extra 'zeer vaak'-respondenten bijkomen. "
                      )
                    )
                  }
                }
              }
              
              # ======================
              # VRAAG 6
              # ======================
              if (!results$vraag6$correct) {
                if (!results$vraag6$exists) {
                  feedback_parts <- c(
                    feedback_parts,
                    "• **Vraag 6**: ❌ Variabele `vraag6` niet gevonden. Vervang `???` door: `vraag6 <- 245` (juiste antwoord: **245**)."
                  )
                } else {
                  student_answer <- suppressWarnings(as.numeric(results$vraag6$value))
                  if (!is.na(student_answer) && student_answer == 20) {
                    feedback_parts <- c(
                      feedback_parts,
                      paste0(
                        "• **Vraag 6**: Je gaf **20**, maar dit is fout. ",
                        "Dat is alleen de frequentie van 'af en toe'. ",
                        "'Hoogstens af en toe' = 'nooit' + 'zelden' + 'af en toe': 190 + 35 + 20 = **245**. ",
                        "Dus: jij gaf **20**, het juiste antwoord is **245**."
                      )
                    )
                  } else if (!is.na(student_answer) && student_answer == 225) {
                    feedback_parts <- c(
                      feedback_parts,
                      paste0(
                        "• **Vraag 6**: Je gaf **225**, maar dit is fout. ",
                        "Dat is 'nooit' + 'zelden'. Je moet ook 'af en toe' erbij tellen: 225 + 20 = **245**. ",
                        "Dus: jij gaf **225**, het juiste antwoord is **245**."
                      )
                    )
                  } else if (!is.na(student_answer) && student_answer == 310) {
                    feedback_parts <- c(
                      feedback_parts,
                      paste0(
                        "• **Vraag 6**: Je gaf **310**, maar dit is fout. ",
                        "310 is het **totale aantal** studenten, niet 'hoogstens af en toe'. ",
                        "Voor 'hoogstens af en toe' tel je: 190 + 35 + 20 = **245**. ",
                        "Dus: jij gaf **310**, het juiste antwoord is **245**."
                      )
                    )
                  } else {
                    feedback_parts <- c(
                      feedback_parts,
                      paste0(
                        "• **Vraag 6**: Je gaf **", results$vraag6$value, "**, maar dit is fout. ",
                        "'Hoogstens af en toe' = cumulatieve frequentie t.e.m. 'af en toe': 190 + 35 + 20 = **245** studenten. ",
                        "Dus: jij gaf **", results$vraag6$value, "**, het juiste antwoord is **245**."
                      )
                    )
                  }
                }
              }
            }
          }
          
          # Extra uitleg
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
