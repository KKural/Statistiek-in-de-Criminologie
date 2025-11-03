context({
  testcase(" ", {
    testEqual(
      " ",
      function(env) {
        # Safe wrapper to catch any student-side syntax error
        tryCatch({
          # Check if the variable exists
          if (!exists("criminaliteitscijfers", envir = env)) {
            get_reporter()$add_message(
              "❌ De variabele 'criminaliteitscijfers' is niet gevonden. Zorg dat je deze variabele aanmaakt met de juiste berekening.",
              type = "error"
            )
            get_reporter()$add_message(
              "💡 Gebruik de formule: (misdrijf_aantallen / bevolking) * 1000",
              type = "info"
            )
            return(NULL)
          }
          
          # Return the variable if it exists
          env$criminaliteitscijfers
        }, error = function(e) {
          get_reporter()$add_message(
            "❌ Fout in je code: controleer of je berekening correct is en of je variabelen goed zijn aangemaakt.",
            type = "error"
          )
          get_reporter()$add_message(
            paste("Foutmelding:", e$message),
            type = "info"
          )
          return(NULL)
        })
      },
      NULL,
      comparator = function(got, want) {
        # If the value is NULL, the check in the test function already provided feedback
        if (is.null(got)) {
          return(FALSE)
        }
        
        # Check if it's numeric
        if (!is.numeric(got)) {
          get_reporter()$add_message(
            "❌ 'criminaliteitscijfers' moet een numerieke vector zijn met cijfers per 1.000.",
            type = "error"
          )
          get_reporter()$add_message(
            "💡 Gebruik de formule: (misdrijf_aantallen / bevolking) * 1000",
            type = "info"
          )
          return(FALSE)
        }
        
        # Check if the length matches
        verwacht <- (c(143, 265, 97, 418, 204) / c(25640, 41250, 13760, 58200, 31890)) * 1000
        if (length(got) != length(verwacht)) {
          get_reporter()$add_message(
            paste0("❌ 'criminaliteitscijfers' heeft een verkeerde lengte. Verwacht: ", length(verwacht), ", gekregen: ", length(got)),
            type = "error"
          )
          get_reporter()$add_message(
            "💡 Zorg dat je de berekening toepast op alle waarden in de vectoren misdrijf_aantallen en bevolking.",
            type = "info"
          )
          return(FALSE)
        }
        
        # Check actual values
        if (any(abs(got - verwacht) > 1e-6)) {
          get_reporter()$add_message(
            "❌ 'criminaliteitscijfers' bevat niet de juiste waarden per 1.000 inwoners.",
            type = "error"
          )
          get_reporter()$add_message(
            paste("Verwachte waarden:", paste(round(verwacht, 2), collapse=", ")),
            type = "info"
          )
          get_reporter()$add_message(
            paste("Jouw waarden:", paste(round(got, 2), collapse=", ")),
            type = "info"
          )
          get_reporter()$add_message(
            "💡 Gebruik de formule: (misdrijf_aantallen / bevolking) * 1000",
            type = "info"
          )
          
          # Show the formula results step by step for educational purposes
          get_reporter()$add_message(
            "## Uitleg van de berekening:",
            type = "markdown"
          )
          get_reporter()$add_message(paste(
            "1. misdrijf_aantallen = c(", paste(c(143, 265, 97, 418, 204), collapse=", "), ")",
            "2. bevolking = c(", paste(c(25640, 41250, 13760, 58200, 31890), collapse=", "), ")",
            "3. Deel elk misdrijf door de bijbehorende bevolking",
            "4. Vermenigvuldig elk resultaat met 1000",
            sep = "\n"
          ), type = "info")
          
          return(FALSE)
        }
        
        # Everything is correct
        get_reporter()$add_message(
          "✅ Correct! De criminaliteitscijfers zijn correct berekend en opgeslagen in 'criminaliteitscijfers'.",
          type = "success"
        )
        get_reporter()$add_message(
          "Je hebt de formule (misdrijf_aantallen / bevolking) * 1000 correct toegepast voor alle districten.",
          type = "info"
        )
        
        # Display the calculated values
        get_reporter()$add_message(
          "## Resultaat:",
          type = "markdown"
        )
        get_reporter()$add_message(
          paste("Criminaliteitscijfers per 1.000 inwoners:", paste(round(got, 2), collapse=", ")),
          type = "info"
        )
        
        return(TRUE)
      }
    )
  })
}, preExec = {
  # Zet de data op
  misdrijf_aantallen <- c(143, 265, 97, 418, 204)
  bevolking <- c(25640, 41250, 13760, 58200, 31890)
  
  # Make the data available in all necessary environments
  assign("misdrijf_aantallen", misdrijf_aantallen, envir = globalenv())
  assign("bevolking", bevolking, envir = globalenv())
  
  # Also make it available in the local environment
  assign("misdrijf_aantallen", misdrijf_aantallen, envir = environment())
  assign("bevolking", bevolking, envir = environment())
  
  # Make sure it's available for the test environment
  tryCatch({
    if (exists("test_env")) {
      if (exists("clean_env", envir = test_env)) {
        assign("misdrijf_aantallen", misdrijf_aantallen, envir = test_env$clean_env)
        assign("bevolking", bevolking, envir = test_env$clean_env)
      }
    }
  }, error = function(e) {
    # Just ignore any errors here
  })
})

# Modeloplossing (commented out - moet niet worden uitgevoerd):
# criminaliteitscijfers <- (misdrijf_aantallen / bevolking) * 1000