# Load dataset in test environment
source("../workdir/load_data.R", local = TRUE)

context({
  testcase("Dataset exploration with str()", {

    # OPTIONAL: still check that str() is used somewhere
    testFunctionUsed("str")

    # 1. Read the student's code as plain text
    #    In Dodona, the student code is typically in the working directory
    tryCatch({
      # Try to read the student's submitted code
      student_files <- list.files(pattern = "\\.R$", ignore.case = TRUE)
      if (length(student_files) > 0) {
        # Read the first R file found (usually the student's submission)
        student_code <- paste(readLines(student_files[1]), collapse = "\n")
      } else {
        # Fallback: check if there's a specific submission file
        student_code <- ""
      }
    }, error = function(e) {
      student_code <- ""
    })

    # 2. Check for the *exact* call: str(df_fear_of_crime_gent)
    pattern <- "str\\s*\\(\\s*df_fear_of_crime_gent\\s*\\)"
    used_correct_call <- grepl(pattern, student_code)

    # 3. If NOT correct: fail and STOP before any positive feedback
    if (!used_correct_call) {
      fail("Gebruik exact: `str(df_fear_of_crime_gent)` om de dataset te verkennen.")
      return(invisible(NULL))  # ⬅️ prevents the ✅ feedback from running
    }

    # 4. Only here: student used str(df_fear_of_crime_gent) correctly
    str_output <- capture.output(str(df_fear_of_crime_gent))

    get_reporter()$add_message(
      "✅ **Goed gedaan! Je hebt `str(df_fear_of_crime_gent)` gebruikt om de dataset te verkennen.**",
      type = "markdown"
    )
    get_reporter()$add_message(
      "**Resultaat van `str(df_fear_of_crime_gent)`:**",
      type = "markdown"
    )

    # Show the structure in a code block
    formatted_output <- paste(
      "```r",
      paste(str_output, collapse = "\n"),
      "```",
      sep = "\n"
    )
    get_reporter()$add_message(formatted_output, type = "markdown")

    # Add interpretation
    get_reporter()$add_message("**📊 Interpretatie:**", type = "markdown")
    get_reporter()$add_message("- **500 observaties** (respondenten uit Gent)", type = "markdown")
    get_reporter()$add_message("- **8 variabelen** met verschillende datatypes", type = "markdown")
    get_reporter()$add_message("- **int**: numerieke waarden (leeftijd, kinderen, etc.)", type = "markdown")
    get_reporter()$add_message("- **chr**: categorische waarden (geslacht, buurt, etc.)", type = "markdown")
  })
}, preExec = {
  # Load the dataset in the student environment
  source("load_data.R", local = TRUE)
})