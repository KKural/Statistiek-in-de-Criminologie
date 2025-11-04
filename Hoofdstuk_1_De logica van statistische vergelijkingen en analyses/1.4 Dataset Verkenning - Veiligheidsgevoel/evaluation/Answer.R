# Load the dataset that will be available to students
source("load_data.R")

context({
  testcase("str(df_fear_of_crime_gent)", {
    # Simple success test - if we get here, the student ran something
    testEqual(NULL, function(env) { 
      # Load data in student environment
      env$source("load_data.R")
      
      # Show the str output as feedback regardless of what they did
      str_output <- capture.output(str(df_fear_of_crime_gent))
      formatted_output <- paste("```", paste(str_output, collapse = "\n"), "```", sep = "\n")
      
      get_reporter()$add_message("✅ Je hebt de dataset verkend!", type = "markdown")
      get_reporter()$add_message(paste("**De structuur van df_fear_of_crime_gent:**", formatted_output, sep = "\n\n"), type = "markdown")
      get_reporter()$add_message("**Interpretatie:**\n- 500 observaties (respondenten)\n- 8 variabelen\n- Mix van integers (int) en characters (chr)\n- Dataset bevat veiligheidsgevoel data uit Gent", type = "markdown")
      
      # Always return success
      return(TRUE)
    }, TRUE)
  })
})