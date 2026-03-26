context({
  testcase(
    "",
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

          parse_num <- function(val) {
            if (is.character(val)) { val <- trimws(val); val <- gsub(",", ".", val, fixed=TRUE) }
            suppressWarnings(as.numeric(val))
          }

          # ── wrong_msg helpers ──────────────────────────────────────────────────

          wrong_msg_z <- function(val) {
            v <- parse_num(val)
            if (!is.na(v) && abs(v - 1.645) < 0.01)
              return("**Waarom fout:** 1.645 is de z-waarde voor een **90%-BI**, niet 95%.\n\n**Voor 95%-BI:** z = **1.96** (qnorm(0.975)).")
            if (!is.na(v) && abs(v - 2.576) < 0.01)
              return("**Waarom fout:** 2.576 is de z-waarde voor een **99%-BI**, niet 95%.\n\n**Voor 95%-BI:** z = **1.96** (qnorm(0.975)).")
            "**z-waarde voor 95%-BI:** z = qnorm(0.975) = **1.96**"
          }

          wrong_msg_sigma <- function(val) {
            v <- parse_num(val)
            if (!is.na(v) && abs(v - 400) < 1)
              return("**Waarom fout:** Je gaf de foutenmarge E (400) als σ. σ staat in de opgave als **9000** (standaardafwijking jaarinkomen).")
            sprintf("**σ = %d** — rechtstreeks uit de opgave (standaardafwijking van het jaarinkomen).", as.integer(ev$sigma))
          }

          wrong_msg_E <- function(val) {
            v <- parse_num(val)
            if (!is.na(v) && abs(v - 9000) < 10)
              return("**Waarom fout:** Je gaf σ (9000) als foutenmarge E. E is de **maximale afwijking** die je toelaat: **400** euro.")
            sprintf("**E = %d** — rechtstreeks uit de opgave (maximale foutenmarge).", as.integer(ev$E))
          }

          wrong_msg_quotient <- function(val) {
            v <- parse_num(val)
            inv <- ev$E / (ev$z * ev$sigma)
            if (!is.na(v) && abs(v - inv) < 0.001)
              return(sprintf("**Waarom fout:** Je berekende E/(z×σ) = %d/(%.2f×%d) = %.5f (omgekeerde breuk).\n\n**Formule:** quotiënt = **z × σ / E** = %.2f × %d / %d = **%.4f**.", as.integer(ev$E), ev$z, as.integer(ev$sigma), inv, ev$z, as.integer(ev$sigma), as.integer(ev$E), ev$quotient))
            if (!is.na(v) && abs(v - ev$z * ev$sigma) < 1)
              return(sprintf("**Waarom fout:** Je berekende z × σ = %.2f × %d = %.1f maar vergat te delen door E.\n\n**Formule:** quotiënt = z × σ / **E** = %.2f × %d / %d = **%.4f**.", ev$z, as.integer(ev$sigma), ev$z * ev$sigma, ev$z, as.integer(ev$sigma), as.integer(ev$E), ev$quotient))
            sprintf("**Formule:** quotiënt = z × σ / E = %.2f × %d / %d = **%.4f**", ev$z, as.integer(ev$sigma), as.integer(ev$E), ev$quotient)
          }

          wrong_msg_n_raw <- function(val) {
            v <- parse_num(val)
            if (!is.na(v) && abs(v - ev$quotient) < 0.1)
              return(sprintf("**Waarom fout:** Je gaf het quotiënt (**%.4f**) als n, maar je moet het nog **kwadrateren**.\n\n**Stap:** n = quotiënt² = (%.4f)² = **%.2f**.", ev$quotient, ev$quotient, ev$n_raw))
            if (!is.na(v) && abs(v - sqrt(ev$n_raw)) < 0.1)
              return(sprintf("**Waarom fout:** Je nam de vierkantswortel, maar je moet het quotiënt **kwadrateren**.\n\n→ n = (%.4f)² = **%.2f**.", ev$quotient, ev$n_raw))
            sprintf("**n vóór afronding:** quotiënt² = (%.4f)² = **%.2f**", ev$quotient, ev$n_raw)
          }

          wrong_msg_n_min <- function(val) {
            v <- parse_num(val)
            floor_n <- floor(ev$n_raw)
            if (!is.na(v) && abs(v - floor_n) < 0.5)
              return(sprintf("**Waarom fout:** Je rondde **naar beneden af** (floor = %d), maar voor steekproefgrootte moet je **altijd naar boven afronden** (ceiling).\n\n**Reden:** n=%d zou een te grote foutenmarge geven. → n_min = ceiling(%.2f) = **%d**.", floor_n, floor_n, ev$n_raw, ev$n_min))
            sprintf("**n_minimum:** ceiling(%.2f) = **%d**  (altijd naar boven afronden voor voldoende nauwkeurigheid)", ev$n_raw, ev$n_min)
          }

          # ── labels + functies ──────────────────────────────────────────────────

          qnames <- c(
            z_waarde         = "z-waarde (95%-BI)",
            sigma            = "Standaardafwijking σ (€)",
            foutenmarge      = "Maximale foutenmarge E (€)",
            quotient         = "Quotiënt: z × σ / E",
            n_voor_afronding = "n vóór afronding",
            n_minimum        = "Minimale steekproefgrootte n (naar boven afgerond)"
          )

          wrong_fns <- list(
            z_waarde         = wrong_msg_z,
            sigma            = wrong_msg_sigma,
            foutenmarge      = wrong_msg_E,
            quotient         = wrong_msg_quotient,
            n_voor_afronding = wrong_msg_n_raw,
            n_minimum        = wrong_msg_n_min
          )

          correct_msgs <- list(
            z_waarde         = sprintf("z_95 = **%.2f** ✓", ev$z),
            sigma            = sprintf("σ = **%d** (gegeven) ✓", as.integer(ev$sigma)),
            foutenmarge      = sprintf("E = **%d** (gegeven) ✓", as.integer(ev$E)),
            quotient         = sprintf("%.2f × %d / %d = **%.4f** ✓", ev$z, as.integer(ev$sigma), as.integer(ev$E), ev$quotient),
            n_voor_afronding = sprintf("(%.4f)² = **%.2f** ✓", ev$quotient, ev$n_raw),
            n_minimum        = sprintf("ceiling(%.2f) = **%d** ✓", ev$n_raw, ev$n_min)
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