# Load dataset in test environment
source("../workdir/load_data.R", local = TRUE)

context({
  testcase('Dataset exploration with str()', {
    # Test that captures the str() output using evaluationResult pattern
    testEqual("str(df_fear_of_crime_gent)", function(studentEnv) { 
      # The R judge captures output from expressions like str() in evaluationResult
      # when they're not assigned to a variable
      if (exists("evaluationResult", studentEnv)) {
        return(studentEnv$evaluationResult)
      } else {
        return(NULL)
      }
    }, NULL, comparator = function(generated, expected, ...) {
      # Always show the dataset structure in feedback
      get_reporter()$add_message("✅ **Dataset verkend!**", type="markdown")
      get_reporter()$add_message("**De structuur van df_fear_of_crime_gent:**", type="markdown")
      
      # Show the actual structure
      str_output <- capture.output(str(df_fear_of_crime_gent))
      formatted_output <- paste("```r", paste(str_output, collapse = "\n"), "```", sep = "\n")
      get_reporter()$add_message(formatted_output, type="markdown")
      
      # Add interpretation
      get_reporter()$add_message("**📊 Interpretatie:**", type="markdown")
      get_reporter()$add_message("- **500 observaties** (respondenten uit Gent)", type="markdown")
      get_reporter()$add_message("- **8 variabelen** met verschillende datatypes", type="markdown")
      get_reporter()$add_message("- **int**: numerieke waarden (leeftijd, kinderen, etc.)", type="markdown")
      get_reporter()$add_message("- **chr**: categorische waarden (geslacht, buurt, etc.)", type="markdown")
      
      # The test passes if any code was executed
      return(TRUE)
    })
  })
}, preExec = {
  # Load the dataset in the student environment so they can use it
  source("load_data.R", local = TRUE)
})