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
            # Remove any trailing punctuation and extra spaces
            current_val <- gsub("\\.$", "", trimws(current_val))
            acceptable_answers <- c("het aantal gerapporteerde inbraken per maand in belgische steden", 
                                  "aantal gerapporteerde inbraken per maand",
                                  "inbraken per maand",
                                  "inbraken per maand in belgische steden",
                                  "inbraken",
                                  "gerapporteerde inbraken per maand",
                                  "gerapporteerde inbraken")
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
          feedback_parts <- c("**Resultaten per onderdeel:**\n")
          
          variable_names <- c(
            "type_vraag" = "Type onderzoeksvraag",
            "bestudeerde_variabele" = "Bestudeerde variabele", 
            "meetniveau" = "Meetniveau",
            "waarden" = "Mogelijke waarden"
          )
          
          counter <- 1
          for(var_key in names(variable_names)) {
            var_display <- variable_names[var_key]
            result <- results[[var_key]]
            
            if(!result$exists) {
              feedback_parts <- c(feedback_parts, paste0(counter, ". **", var_display, "**: *Ontbreekt* ❌"))
            } else if(result$correct) {
              feedback_parts <- c(feedback_parts, paste0(counter, ". **", var_display, "**: ", result$value, " ✅"))
            } else {
              feedback_parts <- c(feedback_parts, paste0(counter, ". **", var_display, "**: ", result$value, " ❌"))
            }
            counter <- counter + 1
          }
          
          if (generated == expected) {
            feedback_parts <- c(feedback_parts, "\n✅ **Alle onderdelen correct geclassificeerd.**")
            feedback_parts <- c(feedback_parts, "\n**Uitstekend!** Je begrijpt onderzoeksvraag classificatie goed.")
          } else {
            
            # Add helpful tips for incorrect answers
            incorrect_vars <- sapply(results, function(x) !x$correct)
            if(any(incorrect_vars)) {
              feedback_parts <- c(feedback_parts, "**📚 Uitleg waarom deze antwoorden fout zijn:**")
              
              if(!results$type_vraag$correct) {
                if(!results$type_vraag$exists) {
                  feedback_parts <- c(feedback_parts, "• **Type onderzoeksvraag**: ❌ Variabele niet gevonden. Vergeet je aanhalingstekens? Gebruik: `type_vraag <- \"univariate beschrijvende\"` (let op de aanhalingstekens!)")
                } else {
                  student_answer <- tolower(as.character(results$type_vraag$value))
                  if(student_answer == "bivariate beschrijvende") {
                    feedback_parts <- c(feedback_parts, "• **Type onderzoeksvraag**: Je koos 'bivariate beschrijvende', maar dit is fout. Deze vraag gaat over slechts één variabele (aantal inbraken). Er wordt geen relatie tussen twee variabelen onderzocht → **univariate beschrijvende**")
                  } else if(student_answer == "bivariate verklarende") {
                    feedback_parts <- c(feedback_parts, "• **Type onderzoeksvraag**: Je koos 'bivariate verklarende', maar dit is fout. Deze vraag zoekt geen oorzakelijk verband tussen variabelen. Het gaat om het beschrijven van één variabele → **univariate beschrijvende**")
                  } else {
                    feedback_parts <- c(feedback_parts, "• **Type onderzoeksvraag**: Deze vraag onderzoekt slechts één variabele (aantal inbraken per maand) zonder relatie met andere variabelen → **univariate beschrijvende**")
                  }
                }
              }
              
              if(!results$bestudeerde_variabele$correct) {
                if(!results$bestudeerde_variabele$exists) {
                  feedback_parts <- c(feedback_parts, "• **Bestudeerde variabele**: ❌ Variabele niet gevonden. Vergeet je aanhalingstekens? Gebruik: `bestudeerde_variabele <- \"Het aantal gerapporteerde inbraken per maand in Belgische steden\"` (let op de aanhalingstekens!)")
                } else {
                  feedback_parts <- c(feedback_parts, "• **Bestudeerde variabele**: De variabele die wordt bestudeerd is 'het aantal gerapporteerde inbraken per maand in Belgische steden'. Focus op wat er precies wordt geteld/gemeten.")
                }
              }
              
              if(!results$meetniveau$correct) {
                if(!results$meetniveau$exists) {
                  feedback_parts <- c(feedback_parts, "• **Meetniveau**: ❌ Variabele niet gevonden. Vergeet je aanhalingstekens? Gebruik: `meetniveau <- \"ratio\"` (let op de aanhalingstekens!)")
                } else {
                  student_answer <- tolower(as.character(results$meetniveau$value))
                  if(student_answer == "nominaal") {
                    feedback_parts <- c(feedback_parts, "• **Meetniveau**: Je koos 'nominaal', maar dit is fout. Aantal inbraken zijn getallen waarmee je kunt rekenen, heeft een echt nulpunt (0 inbraken) en betekenisvolle verhoudingen → **ratio**")
                  } else if(student_answer == "ordinaal") {
                    feedback_parts <- c(feedback_parts, "• **Meetniveau**: Je koos 'ordinaal', maar dit is fout. Aantal inbraken heeft niet alleen rangorde maar ook gelijke afstanden en een echt nulpunt → **ratio**")
                  } else if(student_answer == "interval") {
                    feedback_parts <- c(feedback_parts, "• **Meetniveau**: Je koos 'interval', maar dit is fout. Aantal inbraken heeft wel een echt nulpunt: 0 inbraken betekent echt geen inbraken → **ratio**")
                  } else {
                    feedback_parts <- c(feedback_parts, "• **Meetniveau**: Aantal inbraken heeft gelijke afstanden, een echt nulpunt (0 = geen inbraken) en betekenisvolle verhoudingen → **ratio**")
                  }
                }
              }
              
              if(!results$waarden$correct) {
                if(!results$waarden$exists) {
                  feedback_parts <- c(feedback_parts, "• **Mogelijke waarden**: ❌ Variabele niet gevonden. Vergeet je aanhalingstekens? Gebruik: `waarden <- \"Natuurlijke getallen (0, 1, 2, ...)\"` (let op de aanhalingstekens!)")
                } else {
                  feedback_parts <- c(feedback_parts, "• **Mogelijke waarden**: De mogelijke waarden zijn natuurlijke getallen: 0, 1, 2, 3, ... (je kunt geen negatief aantal inbraken hebben)")
                }
              }
            }
          }
          
          # Always add educational content
          feedback_parts <- c(feedback_parts, "**Onderzoeksvraag types uitleg:**")
          feedback_parts <- c(feedback_parts, "• **Univariate beschrijvende**: Beschrijft eigenschappen van één variabele")
          feedback_parts <- c(feedback_parts, "• **Bivariate beschrijvende**: Beschrijft relatie tussen twee variabelen") 
          feedback_parts <- c(feedback_parts, "• **Bivariate verklarende**: Onderzoekt of één variabele invloed heeft op een andere")
          
          get_reporter()$add_message(paste(feedback_parts, collapse = "\n\n"), type = "markdown")
          
          generated == expected
        }
      )
    }
  )
})