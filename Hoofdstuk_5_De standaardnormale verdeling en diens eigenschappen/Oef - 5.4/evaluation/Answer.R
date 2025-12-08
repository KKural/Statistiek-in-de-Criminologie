context({
  testcase(
    "",
    {
      testEqual(
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
              # Handle percentage strings like "38.30%"
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

          # Generate feedback for each question
          feedback <- list()
          
          for (qname in names(qnames)) {
            if (results[[qname]]$exists && results[[qname]]$correct) {
              feedback[[qname]] <- paste("✅", qnames[qname], ":", round(as.numeric(results[[qname]]$value), 2), "%")
            } else if (!results[[qname]]$exists) {
              feedback[[qname]] <- paste("❌", qnames[qname], ": variabele niet gevonden")
            } else {
              feedback[[qname]] <- paste("❌", qnames[qname], ":", round(as.numeric(results[[qname]]$value), 2), "% (verwacht:", results[[qname]]$expected, "%)")
            }
          }

          # Check if all correct
          if (all(sapply(results, function(x) x$correct))) {
            return(list(
              result = generated,
              readable_expected = "Beide antwoorden correct",
              readable_actual = paste(feedback, collapse = "\n"),
              description = paste(
                "🍺 **Uitstekend! Trappistenbier kwaliteitscontrole perfect opgelost!**\n\n",
                "**📊 Jouw antwoorden:**\n",
                paste(feedback, collapse = "\n"), "\n\n",
                "**📋 Gegeven:** N(33, 2) - μ = 33 cl, σ = 2 cl\n\n",
                "**Vraag a berekening:**\n",
                "- Z₁ = (32-33)/2 = -0.5, Z₂ = (34-33)/2 = 0.5\n",
                "- P(-0.5 ≤ Z ≤ 0.5) = 0.6915 - 0.3085 = 0.3830 = **38.30%**\n\n",
                "**Vraag b berekening:**\n",
                "- Z = (35-33)/2 = 1 → P(Z > 1) = 1 - 0.8413 = 0.1587 = **15.87%**\n\n",
                "**🏆 Perfect! Je beheerst normaalverdelingen uitstekend!**"
              )
            ))
          } else {
            return(list(
              result = generated,
              readable_expected = "38.30% en 15.87%",
              readable_actual = paste(feedback, collapse = "\n"),
              description = paste(
                "❌ **Trappistenbier kwaliteitscontrole - Nog niet correct**\n\n",
                "**📊 Jouw antwoorden:**\n",
                paste(feedback, collapse = "\n"), "\n\n",
                "**💡 Handmatige berekening:**\n",
                "1. Bereken Z-scores: Z = (X - μ) / σ\n",
                "2. Zoek P(Z ≤ z) op in Z-tabel\n",
                "3. Bereken interval/staart kansen\n",
                "4. Zet om naar percentage\n\n",
                "**🔗 Z-tabel:** https://www.belfactorij.nl/voorinloggen/kansverdelingen/Normaal.htm"
              )
            ))
          }
        }
      )
    }
  )
})