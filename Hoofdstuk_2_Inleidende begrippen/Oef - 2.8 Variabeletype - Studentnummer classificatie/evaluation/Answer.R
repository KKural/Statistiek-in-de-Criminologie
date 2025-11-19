context({
  testcase(
    "Classificatie van variabelen",
    {
      testEqual(
        "Alle variabelen correct geclassificeerd",
        function(env) {
          # Check each variable
          correct_count <- 0
          total_count <- 5
          
          if(exists("favoriete_keuze") && tolower(favoriete_keuze) == "nominaal") correct_count <- correct_count + 1
          if(exists("leeftijd") && tolower(leeftijd) == "ratio") correct_count <- correct_count + 1
          if(exists("geslacht") && tolower(geslacht) == "nominaal") correct_count <- correct_count + 1
          if(exists("studierichting") && tolower(studierichting) == "nominaal") correct_count <- correct_count + 1
          if(exists("studentnummer") && tolower(studentnummer) == "nominaal") correct_count <- correct_count + 1
          
          return(correct_count == total_count)
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          if (generated == expected) {
            get_reporter()$add_message("✅ **Juist - perfecte classificatie van alle variabelen!**\n\n• **Favoriete keuze voor online onderzoek**: Nominaal ✓ (categorieën zonder ordening)\n• **Leeftijd**: Ratio ✓ (getallen met echt nulpunt: 0 jaar betekent geen leeftijd)\n• **Geslacht**: Nominaal ✓ (man/vrouw zijn categorieën zonder ordening)\n• **Studierichting**: Nominaal ✓ (verschillende richtingen zonder ordening)\n• **Studentnummer**: Nominaal ✓ (alleen identificatie, geen rekenkundige betekenis)\n\n**Uitstekend!** Je begrijpt de verschillende meetniveaus.", type = "markdown")
          } else {
            # Provide detailed feedback on what's wrong
            feedback_parts <- c("❌ **Niet alle variabelen zijn correct geclassificeerd.**\n")
            
            if(!exists("favoriete_keuze") || tolower(favoriete_keuze) != "nominaal") {
              feedback_parts <- c(feedback_parts, "• **Favoriete keuze**: Moet 'Nominaal' zijn (Google, Bibliotheek, Wikipedia zijn categorieën)")
            }
            if(!exists("leeftijd") || tolower(leeftijd) != "ratio") {
              feedback_parts <- c(feedback_parts, "• **Leeftijd**: Moet 'Ratio' zijn (heeft echt nulpunt: 0 jaar)")
            }
            if(!exists("geslacht") || tolower(geslacht) != "nominaal") {
              feedback_parts <- c(feedback_parts, "• **Geslacht**: Moet 'Nominaal' zijn (man/vrouw zijn categorieën)")
            }
            if(!exists("studierichting") || tolower(studierichting) != "nominaal") {
              feedback_parts <- c(feedback_parts, "• **Studierichting**: Moet 'Nominaal' zijn (verschillende richtingen)")
            }
            if(!exists("studentnummer") || tolower(studentnummer) != "nominaal") {
              feedback_parts <- c(feedback_parts, "• **Studentnummer**: Moet 'Nominaal' zijn (alleen identificatie)")
            }
            
            feedback_parts <- c(feedback_parts, "\n**Tip**: Nominaal = categorieën, Ratio = getallen met echt nulpunt")
            
            get_reporter()$add_message(paste(feedback_parts, collapse = "\n"), type = "markdown")
          }
          
          generated == expected
        }
      )
    }
  )
})