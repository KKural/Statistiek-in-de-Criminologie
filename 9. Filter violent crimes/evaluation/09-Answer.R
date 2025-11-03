# bloom_level: Apply
# scaffolding_level: Full support
# primm_phase: Run

# Geen data setup hier nodig - deze wordt in preExec gedefinieerd

#–– Evaluation ––
context({
  testcase(" ", {
    # First, calculate the expected output
    expected_df <- subset(misdaad_data, delict %in% c("Aanval", "Overval", "Moord"))
    
    # Show what the filtered dataframe should look like
    get_reporter()$add_message(
      "## Geweldsdelicten filteren",
      type = "markdown"
    )
    get_reporter()$add_message(
      paste0("Je opdracht is om een dataframe `geweldsdelicten_df` te maken met alleen de geweldsdelicten. ",
             "Dit zal een dataframe zijn met ", nrow(expected_df), " rijen en ", ncol(expected_df), " kolommen."),
      type = "info"
    )
    
    # Explain what violent crimes we're looking for
    get_reporter()$add_message(
      "## Geweldsdelicten:",
      type = "markdown"
    )
    get_reporter()$add_message(paste(
      "- Aanval",
      "- Overval",
      "- Moord",
      sep = "\n"
    ), type = "markdown")
    
    # Perform the actual test
    testEqual(
      "Filter geweldsdelicten met subset()",
      function(env) {
        result <- tryCatch({
          # Check if variable exists
          if (!exists('geweldsdelicten_df', envir = env)) {
            return("no_var")
          }
          
          # Get student's dataframe
          df <- get("geweldsdelicten_df", envir = env)
          
          # Check if it's a dataframe
          if (!is.data.frame(df)) {
            return("not_df")
          }
          
          # Check if it contains the correct rows
          # Make sure we use the student's misdaad_data in case they modified it
          student_misdaad_data <- if (exists("misdaad_data", envir = env)) 
                                   get("misdaad_data", envir = env) else misdaad_data
          
          expected <- subset(student_misdaad_data, delict %in% c("Aanval", "Overval", "Moord"))
          
          # More flexible comparison to handle case sensitivity and order
          if (!identical(df, expected)) {
            # Check if the dataframe has the correct number of rows and the right content
            if (nrow(df) == nrow(expected)) {
              # Check if it contains the correct crime types (case insensitive)
              crimes_in_df <- tolower(as.character(df$delict))
              expected_crimes <- tolower(c("Aanval", "Overval", "Moord"))
              
              # Sort both for comparison
              crimes_in_df <- sort(crimes_in_df)
              expected_crimes <- sort(expected_crimes)
              
              # Check if all expected crimes are in the dataframe
              if (all(expected_crimes %in% crimes_in_df) && all(crimes_in_df %in% expected_crimes)) {
                return("correct")
              }
            }
            return("wrong_val")
          }
          
          # Everything is correct
          return("correct")
        }, error = function(e) {
          # More specific error feedback
          if (grepl("object .* not found", e$message)) {
            return("no_var")
          } else {
            # Log the error for diagnostic purposes
            get_reporter()$add_message(paste("Error:", e$message), type = "debug")
            return("no_var")
          }
        })
        
        return(result)
      },
      "correct",
      comparator = function(generated, expected, ...) {
        feedbacks <- list(
          "no_var"   = "❌ De data frame `geweldsdelicten_df` bestaat niet of bevat een fout. Controleer je code en probeer opnieuw.",
          "not_df"   = "❌ `geweldsdelicten_df` moet een data frame zijn met alleen gewelddadige misdrijven (Aanval, Overval, Moord).",
          "wrong_val"= "❌ De inhoud van `geweldsdelicten_df` is niet correct. Je moet alle gewelddadige misdrijven selecteren met de %in% operator.",
          "correct"  = "✅ Correct! Je hebt de data frame correct gefilterd en alle geweldsdelicten geselecteerd."
        )
        
        # Create the expected dataframe for showing - use the global dataset
        # Don't try to access the environment here as it's not accessible in the comparator
        expected_df <- subset(misdaad_data, delict %in% c("Aanval", "Overval", "Moord"))
        
        # Main feedback message
        feedback_message <- feedbacks[[generated]]
        if (is.null(feedback_message)) {
          feedback_message <- paste("Unexpected error: generated =", generated)
        }
        get_reporter()$add_message(feedback_message, type = ifelse(generated == "correct", "success", "error"))
        
        # If wrong, show example of correct code
        if (generated != "correct") {
          get_reporter()$add_message(
            "## Voorbeeld van de juiste code:",
            type = "markdown"
          )
          get_reporter()$add_message(
            "```r\ngeweldsdelicten_df <- subset(misdaad_data, delict %in% c(\"Aanval\", \"Overval\", \"Moord\"))\n```",
            type = "code"
          )
          
          # Show what the correct dataframe would contain
          get_reporter()$add_message(
            "## Verwachte inhoud van geweldsdelicten_df:",
            type = "markdown"
          )
          get_reporter()$add_message(
            paste(utils::capture.output(print(expected_df)), collapse = "\n"),
            type = "code"
          )
        } else {
          # Show success message with extra details
          get_reporter()$add_message(
            "Je hebt correct de subset() functie gebruikt om de geweldsdelicten te filteren.",
            type = "info"
          )
          
          # Show the correct dataframe
          get_reporter()$add_message(
            "## Inhoud van je gefilterde dataframe:",
            type = "markdown"
          )
          get_reporter()$add_message(
            paste(utils::capture.output(print(expected_df)), collapse = "\n"),
            type = "code"
          )
        }
        generated == expected
      }
    )
  })
}, preExec = {
  # Pre‐execution: make the data frame available to both student code & tests
  misdaad_data <- data.frame(
    id = 1:20,
    delict = c("Diefstal", "Aanval", "Drugsdelict", "Overval", "Vandalisme", 
                "Aanval", "Inbraak", "Moord", "Diefstal", "Aanval",
                "Fraude", "Overval", "Diefstal", "Drugsdelict", "Moord",
                "Aanval", "Vandalisme", "Fraude", "Inbraak", "Diefstal"),
    district = c("Noord", "Zuid", "Oost", "Centrum", "West",
                 "Zuid", "Noord", "Centrum", "Oost", "West",
                 "Noord", "Zuid", "West", "Oost", "Zuid",
                 "Centrum", "Noord", "Oost", "West", "Zuid"),
    datum = as.Date("2023-01-01") + 0:19
  )
  
  # Make the data available in all environments
  assign("misdaad_data", misdaad_data, envir = globalenv())
  
  # Also make it available in the local environment
  assign("misdaad_data", misdaad_data, envir = environment())
  
  # And in the parent environment
  parent_env <- parent.env(environment())
  assign("misdaad_data", misdaad_data, envir = parent_env)
  
  # Make sure it's available for the test environment
  tryCatch({
    if (exists("test_env")) {
      if (exists("clean_env", envir = test_env)) {
        assign("misdaad_data", misdaad_data, envir = test_env$clean_env)
      }
    }
  }, error = function(e) {
    # Just ignore any errors here
  })
})

# Modeloplossing:
geweldsdelicten_df <- subset(misdaad_data, delict %in% c("Aanval", "Overval", "Moord"))