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
          
          # Question A - P(32 ≤ X ≤ 34)
          # Z1 = (32-33)/2 = -0.5, Z2 = (34-33)/2 = 0.5
          # P(-0.5 ≤ Z ≤ 0.5) = P(Z ≤ 0.5) - P(Z ≤ -0.5) = 0.6915 - 0.3085 = 0.3830
          exp_a <- 38.30  # As percentage
          
          # Question B - P(X > 35)  
          # Z = (35-33)/2 = 1
          # P(Z > 1) = 1 - P(Z ≤ 1) = 1 - 0.8413 = 0.1587
          exp_b <- 15.87  # As percentage

          # Helper function to check each answer
          check_value <- function(varname, expected, tol = 0.01) {
            if (!exists(varname, envir = env)) {
              return(list(exists = FALSE, value = NA, correct = FALSE, expected = expected))
            }
            val <- get(varname, envir = env)
            val_num <- suppressWarnings(as.numeric(val))
            correct <- !is.na(val_num) && abs(val_num - expected) < tol
            return(list(exists = TRUE, value = val, correct = correct, expected = expected))
          }
    
          # Check each answer
          result_a <- check_value("vraag_a", exp_a)
          result_b <- check_value("vraag_b", exp_b)

          # Initialize results list
          feedback_messages <- list()
          all_correct <- TRUE

          # Check Question A
          if (!result_a$exists) {
            feedback_messages <- append(feedback_messages, list(
              "❌ **Vraag a niet gevonden**: Definieer `vraag_a` met het percentage flesjes tussen 32cl en 34cl"
            ))
            all_correct <- FALSE
          } else if (!result_a$correct) {
            feedback_messages <- append(feedback_messages, list(
              paste("❌ **Vraag a incorrect**:", round(as.numeric(result_a$value), 2), "% (verwacht:", exp_a, "%)")
            ))
            all_correct <- FALSE
          } else {
            feedback_messages <- append(feedback_messages, list(
              paste("✅ **Vraag a correct**:", round(as.numeric(result_a$value), 2), "%")
            ))
          }

          # Check Question B  
          if (!result_b$exists) {
            feedback_messages <- append(feedback_messages, list(
              "❌ **Vraag b niet gevonden**: Definieer `vraag_b` met het percentage flesjes meer dan 35cl"
            ))
            all_correct <- FALSE
          } else if (!result_b$correct) {
            feedback_messages <- append(feedback_messages, list(
              paste("❌ **Vraag b incorrect**:", round(as.numeric(result_b$value), 2), "% (verwacht:", exp_b, "%)")
            ))
            all_correct <- FALSE  
          } else {
            feedback_messages <- append(feedback_messages, list(
              paste("✅ **Vraag b correct**:", round(as.numeric(result_b$value), 2), "%")
            ))
          }
          # Generate final result
          if (all_correct) {
            results$message <- "🍺 **Uitstekend! Beide vragen correct beantwoord**"
            results$details <- c(
              "**Trappistenbier Kwaliteitscontrole - Volledige Oplossing:**",
              "",
              "**📋 Gegeven:** N(33, 2) - μ = 33 cl, σ = 2 cl",
              "",
              paste("**📊 Vraag a:** ", round(as.numeric(result_a$value), 2), "% (38.30% verwacht) ✅"),
              "- Z₁ = (32-33)/2 = -0.5, Z₂ = (34-33)/2 = 0.5",
              "- P(-0.5 ≤ Z ≤ 0.5) = 0.6915 - 0.3085 = 0.3830 = **38.30%**",
              "",
              paste("**📊 Vraag b:** ", round(as.numeric(result_b$value), 2), "% (15.87% verwacht) ✅"),
              "- Z = (35-33)/2 = 1 → P(Z > 1) = 1 - 0.8413 = 0.1587 = **15.87%**",
              "",
              "**🎯 Interpretatie:**",
              paste("- ", round(as.numeric(result_a$value), 2), "% van de flesjes valt binnen bereik (32-34cl)"),
              paste("- ", round(as.numeric(result_b$value), 2), "% van de flesjes bevat meer dan 35cl"),
              "",
              "**🏆 Perfect! Je beheerst normaalverdelingen uitstekend!**"
            )
          } else {
            results$message <- "❌ **Één of meer antwoorden zijn incorrect**"
            results$details <- c(
              "**🍺 Trappistenbier Kwaliteitscontrole N(33, 2):**",
              "",
              feedback_messages,
              "",
              "**💡 Handmatige berekening:**",
              "1. Bereken Z-scores: Z = (X - μ) / σ",
              "2. Zoek P(Z ≤ z) op in Z-tabel",
              "3. Bereken interval/staart kansen",
              "4. Zet om naar percentage",
              "",
              "**🔗 Z-tabel:** https://www.belfactorij.nl/voorinloggen/kansverdelingen/Normaal.htm"
            )
          }
          
          return(results)
        }
      )
    }
  )
})