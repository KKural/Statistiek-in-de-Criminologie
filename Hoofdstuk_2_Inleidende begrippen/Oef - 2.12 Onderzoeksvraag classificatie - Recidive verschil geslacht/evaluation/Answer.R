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
            acceptable_answers <- c("bivariate beschrijvende", "bivariaat beschrijvende", "bivariate beschrijvend", "bivariaat beschrijvend")
            results$type_vraag <- list(
              exists = TRUE,
              value = get("type_vraag", envir = env),
              correct = current_val %in% acceptable_answers,
              expected = "Bivariate beschrijvende"
            )
          } else {
            results$type_vraag <- list(exists = FALSE, value = NA, correct = FALSE, expected = "Bivariate beschrijvende")
          }
          
          # Bestudeerde variabele
          if(exists("bestudeerde_variabele", envir = env)) {
            current_val <- tolower(as.character(get("bestudeerde_variabele", envir = env)))
            # Remove any trailing punctuation and extra spaces
            current_val <- gsub("\\.$", "", trimws(current_val))
            acceptable_answers <- c("geslacht en percentage recidive", 
                                  "percentage recidive en geslacht",
                                  "geslacht en recidive percentage",
                                  "recidive percentage en geslacht",
                                  "geslacht en recidive",
                                  "recidive en geslacht",
                                  "geslacht (man/vrouw) en percentage recidive",
                                  "percentage recidive en geslacht (man/vrouw)")
            results$bestudeerde_variabele <- list(
              exists = TRUE,
              value = get("bestudeerde_variabele", envir = env),
              correct = current_val %in% acceptable_answers,
              expected = "Geslacht en percentage recidive"
            )
          } else {
            results$bestudeerde_variabele <- list(exists = FALSE, value = NA, correct = FALSE, expected = "Geslacht en percentage recidive")
          }
          
          # Meetniveau geslacht
          if(exists("meetniveau_geslacht", envir = env)) {
            current_val <- tolower(as.character(get("meetniveau_geslacht", envir = env)))
            current_val <- trimws(current_val)
            acceptable_answers <- c("nominaal")
            results$meetniveau_geslacht <- list(
              exists = TRUE,
              value = get("meetniveau_geslacht", envir = env),
              correct = current_val %in% acceptable_answers,
              expected = "nominaal"
            )
          } else {
            results$meetniveau_geslacht <- list(exists = FALSE, value = NA, correct = FALSE, expected = "nominaal")
          }
          
          # Kwantitatief geslacht (ja/nee)
          if(exists("kwantitatief_geslacht", envir = env)) {
            current_val <- tolower(as.character(get("kwantitatief_geslacht", envir = env)))
            acceptable_answers <- c("nee", "no", "n")
            results$kwantitatief_geslacht <- list(
              exists = TRUE,
              value = get("kwantitatief_geslacht", envir = env),
              correct = current_val %in% acceptable_answers,
              expected = "nee"
            )
          } else {
            results$kwantitatief_geslacht <- list(exists = FALSE, value = NA, correct = FALSE, expected = "nee")
          }
          
          # Type waarden geslacht
          if(exists("type_waarden_geslacht", envir = env)) {
            current_val <- tolower(as.character(get("type_waarden_geslacht", envir = env)))
            acceptable_answers <- c("binaire categorieën", "binair", "binaire waarden", "categorieën", "nominale categorieën", "man/vrouw")
            results$type_waarden_geslacht <- list(
              exists = TRUE,
              value = get("type_waarden_geslacht", envir = env),
              correct = current_val %in% acceptable_answers,
              expected = "binaire categorieën"
            )
          } else {
            results$type_waarden_geslacht <- list(exists = FALSE, value = NA, correct = FALSE, expected = "binaire categorieën")
          }
          
          # Voorbeeld waarden geslacht
          if(exists("voorbeeld_waarden_geslacht", envir = env)) {
            current_val <- tolower(as.character(get("voorbeeld_waarden_geslacht", envir = env)))
            # Check if it contains man/vrouw patterns
            acceptable_pattern <- grepl("man.*vrouw|vrouw.*man|m.*v|v.*m", current_val)
            results$voorbeeld_waarden_geslacht <- list(
              exists = TRUE,
              value = get("voorbeeld_waarden_geslacht", envir = env),
              correct = acceptable_pattern,
              expected = "Man of vrouw"
            )
          } else {
            results$voorbeeld_waarden_geslacht <- list(exists = FALSE, value = NA, correct = FALSE, expected = "Man of vrouw")
          }
          
          # Meetniveau recidive
          if(exists("meetniveau_recidive", envir = env)) {
            current_val <- tolower(as.character(get("meetniveau_recidive", envir = env)))
            current_val <- trimws(current_val)
            acceptable_answers <- c("ratio")
            results$meetniveau_recidive <- list(
              exists = TRUE,
              value = get("meetniveau_recidive", envir = env),
              correct = current_val %in% acceptable_answers,
              expected = "ratio"
            )
          } else {
            results$meetniveau_recidive <- list(exists = FALSE, value = NA, correct = FALSE, expected = "ratio")
          }
          
          # Kwantitatief recidive (ja/nee)
          if(exists("kwantitatief_recidive", envir = env)) {
            current_val <- tolower(as.character(get("kwantitatief_recidive", envir = env)))
            acceptable_answers <- c("ja", "yes", "j")
            results$kwantitatief_recidive <- list(
              exists = TRUE,
              value = get("kwantitatief_recidive", envir = env),
              correct = current_val %in% acceptable_answers,
              expected = "ja"
            )
          } else {
            results$kwantitatief_recidive <- list(exists = FALSE, value = NA, correct = FALSE, expected = "ja")
          }
          
          # Type waarden recidive
          if(exists("type_waarden_recidive", envir = env)) {
            current_val <- tolower(as.character(get("type_waarden_recidive", envir = env)))
            acceptable_answers <- c("rationale getallen", "continue waarden", "percentages", "percentage waarden", "decimale getallen")
            results$type_waarden_recidive <- list(
              exists = TRUE,
              value = get("type_waarden_recidive", envir = env),
              correct = current_val %in% acceptable_answers,
              expected = "rationale getallen"
            )
          } else {
            results$type_waarden_recidive <- list(exists = FALSE, value = NA, correct = FALSE, expected = "rationale getallen")
          }
          
          # Voorbeeld waarden recidive
          if(exists("voorbeeld_waarden_recidive", envir = env)) {
            current_val <- tolower(as.character(get("voorbeeld_waarden_recidive", envir = env)))
            # Check if it contains percentage-like values
            has_percentage_pattern <- grepl("%|procent|0.*100|[0-9]+\\.[0-9]", current_val)
            results$voorbeeld_waarden_recidive <- list(
              exists = TRUE,
              value = get("voorbeeld_waarden_recidive", envir = env),
              correct = has_percentage_pattern,
              expected = "Bijvoorbeeld: 25%, 18.5%, 32%, ... (tussen 0% en 100%)"
            )
          } else {
            results$voorbeeld_waarden_recidive <- list(exists = FALSE, value = NA, correct = FALSE, expected = "Bijvoorbeeld: 25%, 18.5%, 32%, ... (tussen 0% en 100%)")
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
            "meetniveau_geslacht" = "Meetniveau geslacht",
            "kwantitatief_geslacht" = "Kwantitatief geslacht",
            "type_waarden_geslacht" = "Type waarden geslacht",
            "voorbeeld_waarden_geslacht" = "Voorbeeld waarden geslacht",
            "meetniveau_recidive" = "Meetniveau recidive",
            "kwantitatief_recidive" = "Kwantitatief recidive",
            "type_waarden_recidive" = "Type waarden recidive",
            "voorbeeld_waarden_recidive" = "Voorbeeld waarden recidive"
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
            feedback_parts <- c(feedback_parts, "\n**Uitstekend!** Je begrijpt bivariate beschrijvende onderzoeksvragen goed.")
          } else {
            
            # Add helpful tips for incorrect answers
            incorrect_vars <- sapply(results, function(x) !x$correct)
            if(any(incorrect_vars)) {
              feedback_parts <- c(feedback_parts, "**📚 Uitleg waarom deze antwoorden fout zijn:**")
              
              if(!results$type_vraag$correct) {
                if(!results$type_vraag$exists) {
                  feedback_parts <- c(feedback_parts, "• **Type onderzoeksvraag**: ❌ Variabele niet gevonden. Gebruik: `type_vraag <- \"bivariate beschrijvende\"` (let op de aanhalingstekens!)")
                } else {
                  student_answer <- tolower(as.character(results$type_vraag$value))
                  if(student_answer == "univariate beschrijvende") {
                    feedback_parts <- c(feedback_parts, "• **Type onderzoeksvraag**: Je koos 'univariate beschrijvende', maar er worden twee variabelen onderzocht: geslacht en recidive percentage. Het woord 'verschilt' wijst op vergelijking tussen groepen → **bivariate beschrijvende**")
                  } else if(student_answer == "bivariate verklarende") {
                    feedback_parts <- c(feedback_parts, "• **Type onderzoeksvraag**: Je koos 'bivariate verklarende', maar er wordt geen oorzakelijk verband onderzocht, alleen een verschil beschreven → **bivariate beschrijvende**")
                  } else {
                    feedback_parts <- c(feedback_parts, "• **Type onderzoeksvraag**: Het woord 'verschilt' wijst op beschrijving van verschillen tussen twee variabelen (geslacht en recidive) → **bivariate beschrijvende**")
                  }
                }
              }
              
              if(!results$bestudeerde_variabele$correct) {
                if(!results$bestudeerde_variabele$exists) {
                  feedback_parts <- c(feedback_parts, "• **Bestudeerde variabele(n)**: ❌ Variabele niet gevonden. Gebruik: `bestudeerde_variabele <- \"Geslacht en percentage recidive\"` (let op de aanhalingstekens!)")
                } else {
                  feedback_parts <- c(feedback_parts, "• **Bestudeerde variabele(n)**: Er worden twee variabelen bestudeerd: geslacht (man/vrouw) en percentage recidive")
                }
              }
              
              # Detailed feedback for each variable's properties
              if(!results$meetniveau_geslacht$correct && results$meetniveau_geslacht$exists) {
                student_answer <- tolower(as.character(results$meetniveau_geslacht$value))
                if(student_answer == "ordinaal") {
                  feedback_parts <- c(feedback_parts, "• **Meetniveau geslacht**: Geslacht (man/vrouw) heeft geen rangorde → **nominaal**")
                } else if(student_answer == "ratio") {
                  feedback_parts <- c(feedback_parts, "• **Meetniveau geslacht**: Geslacht is geen getal maar een categorie → **nominaal**")
                } else {
                  feedback_parts <- c(feedback_parts, "• **Meetniveau geslacht**: Geslacht is een binaire variabele (man/vrouw) zonder rangorde → **nominaal**")
                }
              }
              
              if(!results$kwantitatief_geslacht$correct && results$kwantitatief_geslacht$exists) {
                feedback_parts <- c(feedback_parts, "• **Kwantitatief geslacht**: Geslacht bestaat uit categorieën, niet uit getallen → **nee**")
              }
              
              if(!results$meetniveau_recidive$correct && results$meetniveau_recidive$exists) {
                student_answer <- tolower(as.character(results$meetniveau_recidive$value))
                if(student_answer == "nominaal") {
                  feedback_parts <- c(feedback_parts, "• **Meetniveau recidive**: Percentage recidive zijn getallen waarmee je kunt rekenen, heeft een echt nulpunt (0%) → **ratio**")
                } else if(student_answer == "ordinaal") {
                  feedback_parts <- c(feedback_parts, "• **Meetniveau recidive**: Percentages hebben niet alleen rangorde maar ook gelijke afstanden en een echt nulpunt → **ratio**")
                } else if(student_answer == "interval") {
                  feedback_parts <- c(feedback_parts, "• **Meetniveau recidive**: Percentages hebben wel een echt nulpunt: 0% betekent geen recidive → **ratio**")
                }
              }
              
              if(!results$kwantitatief_recidive$correct && results$kwantitatief_recidive$exists) {
                feedback_parts <- c(feedback_parts, "• **Kwantitatief recidive**: Percentages bestaan uit getallen waarmee je kunt rekenen → **ja**")
              }
            }
          }
          
          # Always add educational content
          feedback_parts <- c(feedback_parts, "**📚 Uitleg onderzoeksvraag:**")
          feedback_parts <- c(feedback_parts, "• **Bivariate beschrijvende**: Beschrijft verschillen/relaties tussen twee variabelen")
          feedback_parts <- c(feedback_parts, "• **Geslacht**: Binaire nominale variabele (man/vrouw)")
          feedback_parts <- c(feedback_parts, "• **Percentage recidive**: Ratio variabele met echt nulpunt (0% = geen recidive)")
          feedback_parts <- c(feedback_parts, "• **Verschil**: Het woord 'verschilt' wijst op vergelijking, niet op oorzakelijk verband")
          
          # Learner-facing feedback contract.
          if (isTRUE(generated == expected)) {
            feedback_parts <- c(feedback_parts, "**Bevestiging:** alle gevraagde classificatievelden zijn correct; de veldfeedback hierboven bevestigt per onderdeel waarom.")
            feedback_parts <- c(feedback_parts, "**Denkregel:** onderscheid steeds het groepskenmerk, de uitkomst en ‘verschilt’ versus ‘beïnvloedt’; classificeer daarna de meetniveaus los van de rollen.\n\n**Transferstap:** pas deze scheiding toe op een nieuwe criminologische groepsvergelijking en schrijf de vraag als ‘verschilt Y tussen X-groepen?’.")
          } else {
            feedback_parts <- c(
              feedback_parts,
              "**Waarschijnlijke redenering:** de afwijkende velden kunnen passen bij het lezen van een groepsverschil als een oorzakelijke invloed, of bij het verwisselen van groepskenmerk en uitkomst. Dit is slechts een plausibele diagnose op basis van je invoer.",
              "**Waarom dit niet klopt:** ‘verschilt tussen’ beschrijft een vergelijking maar bewijst geen invloed, terwijl de X/Y-rol uit de vraagstructuur en het meetniveau uit de waarden volgt. De veldfeedback hierboven toont welke beslissing moet worden herzien.",
              "**Denkregel:** markeer eerst de groepen (X), daarna de gemeten uitkomst (Y), en kijk vervolgens of de vraag alleen een verschil beschrijft of expliciet een effect wil verklaren.",
              "**Volgende stap:** herstel het eerste veld met ❌, herschrijf de vraag als ‘verschilt Y tussen groepen X?’ en classificeer vervolgens X en Y elk met hun eigen meetniveaucriteria."
            )
          }

          get_reporter()$add_message(paste(feedback_parts, collapse = "\n\n"), type = "markdown")
          
          generated == expected
        }
      )
    }
  )
})
