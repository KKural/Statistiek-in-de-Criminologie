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
            # Provide detailed feedback on what's wrong
            feedback_parts <- c("❌ **Niet alle variabelen zijn correct geclassificeerd.**\n")
            
            # Check each variable for feedback
            tryCatch({
              if(!exists("favoriete_keuze", envir = env) || tolower(get("favoriete_keuze", envir = env)) != "nominaal") {
                feedback_parts <- c(feedback_parts, "• **Favoriete keuze**: Moet 'Nominaal' zijn (Google, Bibliotheek, Wikipedia zijn categorieën)")
              }
              if(!exists("leeftijd", envir = env) || tolower(get("leeftijd", envir = env)) != "ratio") {
                feedback_parts <- c(feedback_parts, "• **Leeftijd**: Moet 'Ratio' zijn (heeft echt nulpunt: 0 jaar)")
              }
              if(!exists("geslacht", envir = env) || tolower(get("geslacht", envir = env)) != "nominaal") {
                feedback_parts <- c(feedback_parts, "• **Geslacht**: Moet 'Nominaal' zijn (man/vrouw zijn categorieën)")
              }
              if(!exists("studierichting", envir = env) || tolower(get("studierichting", envir = env)) != "nominaal") {
                feedback_parts <- c(feedback_parts, "• **Studierichting**: Moet 'Nominaal' zijn (verschillende richtingen)")
              }
              if(!exists("studentnummer", envir = env) || tolower(get("studentnummer", envir = env)) != "nominaal") {
                feedback_parts <- c(feedback_parts, "• **Studentnummer**: Moet 'Nominaal' zijn (alleen identificatie)")
              }
            }, error = function(e) {
              # Fallback feedback - provide general message if environment access fails
              feedback_parts <- c(feedback_parts, "• **Controleer alle variabelen**: Zorg dat alle 5 variabelen correct zijn toegewezen")
              feedback_parts <- c(feedback_parts, "• **Verwachte waarden**: favoriete_keuze='Nominaal', leeftijd='Ratio', geslacht='Nominaal', studierichting='Nominaal', studentnummer='Nominaal'")
            })
            
            feedback_parts <- c(feedback_parts, "\n**Tip**: Nominaal = categorieën, Ratio = getallen met echt nulpunt")
            
            get_reporter()$add_message(paste(feedback_parts, collapse = "\n"), type = "markdown")
          }
          
          generated == expected
        }
      )
    }
  )
})