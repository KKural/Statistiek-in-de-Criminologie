# Create the sample dataset that students will work with
df_fear_of_crime_gent <- data.frame(
  respondent_id = 1:500,
  leeftijd = sample(18:80, 500, replace = TRUE),
  geslacht = sample(c("Man", "Vrouw", "Anders"), 500, replace = TRUE, prob = c(0.48, 0.48, 0.04)),
  wijk = sample(c("Centrum", "Brugse Poort", "Rabot", "Nieuw Gent", "Mariakerke"), 500, replace = TRUE),
  veiligheidsgevoel_dag = sample(1:5, 500, replace = TRUE),
  veiligheidsgevoel_nacht = sample(1:5, 500, replace = TRUE),
  slachtoffer_laatste_jaar = sample(c("Ja", "Nee"), 500, replace = TRUE, prob = c(0.15, 0.85)),
  type_misdaad = sample(c("Diefstal", "Geweld", "Vandalisme", "Fraude", "Geen"), 500, replace = TRUE, prob = c(0.08, 0.03, 0.05, 0.02, 0.82))
)

context({
  testcase("str() functie gebruikt", {
    # Capture what the student types
    student_code <- readLines("student_code.R")
    student_code_clean <- paste(student_code, collapse = " ")
    
    # Check if they used str() with the correct dataset
    if (grepl("str\\s*\\(\\s*df_fear_of_crime_gent\\s*\\)", student_code_clean)) {
      
      # Show the actual str() output in feedback
      get_reporter()$add_message("✅ Correct! Je hebt str(df_fear_of_crime_gent) gebruikt.", type = "markdown")
      
      # Capture and show the actual output
      str_output <- capture.output(str(df_fear_of_crime_gent))
      formatted_output <- paste("```", paste(str_output, collapse = "\n"), "```", sep = "\n")
      
      get_reporter()$add_message(paste("**De structuur van df_fear_of_crime_gent:**", formatted_output, sep = "\n\n"), type = "markdown")
      
      get_reporter()$add_message("**Wat zie je hier?**\n- **Data type:** data.frame\n- **Observaties:** 500 rijen (respondenten)\n- **Variabelen:** 8 kolommen\n- **Variabele types:** int (gehele getallen), chr (tekst/character)", type = "markdown")
      
      return(TRUE)
      
    } else if (grepl("str\\s*\\(", student_code_clean)) {
      get_reporter()$add_message("❌ Je hebt wel str() gebruikt, maar niet met de juiste dataset. Gebruik: str(df_fear_of_crime_gent)")
      return(FALSE)
      
    } else {
      get_reporter()$add_message("❌ Gebruik de str() functie om de dataset structuur te bekijken. Typ: str(df_fear_of_crime_gent)")
      return(FALSE)
    }
  })
})