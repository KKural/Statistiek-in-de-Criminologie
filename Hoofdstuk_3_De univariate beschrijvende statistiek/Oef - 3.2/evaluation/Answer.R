context({
  testcase(
    "",
    {
      testEqual(
        " ",
        function(env) {
          # Use the provided environment (env) instead of globalenv()
          results <- list()
          
          # Check each variable and store detailed results
          # Vraag a: Meetniveau
          if(exists("vraag_a", envir = env)) {
            current_val <- tolower(trimws(as.character(get("vraag_a", envir = env))))
            results$vraag_a <- list(
              exists = TRUE,
              value = get("vraag_a", envir = env),
              correct = current_val == "ordinaal",
              expected = "ordinaal"
            )
          } else {
            results$vraag_a <- list(exists = FALSE, value = NA, correct = FALSE, expected = "ordinaal")
          }
          
          # Mediaan
          if(exists("mediaan", envir = env)) {
            current_val <- tolower(trimws(as.character(get("mediaan", envir = env))))
            results$mediaan <- list(
              exists = TRUE,
              value = get("mediaan", envir = env),
              correct = current_val == "noch tevreden, noch ontevreden",
              expected = "noch tevreden, noch ontevreden"
            )
          } else {
            results$mediaan <- list(exists = FALSE, value = NA, correct = FALSE, expected = "noch tevreden, noch ontevreden")
          }
          
          # Q1
          if(exists("q1", envir = env)) {
            current_val <- tolower(trimws(as.character(get("q1", envir = env))))
            results$q1 <- list(
              exists = TRUE,
              value = get("q1", envir = env),
              correct = current_val == "ontevreden",
              expected = "ontevreden"
            )
          } else {
            results$q1 <- list(exists = FALSE, value = NA, correct = FALSE, expected = "ontevreden")
          }
          
          # Q3
          if(exists("q3", envir = env)) {
            current_val <- tolower(trimws(as.character(get("q3", envir = env))))
            results$q3 <- list(
              exists = TRUE,
              value = get("q3", envir = env),
              correct = current_val == "tevreden",
              expected = "tevreden"
            )
          } else {
            results$q3 <- list(exists = FALSE, value = NA, correct = FALSE, expected = "tevreden")
          }
          
          # IKA
          if(exists("ika", envir = env)) {
            current_val <- tolower(trimws(as.character(get("ika", envir = env))))
            ika_correct <- current_val %in% c("ontevreden tot tevreden", "ontevreden naar tevreden", "van ontevreden tot tevreden")
            results$ika <- list(
              exists = TRUE,
              value = get("ika", envir = env),
              correct = ika_correct,
              expected = "ontevreden tot tevreden"
            )
          } else {
            results$ika <- list(exists = FALSE, value = NA, correct = FALSE, expected = "ontevreden tot tevreden")
          }
          
          return(results)
        },
        function(results) {
          # Generate detailed feedback using same style as 3.1
          feedback_lines <- c()
          correct_count <- 0
          total_questions <- 5
          
          # Vraag a feedback
          if(results$vraag_a$exists && results$vraag_a$correct) {
            feedback_lines <- c(feedback_lines, "✓ Vraag a CORRECT: Het meetniveau is ordinaal omdat tevredenheidscategorieën een rangorde hebben maar geen gelijke afstanden.")
            correct_count <- correct_count + 1
          } else if(results$vraag_a$exists) {
            feedback_lines <- c(feedback_lines, paste("✗ Vraag a INCORRECT: Het juiste antwoord is 'ordinaal'. Jouw antwoord:", results$vraag_a$value))
          } else {
            feedback_lines <- c(feedback_lines, "✗ Vraag a ONTBREEKT: Definieer vraag_a <- \"ordinaal\"")
          }
          
          # Mediaan feedback  
          if(results$mediaan$exists && results$mediaan$correct) {
            feedback_lines <- c(feedback_lines, "✓ Mediaan CORRECT: 'Noch tevreden, noch ontevreden' bevat de 165,5ste waarneming (N/2).")
            correct_count <- correct_count + 1
          } else if(results$mediaan$exists) {
            feedback_lines <- c(feedback_lines, paste("✗ Mediaan INCORRECT: Het juiste antwoord is 'noch tevreden, noch ontevreden'. Jouw antwoord:", results$mediaan$value))
          } else {
            feedback_lines <- c(feedback_lines, "✗ Mediaan ONTBREEKT: Definieer mediaan <- \"noch tevreden, noch ontevreden\"")
          }
          
          # Q1 feedback
          if(results$q1$exists && results$q1$correct) {
            feedback_lines <- c(feedback_lines, "✓ Q1 CORRECT: 'Ontevreden' bevat de 82,5ste waarneming (25%).")
            correct_count <- correct_count + 1
          } else if(results$q1$exists) {
            feedback_lines <- c(feedback_lines, paste("✗ Q1 INCORRECT: Het juiste antwoord is 'ontevreden'. Jouw antwoord:", results$q1$value))
          } else {
            feedback_lines <- c(feedback_lines, "✗ Q1 ONTBREEKT: Definieer q1 <- \"ontevreden\"")
          }
          
          # Q3 feedback
          if(results$q3$exists && results$q3$correct) {
            feedback_lines <- c(feedback_lines, "✓ Q3 CORRECT: 'Tevreden' bevat de 247,5ste waarneming (75%).")
            correct_count <- correct_count + 1
          } else if(results$q3$exists) {
            feedback_lines <- c(feedback_lines, paste("✗ Q3 INCORRECT: Het juiste antwoord is 'tevreden'. Jouw antwoord:", results$q3$value))
          } else {
            feedback_lines <- c(feedback_lines, "✗ Q3 ONTBREEKT: Definieer q3 <- \"tevreden\"")
          }
          
          # IKA feedback
          if(results$ika$exists && results$ika$correct) {
            feedback_lines <- c(feedback_lines, "✓ IKA CORRECT: Het bereik tussen Q1 en Q3 (middelste 50%).")
            correct_count <- correct_count + 1
          } else if(results$ika$exists) {
            feedback_lines <- c(feedback_lines, paste("✗ IKA INCORRECT: Beschrijf het bereik tussen Q1 en Q3. Jouw antwoord:", results$ika$value))
          } else {
            feedback_lines <- c(feedback_lines, "✗ IKA ONTBREEKT: Definieer ika als bereik tussen Q1 en Q3")
          }
          
          # Summary with educational content
          feedback_lines <- c(feedback_lines, "",
                             paste("SCORE:", correct_count, "/", total_questions),
                             "",
                             "=== ORDINAAL MEETNIVEAU ===",
                             "• Mediaan = 165,5ste waarneming (N/2 = 330/2)",  
                             "• Q1 = 82,5ste waarneming (25% van 330)",
                             "• Q3 = 247,5ste waarneming (75% van 330)",
                             "• IKA = bereik tussen Q1 en Q3 (middelste 50%)")
          
          return(paste(feedback_lines, collapse = "\n"))
        }
      )
    }
  )
})