# bloom_level: Remember & Understand
# scaffolding_level: Full support
# primm_phase: Run

context({
  testcase(" ", {
    testEqual(
      " ",
      function(env) {
        # Robustly check if 'inbraken' exists
        if (!exists("inbraken", envir = env)) {
          get_reporter()$add_message(
            "❌ De variabele 'inbraken' is niet gedefinieerd. Maak deze variabele aan.",
            type = "error"
          )
          return(NULL)
        }
        val <- get("inbraken", envir = env)
        if (!is.numeric(val)) {
          get_reporter()$add_message(
            paste0("❌ De variabele 'inbraken' moet een numerieke waarde zijn, geen ", class(val), "."),
            type = "error"
          )
          return(NULL)
        }
        val
      },
      146,
      comparator = function(got, want, ...) {
        if (is.null(got)) {
          return(FALSE)
        }
        if (got != want) {
          get_reporter()$add_message(
            paste0("❌ Verwachtte waarde voor 'inbraken' is ", want, ", maar kreeg ", got, "."),
            type = "error"
          )
          return(FALSE)
        }
        get_reporter()$add_message(
          "✅ Goed gedaan! Je hebt de waarde 146 correct toegekend aan de variabele 'inbraken'.",
          type = "success"
        )
        return(TRUE)
      }
    )
  })
}, preExec = {
  # Geen setup nodig voor deze eenvoudige oefening
})

# Verwachte antwoorden:
# inbraken <- 146