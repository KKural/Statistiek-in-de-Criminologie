context({
  testcase(
    "Classificatie van variabelen",
    {
      testEqual(
        "Alle variabelen correct geclassificeerd",
        function(env) {
          # Use the provided environment (env) instead of globalenv()
          results <- list()
          
          # Check each variable and store detailed results
          # Onafhankelijke variabele
          if(exists("onafhankelijke_variabele", envir = env)) {
            current_val <- tolower(as.character(get("onafhankelijke_variabele", envir = env)))
            current_val <- gsub("\\.$", "", trimws(current_val))
            acceptable_answers <- c("de interventie", 
                                  "interventie",
                                  "jongeren afkomstig uit de interventiewijk vs controlegroep",
                                  "interventiewijk vs controlegroep",
                                  "wijk zonder interventie",
                                  "interventiewijk versus controlegroep",
                                  "groep (interventie of controle)",
                                  "type wijk",
                                  "type interventie",
                                  "interventiegroep vs controlegroep",
                                  "wel/geen interventie",
                                  "interventie wel/niet",
                                  "interventie (ja/nee)",
                                  "groepsindeling")
            results$onafhankelijke_variabele <- list(
              exists = TRUE,
              value = get("onafhankelijke_variabele", envir = env),
              correct = current_val %in% acceptable_answers,
              expected = "De interventie (interventiewijk vs. controlegroep)"
            )
          } else {
            results$onafhankelijke_variabele <- list(exists = FALSE, value = NA, correct = FALSE, expected = "De interventie (interventiewijk vs. controlegroep)")
          }
          
          # Meetniveau onafhankelijk variabele
          if(exists("meetniveau_onafhankelijk_variabele", envir = env)) {
            current_val <- tolower(as.character(get("meetniveau_onafhankelijk_variabele", envir = env)))
            current_val <- trimws(current_val)
            acceptable_answers <- c("nominaal")
            results$meetniveau_onafhankelijk_variabele <- list(
              exists = TRUE,
              value = get("meetniveau_onafhankelijk_variabele", envir = env),
              correct = current_val %in% acceptable_answers,
              expected = "nominaal"
            )
          } else {
            results$meetniveau_onafhankelijk_variabele <- list(exists = FALSE, value = NA, correct = FALSE, expected = "nominaal")
          }
          
          # Afhankelijke variabele
          if(exists("afhankelijke_variabele", envir = env)) {
            current_val <- tolower(as.character(get("afhankelijke_variabele", envir = env)))
            current_val <- gsub("\\.$", "", trimws(current_val))
            acceptable_answers <- c("het aantal meldingen van overlast",
                                  "aantal meldingen van overlast",
                                  "het aantal meldingen",
                                  "aantal meldingen",
                                  "meldingen van overlast",
                                  "aantal overlastmeldingen",
                                  "overlastmeldingen",
                                  "overlast",
                                  "meldingen",
                                  "het aantal overlastmeldingen",
                                  "aantal klachten van overlast",
                                  "klachten van overlast",
                                  "overlastklachten",
                                  "aantal overlastklachten")
            results$afhankelijke_variabele <- list(
              exists = TRUE,
              value = get("afhankelijke_variabele", envir = env),
              correct = current_val %in% acceptable_answers,
              expected = "Het aantal meldingen van overlast"
            )
          } else {
            results$afhankelijke_variabele <- list(exists = FALSE, value = NA, correct = FALSE, expected = "Het aantal meldingen van overlast")
          }
          
          # Meetniveau afhankelijk variabele
          if(exists("meetniveau_afhankelijk_variabele", envir = env)) {
            current_val <- tolower(as.character(get("meetniveau_afhankelijk_variabele", envir = env)))
            current_val <- trimws(current_val)
            acceptable_answers <- c("ratio")
            results$meetniveau_afhankelijk_variabele <- list(
              exists = TRUE,
              value = get("meetniveau_afhankelijk_variabele", envir = env),
              correct = current_val %in% acceptable_answers,
              expected = "ratio"
            )
          } else {
            results$meetniveau_afhankelijk_variabele <- list(exists = FALSE, value = NA, correct = FALSE, expected = "ratio")
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
            "onafhankelijke_variabele" = "Onafhankelijke variabele",
            "meetniveau_onafhankelijk_variabele" = "Meetniveau onafhankelijke variabele",
            "afhankelijke_variabele" = "Afhankelijke variabele",
            "meetniveau_afhankelijk_variabele" = "Meetniveau afhankelijke variabele"
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
            feedback_parts <- c(feedback_parts, "\n✅ **Alle variabelen correct geclassificeerd.**")
            feedback_parts <- c(feedback_parts, "\n**Uitstekend!** Je begrijpt onafhankelijke en afhankelijke variabelen goed.")
          } else {
            
            # Add helpful tips for incorrect answers
            incorrect_vars <- sapply(results, function(x) !x$correct)
            if(any(incorrect_vars)) {
              feedback_parts <- c(feedback_parts, "**📚 Uitleg waarom deze antwoorden fout zijn:**")
              
              if(!results$onafhankelijke_variabele$correct) {
                if(!results$onafhankelijke_variabele$exists) {
                  feedback_parts <- c(feedback_parts, "• **Onafhankelijke variabele**: ❌ Variabele niet gevonden. Vergeet je aanhalingstekens? Gebruik: `onafhankelijke_variabele <- \"De interventie\"` (let op de aanhalingstekens!)")
                } else {
                  student_answer <- tolower(as.character(results$onafhankelijke_variabele$value))
                  if(student_answer %in% c("overlast", "meldingen", "overlastmeldingen", "aantal meldingen")) {
                    feedback_parts <- c(feedback_parts, "• **Onafhankelijke variabele**: Je noemde 'overlast' of 'meldingen', maar dat is de afhankelijke variabele (wat wordt gemeten). De onafhankelijke variabele is wat de onderzoeker controleert: wel/geen interventie → **De interventie**")
                  } else if(student_answer %in% c("jongeren", "de jongeren", "groep jongeren")) {
                    feedback_parts <- c(feedback_parts, "• **Onafhankelijke variabele**: Je noemde 'jongeren', maar dat zijn de onderzoekseenheden (wie wordt bestudeerd). De onafhankelijke variabele is wat varieert tussen groepen: wel/geen interventie → **De interventie**")
                  } else if(student_answer %in% c("wijk", "wijken", "interventiewijk", "controlegroep")) {
                    feedback_parts <- c(feedback_parts, "• **Onafhankelijke variabele**: Je noemde de wijken, wat dicht bij het goede antwoord ligt! De onafhankelijke variabele is preciezer gezegd: het wel/niet krijgen van de interventie → **De interventie**")
                  } else if(student_answer %in% c("leeftijd", "geslacht", "opleiding")) {
                    feedback_parts <- c(feedback_parts, "• **Onafhankelijke variabele**: Je noemde een demografische variabele, maar die wordt hier niet gecontroleerd door de onderzoeker. De interventie wordt wel bewust toegepast → **De interventie**")
                  } else {
                    feedback_parts <- c(feedback_parts, "• **Onafhankelijke variabele**: De onafhankelijke variabele is wat de onderzoeker manipuleert of controleert. Hier wordt één groep een interventie gegeven en de andere niet → **De interventie**")
                  }
                }
              }
              
              if(!results$meetniveau_onafhankelijk_variabele$correct) {
                if(!results$meetniveau_onafhankelijk_variabele$exists) {
                  feedback_parts <- c(feedback_parts, "• **Meetniveau onafhankelijke variabele**: ❌ Variabele niet gevonden. Vergeet je aanhalingstekens? Gebruik: `meetniveau_onafhankelijk_variabele <- \"nominaal\"` (let op de aanhalingstekens!)")
                } else {
                  student_answer <- tolower(as.character(results$meetniveau_onafhankelijk_variabele$value))
                  if(student_answer == "ordinaal") {
                    feedback_parts <- c(feedback_parts, "• **Meetniveau onafhankelijke variabele**: Je koos 'ordinaal', maar dit is fout. Er zijn twee categorieën (interventiewijk vs controlegroep) zonder rangorde → **nominaal**")
                  } else if(student_answer == "interval") {
                    feedback_parts <- c(feedback_parts, "• **Meetniveau onafhankelijke variabele**: Je koos 'interval', maar dit is fout. Het zijn categorieën (interventiewijk vs controlegroep), geen numerieke waarden → **nominaal**")
                  } else if(student_answer == "ratio") {
                    feedback_parts <- c(feedback_parts, "• **Meetniveau onafhankelijke variabele**: Je koos 'ratio', maar dit is fout. Het zijn categorieën (interventiewijk vs controlegroep), geen numerieke waarden → **nominaal**")
                  } else {
                    feedback_parts <- c(feedback_parts, "• **Meetniveau onafhankelijke variabele**: Er zijn twee categorieën zonder rangorde: interventiewijk en controlegroep → **nominaal**")
                  }
                }
              }
              
              if(!results$afhankelijke_variabele$correct) {
                if(!results$afhankelijke_variabele$exists) {
                  feedback_parts <- c(feedback_parts, "• **Afhankelijke variabele**: ❌ Variabele niet gevonden. Vergeet je aanhalingstekens? Gebruik: `afhankelijke_variabele <- \"Het aantal meldingen van overlast\"` (let op de aanhalingstekens!)")
                } else {
                  student_answer <- tolower(as.character(results$afhankelijke_variabele$value))
                  if(student_answer %in% c("interventie", "de interventie", "type interventie")) {
                    feedback_parts <- c(feedback_parts, "• **Afhankelijke variabele**: Je noemde 'interventie', maar dat is de onafhankelijke variabele (wat wordt toegepast). De afhankelijke variabele is het effect dat wordt gemeten → **Het aantal meldingen van overlast**")
                  } else if(student_answer %in% c("jongeren", "de jongeren", "gedrag jongeren", "gedrag van jongeren")) {
                    feedback_parts <- c(feedback_parts, "• **Afhankelijke variabele**: Je noemde 'jongeren' of hun gedrag. Dat klopt conceptueel, maar specifieker: wat wordt er precies geteld/gemeten? → **Het aantal meldingen van overlast**")
                  } else if(student_answer %in% c("criminaliteit", "misdaad", "crimineel gedrag")) {
                    feedback_parts <- c(feedback_parts, "• **Afhankelijke variabele**: Je noemde 'criminaliteit', wat thematisch klopt. Maar specifieker: hoe wordt dit gemeten in het onderzoek? → **Het aantal meldingen van overlast**")
                  } else if(student_answer %in% c("wijk", "wijken", "buurt")) {
                    feedback_parts <- c(feedback_parts, "• **Afhankelijke variabele**: Je noemde 'wijk', maar dat is waar het onderzoek plaatsvindt. De afhankelijke variabele is wat wordt gemeten als uitkomst → **Het aantal meldingen van overlast**")
                  } else {
                    feedback_parts <- c(feedback_parts, "• **Afhankelijke variabele**: De afhankelijke variabele is wat wordt gemeten als uitkomst van de interventie. In dit onderzoek wordt specifiek geteld → **Het aantal meldingen van overlast**")
                  }
                }
              }
              
              if(!results$meetniveau_afhankelijk_variabele$correct) {
                if(!results$meetniveau_afhankelijk_variabele$exists) {
                  feedback_parts <- c(feedback_parts, "• **Meetniveau afhankelijke variabele**: ❌ Variabele niet gevonden. Vergeet je aanhalingstekens? Gebruik: `meetniveau_afhankelijk_variabele <- \"ratio\"` (let op de aanhalingstekens!)")
                } else {
                  student_answer <- tolower(as.character(results$meetniveau_afhankelijk_variabele$value))
                  if(student_answer == "nominaal") {
                    feedback_parts <- c(feedback_parts, "• **Meetniveau afhankelijke variabele**: Je koos 'nominaal', maar dit is fout. Aantal meldingen zijn getallen waarmee je kunt rekenen, heeft een echt nulpunt (0 meldingen) → **ratio**")
                  } else if(student_answer == "ordinaal") {
                    feedback_parts <- c(feedback_parts, "• **Meetniveau afhankelijke variabele**: Je koos 'ordinaal', maar dit is fout. Aantal meldingen heeft niet alleen rangorde maar ook gelijke afstanden en een echt nulpunt → **ratio**")
                  } else if(student_answer == "interval") {
                    feedback_parts <- c(feedback_parts, "• **Meetniveau afhankelijke variabele**: Je koos 'interval', maar dit is fout. Aantal meldingen heeft wel een echt nulpunt: 0 meldingen betekent echt geen meldingen → **ratio**")
                  } else {
                    feedback_parts <- c(feedback_parts, "• **Meetniveau afhankelijke variabele**: Aantal meldingen heeft gelijke afstanden, een echt nulpunt (0 = geen meldingen) en betekenisvolle verhoudingen → **ratio**")
                  }
                }
              }
            }
          }
          
          # Always add educational content
          feedback_parts <- c(feedback_parts, "**Variabelen uitleg:**")
          feedback_parts <- c(feedback_parts, "• **Onafhankelijke variabele**: Wat de onderzoeker manipuleert/controleert (de 'oorzaak')")
          feedback_parts <- c(feedback_parts, "• **Afhankelijke variabele**: Wat wordt gemeten als uitkomst (het 'effect')")
          feedback_parts <- c(feedback_parts, "• **Meetniveaus**: Nominaal (categorieën), Ordinaal (rangorde), Interval (geen echt nulpunt), Ratio (echt nulpunt)")
          
          get_reporter()$add_message(paste(feedback_parts, collapse = "\n\n"), type = "markdown")
          
          generated == expected
        }
      )
    }
  )
})