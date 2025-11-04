# Load dataset in test environment
source("../workdir/load_data.R", local = TRUE)

context({
  testcase('Dataset exploration with str()', {
    # Use testcaseAssert with conditional feedback
    testcaseAssert('str() function usage', function(studentEnv) {
      # Check if the student used str() function
      str_used <- tryCatch({
        # This will throw an error if str() was not used
        invisible(testFunctionUsed("str"))
        TRUE
      }, error = function(e) {
        FALSE
      })
      
      if (str_used) {
        # Only show feedback if str() was used
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
        
        return(TRUE)
      } else {
        # Only show error message if str() was not used
        get_reporter()$add_message("❌ **Je moet de str() functie gebruiken om de dataset te verkennen.**", type="markdown")
        get_reporter()$add_message("**Probeer:** `str(df_fear_of_crime_gent)`", type="markdown")
        return(FALSE)
      }
    })
  })
}, preExec = {
  # Load the dataset in the student environment
  source("load_data.R", local = TRUE)
})
