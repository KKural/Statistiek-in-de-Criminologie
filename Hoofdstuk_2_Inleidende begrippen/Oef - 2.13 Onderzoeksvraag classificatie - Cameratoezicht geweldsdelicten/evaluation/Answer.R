context({
  testcase(
    "Classificatie van onderzoeksvraag over cameratoezicht en geweldsdelicten",
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
            acceptable_answers <- c("aanwezigheid van cameratoezicht en aantal geregistreerde geweldsdelicten", 
                                  "cameratoezicht en aantal geweldsdelicten",
                                  "aanwezigheid cameratoezicht en geweldsdelicten",
                                  "cameratoezicht en geweldsdelicten",
                                  "aantal geweldsdelicten en aanwezigheid van cameratoezicht",
                                  "aantal geweldsdelicten en cameratoezicht",
                                  "geweldsdelicten en cameratoezicht",
                                  "cameratoezicht (ja/nee) en aantal geweldsdelicten")
            results$bestudeerde_variabele <- list(
              exists = TRUE,
              value = get("bestudeerde_variabele", envir = env),
              correct = current_val %in% acceptable_answers,
              expected = "Aanwezigheid van cameratoezicht en aantal geregistreerde geweldsdelicten"
            )
          } else {
            results$bestudeerde_variabele <- list(exists = FALSE, value = NA, correct = FALSE, expected = "Aanwezigheid van cameratoezicht en aantal geregistreerde geweldsdelicten")
          }
          
          # Meetniveau camera
          if(exists("meetniveau_camera", envir = env)) {
            current_val <- tolower(as.character(get("meetniveau_camera", envir = env)))
            current_val <- trimws(current_val)
            acceptable_answers <- c("nominaal")
            results$meetniveau_camera <- list(
              exists = TRUE,
              value = get("meetniveau_camera", envir = env),
              correct = current_val %in% acceptable_answers,
              expected = "nominaal"
            )
          } else {
            results$meetniveau_camera <- list(exists = FALSE, value = NA, correct = FALSE, expected = "nominaal")
          }
          
          # Kwantitatief camera (ja/nee)
          if(exists("kwantitatief_camera", envir = env)) {
            current_val <- tolower(as.character(get("kwantitatief_camera", envir = env)))
            acceptable_answers <- c("nee", "no", "n")
            results$kwantitatief_camera <- list(
              exists = TRUE,
              value = get("kwantitatief_camera", envir = env),
              correct = current_val %in% acceptable_answers,
              expected = "nee"
            )
          } else {
            results$kwantitatief_camera <- list(exists = FALSE, value = NA, correct = FALSE, expected = "nee")
          }
          
          # Type waarden camera
          if(exists("type_waarden_camera", envir = env)) {
            current_val <- tolower(as.character(get("type_waarden_camera", envir = env)))
            acceptable_answers <- c("binaire categorieën", "binair", "binaire waarden", "ja/nee", "categorieën", "nominale categorieën")
            results$type_waarden_camera <- list(
              exists = TRUE,
              value = get("type_waarden_camera", envir = env),
              correct = current_val %in% acceptable_answers,
              expected = "binaire categorieën"
            )
          } else {
            results$type_waarden_camera <- list(exists = FALSE, value = NA, correct = FALSE, expected = "binaire categorieën")
          }
          
          # Voorbeeld waarden camera
          if(exists("voorbeeld_waarden_camera", envir = env)) {
            current_val <- tolower(as.character(get("voorbeeld_waarden_camera", envir = env)))
            # Check if it contains ja/nee or yes/no patterns
            acceptable_pattern <- grepl("ja.*nee|nee.*ja|yes.*no|no.*yes|aanwezig.*afwezig|wel.*niet", current_val)
            results$voorbeeld_waarden_camera <- list(
              exists = TRUE,
              value = get("voorbeeld_waarden_camera", envir = env),
              correct = acceptable_pattern,
              expected = "Ja of nee (aanwezig of afwezig)"
            )
          } else {
            results$voorbeeld_waarden_camera <- list(exists = FALSE, value = NA, correct = FALSE, expected = "Ja of nee (aanwezig of afwezig)")
          }
          
          # Meetniveau geweld
          if(exists("meetniveau_geweld", envir = env)) {
            current_val <- tolower(as.character(get("meetniveau_geweld", envir = env)))
            current_val <- trimws(current_val)
            acceptable_answers <- c("ratio")
            results$meetniveau_geweld <- list(
              exists = TRUE,
              value = get("meetniveau_geweld", envir = env),
              correct = current_val %in% acceptable_answers,
              expected = "ratio"
            )
          } else {
            results$meetniveau_geweld <- list(exists = FALSE, value = NA, correct = FALSE, expected = "ratio")
          }
          
          # Kwantitatief geweld (ja/nee)
          if(exists("kwantitatief_geweld", envir = env)) {
            current_val <- tolower(as.character(get("kwantitatief_geweld", envir = env)))
            acceptable_answers <- c("ja", "yes", "j")
            results$kwantitatief_geweld <- list(
              exists = TRUE,
              value = get("kwantitatief_geweld", envir = env),
              correct = current_val %in% acceptable_answers,
              expected = "ja"
            )
          } else {
            results$kwantitatief_geweld <- list(exists = FALSE, value = NA, correct = FALSE, expected = "ja")
          }
          
          # Type waarden geweld
          if(exists("type_waarden_geweld", envir = env)) {
            current_val <- tolower(as.character(get("type_waarden_geweld", envir = env)))
            acceptable_answers <- c("natuurlijke getallen", "gehele getallen", "telgetallen", "discrete waarden")
            results$type_waarden_geweld <- list(
              exists = TRUE,
              value = get("type_waarden_geweld", envir = env),
              correct = current_val %in% acceptable_answers,
              expected = "natuurlijke getallen"
            )
          } else {
            results$type_waarden_geweld <- list(exists = FALSE, value = NA, correct = FALSE, expected = "natuurlijke getallen")
          }
          
          # Voorbeeld waarden geweld
          if(exists("voorbeeld_waarden_geweld", envir = env)) {
            current_val <- tolower(as.character(get("voorbeeld_waarden_geweld", envir = env)))
            # Check if it contains numbers (counts)
            has_count_pattern <- grepl("[0-9]", current_val) && !grepl("%|procent", current_val)
            results$voorbeeld_waarden_geweld <- list(
              exists = TRUE,
              value = get("voorbeeld_waarden_geweld", envir = env),
              correct = has_count_pattern,
              expected = "Bijvoorbeeld: 0, 1, 2, 3, 5, 12, ... (aantal delicten)"
            )
          } else {
            results$voorbeeld_waarden_geweld <- list(exists = FALSE, value = NA, correct = FALSE, expected = "Bijvoorbeeld: 0, 1, 2, 3, 5, 12, ... (aantal delicten)")
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
            "meetniveau_camera" = "Meetniveau cameratoezicht",
            "kwantitatief_camera" = "Kwantitatief cameratoezicht",
            "type_waarden_camera" = "Type waarden cameratoezicht",
            "voorbeeld_waarden_camera" = "Voorbeeld waarden cameratoezicht",
            "meetniveau_geweld" = "Meetniveau geweldsdelicten",
            "kwantitatief_geweld" = "Kwantitatief geweldsdelicten",
            "type_waarden_geweld" = "Type waarden geweldsdelicten",
            "voorbeeld_waarden_geweld" = "Voorbeeld waarden geweldsdelicten"
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
                    feedback_parts <- c(feedback_parts, "• **Type onderzoeksvraag**: Je koos 'univariate beschrijvende', maar er worden twee variabelen onderzocht: cameratoezicht en geweldsdelicten. De woorden 'heeft invloed op' wijzen op een verklarende relatie → **bivariate verklarende**")
                  } else if(student_answer == "bivariate beschrijvende") {
                    feedback_parts <- c(feedback_parts, "• **Type onderzoeksvraag**: Je koos 'bivariate beschrijvende', maar de woorden 'heeft invloed op' wijzen op een oorzakelijke/verklarende relatie, niet alleen beschrijven → **bivariate verklarende**")
                  } else {
                    feedback_parts <- c(feedback_parts, "• **Type onderzoeksvraag**: De woorden 'heeft invloed op' wijzen op een verklarende relatie tussen twee variabelen → **bivariate verklarende**")
                  }
                }
              }
              
              if(!results$bestudeerde_variabele$correct) {
                if(!results$bestudeerde_variabele$exists) {
                  feedback_parts <- c(feedback_parts, "• **Bestudeerde variabele(n)**: ❌ Variabele niet gevonden. Gebruik: `bestudeerde_variabele <- \"Aanwezigheid van cameratoezicht en aantal geregistreerde geweldsdelicten\"` (let op de aanhalingstekens!)")
                } else {
                  feedback_parts <- c(feedback_parts, "• **Bestudeerde variabele(n)**: Er worden twee variabelen bestudeerd: aanwezigheid van cameratoezicht (onafhankelijke variabele) en aantal geweldsdelicten (afhankelijke variabele)")
                }
              }
              
              # Detailed feedback for each variable's properties
              if(!results$meetniveau_camera$correct && results$meetniveau_camera$exists) {
                student_answer <- tolower(as.character(results$meetniveau_camera$value))
                if(student_answer == "ordinaal") {
                  feedback_parts <- c(feedback_parts, "• **Meetniveau cameratoezicht**: Cameratoezicht (ja/nee) heeft geen rangorde → **nominaal**")
                } else if(student_answer == "ratio") {
                  feedback_parts <- c(feedback_parts, "• **Meetniveau cameratoezicht**: Cameratoezicht is geen getal maar een categorie (aanwezig/afwezig) → **nominaal**")
                } else {
                  feedback_parts <- c(feedback_parts, "• **Meetniveau cameratoezicht**: Cameratoezicht is een binaire variabele (ja/nee) zonder rangorde → **nominaal**")
                }
              }
              
              if(!results$kwantitatief_camera$correct && results$kwantitatief_camera$exists) {
                feedback_parts <- c(feedback_parts, "• **Kwantitatief cameratoezicht**: Cameratoezicht bestaat uit categorieën (ja/nee), niet uit getallen → **nee**")
              }
              
              if(!results$meetniveau_geweld$correct && results$meetniveau_geweld$exists) {
                student_answer <- tolower(as.character(results$meetniveau_geweld$value))
                if(student_answer == "nominaal") {
                  feedback_parts <- c(feedback_parts, "• **Meetniveau geweldsdelicten**: Aantal geweldsdelicten zijn getallen waarmee je kunt rekenen, heeft een echt nulpunt (0 delicten) → **ratio**")
                } else if(student_answer == "ordinaal") {
                  feedback_parts <- c(feedback_parts, "• **Meetniveau geweldsdelicten**: Aantallen hebben niet alleen rangorde maar ook gelijke afstanden en een echt nulpunt → **ratio**")
                } else if(student_answer == "interval") {
                  feedback_parts <- c(feedback_parts, "• **Meetniveau geweldsdelicten**: Aantallen hebben wel een echt nulpunt: 0 delicten betekent geen delicten → **ratio**")
                }
              }
              
              if(!results$kwantitatief_geweld$correct && results$kwantitatief_geweld$exists) {
                feedback_parts <- c(feedback_parts, "• **Kwantitatief geweldsdelicten**: Aantal geweldsdelicten bestaat uit getallen waarmee je kunt rekenen → **ja**")
              }
              
              if(!results$type_waarden_geweld$correct && results$type_waarden_geweld$exists) {
                feedback_parts <- c(feedback_parts, "• **Type waarden geweldsdelicten**: Je kunt geen negatief aantal delicten hebben, dus natuurlijke getallen (0, 1, 2, 3, ...) → **natuurlijke getallen**")
              }
            }
          }
          
          # Always add educational content
          feedback_parts <- c(feedback_parts, "**📚 Uitleg onderzoeksvraag:**")
          feedback_parts <- c(feedback_parts, "• **Bivariate verklarende**: Onderzoekt of één variabele invloed heeft op een andere")
          feedback_parts <- c(feedback_parts, "• **Onafhankelijke variabele**: Aanwezigheid cameratoezicht (mogelijke oorzaak)")
          feedback_parts <- c(feedback_parts, "• **Afhankelijke variabele**: Aantal geweldsdelicten (de uitkomst die wordt verklaard)")
          feedback_parts <- c(feedback_parts, "• **Cameratoezicht**: Binaire nominale variabele (aanwezig/afwezig)")
          feedback_parts <- c(feedback_parts, "• **Aantal delicten**: Ratio variabele (natuurlijke getallen met echt nulpunt)")
          
          get_reporter()$add_message(paste(feedback_parts, collapse = "\n\n"), type = "markdown")
          
          generated == expected
        }
      )
    }
  )
})