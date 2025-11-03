context({
  testcase(" ", {
    testEqual(
      " ",
      function(env) {
        # Safe wrapper to catch any student-side syntax error
        tryCatch({
          env$geselecteerde_data
        }, error = function(e) {
          # Manual feedback when syntax fails
          get_reporter()$add_message(
            "❌ Fout in je code: controleer of je `select()` correct gebruikt hebt en of je `library(dplyr)` hebt toegevoegd.",
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
          get_reporter()$add_message("❌ 'geselecteerde_data' moet een data frame zijn.", type = "error")
          return(FALSE)
        }

        if (!identical(colnames(got), c("id", "delicttype"))) {
          get_reporter()$add_message("❌ Verkeerde kolommen: verwacht 'id' en 'delicttype'.", type = "error")
          return(FALSE)
        }

        get_reporter()$add_message("✅ Goed gedaan! Je hebt de juiste kolommen geselecteerd met `select()`.", type = "success")
        return(TRUE)
      }
    )
  })
}, preExec = {
  misdaad_data <- data.frame(
    id = 1:10,
    delicttype = c("Diefstal", "Aanval", "Diefstal", "Inbraak", "Diefstal", "Vandalisme", "Diefstal", "Fraude", "Diefstal", "Aanval"),
    waarde = c(100, 200, 150, 300, 120, 80, 90, 60, 110, 50)
  )
})
