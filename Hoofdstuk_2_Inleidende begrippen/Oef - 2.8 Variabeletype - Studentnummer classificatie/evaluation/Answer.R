context({
  testcase(
    "Classificatie van variabelen",
    {
      testEqual(
        "Alle variabelen correct geclassificeerd",
        function(env) {
          # Use the provided environment (env) instead of globalenv()
          correct_count <- 0
          total_count <- 5
          
          # Check each variable using the provided environment
          if(exists("favoriete_keuze", envir = env) && tolower(as.character(get("favoriete_keuze", envir = env))) == "nominaal") correct_count <- correct_count + 1
          if(exists("leeftijd", envir = env) && tolower(as.character(get("leeftijd", envir = env))) == "ratio") correct_count <- correct_count + 1
          if(exists("geslacht", envir = env) && tolower(as.character(get("geslacht", envir = env))) == "nominaal") correct_count <- correct_count + 1
          if(exists("studierichting", envir = env) && tolower(as.character(get("studierichting", envir = env))) == "nominaal") correct_count <- correct_count + 1
          if(exists("studentnummer", envir = env) && tolower(as.character(get("studentnummer", envir = env))) == "nominaal") correct_count <- correct_count + 1
          
          return(correct_count == total_count)
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          if (generated == expected) {
            get_reporter()$add_message("✅ **Juist - perfecte classificatie van alle variabelen!**\n\n• **Favoriete keuze voor online onderzoek**: Nominaal ✓ (categorieën zonder ordening)\n\n• **Leeftijd**: Ratio ✓ (getallen met echt nulpunt: 0 jaar betekent geen leeftijd)\n\n• **Geslacht**: Nominaal ✓ (man/vrouw zijn categorieën zonder ordening)\n\n• **Studierichting**: Nominaal ✓ (verschillende richtingen zonder ordening)\n\n• **Studentnummer**: Nominaal ✓ (alleen identificatie, geen rekenkundige betekenis)\n\n**Uitstekend!** Je begrijpt de verschillende meetniveaus.", type = "markdown")
          } else {
            # Provide detailed feedback showing both correct and incorrect variables
            feedback_parts <- c("❌ **Niet alle variabelen zijn correct geclassificeerd.**\n")
            
            # Check each variable and show status
            tryCatch({
              # Favoriete keuze
              if(!exists("favoriete_keuze", envir = env)) {
                feedback_parts <- c(feedback_parts, "❌ **Favoriete keuze**: Variabele ontbreekt! Gebruik: `favoriete_keuze <- \"Nominaal\"`")
              } else {
                current_val <- tolower(as.character(get("favoriete_keuze", envir = env)))
                if(current_val != "nominaal") {
                  feedback_parts <- c(feedback_parts, paste0("❌ **Favoriete keuze**: Jouw antwoord '", get("favoriete_keuze", envir = env), "' is fout. Correct: 'Nominaal' (Google, Bibliotheek, Wikipedia zijn categorieën zonder ordening)"))
                } else {
                  feedback_parts <- c(feedback_parts, "✅ **Favoriete keuze**: Correct - Nominaal")  
                }
              }
              
              # Leeftijd
              if(!exists("leeftijd", envir = env)) {
                feedback_parts <- c(feedback_parts, "❌ **Leeftijd**: Variabele ontbreekt! Gebruik: `leeftijd <- \"Ratio\"`")
              } else {
                current_val <- tolower(as.character(get("leeftijd", envir = env)))
                if(current_val != "ratio") {
                  feedback_parts <- c(feedback_parts, paste0("❌ **Leeftijd**: Jouw antwoord '", get("leeftijd", envir = env), "' is fout. Correct: 'Ratio' (heeft echt nulpunt: 0 jaar betekent geen leeftijd)"))
                } else {
                  feedback_parts <- c(feedback_parts, "✅ **Leeftijd**: Correct - Ratio")
                }
              }
              
              # Geslacht  
              if(!exists("geslacht", envir = env)) {
                feedback_parts <- c(feedback_parts, "❌ **Geslacht**: Variabele ontbreekt! Gebruik: `geslacht <- \"Nominaal\"`")
              } else {
                current_val <- tolower(as.character(get("geslacht", envir = env)))
                if(current_val != "nominaal") {
                  feedback_parts <- c(feedback_parts, paste0("❌ **Geslacht**: Jouw antwoord '", get("geslacht", envir = env), "' is fout. Correct: 'Nominaal' (man/vrouw zijn categorieën zonder ordening)"))
                } else {
                  feedback_parts <- c(feedback_parts, "✅ **Geslacht**: Correct - Nominaal")
                }
              }
              
              # Studierichting
              if(!exists("studierichting", envir = env)) {
                feedback_parts <- c(feedback_parts, "❌ **Studierichting**: Variabele ontbreekt! Gebruik: `studierichting <- \"Nominaal\"`")
              } else {
                current_val <- tolower(as.character(get("studierichting", envir = env)))
                if(current_val != "nominaal") {
                  feedback_parts <- c(feedback_parts, paste0("❌ **Studierichting**: Jouw antwoord '", get("studierichting", envir = env), "' is fout. Correct: 'Nominaal' (verschillende richtingen zonder ordening)"))
                } else {
                  feedback_parts <- c(feedback_parts, "✅ **Studierichting**: Correct - Nominaal")
                }
              }
              
              # Studentnummer
              if(!exists("studentnummer", envir = env)) {
                feedback_parts <- c(feedback_parts, "❌ **Studentnummer**: Variabele ontbreekt! Gebruik: `studentnummer <- \"Nominaal\"`")
              } else {
                current_val <- tolower(as.character(get("studentnummer", envir = env)))
                if(current_val != "nominaal") {
                  feedback_parts <- c(feedback_parts, paste0("❌ **Studentnummer**: Jouw antwoord '", get("studentnummer", envir = env), "' is fout. Correct: 'Nominaal' (alleen identificatie, geen rekenkundige betekenis)"))
                } else {
                  feedback_parts <- c(feedback_parts, "✅ **Studentnummer**: Correct - Nominaal")
                }
              }
              
            }, error = function(e) {
              # Fallback feedback - provide general message if environment access fails
              feedback_parts <- c(feedback_parts, "❌ **Controleer alle variabelen**: Zorg dat alle 5 variabelen correct zijn toegewezen")
              feedback_parts <- c(feedback_parts, "**Verwachte waarden**:")
              feedback_parts <- c(feedback_parts, "• `favoriete_keuze <- \"Nominaal\"`")
              feedback_parts <- c(feedback_parts, "• `leeftijd <- \"Ratio\"`")
              feedback_parts <- c(feedback_parts, "• `geslacht <- \"Nominaal\"`")
              feedback_parts <- c(feedback_parts, "• `studierichting <- \"Nominaal\"`")
              feedback_parts <- c(feedback_parts, "• `studentnummer <- \"Nominaal\"`")
            })
            
            feedback_parts <- c(feedback_parts, "\n**Meetniveaus uitleg**:")
            feedback_parts <- c(feedback_parts, "• **Nominaal**: Categorieën zonder ordening (bijv. kleuren, geslacht)")
            feedback_parts <- c(feedback_parts, "• **Ordinaal**: Categorieën met ordening (bijv. schoolcijfers: slecht < goed < uitstekend)")
            feedback_parts <- c(feedback_parts, "• **Interval**: Getallen met gelijke afstanden, geen echt nulpunt (bijv. temperatuur in °C)")
            feedback_parts <- c(feedback_parts, "• **Ratio**: Getallen met gelijke afstanden én echt nulpunt (bijv. leeftijd, gewicht)")
            
            get_reporter()$add_message(paste(feedback_parts, collapse = "\n\n"), type = "markdown")
          }
          
          generated == expected
        }
      )
    }
  )
})