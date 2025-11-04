# Load dataset in test environment (for the test code itself)
source("../workdir/load_data.R", local = TRUE)

context({
  testcase("Dataset exploration with str()", {

    # --- Read flags from the student environment ---------------------------
    used_any <- exists(".used_str_any", envir = .GlobalEnv, inherits = FALSE) &&
      isTRUE(get(".used_str_any", envir = .GlobalEnv))

    used_correct <- exists(".used_str_correctly", envir = .GlobalEnv, inherits = FALSE) &&
      isTRUE(get(".used_str_correctly", envir = .GlobalEnv))

    first_expr <- if (exists(".first_str_expr", envir = .GlobalEnv, inherits = FALSE)) {
      get(".first_str_expr", envir = .GlobalEnv)
    } else {
      NULL
    }

    # --- 1. Handle wrong / incomplete answers ------------------------------
    if (!used_correct) {

      if (used_any) {
        # Student did use str(), but not with the correct argument
        msg <- "Je hebt `str()` gebruikt, maar niet exact met `df_fear_of_crime_gent` als argument.\n\n"

        if (!is.null(first_expr)) {
          msg <- paste0(
            msg,
            "We zagen bijvoorbeeld een oproep zoals:\n\n",
            "```r\nstr(", first_expr, ")\n```\n\n"
          )
        }

        msg <- paste0(
          msg,
          "Gebruik **exact** deze code om de dataset te verkennen:\n\n",
          "```r\nstr(df_fear_of_crime_gent)\n```\n",
          "Vermijd varianten zoals alleen `str()`, alleen `df_fear_of_crime_gent`, ",
          "`str <- df_fear_of_crime_gent` of `str((df_fear_of_crime_gent))`."
        )

        fail(msg)
        return(invisible(NULL))

      } else {
        # Student never used str()
        msg <- paste0(
          "We hebben geen correcte oproep van `str()` gevonden.\n\n",
          "Misschien heb je bijvoorbeeld alleen `df_fear_of_crime_gent` uitgevoerd, ",
          "`str <- df_fear_of_crime_gent` geschreven of een andere vorm gebruikt.\n\n",
          "De bedoeling is dat je de structuur van de dataset bekijkt met **exact**:\n\n",
          "```r\nstr(df_fear_of_crime_gent)\n```"
        )

        fail(msg)
        return(invisible(NULL))
      }
    }

    # --- 2. Correct answer: full positive feedback -------------------------
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

  # ---- Instrument str() in the student environment -----------------------
  assign(".used_str_any", FALSE, envir = .GlobalEnv)
  assign(".used_str_correctly", FALSE, envir = .GlobalEnv)
  assign(".first_str_expr", NULL, envir = .GlobalEnv)

  orig_str <- utils::str

  str_wrapper <- function(object, ...) {
    expr <- substitute(object)

    # Mark that str() was used at least once
    assign(".used_str_any", TRUE, envir = .GlobalEnv)

    # Store the first expression we saw, for feedback
    first <- get(".first_str_expr", envir = .GlobalEnv)
    if (is.null(first)) {
      assign(".first_str_expr", paste(deparse(expr), collapse = " "),
             envir = .GlobalEnv)
    }

    # Check for exact str(df_fear_of_crime_gent)
    if (identical(expr, quote(df_fear_of_crime_gent))) {
      assign(".used_str_correctly", TRUE, envir = .GlobalEnv)
    }

    # Call the real str(), but **swallow errors** so tests can still run
    tryCatch(
      {
        orig_str(object, ...)
      },
      error = function(e) {
        # Don't break the grading; just return silently
        invisible(NULL)
      }
    )
  }

  # Mask str() in the student's global environment
  assign("str", str_wrapper, envir = .GlobalEnv)
})
