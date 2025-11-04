context({
  testcase("Meetniveau bepaling", {
    # Capture the student's last expression/output
    student_answer <- tryCatch({
      as.numeric(capture.output(source("student_code.R", echo=FALSE)))
    }, error = function(e) {
      # Try to get last value from environment
      env_objects <- ls(envir = .GlobalEnv)
      if (length(env_objects) > 0) {
        last_obj <- get(env_objects[length(env_objects)], envir = .GlobalEnv)
        as.numeric(last_obj)
      } else {
        NA
      }
    })
    
    # Check if we got a valid answer
    if (is.na(student_answer) || length(student_answer) == 0) {
      get_reporter()$add_message("❌ Geen geldig antwoord gevonden. Typ gewoon het getal van je keuze (1, 2, 3, of 4).")
      return(FALSE)
    }
    
    # Provide feedback based on answer
    if (student_answer == 4) {
      get_reporter()$add_message("✅ Juist! Leeftijd is interval/ratio omdat het numerieke waarden heeft, gelijke intervallen, en een absoluut nulpunt (0 jaar = geen leeftijd).")
      return(TRUE)
    } else if (student_answer == 1) {
      get_reporter()$add_message("❌ Fout. Nominaal betekent categorieën zonder rangorde. Leeftijd heeft wel numerieke waarden en rangorde.")
      return(FALSE)
    } else if (student_answer == 2) {
      get_reporter()$add_message("❌ Fout. Ordinaal heeft alleen rangorde, geen gelijke intervallen. Leeftijd heeft wél gelijke intervallen tussen jaren.")
      return(FALSE)
    } else if (student_answer == 3) {
      get_reporter()$add_message("❌ Fout. Dichotoom betekent slechts twee categorieën. Leeftijd heeft veel mogelijke waarden.")
      return(FALSE)
    } else {
      get_reporter()$add_message("❌ Geef een getal tussen 1 en 4 in.")
      return(FALSE)
    }
  })
})