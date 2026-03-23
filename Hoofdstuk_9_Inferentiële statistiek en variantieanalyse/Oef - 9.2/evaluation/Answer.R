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

          parse_num <- function(val) {
            if (is.character(val)) { val <- trimws(val); val <- gsub(",", ".", val, fixed=TRUE) }
            suppressWarnings(as.numeric(val))
          }

          # ── wrong_msg helpers ──────────────────────────────────────────────────

          wrong_msg_gemiddelde <- function(val) {
            v <- parse_num(val)
            if (!is.na(v) && abs(v - 25.8) < 0.1)
              return("**Waarom fout:** Je gaf de **ondergrens** van het 95%-BI (25.8) als gemiddelde.\n\n**Het gemiddelde** is het middelpunt van het interval:\n\n→ x̄ = (25.8 + 28.4) / 2 = **27.1**")
            if (!is.na(v) && abs(v - 28.4) < 0.1)
              return("**Waarom fout:** Je gaf de **bovengrens** van het 95%-BI (28.4) als gemiddelde.\n\n→ x̄ = (25.8 + 28.4) / 2 = **27.1**")
            if (!is.na(v) && abs(v - 2.6) < 0.1)
              return("**Waarom fout:** Je berekende de **breedte** (28.4 − 25.8 = 2.6), niet het gemiddelde.\n\n→ x̄ = midpunt = (25.8 + 28.4) / 2 = **27.1**")
            sprintf("**Hoe te corrigeren:** Het gemiddelde = midpunt van het interval = (ondergrens + bovengrens) / 2\n\n→ x̄ = (25.8 + 28.4) / 2 = **%.1f**", ev$mean)
          }

          wrong_msg_SE <- function(val) {
            v <- parse_num(val)
            if (!is.na(v) && abs(v - 1.3) < 0.05)
              return("**Waarom fout:** Je gaf de **halve breedte** (1.3), niet de standaardfout.\n\n**Stap:** De halve breedte = z × SE → SE = halve breedte / z_95 = 1.3 / 1.96 = **0.663**.")
            if (!is.na(v) && abs(v - 2.6) < 0.1)
              return("**Waarom fout:** Je gaf de **volledige breedte** (2.6), niet de standaardfout.\n\n**Stap:** SE = halve breedte / z_95 = 1.3 / 1.96 = **0.663**.")
            if (!is.na(v) && abs(v - 0.5047) < 0.01)
              return(sprintf("**Waarom fout:** Je deelde door z_99=2.576 in plaats van z_95=1.96.\n\n**Het gegeven CI is 95%%**, dus: SE = 1.3 / **1.96** = **%.4f**.", ev$SE))
            sprintf("**Hoe te corrigeren:** SE = halve breedte / z_95 = 1.3 / 1.96 = **%.4f**\n\n(halve breedte = (28.4 − 25.8) / 2 = 1.3)", ev$SE)
          }

          wrong_msg_BI90_onder <- function(val) {
            v <- parse_num(val)
            if (!is.na(v) && abs(v - (ev$mean - 1.96 * ev$SE)) < 0.05)
              return(sprintf("**Waarom fout:** Je gebruikte z=1.96 (hoort bij 95%%-BI), maar voor een **90%%**-BI is z = **1.645**.\n\n→ BI_90_onder = %.1f − 1.645 × %.4f = **%.3f**", ev$mean, ev$SE, ev$BI90_onder))
            if (!is.na(v) && abs(v - (ev$mean - 2.576 * ev$SE)) < 0.05)
              return(sprintf("**Waarom fout:** Je gebruikte z=2.576 (hoort bij 99%%-BI), maar voor een **90%%**-BI is z = **1.645**.\n\n→ BI_90_onder = %.1f − 1.645 × %.4f = **%.3f**", ev$mean, ev$SE, ev$BI90_onder))
            sprintf("**Hoe te corrigeren:** BI_90_onder = x̄ − z_90 × SE = %.1f − 1.645 × %.4f = **%.3f**", ev$mean, ev$SE, ev$BI90_onder)
          }

          wrong_msg_BI90_boven <- function(val) {
            v <- parse_num(val)
            if (!is.na(v) && abs(v - (ev$mean + 1.96 * ev$SE)) < 0.05)
              return(sprintf("**Waarom fout:** Je gebruikte z=1.96 (hoort bij 95%%-BI), maar voor een **90%%**-BI is z = **1.645**.\n\n→ BI_90_boven = %.1f + 1.645 × %.4f = **%.3f**", ev$mean, ev$SE, ev$BI90_boven))
            if (!is.na(v) && abs(v - (ev$mean + 2.576 * ev$SE)) < 0.05)
              return(sprintf("**Waarom fout:** Je gebruikte z=2.576 (hoort bij 99%%-BI) voor een **90%%**-BI.\n\n→ BI_90_boven = %.1f + 1.645 × %.4f = **%.3f**", ev$mean, ev$SE, ev$BI90_boven))
            sprintf("**Hoe te corrigeren:** BI_90_boven = x̄ + z_90 × SE = %.1f + 1.645 × %.4f = **%.3f**", ev$mean, ev$SE, ev$BI90_boven)
          }

          wrong_msg_BI99_onder <- function(val) {
            v <- parse_num(val)
            if (!is.na(v) && abs(v - (ev$mean - 1.96 * ev$SE)) < 0.05)
              return(sprintf("**Waarom fout:** Je gebruikte z=1.96 (hoort bij 95%%-BI), maar voor een **99%%**-BI is z = **2.576**.\n\n→ BI_99_onder = %.1f − 2.576 × %.4f = **%.3f**", ev$mean, ev$SE, ev$BI99_onder))
            if (!is.na(v) && abs(v - (ev$mean - 1.645 * ev$SE)) < 0.05)
              return(sprintf("**Waarom fout:** Je gebruikte z=1.645 (hoort bij 90%%-BI), maar voor een **99%%**-BI is z = **2.576**.\n\n→ BI_99_onder = %.1f − 2.576 × %.4f = **%.3f**", ev$mean, ev$SE, ev$BI99_onder))
            sprintf("**Hoe te corrigeren:** BI_99_onder = x̄ − z_99 × SE = %.1f − 2.576 × %.4f = **%.3f**", ev$mean, ev$SE, ev$BI99_onder)
          }

          wrong_msg_BI99_boven <- function(val) {
            v <- parse_num(val)
            if (!is.na(v) && abs(v - (ev$mean + 1.96 * ev$SE)) < 0.05)
              return(sprintf("**Waarom fout:** Je gebruikte z=1.96 (hoort bij 95%%-BI), maar voor een **99%%**-BI is z = **2.576**.\n\n→ BI_99_boven = %.1f + 2.576 × %.4f = **%.3f**", ev$mean, ev$SE, ev$BI99_boven))
            if (!is.na(v) && abs(v - (ev$mean + 1.645 * ev$SE)) < 0.05)
              return(sprintf("**Waarom fout:** Je gebruikte z=1.645 (hoort bij 90%%-BI), maar voor een **99%%**-BI is z = **2.576**.\n\n→ BI_99_boven = %.1f + 2.576 × %.4f = **%.3f**", ev$mean, ev$SE, ev$BI99_boven))
            sprintf("**Hoe te corrigeren:** BI_99_boven = x̄ + z_99 × SE = %.1f + 2.576 × %.4f = **%.3f**", ev$mean, ev$SE, ev$BI99_boven)
          }

          wrong_msg_breder <- function(val) {
            v <- parse_num(val)
            if (!is.na(v) && v == 1)
              return("**Waarom fout:** Je koos het 90%-BI als 'breder', maar een **hoger betrouwbaarheidsniveau** vereist een breder interval.\n\n**Regel:** meer zekerheid (99% > 90%) → groter z (2.576 > 1.645) → breder interval → code **2** (99%-BI).")
            "**Code 2** (99%-BI) — een hoger betrouwbaarheidsniveau geeft altijd een breder interval."
          }

          # ── labels + functies ──────────────────────────────────────────────────

          qnames <- c(
            gemiddelde      = "Steekproefgemiddelde (x̄)",
            standaardfout   = "Standaardfout (SE)",
            BI_90_onder     = "Ondergrens 90%-BI",
            BI_90_boven     = "Bovengrens 90%-BI",
            BI_99_onder     = "Ondergrens 99%-BI",
            BI_99_boven     = "Bovengrens 99%-BI",
            breder_interval = "Breder interval (1=90%, 2=99%)"
          )

          wrong_fns <- list(
            gemiddelde      = wrong_msg_gemiddelde,
            standaardfout   = wrong_msg_SE,
            BI_90_onder     = wrong_msg_BI90_onder,
            BI_90_boven     = wrong_msg_BI90_boven,
            BI_99_onder     = wrong_msg_BI99_onder,
            BI_99_boven     = wrong_msg_BI99_boven,
            breder_interval = wrong_msg_breder
          )

          correct_msgs <- list(
            gemiddelde      = sprintf("midpunt van het 95%%-BI = (25.8+28.4)/2 = **%.1f** ✓", ev$mean),
            standaardfout   = sprintf("SE = halve breedte / z_95 = 1.3 / 1.96 = **%.4f** ✓", ev$SE),
            BI_90_onder     = sprintf("x̄ − 1.645×SE = **%.3f** ✓", ev$BI90_onder),
            BI_90_boven     = sprintf("x̄ + 1.645×SE = **%.3f** ✓", ev$BI90_boven),
            BI_99_onder     = sprintf("x̄ − 2.576×SE = **%.3f** ✓", ev$BI99_onder),
            BI_99_boven     = sprintf("x̄ + 2.576×SE = **%.3f** ✓", ev$BI99_boven),
            breder_interval = "99%-BI (code 2) is altijd breder — hogere zekerheid vereist groter z ✓"
          )

          # ── feedback opbouwen ─────────────────────────────────────────────────

          lines <- character(0)
          score <- 0
          total <- length(qnames)

          for (key in names(qnames)) {
            r   <- results[[key]]
            lbl <- qnames[[key]]
            if (!r$exists) {
              lines <- c(lines, paste0("❌ **", lbl, "** — variabele `", key, "` niet ingevuld.\n\n",
                wrong_fns[[key]]("?"), "\n"))
            } else if (r$correct) {
              lines <- c(lines, paste0("✅ **", lbl, "**: correct (", as.character(r$value),
                ") — ", correct_msgs[[key]], "\n"))
              score <- score + 1
            } else {
              lines <- c(lines, paste0("❌ **", lbl, "** — jouw antwoord: **", as.character(r$value),
                "**\n\n", wrong_fns[[key]](r$value), "\n"))
            }
          }

          lines <- c(lines, sprintf("---\n\n**Score: %d / %d**", score, total))
          get_reporter()$add_message(paste(lines, collapse = "\n"), type = "markdown")
          generated == expected
        }
      )
    }
  )
})