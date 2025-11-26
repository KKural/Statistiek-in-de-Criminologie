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
          # Helper function to safely extract and convert values
          safe_get <- function(var_name, env) {
            if(exists(var_name, envir = env)) {
              val <- get(var_name, envir = env)
              # Check if it's a function (which shouldn't happen but let's be safe)
              if(is.function(val)) {
                return(list(exists = FALSE, value = "FUNCTION_ERROR", str_val = ""))
              }
              # Convert to string safely
              str_val <- tryCatch({
                tolower(trimws(as.character(val)))
              }, error = function(e) {
                ""
              })
              return(list(exists = TRUE, value = val, str_val = str_val))
            } else {
              return(list(exists = FALSE, value = NA, str_val = ""))
            }
          }
          
          # Vraag a: Meetniveau
          vraag_a_info <- safe_get("vraag_a", env)
          results$vraag_a <- list(
            exists = vraag_a_info$exists,
            value = vraag_a_info$value,
            correct = vraag_a_info$exists && vraag_a_info$str_val == "ordinaal",
            expected = "ordinaal"
          )
          
          # Mediaan
          mediaan_info <- safe_get("mediaan", env)
          results$mediaan <- list(
            exists = mediaan_info$exists,
            value = mediaan_info$value,
            correct = mediaan_info$exists && mediaan_info$str_val == "noch tevreden, noch ontevreden",
            expected = "noch tevreden, noch ontevreden"
          )
          
          # Q1
          q1_info <- safe_get("q1", env)
          results$q1 <- list(
            exists = q1_info$exists,
            value = q1_info$value,
            correct = q1_info$exists && q1_info$str_val == "ontevreden",
            expected = "ontevreden"
          )
          
          # Q3
          q3_info <- safe_get("q3", env)
          results$q3 <- list(
            exists = q3_info$exists,
            value = q3_info$value,
            correct = q3_info$exists && q3_info$str_val == "tevreden",
            expected = "tevreden"
          )
          
          # IKA
          ika_info <- safe_get("ika", env)
          ika_correct <- ika_info$exists && ika_info$str_val %in% c("ontevreden tot tevreden", "ontevreden naar tevreden", "van ontevreden tot tevreden")
          results$ika <- list(
            exists = ika_info$exists,
            value = ika_info$value,
            correct = ika_correct,
            expected = "ontevreden tot tevreden"
          )
          
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