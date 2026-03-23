context({
  testcase(
    "Steekproefgrootte - topsalarissen banken",
    {
      testEqual(
        "",
        function(env) {
          results <- list()

          # Given
          sigma  <- 9000
          E      <- 400
          z      <- 1.96   # 95%-BI

          # Expected
          exp_z        <- z
          exp_sigma    <- sigma
          exp_E        <- E
          exp_quotient <- z * sigma / E              # 44.1
          exp_n_raw    <- exp_quotient^2             # 1944.81
          exp_n_min    <- ceiling(exp_n_raw)         # 1945

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

          results$z_waarde          <- check_val("z_waarde",         exp_z,        tol = 0.01)
          results$sigma             <- check_val("sigma",            exp_sigma,    tol = 0)
          results$foutenmarge       <- check_val("foutenmarge",      exp_E,        tol = 0)
          results$quotient          <- check_val("quotient",         exp_quotient, tol = 0.05)
          results$n_voor_afronding  <- check_val("n_voor_afronding", exp_n_raw,    tol = 1)
          results$n_minimum         <- check_val("n_minimum",        exp_n_min,    tol = 0)

          assign("detailed_results", results, envir = globalenv())
          assign("expected_vals", list(
            z = exp_z, sigma = exp_sigma, E = exp_E,
            quotient = exp_quotient, n_raw = exp_n_raw, n_min = exp_n_min
          ), envir = globalenv())

          all(sapply(results, function(x) x$correct))
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("detailed_results", envir = globalenv())
          ev      <- get("expected_vals",    envir = globalenv())

          qnames <- c(
            z_waarde         = "z-waarde (95%-BI)",
            sigma            = "Standaardafwijking σ (€)",
            foutenmarge      = "Maximale foutenmarge E (€)",
            quotient         = "Quoënt: z × σ / E",
            n_voor_afronding = "n vóór afronding",
            n_minimum        = "Minimale steekproefgrootte n (naar boven afgerond)"
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
            sprintf("- Formule: n = (z × σ / E)^2"),
            sprintf("- n = (%.2f × %d / %d)^2 = (%.4f)^2 = %.2f", ev$z, ev$sigma, ev$E, ev$quotient, ev$n_raw),
            sprintf("- Afgerond naar boven: n = %d", ev$n_min)
          )

          msg <- paste(lines, collapse = "\n")
          get_reporter()$add_message(msg, type = "markdown")
          generated == expected
        }
      )
    }
  )
})