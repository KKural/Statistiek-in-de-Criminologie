context({
  testcase(
    "Partiële correlatie — scholieren en leeftijd (ruwe data)",
    {
      testEqual(
        "",
        function(env) {
          results <- list()

          # True data
          X_data <- c(2, 0, 0, 6, 3, 0, 2)   # DelictenGepleegd
          Y_data <- c(2, 0, 1, 3, 2, 3, 4)   # DelictenSlachtoffer
          Z_data <- c(17, 15, 14, 16, 15, 14, 18)  # Leeftijd
          n <- 7L

          # Display-rounded data (already integers, round to 2dp is no-op)
          X <- round(X_data, 2)
          Y <- round(Y_data, 2)
          Z <- round(Z_data, 2)

          # Step 1: means (4dp)
          exp_X_bar <- round(mean(X), 4)
          exp_Y_bar <- round(mean(Y), 4)
          exp_Z_bar <- round(mean(Z), 4)

          # Step 2-3: deviations, squares, cross-products
          dx <- round(X - exp_X_bar, 4)
          dy <- round(Y - exp_Y_bar, 4)
          dz <- round(Z - exp_Z_bar, 4)

          exp_SS_X   <- round(sum(round(dx^2,  4)), 4)
          exp_SS_Y   <- round(sum(round(dy^2,  4)), 4)
          exp_SS_Z   <- round(sum(round(dz^2,  4)), 4)
          exp_SCP_XY <- round(sum(round(dx*dy, 4)), 4)
          exp_SCP_XZ <- round(sum(round(dx*dz, 4)), 4)
          exp_SCP_YZ <- round(sum(round(dy*dz, 4)), 4)

          # Step 4: variances, SDs, covariances
          exp_Var_X  <- round(exp_SS_X  / (n - 1L), 4)
          exp_Var_Y  <- round(exp_SS_Y  / (n - 1L), 4)
          exp_Var_Z  <- round(exp_SS_Z  / (n - 1L), 4)
          exp_SD_X   <- round(sqrt(exp_Var_X), 4)
          exp_SD_Y   <- round(sqrt(exp_Var_Y), 4)
          exp_SD_Z   <- round(sqrt(exp_Var_Z), 4)
          exp_Cov_XY <- round(exp_SCP_XY / (n - 1L), 4)
          exp_Cov_XZ <- round(exp_SCP_XZ / (n - 1L), 4)
          exp_Cov_YZ <- round(exp_SCP_YZ / (n - 1L), 4)

          # Step 5: bivariate correlations
          exp_r_XY <- round(exp_Cov_XY / (exp_SD_X * exp_SD_Y), 4)
          exp_r_XZ <- round(exp_Cov_XZ / (exp_SD_X * exp_SD_Z), 4)
          exp_r_YZ <- round(exp_Cov_YZ / (exp_SD_Y * exp_SD_Z), 4)

          # Step 6: partial correlation
          exp_r_XY_teller <- round(exp_r_XY - exp_r_XZ * exp_r_YZ, 4)
          exp_r_XY_noemer <- round(sqrt((1 - exp_r_XZ^2) * (1 - exp_r_YZ^2)), 4)
          exp_r_XY_Z      <- round(exp_r_XY_teller / exp_r_XY_noemer, 4)

          # Interpretation: r_XY drops from ~0.46 to ~0.30 -> indirect/partial effect
          exp_conclusie_type <- 2L  # Indirect verband: verband verzwakt maar blijft

          parse_num <- function(val) {
            if (is.character(val)) {
              val <- trimws(val)
              val <- gsub(",", ".", val, fixed = TRUE)
              val <- gsub("%", "", val, fixed = TRUE)
            }
            suppressWarnings(as.numeric(val))
          }

          check_val <- function(varname, expected, tol = 0.0051) {
            if (!exists(varname, envir = env)) {
              return(list(exists = FALSE, value = NA, correct = FALSE, expected = expected))
            }
            raw <- get(varname, envir = env)
            num <- parse_num(raw)
            ok  <- !is.na(num) && abs(num - expected) <= tol
            list(exists = TRUE, value = raw, value_num = num, correct = ok, expected = expected)
          }

          results$X_bar          <- check_val("X_bar",          exp_X_bar)
          results$Y_bar          <- check_val("Y_bar",          exp_Y_bar)
          results$Z_bar          <- check_val("Z_bar",          exp_Z_bar)
          results$SS_X           <- check_val("SS_X",           exp_SS_X,   tol = 0.02)
          results$SS_Y           <- check_val("SS_Y",           exp_SS_Y,   tol = 0.02)
          results$SS_Z           <- check_val("SS_Z",           exp_SS_Z,   tol = 0.02)
          results$SCP_XY         <- check_val("SCP_XY",         exp_SCP_XY, tol = 0.02)
          results$SCP_XZ         <- check_val("SCP_XZ",         exp_SCP_XZ, tol = 0.02)
          results$SCP_YZ         <- check_val("SCP_YZ",         exp_SCP_YZ, tol = 0.02)
          results$Var_X          <- check_val("Var_X",          exp_Var_X)
          results$Var_Y          <- check_val("Var_Y",          exp_Var_Y)
          results$Var_Z          <- check_val("Var_Z",          exp_Var_Z)
          results$SD_X           <- check_val("SD_X",           exp_SD_X)
          results$SD_Y           <- check_val("SD_Y",           exp_SD_Y)
          results$SD_Z           <- check_val("SD_Z",           exp_SD_Z)
          results$Cov_XY         <- check_val("Cov_XY",         exp_Cov_XY)
          results$Cov_XZ         <- check_val("Cov_XZ",         exp_Cov_XZ)
          results$Cov_YZ         <- check_val("Cov_YZ",         exp_Cov_YZ)
          results$r_XY           <- check_val("r_XY",           exp_r_XY)
          results$r_XZ           <- check_val("r_XZ",           exp_r_XZ)
          results$r_YZ           <- check_val("r_YZ",           exp_r_YZ)
          results$r_XY_teller    <- check_val("r_XY_teller",    exp_r_XY_teller)
          results$r_XY_noemer    <- check_val("r_XY_noemer",    exp_r_XY_noemer)
          results$r_XY_Z         <- check_val("r_XY_Z",         exp_r_XY_Z)
          results$conclusie_type <- check_val("conclusie_type", exp_conclusie_type, tol = 0)

          assign("detailed_results", results, envir = globalenv())
          assign("expected_vals", list(
            X_bar = exp_X_bar, Y_bar = exp_Y_bar, Z_bar = exp_Z_bar,
            SS_X = exp_SS_X, SS_Y = exp_SS_Y, SS_Z = exp_SS_Z,
            r_XY = exp_r_XY, r_XZ = exp_r_XZ, r_YZ = exp_r_YZ,
            teller = exp_r_XY_teller, noemer = exp_r_XY_noemer,
            r_XY_Z = exp_r_XY_Z
          ), envir = globalenv())

          all(sapply(results, function(x) x$correct))
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("detailed_results", envir = globalenv())
          ev      <- get("expected_vals",    envir = globalenv())

          qnames <- c(
            X_bar          = "Gemiddelde X (X_bar)",
            Y_bar          = "Gemiddelde Y (Y_bar)",
            Z_bar          = "Gemiddelde Z (Z_bar)",
            SS_X           = "Somkwadraat SS_X",
            SS_Y           = "Somkwadraat SS_Y",
            SS_Z           = "Somkwadraat SS_Z",
            SCP_XY         = "Kruisproductsom SCP_XY",
            SCP_XZ         = "Kruisproductsom SCP_XZ",
            SCP_YZ         = "Kruisproductsom SCP_YZ",
            Var_X          = "Variantie Var_X",
            Var_Y          = "Variantie Var_Y",
            Var_Z          = "Variantie Var_Z",
            SD_X           = "Standaarddeviatie SD_X",
            SD_Y           = "Standaarddeviatie SD_Y",
            SD_Z           = "Standaarddeviatie SD_Z",
            Cov_XY         = "Covariantie Cov_XY",
            Cov_XZ         = "Covariantie Cov_XZ",
            Cov_YZ         = "Covariantie Cov_YZ",
            r_XY           = "Bivariate correlatie r_XY",
            r_XZ           = "Bivariate correlatie r_XZ",
            r_YZ           = "Bivariate correlatie r_YZ",
            r_XY_teller    = "Teller partiele correlatie",
            r_XY_noemer    = "Noemer partiele correlatie",
            r_XY_Z         = "Partiele correlatie r_XY.Z",
            conclusie_type = "Interpretatie (conclusie_type)"
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
            "**Referentiewaarden (ter controle):**",
            sprintf("- X_bar = %.4f, Y_bar = %.4f, Z_bar = %.4f", ev$X_bar, ev$Y_bar, ev$Z_bar),
            sprintf("- SS_X = %.4f, SS_Y = %.4f, SS_Z = %.4f", ev$SS_X, ev$SS_Y, ev$SS_Z),
            sprintf("- r_XY = %.4f, r_XZ = %.4f, r_YZ = %.4f", ev$r_XY, ev$r_XZ, ev$r_YZ),
            sprintf("- Teller = %.4f, Noemer = %.4f", ev$teller, ev$noemer),
            sprintf("- Partiele correlatie r_XY.Z = %.4f", ev$r_XY_Z)
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