# Load dataset in test environment (for the test code itself)
source("../workdir/load_data.R", local = TRUE)

context({
  testcase("Dataset exploration with str()", {

    # Check if the student has called str(df_fear_of_crime_gent)
    used_correct_call <- exists(".used_str_correctly", envir = .GlobalEnv) &&
                         isTRUE(get(".used_str_correctly", envir = .GlobalEnv))

    # If NOT correct: fail and STOP before any positive feedback
    if (!used_correct_call) {
      fail("Gebruik exact: `str(df_fear_of_crime_gent)` om de dataset te verkennen.")
      return(invisible(NULL))  # prevents the ✅ feedback from running
    }

    # Only here: student used str(df_fear_of_crime_gent) correctly
    str_output <- capture.output(utils::str(df_fear_of_crime_gent))

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

  # ---- Instrument str() in the student environment --------------------
  # Flag in the global env: did the student call str(df_fear_of_crime_gent)?
  assign(".used_str_correctly", FALSE, envir = .GlobalEnv)

  # Save original utils::str
  orig_str <- utils::str

  # Wrapper that records the exact call and then delegates to utils::str
  str_wrapper <- function(object, ...) {
    if (identical(substitute(object), quote(df_fear_of_crime_gent))) {
      assign(".used_str_correctly", TRUE, envir = .GlobalEnv)
    }
    orig_str(object, ...)
  }

  # Mask str() in the (student) global env
  assign("str", str_wrapper, envir = .GlobalEnv)
})