context({
  testcase(
    "Classificatie van onderzoeksvraag over politie dichtheid en diefstallen",
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
            acceptable_answers <- c("aantal politiemensen per 1000 inwoners en aantal geregistreerde diefstallen", 
                                  "aantal politiemensen per 1000 inwoners en aantal diefstallen",
                                  "politie dichtheid en aantal diefstallen",
                                  "aantal diefstallen en aantal politiemensen per 1000 inwoners",
                                  "aantal diefstallen en politie dichtheid",
                                  "politiemensen per 1000 inwoners en diefstallen",
                                  "diefstallen en politiemensen per 1000 inwoners")
            results$bestudeerde_variabele <- list(
              exists = TRUE,
              value = get("bestudeerde_variabele", envir = env),
              correct = current_val %in% acceptable_answers,
              expected = "Aantal politiemensen per 1000 inwoners en aantal geregistreerde diefstallen"
            )
          } else {
            results$bestudeerde_variabele <- list(exists = FALSE, value = NA, correct = FALSE, expected = "Aantal politiemensen per 1000 inwoners en aantal geregistreerde diefstallen")
          }
          
          # Meetniveau politie
          if(exists("meetniveau_politie", envir = env)) {
            current_val <- tolower(as.character(get("meetniveau_politie", envir = env)))
            current_val <- trimws(current_val)
            acceptable_answers <- c("ratio")
            results$meetniveau_politie <- list(
              exists = TRUE,
              value = get("meetniveau_politie", envir = env),
              correct = current_val %in% acceptable_answers,
              expected = "ratio"
            )
          } else {
            results$meetniveau_politie <- list(exists = FALSE, value = NA, correct = FALSE, expected = "ratio")
          }
          
          # Kwantitatief politie (ja/nee)
          if(exists("kwantitatief_politie", envir = env)) {
            current_val <- tolower(as.character(get("kwantitatief_politie", envir = env)))
            acceptable_answers <- c("ja", "yes", "j")
            results$kwantitatief_politie <- list(
              exists = TRUE,
              value = get("kwantitatief_politie", envir = env),
              correct = current_val %in% acceptable_answers,
              expected = "ja"
            )
          } else {
            results$kwantitatief_politie <- list(exists = FALSE, value = NA, correct = FALSE, expected = "ja")
          }
          
          # Type waarden politie
          if(exists("type_waarden_politie", envir = env)) {
            current_val <- tolower(as.character(get("type_waarden_politie", envir = env)))
            acceptable_answers <- c("continue waarden", "rationale getallen", "decimale getallen", "continue getallen")
            results$type_waarden_politie <- list(
              exists = TRUE,
              value = get("type_waarden_politie", envir = env),
              correct = current_val %in% acceptable_answers,
              expected = "continue waarden"
            )
          } else {
            results$type_waarden_politie <- list(exists = FALSE, value = NA, correct = FALSE, expected = "continue waarden")
          }
          
          # Voorbeeld waarden politie
          if(exists("voorbeeld_waarden_politie", envir = env)) {
            current_val <- tolower(as.character(get("voorbeeld_waarden_politie", envir = env)))
            # Check if it contains decimal numbers typical for ratios per 1000
            has_ratio_pattern <- grepl("[0-9]+(\\.[0-9]+)?", current_val)
            results$voorbeeld_waarden_politie <- list(
              exists = TRUE,
              value = get("voorbeeld_waarden_politie", envir = env),
              correct = has_ratio_pattern,
              expected = "Bijvoorbeeld: 2.0, 2.5, 3.2, 4.1, ... (per 1000 inwoners)"
            )
          } else {
            results$voorbeeld_waarden_politie <- list(exists = FALSE, value = NA, correct = FALSE, expected = "Bijvoorbeeld: 2.0, 2.5, 3.2, 4.1, ... (per 1000 inwoners)")
          }
          
          # Meetniveau diefstallen
          if(exists("meetniveau_diefstallen", envir = env)) {
            current_val <- tolower(as.character(get("meetniveau_diefstallen", envir = env)))
            current_val <- trimws(current_val)
            acceptable_answers <- c("ratio")
            results$meetniveau_diefstallen <- list(
              exists = TRUE,
              value = get("meetniveau_diefstallen", envir = env),
              correct = current_val %in% acceptable_answers,
              expected = "ratio"
            )
          } else {
            results$meetniveau_diefstallen <- list(exists = FALSE, value = NA, correct = FALSE, expected = "ratio")
          }
          
          # Kwantitatief diefstallen (ja/nee)
          if(exists("kwantitatief_diefstallen", envir = env)) {
            current_val <- tolower(as.character(get("kwantitatief_diefstallen", envir = env)))
            acceptable_answers <- c("ja", "yes", "j")
            results$kwantitatief_diefstallen <- list(
              exists = TRUE,
              value = get("kwantitatief_diefstallen", envir = env),
              correct = current_val %in% acceptable_answers,
              expected = "ja"
            )
          } else {
            results$kwantitatief_diefstallen <- list(exists = FALSE, value = NA, correct = FALSE, expected = "ja")
          }
          
          # Type waarden diefstallen
          if(exists("type_waarden_diefstallen", envir = env)) {
            current_val <- tolower(as.character(get("type_waarden_diefstallen", envir = env)))
            acceptable_answers <- c("natuurlijke getallen", "gehele getallen", "telgetallen", "discrete waarden")
            results$type_waarden_diefstallen <- list(
              exists = TRUE,
              value = get("type_waarden_diefstallen", envir = env),
              correct = current_val %in% acceptable_answers,
              expected = "natuurlijke getallen"
            )
          } else {
            results$type_waarden_diefstallen <- list(exists = FALSE, value = NA, correct = FALSE, expected = "natuurlijke getallen")
          }
          
          # Voorbeeld waarden diefstallen
          if(exists("voorbeeld_waarden_diefstallen", envir = env)) {
            current_val <- tolower(as.character(get("voorbeeld_waarden_diefstallen", envir = env)))
            # Check if it contains whole numbers (counts)
            has_count_pattern <- grepl("[0-9]", current_val) && !grepl("%|procent|\\.", current_val)
            results$voorbeeld_waarden_diefstallen <- list(
              exists = TRUE,
              value = get("voorbeeld_waarden_diefstallen", envir = env),
              correct = has_count_pattern,
              expected = "Bijvoorbeeld: 0, 1, 2, 15, 48, 125, ... (aantal diefstallen)"
            )
          } else {
            results$voorbeeld_waarden_diefstallen <- list(exists = FALSE, value = NA, correct = FALSE, expected = "Bijvoorbeeld: 0, 1, 2, 15, 48, 125, ... (aantal diefstallen)")
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
            "meetniveau_politie" = "Meetniveau politie dichtheid",
            "kwantitatief_politie" = "Kwantitatief politie dichtheid",
            "type_waarden_politie" = "Type waarden politie dichtheid",
            "voorbeeld_waarden_politie" = "Voorbeeld waarden politie dichtheid",
            "meetniveau_diefstallen" = "Meetniveau diefstallen",
            "kwantitatief_diefstallen" = "Kwantitatief diefstallen",
            "type_waarden_diefstallen" = "Type waarden diefstallen",
            "voorbeeld_waarden_diefstallen" = "Voorbeeld waarden diefstallen"
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
              
              if(!results$type_vraag$correct && results$type_vraag$exists) {
                student_answer <- tolower(as.character(results$type_vraag$value))
                if(student_answer == "univariate beschrijvende") {
                  feedback_parts <- c(feedback_parts, "• **Type onderzoeksvraag**: Je koos 'univariate beschrijvende', maar er worden twee variabelen onderzocht en hun onderlinge relatie bestudeerd → **bivariate beschrijvende**")
                } else if(student_answer == "bivariate verklarende") {
                  feedback_parts <- c(feedback_parts, "• **Type onderzoeksvraag**: Je koos 'bivariate verklarende', maar er wordt geen oorzakelijk verband onderzocht, alleen een relatie beschreven → **bivariate beschrijvende**")
                } else {
                  feedback_parts <- c(feedback_parts, "• **Type onderzoeksvraag**: Het woord 'relatie' wijst op beschrijving van samenhang tussen twee variabelen → **bivariate beschrijvende**")
                }
              }
              
              if(!results$meetniveau_politie$correct && results$meetniveau_politie$exists) {
                feedback_parts <- c(feedback_parts, "• **Meetniveau politie dichtheid**: Aantal per 1000 inwoners zijn ratio getallen met echt nulpunt → **ratio**")
              }
              
              if(!results$meetniveau_diefstallen$correct && results$meetniveau_diefstallen$exists) {
                feedback_parts <- c(feedback_parts, "• **Meetniveau diefstallen**: Aantal diefstallen zijn telgetallen met echt nulpunt (0 = geen diefstallen) → **ratio**")
              }
            }
          }
          
          # Always add educational content
          feedback_parts <- c(feedback_parts, "**📚 Uitleg onderzoeksvraag:**")
          feedback_parts <- c(feedback_parts, "• **Bivariate beschrijvende**: Beschrijft relaties/samenhang tussen twee variabelen")
          feedback_parts <- c(feedback_parts, "• **Politie dichtheid**: Continue ratio variabele (kan decimalen hebben: 2.3 per 1000)")
          feedback_parts <- c(feedback_parts, "• **Aantal diefstallen**: Discrete ratio variabele (natuurlijke getallen)")
          feedback_parts <- c(feedback_parts, "• **Relatie**: Het woord wijst op samenhang, niet op oorzakelijk verband")
          
          get_reporter()$add_message(paste(feedback_parts, collapse = "\n\n"), type = "markdown")
          
          generated == expected
        }
      )
    }
  )
})