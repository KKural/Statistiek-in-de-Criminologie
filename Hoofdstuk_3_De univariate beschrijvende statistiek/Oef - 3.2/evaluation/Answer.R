context({
  testcase(
    "Controle van ordinale data-analyse stappen",
    {
      testEqual(
        "Controleer je stap-voor-stap antwoorden",
        function(env) {
          # Use the provided environment (env) instead of globalenv()
          results <- list()
          
          # Check each variable and store detailed results
          # Meetniveau
          if(exists("meetniveau", envir = env)) {
            current_val <- get("meetniveau", envir = env)
            results$meetniveau <- list(
              exists = TRUE,
              value = current_val,
              correct = tolower(trimws(current_val)) == "ordinaal",
              expected = "ordinaal"
            )
          } else {
            results$meetniveau <- list(exists = FALSE, value = NA, correct = FALSE, expected = "ordinaal")
          }
          
          # Modus
          if(exists("modus", envir = env)) {
            current_val <- get("modus", envir = env)
            results$modus <- list(
              exists = TRUE,
              value = current_val,
              correct = tolower(trimws(current_val)) == "noch tevreden, noch ontevreden",
              expected = "noch tevreden, noch ontevreden"
            )
          } else {
            results$modus <- list(exists = FALSE, value = NA, correct = FALSE, expected = "noch tevreden, noch ontevreden")
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
          
          # Meest relevante centraliteit
          if(exists("meest_relevante_centraliteit", envir = env)) {
            current_val <- get("meest_relevante_centraliteit", envir = env)
            results$meest_relevante <- list(
              exists = TRUE,
              value = current_val,
              correct = tolower(trimws(current_val)) == "mediaan",
              expected = "mediaan"
            )
          } else {
            results$meest_relevante <- list(exists = FALSE, value = NA, correct = FALSE, expected = "mediaan")
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
          
          # Variatiebreedte
          if(exists("variatiebreedte", envir = env)) {
            current_val <- get("variatiebreedte", envir = env)
            var_val <- tolower(trimws(current_val))
            results$variatiebreedte <- list(
              exists = TRUE,
              value = current_val,
              correct = var_val %in% c("zeer ontevreden tot zeer tevreden", "van zeer ontevreden tot zeer tevreden"),
              expected = "zeer ontevreden tot zeer tevreden"
            )
          } else {
            results$variatiebreedte <- list(exists = FALSE, value = NA, correct = FALSE, expected = "zeer ontevreden tot zeer tevreden")
          }
          
          # Totaal N (step 3)
          if(exists("totaal_n", envir = env)) {
            current_val <- get("totaal_n", envir = env)
            results$totaal_n <- list(
              exists = TRUE,
              value = current_val,
              correct = as.numeric(current_val) == 330,
              expected = 330
            )
          } else {
            results$totaal_n <- list(exists = FALSE, value = NA, correct = FALSE, expected = 330)
          }
          
          # IKA
          if(exists("ika", envir = env)) {
            current_val <- get("ika", envir = env)
            ika_val <- tolower(trimws(current_val))
            results$ika <- list(
              exists = TRUE,
              value = current_val,
              correct = ika_val %in% c("ontevreden tot tevreden", "van ontevreden tot tevreden"),
              expected = "ontevreden tot tevreden"
            )
          } else {
            results$ika <- list(exists = FALSE, value = NA, correct = FALSE, expected = "ontevreden tot tevreden")
          }
          
          # Return results directly (no globalenv needed)
          return(results)
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          # Use generated results instead of globalenv
          results <- generated
          
          feedback_lines <- c()
          correct_count <- sum(sapply(results, function(x) x$correct))
          total_questions <- length(results)
          
          # Generate feedback for each question
          if(results$meetniveau$exists && results$meetniveau$correct) {
            feedback_lines <- c(feedback_lines, "✓ STAP 1 - MEETNIVEAU CORRECT: Ordinaal (rangorde maar geen gelijke afstanden)")
          } else {
            feedback_lines <- c(feedback_lines, "✗ STAP 1 - MEETNIVEAU: Expected 'ordinaal'")
          }
          
          if(results$totaal_n$exists && results$totaal_n$correct) {
            feedback_lines <- c(feedback_lines, "✓ STAP 3 - TOTAAL N CORRECT: 33+84+102+63+48 = 330")
          } else {
            feedback_lines <- c(feedback_lines, "✗ STAP 3 - TOTAAL N: Expected 330")
          }
          
          if(results$modus$exists && results$modus$correct) {
            feedback_lines <- c(feedback_lines, "✓ STAP 4.1 - MODUS CORRECT: Categorie met hoogste frequentie (102)")
          } else {
            feedback_lines <- c(feedback_lines, "✗ STAP 4.1 - MODUS: Expected 'noch tevreden, noch ontevreden'")
          }
          
          if(results$mediaan$exists && results$mediaan$correct) {
            feedback_lines <- c(feedback_lines, "✓ STAP 4.2 - MEDIAAN CORRECT: 165,5ste waarneming")
          } else {
            feedback_lines <- c(feedback_lines, "✗ STAP 4.2 - MEDIAAN: Expected 'noch tevreden, noch ontevreden'")
          }
          
          if(results$meest_relevante$exists && results$meest_relevante$correct) {
            feedback_lines <- c(feedback_lines, "✓ STAP 4.3 - MEEST RELEVANT CORRECT: Mediaan geeft meer info dan modus")
          } else {
            feedback_lines <- c(feedback_lines, "✗ STAP 4.3 - MEEST RELEVANT: Expected 'mediaan'")
          }
          
          if(results$q1$exists && results$q1$correct) {
            feedback_lines <- c(feedback_lines, "✓ STAP 5.1 - Q1 CORRECT: 82,5ste waarneming")
          } else {
            feedback_lines <- c(feedback_lines, "✗ STAP 5.1 - Q1: Expected 'ontevreden'")
          }
          
          if(results$q3$exists && results$q3$correct) {
            feedback_lines <- c(feedback_lines, "✓ STAP 5.1 - Q3 CORRECT: 247,5ste waarneming")
          } else {
            feedback_lines <- c(feedback_lines, "✗ STAP 5.1 - Q3: Expected 'tevreden'")
          }
          
          if(results$variatiebreedte$exists && results$variatiebreedte$correct) {
            feedback_lines <- c(feedback_lines, "✓ STAP 5.2 - VARIATIEBREEDTE CORRECT: Van laagste tot hoogste categorie")
          } else {
            feedback_lines <- c(feedback_lines, "✗ STAP 5.2 - VARIATIEBREEDTE: Expected 'zeer ontevreden tot zeer tevreden'")
          }
          
          if(results$ika$exists && results$ika$correct) {
            feedback_lines <- c(feedback_lines, "✓ STAP 5.3 - IKA CORRECT: Bereik Q1 tot Q3 (middelste 50%)")
          } else {
            feedback_lines <- c(feedback_lines, "✗ STAP 5.3 - IKA: Expected 'ontevreden tot tevreden'")
          }
          
          feedback_lines <- c(feedback_lines, "", 
                             paste("=== SCORE:", correct_count, "/", total_questions, "==="),
                             "",
                             "=== STAP-VOOR-STAP SAMENVATTING ===",
                             "STAP 1: Meetniveau bepalen",
                             "STAP 3: Totaal N berekenen (som alle frequenties)", 
                             "STAP 4: Centraliteit (modus, mediaan, meest relevant)",
                             "STAP 5: Spreiding (Q1, Q3, variatiebreedte, IKA)")
          
          return(list(
            correct = (correct_count == total_questions),
            message = paste(feedback_lines, collapse = "\n")
          ))
        }
      )
    }
  )
})