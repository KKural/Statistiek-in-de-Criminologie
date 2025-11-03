# bloom_level: Apply
# scaffolding_level: Full support
# primm_phase: Run

# Geen data setup hier nodig - deze wordt in preExec gedefinieerd

#–– Evaluation ––
context({
  testcase(" ", {
    # First, calculate the expected output
    expected_result <- chisq.test(data_matrix)
    
    # Show what the chi-square test should do
    get_reporter()$add_message(
      "## Chi-kwadraat Test Uitvoeren",
      type = "markdown"
    )
    get_reporter()$add_message(
      paste0("Je opdracht is om een chi-kwadraat test uit te voeren op de data matrix. ",
             "Dit zal een test object teruggeven met statistieken over de relatie tussen geslacht en misdrijftype."),
      type = "info"
    )
    
    # Show the data matrix structure
    get_reporter()$add_message(
      "## De data matrix:",
      type = "markdown"
    )
    get_reporter()$add_message(
      paste(utils::capture.output(print(data_matrix)), collapse = "\n"),
      type = "code"
    )
    
    # Perform the actual test
    testEqual(
      "Chi-kwadraat test uitvoeren",
      function(env) {
        result <- tryCatch({
          # Check if the function was called and returns correct result
          test_result <- env$chisq.test(data_matrix)
          
          # Check if it's the right type of object
          if (!inherits(test_result, "htest")) {
            return("not_htest")
          }
          
          # Check if the statistic is approximately correct
          if (abs(test_result$statistic - expected_result$statistic) > 0.001) {
            return("wrong_statistic")
          }
          
          # Check if p-value is approximately correct
          if (abs(test_result$p.value - expected_result$p.value) > 0.001) {
            return("wrong_pvalue")
          }
          
          return("correct")
        }, error = function(e) {
          if (grepl("could not find function", e$message)) {
            return("no_function")
          } else if (grepl("object .* not found", e$message)) {
            return("no_data")
          } else {
            get_reporter()$add_message(paste("Error:", e$message), type = "debug")
            return("error")
          }
        })
        
        return(result)
      },
      "correct",
      comparator = function(generated, expected, ...) {
        feedbacks <- list(
          "no_function" = "❌ De functie `chisq.test()` werd niet gevonden. Controleer je spelling.",
          "no_data"     = "❌ De data matrix `data_matrix` werd niet gevonden. Deze is al voor je gedefinieerd.",
          "not_htest"   = "❌ Het resultaat is geen geldige statistische test. Gebruik `chisq.test(data_matrix)`.",
          "wrong_statistic" = "❌ De chi-kwadraat statistiek is niet correct. Controleer je data matrix.",
          "wrong_pvalue" = "❌ De p-waarde is niet correct. Controleer je test.",
          "correct"     = "✅ Correct! Je hebt de chi-kwadraat test succesvol uitgevoerd."
        )
        
        # Main feedback message
        feedback_message <- feedbacks[[generated]]
        if (is.null(feedback_message)) {
          feedback_message <- paste("Onverwachte fout: generated =", generated)
        }
        get_reporter()$add_message(feedback_message, type = ifelse(generated == "correct", "success", "error"))
        
        # If wrong, show example of correct code
        if (generated != "correct") {
          get_reporter()$add_message(
            "## Voorbeeld van de juiste code:",
            type = "markdown"
          )
          get_reporter()$add_message(
            "```r\nchisq.test(data_matrix)\n```",
            type = "code"
          )
        } else {
          # Show success message with the actual results
          get_reporter()$add_message(
            "## Resultaten van je chi-kwadraat test:",
            type = "markdown"
          )
          get_reporter()$add_message(
            paste(utils::capture.output(print(expected_result)), collapse = "\n"),
            type = "code"
          )
          
          # Add interpretation
          significance <- if(expected_result$p.value < 0.05) "significant" else "niet significant"
          get_reporter()$add_message(
            paste0("## Interpretatie:\nDe p-waarde is ", round(expected_result$p.value, 4), 
                   ", wat ", significance, " is (α = 0.05). ",
                   if(expected_result$p.value < 0.05) 
                     "Er is een significant verband tussen geslacht en misdrijftype." 
                   else 
                     "Er is geen significant verband tussen geslacht en misdrijftype."),
            type = "info"
          )
        }
        generated == expected
      }
    )
  })
}, preExec = {
  # Pre-execution: make the data matrix available to both student code & tests
  data_matrix <- matrix(c(45, 25, 15, 35, 20, 40), 
                        nrow = 2, 
                        dimnames = list(
                          Geslacht = c("Man", "Vrouw"),
                          Misdrijf = c("Diefstal", "Geweld", "Fraude")
                        ))
  
  # Make the data available in all environments
  assign("data_matrix", data_matrix, envir = globalenv())
  assign("data_matrix", data_matrix, envir = environment())
  
  # And in the parent environment
  parent_env <- parent.env(environment())
  assign("data_matrix", data_matrix, envir = parent_env)
  
  # Make sure it's available for the test environment
  tryCatch({
    if (exists("test_env")) {
      if (exists("clean_env", envir = test_env)) {
        assign("data_matrix", data_matrix, envir = test_env$clean_env)
      }
    }
  }, error = function(e) {
    # Just ignore any errors here
  })
})

# Modeloplossing:
# chisq.test(data_matrix)