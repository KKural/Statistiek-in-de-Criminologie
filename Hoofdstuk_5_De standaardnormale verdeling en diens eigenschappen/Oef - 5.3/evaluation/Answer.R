context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          results <- list()

          # Expected answers for Exercise 5.3: Anesthetic Dosage Risk Analysis
          # Anesthetic dose: N(45, 9) - effective dosage in mg
          # Lethal dose: N(100, 18) - lethal dosage in mg
          # Find mortality rate at dose that anesthetizes 92% of patients
          
          # Single question - mortality percentage = 0.9%
          exp_answer <- 0.9

          # Helper function to check each answer
          check_value <- function(varname, expected, tol = 0.01, expect_percent = FALSE) {
            if (!exists(varname, envir = env)) {
              return(list(exists = FALSE, value = NA, correct = FALSE, expected = expected))
            }
            val <- get(varname, envir = env)
            
            if (expect_percent) {
              # Handle percentage strings like "0.9%"
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

          # Check final answer only
          results$antwoord <- check_value("antwoord", exp_answer, tol = 0.05, expect_percent = FALSE)

          assign("detailed_results", results, envir = globalenv())

          all_correct <- all(sapply(results, function(x) x$correct))
          return(all_correct)
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("detailed_results", envir = globalenv())

          qnames <- c(
            antwoord = "Verwacht percentage sterfgevallen"
          )

          # Helper function for parsing student answers
          parse_num <- function(val) {
            if (is.character(val) && grepl("%$", val)) {
              val <- gsub("%$", "", val)
            }
            suppressWarnings(as.numeric(val))
          }

          # --- DIAGNOSTIC FUNCTIONS ---

          wrong_msg_anesthetic <- function(val) {
            val_num <- parse_num(val)
            if (is.na(val_num)) {
              return("Je antwoord kon niet als getal geïnterpreteerd worden. Het juiste antwoord is 0.9%.")
            }

            # Correct probability but not converted to percentage
            if (abs(val_num - 0.009) < 0.0001 || abs(val_num - 0.0091) < 0.0001) {
              return("**Wat je goed deed:** Je berekende de kans correct als 0.009!\n\n**Wat je miste:** De vraag vraagt om een percentage, niet een decimale kans.\n\n**Correctie:** 0.009 × 100 = **0.9%**")
            }
            
            # Multiple choice answers - checking common wrong MC answers
            if (abs(val_num - 0.3) < 0.05) {
              return("**Waarom dit fout is:** Je koos 0.3% (optie A).\n\n**Mogelijke oorzaak:** Verkeerde Z-waarde gebruikt of rekenfout bij de Z-score berekening.\n\n**Controleer:** Voor 57.65 mg letale dosis: Z = (57.65-100)/18 = -2.36, P(Z ≤ -2.36) = 0.0091 = 0.9%")
            }
            
            if (abs(val_num - 1.4) < 0.05) {
              return("**Waarom dit fout is:** Je koos 1.4% (optie C).\n\n**Mogelijke oorzaak:** Verkeerde berekening van de effectieve dosis of fout bij Z-tabel opzoeken.\n\n**Controleer:** 92% effectieve dosis: Z = 1.405 → X = 1.405×9+45 = 57.65 mg")
            }
            
            if (abs(val_num - 2.8) < 0.05) {
              return("**Waarom dit fout is:** Je koos 2.8% (optie D).\n\n**Mogelijke oorzaak:** Dubbel zo groot als het juiste antwoord - mogelijk rekenfout.\n\n**Controleer:** P(Z ≤ -2.36) = 0.0091 = 0.9%, niet 2.8%")
            }
            
            # Common calculation errors
            if (abs(val_num - 8.0) < 0.5) {
              return("**Waarom dit fout is:** Je antwoord is veel te groot.\n\n**Mogelijke oorzaak:** Je gebruikte waarschijnlijk 8% in plaats van 92% voor de effectieve dosis, of verkeerde Z-waarde.\n\n**Correct:** Voor 92% effectie → Z = 1.405, niet 8%")
            }
            
            if (abs(val_num - 50.0) < 0.1) {
              return("**Waarom dit fout is:** 50% is veel te hoog voor mortaliteit.\n\n**Conceptueel:** De letale dosis heeft μ = 100 mg, veel hoger dan de effectieve dosis van ~57.65 mg.\n\n**Realiteitscheck:** Bij anesthesie verwacht je lage mortaliteit, niet 50%!")
            }
            
            # Wrong distribution used
            if (abs(val_num - 16.0) < 1.0) {
              return("**Waarom dit fout is:** Je antwoord suggereert dat je de verkeerde verdeling gebruikte.\n\n**Controleer:** Gebruik de LETALE dosis verdeling N(100, 18) voor de mortaliteitskans, niet de anesthesie verdeling N(45, 9).")
            }
            
            # Complement error
            if (abs(val_num - 99.1) < 0.1) {
              return("**Waarom dit fout is:** Je berekende het complement: 100% - 0.9% = 99.1%.\n\n**Wat je miste:** De vraag vraagt naar het sterftepercentage P(X ≤ 57.65), niet de overlevingskans.\n\n**Correct:** P(Z ≤ -2.36) = 0.0091 = **0.9%**")
            }
            
            # Invalid ranges
            if (val_num < 0) {
              return("**Waarom dit fout is:** Mortaliteitspercentages kunnen niet negatief zijn!\n\n**Wat je miste:** Controleer je berekening - waarschijnlijk een teken-fout.\n\n**Check:** Z = (57.65-100)/18 = -2.36 (negatief is correct), maar P(Z ≤ -2.36) = 0.0091 (positief)")
            }
            if (val_num > 100) {
              return("**Waarom dit fout is:** Mortaliteitspercentages kunnen niet boven 100% zijn!\n\n**Wat je miste:** Controleer of je niet ergens dubbel vermenigvuldigde met 100.")
            }

            # Generic wrong answer with step-by-step guidance
            return(paste0(
              "**Je antwoord ", val, "% is niet correct.**\n\n",
              "**Mogelijke oorzaken:** Verkeerde dosis berekening, fout bij Z-score, of Z-tabel afleesfout.\n\n",
              "**Stap-voor-stap controle:**\n",
              "1. **Effectieve dosis (92%):** Z = 1.405 → X = 1.405×9+45 = 57.65 mg ✓\n",
              "2. **Z-score letaal:** Z = (57.65-100)/18 = -2.36 ✓\n",
              "3. **Z-tabel:** P(Z ≤ -2.36) = 0.0091 ✓\n",
              "4. **Percentage:** 0.0091 × 100% = **0.9%** ✓"
            ))
          }

          # --- BUILD FEEDBACK TEXT ---

          feedback_text <- "**Gegeven:** \n- Anesthesie: N(45, 9) mg\n- Letaal: N(100, 18) mg\n- Vaste dosis voor 92% effectiviteit\n\n"

          # Single Answer
          q <- "antwoord"
          if (results[[q]]$exists) {
            if (results[[q]]$correct) {
              feedback_text <- paste0(
                feedback_text,
                "✅ ", qnames[[q]],
                " **Correct! (", round(as.numeric(results[[q]]$value), 2), "%)**\n\n"
              )
            } else {
              msg <- wrong_msg_anesthetic(results[[q]]$value)
              feedback_text <- paste0(
                feedback_text,
                "❌ ", qnames[[q]], " **Fout.**\n\n",
                msg, "\n\n"
              )
            }
          } else {
            feedback_text <- paste0(
              feedback_text,
              "❌ ", qnames[[q]],
              " **Je hebt geen antwoord gegeven.**\n\n"
            )
          }
          
          # Add step-by-step explanation
          feedback_text <- paste0(
            feedback_text,
            "**Uitleg:** \n",
            "1. **92% effectieve dosis:** Z = 1.405 → 1.405×9+45 = 57.65 mg\n",
            "2. **Mortaliteitskans:** Z = (57.65-100)/18 = -2.36 → P(Z ≤ -2.36) = 0.0091 = 0.9%\n\n"
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
