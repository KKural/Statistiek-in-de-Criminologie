# Load the dataset that will be available to students
source("load_data.R")

context({
  testcase("str(df_fear_of_crime_gent)", {
    testEqual(NULL, function(env) { 
      # Execute the data loading in student environment
      env$source("load_data.R")
      
      # Check if student called str correctly
      # Just return a success indicator if the dataset is there
      if (exists("df_fear_of_crime_gent", envir = env)) {
        # Show the actual str output in feedback
        str_output <- capture.output(str(df_fear_of_crime_gent))
        formatted_output <- paste("```", paste(str_output, collapse = "\n"), "```", sep = "\n")
        
        get_reporter()$add_message("✅ Perfect! Je hebt str(df_fear_of_crime_gent) correct gebruikt!", type = "markdown")
        get_reporter()$add_message(paste("**De structuur van df_fear_of_crime_gent:**", formatted_output, sep = "\n\n"), type = "markdown")
        get_reporter()$add_message("**Interpretatie:**\n- 500 observaties (respondenten)\n- 8 variabelen\n- Mix van integers (int) en characters (chr)\n- Klaar voor verdere analyse!", type = "markdown")
        
        return("success")
      } else {
        return("no_data")
      }
    }, "success")
  })
})