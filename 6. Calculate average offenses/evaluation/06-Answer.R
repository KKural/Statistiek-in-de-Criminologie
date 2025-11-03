context({
  testcase(" ", {
    testEqual(
      " ",
      function(env) env$mean,
      mean(c(42, 47, 53, 58, 61, 65, 72, 68, 59, 54, 48, 45)),
      comparator = function(got, want, ...) {
        if (is.null(got)) {
          get_reporter()$add_message(
            "❌ De variabele voor het gemiddelde is niet gedefinieerd. Gebruik mean <- mean(maandelijkse_feiten).",
            type = "error"
          )
          return(FALSE)
        }
        if (!is.numeric(got)) {
          get_reporter()$add_message(
            "❌ Je antwoord is geen numerieke waarde. Gebruik mean <- mean(maandelijkse_feiten).",
            type = "error"
          )
          return(FALSE)
        }
        if (abs(got - want) > 1e-6) {
          get_reporter()$add_message(
            paste0(
              "❌ Je antwoord is niet het juiste gemiddelde. ",
              "Gebruik mean <- mean(maandelijkse_feiten). ",
              "Het juiste gemiddelde is: ", round(want, 2)
            ),
            type = "error"
          )
          return(FALSE)
        }
        get_reporter()$add_message(
          paste0("✅ Correct! Het gemiddelde is: ", round(want, 2)),
          type = "success"
        )
        return(TRUE)
      }
    )
  })
}, preExec = {
  maandelijkse_feiten <- c(42, 47, 53, 58, 61, 65, 72, 68, 59, 54, 48, 45)
})
