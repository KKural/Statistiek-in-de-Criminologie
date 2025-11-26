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
            current_val <- get("vraag_a", envir = env)
            results$vraag_a <- list(
              exists = TRUE,
              value = current_val,
              correct = tolower(trimws(current_val)) == "ordinaal",
              expected = "ordinaal"
            )
          } else {
            results$vraag_a <- list(exists = FALSE, value = NA, correct = FALSE, expected = "ordinaal")
          }
          
          # Mediaan
          if(exists("mediaan", envir = env)) {
            current_val <- get("mediaan", envir = env)
            results$mediaan <- list(
              exists = TRUE,
              value = current_val,
              correct = tolower(trimws(current_val)) == "noch tevreden, noch ontevreden",
              expected = "noch tevreden, noch ontevreden"
            )
          } else {
            results$mediaan <- list(exists = FALSE, value = NA, correct = FALSE, expected = "noch tevreden, noch ontevreden")
          }
          
          # Q1
          if(exists("q1", envir = env)) {
            current_val <- get("q1", envir = env)
            results$q1 <- list(
              exists = TRUE,
              value = current_val,
              correct = tolower(trimws(current_val)) == "ontevreden",
              expected = "ontevreden"
            )
          } else {
            results$q1 <- list(exists = FALSE, value = NA, correct = FALSE, expected = "ontevreden")
          }
          
          # Q3
          if(exists("q3", envir = env)) {
            current_val <- get("q3", envir = env)
            results$q3 <- list(
              exists = TRUE,
              value = current_val,
              correct = tolower(trimws(current_val)) == "tevreden",
              expected = "tevreden"
            )
          } else {
            results$q3 <- list(exists = FALSE, value = NA, correct = FALSE, expected = "tevreden")
          }
          
          # IKA
          if(exists("ika", envir = env)) {
            current_val <- get("ika", envir = env)
            ika_val <- tolower(trimws(current_val))
            results$ika <- list(
              exists = TRUE,
              value = current_val,
              correct = ika_val %in% c("ontevreden tot tevreden", "ontevreden naar tevreden", "van ontevreden tot tevreden"),
              expected = "ontevreden tot tevreden"
            )
          } else {
            results$ika <- list(exists = FALSE, value = NA, correct = FALSE, expected = "ontevreden tot tevreden")
          }
          
          # Store results for use in comparator
          assign("detailed_results", results, envir = globalenv())
          
          # Return overall success
          all_correct <- all(sapply(results, function(x) x$correct))
          return(all_correct)
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          # Get detailed results from global environment
          results <- get("detailed_results", envir = globalenv())
          
          feedback_lines <- c()
          correct_count <- sum(sapply(results, function(x) x$correct))
          total_questions <- length(results)
          
          # Generate feedback for each question
          if(results$vraag_a$exists && results$vraag_a$correct) {
            feedback_lines <- c(feedback_lines, "✓ Vraag a CORRECT: Ordinaal meetniveau - rangorde maar geen gelijke afstanden")
          } else if(results$vraag_a$exists) {
            feedback_lines <- c(feedback_lines, paste("✗ Vraag a INCORRECT: Expected 'ordinaal', got:", results$vraag_a$value))
          } else {
            feedback_lines <- c(feedback_lines, "✗ Vraag a MISSING: Define vraag_a")
          }
          
          if(results$mediaan$exists && results$mediaan$correct) {
            feedback_lines <- c(feedback_lines, "✓ Mediaan CORRECT: 165,5ste waarneming")
          } else if(results$mediaan$exists) {
            feedback_lines <- c(feedback_lines, paste("✗ Mediaan INCORRECT: Expected 'noch tevreden, noch ontevreden', got:", results$mediaan$value))
          } else {
            feedback_lines <- c(feedback_lines, "✗ Mediaan MISSING: Define mediaan")
          }
          
          if(results$q1$exists && results$q1$correct) {
            feedback_lines <- c(feedback_lines, "✓ Q1 CORRECT: 82,5ste waarneming")
          } else if(results$q1$exists) {
            feedback_lines <- c(feedback_lines, paste("✗ Q1 INCORRECT: Expected 'ontevreden', got:", results$q1$value))
          } else {
            feedback_lines <- c(feedback_lines, "✗ Q1 MISSING: Define q1")
          }
          
          if(results$q3$exists && results$q3$correct) {
            feedback_lines <- c(feedback_lines, "✓ Q3 CORRECT: 247,5ste waarneming")
          } else if(results$q3$exists) {
            feedback_lines <- c(feedback_lines, paste("✗ Q3 INCORRECT: Expected 'tevreden', got:", results$q3$value))
          } else {
            feedback_lines <- c(feedback_lines, "✗ Q3 MISSING: Define q3")
          }
          
          if(results$ika$exists && results$ika$correct) {
            feedback_lines <- c(feedback_lines, "✓ IKA CORRECT: Bereik Q1 tot Q3")
          } else if(results$ika$exists) {
            feedback_lines <- c(feedback_lines, paste("✗ IKA INCORRECT: Expected range description, got:", results$ika$value))
          } else {
            feedback_lines <- c(feedback_lines, "✗ IKA MISSING: Define ika")
          }
          
          feedback_lines <- c(feedback_lines, "", paste("SCORE:", correct_count, "/", total_questions))
          
          return(list(
            correct = (correct_count == total_questions),
            message = paste(feedback_lines, collapse = "\n")
          ))
        }
      )
    }
  )
})