# Load dataset in test environment
source("../workdir/load_data.R", local = TRUE)

context({
  testcase("Dataset exploration with str()", {

    # ---- 1. Read student's code as plain text -----------------------------
    # Change "solution.R" to the actual filename Dodona/ottr runs
    student_code <- paste(readLines("solution.R"), collapse = "\n")

    # Look for the *exact* call: str(df_fear_of_crime_gent)
    pattern <- "str\\s*\\(\\s*df_fear_of_crime_gent\\s*\\)"
    used_correct_call <- grepl(pattern, student_code)

    # Optional: still ensure they used str() somewhere
    # (if you want to keep your existing helper)
    # testFunctionUsed("str")

    # ---- 2. If NOT correct: fail and STOP before any positive feedback ----
    if (!used_correct_call) {
      fail("Gebruik exact: `str(df_fear_of_crime_gent)` om de dataset te verkennen.")
      return(invisible(NULL))  # very important: no success feedback
    }

    # ---- 3. Only here: student used str(df_fear_of_crime_gent) correctly ---
    str_output <- capture.output(str(df_fear_of_crime_gent))

    get_reporter()$add_message(
      "✅ **Goed gedaan! Je hebt `str(df_fear_of_crime_gent)` gebruikt om de dataset te verkennen.**",
      type = "markdown"
    )
    get_reporter()$add_message(
      "**Resultaat van `str(df_fear_of_crime_gent)`:**",
      type = "markdown"
    )

    formatted_output <- paste(
      "```r",
      paste(str_output, collapse = "\n"),
      "```",
      sep = "\n"
    )
    get_reporter()$add_message(formatted_output, type = "markdown")

    # Extra interpretatie
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
