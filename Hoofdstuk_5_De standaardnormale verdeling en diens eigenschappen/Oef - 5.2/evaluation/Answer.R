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

            # Sign error - most common mistake
            if (abs(val_num - 1.0) < 0.1) {
              return("**Wat je goed deed:** Je berekende de afstand tot het gemiddelde correct (1.0 standaarddeviatie).\n\n**Waarom dit fout is:** Je gaf +1.0, maar 65% ligt ONDER het gemiddelde van 75%.\n\n**Conceptueel:** Waarden onder μ geven negatieve Z-scores, waarden boven μ geven positieve Z-scores.\n\n**Realiteitscheck:** 65 < 75, dus Z moet negatief zijn.\n\n**Correctie:** Z = (65-75)/10 = -10/10 = **-1.0**")
            }
            
            # Forgot to subtract μ
            if (abs(val_num - 6.5) < 0.1) {
              return("**Waarom dit fout is:** Je gaf 6.5 - dit suggereert dat je X/σ deed in plaats van (X-μ)/σ.\n\n**Wat er waarschijnlijk gebeurde:** Je berekende 65/10 = 6.5, maar vergat het gemiddelde af te trekken.\n\n**Conceptueel:** Standaardisatie vereist EERST centreren (X-μ), DAN schalen (/σ).\n\n**Correctie:** Z = (65-75)/10 = -10/10 = **-1.0**")
            }
            
            # Used wrong denominator
            if (abs(val_num - (-10)) < 0.5) {
              return("**Wat je goed deed:** Je trok correct μ af: 65-75 = -10.\n\n**Waarom dit fout is:** Je vergat te delen door σ = 10.\n\n**Wat er waarschijnlijk gebeurde:** Je stopte na de eerste stap van de Z-score formule.\n\n**Conceptueel:** Z-scores meten 'hoeveel standaardafwijkingen van het gemiddelde'. Dus: (afstand tot μ) / σ.\n\n**Correctie:** Z = -10 / **10** = **-1.0**")
            }
            
            # Decimal confusion
            if (abs(val_num - 0.65) < 0.05) {
              return("**Waarom dit fout is:** Je gaf 0.65 - dit lijkt op de ruwe score zelf als decimaal.\n\n**Wat je miste:** Z-scores meten standaardafwijkingen, niet decimale versies van de originele waarde.\n\n**Conceptueel:** 65% wordt 0.65 als decimaal, maar Z = (65-75)/10 = -1.0.\n\n**Correctie:** Gebruik de Z-formule: Z = (65-75)/10 = **-1.0**")
            }

            return(paste0(
              "**Je antwoord ", val, " is niet correct.**\n\n",
              "**Mogelijke oorzaken:** Teken-fout, verkeerde formule-toepassing, of rekenfout.\n\n",
              "**Stap-voor-stap controle:**\n",
              "1. **Formule:** Z = (X - μ) / σ ✓\n",
              "2. **Invullen:** Z = (65 - 75) / 10 ✓\n", 
              "3. **Berekening:** Z = -10 / 10 = **-1.0** ✓\n",
              "4. **Realiteitscheck:** 65 < 75, dus Z < 0 ✓"
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

            # Complement error - calculated everything EXCEPT the interval
            if (abs(val_num - 84.13) < 0.5) {
              return("**Waarom dit fout is:** Je berekende 84.13% = het complement van 53.28%. Dit gebeurt vaak bij intervalvragen.\n\n**Wat er waarschijnlijk gebeurde:** Je dacht aan 'iedereen die NIET tussen 65-79% scoort' in plaats van 'iedereen die WEL tussen 65-79% scoort'.\n\n**Conceptueel:** Voor P(65 ≤ X ≤ 79) zoek je spelers BINNEN het interval, niet erbuiten.\n\n**Realiteitscheck:** ~53% lijkt realistisch voor dit middeninterval rond het gemiddelde.\n\n**Correctie:** P(Z ≤ 0.4) - P(Z ≤ -1.0) = 0.6554 - 0.1587 = **53.28%**")
            }
            
            # Only used upper tail - forgot to subtract lower tail
            if (abs(val_num - 65.54) < 0.5) {
              return("**Wat je goed deed:** Je vond correct P(Z ≤ 0.4) = 0.6554 = 65.54%!\n\n**Waarom dit fout is:** Je vergat de linkerkant af te trekken.\n\n**Wat er waarschijnlijk gebeurde:** Je berekende alleen tot de bovengrens (79%), maar een interval vereist bovenkant - onderkant.\n\n**Conceptueel:** P(a ≤ X ≤ b) = P(X ≤ b) - P(X ≤ a). Denk aan 'alle kans tot b' minus 'alle kans tot a'.\n\n**Correctie:** 0.6554 - 0.1587 = **53.28%**")
            }
            
            # Only used lower tail
            if (abs(val_num - 15.87) < 0.5) {
              return("**Wat je goed deed:** Je vond correct P(Z ≤ -1.0) = 0.1587 = 15.87%!\n\n**Waarom dit fout is:** Dit is alleen de kans op scores ≤65%, niet het interval 65-79%.\n\n**Wat je miste:** Voor een interval P(65 ≤ X ≤ 79) moet je beide grenzen gebruiken: P(Z ≤ 0.4) - P(Z ≤ -1.0).\n\n**Conceptueel:** Je berekende de linkerstaart, maar we willen het middengedeelte.\n\n**Correctie:** 0.6554 - 0.1587 = **53.28%**")
            }
            
            # Percentage vs decimal confusion
            if (abs(val_num - 0.5328) < 0.001) {
              return("**Wat je goed deed:** Je berekende de kans perfect als 0.5328!\n\n**Wat je miste:** De vraag vraagt om een percentage, niet een decimale kans.\n\n**Conceptueel:** Kansen zijn decimalen (0-1), percentages zijn decimalen × 100.\n\n**Correctie:** 0.5328 × 100 = **53.28%**")
            }
            
            # Used empirical rule approximation
            if (abs(val_num - 68.0) < 1.0) {
              return("**Waarom dit fout is:** Je gebruikte de empirische regel (68% binnen μ ± 1σ).\n\n**Wat je miste:** De empirische regel geldt voor [65%, 85%] = μ ± 1σ. Maar we willen [65%, 79%] - een kleiner interval!\n\n**Conceptueel:** [65,79] is asymmetrisch en smaller dan [65,85]. Gebruik altijd de Z-tabel voor specifieke intervallen.\n\n**Realiteitscheck:** 53% < 68% omdat ons interval kleiner is dan μ ± 1σ.")
            }

            return(paste0(
              "**Je antwoord ", val, "% is niet correct.**\n\n",
              "**Mogelijke oorzaken:** Verkeerde Z-waarden, fout in interval-berekening, of complement genomen.\n\n",
              "**Stap-voor-stap controle:**\n",
              "1. **Z-scores:** 65% → Z = -1.0, 79% → Z = (79-75)/10 = 0.4 ✓\n",
              "2. **Z-tabel:** P(Z ≤ -1.0) = 0.1587, P(Z ≤ 0.4) = 0.6554 ✓\n",
              "3. **Interval:** P(-1 ≤ Z ≤ 0.4) = 0.6554 - 0.1587 = 0.5328 ✓\n",
              "4. **Percentage:** 0.5328 × 100% = **53.28%** ✓"
            ))
          }

          wrong_msg_spelen <- function(val) {
            val_num <- parse_num(val)
            if (is.na(val_num)) {
              return("Je antwoord kon niet als getal geïnterpreteerd worden. Het juiste antwoord is 30.85%.")
            }

            # Wrong tail - used left instead of right
            if (abs(val_num - 69.15) < 0.5) {
              return("**Wat je goed deed:** Je vond correct P(Z ≤ 0.5) = 0.6915 = 69.15%!\n\n**Waarom dit fout is:** Je berekende de verkeerde staart. We willen P(Z ≥ 0.5), niet P(Z ≤ 0.5).\n\n**Wat er waarschijnlijk gebeurde:** Je las de Z-tabel correct, maar vergat dat ≥80% betekent 'rechter staart', niet 'linker staart'.\n\n**Conceptueel:** Z-tabellen geven P(Z ≤ z). Voor P(Z ≥ z) gebruik je 1 - P(Z ≤ z).\n\n**Realiteitscheck:** ~31% van spelers scoort ≥80% lijkt realistisch (minderheidsprestatie).\n\n**Correctie:** 1 - 0.6915 = **30.85%**")
            }
            
            # Assumed symmetry/50-50
            if (abs(val_num - 50.0) < 0.5) {
              return("**Waarom dit fout is:** Je nam aan dat de kans 50% is.\n\n**Wat er waarschijnlijk gebeurde:** Je dacht dat 80% precies op de mediaan ligt, of dat alles boven het gemiddelde 50% kans heeft.\n\n**Wat je miste:** 80% ligt 0.5σ BOVEN μ = 75%. Dit is geen 50-50 verdeling!\n\n**Conceptueel:** Alleen bij de mediaan (μ zelf) is de kans 50%. Voor andere waarden gebruik je de Z-tabel.\n\n**Realiteitscheck:** Scores boven gemiddelde+0.5σ zijn relatief zeldzaam, dus < 50%.")
            }
            
            # Percentage vs decimal confusion
            if (abs(val_num - 0.3085) < 0.001) {
              return("**Wat je goed deed:** Je berekende de kans perfect als 0.3085!\n\n**Wat je miste:** De vraag vraagt om een percentage, niet een decimale kans.\n\n**Conceptueel:** 0.3085 betekent '30.85 van elke 100 spelers kunnen volledig spelen'.\n\n**Correctie:** 0.3085 × 100 = **30.85%**")
            }
            
            # Used wrong Z-score
            if (abs(val_num - 15.87) < 0.5) {
              return("**Waarom dit fout is:** Je gaf 15.87% - dit suggereert Z = -1.0 in plaats van Z = +0.5.\n\n**Wat er waarschijnlijk gebeurde:** Je berekende Z = (80-75)/10 verkeerd, of gebruikte de verkeerde grens.\n\n**Wat je miste:** Voor 80%: Z = (80-75)/10 = 5/10 = +0.5, niet -1.0.\n\n**Conceptueel:** 80% > 75% (gemiddelde), dus Z moet positief zijn.\n\n**Correctie:** P(Z ≥ 0.5) = 1 - P(Z ≤ 0.5) = 1 - 0.6915 = **30.85%**")
            }
            
            # Doubled or added incorrectly
            if (abs(val_num - 138.5) < 1.0) {
              return("**Waarom dit fout is:** 138.5% > 100% - kansen kunnen nooit groter dan 100% zijn!\n\n**Wat er waarschijnlijk gebeurde:** Je telde 0.6915 + 0.6915 of deed iets soortgelijks met dubbeltelling.\n\n**Wat je miste:** Voor rechterstaarten gebruik je aftrekking: 1 - P(Z ≤ z), niet optelling.\n\n**Check:** Alle kansen liggen tussen 0% en 100%.")
            }

            return(paste0(
              "**Je antwoord ", val, "% is niet correct.**\n\n",
              "**Mogelijke oorzaken:** Verkeerde staart, fout Z-score, of complement-fout.\n\n",
              "**Stap-voor-stap controle:**\n",
              "1. **Z-score:** 80% → Z = (80-75)/10 = 0.5 ✓\n",
              "2. **Z-tabel:** P(Z ≤ 0.5) = 0.6915 ✓\n",
              "3. **Rechterstaart:** P(Z ≥ 0.5) = 1 - P(Z ≤ 0.5) = 1 - 0.6915 = 0.3085 ✓\n",
              "4. **Percentage:** 0.3085 × 100% = **30.85%** ✓"
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
