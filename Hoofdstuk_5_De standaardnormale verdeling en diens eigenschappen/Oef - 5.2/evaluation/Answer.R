context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          results <- list()

          # Expected answers for Exercise 5.2: European Football Academy
          # Normal distribution N(75, 10) - test scores in percentage
          
          # Question A - Z-scores for 65% and 80%
          exp_z65 <- -1.0
          exp_z80 <- 0.5
          
          # Question B - P(65 ≤ X ≤ 79) = 53.28%
          exp_trainen <- 53.28
          
          # Question C - P(X ≥ 80) = 30.85%  
          exp_spelen <- 30.85
          
          # Question D - Numbers for 50 students
          exp_aantal_trainen <- 27
          exp_aantal_spelen <- 15

          # Helper function to check each answer
          check_value <- function(varname, expected, tol = 0.01, expect_percent = FALSE) {
            if (!exists(varname, envir = env)) {
              return(list(exists = FALSE, value = NA, correct = FALSE, expected = expected))
            }
            val <- get(varname, envir = env)
            
            if (expect_percent) {
              # Handle percentage strings like "53.28%"
              if (is.character(val) && grepl("%$", val)) {
                val_num <- suppressWarnings(as.numeric(gsub("%$", "", val)))
              } else {
                val_num <- suppressWarnings(as.numeric(val))
              }
            } else {
              val_num <- suppressWarnings(as.numeric(val))
            }
            
            correct <- !is.na(val_num) && abs(val_num - expected) < tol
            return(list(exists = TRUE, value = val, correct = correct, expected = expected))
          }

          # Check all answers
          results$z_65 <- check_value("z_65", exp_z65, tol = 0.05, expect_percent = FALSE)
          results$z_80 <- check_value("z_80", exp_z80, tol = 0.05, expect_percent = FALSE)
          results$percentage_trainen <- check_value("percentage_trainen", exp_trainen, tol = 0.5, expect_percent = FALSE)
          results$percentage_spelen <- check_value("percentage_spelen", exp_spelen, tol = 0.5, expect_percent = FALSE)
          results$aantal_trainen <- check_value("aantal_trainen", exp_aantal_trainen, tol = 1, expect_percent = FALSE)
          results$aantal_spelen <- check_value("aantal_spelen", exp_aantal_spelen, tol = 1, expect_percent = FALSE)

          assign("detailed_results", results, envir = globalenv())

          all_correct <- all(sapply(results, function(x) x$correct))
          return(all_correct)
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("detailed_results", envir = globalenv())

          qnames <- c(
            z_65 = "Z-score voor 65%",
            z_80 = "Z-score voor 80%", 
            percentage_trainen = "Percentage dat mag trainen (65-79%)",
            percentage_spelen = "Percentage dat mag spelen (≥80%)",
            aantal_trainen = "Aantal spelers dat mag trainen (van 50)",
            aantal_spelen = "Aantal spelers dat mag spelen (van 50)"
          )

          # Helper function for parsing student answers
          parse_num <- function(val) {
            if (is.character(val) && grepl("%$", val)) {
              val <- gsub("%$", "", val)
            }
            suppressWarnings(as.numeric(val))
          }

          # --- DIAGNOSTIC FUNCTIONS ---

          wrong_msg_z65 <- function(val) {
            val_num <- parse_num(val)
            if (is.na(val_num)) {
              return("Je antwoord kon niet als getal geïnterpreteerd worden. Het juiste antwoord is -1.0.")
            }

            if (abs(val_num - 1.0) < 0.1) {
              return("**Waarom dit fout is:** Je berekende +1.0 in plaats van -1.0.\n\n**Wat je miste:** 65% ligt ONDER het gemiddelde van 75%, dus de Z-score moet negatief zijn.\n\n**Correctie:** Z = (65-75)/10 = -10/10 = **-1.0**")
            }
            
            if (abs(val_num - (-0.65)) < 0.1) {
              return("**Waarom dit fout is:** Je gebruikte waarschijnlijk 65 in plaats van (65-75).\n\n**Controleer:** Z = (X - μ) / σ = (65 - 75) / 10 = -10/10 = **-1.0**")
            }

            return(paste0(
              "**Je antwoord ", val, " is niet correct.**\n\n",
              "**Stap-voor-stap controle:**\n",
              "1. **Formule:** Z = (X - μ) / σ ✓\n",
              "2. **Invullen:** Z = (65 - 75) / 10 ✓\n", 
              "3. **Berekening:** Z = -10 / 10 = **-1.0** ✓"
            ))
          }

          wrong_msg_z80 <- function(val) {
            val_num <- parse_num(val)
            if (is.na(val_num)) {
              return("Je antwoord kon niet als getal geïnterpreteerd worden. Het juiste antwoord is 0.5.")
            }

            if (abs(val_num - (-0.5)) < 0.1) {
              return("**Waarom dit fout is:** Je berekende -0.5 in plaats van +0.5.\n\n**Wat je miste:** 80% ligt BOVEN het gemiddelde van 75%, dus de Z-score moet positief zijn.\n\n**Correctie:** Z = (80-75)/10 = 5/10 = **+0.5**")
            }
            
            if (abs(val_num - 8.0) < 0.1) {
              return("**Waarom dit fout is:** Je gebruikte waarschijnlijk 80 in plaats van (80-75).\n\n**Controleer:** Z = (X - μ) / σ = (80 - 75) / 10 = 5/10 = **0.5**")
            }

            return(paste0(
              "**Je antwoord ", val, " is niet correct.**\n\n",
              "**Stap-voor-stap controle:**\n",
              "1. **Formule:** Z = (X - μ) / σ ✓\n",
              "2. **Invullen:** Z = (80 - 75) / 10 ✓\n", 
              "3. **Berekening:** Z = 5 / 10 = **0.5** ✓"
            ))
          }

          wrong_msg_trainen <- function(val) {
            val_num <- parse_num(val)
            if (is.na(val_num)) {
              return("Je antwoord kon niet als getal geïnterpreteerd worden. Het juiste antwoord is 53.28%.")
            }

            # Common Z-table reading errors
            if (abs(val_num - 84.13) < 0.5) {
              return("**Waarom dit fout is:** Je berekende het complement.\n\n**Wat je miste:** We willen P(65 ≤ X ≤ 79), niet de rest.\n\n**Correctie:** P(Z ≤ 0.4) - P(Z ≤ -1.0) = 0.6554 - 0.1587 = **0.5328 = 53.28%**")
            }
            
            if (abs(val_num - 65.54) < 0.5) {
              return("**Waarom dit fout is:** Je vergat de linkerkant af te trekken.\n\n**Wat je miste:** Voor een interval moet je P(Z ≤ 0.4) - P(Z ≤ -1.0) doen.\n\n**Correctie:** 0.6554 - 0.1587 = **53.28%**")
            }
            
            if (abs(val_num - 15.87) < 0.5) {
              return("**Waarom dit fout is:** Je berekende alleen P(Z ≤ -1.0).\n\n**Controleer:** Voor interval P(65 ≤ X ≤ 79) = P(-1 ≤ Z ≤ 0.4) = 0.6554 - 0.1587 = **53.28%**")
            }

            return(paste0(
              "**Je antwoord ", val, "% is niet correct.**\n\n",
              "**Stap-voor-stap controle:**\n",
              "1. **Z-scores:** 65% → Z = -1.0, 79% → Z = 0.4 ✓\n",
              "2. **Z-tabel:** P(Z ≤ -1.0) = 0.1587, P(Z ≤ 0.4) = 0.6554 ✓\n",
              "3. **Interval:** 0.6554 - 0.1587 = 0.5328 = **53.28%** ✓"
            ))
          }

          wrong_msg_spelen <- function(val) {
            val_num <- parse_num(val)
            if (is.na(val_num)) {
              return("Je antwoord kon niet als getal geïnterpreteerd worden. Het juiste antwoord is 30.85%.")
            }

            if (abs(val_num - 69.15) < 0.5) {
              return("**Waarom dit fout is:** Je berekende P(Z ≤ 0.5) in plaats van P(Z ≥ 0.5).\n\n**Wat je miste:** We willen ≥80%, dus het complement: 1 - P(Z ≤ 0.5).\n\n**Correctie:** 1 - 0.6915 = **0.3085 = 30.85%**")
            }
            
            if (abs(val_num - 50.0) < 0.5) {
              return("**Waarom dit fout is:** 50% suggereert dat je geen Z-tabel gebruikte.\n\n**Controleer:** P(X ≥ 80) = P(Z ≥ 0.5) = 1 - P(Z ≤ 0.5) = 1 - 0.6915 = **30.85%**")
            }

            return(paste0(
              "**Je antwoord ", val, "% is niet correct.**\n\n",
              "**Stap-voor-stap controle:**\n",
              "1. **Z-score:** 80% → Z = (80-75)/10 = 0.5 ✓\n",
              "2. **Z-tabel:** P(Z ≤ 0.5) = 0.6915 ✓\n",
              "3. **Complement:** P(Z ≥ 0.5) = 1 - 0.6915 = **30.85%** ✓"
            ))
          }

          wrong_msg_aantal_trainen <- function(val) {
            val_num <- parse_num(val)
            if (is.na(val_num)) {
              return("Je antwoord kon niet als getal geïnterpreteerd worden. Het juiste antwoord is 27.")
            }

            if (abs(val_num - 26) < 1) {
              return("**Bijna correct!** Je berekening is juist, maar rond af naar het dichtstbijzijnde hele getal.\n\n**Correctie:** 50 × 0.5328 = 26.64 ≈ **27 spelers**")
            }

            return(paste0(
              "**Je antwoord ", val, " is niet correct.**\n\n",
              "**Stap-voor-stap controle:**\n",
              "1. **Percentage trainen:** 53.28% ✓\n",
              "2. **Berekening:** 50 × 0.5328 = 26.64 ✓\n",
              "3. **Afronden:** **27 spelers** ✓"
            ))
          }

          wrong_msg_aantal_spelen <- function(val) {
            val_num <- parse_num(val)
            if (is.na(val_num)) {
              return("Je antwoord kon niet als getal geïnterpreteerd worden. Het juiste antwoord is 15.")
            }

            if (abs(val_num - 15) < 1) {
              return("**Bijna correct!** Je berekening is juist, maar rond af naar het dichtstbijzijnde hele getal.\n\n**Correctie:** 50 × 0.3085 = 15.425 ≈ **15 spelers**")
            }

            return(paste0(
              "**Je antwoord ", val, " is niet correct.**\n\n",
              "**Stap-voor-stap controle:**\n",
              "1. **Percentage spelen:** 30.85% ✓\n",
              "2. **Berekening:** 50 × 0.3085 = 15.425 ✓\n",
              "3. **Afronden:** **15 spelers** ✓"
            ))
          }

          # --- BUILD FEEDBACK TEXT ---

          feedback_text <- "**Gegeven:** \n- Toetsscores: N(75, 10)%\n- Regels: <65% = niet deelnemen, 65-79% = trainen, ≥80% = spelen\n\n"

          # Question A: Z-scores
          q <- "z_65"
          if (results[[q]]$exists) {
            if (results[[q]]$correct) {
              feedback_text <- paste0(
                feedback_text,
                "✅ ", qnames[[q]], " **Correct! (", results[[q]]$value, ")**\n\n"
              )
            } else {
              msg <- wrong_msg_z65(results[[q]]$value)
              feedback_text <- paste0(
                feedback_text,
                "❌ ", qnames[[q]], " **Fout.**\n\n",
                msg, "\n\n"
              )
            }
          } else {
            feedback_text <- paste0(
              feedback_text,
              "❌ ", qnames[[q]], " **Je hebt geen antwoord gegeven.**\n\n"
            )
          }

          q <- "z_80"
          if (results[[q]]$exists) {
            if (results[[q]]$correct) {
              feedback_text <- paste0(
                feedback_text,
                "✅ ", qnames[[q]], " **Correct! (", results[[q]]$value, ")**\n\n"
              )
            } else {
              msg <- wrong_msg_z80(results[[q]]$value)
              feedback_text <- paste0(
                feedback_text,
                "❌ ", qnames[[q]], " **Fout.**\n\n",
                msg, "\n\n"
              )
            }
          } else {
            feedback_text <- paste0(
              feedback_text,
              "❌ ", qnames[[q]], " **Je hebt geen antwoord gegeven.**\n\n"
            )
          }

          # Question B: Training percentage
          q <- "percentage_trainen"
          if (results[[q]]$exists) {
            if (results[[q]]$correct) {
              feedback_text <- paste0(
                feedback_text,
                "✅ ", qnames[[q]], " **Correct! (", results[[q]]$value, "%)**\n\n"
              )
            } else {
              msg <- wrong_msg_trainen(results[[q]]$value)
              feedback_text <- paste0(
                feedback_text,
                "❌ ", qnames[[q]], " **Fout.**\n\n",
                msg, "\n\n"
              )
            }
          } else {
            feedback_text <- paste0(
              feedback_text,
              "❌ ", qnames[[q]], " **Je hebt geen antwoord gegeven.**\n\n"
            )
          }

          # Question C: Playing percentage
          q <- "percentage_spelen"
          if (results[[q]]$exists) {
            if (results[[q]]$correct) {
              feedback_text <- paste0(
                feedback_text,
                "✅ ", qnames[[q]], " **Correct! (", results[[q]]$value, "%)**\n\n"
              )
            } else {
              msg <- wrong_msg_spelen(results[[q]]$value)
              feedback_text <- paste0(
                feedback_text,
                "❌ ", qnames[[q]], " **Fout.**\n\n",
                msg, "\n\n"
              )
            }
          } else {
            feedback_text <- paste0(
              feedback_text,
              "❌ ", qnames[[q]], " **Je hebt geen antwoord gegeven.**\n\n"
            )
          }

          # Question D: Numbers
          q <- "aantal_trainen"
          if (results[[q]]$exists) {
            if (results[[q]]$correct) {
              feedback_text <- paste0(
                feedback_text,
                "✅ ", qnames[[q]], " **Correct! (", results[[q]]$value, " spelers)**\n\n"
              )
            } else {
              msg <- wrong_msg_aantal_trainen(results[[q]]$value)
              feedback_text <- paste0(
                feedback_text,
                "❌ ", qnames[[q]], " **Fout.**\n\n",
                msg, "\n\n"
              )
            }
          } else {
            feedback_text <- paste0(
              feedback_text,
              "❌ ", qnames[[q]], " **Je hebt geen antwoord gegeven.**\n\n"
            )
          }

          q <- "aantal_spelen"
          if (results[[q]]$exists) {
            if (results[[q]]$correct) {
              feedback_text <- paste0(
                feedback_text,
                "✅ ", qnames[[q]], " **Correct! (", results[[q]]$value, " spelers)**\n\n"
              )
            } else {
              msg <- wrong_msg_aantal_spelen(results[[q]]$value)
              feedback_text <- paste0(
                feedback_text,
                "❌ ", qnames[[q]], " **Fout.**\n\n",
                msg, "\n\n"
              )
            }
          } else {
            feedback_text <- paste0(
              feedback_text,
              "❌ ", qnames[[q]], " **Je hebt geen antwoord gegeven.**\n\n"
            )
          }

          # Add summary explanation
          feedback_text <- paste0(
            feedback_text,
            "**Samenvatting oplossing:**\n",
            "1. **Z-scores:** 65% → -1.0, 80% → 0.5\n",
            "2. **Percentages:** Trainen = 53.28%, Spelen = 30.85%\n", 
            "3. **Aantallen:** Van 50 spelers: 27 trainen, 15 spelen volledig\n\n"
          )

          # Z-table reference
          feedback_text <- paste0(
            feedback_text,
            "**Z-tabel:** [https://www.belfactorij.nl/voorinloggen/kansverdelingen/Normaal.htm](https://www.belfactorij.nl/voorinloggen/kansverdelingen/Normaal.htm)"
          )

          get_reporter()$add_message(feedback_text, type = "markdown")
          generated == expected
        }
      )
    }
  )
})
