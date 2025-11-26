context({
  testcase(
    "Controle van werkuren analyse - interval data",
    {
      testEqual(
        "Controleer je stap-voor-stap antwoorden voor werkuren statistieken",
        function(env) {
          results <- list()
          
          # Data: 24, 36, 35, 28, 24, 28, 24, 36, 32, 36, 40, 38, 36, 34, 40, 36, 32, 36, 40, 36
          # Expected answers based on image calculations
          
          # STAP 1a: Centraliteit maten
          if (exists("modus", envir = env)) {
            current_val <- get("modus", envir = env)
            results$modus <- list(
              exists = TRUE,
              value = current_val,
              correct = as.numeric(current_val) == 36,
              expected = 36
            )
          } else {
            results$modus <- list(exists = FALSE, value = NA, correct = FALSE, expected = 36)
          }
          
          if (exists("mediaan", envir = env)) {
            current_val <- get("mediaan", envir = env)
            results$mediaan <- list(
              exists = TRUE,
              value = current_val,
              correct = as.numeric(current_val) == 36,
              expected = 36
            )
          } else {
            results$mediaan <- list(exists = FALSE, value = NA, correct = FALSE, expected = 36)
          }
          
          if (exists("gemiddelde", envir = env)) {
            current_val <- as.numeric(get("gemiddelde", envir = env))
            results$gemiddelde <- list(
              exists = TRUE,
              value = current_val,
              correct = abs(current_val - 33.55) < 0.01,
              expected = 33.55
            )
          } else {
            results$gemiddelde <- list(exists = FALSE, value = NA, correct = FALSE, expected = 33.55)
          }
          
          # STAP 1b: Spreiding maten
          if (exists("variatiebreedte", envir = env)) {
            current_val <- as.numeric(get("variatiebreedte", envir = env))
            results$variatiebreedte <- list(
              exists = TRUE,
              value = current_val,
              correct = current_val == 16,
              expected = 16
            )
          } else {
            results$variatiebreedte <- list(exists = FALSE, value = NA, correct = FALSE, expected = 16)
          }
          
          if (exists("q1", envir = env)) {
            current_val <- as.numeric(get("q1", envir = env))
            results$q1 <- list(
              exists = TRUE,
              value = current_val,
              correct = current_val == 30,
              expected = 30
            )
          } else {
            results$q1 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 30)
          }
          
          if (exists("q3", envir = env)) {
            current_val <- as.numeric(get("q3", envir = env))
            results$q3 <- list(
              exists = TRUE,
              value = current_val,
              correct = current_val == 36,
              expected = 36
            )
          } else {
            results$q3 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 36)
          }
          
          if (exists("ika", envir = env)) {
            current_val <- as.numeric(get("ika", envir = env))
            results$ika <- list(
              exists = TRUE,
              value = current_val,
              correct = current_val == 6,
              expected = 6
            )
          } else {
            results$ika <- list(exists = FALSE, value = NA, correct = FALSE, expected = 6)
          }
          
          # STAP 1c: Parameter keuze
          if (exists("meest_relevante_centraliteit", envir = env)) {
            current_val <- tolower(trimws(as.character(get("meest_relevante_centraliteit", envir = env))))
            results$meest_relevante_centraliteit <- list(
              exists = TRUE,
              value = current_val,
              correct = current_val == "gemiddelde",
              expected = "gemiddelde"
            )
          } else {
            results$meest_relevante_centraliteit <- list(exists = FALSE, value = NA, correct = FALSE, expected = "gemiddelde")
          }
          
          if (exists("meest_relevante_spreiding", envir = env)) {
            current_val <- tolower(trimws(as.character(get("meest_relevante_spreiding", envir = env))))
            results$meest_relevante_spreiding <- list(
              exists = TRUE,
              value = current_val,
              correct = current_val %in% c("interkwartielafstand", "variatiebreedte"),
              expected = "interkwartielafstand"
            )
          } else {
            results$meest_relevante_spreiding <- list(exists = FALSE, value = NA, correct = FALSE, expected = "interkwartielafstand")
          }
          
          if (exists("reden", envir = env)) {
            current_val <- tolower(trimws(as.character(get("reden", envir = env))))
            results$reden <- list(
              exists = TRUE,
              value = current_val,
              correct = current_val == "gebruikt alle informatie",
              expected = "gebruikt alle informatie"
            )
          } else {
            results$reden <- list(exists = FALSE, value = NA, correct = FALSE, expected = "gebruikt alle informatie")
          }
          
          # STAP 2: Afwijkingen
          if (exists("afwijkingen", envir = env)) {
            current_val <- as.numeric(get("afwijkingen", envir = env))
            expected_vec <- c(-9.55, 2.45, 1.45, -5.55, -9.55, -5.55, -9.55, 2.45, -1.55, 2.45, 6.45, 4.45, 2.45, 0.45, 6.45, 2.45, -1.55, 2.45, 6.45, 2.45)
            
            results$afwijkingen <- list(
              exists = TRUE,
              value = current_val,
              correct = is.numeric(current_val) && length(current_val) == 20 && 
                        all(abs(current_val - expected_vec) < 0.01),
              expected = expected_vec
            )
          } else {
            results$afwijkingen <- list(exists = FALSE, value = NA, correct = FALSE, expected = "vector van 20 afwijkingen")
          }
          
          if (exists("gekwadrateerde_afwijkingen", envir = env)) {
            current_val <- as.numeric(get("gekwadrateerde_afwijkingen", envir = env))
            expected_vec <- c(91.2025, 6.0025, 2.1025, 30.8025, 91.2025, 30.8025, 91.2025, 6.0025, 2.4025, 6.0025, 41.6025, 19.8025, 6.0025, 0.2025, 41.6025, 6.0025, 2.4025, 6.0025, 41.6025, 6.0025)
            
            results$gekwadrateerde_afwijkingen <- list(
              exists = TRUE,
              value = current_val,
              correct = is.numeric(current_val) && length(current_val) == 20 && 
                        all(abs(current_val - expected_vec) < 0.01),
              expected = expected_vec
            )
          } else {
            results$gekwadrateerde_afwijkingen <- list(exists = FALSE, value = NA, correct = FALSE, expected = "vector van 20 gekwadrateerde afwijkingen")
          }
          
          # STAP 3: Variantie en standaardafwijking
          if (exists("sum_of_squares", envir = env)) {
            current_val <- as.numeric(get("sum_of_squares", envir = env))
            results$sum_of_squares <- list(
              exists = TRUE,
              value = current_val,
              correct = abs(current_val - 528.95) < 0.01,
              expected = 528.95
            )
          } else {
            results$sum_of_squares <- list(exists = FALSE, value = NA, correct = FALSE, expected = 528.95)
          }
          
          if (exists("variantie", envir = env)) {
            current_val <- as.numeric(get("variantie", envir = env))
            results$variantie <- list(
              exists = TRUE,
              value = current_val,
              correct = abs(current_val - 27.8295) < 0.01,
              expected = 27.8295
            )
          } else {
            results$variantie <- list(exists = FALSE, value = NA, correct = FALSE, expected = 27.8295)
          }
          
          if (exists("standaardafwijking", envir = env)) {
            current_val <- as.numeric(get("standaardafwijking", envir = env))
            results$standaardafwijking <- list(
              exists = TRUE,
              value = current_val,
              correct = abs(current_val - 5.2763) < 0.01,
              expected = 5.2763
            )
          } else {
            results$standaardafwijking <- list(exists = FALSE, value = NA, correct = FALSE, expected = 5.2763)
          }
          
          if (exists("variatiecoefficient", envir = env)) {
            current_val <- as.numeric(get("variatiecoefficient", envir = env))
            results$variatiecoefficient <- list(
              exists = TRUE,
              value = current_val,
              correct = abs(current_val - 0.1573) < 0.01,
              expected = 0.1573
            )
          } else {
            results$variatiecoefficient <- list(exists = FALSE, value = NA, correct = FALSE, expected = 0.1573)
          }
          
          # Count correct answers
          correct_answers <- sum(sapply(results, function(x) x$correct))
          total_questions <- length(results)
          
          # Generate feedback
          feedback_lines <- c(
            "## 📊 **WERKUREN ANALYSE - RESULTATEN**",
            "",
            "### **STAP 1a - CENTRALITEIT MATEN:**"
          )
          
          if (results$modus$correct) {
            feedback_lines <- c(feedback_lines, "**MODUS:** 36 (komt 7 keer voor) ✅")
          } else {
            feedback_lines <- c(feedback_lines, "**MODUS:** 36 (komt 7 keer voor) ❌")
          }
          
          if (results$mediaan$correct) {
            feedback_lines <- c(feedback_lines, "**MEDIAAN:** 36 (middelste waarde van 20 observaties) ✅")
          } else {
            feedback_lines <- c(feedback_lines, "**MEDIAAN:** 36 (middelste waarde van 20 observaties) ❌")
          }
          
          if (results$gemiddelde$correct) {
            feedback_lines <- c(feedback_lines, "**GEMIDDELDE:** 33.55 (671 ÷ 20) ✅")
          } else {
            feedback_lines <- c(feedback_lines, "**GEMIDDELDE:** 33.55 (671 ÷ 20) ❌")
          }
          
          feedback_lines <- c(
            feedback_lines,
            "",
            "### **STAP 1b - SPREIDING MATEN:**"
          )
          
          if (results$variatiebreedte$correct) {
            feedback_lines <- c(feedback_lines, "**VARIATIEBREEDTE:** 16 (40 - 24) ✅")
          } else {
            feedback_lines <- c(feedback_lines, "**VARIATIEBREEDTE:** 16 (40 - 24) ❌")
          }
          
          if (results$q1$correct) {
            feedback_lines <- c(feedback_lines, "**Q1:** 30 (eerste kwartiel) ✅")
          } else {
            feedback_lines <- c(feedback_lines, "**Q1:** 30 (eerste kwartiel) ❌")
          }
          
          if (results$q3$correct) {
            feedback_lines <- c(feedback_lines, "**Q3:** 36 (derde kwartiel) ✅")
          } else {
            feedback_lines <- c(feedback_lines, "**Q3:** 36 (derde kwartiel) ❌")
          }
          
          if (results$ika$correct) {
            feedback_lines <- c(feedback_lines, "**IKA:** 6 (36 - 30) ✅")
          } else {
            feedback_lines <- c(feedback_lines, "**IKA:** 6 (36 - 30) ❌")
          }
          
          feedback_lines <- c(
            feedback_lines,
            "",
            "### **STAP 3 - GEAVANCEERDE MATEN:**"
          )
          
          if (results$sum_of_squares$correct) {
            feedback_lines <- c(feedback_lines, "**SOM GEKWADRATEERDE AFWIJKINGEN:** 528.95 ✅")
          } else {
            feedback_lines <- c(feedback_lines, "**SOM GEKWADRATEERDE AFWIJKINGEN:** 528.95 ❌")
          }
          
          if (results$variantie$correct) {
            feedback_lines <- c(feedback_lines, "**VARIANTIE:** 27.8295 (528.95 ÷ 19) ✅")
          } else {
            feedback_lines <- c(feedback_lines, "**VARIANTIE:** 27.8295 (528.95 ÷ 19) ❌")
          }
          
          if (results$standaardafwijking$correct) {
            feedback_lines <- c(feedback_lines, "**STANDAARDAFWIJKING:** 5.2763 (√27.8295) ✅")
          } else {
            feedback_lines <- c(feedback_lines, "**STANDAARDAFWIJKING:** 5.2763 (√27.8295) ❌")
          }
          
          if (results$variatiecoefficient$correct) {
            feedback_lines <- c(feedback_lines, "**VARIATIECOËFFICIËNT:** 0.1573 (5.2763 ÷ 33.55) ✅")
          } else {
            feedback_lines <- c(feedback_lines, "**VARIATIECOËFFICIËNT:** 0.1573 (5.2763 ÷ 33.55) ❌")
          }
          
          feedback_lines <- c(
            feedback_lines,
            "",
            paste0("**", correct_answers, " van ", total_questions, " juist**"),
            "",
            "🔍 **BELANGRIJKE REGELS VOOR INTERVAL DATA:**",
            "• **Alle centraliteit maten** zijn toegestaan (modus, mediaan, gemiddelde)",
            "• **Gemiddelde** is meestal meest informatief bij interval data",
            "• **Standaardafwijking** houdt rekening met alle waarden",
            "• **Variantiecoëfficiënt** maakt vergelijking tussen datasets mogelijk"
          )
          
          get_reporter()$add_message(
            paste(feedback_lines, collapse = "\n\n"),
            type = "markdown"
          )
          
          # Define expected and generated for testEqual
          generated <- correct_answers == total_questions
          expected <- TRUE
          
          # Return result
          generated == expected
        }
      )
    }
  )
})
