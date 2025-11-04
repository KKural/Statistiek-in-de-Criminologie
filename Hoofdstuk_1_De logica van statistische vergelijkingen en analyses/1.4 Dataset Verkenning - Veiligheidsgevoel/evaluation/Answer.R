# Load dataset in test environment
source("../workdir/load_data.R", local = TRUE)

context({
  testcase('Dataset exploration with str()', {
    # Use testcaseAssert for complete control over when feedback is shown
    testcaseAssert('str() function usage', function(studentEnv) {
      # Check if str() function was used by examining the student's code
      # This approach gives us full control over success/failure and feedback
      
      # Try to detect if str() was used (this is a simplified check)
      # In a real implementation, this would examine the AST
      str_was_used <- TRUE  # We'll assume it was used and validate differently
      
      # Try the actual function check
      tryCatch({
        # If this succeeds, str() was used
        testFunctionUsed("str")
        
        # Only if we get here (no error), show the detailed feedback
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
        
        return(TRUE)  # Test passes
        
      }, error = function(e) {
        # If testFunctionUsed fails, show only error message
        get_reporter()$add_message("❌ **Je moet de str() functie gebruiken om de dataset te verkennen.**", type="markdown")
        get_reporter()$add_message("**Probeer:** `str(df_fear_of_crime_gent)`", type="markdown")
        return(FALSE)  # Test fails
      })
    })
  })
}, preExec = {
  # Load the dataset in the student environment
  source("load_data.R", local = TRUE)
})