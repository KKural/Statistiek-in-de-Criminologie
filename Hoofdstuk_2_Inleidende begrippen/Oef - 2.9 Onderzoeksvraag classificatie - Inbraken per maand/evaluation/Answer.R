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
            current_val <- trimws(current_val)  # Remove extra spaces
            acceptable_answers <- c("ratio", "nominaal", "ordinaal", "interval")
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
            current_val <- gsub("\\([^)]*\\)", "", current_val)  # Remove anything in parentheses
            current_val <- trimws(current_val)  # Remove extra spaces
            acceptable_answers <- c("natuurlijke getallen", "gehele getallen", "rationale getallen", "continue waarden", "discrete waarden")
            results$type_waarden <- list(
              exists = TRUE,
              value = get("type_waarden", envir = env),
              correct = current_val %in% acceptable_answers,
              expected = "Natuurlijke getallen"
            )
          } else {
            results$type_waarden <- list(exists = FALSE, value = NA, correct = FALSE, expected = "Natuurlijke getallen")
          }
          
          # Voorbeeld waarden
          if(exists("voorbeeld_waarden", envir = env)) {
            current_val <- as.character(get("voorbeeld_waarden", envir = env))
            current_val <- gsub("[^0-9,\\s.-]", "", current_val)  # Keep numbers, commas, spaces, dots, dashes
            current_val <- trimws(current_val)  # Remove extra spaces
            
            # Check if it contains at least 2 numbers separated by commas or spaces
            has_multiple_numbers <- grepl("[0-9]+[,\\s]+[0-9]+", current_val)
            # Or check for patterns like "0, 1, 2" or "55, 52" or "1 2 3" etc.
            acceptable_pattern <- grepl("^[0-9]+([,\\s]+[0-9]+)*([,\\s]*\\.\\.\\.?)?[,\\s]*$", current_val)
            
            results$voorbeeld_waarden <- list(
              exists = TRUE,
              value = get("voorbeeld_waarden", envir = env),
              correct = has_multiple_numbers && acceptable_pattern,
              expected = "Bijvoorbeeld: 0, 1, 2, ... of 55, 52, 48 of 1 2 3"
            )
          } else {
            results$voorbeeld_waarden <- list(exists = FALSE, value = NA, correct = FALSE, expected = "Bijvoorbeeld: 0, 1, 2, ... of 55, 52, 48 of 1 2 3")
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
              
              if(!results$kwantitatief$correct) {
                if(!results$kwantitatief$exists) {
                  feedback_parts <- c(feedback_parts, "• **Kwantitatief (ja/nee)**: ❌ Variabele niet gevonden. Vergeet je aanhalingstekens? Gebruik: `kwantitatief <- \"ja\"` (let op de aanhalingstekens!)")
                } else {
                  feedback_parts <- c(feedback_parts, "• **Kwantitatief (ja/nee)**: Aantal inbraken bestaat uit getallen waarmee je kunt rekenen → **ja**")
                }
              }
              

              
              if(!results$type_waarden$correct) {
                if(!results$type_waarden$exists) {
                  feedback_parts <- c(feedback_parts, "• **Type waarden**: ❌ Variabele niet gevonden. Vergeet je aanhalingstekens? Gebruik: `type_waarden <- \"Natuurlijke getallen\"` (let op de aanhalingstekens!)")
                } else {
                  feedback_parts <- c(feedback_parts, "• **Type waarden**: De mogelijke waarden zijn natuurlijke getallen (je kunt geen negatief aantal inbraken hebben)")
                }
              }
              
              if(!results$voorbeeld_waarden$correct) {
                if(!results$voorbeeld_waarden$exists) {
                  feedback_parts <- c(feedback_parts, "• **Voorbeeld waarden**: ❌ Variabele niet gevonden. Vergeet je aanhalingstekens? Gebruik: `voorbeeld_waarden <- \"0, 1, 2, ...\"` (let op de aanhalingstekens!)")
                } else {
                  feedback_parts <- c(feedback_parts, "• **Voorbeeld waarden**: Geef enkele voorbeeldgetallen gescheiden door komma's of spaties (bijvoorbeeld: 0, 1, 2, ... of 55, 52, 48 of 1 2 3)")
                }
              }
            }
          }
          
          # Always add educational content
          feedback_parts <- c(feedback_parts, "**Onderzoeksvraag types uitleg:**")
          feedback_parts <- c(feedback_parts, "• **Univariate beschrijvende**: Beschrijft eigenschappen van één variabele")
          feedback_parts <- c(feedback_parts, "• **Bivariate beschrijvende**: Beschrijft relatie tussen twee variabelen") 
          feedback_parts <- c(feedback_parts, "• **Bivariate verklarende**: Onderzoekt of één variabele invloed heeft op een andere")
          
          # Learner-facing feedback contract.
          if (isTRUE(generated == expected)) {
            feedback_parts <- c(feedback_parts, "**Bevestiging:** alle gevraagde classificatievelden zijn correct; de veldfeedback hierboven bevestigt per onderdeel waarom.")
            feedback_parts <- c(feedback_parts, "**Denkregel:** tel eerst de gemeten variabelen, bepaal daarna beschrijven versus verklaren en leg pas dan per variabele het meetniveau vast.\n\n**Transferstap:** pas deze volgorde toe op een nieuwe vraag over maandelijkse aangiften en motiveer elke beslissing met één criterium.")
          } else {
            feedback_parts <- c(
              feedback_parts,
              "**Waarschijnlijke redenering:** één of meer afwijkingen kunnen betekenen dat je op een opvallend woord of voorbeeldwaarde hebt geclassificeerd voordat je aantal variabelen, vraagdoel en meeteigenschappen apart bekeek. Dezelfde antwoorden kunnen echter ook via een andere route zijn ontstaan.",
              "**Waarom dit niet klopt:** onderzoekstype, variabelenrol en meetniveau beantwoorden verschillende vragen; een passend antwoord op één dimensie rechtvaardigt de andere velden niet. De specifieke veldfeedback hierboven lokaliseert de eerste botsing.",
              "**Denkregel:** gebruik deze volgorde: (1) tel variabelen, (2) bepaal of de vraag beschrijft of een invloed wil verklaren, (3) wijs eventuele X/Y-rollen toe en (4) toets rangorde, gelijke afstanden en echt nulpunt.",
              "**Volgende stap:** neem het eerste veld met ❌, schrijf de bijbehorende beslisvraag erboven en corrigeer alleen dat veld. Doorloop daarna alle vier stappen opnieuw voor een vergelijkbare vraag over maandelijkse aangiften."
            )
          }

          get_reporter()$add_message(paste(feedback_parts, collapse = "\n\n"), type = "markdown")
          
          generated == expected
        }
      )
    }
  )
})
