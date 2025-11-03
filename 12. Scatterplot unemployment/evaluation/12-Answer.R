# bloom_level: Apply
# scaffolding_level: Full support
# primm_phase: Run

contextWithImage({
  testcase(" ", {
    testEqual(
      " ",
      function(env) {
        # Get the raw student code to analyze
        student_code <- paste(deparse(test_env$parsed_code), collapse = "\n")
        
        # Check if plot function is used at all
        if (!grepl("plot\\s*\\(", student_code, perl = TRUE)) {
          get_reporter()$add_message(
            "❌ Gebruik de plot() functie om een spreidingsdiagram te maken.",
            type = "error"
          )
          return(FALSE)
        }
        
        # Check for both variables in the code (making the check case-insensitive)
        if (!grepl("werkloosheid", student_code, ignore.case = TRUE)) {
          get_reporter()$add_message(
            "❌ De variabele 'werkloosheid' wordt niet gebruikt in je plot.",
            type = "error"
          )
          return(FALSE)
        }
        
        if (!grepl("criminaliteitscijfers", student_code, ignore.case = TRUE)) {
          get_reporter()$add_message(
            "❌ De variabele 'criminaliteitscijfers' wordt niet gebruikt in je plot.",
            type = "error"
          )
          return(FALSE)
        }
        
        # More generous pattern matching to handle various ways to create the plot
        # This will match both simple plot() calls and those with extra parameters
        werkloosheid_first = grepl("plot\\s*\\([^,]*werkloosheid[^,]*,[^,]*criminaliteitscijfers", student_code, ignore.case = TRUE)
        criminaliteit_first = grepl("plot\\s*\\([^,]*criminaliteitscijfers[^,]*,[^,]*werkloosheid", student_code, ignore.case = TRUE)
        named_x_werkloosheid = grepl("plot\\s*\\(.*x\\s*=\\s*werkloosheid.*y\\s*=\\s*criminaliteitscijfers", student_code, ignore.case = TRUE)
        named_y_werkloosheid = grepl("plot\\s*\\(.*y\\s*=\\s*criminaliteitscijfers.*x\\s*=\\s*werkloosheid", student_code, ignore.case = TRUE)
        formula_usage = grepl("plot\\s*\\(.*criminaliteitscijfers\\s*~\\s*werkloosheid", student_code, ignore.case = TRUE)
        
        # Check if any of our plot patterns match
        if (werkloosheid_first || criminaliteit_first || named_x_werkloosheid || named_y_werkloosheid || formula_usage) {
          get_reporter()$add_message(
            "✅ Correct! Je hebt een goede plot() functie gebruikt om werkloosheid en criminaliteitscijfers te visualiseren.",
            type = "success"
          )
          
          # Check if the student added more advanced features
          has_title = grepl("main\\s*=|title\\s*=", student_code, ignore.case = TRUE)
          has_x_label = grepl("xlab\\s*=", student_code, ignore.case = TRUE)
          has_y_label = grepl("ylab\\s*=", student_code, ignore.case = TRUE)
          
          if (has_title || has_x_label || has_y_label) {
            get_reporter()$add_message(
              "👍 Goed werk! Je hebt extra elementen toegevoegd zoals titels of aslabels.",
              type = "success"
            )
          }
          
          return(TRUE)
        } else {
          # If we got here, there's a plot function but not with the right variables in the right way
          get_reporter()$add_message(
            "❌ Je gebruikt plot(), maar niet op de juiste manier om werkloosheid tegen criminaliteitscijfers te plotten.",
            type = "error"
          )
          get_reporter()$add_message(
            "💡 Gebruik: plot(werkloosheid, criminaliteitscijfers) of plot(x=werkloosheid, y=criminaliteitscijfers)",
            type = "info"
          )
          
          # Show the expected result
          get_reporter()$add_message(
            "Verwacht resultaat:",
            type = "info"
          )
          
          # Create and display the expected plot with improved margins to prevent overlapping labels
          # Set better margins to avoid overlapping text
          par(mar = c(5, 5, 4, 2) + 0.1)  # Bottom, left, top, right margins
          
          plot(werkloosheid, criminaliteitscijfers,
               main = "Verband tussen werkloosheid en criminaliteit",
               xlab = "Werkloosheidspercentage",
               ylab = "Criminaliteitscijfers per 1.000 inwoners",
               cex.lab = 0.9,  # Slightly smaller axis labels
               cex.axis = 0.9) # Slightly smaller axis text
          
          return(FALSE)
        }
      },
      TRUE
    )
  })
}, preExec = {
  # Define the variables for the scatter plot
  werkloosheid <- c(4.2, 5.7, 7.9, 6.5, 8.1, 5.3, 9.2, 7.1, 6.8, 5.9, 8.5, 7.4, 6.2, 9.0, 5.1)
  criminaliteitscijfers <- c(25.3, 28.6, 33.1, 29.7, 35.4, 26.8, 38.2, 31.5, 30.9, 29.3, 36.1, 32.7, 29.0, 37.8, 27.2)
  
  # Make the data available in all necessary environments
  assign("werkloosheid", werkloosheid, envir = globalenv())
  assign("criminaliteitscijfers", criminaliteitscijfers, envir = globalenv())
  
  # Also make it available in the local environment
  assign("werkloosheid", werkloosheid, envir = environment())
  assign("criminaliteitscijfers", criminaliteitscijfers, envir = environment())
  
  # Make sure it's available for the test environment
  tryCatch({
    if (exists("test_env")) {
      if (exists("clean_env", envir = test_env)) {
        assign("werkloosheid", werkloosheid, envir = test_env$clean_env)
        assign("criminaliteitscijfers", criminaliteitscijfers, envir = test_env$clean_env)
      }
    }
  }, error = function(e) {
    # Just ignore any errors here
  })
})

# Modeloplossing (commented out):
# # Set better margins to avoid overlapping text
# par(mar = c(5, 5, 4, 2) + 0.1) 
# plot(werkloosheid, criminaliteitscijfers,
#      main = "Verband tussen werkloosheid en criminaliteit", 
#      xlab = "Werkloosheidspercentage", 
#      ylab = "Criminaliteitscijfers per 1.000 inwoners",
#      cex.lab = 0.9,  # Slightly smaller axis labels
#      cex.axis = 0.9) # Slightly smaller axis text
