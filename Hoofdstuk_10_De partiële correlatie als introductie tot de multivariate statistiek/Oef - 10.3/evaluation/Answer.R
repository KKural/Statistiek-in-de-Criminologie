context({
  testcase(
    "Partiële correlatie — schoolbetrokkenheid en suppressorvariabele",
    {
      testEqual(
        "",
        function(env) {
          results <- list()

          # Given correlation table (n=85 adolescents)
          exp_r_XY <-  0.10   # Schoolbetrokkenheid vs Delinquentie
          exp_r_XZ <- -0.65   # Schoolbetrokkenheid vs Lage zelfcontrole
          exp_r_YZ <- -0.55   # Delinquentie vs Lage zelfcontrole

          # Partial correlation formula
          exp_r_XY_teller <- round(exp_r_XY - exp_r_XZ * exp_r_YZ, 4)
          exp_r_XY_noemer <- round(sqrt((1 - exp_r_XZ^2) * (1 - exp_r_YZ^2)), 4)
          exp_r_XY_Z      <- round(exp_r_XY_teller / exp_r_XY_noemer, 4)

          # Conclusion: r_XY goes from ~0.10 (trivial) to ~-0.41 (strong negative)
          # -> classic suppressor effect (type 3)
          exp_conclusie_type <- 3L

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
          results$r_XY_teller    <- check_val("r_XY_teller",    exp_r_XY_teller)
          results$r_XY_noemer    <- check_val("r_XY_noemer",    exp_r_XY_noemer)
          results$r_XY_Z         <- check_val("r_XY_Z",         exp_r_XY_Z)
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

          parse_num <- function(val) {
            if (is.character(val)) { val <- trimws(val); val <- gsub(",", ".", val, fixed=TRUE) }
            suppressWarnings(as.numeric(val))
          }

          # ── wrong_msg helpers ──────────────────────────────────────────────────

          wrong_msg_r_tbl <- function(val, var_label, exp_r, x_lbl, y_lbl) {
            v <- parse_num(val)
            if (!is.na(v) && abs(v - (-exp_r)) < 0.005)
              return(sprintf("**Waarom fout:** Je gaf het teken omgekeerd.\n\n**%s:** r(%s,%s) = **%.2f**.", var_label, x_lbl, y_lbl, exp_r))
            sprintf("**%s:** r(%s, %s) = **%.2f** (lees uit de correlatietabel).", var_label, x_lbl, y_lbl, exp_r)
          }

          wrong_msg_teller_103 <- function(val) {
            v <- parse_num(val)
            product <- ev$r_XZ * ev$r_YZ
            if (!is.na(v) && abs(v - ev$r_XY * product) < 0.01)
              return(sprintf("**Waarom fout:** Je berekende een product i.p.v. een aftrekking.\n\n**Teller** = r_XY **−** r_XZ × r_YZ = %.2f − (%.2f × %.2f) = **%.4f**.", ev$r_XY, ev$r_XZ, ev$r_YZ, ev$teller))
            if (!is.na(v) && abs(v - (ev$r_XY + ev$r_XZ * ev$r_YZ)) < 0.01)
              return(sprintf("**Waarom fout:** Je telde op in plaats van af te trekken.\n\n**Teller** = r_XY − r_XZ × r_YZ = %.2f **−** %.4f = **%.4f**.", ev$r_XY, product, ev$teller))
            sprintf("**Teller** = r_XY − r_XZ × r_YZ = %.2f − (%.2f × %.2f) = **%.4f**", ev$r_XY, ev$r_XZ, ev$r_YZ, ev$teller)
          }

          wrong_msg_noemer_103 <- function(val) {
            v <- parse_num(val)
            inside <- (1 - ev$r_XZ^2) * (1 - ev$r_YZ^2)
            if (!is.na(v) && abs(v - inside) < 0.01)
              return(sprintf("**Waarom fout:** Je gaf de waarde onder het wortelteken (%.4f). Neem nog **√**.\n\n**Noemer** = √%.4f = **%.4f**.", inside, inside, ev$noemer))
            if (!is.na(v) && abs(v - sqrt(1 - ev$r_XZ^2)) < 0.01)
              return(sprintf("**Waarom fout:** Je vergat de factor (1−r_YZ²).\n\n**Formule:** noemer = √((1−r_XZ²) × (1−r_YZ²)) = √(%.4f × %.4f) = **%.4f**.", 1-ev$r_XZ^2, 1-ev$r_YZ^2, ev$noemer))
            sprintf("**Noemer** = √((1−r_XZ²)(1−r_YZ²)) = √(%.4f × %.4f) = **%.4f**", 1-ev$r_XZ^2, 1-ev$r_YZ^2, ev$noemer)
          }

          wrong_msg_r_partial_103 <- function(val) {
            v <- parse_num(val)
            if (!is.na(v) && abs(v - ev$noemer / ev$teller) < 0.05)
              return(sprintf("**Waarom fout:** Je deelde noemer/teller (omgekeerd).\n\n**r_XY.Z** = teller / noemer = %.4f / %.4f = **%.4f**.", ev$teller, ev$noemer, ev$r_XY_Z))
            sprintf("**r_XY.Z** = teller / noemer = %.4f / %.4f = **%.4f**", ev$teller, ev$noemer, ev$r_XY_Z)
          }

          wrong_msg_conclusie_103 <- function(val) {
            v <- parse_num(val)
            if (!is.na(v) && v == 1)
              return(sprintf("**Optie 1 (schijnverband) is onjuist.** Bij een schijnverband daalt r_XY.Z naar ~0.\n\nHier neemt r_XY.Z toe tot **%.4f** (sterker) → dat is een **suppressoreffect** (code 3).", ev$r_XY_Z))
            if (!is.na(v) && v == 2)
              return(sprintf("**Optie 2 (indirect verband) is onjuist.** Bij indirect verband verzwakt |r|.\n\nHier gaat |r| van %.2f naar %.4f — **sterker** worden → **suppressoreffect** (code 3).", abs(ev$r_XY), abs(ev$r_XY_Z)))
            if (!is.na(v) && v == 4)
              return(sprintf("**Optie 4 (tekenwisseling) is onjuist.** Het teken draait hier niet om (%.2f en %.4f hebben hetzelfde teken).\n\nMaar |r| wordt sterker → **suppressoreffect** (code 3).", ev$r_XY, ev$r_XY_Z))
            sprintf("**Code 3 (suppressoreffect):** r_XY.Z=%.4f is sterker dan r_XY=%.2f.\n\nLage zelfcontrole (Z) maskeert het ware (negatieve) verband tussen schoolbetrokkenheid en delinquentie.", ev$r_XY_Z, ev$r_XY)
          }

          # ── labels + functies ──────────────────────────────────────────────────

          qnames <- c(
            r_XY           = "Bivariate correlatie r_XY (uit tabel)",
            r_XZ           = "Bivariate correlatie r_XZ (uit tabel)",
            r_YZ           = "Bivariate correlatie r_YZ (uit tabel)",
            r_XY_teller    = "Teller partiële correlatie",
            r_XY_noemer    = "Noemer partiële correlatie",
            r_XY_Z         = "Partiële correlatie r_XY.Z",
            conclusie_type = "Interpretatie (conclusie_type)"
          )

          wrong_fns <- list(
            r_XY           = function(v) wrong_msg_r_tbl(v, "r_XY", ev$r_XY, "Schoolbetrokkenheid", "Delinquentie"),
            r_XZ           = function(v) wrong_msg_r_tbl(v, "r_XZ", ev$r_XZ, "Schoolbetrokkenheid", "Lage zelfcontrole"),
            r_YZ           = function(v) wrong_msg_r_tbl(v, "r_YZ", ev$r_YZ, "Delinquentie", "Lage zelfcontrole"),
            r_XY_teller    = wrong_msg_teller_103,
            r_XY_noemer    = wrong_msg_noemer_103,
            r_XY_Z         = wrong_msg_r_partial_103,
            conclusie_type = wrong_msg_conclusie_103
          )

          correct_msgs <- list(
            r_XY           = sprintf("%.2f (uit tabel) ✓", ev$r_XY),
            r_XZ           = sprintf("%.2f (uit tabel) ✓", ev$r_XZ),
            r_YZ           = sprintf("%.2f (uit tabel) ✓", ev$r_YZ),
            r_XY_teller    = sprintf("%.4f ✓", ev$teller),
            r_XY_noemer    = sprintf("%.4f ✓", ev$noemer),
            r_XY_Z         = sprintf("%.4f ✓", ev$r_XY_Z),
            conclusie_type = sprintf("3 = suppressoreffect (r: %.2f → %.4f, sterker) ✓", ev$r_XY, ev$r_XY_Z)
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

context({
  testcase(
    "Steekproefgrootte — topsalarissen banksector",
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

          parse_num2 <- function(val) {
            if (is.character(val)) { val <- trimws(val); val <- gsub(",", ".", val, fixed=TRUE) }
            suppressWarnings(as.numeric(val))
          }

          wrong_msg_z2 <- function(val) {
            v <- parse_num2(val)
            if (!is.na(v) && abs(v - 1.645) < 0.01)
              return("**Waarom fout:** 1.645 is de z-waarde voor een **90%-BI**, niet 95%.\n\n**Voor 95%-BI:** z = **1.96**.")
            if (!is.na(v) && abs(v - 2.576) < 0.01)
              return("**Waarom fout:** 2.576 is de z-waarde voor een **99%-BI**, niet 95%.\n\n**Voor 95%-BI:** z = **1.96**.")
            "**z-waarde voor 95%-BI:** z = qnorm(0.975) = **1.96**"
          }

          wrong_msg_quotient2 <- function(val) {
            v <- parse_num2(val)
            inv <- ev$E / (ev$z * ev$sigma)
            if (!is.na(v) && abs(v - inv) < 0.001)
              return(sprintf("**Waarom fout:** Je berekende E/(z×σ) (omgekeerde breuk).\n\n**Formule:** quotiënt = **z × σ / E** = %.2f × %d / %d = **%.4f**.", ev$z, as.integer(ev$sigma), as.integer(ev$E), ev$quotient))
            if (!is.na(v) && abs(v - ev$z * ev$sigma) < 1)
              return(sprintf("**Waarom fout:** Je vergat te delen door E.\n\n**Formule:** quotiënt = z × σ / **E** = %.2f × %d / %d = **%.4f**.", ev$z, as.integer(ev$sigma), as.integer(ev$E), ev$quotient))
            sprintf("**Formule:** quotiënt = z × σ / E = %.2f × %d / %d = **%.4f**", ev$z, as.integer(ev$sigma), as.integer(ev$E), ev$quotient)
          }

          wrong_msg_n_raw2 <- function(val) {
            v <- parse_num2(val)
            if (!is.na(v) && abs(v - ev$quotient) < 0.1)
              return(sprintf("**Waarom fout:** Je gaf het quotiënt (%.4f) als n. Je moet het nog **kwadrateren**.\n\n→ n = (%.4f)² = **%.2f**.", ev$quotient, ev$quotient, ev$n_raw))
            sprintf("**n vóór afronding:** quotiënt² = (%.4f)² = **%.2f**", ev$quotient, ev$n_raw)
          }

          wrong_msg_n_min2 <- function(val) {
            v <- parse_num2(val)
            floor_n <- floor(ev$n_raw)
            if (!is.na(v) && abs(v - floor_n) < 0.5)
              return(sprintf("**Waarom fout:** Je rondde naar beneden af (floor=%d). Steekproefgrootte moet **altijd omhoog** afgerond worden.\n\n→ n_min = ceiling(%.2f) = **%d**.", floor_n, ev$n_raw, ev$n_min))
            sprintf("**n_minimum:** ceiling(%.2f) = **%d**", ev$n_raw, ev$n_min)
          }

          qnames <- c(
            z_waarde         = "z-waarde (95%-BI)",
            sigma            = "Standaardafwijking σ (€)",
            foutenmarge      = "Maximale foutenmarge E (€)",
            quotient         = "Quotiënt: z × σ / E",
            n_voor_afronding = "n vóór afronding",
            n_minimum        = "Minimale steekproefgrootte n (naar boven afgerond)"
          )

          wrong_fns2 <- list(
            z_waarde         = wrong_msg_z2,
            sigma            = function(v) sprintf("**σ = %d** (gegeven in de opgave).", as.integer(ev$sigma)),
            foutenmarge      = function(v) sprintf("**E = %d** (gegeven in de opgave).", as.integer(ev$E)),
            quotient         = wrong_msg_quotient2,
            n_voor_afronding = wrong_msg_n_raw2,
            n_minimum        = wrong_msg_n_min2
          )

          correct_msgs2 <- list(
            z_waarde         = sprintf("%.2f ✓", ev$z),
            sigma            = sprintf("%d ✓", as.integer(ev$sigma)),
            foutenmarge      = sprintf("%d ✓", as.integer(ev$E)),
            quotient         = sprintf("%.4f ✓", ev$quotient),
            n_voor_afronding = sprintf("%.2f ✓", ev$n_raw),
            n_minimum        = sprintf("%d ✓", ev$n_min)
          )

          lines <- character(0)
          score <- 0
          total <- length(qnames)

          for (key in names(qnames)) {
            r   <- results[[key]]
            lbl <- qnames[[key]]
            if (!r$exists) {
              lines <- c(lines, paste0("❌ **", lbl, "** — variabele `", key, "` niet ingevuld.\n\n",
                wrong_fns2[[key]]("?"), "\n"))
            } else if (r$correct) {
              lines <- c(lines, paste0("✅ **", lbl, "**: correct (", as.character(r$value),
                ") — ", correct_msgs2[[key]], "\n"))
              score <- score + 1
            } else {
              lines <- c(lines, paste0("❌ **", lbl, "** — jouw antwoord: **", as.character(r$value),
                "**\n\n", wrong_fns2[[key]](r$value), "\n"))
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