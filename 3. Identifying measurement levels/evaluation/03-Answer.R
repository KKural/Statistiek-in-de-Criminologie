# bloom_level: Remember & Understand
# scaffolding_level: Full support
# primm_phase: Run

## Verwachte antwoorden voor meetniveaus
niveau_zaak_id <- "nominaal"
niveau_geslacht <- "nominaal"
niveau_leeftijd <- "ratio"
niveau_misdaad_type <- "nominaal"
niveau_strafduur <- "ratio"
niveau_opleidingsniveau <- "ordinaal"
niveau_risicocategorie <- "ordinaal"

context({
  testcase(" ", {
    testEqual(
      " ",
      function(env) {
        # Check if the variable exists
        tryCatch({
          value <- env$niveau_zaak_id
          if (is.null(value)) {
            get_reporter()$add_message(
              "❌ De variabele `niveau_zaak_id` is niet gedefinieerd.",
              type = "error"
            )
            return(FALSE)
          }
          
          # Check if it's a string
          if (!is.character(value)) {
            get_reporter()$add_message(
              "❌ `niveau_zaak_id` moet een tekst (string) zijn, geen " + class(value) + ".",
              type = "error"
            )
            return(FALSE)
          }
          
          # Case-insensitive comparison
          return(tolower(value) == "nominaal")
        }, error = function(e) {
          get_reporter()$add_message(
            "❌ Er is een fout opgetreden bij het controleren van `niveau_zaak_id`.",
            type = "error"
          )
          return(FALSE)
        })
      },
      TRUE,
      comparator = function(got, want, ...) {
        if (!got) {
          get_reporter()$add_message(
            "❌ `niveau_zaak_id` moet 'nominaal' zijn.",
            type = "error"
          )
        } else {
          get_reporter()$add_message(
            "✅ `niveau_zaak_id` is correct als 'nominaal'.",
            type = "success"
          )
        }
        return(got == want)
      }
    )
    testEqual(
      "",
      function(env) {
        tryCatch({
          value <- env$niveau_geslacht
          if (is.null(value)) {
            get_reporter()$add_message(
              "❌ De variabele `niveau_geslacht` is niet gedefinieerd.",
              type = "error"
            )
            return(FALSE)
          }
          if (!is.character(value)) {
            get_reporter()$add_message(
              "❌ `niveau_geslacht` moet een tekst (string) zijn.",
              type = "error"
            )
            return(FALSE)
          }
          return(tolower(value) == "nominaal")
        }, error = function(e) {
          get_reporter()$add_message(
            "❌ Er is een fout opgetreden bij het controleren van `niveau_geslacht`.",
            type = "error"
          )
          return(FALSE)
        })
      },
      TRUE,
      comparator = function(got, want, ...) {
        if (!got) {
          get_reporter()$add_message(
            "❌ `niveau_geslacht` moet 'nominaal' zijn.",
            type = "error"
          )
        } else {
          get_reporter()$add_message(
            "✅ `niveau_geslacht` is correct als 'nominaal'.",
            type = "success"
          )
        }
        got == want
      }
    )
    testEqual(
      "",
      function(env) {
        tryCatch({
          value <- env$niveau_leeftijd
          if (is.null(value)) {
            get_reporter()$add_message(
              "❌ De variabele `niveau_leeftijd` is niet gedefinieerd.",
              type = "error"
            )
            return(FALSE)
          }
          if (!is.character(value)) {
            get_reporter()$add_message(
              "❌ `niveau_leeftijd` moet een tekst (string) zijn.",
              type = "error"
            )
            return(FALSE)
          }
          return(tolower(value) == "ratio")
        }, error = function(e) {
          get_reporter()$add_message(
            "❌ Er is een fout opgetreden bij het controleren van `niveau_leeftijd`.",
            type = "error"
          )
          return(FALSE)
        })
      },
      TRUE,
      comparator = function(got, want, ...) {
        if (!got) {
          get_reporter()$add_message(
            "❌ `niveau_leeftijd` moet 'ratio' zijn.",
            type = "error"
          )
        } else {
          get_reporter()$add_message(
            "✅ `niveau_leeftijd` is correct als 'ratio'.",
            type = "success"
          )
        }
        got == want
      }
    )
    testEqual(
      "",
      function(env) {
        tryCatch({
          value <- env$niveau_misdaad_type
          if (is.null(value)) {
            get_reporter()$add_message(
              "❌ De variabele `niveau_misdaad_type` is niet gedefinieerd.",
              type = "error"
            )
            return(FALSE)
          }
          if (!is.character(value)) {
            get_reporter()$add_message(
              "❌ `niveau_misdaad_type` moet een tekst (string) zijn.",
              type = "error"
            )
            return(FALSE)
          }
          return(tolower(value) == "nominaal")
        }, error = function(e) {
          get_reporter()$add_message(
            "❌ Er is een fout opgetreden bij het controleren van `niveau_misdaad_type`.",
            type = "error"
          )
          return(FALSE)
        })
      },
      TRUE,
      comparator = function(got, want, ...) {
        if (!got) {
          get_reporter()$add_message(
            "❌ `niveau_misdaad_type` moet 'nominaal' zijn.",
            type = "error"
          )
        } else {
          get_reporter()$add_message(
            "✅ `niveau_misdaad_type` is correct als 'nominaal'.",
            type = "success"
          )
        }
        got == want
      }
    )
    testEqual(
      "",
      function(env) {
        tryCatch({
          value <- env$niveau_strafduur
          if (is.null(value)) {
            get_reporter()$add_message(
              "❌ De variabele `niveau_strafduur` is niet gedefinieerd.",
              type = "error"
            )
            return(FALSE)
          }
          if (!is.character(value)) {
            get_reporter()$add_message(
              "❌ `niveau_strafduur` moet een tekst (string) zijn.",
              type = "error"
            )
            return(FALSE)
          }
          return(tolower(value) == "ratio")
        }, error = function(e) {
          get_reporter()$add_message(
            "❌ Er is een fout opgetreden bij het controleren van `niveau_strafduur`.",
            type = "error"
          )
          return(FALSE)
        })
      },
      TRUE,
      comparator = function(got, want, ...) {
        if (!got) {
          get_reporter()$add_message(
            "❌ `niveau_strafduur` moet 'ratio' zijn.",
            type = "error"
          )
        } else {
          get_reporter()$add_message(
            "✅ `niveau_strafduur` is correct als 'ratio'.",
            type = "success"
          )
        }
        got == want
      }
    )
    testEqual(
      "",
      function(env) {
        tryCatch({
          value <- env$niveau_opleidingsniveau
          if (is.null(value)) {
            get_reporter()$add_message(
              "❌ De variabele `niveau_opleidingsniveau` is niet gedefinieerd.",
              type = "error"
            )
            return(FALSE)
          }
          if (!is.character(value)) {
            get_reporter()$add_message(
              "❌ `niveau_opleidingsniveau` moet een tekst (string) zijn.",
              type = "error"
            )
            return(FALSE)
          }
          return(tolower(value) == "ordinaal")
        }, error = function(e) {
          get_reporter()$add_message(
            "❌ Er is een fout opgetreden bij het controleren van `niveau_opleidingsniveau`.",
            type = "error"
          )
          return(FALSE)
        })
      },
      TRUE,
      comparator = function(got, want, ...) {
        if (!got) {
          get_reporter()$add_message(
            "❌ `niveau_opleidingsniveau` moet 'ordinaal' zijn.",
            type = "error"
          )
        } else {
          get_reporter()$add_message(
            "✅ `niveau_opleidingsniveau` is correct als 'ordinaal'.",
            type = "success"
          )
        }
        got == want
      }
    )
    testEqual(
      "",
      function(env) {
        tryCatch({
          value <- env$niveau_risicocategorie
          if (is.null(value)) {
            get_reporter()$add_message(
              "❌ De variabele `niveau_risicocategorie` is niet gedefinieerd.",
              type = "error"
            )
            return(FALSE)
          }
          if (!is.character(value)) {
            get_reporter()$add_message(
              "❌ `niveau_risicocategorie` moet een tekst (string) zijn.",
              type = "error"
            )
            return(FALSE)
          }
          return(tolower(value) == "ordinaal")
        }, error = function(e) {
          get_reporter()$add_message(
            "❌ Er is een fout opgetreden bij het controleren van `niveau_risicocategorie`.",
            type = "error"
          )
          return(FALSE)
        })
      },
      TRUE,
      comparator = function(got, want, ...) {
        if (!got) {
          get_reporter()$add_message(
            "❌ `niveau_risicocategorie` moet 'ordinaal' zijn.",
            type = "error"
          )
        } else {
          get_reporter()$add_message(
            "✅ `niveau_risicocategorie` is correct als 'ordinaal'.",
            type = "success"
          )
        }
        got == want
      }
    )
  })
}, preExec = {
  # Een dataset met informatie over strafzaken
  crime_data <- data.frame(
    zaak_id = c(1001, 1002, 1003, 1004, 1005),
    geslacht = c("Man", "Vrouw", "Man", "Man", "Vrouw"),
    leeftijd = c(24, 37, 19, 42, 31),
    misdaad_type = c("Diefstal", "Aanval", "Inbraak", "Diefstal", "Fraude"),
    strafduur = c(12, 36, 6, 15, 24),
    opleidingsniveau = c("Secundair", "Primair", "Hoger", "Secundair", "Hoger"),
    risicocategorie = c("Midden", "Hoog", "Laag", "Midden", "Laag")
  )
  
  # Also make it available globally
  assign("crime_data", crime_data, envir = globalenv())
})