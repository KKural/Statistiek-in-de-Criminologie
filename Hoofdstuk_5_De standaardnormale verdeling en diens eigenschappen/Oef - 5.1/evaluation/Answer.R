context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          results <- list()

          # Expected correct answers
          exp_z1_a <- -3       # (20 - 42.5) / 7.5
          exp_z2_a <- -2.33    # (25 - 42.5) / 7.5
          exp_p_z1_a <- 0.0013 # P(Z ≤ -3)
          exp_p_z2_a <- 0.0099 # P(Z ≤ -2.33)
          exp_verschil_a <- 0.0086 # 0.0099 - 0.0013
          exp_a <- 0.86        # 0.0086 * 100
          exp_b <- 8.08        # P(X < 32) = 8.08%
          exp_c <- 96.41       # P(X > 29) = 96.41%

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

          # Check all answers for question a (all steps)
          results$z1_a <- check_value("z1_a", exp_z1_a, tol = 0.05)
          results$z2_a <- check_value("z2_a", exp_z2_a, tol = 0.05)
          results$p_z1_a <- check_value("p_z1_a", exp_p_z1_a, tol = 0.001)
          results$p_z2_a <- check_value("p_z2_a", exp_p_z2_a, tol = 0.001)
          results$verschil_a <- check_value("verschil_a", exp_verschil_a, tol = 0.001)
          results$vraag_a <- check_value("vraag_a", exp_a, tol = 0.05, expect_percent = TRUE)
          
          # Check final answers for b and c (expecting percentage strings)
          results$vraag_b <- check_value("vraag_b", exp_b, tol = 0.05, expect_percent = TRUE)
          results$vraag_c <- check_value("vraag_c", exp_c, tol = 0.05, expect_percent = TRUE)

          assign("detailed_results", results, envir = globalenv())

          all_correct <- all(sapply(results, function(x) x$correct))
          return(all_correct)
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("detailed_results", envir = globalenv())

          qnames <- c(
            z1_a = "a.1) Z-score voor X = 20",
            z2_a = "a.2) Z-score voor X = 25",
            p_z1_a = "a.3) P(Z ≤ z1_a)",
            p_z2_a = "a.4) P(Z ≤ z2_a)",
            verschil_a = "a.5) Verschil tussen kansen",
            vraag_a = "a.6) Eindantwoord percentage",
            vraag_b = "b) Kans boete lager dan 32€",
            vraag_c = "c) Kans boete hoger dan 29€"
          )

          # Feedback for wrong answers - question a
          wrong_msg_a <- function(val) {
            if (abs(val - 0.86) < 0.01) return("✅ Juist!")
            if (abs(val - 0.0086) < 0.001) return("Je gaf 0.0086, maar dit is fout. Geef het antwoord als **percentage** (0.86, niet 0.0086). Het juiste antwoord is 0.86.")
            if (abs(val - 86) < 1) return("Je gaf 86, maar dit is fout. Geef het antwoord als decimaal percentage (0.86, niet 86). Het juiste antwoord is 0.86.")
            if (abs(val - 0.13) < 0.01) return("Je gaf 0.13, maar dit is fout. Controleer je berekening. Het juiste antwoord is 0.86.")
            return(paste0("Je gaf ", val, ", maar dit is fout. Bereken handmatig: Z-scores, zoek kansen op in tabel, bereken verschil en zet om in %. Het juiste antwoord is 0.86."))
          }

          # Feedback for wrong answers - question b
          wrong_msg_b <- function(val) {
            if (abs(val - 8.08) < 0.01) return("✅ Juist!")
            if (abs(val - 0.0808) < 0.001) return("Je gaf 0.0808, maar dit is fout. Geef het antwoord als **percentage** (8.08, niet 0.0808). Het juiste antwoord is 8.08.")
            if (abs(val - 91.92) < 0.1) return("Je gaf 91.92, maar dit is fout. Dit is P(X > 32), niet P(X < 32). Je moet 1 - 0.9192 berekenen. Het juiste antwoord is 8.08.")
            return(paste0("Je gaf ", val, ", maar dit is fout. Bereken: (32-42.5)/7.5 = -1.4 → P(Z ≤ -1.4) = 0.0808 = 8.08%. Het juiste antwoord is 8.08."))
          }

          # Feedback for wrong answers - question c
          wrong_msg_c <- function(val) {
            if (abs(val - 96.41) < 0.01) return("✅ Juist!")
            if (abs(val - 0.9641) < 0.001) return("Je gaf 0.9641, maar dit is fout. Geef het antwoord als **percentage** (96.41, niet 0.9641). Het juiste antwoord is 96.41.")
            if (abs(val - 3.59) < 0.1) return("Je gaf 3.59, maar dit is fout. Dit is P(X < 29), niet P(X > 29). Je bent het complement vergeten. Het juiste antwoord is 96.41.")
            return(paste0("Je gaf ", val, ", maar dit is fout. Bereken: (29-42.5)/7.5 = -1.8 → P(Z ≤ -1.8) = 0.0359. Dan: P(X > 29) = 1 - 0.0359 = 0.9641 = 96.41%. Het juiste antwoord is 96.41."))
          }

          # Build feedback string directly with proper line breaks
          feedback_text <- "**Resultaten per vraag:**\n\n"
          
          # Question A - all steps
          feedback_text <- paste0(feedback_text, "**Vraag A:**\n")
          for (q in c("z1_a", "z2_a", "p_z1_a", "p_z2_a", "verschil_a", "vraag_a")) {
            if (results[[q]]$exists) {
              if (results[[q]]$correct) {
                feedback_text <- paste0(feedback_text, "✅ ", qnames[[q]], " **Correct! (", results[[q]]$value, ")**\n\n")
              } else {
                if (q == "vraag_a") msg <- wrong_msg_a(results[[q]]$value)
                else msg <- paste0("Je gaf ", results[[q]]$value, ", maar dit is fout. Het juiste antwoord is ", results[[q]]$expected, ".")
                feedback_text <- paste0(feedback_text, "❌ ", qnames[[q]], " **Fout.** ", msg, "\n\n")
              }
            } else {
              feedback_text <- paste0(feedback_text, "❌ ", qnames[[q]], " **Je hebt geen antwoord gegeven.**\n\n")
            }
          }
          
          # Question B
          feedback_text <- paste0(feedback_text, "**Vraag B:**\n")
          q <- "vraag_b"
          if (results[[q]]$exists) {
            if (results[[q]]$correct) {
              feedback_text <- paste0(feedback_text, "✅ ", qnames[[q]], " **Correct! (", results[[q]]$value, ")**\n\n")
            } else {
              msg <- wrong_msg_b(results[[q]]$value)
              feedback_text <- paste0(feedback_text, "❌ ", qnames[[q]], " **Fout.** ", msg, "\n\n")
            }
          } else {
            feedback_text <- paste0(feedback_text, "❌ ", qnames[[q]], " **Je hebt geen antwoord gegeven.**\n\n")
          }
          
          # Question C
          feedback_text <- paste0(feedback_text, "**Vraag C:**\n")
          q <- "vraag_c"
          if (results[[q]]$exists) {
            if (results[[q]]$correct) {
              feedback_text <- paste0(feedback_text, "✅ ", qnames[[q]], " **Correct! (", results[[q]]$value, ")**\n\n")
            } else {
              msg <- wrong_msg_c(results[[q]]$value)
              feedback_text <- paste0(feedback_text, "❌ ", qnames[[q]], " **Fout.** ", msg, "\n\n")
            }
          } else {
            feedback_text <- paste0(feedback_text, "❌ ", qnames[[q]], " **Je hebt geen antwoord gegeven.**\n\n")
          }

          get_reporter()$add_message(feedback_text, type = "markdown")
          generated == expected
        }
      )
    }
  )
})
