context({
  testcase(
    "",
    {
      testEqual(
        " ",
        function(env) {
          # Use the provided environment (env) instead of globalenv()
          results <- list()
          
          # Type vraag
          if(exists("type_vraag", envir = env)) {
            current_val <- tolower(as.character(get("type_vraag", envir = env)))
            current_val <- trimws(current_val)
            acceptable_answers <- c("univariate beschrijvende", "univariaat beschrijvende", "univariate beschrijvend", "univariaat beschrijvend")
            results$type_vraag <- list(
              exists = TRUE,
              value = get("type_vraag", envir = env),
              correct = current_val %in% acceptable_answers,
              expected = "Univariate beschrijvende"
            )
          } else {
            results$type_vraag <- list(exists = FALSE, value = NA, correct = FALSE, expected = "Univariate beschrijvende")
          }
          
          # Bestudeerde variabele
          if(exists("bestudeerde_variabele", envir = env)) {
            current_val <- tolower(as.character(get("bestudeerde_variabele", envir = env)))
            # Remove any trailing punctuation and extra spaces
            current_val <- gsub("\\.$", "", trimws(current_val))
            acceptable_answers <- c("het percentage burgers dat zich onveilig voelt in hun buurt", 
                                  "percentage burgers dat zich onveilig voelt",
                                  "percentage onveiligheidsgevoel",
                                  "onveiligheidsgevoel percentage",
                                  "percentage onveilige burgers",
                                  "percentage burgers onveilig gevoel",
                                  "het percentage onveiligheidsgevoel in de buurt",
                                  "percentage burgers dat zich onveilig voelt in hun buurt")
            results$bestudeerde_variabele <- list(
              exists = TRUE,
              value = get("bestudeerde_variabele", envir = env),
              correct = current_val %in% acceptable_answers,
              expected = "Het percentage burgers dat zich onveilig voelt in hun buurt"
            )
          } else {
            results$bestudeerde_variabele <- list(exists = FALSE, value = NA, correct = FALSE, expected = "Het percentage burgers dat zich onveilig voelt in hun buurt")
          }
          
          # Meetniveau
          if(exists("meetniveau", envir = env)) {
            current_val <- tolower(as.character(get("meetniveau", envir = env)))
            current_val <- trimws(current_val)
            acceptable_answers <- c("ratio")
            results$meetniveau <- list(
              exists = TRUE,
              value = get("meetniveau", envir = env),
              correct = current_val %in% acceptable_answers,
              expected = "ratio"
            )
          } else {
            results$meetniveau <- list(exists = FALSE, value = NA, correct = FALSE, expected = "ratio")
          }
          
          # Kwantitatief (ja/nee)
          if(exists("kwantitatief", envir = env)) {
            current_val <- tolower(as.character(get("kwantitatief", envir = env)))
            acceptable_answers <- c("ja", "yes", "j")
            results$kwantitatief <- list(
              exists = TRUE,
              value = get("kwantitatief", envir = env),
              correct = current_val %in% acceptable_answers,
              expected = "ja"
            )
          } else {
            results$kwantitatief <- list(exists = FALSE, value = NA, correct = FALSE, expected = "ja")
          }
          
          # Type waarden
          if(exists("type_waarden", envir = env)) {
            current_val <- tolower(as.character(get("type_waarden", envir = env)))
            acceptable_answers <- c("rationale getallen", "continue waarden", "percentages", "percentage waarden", "decimale getallen", "rationale waarden")
            results$type_waarden <- list(
              exists = TRUE,
              value = get("type_waarden", envir = env),
              correct = current_val %in% acceptable_answers,
              expected = "rationale getallen"
            )
          } else {
            results$type_waarden <- list(exists = FALSE, value = NA, correct = FALSE, expected = "rationale getallen")
          }
          
          # Voorbeeld waarden
          if(exists("voorbeeld_waarden", envir = env)) {
            current_val <- tolower(as.character(get("voorbeeld_waarden", envir = env)))
            # Check if it contains percentage-like values
            has_percentage_pattern <- grepl("%|procent|0.*100|15.*25.*35|[0-9]+\\.[0-9]", current_val)
            results$voorbeeld_waarden <- list(
              exists = TRUE,
              value = get("voorbeeld_waarden", envir = env),
              correct = has_percentage_pattern,
              expected = "Bijvoorbeeld: 15%, 23.5%, 67%, ... (tussen 0% en 100%)"
            )
          } else {
            results$voorbeeld_waarden <- list(exists = FALSE, value = NA, correct = FALSE, expected = "Bijvoorbeeld: 15%, 23.5%, 67%, ... (tussen 0% en 100%)")
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
            "kwantitatief" = "Kwantitatief (ja/nee)",
            "type_waarden" = "Type waarden",
            "voorbeeld_waarden" = "Voorbeeld waarden"
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
            feedback_parts <- c(feedback_parts, "\n**Uitstekend!** Je begrijpt univariate beschrijvende onderzoeksvragen goed.")
          } else {
            
            # Add helpful tips for incorrect answers
            incorrect_vars <- sapply(results, function(x) !x$correct)
            if(any(incorrect_vars)) {
              feedback_parts <- c(feedback_parts, "**📚 Uitleg waarom deze antwoorden fout zijn:**")
              
              if(!results$type_vraag$correct) {
                if(!results$type_vraag$exists) {
                  feedback_parts <- c(feedback_parts, "• **Type onderzoeksvraag**: ❌ Variabele niet gevonden. Gebruik: `type_vraag <- \"univariate beschrijvende\"` (let op de aanhalingstekens!)")
                } else {
                  student_answer <- tolower(as.character(results$type_vraag$value))
                  if(student_answer == "bivariate beschrijvende") {
                    feedback_parts <- c(feedback_parts, "• **Type onderzoeksvraag**: Je koos 'bivariate beschrijvende', maar er wordt slechts één variabele onderzocht (percentage onveiligheidsgevoel). Er wordt geen relatie tussen twee variabelen bestudeerd → **univariate beschrijvende**")
                  } else if(student_answer == "bivariate verklarende") {
                    feedback_parts <- c(feedback_parts, "• **Type onderzoeksvraag**: Je koos 'bivariate verklarende', maar er wordt slechts één variabele onderzocht en geen oorzakelijk verband gezocht → **univariate beschrijvende**")
                  } else {
                    feedback_parts <- c(feedback_parts, "• **Type onderzoeksvraag**: Deze vraag onderzoekt slechts één variabele zonder relatie met andere variabelen → **univariate beschrijvende**")
                  }
                }
              }
              
              if(!results$bestudeerde_variabele$correct) {
                if(!results$bestudeerde_variabele$exists) {
                  feedback_parts <- c(feedback_parts, "• **Bestudeerde variabele**: ❌ Variabele niet gevonden. Gebruik: `bestudeerde_variabele <- \"Het percentage burgers dat zich onveilig voelt in hun buurt\"` (let op de aanhalingstekens!)")
                } else {
                  feedback_parts <- c(feedback_parts, "• **Bestudeerde variabele**: De variabele die wordt bestudeerd is het percentage burgers met onveiligheidsgevoel in hun buurt")
                }
              }
              
              if(!results$meetniveau$correct) {
                if(!results$meetniveau$exists) {
                  feedback_parts <- c(feedback_parts, "• **Meetniveau**: ❌ Variabele niet gevonden. Gebruik: `meetniveau <- \"ratio\"` (let op de aanhalingstekens!)")
                } else {
                  student_answer <- tolower(as.character(results$meetniveau$value))
                  if(student_answer == "nominaal") {
                    feedback_parts <- c(feedback_parts, "• **Meetniveau**: Je koos 'nominaal', maar percentages zijn getallen waarmee je kunt rekenen, hebben een echt nulpunt (0%) en betekenisvolle verhoudingen → **ratio**")
                  } else if(student_answer == "ordinaal") {
                    feedback_parts <- c(feedback_parts, "• **Meetniveau**: Je koos 'ordinaal', maar percentages hebben niet alleen rangorde maar ook gelijke afstanden en een echt nulpunt → **ratio**")
                  } else if(student_answer == "interval") {
                    feedback_parts <- c(feedback_parts, "• **Meetniveau**: Je koos 'interval', maar percentages hebben wel een echt nulpunt: 0% betekent niemand voelt zich onveilig → **ratio**")
                  } else {
                    feedback_parts <- c(feedback_parts, "• **Meetniveau**: Percentages hebben gelijke afstanden, een echt nulpunt (0% = niemand) en betekenisvolle verhoudingen → **ratio**")
                  }
                }
              }
              
              if(!results$kwantitatief$correct) {
                if(!results$kwantitatief$exists) {
                  feedback_parts <- c(feedback_parts, "• **Kwantitatief (ja/nee)**: ❌ Variabele niet gevonden. Gebruik: `kwantitatief <- \"ja\"` (let op de aanhalingstekens!)")
                } else {
                  feedback_parts <- c(feedback_parts, "• **Kwantitatief (ja/nee)**: Percentages bestaan uit getallen waarmee je kunt rekenen → **ja**")
                }
              }
              
              if(!results$type_waarden$correct) {
                if(!results$type_waarden$exists) {
                  feedback_parts <- c(feedback_parts, "• **Type waarden**: ❌ Variabele niet gevonden. Gebruik: `type_waarden <- \"rationale getallen\"` (let op de aanhalingstekens!)")
                } else {
                  feedback_parts <- c(feedback_parts, "• **Type waarden**: Percentages kunnen decimale waarden hebben (zoals 23.5%) → **rationale getallen**")
                }
              }
              
              if(!results$voorbeeld_waarden$correct) {
                if(!results$voorbeeld_waarden$exists) {
                  feedback_parts <- c(feedback_parts, "• **Voorbeeld waarden**: ❌ Variabele niet gevonden. Gebruik: `voorbeeld_waarden <- \"15%, 23.5%, 67%\"` (let op de aanhalingstekens!)")
                } else {
                  feedback_parts <- c(feedback_parts, "• **Voorbeeld waarden**: Geef percentages tussen 0% en 100%, bijvoorbeeld: 15%, 23.5%, 67%")
                }
              }
            }
          }
          
          # Always add educational content
          feedback_parts <- c(feedback_parts, "**📚 Uitleg onderzoeksvraag:**")
          feedback_parts <- c(feedback_parts, "• **Univariate beschrijvende**: Beschrijft één variabele zonder relatie met andere variabelen")
          feedback_parts <- c(feedback_parts, "• **Percentage**: Ratio meetniveau omdat het een echt nulpunt heeft (0% = niemand)")
          feedback_parts <- c(feedback_parts, "• **Rationale getallen**: Percentages kunnen decimalen hebben (bijv. 23.5%)")
          feedback_parts <- c(feedback_parts, "• **Bereik**: Percentages lopen altijd van 0% tot 100%")
          
          get_reporter()$add_message(paste(feedback_parts, collapse = "\n\n"), type = "markdown")
          
          generated == expected
        }
      )
    }
  )
})