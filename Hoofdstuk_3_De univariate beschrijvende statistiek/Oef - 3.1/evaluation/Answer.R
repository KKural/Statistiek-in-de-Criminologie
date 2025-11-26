context({
  testcase(
    "",
    {
      testEqual(
        " ",
        function(env) {
          # Use the provided environment (env) instead of globalenv()
          results <- list()
          correct_count <- 0
          
          # Check each variable and store detailed results
          # Vraag 1: Hoeveel studenten drinken "dikwijls" energiedrankjes?
          if(exists("vraag1", envir = env)) {
            current_val <- as.numeric(get("vraag1", envir = env))
            results$vraag1 <- list(
              exists = TRUE,
              value = get("vraag1", envir = env),
              correct = current_val == 10,
              expected = 10
            )
            if(current_val == 10) correct_count <- correct_count + 1
          } else {
            results$vraag1 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 10)
          }
          
          # Vraag 2: Hoeveel procent is dat?
          if(exists("vraag2", envir = env)) {
            current_val <- as.numeric(get("vraag2", envir = env))
            results$vraag2 <- list(
              exists = TRUE,
              value = get("vraag2", envir = env),
              correct = abs(current_val - 3.23) < 0.01,
              expected = 3.23
            )
            if(abs(current_val - 3.23) < 0.01) correct_count <- correct_count + 1
          } else {
            results$vraag2 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 3.23)
          }
          
          # Vraag 3: Hoeveel procent drinkt zelden of nooit?
          if(exists("vraag3", envir = env)) {
            current_val <- as.numeric(get("vraag3", envir = env))
            results$vraag3 <- list(
              exists = TRUE,
              value = get("vraag3", envir = env),
              correct = abs(current_val - 72.58) < 0.01,
              expected = 72.58
            )
            if(abs(current_val - 72.58) < 0.01) correct_count <- correct_count + 1
          } else {
            results$vraag3 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 72.58)
          }
          
          # Vraag 4: Welke proportie drinkt minstens dikwijls?
          if(exists("vraag4", envir = env)) {
            current_val <- as.numeric(get("vraag4", envir = env))
            results$vraag4 <- list(
              exists = TRUE,
              value = get("vraag4", envir = env),
              correct = abs(current_val - 0.2097) < 0.001,
              expected = 0.2097
            )
            if(abs(current_val - 0.2097) < 0.001) correct_count <- correct_count + 1
          } else {
            results$vraag4 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 0.2097)
          }
          
          # Vraag 5: Effect missing data
          if(exists("vraag5", envir = env)) {
            current_val <- as.numeric(get("vraag5", envir = env))
            results$vraag5 <- list(
              exists = TRUE,
              value = get("vraag5", envir = env),
              correct = current_val == 2,
              expected = 2
            )
            if(current_val == 2) correct_count <- correct_count + 1
          } else {
            results$vraag5 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 2)
          }
          
          # Vraag 6: Hoeveel drinken hoogstens af en toe?
          if(exists("vraag6", envir = env)) {
            current_val <- as.numeric(get("vraag6", envir = env))
            results$vraag6 <- list(
              exists = TRUE,
              value = get("vraag6", envir = env),
              correct = current_val == 245,
              expected = 245
            )
            if(current_val == 245) correct_count <- correct_count + 1
          } else {
            results$vraag6 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 245)
          }
          
          # Generate feedback messages
          feedback_msgs <- c()
          
          # Vraag 1 feedback
          if (!results$vraag1$exists) {
            feedback_msgs <- c(feedback_msgs, "❌ **Vraag 1:** Variabele 'vraag1' niet gevonden.")
          } else if (!results$vraag1$correct) {
            feedback_msgs <- c(feedback_msgs, paste("❌ **Vraag 1 fout:** Je antwoordde", results$vraag1$value, "maar het juiste antwoord is 10. Zoek de absolute frequentie voor 'dikwijls' in de tabel."))
          } else {
            feedback_msgs <- c(feedback_msgs, "✅ **Vraag 1 correct:** 10 studenten drinken dikwijls energiedrankjes (absolute frequentie).")
          }
          
          # Vraag 2 feedback
          if (!results$vraag2$exists) {
            feedback_msgs <- c(feedback_msgs, "❌ **Vraag 2:** Variabele 'vraag2' niet gevonden.")
          } else if (!results$vraag2$correct) {
            feedback_msgs <- c(feedback_msgs, paste("❌ **Vraag 2 fout:** Je antwoordde", results$vraag2$value, "% maar het juiste antwoord is 3.23%. Proportie 0.0323 × 100 = 3.23%."))
          } else {
            feedback_msgs <- c(feedback_msgs, "✅ **Vraag 2 correct:** 3.23% (proportie 0.0323 × 100).")
          }
          
          # Vraag 3 feedback
          if (!results$vraag3$exists) {
            feedback_msgs <- c(feedback_msgs, "❌ **Vraag 3:** Variabele 'vraag3' niet gevonden.")
          } else if (!results$vraag3$correct) {
            feedback_msgs <- c(feedback_msgs, paste("❌ **Vraag 3 fout:** Je antwoordde", results$vraag3$value, "% maar het juiste antwoord is 72.58%. Tel proporties 'nooit' (0.6129) en 'zelden' (0.1129) op: 0.7258 × 100 = 72.58%."))
          } else {
            feedback_msgs <- c(feedback_msgs, "✅ **Vraag 3 correct:** 72.58% (0.6129 + 0.1129 = 0.7258 × 100).")
          }
          
          # Vraag 4 feedback
          if (!results$vraag4$exists) {
            feedback_msgs <- c(feedback_msgs, "❌ **Vraag 4:** Variabele 'vraag4' niet gevonden.")
          } else if (!results$vraag4$correct) {
            feedback_msgs <- c(feedback_msgs, paste("❌ **Vraag 4 fout:** Je antwoordde", results$vraag4$value, "maar het juiste antwoord is 0.2097. 'Minstens dikwijls' = 'dikwijls' + 'zeer vaak': 0.0323 + 0.1774 = 0.2097."))
          } else {
            feedback_msgs <- c(feedback_msgs, "✅ **Vraag 4 correct:** 0.2097 (0.0323 + 0.1774).")
          }
          
          # Vraag 5 feedback
          if (!results$vraag5$exists) {
            feedback_msgs <- c(feedback_msgs, "❌ **Vraag 5:** Variabele 'vraag5' niet gevonden.")
          } else if (!results$vraag5$correct) {
            feedback_msgs <- c(feedback_msgs, paste("❌ **Vraag 5 fout:** Je antwoordde", results$vraag5$value, "maar het juiste antwoord is 2. N wordt 360, 'zeer vaak' wordt 105 studenten (proportie 0.2917), alle andere proporties veranderen ook."))
          } else {
            feedback_msgs <- c(feedback_msgs, "✅ **Vraag 5 correct:** Het totale aantal stijgt naar 360, alle proporties veranderen (antwoord 2).")
          }
          
          # Vraag 6 feedback
          if (!results$vraag6$exists) {
            feedback_msgs <- c(feedback_msgs, "❌ **Vraag 6:** Variabele 'vraag6' niet gevonden.")
          } else if (!results$vraag6$correct) {
            feedback_msgs <- c(feedback_msgs, paste("❌ **Vraag 6 fout:** Je antwoordde", results$vraag6$value, "maar het juiste antwoord is 245. 'Hoogstens af en toe' = cumulatieve frequentie tot 'af en toe': 190 + 35 + 20 = 245."))
          } else {
            feedback_msgs <- c(feedback_msgs, "✅ **Vraag 6 correct:** 245 studenten (cumulatieve frequentie tot 'af en toe').")
          }
          
          # Add all feedback messages
          for(msg in feedback_msgs) {
            get_reporter()$add_message(msg, type = "markdown")
          }
          
          # Summary message
          get_reporter()$add_message(paste("\n**Resultaat:** Je hebt", correct_count, "van de 6 vragen goed beantwoord.\n"), type = "markdown")
          
          # Additional guidance
          if (correct_count < 6) {
            get_reporter()$add_message("💡 **Tip:** Let op het verschil tussen:\n- **Absolute frequentie**: het aantal observaties\n- **Proportie**: het aandeel (tussen 0 en 1)\n- **Percentage**: proportie × 100\n- **Cumulatieve waarden**: opgeteld tot en met die categorie", type = "markdown")
          }
          
          return(results)
        },
        expected = "all_correct",
        comparator = function(generated, expected, ...) {
          # Check if all 6 questions are correct
          all_correct <- all(sapply(generated, function(x) x$exists && x$correct))
          return(all_correct)
        }
      )
    }
  )
})