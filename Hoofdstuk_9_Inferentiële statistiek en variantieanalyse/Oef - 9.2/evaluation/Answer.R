context({
  testcase(
    "Betrouwbaarheidsintervallen - gemiddelde leeftijd",
    {
      testEqual(
        "",
        function(env) {
          results <- list()

          # Given
          CI95_lower <- 25.8
          CI95_upper <- 28.4
          n          <- 1000
          z_95       <- 1.96
          z_90       <- 1.645
          z_99       <- 2.576

          # Calculations
          exp_mean   <- (CI95_lower + CI95_upper) / 2               # 27.1
          half_width <- (CI95_upper - CI95_lower) / 2               # 1.3
          exp_SE     <- half_width / z_95                            # 0.6633

          exp_BI90_onder <- exp_mean - z_90 * exp_SE                # 26.01
          exp_BI90_boven <- exp_mean + z_90 * exp_SE                # 28.19
          exp_BI99_onder <- exp_mean - z_99 * exp_SE                # 25.39
          exp_BI99_boven <- exp_mean + z_99 * exp_SE                # 28.81

          exp_breder <- 2  # 99%-BI is breder

          parse_num <- function(val) {
            if (is.character(val)) {
              val <- trimws(val)
              val <- gsub(",", ".", val, fixed = TRUE)
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

          results$gemiddelde    <- check_val("gemiddelde",    exp_mean,       tol = 0.05)
          results$standaardfout <- check_val("standaardfout", exp_SE,         tol = 0.01)
          results$BI_90_onder   <- check_val("BI_90_onder",   exp_BI90_onder, tol = 0.1)
          results$BI_90_boven   <- check_val("BI_90_boven",   exp_BI90_boven, tol = 0.1)
          results$BI_99_onder   <- check_val("BI_99_onder",   exp_BI99_onder, tol = 0.1)
          results$BI_99_boven   <- check_val("BI_99_boven",   exp_BI99_boven, tol = 0.1)
          results$breder_interval <- check_val("breder_interval", exp_breder, tol = 0)

          assign("detailed_results", results, envir = globalenv())
          assign("expected_vals", list(
            mean        = exp_mean,
            SE          = exp_SE,
            BI90_onder  = exp_BI90_onder,
            BI90_boven  = exp_BI90_boven,
            BI99_onder  = exp_BI99_onder,
            BI99_boven  = exp_BI99_boven
          ), envir = globalenv())

          all(sapply(results, function(x) x$correct))
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("detailed_results", envir = globalenv())
          ev      <- get("expected_vals",    envir = globalenv())

          qnames <- c(
            gemiddelde      = "Steekproefgemiddelde (ā)",
            standaardfout   = "Standaardfout (SE)",
            BI_90_onder     = "Ondergrens 90%-BI",
            BI_90_boven     = "Bovengrens 90%-BI",
            BI_99_onder     = "Ondergrens 99%-BI",
            BI_99_boven     = "Bovengrens 99%-BI",
            breder_interval = "Breder interval (1=90%, 2=99%)"
          )

          lines <- character(0)
          score <- 0
          total <- length(qnames)

          for (key in names(qnames)) {
            r     <- results[[key]]
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
            sprintf("- x̄ = %.1f", ev$mean),
            sprintf("- SE = %.4f", ev$SE),
            sprintf("- 90%%-BI: [%.2f ; %.2f]", ev$BI90_onder, ev$BI90_boven),
            sprintf("- 99%%-BI: [%.2f ; %.2f]", ev$BI99_onder, ev$BI99_boven)
          )

          msg <- paste(lines, collapse = "\n")
          if (score == total) correct(msg) else wrong(msg)
        }
      )
    }
  )
})