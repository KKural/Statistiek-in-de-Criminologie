context({
  testcase(
    "Classificatie van onderzoeksvraag",
    {
      testEqual(
        "Alle onderdelen correct geclassificeerd",
        function(env) {
          # Use the provided environment (env) instead of globalenv()
          results <- list()
          
          # Check each variable and store detailed results
          # Type vraag
          if(exists("type_vraag", envir = env)) {
            current_val <- tolower(as.character(get("type_vraag", envir = env)))
            results$type_vraag <- list(
              exists = TRUE,
              value = get("type_vraag", envir = env),
              correct = current_val == "univariate beschrijvende",
              expected = "univariate beschrijvende"
            )
          } else {
            results$type_vraag <- list(exists = FALSE, value = NA, correct = FALSE, expected = "univariate beschrijvende")
          }
          
          # Bestudeerde variabele
          if(exists("bestudeerde_variabele", envir = env)) {
            current_val <- tolower(as.character(get("bestudeerde_variabele", envir = env)))
            acceptable_answers <- c("het aantal gerapporteerde inbraken per maand in belgische steden", 
                                  "aantal inbraken per maand", 
                                  "inbraken per maand",
                                  "aantal gerapporteerde inbraken per maand")
            results$bestudeerde_variabele <- list(
              exists = TRUE,
              value = get("bestudeerde_variabele", envir = env),
              correct = current_val %in% acceptable_answers,
              expected = "Het aantal gerapporteerde inbraken per maand in Belgische steden"
            )
          } else {
            results$bestudeerde_variabele <- list(exists = FALSE, value = NA, correct = FALSE, expected = "Het aantal gerapporteerde inbraken per maand in Belgische steden")
          }
          
          # Meetniveau
          if(exists("meetniveau", envir = env)) {
            current_val <- tolower(as.character(get("meetniveau", envir = env)))
            acceptable_answers <- c("ratio", "kwantitatief (ratio)", "kwantitatief ratio")
            results$meetniveau <- list(
              exists = TRUE,
              value = get("meetniveau", envir = env),
              correct = current_val %in% acceptable_answers,
              expected = "ratio"
            )
          } else {
            results$meetniveau <- list(exists = FALSE, value = NA, correct = FALSE, expected = "ratio")
          }
          
          # Waarden
          if(exists("waarden", envir = env)) {
            current_val <- tolower(as.character(get("waarden", envir = env)))
            acceptable_answers <- c("natuurlijke getallen", "0, 1, 2, ...", "gehele getallen", "getallen", "0 of meer")
            results$waarden <- list(
              exists = TRUE,
              value = get("waarden", envir = env),
              correct = any(sapply(acceptable_answers, function(x) grepl(x, current_val, fixed = TRUE))),
              expected = "Natuurlijke getallen (0, 1, 2, ...)"
            )
          } else {
            results$waarden <- list(exists = FALSE, value = NA, correct = FALSE, expected = "Natuurlijke getallen (0, 1, 2, ...)")
          }
          
          # Generate numbered feedback
          feedback_parts <- c("## **Resultaten per onderdeel:**\n")
          
          counter <- 1
          variable_names <- c("Type onderzoeksvraag", "Bestudeerde variabele", "Meetniveau", "Mogelijke waarden")
          var_keys <- c("type_vraag", "bestudeerde_variabele", "meetniveau", "waarden")
          
          for (i in 1:length(var_keys)) {
            var_key <- var_keys[i]
            var_display <- variable_names[i]
            result <- results[[var_key]]
            
            if (!result$exists) {
              feedback_parts <- c(feedback_parts, paste(counter, ". **", var_display, "**: *Ontbreekt* ❌", sep = ""))
            } else if (result$correct) {
              feedback_parts <- c(feedback_parts, paste(counter, ". **", var_display, "**: ", result$value, " ✅", sep = ""))
            } else {
              feedback_parts <- c(feedback_parts, paste(counter, ". **", var_display, "**: ", result$value, " ❌", sep = ""))
            }
            counter <- counter + 1
          }
          
          # Check if all correct
          all_correct <- all(sapply(results, function(x) x$correct))
          
          if (all_correct) {
            feedback_parts <- c(feedback_parts, "\n✅ **Alle onderdelen correct geclassificeerd.**")
            feedback_parts <- c(feedback_parts, "\n**Uitstekend!** Je begrijpt onderzoeksvraag classificatie goed.")
          } else {
            # Add specific feedback for wrong answers
            incorrect_vars <- names(results)[sapply(results, function(x) !x$correct)]
            if (length(incorrect_vars) > 0) {
              feedback_parts <- c(feedback_parts, "**📚 Uitleg waarom deze antwoorden fout zijn:**")
              
              for (var_key in incorrect_vars) {
                result <- results[[var_key]]
                var_display <- variable_names[which(var_keys == var_key)]
                
                if (!result$exists) {
                  feedback_parts <- c(feedback_parts, paste("• **", var_display, "**: ❌ Variabele niet gevonden. Vergeet je de variabele te definiëren? Gebruik: `", var_key, " <- \"", result$expected, "\"`", sep = ""))
                } else {
                  student_answer <- tolower(as.character(result$value))
                  if (var_key == "type_vraag") {
                    if (student_answer == "bivariate beschrijvende") {
                      feedback_parts <- c(feedback_parts, paste("• **", var_display, "**: Je koos 'bivariate beschrijvende', maar dit is fout. Deze vraag gaat over slechts één variabele (aantal inbraken). Er wordt geen relatie tussen twee variabelen onderzocht → **univariate beschrijvende**", sep = ""))
                    } else if (student_answer == "bivariate verklarende") {
                      feedback_parts <- c(feedback_parts, paste("• **", var_display, "**: Je koos 'bivariate verklarende', maar dit is fout. Deze vraag zoekt geen oorzakelijk verband tussen variabelen. Het gaat om het beschrijven van één variabele → **univariate beschrijvende**", sep = ""))
                    } else {
                      feedback_parts <- c(feedback_parts, paste("• **", var_display, "**: Deze vraag onderzoekt slechts één variabele (aantal inbraken per maand) zonder relatie met andere variabelen → **univariate beschrijvende**", sep = ""))
                    }
                  } else if (var_key == "bestudeerde_variabele") {
                    feedback_parts <- c(feedback_parts, paste("• **", var_display, "**: De variabele die wordt bestudeerd is 'het aantal gerapporteerde inbraken per maand in Belgische steden'. Focus op wat er precies wordt geteld/gemeten.", sep = ""))
                  } else if (var_key == "meetniveau") {
                    if (student_answer == "nominaal") {
                      feedback_parts <- c(feedback_parts, paste("• **", var_display, "**: Je koos 'nominaal', maar dit is fout. Aantal inbraken zijn getallen waarmee je kunt rekenen, heeft een echt nulpunt (0 inbraken) en betekenisvolle verhoudingen → **ratio**", sep = ""))
                    } else if (student_answer == "ordinaal") {
                      feedback_parts <- c(feedback_parts, paste("• **", var_display, "**: Je koos 'ordinaal', maar dit is fout. Aantal inbraken heeft niet alleen rangorde maar ook gelijke afstanden en een echt nulpunt → **ratio**", sep = ""))
                    } else if (student_answer == "interval") {
                      feedback_parts <- c(feedback_parts, paste("• **", var_display, "**: Je koos 'interval', maar dit is fout. Aantal inbraken heeft wel een echt nulpunt: 0 inbraken betekent echt geen inbraken → **ratio**", sep = ""))
                    } else {
                      feedback_parts <- c(feedback_parts, paste("• **", var_display, "**: Aantal inbraken heeft gelijke afstanden, een echt nulpunt (0 = geen inbraken) en betekenisvolle verhoudingen → **ratio**", sep = ""))
                    }
                  } else if (var_key == "waarden") {
                    feedback_parts <- c(feedback_parts, paste("• **", var_display, "**: De mogelijke waarden zijn natuurlijke getallen: 0, 1, 2, 3, ... (je kunt geen negatief aantal inbraken hebben)", sep = ""))
                  }
                }
              }
            }
          }
          
          # Always add educational content
          feedback_parts <- c(feedback_parts, "**Onderzoeksvraag types uitleg:**")
          feedback_parts <- c(feedback_parts, "• **Univariate beschrijvende**: Beschrijft eigenschappen van één variabele")
          feedback_parts <- c(feedback_parts, "• **Bivariate beschrijvende**: Beschrijft relatie tussen twee variabelen") 
          feedback_parts <- c(feedback_parts, "• **Bivariate verklarende**: Onderzoekt of één variabele invloed heeft op een andere")
          
          # Print the feedback as markdown
          cat(paste(feedback_parts, collapse = "\n\n"))
          
          return(all_correct)
        },
        TRUE
      )
    }
  )
})