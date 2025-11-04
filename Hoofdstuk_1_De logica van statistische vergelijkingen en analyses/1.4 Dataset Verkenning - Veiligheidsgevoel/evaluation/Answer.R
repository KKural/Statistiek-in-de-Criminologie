# Load dataset in test environment
source("../workdir/load_data.R", local = TRUE)

context({
  testcase('Dataset exploration with str()', {
    # Use testFunctionUsed to check if str() was called
    testFunctionUsed("str")
  })
  
  testcase('Display dataset structure', {
    # Always show the dataset structure as feedback
    testEqual("Dataset structure", function(studentEnv) { 
      # Show the dataset structure in feedback
      str_output <- capture.output(str(df_fear_of_crime_gent))
      
      get_reporter()$add_message("✅ **Goed gedaan! Je hebt str() gebruikt om de dataset te verkennen.**", type="markdown")
      get_reporter()$add_message("**Resultaat van str(df_fear_of_crime_gent):**", type="markdown")
      
      # Show the structure in a code block
      formatted_output <- paste("```r", paste(str_output, collapse = "\n"), "```", sep = "\n")
      get_reporter()$add_message(formatted_output, type="markdown")
      
      # Add interpretation
      get_reporter()$add_message("**📊 Interpretatie:**", type="markdown")
      get_reporter()$add_message("- **500 observaties** (respondenten uit Gent)", type="markdown")
      get_reporter()$add_message("- **8 variabelen** met verschillende datatypes", type="markdown")
      get_reporter()$add_message("- **int**: numerieke waarden (leeftijd, kinderen, etc.)", type="markdown")
      get_reporter()$add_message("- **chr**: categorische waarden (geslacht, buurt, etc.)", type="markdown")
      
      # Return TRUE to pass the test
      return(TRUE)
    }, TRUE)
  })
}, preExec = {
  # Load the dataset in the student environment
  source("load_data.R", local = TRUE)
})