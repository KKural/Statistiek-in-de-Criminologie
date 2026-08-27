context({
  testcase(
    "",
    {
      testEqual(
        " ",
        function(env) {
          # Use the provided environment (env) instead of globalenv()
          results <- list()

          classify_text <- function(name, expected) {
            if (!exists(name, envir = env, inherits = FALSE)) {
              return(list(
                exists = FALSE, valid = FALSE, value = NA_character_,
                correct = FALSE, expected = expected
              ))
            }
            raw_value <- get(name, envir = env, inherits = FALSE)
            converted <- tryCatch(
              suppressWarnings(as.character(raw_value)),
              error = function(error) character()
            )
            valid <- length(converted) == 1L && !is.na(converted) &&
              nzchar(trimws(converted))
            display_value <- if (valid) converted else "<ongeldige invoer>"
            normalized <- if (valid) tolower(trimws(converted)) else NA_character_
            list(
              exists = TRUE,
              valid = valid,
              value = display_value,
              correct = isTRUE(valid && normalized == tolower(expected)),
              expected = expected
            )
          }
          
          # Check each variable and store detailed results
          results$favoriete_keuze <- classify_text("favoriete_keuze", "Nominaal")
          results$leeftijd <- classify_text("leeftijd", "Ratio")
          results$geslacht <- classify_text("geslacht", "Nominaal")
          results$studierichting <- classify_text("studierichting", "Nominaal")
          results$studentnummer <- classify_text("studentnummer", "Nominaal")
          
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
          feedback_parts <- c("**Resultaten per variabele:**\n")
          
          variable_names <- c(
            "favoriete_keuze" = "Favoriete keuze",
            "leeftijd" = "Leeftijd", 
            "geslacht" = "Geslacht",
            "studierichting" = "Studierichting",
            "studentnummer" = "Studentnummer"
          )
          
          counter <- 1
          for(var_key in names(variable_names)) {
            var_display <- variable_names[var_key]
            result <- results[[var_key]]
            
            if(!result$exists) {
              feedback_parts <- c(feedback_parts, paste0(counter, ". **", var_display, "**: *Ontbreekt* ❌"))
            } else if(!isTRUE(result$valid)) {
              feedback_parts <- c(feedback_parts, paste0(counter, ". **", var_display, "**: *Ongeldige invoer; vul precies één tekstantwoord in* ❌"))
            } else if(isTRUE(result$correct)) {
              feedback_parts <- c(feedback_parts, paste0(counter, ". **", var_display, "**: ", result$value, " ✅"))
            } else {
              feedback_parts <- c(feedback_parts, paste0(counter, ". **", var_display, "**: ", result$value, " ❌"))
            }
            counter <- counter + 1
          }
          
          if (generated == expected) {
            feedback_parts <- c(feedback_parts, "\n✅ **Alle variabelen correct geclassificeerd.**")
            feedback_parts <- c(feedback_parts, "\n**Uitstekend!** Je begrijpt de verschillende meetniveaus goed.")
          } else {
            
            # Add helpful tips for incorrect answers
            incorrect_vars <- sapply(results, function(x) !x$correct)
            if(any(incorrect_vars)) {
              feedback_parts <- c(feedback_parts, "**📚 Uitleg waarom deze antwoorden fout zijn:**")
              
              if(!results$favoriete_keuze$correct) {
                if(!results$favoriete_keuze$exists) {
                  feedback_parts <- c(feedback_parts, "• **Favoriete keuze**: ❌ Variabele niet gevonden. Vergeet je aanhalingstekens? Gebruik: `favoriete_keuze <- \"Nominaal\"` (let op de aanhalingstekens!)")
                } else {
                  student_answer <- tolower(as.character(results$favoriete_keuze$value))
                  if(student_answer == "ordinaal") {
                    feedback_parts <- c(feedback_parts, "• **Favoriete keuze**: Je koos 'Ordinaal', maar dit is fout. Ordinaal betekent dat categorieën een rangorde hebben. Google, Bibliotheek, Wikipedia zijn gewoon verschillende keuzes zonder dat één 'beter' is dan de ander → **Nominaal**")
                  } else if(student_answer == "interval") {
                    feedback_parts <- c(feedback_parts, "• **Favoriete keuze**: Je koos 'Interval', maar dit is fout. Interval betekent numerieke waarden met gelijke afstanden. Dit zijn categorieën (Google, Bibliotheek, Wikipedia), geen getallen → **Nominaal**")
                  } else if(student_answer == "ratio") {
                    feedback_parts <- c(feedback_parts, "• **Favoriete keuze**: Je koos 'Ratio', maar dit is fout. Ratio betekent numerieke waarden met een echt nulpunt. Dit zijn categorieën (Google, Bibliotheek, Wikipedia), geen getallen → **Nominaal**")
                  } else {
                    feedback_parts <- c(feedback_parts, "• **Favoriete keuze**: Google, Bibliotheek, Wikipedia zijn verschillende categorieën zonder rangorde → **Nominaal**")
                  }
                }
              }
              
              if(!results$leeftijd$correct) {
                if(!results$leeftijd$exists) {
                  feedback_parts <- c(feedback_parts, "• **Leeftijd**: ❌ Variabele niet gevonden. Vergeet je aanhalingstekens? Gebruik: `leeftijd <- \"Ratio\"` (let op de aanhalingstekens!)")
                } else {
                  student_answer <- tolower(as.character(results$leeftijd$value))
                  if(student_answer == "nominaal") {
                    feedback_parts <- c(feedback_parts, "• **Leeftijd**: Je koos 'Nominaal', maar dit is fout. Nominaal betekent categorieën zonder ordening. Leeftijd bestaat uit getallen waarmee je kunt rekenen (17, 18, 19 jaar) → **Ratio**")
                  } else if(student_answer == "ordinaal") {
                    feedback_parts <- c(feedback_parts, "• **Leeftijd**: Je koos 'Ordinaal', maar dit is fout. Ordinaal heeft wel ordening maar geen gelijke afstanden. Leeftijd heeft wel gelijke afstanden (1 jaar verschil is altijd hetzelfde) én een echt nulpunt (0 jaar = geen leeftijd) → **Ratio**")
                  } else if(student_answer == "interval") {
                    feedback_parts <- c(feedback_parts, "• **Leeftijd**: Je koos 'Interval', maar dit is fout. Interval heeft geen echt nulpunt. Leeftijd heeft wel een echt nulpunt: 0 jaar betekent echt 'geen leeftijd' → **Ratio**")
                  } else {
                    feedback_parts <- c(feedback_parts, "• **Leeftijd**: Leeftijd heeft een echt nulpunt (0 jaar = geen leeftijd) en betekenisvolle verhoudingen (20 jaar is twee keer zo oud als 10 jaar) → **Ratio**")
                  }
                }
              }
              
              if(!results$geslacht$correct) {
                if(!results$geslacht$exists) {
                  feedback_parts <- c(feedback_parts, "• **Geslacht**: ❌ Variabele niet gevonden. Vergeet je aanhalingstekens? Gebruik: `geslacht <- \"Nominaal\"` (let op de aanhalingstekens!)")
                } else {
                  student_answer <- tolower(as.character(results$geslacht$value))
                  if(student_answer == "ordinaal") {
                    feedback_parts <- c(feedback_parts, "• **Geslacht**: Je koos 'Ordinaal', maar dit is fout. Ordinaal betekent dat categorieën een rangorde hebben (bijv. slecht < goed < uitstekend). Man en vrouw hebben geen rangorde - er is geen 'hoger' of 'lager' geslacht → **Nominaal**")
                  } else if(student_answer == "interval") {
                    feedback_parts <- c(feedback_parts, "• **Geslacht**: Je koos 'Interval', maar dit is fout. Interval betekent numerieke waarden met gelijke afstanden. Geslacht bestaat uit categorieën (man/vrouw), niet uit getallen → **Nominaal**")
                  } else if(student_answer == "ratio") {
                    feedback_parts <- c(feedback_parts, "• **Geslacht**: Je koos 'Ratio', maar dit is fout. Ratio betekent numerieke waarden met een echt nulpunt. Geslacht bestaat uit categorieën (man/vrouw), niet uit getallen → **Nominaal**")
                  } else {
                    feedback_parts <- c(feedback_parts, "• **Geslacht**: Man en vrouw zijn verschillende categorieën zonder rangorde. Er is geen 'hoger' of 'lager' geslacht → **Nominaal**")
                  }
                }
              }
              
              if(!results$studierichting$correct) {
                if(!results$studierichting$exists) {
                  feedback_parts <- c(feedback_parts, "• **Studierichting**: ❌ Variabele niet gevonden. Vergeet je aanhalingstekens? Gebruik: `studierichting <- \"Nominaal\"` (let op de aanhalingstekens!)")
                } else {
                  student_answer <- tolower(as.character(results$studierichting$value))
                  if(student_answer == "ordinaal") {
                    feedback_parts <- c(feedback_parts, "• **Studierichting**: Je koos 'Ordinaal', maar dit is fout. Ordinaal betekent dat categorieën een rangorde hebben. Statistiek, wiskunde, techniek, Engels hebben geen rangorde - geen richting is 'hoger' dan een andere → **Nominaal**")
                  } else if(student_answer == "interval") {
                    feedback_parts <- c(feedback_parts, "• **Studierichting**: Je koos 'Interval', maar dit is fout. Interval betekent numerieke waarden met gelijke afstanden. Studierichtingen zijn categorieën (statistiek, wiskunde, techniek), geen getallen → **Nominaal**")
                  } else if(student_answer == "ratio") {
                    feedback_parts <- c(feedback_parts, "• **Studierichting**: Je koos 'Ratio', maar dit is fout. Ratio betekent numerieke waarden met een echt nulpunt. Studierichtingen zijn categorieën (statistiek, wiskunde, techniek), geen getallen → **Nominaal**")
                  } else {
                    feedback_parts <- c(feedback_parts, "• **Studierichting**: Verschillende richtingen zonder rangorde. Geen richting is 'beter' dan een andere → **Nominaal**")
                  }
                }
              }
              
              if(!results$studentnummer$correct) {
                if(!results$studentnummer$exists) {
                  feedback_parts <- c(feedback_parts, "• **Studentnummer**: ❌ Variabele niet gevonden. Vergeet je aanhalingstekens? Gebruik: `studentnummer <- \"Nominaal\"` (let op de aanhalingstekens!)")
                } else {
                  student_answer <- tolower(as.character(results$studentnummer$value))
                  if(student_answer == "ordinaal") {
                    feedback_parts <- c(feedback_parts, "• **Studentnummer**: Je koos 'Ordinaal', maar dit is fout. Ordinaal betekent rangorde. Studentnummer 100 is niet 'hoger' of 'beter' dan nummer 50 - het zijn alleen labels → **Nominaal**")
                  } else if(student_answer == "interval") {
                    feedback_parts <- c(feedback_parts, "• **Studentnummer**: Je koos 'Interval', maar dit is fout. Interval betekent dat je kunt rekenen met de getallen. Je kunt niet zeggen dat student 100 '50 meer' is dan student 50 - het zijn alleen labels → **Nominaal**")
                  } else if(student_answer == "ratio") {
                    feedback_parts <- c(feedback_parts, "• **Studentnummer**: Je koos 'Ratio', maar dit is fout. Ratio betekent dat verhoudingen betekenis hebben. Student 100 is niet 'twee keer meer' dan student 50 - het zijn alleen labels voor identificatie → **Nominaal**")
                  } else {
                    feedback_parts <- c(feedback_parts, "• **Studentnummer**: Nummers 1-552 zijn alleen labels voor identificatie. Student 100 is niet 'twee keer meer' dan student 50 → **Nominaal**")
                  }
                }
              }
            }
          }
          
          # Always add educational content
          feedback_parts <- c(feedback_parts, "**Meetniveaus uitleg:**")
          feedback_parts <- c(feedback_parts, "• **Nominaal**: Categorieën zonder ordening (bijv. kleuren, geslacht)")
          feedback_parts <- c(feedback_parts, "• **Ordinaal**: Categorieën met ordening (bijv. schoolcijfers: slecht < goed < uitstekend)")
          feedback_parts <- c(feedback_parts, "• **Interval**: Getallen met gelijke afstanden, geen echt nulpunt (bijv. temperatuur in °C)")
          feedback_parts <- c(feedback_parts, "• **Ratio**: Getallen met gelijke afstanden én echt nulpunt (bijv. leeftijd, gewicht)")
          feedback_parts <- c(feedback_parts, "**Meer leren?** <a href='https://www.youtube.com/watch?v=KJPXZIEmvfA' target='_blank' rel='noopener noreferrer'>Bekijk Video: Meetniveaus Uitleg</a> | <a href='https://www.researchgate.net/publication/373517435_Levels_of_Measurement_in_Criminology_and_Criminal_Justice' target='_blank' rel='noopener noreferrer'>Measurement Scales Artikel</a>")
          
          # Learner-facing feedback contract: preserve the detailed field feedback
          # above, then make the diagnostic reasoning and retry strategy explicit.
          if (isTRUE(generated == expected)) {
            feedback_parts <- c(feedback_parts, "**Bevestiging:** alle gevraagde classificatievelden zijn correct; de veldfeedback hierboven bevestigt per onderdeel waarom.")
            feedback_parts <- c(feedback_parts, "**Denkregel:** bepaal eerst of waarden labels of hoeveelheden zijn en toets daarna alleen de toepasselijke eigenschappen: rangorde, gelijke afstanden en echt nulpunt.\n\n**Transferstap:** pas de ladder toe op dossiernummer versus aantal delicten en leg voor beide het beslissende criterium in één zin uit.")
          } else {
            feedback_parts <- c(
              feedback_parts,
              "**Waarschijnlijke redenering:** één of meer afwijkende velden kunnen erop wijzen dat je een herkenbaar kenmerk hebt gekozen voordat je de criteria afzonderlijk controleerde. Dit is een voorzichtige hypothese: dezelfde antwoordcombinatie kan ook via een andere denkroute ontstaan.",
              "**Waarom dit niet klopt:** elk veld toetst een eigen eigenschap. Een getal dat als identificatielabel wordt gebruikt, wordt bijvoorbeeld niet automatisch een kwantitatieve meting; de specifieke veldfeedback hierboven toont welk criterium botst.",
              "**Denkregel:** gebruik alleen de toepasselijke stappen van deze ladder: (1) label of hoeveelheid, (2) betekenisvolle rangorde, (3) gelijke afstanden en (4) echt nulpunt. Stop zodra een vereiste eigenschap ontbreekt.",
              "**Volgende stap:** neem het eerste veld met ❌ hierboven, schrijf het beslissende criterium naast je antwoord en pas alleen dat veld aan. Doorloop daarna de ladder opnieuw voor een ander criminologisch voorbeeld, zoals dossiernummer versus aantal delicten."
            )
          }

          get_reporter()$add_message(paste(feedback_parts, collapse = "\n\n"), type = "markdown")
          
          generated == expected
        }
      )
    }
  )
})
