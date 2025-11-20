context({
  testcase(
    "Classificatie van variabelen",
    {
      testEqual(
        "Alle variabelen correct geclassificeerd",
        function(env) {
          # Use the provided environment (env) instead of globalenv()
          results <- list()
          
          # Check each variable and store detailed results
          # Favoriete keuze
          if(exists("favoriete_keuze", envir = env)) {
            current_val <- tolower(as.character(get("favoriete_keuze", envir = env)))
            results$favoriete_keuze <- list(
              exists = TRUE,
              value = get("favoriete_keuze", envir = env),
              correct = current_val == "nominaal",
              expected = "Nominaal"
            )
          } else {
            results$favoriete_keuze <- list(exists = FALSE, value = NA, correct = FALSE, expected = "Nominaal")
          }
          
          # Leeftijd
          if(exists("leeftijd", envir = env)) {
            current_val <- tolower(as.character(get("leeftijd", envir = env)))
            results$leeftijd <- list(
              exists = TRUE,
              value = get("leeftijd", envir = env),
              correct = current_val == "ratio",
              expected = "Ratio"
            )
          } else {
            results$leeftijd <- list(exists = FALSE, value = NA, correct = FALSE, expected = "Ratio")
          }
          
          # Geslacht
          if(exists("geslacht", envir = env)) {
            current_val <- tolower(as.character(get("geslacht", envir = env)))
            results$geslacht <- list(
              exists = TRUE,
              value = get("geslacht", envir = env),
              correct = current_val == "nominaal",
              expected = "Nominaal"
            )
          } else {
            results$geslacht <- list(exists = FALSE, value = NA, correct = FALSE, expected = "Nominaal")
          }
          
          # Studierichting
          if(exists("studierichting", envir = env)) {
            current_val <- tolower(as.character(get("studierichting", envir = env)))
            results$studierichting <- list(
              exists = TRUE,
              value = get("studierichting", envir = env),
              correct = current_val == "nominaal",
              expected = "Nominaal"
            )
          } else {
            results$studierichting <- list(exists = FALSE, value = NA, correct = FALSE, expected = "Nominaal")
          }
          
          # Studentnummer
          if(exists("studentnummer", envir = env)) {
            current_val <- tolower(as.character(get("studentnummer", envir = env)))
            results$studentnummer <- list(
              exists = TRUE,
              value = get("studentnummer", envir = env),
              correct = current_val == "nominaal",
              expected = "Nominaal"
            )
          } else {
            results$studentnummer <- list(exists = FALSE, value = NA, correct = FALSE, expected = "Nominaal")
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
          
          # Create detailed output showing all variables
          feedback_parts <- c("## **Resultaten per variabele:**\n")
          
          # Create a table-like output
          feedback_parts <- c(feedback_parts, "| Variabele | Jouw antwoord | Verwacht | Status |")  
          feedback_parts <- c(feedback_parts, "|-----------|---------------|----------|--------|")
          
          variable_names <- c(
            "favoriete_keuze" = "Favoriete keuze",
            "leeftijd" = "Leeftijd", 
            "geslacht" = "Geslacht",
            "studierichting" = "Studierichting",
            "studentnummer" = "Studentnummer"
          )
          
          for(var_key in names(variable_names)) {
            var_display <- variable_names[var_key]
            result <- results[[var_key]]
            
            if(!result$exists) {
              your_answer <- "*Ontbreekt*"
              status <- "❌"
            } else if(result$correct) {
              your_answer <- result$value
              status <- "✅"
            } else {
              your_answer <- result$value
              status <- "❌"
            }
            
            feedback_parts <- c(feedback_parts, paste0("| ", var_display, " | ", your_answer, " | ", result$expected, " | ", status, " |"))
          }
          
          if (generated == expected) {
            feedback_parts <- c(feedback_parts, "\n✅ **Perfecte score! Alle variabelen correct geclassificeerd.**")
            feedback_parts <- c(feedback_parts, "\n**Uitstekend!** Je begrijpt de verschillende meetniveaus goed.")
          } else {
            # Count correct/incorrect for summary
            correct_count <- sum(sapply(results, function(x) x$correct))
            total_count <- length(results)
            feedback_parts <- c(feedback_parts, paste0("\n❌ **Score: ", correct_count, "/", total_count, " variabelen correct**\n"))
            
            # Add helpful tips for incorrect answers
            incorrect_vars <- sapply(results, function(x) !x$correct)
            if(any(incorrect_vars)) {
              feedback_parts <- c(feedback_parts, "**Tips voor de foute antwoorden:**")
              
              if(!results$favoriete_keuze$correct) {
                if(!results$favoriete_keuze$exists) {
                  feedback_parts <- c(feedback_parts, "• **Favoriete keuze**: Gebruik: `favoriete_keuze <- \"Nominaal\"`")
                } else {
                  feedback_parts <- c(feedback_parts, "• **Favoriete keuze**: Google, Bibliotheek, Wikipedia zijn categorieën zonder ordening → Nominaal")
                }
              }
              
              if(!results$leeftijd$correct) {
                if(!results$leeftijd$exists) {
                  feedback_parts <- c(feedback_parts, "• **Leeftijd**: Gebruik: `leeftijd <- \"Ratio\"`")
                } else {
                  feedback_parts <- c(feedback_parts, "• **Leeftijd**: Heeft echt nulpunt (0 jaar = geen leeftijd) → Ratio")
                }
              }
              
              if(!results$geslacht$correct) {
                if(!results$geslacht$exists) {
                  feedback_parts <- c(feedback_parts, "• **Geslacht**: Gebruik: `geslacht <- \"Nominaal\"`")
                } else {
                  feedback_parts <- c(feedback_parts, "• **Geslacht**: Man/vrouw zijn categorieën zonder ordening → Nominaal")
                }
              }
              
              if(!results$studierichting$correct) {
                if(!results$studierichting$exists) {
                  feedback_parts <- c(feedback_parts, "• **Studierichting**: Gebruik: `studierichting <- \"Nominaal\"`")
                } else {
                  feedback_parts <- c(feedback_parts, "• **Studierichting**: Verschillende richtingen zonder ordening → Nominaal")
                }
              }
              
              if(!results$studentnummer$correct) {
                if(!results$studentnummer$exists) {
                  feedback_parts <- c(feedback_parts, "• **Studentnummer**: Gebruik: `studentnummer <- \"Nominaal\"`")
                } else {
                  feedback_parts <- c(feedback_parts, "• **Studentnummer**: Alleen identificatie, geen rekenkundige betekenis → Nominaal")
                }
              }
            }
          }
          
          # Always add educational content
          feedback_parts <- c(feedback_parts, "**Meetniveaus uitleg:**")
          feedback_parts <- c(feedback_parts, "• **Nominaal**: Categorieën zonder ordening (bijv. kleuren, geslacht)")
          feedback_parts <- c(feedback_parts, "• **Ordinaal**: Categorieën met ordening (bijv. schoolcijfers: slecht < goed < uitstekend)")
          feedback_parts <- c(feedback_parts, "• **Interval**: Getallen met gelijke afstanden, geen echt nulpunt (bijv. temperatuur in °C)")
          feedback_parts <- c(feedback_parts, "• **Ratio**: Getallen met gelijke afstanden én echt nulpunt (bijv. leeftijd, gewicht)")
          
          get_reporter()$add_message(paste(feedback_parts, collapse = "\n\n"), type = "markdown")
          }
          
          generated == expected
        }
      )
    }
  )
})