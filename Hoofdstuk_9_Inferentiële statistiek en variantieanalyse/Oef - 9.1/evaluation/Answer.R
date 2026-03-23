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

          parse_num <- function(val) {
            if (is.character(val)) { val <- trimws(val); val <- gsub(",", ".", val, fixed=TRUE) }
            suppressWarnings(as.numeric(val))
          }

          # ── wrong_msg helpers ──────────────────────────────────────────────────

          wrong_msg_H0 <- function(val) {
            v <- parse_num(val)
            if (!is.na(v) && v == 2)
              return("**Waarom fout:** Code 2 staat voor 'er IS een verband' — dat is de **alternatieve hypothese (Hₐ)**, niet H₀.\n\n**Onthoud:** H₀ is altijd de 'niets-aan-de-hand'-stelling → code **1** = geen verband (onafhankelijkheid).")
            "**Correcte code:** 1 = H₀: er is **geen** verband tussen beleidsmaker en rechtvaardigingstype."
          }

          wrong_msg_E_opl_prem <- function(val) {
            v <- parse_num(val)
            if (!is.na(v) && abs(v - 22) < 0.5)
              return("**Waarom fout:** Je gaf het **rijtotaal** (22), niet de verwachte frequentie.\n\n**Formule:** E = rijtotaal × kolomtotaal / N\n\n**Stap:** E₁₁ = 22 × 25 / 100 = **5.5** — je deelde nog niet door N.")
            if (!is.na(v) && abs(v - 25) < 0.5)
              return("**Waarom fout:** Je gaf het **kolomtotaal** (25), niet de verwachte frequentie.\n\n**Formule:** E = 22 × 25 / 100 = **5.5** — je miste de deling door N=100.")
            if (!is.na(v) && abs(v - 6) < 0.5)
              return("**Waarom fout:** Je gaf de **geobserveerde** frequentie (O=6), niet de **verwachte** (E).\n\n**Verwachte freq.:** E = rijtotaal × kolomtotaal / N = 22 × 25 / 100 = **5.5**.")
            "**Formule:** E = (rijtotaal × kolomtotaal) / N\n\n**Stap:** rijtotaal 'Opsluiting' = 22, kolomtotaal 'Premier' = 25, N = 100\n\n→ E₁₁ = 22 × 25 / 100 = **5.5**"
          }

          wrong_msg_E_bet_prem <- function(val) {
            v <- parse_num(val)
            if (!is.na(v) && abs(v - 23) < 0.5)
              return("**Waarom fout:** Je gaf het **rijtotaal** van 'Gedwongen betaling' (23), niet de verwachte freq.\n\n**Berekening:** E = 23 × 25 / 100 = **5.75**.")
            if (!is.na(v) && abs(v - 13) < 0.5)
              return("**Waarom fout:** Je gaf de **geobserveerde** freq. (O=13), niet de verwachte.\n\n**E = 23 × 25 / 100 = 5.75**.")
            if (!is.na(v) && abs(v - 17.25) < 0.3)
              return("**Waarom fout:** Je berekende de verwachte freq. voor de **Minister BZ**-kolom (23×75/100=17.25), niet de **Premier**-kolom.\n\n**Premier-kolom:** E = 23 × **25** / 100 = **5.75**.")
            "**Formule:** E = (rijtotaal × kolomtotaal) / N\n\n**'Gedwongen betaling' + 'Premier':** E = 23 × 25 / 100 = **5.75**"
          }

          wrong_msg_E_reh_min <- function(val) {
            v <- parse_num(val)
            if (!is.na(v) && abs(v - 15) < 0.5)
              return("**Waarom fout:** Je gaf het **rijtotaal** van 'Rehabilitatie' (15), niet de verwachte freq.\n\n**Berekening:** E = 15 × 75 / 100 = **11.25**.")
            if (!is.na(v) && abs(v - 0) < 0.3)
              return("**Waarom fout:** Je gaf de **geobserveerde** freq. (O=0), niet de verwachte.\n\n**De verwachte freq. kan nooit 0 zijn** als rij- en kolomtotalen > 0.\n\n**E = 15 × 75 / 100 = 11.25**.")
            if (!is.na(v) && abs(v - 3.75) < 0.3)
              return("**Waarom fout:** Je berekende de verwachte freq. voor de **Premier**-kolom (15×25/100=3.75), niet **Minister BZ**.\n\n**Minister BZ-kolom:** E = 15 × **75** / 100 = **11.25**.")
            "**Formule:** E = (rijtotaal × kolomtotaal) / N\n\n**'Rehabilitatie' + 'Minister BZ':** E = 15 × 75 / 100 = **11.25**"
          }

          wrong_msg_chi2 <- function(val) {
            v <- parse_num(val)
            if (!is.na(v) && !is.na(ev$chi2) && abs(v - ev$chi2) < 3 && abs(v - ev$chi2) > 0.5)
              return(sprintf("**Bijna correct!** Jouw waarde (%.3f) is dicht bij het correcte antwoord (%.3f).\n\n**Tip:** Gebruik minstens 4 decimalen bij tussenstappen (verwachte freq.).", v, ev$chi2))
            if (!is.na(v) && v < 5)
              return(sprintf("**Te laag (%s)** — controleer of je **alle 10 cellen** (5 rijen × 2 kolommen) meename.\n\n**De 10 bijdragen (O−E)²/E:**\n- Opsluiting: (6−5.5)²/5.5=**0.045** | (16−16.5)²/16.5=**0.015**\n- Spec.afschr.: (2−4)²/4=**1.000** | (14−12)²/12=**0.333**\n- Alg.afschr.: (4−6)²/6=**0.667** | (20−18)²/18=**0.222**\n- Rehabilitatie: (0−3.75)²/3.75=**3.750** | (15−11.25)²/11.25=**1.250**\n- Gedw.betaling: (13−5.75)²/5.75=**9.141** | (10−17.25)²/17.25=**3.047**\n\nSom = **%.3f**", val, ev$chi2))
            sprintf("**Stap-voor-stap (alle 10 cellen):**\n\n| Categorie | O_P | O_M | E_P | E_M | (O−E)²/E_P | (O−E)²/E_M |\n|---|---|---|---|---|---|---|\n| Opsluiting | 6 | 16 | 5.50 | 16.50 | 0.045 | 0.015 |\n| Spec.afschr. | 2 | 14 | 4.00 | 12.00 | 1.000 | 0.333 |\n| Alg.afschr. | 4 | 20 | 6.00 | 18.00 | 0.667 | 0.222 |\n| Rehabilitatie | 0 | 15 | 3.75 | 11.25 | 3.750 | 1.250 |\n| Gedw.betaling | 13 | 10 | 5.75 | 17.25 | 9.141 | 3.047 |\n\n**χ² = %.3f**", ev$chi2)
          }

          wrong_msg_df <- function(val) {
            v <- parse_num(val)
            if (!is.na(v) && abs(v - 10) < 0.5)
              return("**Waarom fout:** Je gaf 10 = het **totale aantal cellen** (5×2), maar df = (rijen−1)×(kolommen−1).\n\n**Formule:** df = (5−1)(2−1) = 4×1 = **4**.")
            if (!is.na(v) && abs(v - 5) < 0.5)
              return("**Waarom fout:** Je gaf het **aantal rijen** (5), maar vrijheidsgraden vereisen een aftrekking.\n\n**Formule:** df = (r−1)(k−1) = (5−1)(2−1) = **4**.")
            if (!is.na(v) && abs(v - 8) < 0.5)
              return("**Waarom fout:** 8 = (5−1)×2 — je paste (k−1) niet toe op de kolommen.\n\n**Formule:** df = (r−1)×**(k−1)** = 4×**1** = **4**.")
            "**Formule:** df = (rijen−1) × (kolommen−1) = (5−1) × (2−1) = 4 × 1 = **4**"
          }

          wrong_msg_krit005 <- function(val) {
            v <- parse_num(val)
            if (!is.na(v) && abs(v - 7.815) < 0.01)
              return("**Waarom fout:** 7.815 is de kritieke waarde bij **df=3**, niet df=4.\n\n**Bij df=4, α=0.05:** χ²_krit = **9.488** (qchisq(0.95, df=4)).")
            if (!is.na(v) && abs(v - 11.070) < 0.01)
              return("**Waarom fout:** 11.070 is de kritieke waarde bij **df=5**, niet df=4.\n\n**Bij df=4, α=0.05:** χ²_krit = **9.488**.")
            if (!is.na(v) && !is.na(ev$kritiek_001) && abs(v - ev$kritiek_001) < 0.01)
              return(sprintf("**Waarom fout:** %.3f is de kritieke waarde bij **α=0.01** (niet 0.05).\n\n**Bij α=0.05, df=4:** χ²_krit = **%.3f**.", ev$kritiek_001, ev$kritiek_005))
            sprintf("**Kritieke waarde** χ² bij α=0.05 en df=4:\n\n→ qchisq(0.95, df=4) = **%.3f**", ev$kritiek_005)
          }

          wrong_msg_sig005 <- function(val) {
            v <- parse_num(val)
            if (!is.na(v) && v == 2)
              return(sprintf("**Waarom fout:** Je antwoordde 'nee' (code 2 = niet significant).\n\n**Vergelijk:** χ²=%.3f > kritieke waarde %.3f bij α=0.05 → **WEL significant** → code **1** (ja).", ev$chi2, ev$kritiek_005))
            sprintf("**Vergelijk:** χ²=%.3f vs. kritieke waarde=%.3f → χ² is **groter** → significant → code **1** (ja).", ev$chi2, ev$kritiek_005)
          }

          wrong_msg_krit001 <- function(val) {
            v <- parse_num(val)
            if (!is.na(v) && !is.na(ev$kritiek_005) && abs(v - ev$kritiek_005) < 0.01)
              return(sprintf("**Waarom fout:** %.3f is de kritieke waarde bij **α=0.05** (niet 0.01).\n\n**Bij α=0.01, df=4:** χ²_krit = **%.3f**.", ev$kritiek_005, ev$kritiek_001))
            if (!is.na(v) && abs(v - 11.345) < 0.01)
              return("**Waarom fout:** 11.345 is de kritieke waarde bij df=3, α=0.01.\n\n**Bij df=4, α=0.01:** χ²_krit = **13.277**.")
            sprintf("**Kritieke waarde** χ² bij α=0.01 en df=4:\n\n→ qchisq(0.99, df=4) = **%.3f**", ev$kritiek_001)
          }

          wrong_msg_sig001 <- function(val) {
            v <- parse_num(val)
            if (!is.na(v) && v == 2)
              return(sprintf("**Waarom fout:** Je antwoordde 'nee' (code 2 = niet significant bij α=0.01).\n\n**Vergelijk:** χ²=%.3f > kritieke waarde %.3f ook bij α=0.01 → **WEL significant** → code **1** (ja).", ev$chi2, ev$kritiek_001))
            sprintf("**Vergelijk:** χ²=%.3f vs. kritieke waarde=%.3f → ook bij α=0.01 **significant** → code **1** (ja).", ev$chi2, ev$kritiek_001)
          }

          # ── labels + functies ──────────────────────────────────────────────────

          qnames <- c(
            H0_richting          = "H₀: richting nulhypothese",
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

          wrong_fns <- list(
            H0_richting          = wrong_msg_H0,
            E_opsluiting_premier = wrong_msg_E_opl_prem,
            E_betaling_premier   = wrong_msg_E_bet_prem,
            E_rehab_minister     = wrong_msg_E_reh_min,
            chi_kwadraat         = wrong_msg_chi2,
            df_chi               = wrong_msg_df,
            kritieke_waarde_005  = wrong_msg_krit005,
            significant_005      = wrong_msg_sig005,
            kritieke_waarde_001  = wrong_msg_krit001,
            significant_001      = wrong_msg_sig001
          )

          correct_msgs <- list(
            H0_richting          = "H₀ = geen verband (onafhankelijkheid). Elke chi-kwadraattoets start met deze H₀.",
            E_opsluiting_premier = "E = rijtotaal × kolomtotaal / N = 22 × 25 / 100 = **5.5** ✓",
            E_betaling_premier   = "E = 23 × 25 / 100 = **5.75** ✓",
            E_rehab_minister     = "E = 15 × 75 / 100 = **11.25** ✓",
            chi_kwadraat         = sprintf("χ² = Σ(O−E)²/E over alle 10 cellen = **%.3f** ✓", ev$chi2),
            df_chi               = sprintf("df = (5−1)(2−1) = **%d** ✓", ev$df),
            kritieke_waarde_005  = sprintf("qchisq(0.95, df=4) = **%.3f** ✓", ev$kritiek_005),
            significant_005      = sprintf("χ²=%.3f > %.3f → significant ✓", ev$chi2, ev$kritiek_005),
            kritieke_waarde_001  = sprintf("qchisq(0.99, df=4) = **%.3f** ✓", ev$kritiek_001),
            significant_001      = sprintf("χ²=%.3f > %.3f → ook bij α=0.01 significant ✓", ev$chi2, ev$kritiek_001)
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