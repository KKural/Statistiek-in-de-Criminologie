context({
  testcase(" ", {
    testEqual(
      " ",
      function(env) {
        # Safe wrapper to catch any student-side syntax error
        tryCatch({
          env$gefilterde_data
        }, error = function(e) {
          get_reporter()$add_message(
            "❌ Fout in je code: controleer of je filter() correct gebruikt hebt en of je variabelen goed zijn aangemaakt.",
            type = "error"
          )
          return(NULL)
        })
      },
      NULL,
      comparator = function(got, want) {
        if (is.null(got)) {
          return(FALSE)
        }
        if (!is.data.frame(got)) {
          get_reporter()$add_message(
            "❌ 'gefilterde_data' moet een data frame zijn.",
            type = "error"
          )
          return(FALSE)
        }
        if (!all(got$delicttype == "Diefstal")) {
          get_reporter()$add_message(
            "❌ 'gefilterde_data' mag alleen rijen met delicttype 'Diefstal' bevatten.",
            type = "error"
          )
          return(FALSE)
        }
        get_reporter()$add_message(
          "✅ Correct! De data is correct gefilterd op delicttype 'Diefstal' en opgeslagen in 'gefilterde_data'.",
          type = "success"
        )
        return(TRUE)
      }
    )
  })
}, preExec = {
  # Zet de misdaad_data data frame op
  misdaad_data <- data.frame(
    id = 1:10,
    delicttype = c("Diefstal", "Aanval", "Diefstal", "Inbraak", "Diefstal", "Vandalisme", "Diefstal", "Fraude", "Diefstal", "Aanval"),
    waarde = c(100, 200, 150, 300, 120, 80, 90, 60, 110, 50)
  )
})

# Modeloplossing:
# gefilterde_data <- dplyr::filter(misdaad_data, delicttype == "Diefstal")
