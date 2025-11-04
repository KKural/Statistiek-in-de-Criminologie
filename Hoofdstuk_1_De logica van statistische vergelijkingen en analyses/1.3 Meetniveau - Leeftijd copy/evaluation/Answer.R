context({
  testcase("Meetniveau bepaling", {
    # Check if student provided answer
    if (!exists("antwoord")) {
      get_reporter()$add_message("❌ Variabele 'antwoord' niet gevonden.")
      return(FALSE)
    }
    
    # Convert to numeric
    student_answer <- as.numeric(antwoord)
    
    # Simple if-else feedback (like Echo style but with rich content)
    if (student_answer == 4) {
      get_reporter()$add_message("✅ Juist! Leeftijd is interval/ratio omdat...")
      return(TRUE)
    } else if (student_answer == 1) {
      get_reporter()$add_message("❌ Fout. Nominaal betekent categorieën zonder rangorde...")
      return(FALSE)
    } else if (student_answer == 2) {
      get_reporter()$add_message("❌ Fout. Ordinaal alleen rangorde...")
      return(FALSE)
    } else if (student_answer == 3) {
      get_reporter()$add_message("❌ Fout. Dichotoom betekent slechts twee categorieën...")
      return(FALSE)
    } else {
      get_reporter()$add_message("❌ Geef een getal tussen 1 en 4 in.")
      return(FALSE)
    }
  })
})