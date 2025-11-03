# bloom_level: Apply & Understand
# scaffolding_level: Medium support
# primm_phase: Predict

#–– Data setup ––
leeftijden_daders <- c(
  19, 23, 45, 32, 28, 21, 24, 19, 37, 42, 18, 25, 22, 31, 19, 
  27, 36, 29, 24, 33, 41, 26, 20, 38, 22, 19, 25, 29, 31, 34
)
# Make sure the data is available in the global environment
assign("leeftijden_daders", leeftijden_daders, envir = globalenv())

#–– Evaluation ––
context({
  testcase(" ", {
    # Calculate expected output
    expected <- summary(leeftijden_daders)
    
    # Display the expected summary to show in feedback
    get_reporter()$add_message(
      "## Verwachte output voor summary(leeftijden_daders):",
      type = "markdown"
    )
    summary_output <- capture.output(print(expected))
    get_reporter()$add_message(paste(summary_output, collapse = "\n"), type = "code")
    
    # Educational explanation about summary components
    get_reporter()$add_message(
      "## Uitleg over de summary componenten:",
      type = "markdown"
    )
    get_reporter()$add_message(paste(
      "- **Min**: Minimumwaarde - de jongste dader is 18 jaar",
      "- **1st Qu**: Eerste kwartiel - 25% van de daders is jonger dan 22 jaar",
      "- **Median**: Mediaan - de middelste leeftijd is 27 jaar",
      "- **Mean**: Gemiddelde - de gemiddelde leeftijd is ongeveer 28 jaar",
      "- **3rd Qu**: Derde kwartiel - 75% van de daders is jonger dan 33.5 jaar",
      "- **Max**: Maximumwaarde - de oudste dader is 45 jaar",
      sep = "\n"
    ), type = "markdown")
    
    # Perform the actual test
    testEqual(
      "Beschrijf de leeftijden met de summary() functie",
      function(studentEnv) {
        # Check if the variable exists in student environment
        if (!exists('leeftijd_samenvatting', envir=studentEnv)) {
          get_reporter()$add_message(
            '❌ Het object `leeftijd_samenvatting` bestaat niet. Maak het aan met `leeftijd_samenvatting <- summary(leeftijden_daders)`.',
            type='error'
          )
          # Instructional guidance
          get_reporter()$add_message(
            "Volg deze stappen om een samenvatting te maken:",
            type = "markdown"
          )
          get_reporter()$add_message(
            "1. Gebruik de `summary()` functie op de vector `leeftijden_daders`\n2. Wijs het resultaat toe aan `leeftijd_samenvatting`",
            type = "markdown"
          )
          # Example code
          get_reporter()$add_message(
            "```r\nleeftijd_samenvatting <- summary(leeftijden_daders)\n```",
            type = "code"
          )
          return(NA)
        }
        # Return the student's value for comparison
        return(studentEnv$leeftijd_samenvatting)
      },
      expected,
      # Custom comparator to provide detailed feedback
      comparator = function(got, want, ...) {
        # Check if the student's answer is NA (indicating the variable doesn't exist)
        if(all(is.na(got))) {
          return(FALSE)
        }
        
        # Check if the type is correct
        if(!is.numeric(got) || is.null(names(got))) {
          get_reporter()$add_message(
            '❌ `leeftijd_samenvatting` moet een samenvatting zijn zoals gegeven door summary(leeftijden_daders).',
            type='error'
          )
          
          # Show student's wrong result
          get_reporter()$add_message(
            "Jouw resultaat heeft het verkeerde type:",
            type = "markdown"
          )
          student_class <- paste(class(got), collapse=", ")
          get_reporter()$add_message(
            paste0("```r\nclass: ", student_class, "\n```"),
            type = "markdown"
          )
          
          return(FALSE)
        }
        
        # Check if the values are identical
        if(!identical(got, want)) {
          get_reporter()$add_message(
            '❌ De inhoud van `leeftijd_samenvatting` is niet correct. Gebruik summary(leeftijden_daders).',
            type='error'
          )
          
          # Show both for comparison
          get_reporter()$add_message(
            "Jouw resultaat:",
            type = "markdown"
          )
          student_output <- capture.output(print(got))
          get_reporter()$add_message(
            paste0('```r\n', paste(student_output, collapse='\n'), '\n```'),
            type = "code"
          )
          
          get_reporter()$add_message(
            "Verwachte resultaat:",
            type = "markdown"
          )
          expected_output <- capture.output(print(want))
          get_reporter()$add_message(
            paste0('```r\n', paste(expected_output, collapse='\n'), '\n```'),
            type = "code"
          )
          
          return(FALSE)
        }
        
        # Success message
        get_reporter()$add_message(
          "✅ Goed gedaan! Je hebt `leeftijd_samenvatting` correct aangemaakt met de `summary()` functie.",
          type = "success"
        )
        
        # Explanation of what summary does
        get_reporter()$add_message(
          "De `summary()` functie geeft een statistisch overzicht van numerieke data.",
          type = "info"
        )
        
        return(TRUE)
      }
    )
  })
}, preExec = {
  # Pre‐execution: make the vector available to the student code
  leeftijden_daders <- c(
    19, 23, 45, 32, 28, 21, 24, 19, 37, 42, 18, 25, 22, 31, 19, 
    27, 36, 29, 24, 33, 41, 26, 20, 38, 22, 19, 25, 29, 31, 34
  )
})

# Modeloplossing (dit is de correcte oplossing):
# leeftijd_samenvatting <- summary(leeftijden_daders)
