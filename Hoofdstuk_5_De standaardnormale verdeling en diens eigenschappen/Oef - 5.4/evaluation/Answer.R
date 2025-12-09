context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          results <- list()

          # Expected answers for Exercise 5.4: Trappist Beer Quality Control
          # Normal distribution N(33, 2) - bottle contents in cl
          
          # Question A - P(32 ≤ X ≤ 34) = 38.30%
          exp_a <- 38.30
          
          # Question B - P(X > 35) = 15.87%  
          exp_b <- 15.87

          # Helper function to check each answer
          check_value <- function(varname, expected, tol = 0.01, expect_percent = FALSE) {
            if (!exists(varname, envir = env)) {
              return(list(exists = FALSE, value = NA, correct = FALSE, expected = expected))
            }
            val <- get(varname, envir = env)
            
            if (expect_percent) {
              # Handle percentage strings like "8.08%"
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

          # Check final answers only
          results$vraag_a <- check_value("vraag_a", exp_a, tol = 0.01, expect_percent = FALSE)
          results$vraag_b <- check_value("vraag_b", exp_b, tol = 0.01, expect_percent = FALSE)

          assign("detailed_results", results, envir = globalenv())

          all_correct <- all(sapply(results, function(x) x$correct))
          return(all_correct)
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("detailed_results", envir = globalenv())

          qnames <- c(
            vraag_a = "a) Percentage flesjes tussen 32cl en 34cl",
            vraag_b = "b) Percentage flesjes meer dan 35cl"
          )

          # Helper function for parsing student answers
          parse_num <- function(val) {
            if (is.character(val) && grepl("%$", val)) {
              val <- gsub("%$", "", val)
            }
            suppressWarnings(as.numeric(val))
          }

          # --- DIAGNOSTIC FUNCTIONS ---

          wrong_msg_a <- function(val) {
            val_num <- parse_num(val)
            if (is.na(val_num)) {
              return("Je antwoord kon niet als getal geïnterpreteerd worden. Het juiste antwoord is 38.30%.")
            }

            # Correct probability but not converted to percentage
            if (abs(val_num - 0.3830) < 0.0001 || abs(val_num - 0.383) < 0.001) {
              return("**Wat je goed deed:** Je berekende de kans correct als 0.3830!\n\n**Wat je miste:** De vraag vraagt om een percentage, niet een decimale kans. In statistiek geven we kansen vaak als decimalen (0 tot 1), maar percentages zijn decimalen × 100.\n\n**Correctie:** 0.3830 × 100 = **38.30%**")
            }
            
            # Complement errors - calculated 100% - 38.30% or as decimal
            if (abs(val_num - 61.70) < 0.1) {
              return("**Waarom dit fout is:** Je berekende 61.70% = het complement van 38.30%. Dit gebeurt vaak wanneer studenten denken aan 'alles behalve het interval'.\n\n**Wat je miste:** De vraag vraagt specifiek naar P(32 ≤ X ≤ 34) - de kans BINNEN het interval, niet erbuiten.\n\n**Conceptueel:** Voor intervalkansen bereken je P(a ≤ X ≤ b) = P(X ≤ b) - P(X ≤ a)\n\n**Correct:** P(32 ≤ X ≤ 34) = P(Z ≤ 0.5) - P(Z ≤ -0.5) = 0.6915 - 0.3085 = **38.30%**")
            }
            if (abs(val_num - 0.6170) < 0.001) {
              return("**Waarom dit fout is:** Je gaf 0.6170 - dit is het complement van de gezochte kans in decimaalvorm.\n\n**Wat je miste:** Je berekende P(X < 32 of X > 34) in plaats van P(32 ≤ X ≤ 34).\n\n**Conceptueel:** Interval-kansen en complement-kansen zijn verschillende dingen!\n\n**Correct:** P(32 ≤ X ≤ 34) = 0.3830 = **38.30%**")
            }
            
            # Used only one tail (half the interval)
            if (abs(val_num - 19.15) < 0.1) {
              return("**Waarom dit fout is:** Je gaf 19.15% - dit is ongeveer de helft van het juiste antwoord.\n\n**Wat je miste:** Voor een interval P(a ≤ X ≤ b) moet je BEIDE grenzen gebruiken. Waarschijnlijk berekende je alleen P(33 ≤ X ≤ 34) of P(32 ≤ X ≤ 33).\n\n**Conceptueel:** Interval = rechter grens - linker grens uit de Z-tabel.\n\n**Correct:** P(32 ≤ X ≤ 34) = P(Z ≤ 0.5) - P(Z ≤ -0.5) = 0.6915 - 0.3085 = **38.30%**")
            }
            
            # Used much smaller value - might be calculation error or wrong approach
            if (abs(val_num - 7.935) < 0.1 || (val_num > 5 && val_num < 15)) {
              return(paste0("**Waarom dit fout is:** Je antwoord (~", round(val_num, 1), "%) is veel te klein voor dit interval.\n\n**Mogelijke oorzaken:** Verkeerd gebruik van de Z-tabel, gedeeld door 2, of een andere rekenfout.\n\n**Wat je miste:** [32,34] is een relatief groot interval (2cl breed rondom het gemiddelde), dus de kans moet redelijk hoog zijn.\n\n**Realiteitscheck:** ~38% lijkt realistisch voor een interval van 1 standaarddeviatie breed.\n\n**Correct:** P(32 ≤ X ≤ 34) = **38.30%**"))
            }
            
            # Doubled the correct answer
            if (abs(val_num - 76.60) < 0.1) {
              return("**Waarom dit fout is:** Je gaf 76.60% - dit is bijna het dubbele van het juiste antwoord.\n\n**Wat er waarschijnlijk gebeurde:** Je telde P(Z ≤ 0.5) + P(Z ≤ -0.5) = 0.6915 + 0.3085 = 1.000 = 100%, of je vermenigvuldigde ergens dubbel.\n\n**Wat je miste:** Voor intervallen TREK je de kansen af: P(a ≤ X ≤ b) = P(X ≤ b) - P(X ≤ a).\n\n**Correct:** P(Z ≤ 0.5) - P(Z ≤ -0.5) = 0.6915 - 0.3085 = **38.30%**")
            }
            
            # Confused with empirical rule (68%)
            if (abs(val_num - 68.30) < 0.5 || abs(val_num - 68.27) < 0.5) {
              return("**Waarom dit fout is:** Je gebruikte de empirische regel (68% binnen μ ± 1σ).\n\n**Wat je miste:** De empirische regel geldt voor het interval [μ-σ, μ+σ] = [31, 35]. Maar de vraag gaat over [32, 34] - een kleiner interval!\n\n**Conceptueel:** Verschillende intervallen hebben verschillende kansen. Gebruik altijd de Z-tabel voor specifieke intervallen.\n\n**Correct:** [32,34] ≠ [31,35], dus P(32 ≤ X ≤ 34) = **38.30%** ≠ 68%")
            }
            
            # Assumed 50% (symmetric around mean)
            if (abs(val_num - 50.0) < 0.1) {
              return("**Waarom dit fout is:** Je nam aan dat een symmetrisch interval rond μ altijd 50% kans heeft.\n\n**Wat je miste:** Symmetrie betekent niet automatisch 50%! De kans hangt af van de BREEDTE van het interval ten opzichte van σ.\n\n**Conceptueel:** [32,34] = μ ± 1 = μ ± 0.5σ. Dit is een relatief smal interval, dus < 50%.\n\n**Vergelijk:** μ ± 1σ = 68%, μ ± 0.5σ = **38.30%**")
            }
            
            # Specific wrong calculation errors
            if (abs(val_num - 138.30) < 0.1) {
              return("**Waarom dit fout is:** 138.30% = 100% + 38.30%. Je telde waarschijnlijk 1.0000 + 0.3830 = 1.3830.\n\n**Wat er gebeurde:** Je berekende mogelijk P(Z ≤ 0.5) + [P(Z ≤ 0.5) - P(Z ≤ -0.5)] of een soortgelijke dubbeltelling.\n\n**Wat je miste:** Voor intervallen gebruik je aftrekking, niet optelling.\n\n**Correct:** P(Z ≤ 0.5) - P(Z ≤ -0.5) = 0.6915 - 0.3085 = **38.30%**")
            }
            
            # Invalid ranges
            if (val_num < 0) {
              if (abs(val_num - (-38.30)) < 0.1) {
                return("**Waarom dit fout is:** Je kreeg -38.30% - kansen zijn altijd tussen 0% en 100%!\n\n**Wat er gebeurde:** Je berekening gaf het juiste getal maar met verkeerd teken. Waarschijnlijk een fout bij P(Z ≤ -0.5) - P(Z ≤ 0.5) in plaats van andersom.\n\n**Wat je miste:** Bij intervallen: kleinere grens van grotere grens aftrekken.\n\n**Correct:** P(Z ≤ 0.5) - P(Z ≤ -0.5) = +0.6915 - 0.3085 = **+38.30%**")
              }
              return("**Waarom dit fout is:** Kansen kunnen nooit negatief zijn - ze liggen altijd tussen 0% en 100%!\n\n**Wat je miste:** Ergens een teken-fout in je berekening.\n\n**Check:** Alle Z-tabel waarden zijn positief, alle kansen zijn positief.\n\n**Correct:** **38.30%**")
            }
            if (val_num > 100) {
              return("**Waarom dit fout is:** Kansen kunnen nooit groter dan 100% zijn - dat zou betekenen 'meer dan zeker'!\n\n**Wat er gebeurde:** Waarschijnlijk vermenigvuldigde je ergens dubbel met 100, of telde verkeerd op.\n\n**Wat je miste:** Kansen zijn fracties van het totaal: maximum = 1.0 = 100%.\n\n**Check:** Is je decimale kans tussen 0 en 1? Dan ×100 voor percentage.\n\n**Correct:** 0.3830 × 100 = **38.30%**")
            }

            # Generic wrong answer with step-by-step guidance
            return(paste0(
              "**Je antwoord ", val, "% is niet correct.**\n\n",
              "**Mogelijke oorzaken:** Verkeerde Z-waarden, fout in Z-tabel opzoeken, of rekenfouten.\n\n",
              "**Stap-voor-stap controle:**\n",
              "1. **Z-waarden:** Z₁ = (32-33)/2 = -0.5, Z₂ = (34-33)/2 = 0.5 ✓\n",
              "2. **Z-tabel:** P(Z ≤ -0.5) = 0.3085, P(Z ≤ 0.5) = 0.6915 ✓\n",
              "3. **Interval:** P(-0.5 ≤ Z ≤ 0.5) = 0.6915 - 0.3085 = 0.3830 ✓\n",
              "4. **Percentage:** 0.3830 × 100% = **38.30%** ✓"
            ))
          }

          wrong_msg_b <- function(val) {
            val_num <- parse_num(val)
            if (is.na(val_num)) {
              return("Je antwoord kon niet als getal geïnterpreteerd worden. Het juiste antwoord is 15.87%.")
            }

            # Correct probability but not converted to percentage
            if (abs(val_num - 0.1587) < 0.0001) {
              return("**Wat je goed deed:** Je berekende de kans perfect als 0.1587!\n\n**Wat je miste:** De vraag vraagt om een percentage. Decimale kansen moet je vermenigvuldigen met 100.\n\n**Conceptueel:** 0.1587 betekent '15.87 van elke 100 flesjes'.\n\n**Correctie:** 0.1587 × 100 = **15.87%**")
            }
            
            # Complement error - calculated P(X ≤ 35) instead of P(X > 35)
            if (abs(val_num - 84.13) < 0.1) {
              return("**Waarom dit fout is:** Je berekende P(X ≤ 35) = 84.13% - dat is de kans op '35cl of minder'.\n\n**Wat je miste:** De vraag vraagt naar 'meer dan 35cl' = P(X > 35). Dit zijn complementaire gebeurtenissen!\n\n**Conceptueel:** P(X > 35) + P(X ≤ 35) = 100%. Je gaf de verkeerde helft.\n\n**Correct:** P(X > 35) = 1 - P(X ≤ 35) = 1 - 0.8413 = **15.87%**")
            }
            if (abs(val_num - 0.8413) < 0.001) {
              return("**Waarom dit fout is:** Je gaf 0.8413 - dit is P(X ≤ 35) in decimaalvorm.\n\n**Wat je miste:** De vraag vraagt naar P(X > 35), niet P(X ≤ 35). Let op het verschil tussen '≤' en '>'!\n\n**Conceptueel:** Uit de Z-tabel lees je altijd P(Z ≤ z). Voor P(Z > z) moet je 1 - P(Z ≤ z) berekenen.\n\n**Correct:** P(X > 35) = 1 - 0.8413 = 0.1587 = **15.87%**")
            }
            
            # Doubled the correct answer
            if (abs(val_num - 31.74) < 0.1) {
              return("**Waarom dit fout is:** Je gaf 31.74% - dit is bijna het dubbele van het juiste antwoord.\n\n**Wat er gebeurde:** Waarschijnlijk berekende je 2 × 15.87% of maakte een fout bij symmetrie-aannames.\n\n**Wat je miste:** P(X > 35) is een enkelvoudige staart-kans, geen symmetrische berekening.\n\n**Correct:** Z = 1 → P(Z > 1) = 1 - 0.8413 = **15.87%** (niet verdubbelen!)")
            }
            
            # Used half value
            if (abs(val_num - 7.935) < 0.1 || abs(val_num - 7.94) < 0.1) {
              return("**Waarom dit fout is:** Je gaf ~7.94% - dit is ongeveer de helft van het juiste antwoord.\n\n**Wat er gebeurde:** Je deelde waarschijnlijk door 2, misschien vanwege symmetrie-verwarring of een verkeerde formule.\n\n**Wat je miste:** Voor staart-kansen gebruik je direct de Z-tabel, geen deling door 2.\n\n**Conceptueel:** Deling door 2 is alleen bij sommige symmetrische intervallen relevant, niet bij staart-kansen.\n\n**Correct:** P(X > 35) = 1 - 0.8413 = **15.87%**")
            }
            
            # Assumed 50% for anything above mean
            if (abs(val_num - 50.0) < 0.1) {
              return("**Waarom dit fout is:** Je nam aan dat P(X > μ) altijd 50% is.\n\n**Wat je miste:** 50% geldt alleen voor P(X > μ) waar μ = gemiddelde. Maar hier is 35 ≠ μ = 33!\n\n**Conceptueel:** P(X > 35) ≠ P(X > 33). 35 ligt 1σ boven het gemiddelde, dus veel minder dan 50% van de waarden ligt erboven.\n\n**Realiteitscheck:** 35cl is vrij veel - logisch dat < 50% van de flesjes zoveel bevat.\n\n**Correct:** P(X > 35) = **15.87%**")
            }
            
            # Wrong Z-table value
            if (abs(val_num - 34.13) < 0.1) {
              return("**Waarom dit fout is:** Je gaf 34.13% - dit suggereert een verkeerde Z-tabelwaarde.\n\n**Wat er gebeurde:** Misschien gebruikte je P(Z ≤ 0.4) = 0.6554 of een andere Z-waarde in plaats van Z = 1.\n\n**Wat je miste:** Controleer altijd je Z-berekening: Z = (35-33)/2 = 1.\n\n**Z-tabel check:** Voor Z = 1.00 moet je P(Z ≤ 1) = 0.8413 vinden.\n\n**Correct:** P(Z > 1) = 1 - 0.8413 = **15.87%**")
            }
            
            # Confused with empirical rule (68%)
            if (abs(val_num - 68.27) < 0.5 || abs(val_num - 68.3) < 0.5) {
              return("**Waarom dit fout is:** Je gebruikte de empirische regel (68% binnen μ ± 1σ).\n\n**Wat je miste:** De empirische regel geldt voor INTERVALLEN [μ-σ, μ+σ], niet voor staart-kansen P(X > waarde).\n\n**Conceptueel:** 68% = P(31 < X < 35), maar we willen P(X > 35) - een enkele staart.\n\n**Logica:** Als 68% tussen 31 en 35 ligt, dan ligt slechts ~16% boven 35 (door symmetrie).\n\n**Correct:** P(X > 35) = **15.87%** ≈ 16%")
            }
            
            # Specific wrong calculation errors
            if (abs(val_num - 115.87) < 0.1) {
              return("**Waarom dit fout is:** 115.87% = 100% + 15.87%. Je telde waarschijnlijk 1.0000 + 0.1587.\n\n**Wat er gebeurde:** Mogelijk berekende je 1 + (1 - 0.8413) in plaats van (1 - 0.8413) alleen.\n\n**Wat je miste:** Kansen kunnen nooit > 100% zijn. Voor P(X > 35) heb je alleen het complement nodig.\n\n**Correct:** P(X > 35) = 1 - 0.8413 = **15.87%** (niet 1 + 0.1587!)")
            }
            
            # Invalid ranges
            if (val_num < 0) {
              if (abs(val_num - (-15.87)) < 0.1) {
                return("**Waarom dit fout is:** Je kreeg -15.87% - kansen zijn altijd tussen 0% en 100%!\n\n**Wat er gebeurde:** Je berekening was correct maar met verkeerd teken. Waarschijnlijk 0.8413 - 1 in plaats van 1 - 0.8413.\n\n**Wat je miste:** Bij complement-berekeningen: altijd 1 minus de Z-tabelwaarde.\n\n**Correct:** 1 - 0.8413 = +0.1587 = **+15.87%**")
              }
              return("**Waarom dit fout is:** Kansen kunnen nooit negatief zijn!\n\n**Wat je miste:** Ergens een teken-fout. Alle kansen liggen tussen 0% en 100%.\n\n**Check:** 1 - 0.8413 = +0.1587 (positief).\n\n**Correct:** **15.87%**")
            }
            if (val_num > 100) {
              return("**Waarom dit fout is:** Kansen kunnen nooit > 100% zijn!\n\n**Wat er gebeurde:** Waarschijnlijk vermenigvuldigde je dubbel met 100 of telde verkeerd op.\n\n**Realiteitscheck:** P(X > 35) betekent 'percentage flesjes met meer dan 35cl'. Dit kan nooit alle flesjes (100%) overtreffen!\n\n**Correct:** 1 - 0.8413 = 0.1587 = **15.87%**")
            }

            # Generic wrong answer with step-by-step guidance
            return(paste0(
              "**Je antwoord ", val, "% is niet correct.**\n\n",
              "**Mogelijke oorzaken:** Verkeerde Z-waarde, fout bij complement-berekening, of Z-tabel afleesfout.\n\n",
              "**Stap-voor-stap controle:**\n",
              "1. **Z-waarde:** Z = (35-33)/2 = 1 ✓\n",
              "2. **Z-tabel:** P(Z ≤ 1) = 0.8413 ✓\n",
              "3. **Complement:** P(X > 35) = P(Z > 1) = 1 - 0.8413 = 0.1587 ✓\n",
              "4. **Percentage:** 0.1587 × 100% = **15.87%** ✓"
            ))
          }

          # --- BUILD FEEDBACK TEXT ---

          feedback_text <- "**Resultaten per vraag:**\n\n"

          # Vraag A
          q <- "vraag_a"
          if (results[[q]]$exists) {
            if (results[[q]]$correct) {
              feedback_text <- paste0(
                feedback_text,
                "✅ ", qnames[[q]],
                " **Correct! (", round(as.numeric(results[[q]]$value), 2), "%)**\n\n"
              )
            } else {
              msg <- wrong_msg_a(results[[q]]$value)
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
          
          # Add step-by-step explanation for Question A
          feedback_text <- paste0(
            feedback_text,
            "**Uitleg Vraag A:** Z₁ = (32−33)/2 = −0.5, Z₂ = (34−33)/2 = 0.5 → P(−0.5 ≤ Z ≤ 0.5) = 0.6915 − 0.3085 = 0.3830 = 38.30%.\n\n"
          )

          # Vraag B
          q <- "vraag_b"
          if (results[[q]]$exists) {
            if (results[[q]]$correct) {
              feedback_text <- paste0(
                feedback_text,
                "✅ ", qnames[[q]],
                " **Correct! (", round(as.numeric(results[[q]]$value), 2), "%)**\n\n"
              )
            } else {
              msg <- wrong_msg_b(results[[q]]$value)
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
          
          # Add step-by-step explanation for Question B
          feedback_text <- paste0(
            feedback_text,
            "**Uitleg Vraag B:** Z = (35−33)/2 = 1 → P(Z > 1) = 1 − 0.8413 = 0.1587 = 15.87%.\n\n"
          )

          # General info and Z-table reference
          feedback_text <- paste0(
            feedback_text,
            "**Gegeven:** N(33, 2) — μ = 33 cl, σ = 2 cl\n\n",
            "**Z-tabel:** [https://www.belfactorij.nl/voorinloggen/kansverdelingen/Normaal.htm](https://www.belfactorij.nl/voorinloggen/kansverdelingen/Normaal.htm)"
          )

          get_reporter()$add_message(feedback_text, type = "markdown")
          generated == expected
        }
      )
    }
  )
})
