context({
  testcase(" ", {
    testEqual(
      " ",
      function(env) {
        # Get the student's answer
        tryCatch({
          env$boven_gemiddelde
        }, error = function(e) {
          get_reporter()$add_message(
            "❌ We kunnen de variabele 'boven_gemiddelde' niet vinden. Heb je deze wel aangemaakt?",
            type = "error"
          )
          return(NULL)
        })
      },
      NULL,
      comparator = function(got, want) {
        # Expected result
        verwacht <- c(5.58, 6.42, 7.05, 7.18, 6.39) > 6.2
        
        # Check if result exists
        if (is.null(got)) {
          get_reporter()$add_message(
            "❌ We verwachten dat je een variabele aanmaakt met de naam 'boven_gemiddelde'.",
            type = "error"
          )
          return(FALSE)
        }
        
        # Check if result is a logical vector
        if (!is.logical(got)) {
          get_reporter()$add_message(
            "❌ De variabele 'boven_gemiddelde' moet een logische vector zijn.",
            type = "error"
          )
          get_reporter()$add_message(
            "💡 Gebruik een vergelijkingsoperator zoals '>' om een logische vector te maken.",
            type = "info"
          )
          return(FALSE)
        }

        # Check if values match expected
        if (identical(got, verwacht)) {
          get_reporter()$add_message(
            "✅ Correct! Je hebt de juiste logische vector aangemaakt.",
            type = "success"
          )
          get_reporter()$add_message(
            "Dit geeft aan welke districten (TRUE) boven het nationale gemiddelde liggen en welke niet (FALSE).",
            type = "info"
          )
          return(TRUE)
        } else {
          get_reporter()$add_message(
            "❌ De waarden in je variabele zijn niet correct.",
            type = "error"
          )
          get_reporter()$add_message(
            "💡 Gebruik 'district_misdaadcijfers > nationaal_gemiddelde' om te controleren welke districten boven het gemiddelde liggen.",
            type = "info"
          )
          get_reporter()$add_message(
            paste("Verwachte logische vector:", paste(verwacht, collapse=", ")),
            type = "info"
          )
          get_reporter()$add_message(
            paste("Jouw logische vector:", paste(got, collapse=", ")),
            type = "info"
          )
          return(FALSE)
        }
      }
    )
  })
}, preExec = {
  # Zet de data op
  district_misdaadcijfers <- c(5.58, 6.42, 7.05, 7.18, 6.39)
  nationaal_gemiddelde <- 6.2
  
  # Make the data available in all necessary environments
  assign("district_misdaadcijfers", district_misdaadcijfers, envir = globalenv())
  assign("nationaal_gemiddelde", nationaal_gemiddelde, envir = globalenv())
  
  # Also make it available in the local environment
  assign("district_misdaadcijfers", district_misdaadcijfers, envir = environment())
  assign("nationaal_gemiddelde", nationaal_gemiddelde, envir = environment())
  
  # Make sure it's available for the test environment
  tryCatch({
    if (exists("test_env")) {
      if (exists("clean_env", envir = test_env)) {
        assign("district_misdaadcijfers", district_misdaadcijfers, envir = test_env$clean_env)
        assign("nationaal_gemiddelde", nationaal_gemiddelde, envir = test_env$clean_env)
      }
    }
  }, error = function(e) {
    # Just ignore any errors here
  })
})

# Modeloplossing (commented out):
# boven_gemiddelde <- district_misdaadcijfers > nationaal_gemiddelde