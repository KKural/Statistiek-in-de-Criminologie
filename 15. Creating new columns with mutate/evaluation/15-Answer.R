context({
  testcase(" ", {
    testEqual(
      " ",
      function(env) {
        # Safe wrapper to catch any student-side syntax error
        tryCatch({
          env$gewijzigde_data
        }, error = function(e) {
          get_reporter()$add_message(
            "❌ Fout in je code: controleer of je mutate() correct gebruikt hebt en of je variabelen goed zijn aangemaakt.",
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
            "❌ 'gewijzigde_data' moet een data frame zijn.",
            type = "error"
          )
          return(FALSE)
        }
        if (!("dubbele_waarde" %in% colnames(got))) {
          get_reporter()$add_message(
            "❌ 'gewijzigde_data' moet een kolom 'dubbele_waarde' bevatten.",
            type = "error"
          )
          return(FALSE)
        }
        if (!all(got$dubbele_waarde == got$waarde * 2)) {
          get_reporter()$add_message(
            "❌ De kolom 'dubbele_waarde' moet gelijk zijn aan 'waarde * 2' voor elke rij.",
            type = "error"
          )
          return(FALSE)
        }
        get_reporter()$add_message(
          "✅ Correct! De nieuwe kolom is correct aangemaakt in 'gewijzigde_data'.",
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
