context({
  testcase(
    "Classificatie van onderzoeksvraag over recidive en leeftijd",
    {
      testEqual(
        "Alle onderdelen correct geclassificeerd",
        function(env) {
          # Use the provided environment (env) instead of globalenv()
          results <- list()
          
          # Type vraag
          if(exists("type_vraag", envir = env)) {
            current_val <- tolower(as.character(get("type_vraag", envir = env)))
            current_val <- trimws(current_val)
            acceptable_answers <- c("bivariate verklarende", "bivariaat verklarende", "bivariate verklarend", "bivariaat verklarend")
            results$type_vraag <- list(
              exists = TRUE,
              value = get("type_vraag", envir = env),
              correct = current_val %in% acceptable_answers,
              expected = "Bivariate verklarende"
            )
          } else {
            results$type_vraag <- list(exists = FALSE, value = NA, correct = FALSE, expected = "Bivariate verklarende")
          }
          
          # Bestudeerde variabele
          if(exists("bestudeerde_variabele", envir = env)) {
            current_val <- tolower(as.character(get("bestudeerde_variabele", envir = env)))
            # Remove any trailing punctuation and extra spaces
            current_val <- gsub("\\.$", "", trimws(current_val))
            acceptable_answers <- c("kans op recidive en leeftijd van de dader", 
                                  "kans op recidive en leeftijd",
                                  "recidive en leeftijd van de dader",
                                  "recidive en leeftijd",
                                  "recidivekans en leeftijd",
                                  "leeftijd van de dader en kans op recidive",
                                  "leeftijd en kans op recidive",
                                  "leeftijd en recidive",
                                  "leeftijd dader en recidive",
                                  "leeftijd en recidivekans")
            results$bestudeerde_variabele <- list(
              exists = TRUE,
              value = get("bestudeerde_variabele", envir = env),
              correct = current_val %in% acceptable_answers,
              expected = "Kans op recidive en leeftijd van de dader"
            )
          } else {
            results$bestudeerde_variabele <- list(exists = FALSE, value = NA, correct = FALSE, expected = "Kans op recidive en leeftijd van de dader")
          }
          
          # Meetniveau recidive
          if(exists("meetniveau_recidive", envir = env)) {
            current_val <- tolower(as.character(get("meetniveau_recidive", envir = env)))
            current_val <- trimws(current_val)
            acceptable_answers <- c("nominaal")
            results$meetniveau_recidive <- list(
              exists = TRUE,
              value = get("meetniveau_recidive", envir = env),
              correct = current_val %in% acceptable_answers,
              expected = "nominaal"
            )
          } else {
            results$meetniveau_recidive <- list(exists = FALSE, value = NA, correct = FALSE, expected = "nominaal")
          }
          
          # Kwantitatief recidive (ja/nee)
          if(exists("kwantitatief_recidive", envir = env)) {
            current_val <- tolower(as.character(get("kwantitatief_recidive", envir = env)))
            acceptable_answers <- c("nee", "no", "n")
            results$kwantitatief_recidive <- list(
              exists = TRUE,
              value = get("kwantitatief_recidive", envir = env),
              correct = current_val %in% acceptable_answers,
              expected = "nee"
            )
          } else {
            results$kwantitatief_recidive <- list(exists = FALSE, value = NA, correct = FALSE, expected = "nee")
          }
          

          
          # Meetniveau leeftijd
          if(exists("meetniveau_leeftijd", envir = env)) {
            current_val <- tolower(as.character(get("meetniveau_leeftijd", envir = env)))
            current_val <- trimws(current_val)
            acceptable_answers <- c("ratio")
            results$meetniveau_leeftijd <- list(
              exists = TRUE,
              value = get("meetniveau_leeftijd", envir = env),
              correct = current_val %in% acceptable_answers,
              expected = "ratio"
            )
          } else {
            results$meetniveau_leeftijd <- list(exists = FALSE, value = NA, correct = FALSE, expected = "ratio")
          }
          
          # Kwantitatief leeftijd (ja/nee)
          if(exists("kwantitatief_leeftijd", envir = env)) {
            current_val <- tolower(as.character(get("kwantitatief_leeftijd", envir = env)))
            acceptable_answers <- c("ja", "yes", "j")
            results$kwantitatief_leeftijd <- list(
              exists = TRUE,
              value = get("kwantitatief_leeftijd", envir = env),
              correct = current_val %in% acceptable_answers,
              expected = "ja"
            )
          } else {
            results$kwantitatief_leeftijd <- list(exists = FALSE, value = NA, correct = FALSE, expected = "ja")
          }
          
          # Type waarden leeftijd
          if(exists("type_waarden_leeftijd", envir = env)) {
            current_val <- tolower(as.character(get("type_waarden_leeftijd", envir = env)))
            acceptable_answers <- c("continue waarden", "continu", "continue getallen", "ratio waarden", "natuurlijke getallen", "gehele getallen")
            results$type_waarden_leeftijd <- list(
              exists = TRUE,
              value = get("type_waarden_leeftijd", envir = env),
              correct = current_val %in% acceptable_answers,
              expected = "continue waarden"
            )
          } else {
            results$type_waarden_leeftijd <- list(exists = FALSE, value = NA, correct = FALSE, expected = "continue waarden")
          }
          
          # Voorbeeld waarden leeftijd
          if(exists("voorbeeld_waarden_leeftijd", envir = env)) {
            current_val <- tolower(as.character(get("voorbeeld_waarden_leeftijd", envir = env)))
            # Check if it contains numbers that could represent ages
            has_age_numbers <- grepl("[0-9]+", current_val)
            results$voorbeeld_waarden_leeftijd <- list(
              exists = TRUE,
              value = get("voorbeeld_waarden_leeftijd", envir = env),
              correct = has_age_numbers,
              expected = "Bijvoorbeeld: 18, 25, 34, 42, ... jaren"
            )
          } else {
            results$voorbeeld_waarden_leeftijd <- list(exists = FALSE, value = NA, correct = FALSE, expected = "Bijvoorbeeld: 18, 25, 34, 42, ... jaren")
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
            "bestudeerde_variabele" = "Bestudeerde variabele(n)", 
            "meetniveau_recidive" = "Meetniveau recidive",
            "kwantitatief_recidive" = "Kwantitatief recidive",
            "meetniveau_leeftijd" = "Meetniveau leeftijd",
            "kwantitatief_leeftijd" = "Kwantitatief leeftijd",
            "type_waarden_leeftijd" = "Type waarden leeftijd",
            "voorbeeld_waarden_leeftijd" = "Voorbeeld waarden leeftijd"
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
            feedback_parts <- c(feedback_parts, "\n**Uitstekend!** Je begrijpt bivariate verklarende onderzoeksvragen goed.")
          } else {
            
            # Add helpful tips for incorrect answers
            incorrect_vars <- sapply(results, function(x) !x$correct)
            if(any(incorrect_vars)) {
              feedback_parts <- c(feedback_parts, "**📚 Uitleg waarom deze antwoorden fout zijn:**")
              
              if(!results$type_vraag$correct) {
                if(!results$type_vraag$exists) {
                  feedback_parts <- c(feedback_parts, "• **Type onderzoeksvraag**: ❌ Variabele niet gevonden. Gebruik: `type_vraag <- \"bivariate verklarende\"` (let op de aanhalingstekens!)")
                } else {
                  student_answer <- tolower(as.character(results$type_vraag$value))
                  if(student_answer == "univariate beschrijvende") {
                    feedback_parts <- c(feedback_parts, "• **Type onderzoeksvraag**: Je koos 'univariate beschrijvende', maar er zijn twee variabelen: recidive en leeftijd. Het woord 'beïnvloed' wijst op een verklarende relatie → **bivariate verklarende**")
                  } else if(student_answer == "bivariate beschrijvende") {
                    feedback_parts <- c(feedback_parts, "• **Type onderzoeksvraag**: Je koos 'bivariate beschrijvende', maar het woord 'beïnvloed' in de vraag wijst op een oorzakelijke/verklarende relatie, niet alleen beschrijven → **bivariate verklarende**")
                  } else {
                    feedback_parts <- c(feedback_parts, "• **Type onderzoeksvraag**: Het woord 'beïnvloed' wijst op een verklarende relatie tussen twee variabelen (recidive en leeftijd) → **bivariate verklarende**")
                  }
                }
              }
              
              if(!results$bestudeerde_variabele$correct) {
                if(!results$bestudeerde_variabele$exists) {
                  feedback_parts <- c(feedback_parts, "• **Bestudeerde variabele(n)**: ❌ Variabele niet gevonden. Gebruik: `bestudeerde_variabele <- \"Kans op recidive en leeftijd van de dader\"` (let op de aanhalingstekens!)")
                } else {
                  feedback_parts <- c(feedback_parts, "• **Bestudeerde variabele(n)**: Er zijn twee variabelen: de kans op recidive (uitkomst) en de leeftijd van de dader (mogelijke verklaring)")
                }
              }
              
              # Detailed feedback for each variable's properties
              if(!results$meetniveau_recidive$correct && results$meetniveau_recidive$exists) {
                student_answer <- tolower(as.character(results$meetniveau_recidive$value))
                if(student_answer == "ordinaal") {
                  feedback_parts <- c(feedback_parts, "• **Meetniveau recidive**: Recidive is ja/nee zonder rangorde → **nominaal**")
                } else if(student_answer == "ratio") {
                  feedback_parts <- c(feedback_parts, "• **Meetniveau recidive**: Recidive is geen getal maar een categorie (ja/nee) → **nominaal**")
                } else {
                  feedback_parts <- c(feedback_parts, "• **Meetniveau recidive**: Recidive is een binaire variabele (ja/nee) → **nominaal**")
                }
              }
              
              if(!results$kwantitatief_recidive$correct && results$kwantitatief_recidive$exists) {
                feedback_parts <- c(feedback_parts, "• **Kwantitatief recidive**: Recidive bestaat uit categorieën (ja/nee), niet uit getallen → **nee**")
              }
              
              if(!results$meetniveau_leeftijd$correct && results$meetniveau_leeftijd$exists) {
                student_answer <- tolower(as.character(results$meetniveau_leeftijd$value))
                if(student_answer == "nominaal") {
                  feedback_parts <- c(feedback_parts, "• **Meetniveau leeftijd**: Leeftijd zijn getallen waarmee je kunt rekenen, heeft een echt nulpunt (0 jaar) → **ratio**")
                } else if(student_answer == "ordinaal") {
                  feedback_parts <- c(feedback_parts, "• **Meetniveau leeftijd**: Leeftijd heeft niet alleen rangorde maar ook gelijke afstanden en een echt nulpunt → **ratio**")
                } else if(student_answer == "interval") {
                  feedback_parts <- c(feedback_parts, "• **Meetniveau leeftijd**: Leeftijd heeft wel een echt nulpunt: 0 jaar betekent geen leeftijd → **ratio**")
                }
              }
              
              if(!results$kwantitatief_leeftijd$correct && results$kwantitatief_leeftijd$exists) {
                feedback_parts <- c(feedback_parts, "• **Kwantitatief leeftijd**: Leeftijd bestaat uit getallen waarmee je kunt rekenen → **ja**")
              }
            }
          }
          
          # Always add educational content
          feedback_parts <- c(feedback_parts, "**📚 Uitleg onderzoeksvraag:**")
          feedback_parts <- c(feedback_parts, "• **Bivariate verklarende**: Onderzoekt of één variabele (leeftijd) invloed heeft op een andere (recidive)")
          feedback_parts <- c(feedback_parts, "• **Onafhankelijke variabele**: Leeftijd van de dader (mogelijke verklaring)")
          feedback_parts <- c(feedback_parts, "• **Afhankelijke variabele**: Kans op recidive (de uitkomst die wordt verklaard)")
          feedback_parts <- c(feedback_parts, "• **Recidive**: Opnieuw een misdrijf plegen na eerdere veroordeling (ja/nee = nominaal)")
          feedback_parts <- c(feedback_parts, "• **Leeftijd**: Continue numerieke waarden met echt nulpunt (ratio)")
          
          get_reporter()$add_message(paste(feedback_parts, collapse = "\n\n"), type = "markdown")
          
          generated == expected
        }
      )
    }
  )
})