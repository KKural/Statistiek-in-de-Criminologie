# Load dataset in test environment
source("../workdir/load_data.R", local = TRUE)

context({
  testcase("Dataset exploration with str()", {

    # --- Instrument str() to detect the exact required call ------------------
    base_str <- get("str", baseenv())
    .used_str_correctly <- FALSE

    # Mask str() in the global env so student's call hits this wrapper
    assign("str",
      function(object, ...) {
        # Detect EXACT call str(df_fear_of_crime_gent)
        if (identical(substitute(object), quote(df_fear_of_crime_gent))) {
          .used_str_correctly <<- TRUE
        }
        base_str(object, ...) # still show structure for them as usual
      },
      envir = .GlobalEnv
    )
    # -------------------------------------------------------------------------

    # Execute student's code (your platform may auto-run it; if not, source it)
    # source("solution.R", local = TRUE)

    # Now evaluate based on the flag
    expect_true(
      .used_str_correctly,
      info = "Gebruik exact: str(df_fear_of_crime_gent)"
    )

    # Only if correct: produce the rich feedback
    str_output <- capture.output(base::str(df_fear_of_crime_gent))

    get_reporter()$add_message("✅ **Goed gedaan! Je hebt `str(df_fear_of_crime_gent)` gebruikt.**", type = "markdown")
    get_reporter()$add_message("**Resultaat van `str(df_fear_of_crime_gent)`:**", type = "markdown")

    formatted_output <- paste(
      "```r",
      paste(str_output, collapse = "\n"),
      "```",
      sep = "\n"
    )
    get_reporter()$add_message(formatted_output, type = "markdown")

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
