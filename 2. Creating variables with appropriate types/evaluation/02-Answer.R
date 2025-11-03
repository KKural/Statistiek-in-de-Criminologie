# bloom_level: Remember & Understand
# scaffolding_level: Full support
# primm_phase: Run

# Antwoorden voor de variabelen:
misdaad_types <- factor(
  c("Diefstal", "Aanval", "Inbraak", "Fraude", "Vandalisme"),
  levels = c("Diefstal", "Aanval", "Inbraak", "Fraude", "Vandalisme")
)
ernst_misdaad <- factor(
  c("Licht", "Matig", "Ernstig", "Matig", "Licht", "Ernstig"),
  levels = c("Licht", "Matig", "Ernstig"),
  ordered = TRUE
)
leeftijden_daders <- c(19, 23, 45, 32, 28, 21)
district_codes <- c("A1", "B2", "C3", "D4", "E5")

context({
  testcase(" ", {
    testEqual(
      "",
      function(env) {
        if (!exists("misdaad_types", envir = env)) {
          get_reporter()$add_message("❌ De variabele 'misdaad_types' bestaat niet.", type = "error")
          return(FALSE)
        }
        if (!is.factor(env$misdaad_types)) {
          get_reporter()$add_message("❌ 'misdaad_types' moet een factor zijn.", type = "error")
          return(FALSE)
        }
        if (!identical(levels(env$misdaad_types), c("Diefstal", "Aanval", "Inbraak", "Fraude", "Vandalisme"))) {
          get_reporter()$add_message("❌ 'misdaad_types' moet de juiste niveaus hebben: 'Diefstal', 'Aanval', 'Inbraak', 'Fraude', 'Vandalisme'.", type = "error")
          return(FALSE)
        }
        TRUE
      },
      TRUE,
      comparator = function(got, want, ...) {
        if (got) get_reporter()$add_message("Correct!", type = "success")
        got == want
      }
    )
    testEqual(
      "",
      function(env) {
        if (!exists("ernst_misdaad", envir = env)) {
          get_reporter()$add_message("❌ De variabele 'ernst_misdaad' bestaat niet.", type = "error")
          return(FALSE)
        }
        if (!is.ordered(env$ernst_misdaad)) {
          get_reporter()$add_message("❌ 'ernst_misdaad' moet een geordende factor zijn.", type = "error")
          return(FALSE)
        }
        if (!identical(levels(env$ernst_misdaad), c("Licht", "Matig", "Ernstig"))) {
          get_reporter()$add_message("❌ 'ernst_misdaad' moet de juiste volgorde hebben: 'Licht', 'Matig', 'Ernstig'.", type = "error")
          return(FALSE)
        }
        TRUE
      },
      TRUE,
      comparator = function(got, want, ...) {
        if (got) get_reporter()$add_message("Correct!", type = "success")
        got == want
      }
    )
    testEqual(
      "",
      function(env) {
        if (!exists("leeftijden_daders", envir = env)) {
          get_reporter()$add_message("❌ De variabele 'leeftijden_daders' bestaat niet.", type = "error")
          return(FALSE)
        }
        if (!is.numeric(env$leeftijden_daders)) {
          get_reporter()$add_message("❌ 'leeftijden_daders' moet een numerieke vector zijn.", type = "error")
          return(FALSE)
        }
        if (!identical(env$leeftijden_daders, c(19, 23, 45, 32, 28, 21))) {
          get_reporter()$add_message("❌ 'leeftijden_daders' moet exact deze waarden bevatten: 19, 23, 45, 32, 28, 21.", type = "error")
          return(FALSE)
        }
        TRUE
      },
      TRUE,
      comparator = function(got, want, ...) {
        if (got) get_reporter()$add_message("Correct!", type = "success")
        got == want
      }
    )
    testEqual(
      "",
      function(env) {
        if (!exists("district_codes", envir = env)) {
          get_reporter()$add_message("❌ De variabele 'district_codes' bestaat niet.", type = "error")
          return(FALSE)
        }
        if (!is.character(env$district_codes)) {
          get_reporter()$add_message("❌ 'district_codes' moet een karaktervector zijn.", type = "error")
          return(FALSE)
        }
        if (!identical(env$district_codes, c("A1", "B2", "C3", "D4", "E5"))) {
          get_reporter()$add_message("❌ 'district_codes' moet exact deze waarden bevatten: 'A1', 'B2', 'C3', 'D4', 'E5'.", type = "error")
          return(FALSE)
        }
        TRUE
      },
      TRUE,
      comparator = function(got, want, ...) {
        if (got) get_reporter()$add_message("Correct!", type = "success")
        got == want
      }
    )
  })
})