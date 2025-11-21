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
                    feedback_parts <- c(feedback_parts, "• **Type onderzoeksvraag**: Je antwoord 'univariate beschrijvende' is fout omdat er **twee variabelen** worden onderzocht (cameratoezicht + geweldsdelicten). Univariaat = één variabele. **Herbekijk Oef - 2.8** voor de theorie over onderzoeksvraagtypen → **Correct antwoord: bivariate verklarende**")
                  } else if(student_answer == "bivariate beschrijvende") {
                    feedback_parts <- c(feedback_parts, "• **Type onderzoeksvraag**: Je antwoord 'bivariate beschrijvende' is fout omdat de vraag niet alleen wil **beschrijven** maar zoekt een **oorzakelijk verband**. Het woord 'invloed' wijst op verklaring. **Herbekijk Oef - 2.8** → **Correct antwoord: bivariate verklarende**")
                  } else if(grepl("univariate", student_answer)) {
                    feedback_parts <- c(feedback_parts, "• **Type onderzoeksvraag**: Je antwoord bevat 'univariate' maar er zijn **twee variabelen**: (1) cameratoezicht, (2) geweldsdelicten. **Herbekijk Oef - 2.8** over uni- vs. bivariate vragen → **Correct antwoord: bivariate verklarende**")
                  } else if(grepl("beschrijvende", student_answer)) {
                    feedback_parts <- c(feedback_parts, "• **Type onderzoeksvraag**: Je antwoord bevat 'beschrijvende' maar deze vraag zoekt een **causaal verband** (invloed). Het gaat niet om alleen beschrijven. **Herbekijk Oef - 2.8** → **Correct antwoord: bivariate verklarende**")
                  } else {
                    feedback_parts <- c(feedback_parts, "• **Type onderzoeksvraag**: De vraag onderzoekt of één variabele **invloed heeft** op een andere (2 variabelen, causaal verband). **Herbekijk Oef - 2.8** voor onderzoeksvraagtypen → **Correct antwoord: bivariate verklarende**")
                  }
                }
              }
              
              if(!results$bestudeerde_variabele$correct) {
                if(!results$bestudeerde_variabele$exists) {
                  feedback_parts <- c(feedback_parts, "• **Bestudeerde variabele(n)**: ❌ Variabele niet gevonden. Gebruik: `bestudeerde_variabele <- \"Aanwezigheid van cameratoezicht en aantal geregistreerde geweldsdelicten\"` (let op de aanhalingstekens!)")
                } else {
                  student_answer <- as.character(results$bestudeerde_variabele$value)
                  feedback_parts <- c(feedback_parts, paste0("• **Bestudeerde variabele(n)**: Je antwoord '", student_answer, "' is niet compleet of niet correct. Er worden **twee variabelen** bestudeerd: (1) **aanwezigheid van cameratoezicht** (onafhankelijke/verklarende variabele) en (2) **aantal geregistreerde geweldsdelicten** (afhankelijke/te verklaren variabele). **Herbekijk Oef - 2.7** over onafhankelijke en afhankelijke variabelen → **Correct antwoord: Aanwezigheid van cameratoezicht en aantal geregistreerde geweldsdelicten**"))
                }
              }
              
              # Detailed feedback for each variable's properties
              if(!results$meetniveau_camera$correct && results$meetniveau_camera$exists) {
                student_answer <- tolower(as.character(results$meetniveau_camera$value))
                if(student_answer == "ordinaal") {
                  feedback_parts <- c(feedback_parts, "• **Meetniveau cameratoezicht**: Je koos 'ordinaal', maar dit is fout. Cameratoezicht (ja/nee) heeft geen rangorde → **nominaal**")
                } else if(student_answer == "ratio") {
                  feedback_parts <- c(feedback_parts, "• **Meetniveau cameratoezicht**: Je koos 'ratio', maar dit is fout. Cameratoezicht is geen getal maar een categorie (aanwezig/afwezig) → **nominaal**")
                } else if(student_answer == "interval") {
                  feedback_parts <- c(feedback_parts, "• **Meetniveau cameratoezicht**: Je koos 'interval', maar dit is fout. Cameratoezicht is geen getal maar een categorie (aanwezig/afwezig) → **nominaal**")
                } else {
                  feedback_parts <- c(feedback_parts, "• **Meetniveau cameratoezicht**: Cameratoezicht is een binaire variabele (ja/nee) zonder rangorde → **nominaal**")
                }
              }
              
              if(!results$kwantitatief_camera$correct && results$kwantitatief_camera$exists) {
                student_answer <- tolower(as.character(results$kwantitatief_camera$value))
                if(student_answer == "ja") {
                  feedback_parts <- c(feedback_parts, "• **Kwantitatief cameratoezicht**: Je koos 'ja', maar dit is fout. Cameratoezicht bestaat uit categorieën (ja/nee), niet uit getallen → **nee**")
                } else {
                  feedback_parts <- c(feedback_parts, "• **Kwantitatief cameratoezicht**: Cameratoezicht bestaat uit categorieën, niet uit getallen → **nee**")
                }
              }
              
              if(!results$meetniveau_geweld$correct && results$meetniveau_geweld$exists) {
                student_answer <- tolower(as.character(results$meetniveau_geweld$value))
                if(student_answer == "nominaal") {
                  feedback_parts <- c(feedback_parts, "• **Meetniveau geweldsdelicten**: Je koos 'nominaal', maar dit is fout. Aantal geweldsdelicten zijn getallen waarmee je kunt rekenen, heeft een echt nulpunt (0 delicten) → **ratio**")
                } else if(student_answer == "ordinaal") {
                  feedback_parts <- c(feedback_parts, "• **Meetniveau geweldsdelicten**: Je koos 'ordinaal', maar dit is fout. Aantallen hebben niet alleen rangorde maar ook gelijke afstanden en een echt nulpunt → **ratio**")
                } else if(student_answer == "interval") {
                  feedback_parts <- c(feedback_parts, "• **Meetniveau geweldsdelicten**: Je koos 'interval', maar dit is fout. Aantallen hebben wel een echt nulpunt: 0 delicten betekent geen delicten → **ratio**")
                } else {
                  feedback_parts <- c(feedback_parts, "• **Meetniveau geweldsdelicten**: Aantal geweldsdelicten heeft gelijke afstanden, een echt nulpunt (0 = geen delicten) en betekenisvolle verhoudingen → **ratio**")
                }
              }
              
              if(!results$kwantitatief_geweld$correct && results$kwantitatief_geweld$exists) {
                student_answer <- tolower(as.character(results$kwantitatief_geweld$value))
                if(student_answer == "nee") {
                  feedback_parts <- c(feedback_parts, "• **Kwantitatief geweldsdelicten**: Je koos 'nee', maar dit is fout. Aantal geweldsdelicten bestaat uit getallen waarmee je kunt rekenen → **ja**")
                } else {
                  feedback_parts <- c(feedback_parts, "• **Kwantitatief geweldsdelicten**: Aantal geweldsdelicten bestaat uit getallen waarmee je kunt rekenen → **ja**")
                }
              }
              
              if(!results$type_waarden_geweld$correct && results$type_waarden_geweld$exists) {
                student_answer <- tolower(as.character(results$type_waarden_geweld$value))
                if(grepl("gehele", student_answer) || grepl("integer", student_answer)) {
                  feedback_parts <- c(feedback_parts, "• **Type waarden geweldsdelicten**: Je koos 'gehele getallen', maar dit is fout. Je kunt geen negatief aantal delicten hebben → **natuurlijke getallen**")
                } else if(grepl("rationaal", student_answer) || grepl("decimaal", student_answer)) {
                  feedback_parts <- c(feedback_parts, "• **Type waarden geweldsdelicten**: Je antwoord suggereert decimalen, maar je kunt geen 2.5 delicten hebben → **natuurlijke getallen**")
                } else {
                  feedback_parts <- c(feedback_parts, "• **Type waarden geweldsdelicten**: Je kunt geen negatief aantal delicten hebben → **natuurlijke getallen**")
                }
              }
            }
          }
          
          # Always add educational content with references
          feedback_parts <- c(feedback_parts, "**📚 Samenvatting en verwijzingen naar theorie:**")
          feedback_parts <- c(feedback_parts, "• **Bivariate verklarende**: Onderzoekt of één variabele **invloed heeft** op een andere")
          feedback_parts <- c(feedback_parts, "• **Onafhankelijke variabele**: Aanwezigheid cameratoezicht (mogelijke oorzaak)")
          feedback_parts <- c(feedback_parts, "• **Afhankelijke variabele**: Aantal geweldsdelicten (de uitkomst die wordt verklaard)")
          feedback_parts <- c(feedback_parts, "• **Cameratoezicht**: Binaire nominale variabele (aanwezig/afwezig)")
          feedback_parts <- c(feedback_parts, "• **Aantal delicten**: Ratio variabele (natuurlijke getallen met echt nulpunt)")
          feedback_parts <- c(feedback_parts, "• **Kwantitatief vs. Kwalitatief**: Getallen vs. categorieën")
          
          get_reporter()$add_message(paste(feedback_parts, collapse = "\n\n"), type = "markdown")
          
          generated == expected
        }
      )
    }
  )
})