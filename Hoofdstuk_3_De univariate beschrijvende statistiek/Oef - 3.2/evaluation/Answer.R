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
            current_val <- tolower(trimws(get("vraag_a", envir = env)))
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
            current_val <- tolower(trimws(get("mediaan", envir = env)))
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
            current_val <- tolower(trimws(get("q1", envir = env)))
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
            current_val <- tolower(trimws(get("q3", envir = env)))
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
            current_val <- tolower(trimws(get("ika", envir = env)))
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
          # Generate detailed feedback
          feedback <- c()
          score <- 0
          max_score <- 5
          
          # Evaluate Vraag a: Meetniveau
          if(results$vraag_a$exists && results$vraag_a$correct) {
            feedback <- c(feedback, "✓ Vraag a CORRECT: Het meetniveau is ordinaal omdat tevredenheidscategorieën een natuurlijke rangorde hebben maar geen gelijke afstanden.")
            score <- score + 1
          } else if(results$vraag_a$exists) {
            if(tolower(results$vraag_a$value) == "nominaal") {
              feedback <- c(feedback, "✗ Vraag a INCORRECT: Nominaal zou betekenen dat er geen rangorde is. Tevredenheidsniveaus hebben wel een rangorde van 'zeer ontevreden' naar 'zeer tevreden'.")
            } else if(tolower(results$vraag_a$value) %in% c("interval", "ratio")) {
              feedback <- c(feedback, "✗ Vraag a INCORRECT: Interval zou betekenen dat afstanden tussen categorieën gelijk zijn. Bij tevredenheid zijn de afstanden niet meetbaar.")
            } else {
              feedback <- c(feedback, paste("✗ Vraag a INCORRECT: Het antwoord is 'ordinaal' omdat er rangorde is maar geen gelijke afstanden. Jouw antwoord:", results$vraag_a$value))
            }
          } else {
            feedback <- c(feedback, "✗ Vraag a ONTBREEKT: Definieer vraag_a als \"ordinaal\".")
          }
          
          # Evaluate Mediaan
          if(results$mediaan$exists && results$mediaan$correct) {
            feedback <- c(feedback, "✓ Mediaan CORRECT: 'Noch tevreden, noch ontevreden' bevat de 165,5ste waarneming (N/2). Cumulatief: 117 < 165 ≤ 219.")
            score <- score + 1
          } else if(results$mediaan$exists) {
            feedback <- c(feedback, paste("✗ Mediaan INCORRECT: De mediaan is 'noch tevreden, noch ontevreden'. Dit is de categorie met de middelste positie (165,5ste waarneming). Jouw antwoord:", results$mediaan$value))
          } else {
            feedback <- c(feedback, "✗ Mediaan ONTBREEKT: Definieer mediaan als \"noch tevreden, noch ontevreden\".")
          }
          
          # Evaluate Q1
          if(results$q1$exists && results$q1$correct) {
            feedback <- c(feedback, "✓ Q1 CORRECT: 'Ontevreden' bevat de 82,5ste waarneming (25%). Cumulatief: 33 < 82,5 ≤ 117.")
            score <- score + 1
          } else if(results$q1$exists) {
            feedback <- c(feedback, paste("✗ Q1 INCORRECT: Q1 is 'ontevreden' (25% positie = 82,5ste waarneming). Jouw antwoord:", results$q1$value))
          } else {
            feedback <- c(feedback, "✗ Q1 ONTBREEKT: Definieer q1 als \"ontevreden\".")
          }
          
          # Evaluate Q3
          if(results$q3$exists && results$q3$correct) {
            feedback <- c(feedback, "✓ Q3 CORRECT: 'Tevreden' bevat de 247,5ste waarneming (75%). Cumulatief: 219 < 247,5 ≤ 282.")
            score <- score + 1
          } else if(results$q3$exists) {
            feedback <- c(feedback, paste("✗ Q3 INCORRECT: Q3 is 'tevreden' (75% positie = 247,5ste waarneming). Jouw antwoord:", results$q3$value))
          } else {
            feedback <- c(feedback, "✗ Q3 ONTBREEKT: Definieer q3 als \"tevreden\".")
          }
          
          # Evaluate IKA
          if(results$ika$exists && results$ika$correct) {
            feedback <- c(feedback, "✓ IKA CORRECT: Het bereik loopt van 'ontevreden' (Q1) tot 'tevreden' (Q3), waarin de middelste 50% valt.")
            score <- score + 1
          } else if(results$ika$exists) {
            feedback <- c(feedback, paste("✗ IKA INCORRECT: Beschrijf het bereik tussen Q1 en Q3, bijvoorbeeld 'ontevreden tot tevreden'. Jouw antwoord:", results$ika$value))
          } else {
            feedback <- c(feedback, "✗ IKA ONTBREEKT: Definieer ika als het bereik tussen Q1 en Q3.")
          }
          
          # Summary
          feedback <- c(feedback, "", 
                       paste("=== SCORE:", score, "/", max_score, "==="),
                       "",
                       "=== UITLEG ORDINAAL MEETNIVEAU ===",
                       "Stap 1: Bepaal welke maten je MAG berekenen:",
                       "• Nominaal: alleen modus",
                       "• Ordinaal: modus + mediaan + kwartielen", 
                       "• Interval/Ratio: alle maten",
                       "",
                       "Stap 2: Kies de maat met MEESTE informatie:",
                       "• Voor ordinaal: mediaan geeft meer info dan modus",
                       "• Spreiding: kwartielen en IKA (gebaseerd op posities)",
                       "",
                       "=== BEREKENINGEN ===",
                       "• Mediaan = 165,5ste waarneming (N/2 = 330/2)",
                       "• Q1 = 82,5ste waarneming (25% van 330)",
                       "• Q3 = 247,5ste waarneming (75% van 330)",
                       "• IKA = bereik tussen Q1 en Q3")
          
          return(paste(feedback, collapse = "\n"))
        }
      )
    }
  )
})