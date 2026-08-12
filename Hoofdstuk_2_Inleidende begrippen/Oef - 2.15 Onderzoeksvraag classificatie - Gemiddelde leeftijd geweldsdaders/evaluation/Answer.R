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
            acceptable_answers <- c("leeftijd van daders van geweldmisdrijven", 
                                  "gemiddelde leeftijd van daders van geweldmisdrijven",
                                  "leeftijd van geweldsdaders",
                                  "gemiddelde leeftijd van geweldsdaders",
                                  "leeftijd daders geweldmisdrijven",
                                  "leeftijd geweldsdaders",
                                  "gemiddelde leeftijd geweldsdaders",
                                  "leeftijd van daders geweld")
            results$bestudeerde_variabele <- list(
              exists = TRUE,
              value = get("bestudeerde_variabele", envir = env),
              correct = current_val %in% acceptable_answers,
              expected = "Leeftijd van daders van geweldmisdrijven"
            )
          } else {
            results$bestudeerde_variabele <- list(exists = FALSE, value = NA, correct = FALSE, expected = "Leeftijd van daders van geweldmisdrijven")
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
            acceptable_answers <- c("continue waarden", "rationale getallen", "decimale getallen", "continue getallen")
            results$type_waarden <- list(
              exists = TRUE,
              value = get("type_waarden", envir = env),
              correct = current_val %in% acceptable_answers,
              expected = "continue waarden"
            )
          } else {
            results$type_waarden <- list(exists = FALSE, value = NA, correct = FALSE, expected = "continue waarden")
          }
          
          # Voorbeeld waarden
          if(exists("voorbeeld_waarden", envir = env)) {
            current_val <- tolower(as.character(get("voorbeeld_waarden", envir = env)))
            # Check if it contains age-like numbers
            has_age_pattern <- grepl("[0-9]+", current_val) && !grepl("%|procent", current_val)
            results$voorbeeld_waarden <- list(
              exists = TRUE,
              value = get("voorbeeld_waarden", envir = env),
              correct = has_age_pattern,
              expected = "Bijvoorbeeld: 18, 20.5, 35, 50, ... jaar"
            )
          } else {
            results$voorbeeld_waarden <- list(exists = FALSE, value = NA, correct = FALSE, expected = "Bijvoorbeeld: 18, 20.5, 35, 50, ... jaar")
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
                    feedback_parts <- c(feedback_parts, "• **Type onderzoeksvraag**: Je koos 'bivariate beschrijvende', maar dit is fout. Er wordt slechts één variabele onderzocht (leeftijd) → **univariate beschrijvende**")
                  } else if(student_answer == "bivariate verklarende") {
                    feedback_parts <- c(feedback_parts, "• **Type onderzoeksvraag**: Je koos 'bivariate verklarende', maar dit is fout. Er wordt slechts één variabele onderzocht en geen oorzakelijk verband gezocht → **univariate beschrijvende**")
                  } else {
                    feedback_parts <- c(feedback_parts, "• **Type onderzoeksvraag**: Deze vraag onderzoekt slechts één variabele (leeftijd) zonder relatie met andere variabelen → **univariate beschrijvende**")
                  }
                }
              }
              
              if(!results$bestudeerde_variabele$correct) {
                if(!results$bestudeerde_variabele$exists) {
                  feedback_parts <- c(feedback_parts, "• **Bestudeerde variabele**: ❌ Variabele niet gevonden. Gebruik: `bestudeerde_variabele <- \"leeftijd van daders van geweldmisdrijven\"` (let op de aanhalingstekens!)")
                } else {
                  feedback_parts <- c(feedback_parts, "• **Bestudeerde variabele**: De variabele die wordt bestudeerd is de leeftijd van daders van geweldmisdrijven")
                }
              }
              
              if(!results$meetniveau$correct) {
                if(!results$meetniveau$exists) {
                  feedback_parts <- c(feedback_parts, "• **Meetniveau**: ❌ Variabele niet gevonden. Gebruik: `meetniveau <- \"ratio\"` (let op de aanhalingstekens!)")
                } else {
                  student_answer <- tolower(as.character(results$meetniveau$value))
                  if(student_answer == "nominaal") {
                    feedback_parts <- c(feedback_parts, "• **Meetniveau**: Je koos 'nominaal', maar dit is fout. Leeftijd zijn getallen waarmee je kunt rekenen, heeft een echt nulpunt (0 jaar) → **ratio**")
                  } else if(student_answer == "ordinaal") {
                    feedback_parts <- c(feedback_parts, "• **Meetniveau**: Je koos 'ordinaal', maar dit is fout. Leeftijd heeft niet alleen rangorde maar ook gelijke afstanden en een echt nulpunt → **ratio**")
                  } else if(student_answer == "interval") {
                    feedback_parts <- c(feedback_parts, "• **Meetniveau**: Je koos 'interval', maar dit is fout. Leeftijd heeft wel een echt nulpunt: 0 jaar betekent geen leeftijd → **ratio**")
                  } else {
                    feedback_parts <- c(feedback_parts, "• **Meetniveau**: Leeftijd heeft gelijke afstanden, een echt nulpunt (0 jaar) en betekenisvolle verhoudingen → **ratio**")
                  }
                }
              }
              
              if(!results$kwantitatief$correct) {
                if(!results$kwantitatief$exists) {
                  feedback_parts <- c(feedback_parts, "• **Kwantitatief**: ❌ Variabele niet gevonden. Gebruik: `kwantitatief <- \"ja\"` (let op de aanhalingstekens!)")
                } else {
                  student_answer <- tolower(as.character(results$kwantitatief$value))
                  if(student_answer == "nee") {
                    feedback_parts <- c(feedback_parts, "• **Kwantitatief**: Je koos 'nee', maar dit is fout. Leeftijd bestaat uit getallen waarmee je kunt rekenen → **ja**")
                  } else {
                    feedback_parts <- c(feedback_parts, "• **Kwantitatief**: Leeftijd bestaat uit getallen waarmee je kunt rekenen → **ja**")
                  }
                }
              }
              
              if(!results$type_waarden$correct) {
                if(!results$type_waarden$exists) {
                  feedback_parts <- c(feedback_parts, "• **Type waarden**: ❌ Variabele niet gevonden. Gebruik: `type_waarden <- \"continue waarden\"` (let op de aanhalingstekens!)")
                } else {
                  student_answer <- tolower(as.character(results$type_waarden$value))
                  if(grepl("natuurlijke|gehele", student_answer)) {
                    feedback_parts <- c(feedback_parts, "• **Type waarden**: Je koos '" + student_answer + "', maar dit is fout. Gemiddelde leeftijd kan decimale waarden hebben (zoals 25.3 jaar) → **continue waarden**")
                  } else {
                    feedback_parts <- c(feedback_parts, "• **Type waarden**: Leeftijd kan decimale waarden hebben (zoals 25.3 jaar voor gemiddelde) → **continue waarden**")
                  }
                }
              }
              
              if(!results$voorbeeld_waarden$correct) {
                if(!results$voorbeeld_waarden$exists) {
                  feedback_parts <- c(feedback_parts, "• **Voorbeeld waarden**: ❌ Variabele niet gevonden. Gebruik: `voorbeeld_waarden <- \"18, 25, 32, 45\"` (let op de aanhalingstekens!)")
                } else {
                  feedback_parts <- c(feedback_parts, "• **Voorbeeld waarden**: Geef leeftijdsgetallen gescheiden door komma's (bijvoorbeeld: 18, 25, 32, 45)")
                }
              }
            }
          }
          
          # Always add educational content
          feedback_parts <- c(feedback_parts, "**📚 Uitleg onderzoeksvraag:**")
          feedback_parts <- c(feedback_parts, "• **Univariate beschrijvende**: Beschrijft één variabele zonder relatie met andere variabelen")
          feedback_parts <- c(feedback_parts, "• **Leeftijd**: Ratio meetniveau omdat het een echt nulpunt heeft (0 jaar)")
          feedback_parts <- c(feedback_parts, "• **Continue waarden**: Gemiddelde leeftijd kan decimalen hebben (bijv. 28.7 jaar)")
          feedback_parts <- c(feedback_parts, "• **Gemiddelde**: Statistische maat die één variabele samenvat")
          
          # Learner-facing feedback contract.
          if (isTRUE(generated == expected)) {
            feedback_parts <- c(feedback_parts, "**Bevestiging:** alle gevraagde classificatievelden zijn correct. De veldfeedback hierboven bevestigt per onderdeel waarom.\n\n**Denkregel:** controleer vraagtype, variabelenrol en meetniveau als afzonderlijke beslissingen.\n\n**Transferstap:** pas dezelfde beslisvolgorde toe op een nieuwe criminologische onderzoeksvraag.")
            feedback_parts <- c(feedback_parts, "**Denkregel:** onderscheid de gemeten variabele van haar statistische samenvatting; tel variabelen op individueel niveau en onderbouw daarna het meetniveau.\n\n**Transferstap:** herhaal dit voor de gemiddelde detentieduur en benoem wat bij één persoon wordt gemeten.")
          } else {
            feedback_parts <- c(
              feedback_parts,
              "**Waarschijnlijke redenering:** één of meer afwijkingen kunnen erop wijzen dat je ‘gemiddelde’ als een tweede variabele telde, of het samenvattingsgetal en de oorspronkelijke leeftijdsmeting hetzelfde classificeerde. Andere routes naar dezelfde invoer blijven mogelijk.",
              "**Waarom dit niet klopt:** het gemiddelde is hier een samenvatting van één gemeten variabele en creëert geen tweede variabele; vraagtype en meetniveau moeten daarom afzonderlijk worden bepaald. De veldfeedback hierboven toont de concrete mismatch.",
              "**Denkregel:** vraag eerst ‘wat wordt bij één persoon gemeten?’, tel daarna de variabelen en bepaal pas vervolgens welke samenvattingsmaat en welk meetniveau passend zijn.",
              "**Volgende stap:** herstel het eerste veld met ❌, schrijf ‘leeftijd per geweldsdader’ als meeteenheid op en herhaal de beslissingen voor de gemiddelde duur van een detentie."
            )
          }

          get_reporter()$add_message(paste(feedback_parts, collapse = "\n\n"), type = "markdown")
          
          generated == expected
        }
      )
    }
  )
})
