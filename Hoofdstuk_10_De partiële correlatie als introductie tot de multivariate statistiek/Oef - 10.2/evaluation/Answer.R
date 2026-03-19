context({
  testcase(
    "Partiële correlatie — politieagenten en dienstjaren (correlatietabel)",
    {
      testEqual(
        "",
        function(env) {
          results <- list()

          # Given correlation table (n=50 police officers)
          exp_r_XY <- -0.44   # Fysieke bekwaamheid vs Jaarsalaris
          exp_r_XZ <- -0.68   # Fysieke bekwaamheid vs Dienstjaren
          exp_r_YZ <-  0.82   # Jaarsalaris vs Dienstjaren

          # Partial correlation formula
          exp_r_XY_teller <- round(exp_r_XY - exp_r_XZ * exp_r_YZ, 4)
          exp_r_XY_noemer <- round(sqrt((1 - exp_r_XZ^2) * (1 - exp_r_YZ^2)), 4)
          exp_r_XY_Z      <- round(exp_r_XY_teller / exp_r_XY_noemer, 4)

          # Conclusion: r_XY goes from -0.44 to +0.28 -> sign reversal (type 4)
          exp_conclusie_type <- 4L

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

          results$r_XY           <- check_val("r_XY",           exp_r_XY,           tol = 0.005)
          results$r_XZ           <- check_val("r_XZ",           exp_r_XZ,           tol = 0.005)
          results$r_YZ           <- check_val("r_YZ",           exp_r_YZ,           tol = 0.005)
          results$r_XY_teller    <- check_val("r_XY_teller",    exp_r_XY_teller,    tol = 0.0051)
          results$r_XY_noemer    <- check_val("r_XY_noemer",    exp_r_XY_noemer,    tol = 0.03)
          results$r_XY_Z         <- check_val("r_XY_Z",         exp_r_XY_Z,         tol = 0.03)
          results$conclusie_type <- check_val("conclusie_type", exp_conclusie_type, tol = 0)

          assign("detailed_results", results, envir = globalenv())
          assign("expected_vals", list(
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
            r_XY           = "Bivariate correlatie r_XY (uit tabel)",
            r_XZ           = "Bivariate correlatie r_XZ (uit tabel)",
            r_YZ           = "Bivariate correlatie r_YZ (uit tabel)",
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
            sprintf("- r_XY = %.2f, r_XZ = %.2f, r_YZ = %.2f", ev$r_XY, ev$r_XZ, ev$r_YZ),
            sprintf("- Teller = %.4f, Noemer = %.4f", ev$teller, ev$noemer),
            sprintf("- Partiele correlatie r_XY.Z = %.4f", ev$r_XY_Z),
            "- Interpretatie: dienstjaren veroorzaken een tekenwisseling (type 4)"
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