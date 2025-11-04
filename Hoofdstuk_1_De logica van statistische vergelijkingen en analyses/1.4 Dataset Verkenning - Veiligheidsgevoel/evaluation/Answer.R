# Load dataset in test environment
source("../workdir/load_data.R", local = TRUE)

context({
  testcase('Dataset exploration', {
    # This test will always pass but shows the dataset structure in feedback
    testEqual("str(df_fear_of_crime_gent)", function(studentEnv) { 
      # Execute str() on our dataset and capture the output
      str_output <- capture.output(str(df_fear_of_crime_gent))
      
      # Add feedback messages
      get_reporter()$add_message("✅ **Dataset verkend!**", type="markdown")
      get_reporter()$add_message("**De structuur van df_fear_of_crime_gent:**", type="markdown")
      
      # Show the structure in a code block
      formatted_output <- paste("```r", paste(str_output, collapse = "\n"), "```", sep = "\n")
      get_reporter()$add_message(formatted_output, type="markdown")
      
      # Add interpretation
      get_reporter()$add_message("**📊 Interpretatie:**", type="markdown")
      get_reporter()$add_message("- **500 observaties** (respondenten uit Gent)", type="markdown")
      get_reporter()$add_message("- **8 variabelen** met verschillende datatypes", type="markdown")
      get_reporter()$add_message("- **int**: numerieke waarden (leeftijd, kinderen, etc.)", type="markdown")
      get_reporter()$add_message("- **chr**: categorische waarden (geslacht, buurt, etc.)", type="markdown")
      
      # Return the str output so it appears in the test result
      return(paste(str_output, collapse = "\n"))
    }, paste(capture.output(str(df_fear_of_crime_gent)), collapse = "\n"))
  })
}, preExec = {
  # Load the dataset in the student environment
  source("load_data.R", local = TRUE)
})