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
          
          # Single answer - mortality percentage = 0.9%
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
          results$antwoord <- check_value("antwoord", exp_answer, tol = 0.0, expect_percent = FALSE)

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
              return("**Wat je goed deed:** Je berekende de kans correct als 0.0091!\n\n**Wat je miste:** De vraag vraagt om een percentage, niet een decimale kans. In medische statistiek rapporteren we mortaliteitspercentages meestal als percentages voor duidelijkheid.\n\n**Correctie:** 0.0091 × 100 = **0.9%**")
            }
            
            # Multiple choice answers - checking common wrong MC answers
            if (abs(val_num - 0.3) < 0.05) {
              return("**Waarom dit fout is:** Je koos 0.3% (optie A). Dit is te laag voor de werkelijke mortaliteit.\n\n**Mogelijke oorzaak:** Verkeerde Z-waarde gebruikt of rekenfout bij de Z-score berekening voor de effectieve dosis of letale kans.\n\n**Controleer:** Voor 92% effectieve dosis → 57.65 mg → Z = (57.65-100)/18 = -2.36 → P(Z ≤ -2.36) = 0.0091 = **0.9%**")
            }
            
            if (abs(val_num - 1.4) < 0.05) {
              return("**Waarom dit fout is:** Je koos 1.4% (optie C). Dit is te hoog - waarschijnlijk een rekenfout.\n\n**Mogelijke oorzaak:** Verkeerde berekening van de effectieve dosis (mogelijk Z = 1.645 gebruikt voor 95% i.p.v. 1.405 voor 92%) of fout bij Z-tabel opzoeken.\n\n**Controleer:** 92% effectieve dosis: Z = **1.405** (niet 1.645!) → X = 1.405×9+45 = 57.65 mg")
            }
            
            if (abs(val_num - 2.8) < 0.05) {
              return("**Waarom dit fout is:** Je koos 2.8% (optie D). Dit is ongeveer dubbel het juiste antwoord.\n\n**Mogelijke oorzaak:** Dubbeltelling ergens in de berekening, of verkeerde Z-tabel waarde gebruikt.\n\n**Controleer:** P(Z ≤ -2.36) = 0.0091 = 0.9%, niet 2.8%. Mogelijk gebruikte je P(|Z| ≥ 2.36) i.p.v. P(Z ≤ -2.36)")
            }
            
            # Common calculation errors
            if (abs(val_num - 8.0) < 0.5) {
              return("**Waarom dit fout is:** Je antwoord (8%) is veel te groot voor een realistische mortaliteit.\n\n**Mogelijke oorzaak:** Je gebruikte waarschijnlijk 8% in plaats van 92% voor de effectieve dosis, of gebruikte de anesthesie-distributie i.p.v. de letale distributie.\n\n**Conceptueel:** We zoeken de dosis voor 92% effectiviteit, niet 8%! En voor mortaliteit gebruik je N(100,18), niet N(45,9).")
            }
            
            if (abs(val_num - 50.0) < 0.1) {
              return("**Waarom dit fout is:** 50% mortaliteit is medisch gezien onrealistisch hoog voor anesthesie.\n\n**Conceptueel:** De letale dosis heeft μ = 100 mg, veel hoger dan de effectieve dosis van ~57.65 mg. De meeste patiënten overleven dus deze dosis ruim.\n\n**Realiteitscheck:** Bij goede anesthesie verwacht je lage mortaliteit (<1%), niet 50%!")
            }
            
            # Wrong distribution used
            if (abs(val_num - 15.87) < 1.0 || abs(val_num - 16.0) < 1.0) {
              return("**Waarom dit fout is:** Je antwoord suggereert dat je de verkeerde verdeling of verkeerde kant van de verdeling gebruikte.\n\n**Wat er waarschijnlijk gebeurde:** Je gebruikte de anesthesie distributie N(45,9) i.p.v. de letale distributie N(100,18), of je berekende P(Z > iets) i.p.v. P(Z ≤ iets).\n\n**Controleer:** Voor MORTALITEIT gebruik je de LETALE distributie N(100,18)!")
            }
            
            # Complement error
            if (abs(val_num - 99.1) < 0.1) {
              return("**Waarom dit fout is:** Je berekende het complement: 100% - 0.9% = 99.1%.\n\n**Wat je miste:** De vraag vraagt naar het STERFtepercentage P(letale dosis ≤ 57.65 mg), niet de OVERLEVINGSkans.\n\n**Conceptueel:** Mortaliteit = kans dat de gegeven dosis letaal is, dus P(Z ≤ -2.36) = **0.9%**")
            }
            
            # High mortality values
            if (val_num > 10 && val_num < 50) {
              return(paste0("**Waarom dit fout is:** ", round(val_num,1), "% mortaliteit is medisch onrealistisch hoog voor anesthesie.\n\n**Wat er waarschijnlijk gebeurde:** Verkeerde verdeling gebruikt, teken vergeten, of een andere fundamentele rekenfout.\n\n**Realiteitscheck:** Moderne anesthesie heeft zeer lage mortaliteit. 0.9% is al relatief hoog maar realistisch voor deze specifieke situatie."))
            }
            
            # Very small values
            if (val_num > 0 && val_num < 0.1) {
              return(paste0("**Waarom dit fout is:** ", val_num, "% is te klein. Je bent in de goede orde van grootte maar niet precies genoeg.\n\n**Mogelijke oorzaak:** Afrondingsfouten in tussenstappen, of net verkeerde Z-waarde uit de tabel.\n\n**Controleer:** P(Z ≤ -2.36) = 0.0091 = **0.9%** precies."))
            }
            
            # Invalid ranges
            if (val_num < 0) {
              return("**Waarom dit fout is:** Mortaliteitspercentages kunnen niet negatief zijn!\n\n**Wat je miste:** Controleer je berekening - waarschijnlijk een teken-fout ergens.\n\n**Tip:** Z = (57.65-100)/18 = -2.36 (negatief is correct), maar P(Z ≤ -2.36) = 0.0091 (altijd positief)")
            }
            if (val_num > 100) {
              return("**Waarom dit fout is:** Mortaliteitspercentages kunnen niet boven 100% zijn!\n\n**Wat je miste:** Controleer of je niet ergens dubbel vermenigvuldigde met 100, of een fundamentele rekenfout maakte.\n\n**Tip:** Kansen zijn altijd tussen 0 en 1, percentages tussen 0% en 100%.")
            }

            # Generic wrong answer with step-by-step guidance
            return(paste0(
              "**Je antwoord ", val, "% is niet correct.**\n\n",
              "**Mogelijke oorzaken:** Verkeerde dosis berekening, fout bij Z-score berekening, Z-tabel afleesfout, of verkeerde distributie gebruikt.\n\n",
              "**Volledige controle:**\n",
              "1. **Effectieve dosis (92%):** Z₉₂% = 1.405 → X = 1.405×9+45 = 57.65 mg ✓\n",
              "2. **Z-score letaal:** Z = (57.65-100)/18 = -2.36 ✓\n",
              "3. **Z-tabel:** P(Z ≤ -2.36) = 0.0091 ✓\n",
              "4. **Percentage:** 0.0091 × 100% = **0.9%** ✓"
            ))
          }

          # --- BUILD FEEDBACK TEXT ---

          feedback_text <- "**Gegeven:** N(45, 9) anesthesie, N(100, 18) letaal — 92% effectiviteit\n\n"

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
            "**Uitleg:** Z₉₂% = 1.405 → X = 1.405×9+45 = 57.65 mg, Z = (57.65−100)/18 = −2.36 → P(Z ≤ −2.36) = 0.0091 = 0.9%.\n\n"
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
