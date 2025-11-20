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
          # Favoriete keuze
          if(exists("favoriete_keuze", envir = env)) {
            current_val <- tolower(as.character(get("favoriete_keuze", envir = env)))
            results$favoriete_keuze <- list(
              exists = TRUE,
              value = get("favoriete_keuze", envir = env),
              correct = current_val == "nominaal",
              expected = "Nominaal"
            )
          } else {
            results$favoriete_keuze <- list(exists = FALSE, value = NA, correct = FALSE, expected = "Nominaal")
          }
          
          # Leeftijd
          if(exists("leeftijd", envir = env)) {
            current_val <- tolower(as.character(get("leeftijd", envir = env)))
            results$leeftijd <- list(
              exists = TRUE,
              value = get("leeftijd", envir = env),
              correct = current_val == "ratio",
              expected = "Ratio"
            )
          } else {
            results$leeftijd <- list(exists = FALSE, value = NA, correct = FALSE, expected = "Ratio")
          }
          
          # Geslacht
          if(exists("geslacht", envir = env)) {
            current_val <- tolower(as.character(get("geslacht", envir = env)))
            results$geslacht <- list(
              exists = TRUE,
              value = get("geslacht", envir = env),
              correct = current_val == "nominaal",
              expected = "Nominaal"
            )
          } else {
            results$geslacht <- list(exists = FALSE, value = NA, correct = FALSE, expected = "Nominaal")
          }
          
          # Studierichting
          if(exists("studierichting", envir = env)) {
            current_val <- tolower(as.character(get("studierichting", envir = env)))
            results$studierichting <- list(
              exists = TRUE,
              value = get("studierichting", envir = env),
              correct = current_val == "nominaal",
              expected = "Nominaal"
            )
          } else {
            results$studierichting <- list(exists = FALSE, value = NA, correct = FALSE, expected = "Nominaal")
          }
          
          # Studentnummer
          if(exists("studentnummer", envir = env)) {
            current_val <- tolower(as.character(get("studentnummer", envir = env)))
            results$studentnummer <- list(
              exists = TRUE,
              value = get("studentnummer", envir = env),
              correct = current_val == "nominaal",
              expected = "Nominaal"
            )
          } else {
            results$studentnummer <- list(exists = FALSE, value = NA, correct = FALSE, expected = "Nominaal")
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
          feedback_parts <- c("**Resultaten per variabele:**\n")
          
          variable_names <- c(
            "favoriete_keuze" = "Favoriete keuze",
            "leeftijd" = "Leeftijd", 
            "geslacht" = "Geslacht",
            "studierichting" = "Studierichting",
            "studentnummer" = "Studentnummer"
          )
          
          for(var_key in names(variable_names)) {
            var_display <- variable_names[var_key]
            result <- results[[var_key]]
            
            if(!result$exists) {
              feedback_parts <- c(feedback_parts, paste0("• **", var_display, "**: *Ontbreekt* ❌"))
            } else if(result$correct) {
              feedback_parts <- c(feedback_parts, paste0("• **", var_display, "**: ", result$value, " ✅"))
            } else {
              feedback_parts <- c(feedback_parts, paste0("• **", var_display, "**: ", result$value, " ❌"))
            }
          }
          
          if (generated == expected) {
            feedback_parts <- c(feedback_parts, "\n✅ **Alle variabelen correct geclassificeerd.**")
            feedback_parts <- c(feedback_parts, "\n**Uitstekend!** Je begrijpt de verschillende meetniveaus goed.")
          } else {
            
            # Add helpful tips for incorrect answers
            incorrect_vars <- sapply(results, function(x) !x$correct)
            if(any(incorrect_vars)) {
              feedback_parts <- c(feedback_parts, "**Tips voor de foute antwoorden:**")
              
              if(!results$favoriete_keuze$correct) {
                if(!results$favoriete_keuze$exists) {
                  feedback_parts <- c(feedback_parts, "• **Favoriete keuze**: Vergeet niet aanhalingstekens! Gebruik: `favoriete_keuze <- \"Nominaal\"`")
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
                  feedback_parts <- c(feedback_parts, "• **Leeftijd**: Vergeet niet aanhalingstekens! Gebruik: `leeftijd <- \"Ratio\"`")
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
                  feedback_parts <- c(feedback_parts, "• **Geslacht**: Vergeet niet aanhalingstekens! Gebruik: `geslacht <- \"Nominaal\"`")
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
                  feedback_parts <- c(feedback_parts, "• **Studierichting**: Vergeet niet aanhalingstekens! Gebruik: `studierichting <- \"Nominaal\"`")
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
                  feedback_parts <- c(feedback_parts, "• **Studentnummer**: Vergeet niet aanhalingstekens! Gebruik: `studentnummer <- \"Nominaal\"`")
                } else {
                  feedback_parts <- c(feedback_parts, "• **Studentnummer**: Nummers 1-552 zijn alleen labels voor identificatie. Student 100 is niet 'twee keer meer' dan student 50 → **Nominaal**")
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
          
          get_reporter()$add_message(paste(feedback_parts, collapse = "\n\n"), type = "markdown")
          
          generated == expected
        }
      )
    }
  )
})