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
          
          # Multiple choice answer - option B (0.9%) is correct
          exp_answer <- 2  # Option B = 0.9%

          # Helper function to check multiple choice answer
          check_mc <- function(varname, expected) {
            if (!exists(varname, envir = env)) {
              return(list(exists = FALSE, value = NA, correct = FALSE, expected = expected))
            }
            val <- get(varname, envir = env)
            val_num <- suppressWarnings(as.numeric(val))
            
            # Accept 1-4 as valid multiple choice options
            if (!is.na(val_num) && val_num %in% 1:4) {
              correct <- val_num == expected
              return(list(exists = TRUE, value = val_num, correct = correct, expected = expected))
            } else {
              return(list(exists = TRUE, value = val, correct = FALSE, expected = expected))
            }
          }

          # Check multiple choice answer (1=A, 2=B, 3=C, 4=D)
          results$antwoord <- check_mc("antwoord", exp_answer)

          assign("detailed_results", results, envir = globalenv())

          all_correct <- all(sapply(results, function(x) x$correct))
          return(all_correct)
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("detailed_results", envir = globalenv())

          qnames <- c(
            antwoord = "Multiple choice antwoord"
          )

          # --- DIAGNOSTIC FUNCTIONS ---

          wrong_msg_anesthetic <- function(val) {
            # Multiple choice options: 1=A(0.3%), 2=B(0.9%), 3=C(1.4%), 4=D(2.8%)
            
            if (!is.numeric(val) || !(val %in% 1:4)) {
              return("**Ongeldige invoer:** Geef je antwoord als een getal tussen 1-4.\n\n**A)** 0.3% **B)** 0.9% **C)** 1.4% **D)** 2.8%\n\n**Het juiste antwoord is B (2).**")
            }
            
            if (val == 1) {  # Option A: 0.3%
              return("**Waarom optie A (0.3%) fout is:** Dit is te laag voor de werkelijke mortaliteit.\n\n**Mogelijke oorzaak:** Verkeerde Z-waarde gebruikt of rekenfout bij de Z-score berekening voor de effectieve dosis of letale kans.\n\n**Controleer:** Voor 92% effectieve dosis → 57.65 mg → Z = (57.65-100)/18 = -2.36 → P(Z ≤ -2.36) = 0.0091 = **0.9%** (optie B)")
            }
            
            if (val == 3) {  # Option C: 1.4%
              return("**Waarom optie C (1.4%) fout is:** Dit is te hoog - waarschijnlijk een rekenfout.\n\n**Mogelijke oorzaak:** Verkeerde berekening van de effectieve dosis (mogelijk Z = 1.645 gebruikt voor 95% i.p.v. 1.405 voor 92%) of fout bij Z-tabel opzoeken.\n\n**Controleer:** 92% effectieve dosis: Z = **1.405** (niet 1.645!) → X = 1.405×9+45 = 57.65 mg")
            }
            
            if (val == 4) {  # Option D: 2.8%
              return("**Waarom optie D (2.8%) fout is:** Dit is ongeveer dubbel het juiste antwoord.\n\n**Mogelijke oorzaak:** Dubbeltelling ergens in de berekening, of verkeerde Z-tabel waarde gebruikt.\n\n**Controleer:** P(Z ≤ -2.36) = 0.0091 = 0.9%, niet 2.8%. Mogelijk gebruikte je P(|Z| ≥ 2.36) i.p.v. P(Z ≤ -2.36)")
            }
            
            # Common calculation errors
            if (abs(val_num - 8.0) < 0.5) {
              return("**Waarom dit fout is:** Je antwoord (8%) is veel te groot voor een realistische mortaliteit.\n\n**Mogelijke oorzaak:** Je gebruikte waarschijnlijk 8% in plaats van 92% voor de effectieve dosis, of gebruikte de anesthesie-distributie i.p.v. de letale distributie.\n\n**Conceptueel:** We zoeken de dosis voor 92% effectiviteit, niet 8%! En voor mortaliteit gebruik je N(100,18), niet N(45,9).")
            }
            
            if (abs(val_num - 50.0) < 0.1) {
              return("**Waarom dit fout is:** 50% mortaliteit is medisch gezien onrealistisch hoog voor anesthesie.\n\n**Conceptueel:** De letale dosis heeft μ = 100 mg, veel hoger dan de effectieve dosis van ~57.65 mg. De meeste patiënten overleven dus deze dosis ruim.\n\n**Realiteitscheck:** Bij goede anesthesie verwacht je lage mortaliteit (<1%), niet 50%!")
            }
            
            # Should not reach here for valid multiple choice (1-4)
            return("**Onbekende fout.** Het juiste antwoord is **B (2)** = 0.9%")
          }

          # --- BUILD FEEDBACK TEXT ---

          feedback_text <- "**Gegeven:** N(45, 9) anesthesie, N(100, 18) letaal — 92% effectiviteit\n\n"
          feedback_text <- paste0(feedback_text, "**Opties:** A) 0.3% | B) 0.9% | C) 1.4% | D) 2.8%\n\n")

          # Multiple Choice Answer
          q <- "antwoord"
          if (results[[q]]$exists) {
            if (results[[q]]$correct) {
              feedback_text <- paste0(
                feedback_text,
                "✅ ", qnames[[q]],
                " **Correct! Optie B (0.9%)**\n\n"
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
              " **Je hebt geen antwoord gegeven.**\n\nGeef je antwoord als 1, 2, 3, of 4.\n\n"
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
