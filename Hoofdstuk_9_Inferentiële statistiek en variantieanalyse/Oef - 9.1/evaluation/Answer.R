context({
  testcase(
    "Beleidsverklaringen Premier vs. Minister BZ - Chi-kwadraattoets",
    {
      testEqual(
        "",
        function(env) {
          results <- list()

          # Data
          N <- 100
          col_premier <- 25
          col_minister <- 75

          row_opsluiting <- 22
          row_spec_afsch <- 16
          row_alg_afsch <- 24
          row_rehab <- 15
          row_gedw_bet <- 23

          # Observed
          O <- matrix(
            c(6, 16, 2, 14, 4, 20, 0, 15, 13, 10),
            nrow = 5, byrow = TRUE
          )
          row_totals <- c(22, 16, 24, 15, 23)
          col_totals <- c(25, 75)

          # Expected
          E <- outer(row_totals, col_totals) / N
          exp_E_opsluiting_premier <- E[1, 1]   # 5.5
          exp_E_betaling_premier   <- E[5, 1]   # 5.75
          exp_E_rehab_minister     <- E[4, 2]   # 11.25

          exp_chi2 <- sum((O - E)^2 / E)
          exp_df   <- (5 - 1) * (2 - 1)

          exp_kritiek_005 <- qchisq(0.95, df = exp_df)  # 9.488
          exp_kritiek_001 <- qchisq(0.99, df = exp_df)  # 13.277
          exp_significant_005 <- 1   # ja
          exp_significant_001 <- 1   # ja (19.471 > 13.277)
          exp_H0_richting <- 1       # geen verband

          parse_num <- function(val) {
            if (is.character(val)) {
              val <- trimws(val)
              val <- gsub(",", ".", val, fixed = TRUE)
              val <- gsub("%", "", val, fixed = TRUE)
            }
            suppressWarnings(as.numeric(val))
          }

          check_val <- function(varname, expected, tol = 0.05) {
            if (!exists(varname, envir = env)) {
              return(list(exists = FALSE, value = NA, correct = FALSE, expected = expected))
            }
            raw <- get(varname, envir = env)
            num <- parse_num(raw)
            ok  <- !is.na(num) && abs(num - expected) <= tol
            list(exists = TRUE, value = raw, value_num = num, correct = ok, expected = expected)
          }

          results$H0_richting           <- check_val("H0_richting",           exp_H0_richting,         tol = 0)
          results$E_opsluiting_premier  <- check_val("E_opsluiting_premier",  exp_E_opsluiting_premier, tol = 0.1)
          results$E_betaling_premier    <- check_val("E_betaling_premier",    exp_E_betaling_premier,   tol = 0.1)
          results$E_rehab_minister      <- check_val("E_rehab_minister",      exp_E_rehab_minister,     tol = 0.1)
          results$chi_kwadraat          <- check_val("chi_kwadraat",          exp_chi2,                 tol = 0.5)
          results$df_chi                <- check_val("df_chi",                exp_df,                   tol = 0)
          results$kritieke_waarde_005   <- check_val("kritieke_waarde_005",   exp_kritiek_005,          tol = 0.1)
          results$significant_005       <- check_val("significant_005",       exp_significant_005,      tol = 0)
          results$kritieke_waarde_001   <- check_val("kritieke_waarde_001",   exp_kritiek_001,          tol = 0.1)
          results$significant_001       <- check_val("significant_001",       exp_significant_001,      tol = 0)

          assign("detailed_results", results, envir = globalenv())
          assign("expected_vals", list(
            chi2         = exp_chi2,
            df           = exp_df,
            kritiek_005  = exp_kritiek_005,
            kritiek_001  = exp_kritiek_001,
            E_opl_prem   = exp_E_opsluiting_premier,
            E_bet_prem   = exp_E_betaling_premier,
            E_reh_min    = exp_E_rehab_minister
          ), envir = globalenv())

          all(sapply(results, function(x) x$correct))
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("detailed_results", envir = globalenv())
          ev      <- get("expected_vals",    envir = globalenv())

          qnames <- c(
            H0_richting          = "H0: richting (1=geen verband)",
            E_opsluiting_premier = "Verwachte freq. Opsluiting & Premier",
            E_betaling_premier   = "Verwachte freq. Gedwongen betaling & Premier",
            E_rehab_minister     = "Verwachte freq. Rehabilitatie & Minister BZ",
            chi_kwadraat         = "Chi-kwadraatwaarde (χ²)",
            df_chi               = "Vrijheidsgraden (df)",
            kritieke_waarde_005  = "Kritieke waarde bij α = 0.05",
            significant_005      = "Significant bij α = 0.05? (1=ja, 2=nee)",
            kritieke_waarde_001  = "Kritieke waarde bij α = 0.01",
            significant_001      = "Significant bij α = 0.01? (1=ja, 2=nee)"
          )

          lines <- character(0)
          score <- 0
          total <- length(qnames)

          for (key in names(qnames)) {
            r <- results[[key]]
            label <- qnames[[key]]
            if (!r$exists) {
              lines <- c(lines, sprintf("❌ **%s**: variabele `%s` niet gevonden.", label, key))
            } else if (!r$correct) {
              lines <- c(lines, sprintf("❌ **%s**: jouw antwoord = %s | verwacht ≈ %s",
                label, as.character(r$value), round(r$expected, 4)))
            } else {
              lines <- c(lines, sprintf("✅ **%s**: correct (%s)", label, as.character(r$value)))
              score <- score + 1
            }
          }

          lines <- c(lines, "",
            sprintf("**Score: %d / %d**", score, total),
            "",
            sprintf("**Referentiewaarden (ter controle):**"),
            sprintf("- χ² = %.3f", ev$chi2),
            sprintf("- df = %d", ev$df),
            sprintf("- Kritieke waarde (α=0.05, df=4) = %.3f", ev$kritiek_005),
            sprintf("- Kritieke waarde (α=0.01, df=4) = %.3f", ev$kritiek_001),
            sprintf("- E(Opsluiting, Premier) = %.2f", ev$E_opl_prem),
            sprintf("- E(Gedwongen betaling, Premier) = %.2f", ev$E_bet_prem),
            sprintf("- E(Rehabilitatie, Minister BZ) = %.2f", ev$E_reh_min)
          )

          msg <- paste(lines, collapse = "\n")
          if (score == total) {
            correct(msg)
          } else {
            wrong(msg)
          }
        }
      )
    }
  )
})