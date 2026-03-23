context({
  testcase(
    "Partiële correlatie — interpretatie van controlevariabelen",
    {
      testEqual(
        "",
        function(env) {
          results <- list()

          # Scenario A: r_XY=0.62 -> r_XY.Z=0.07 -> spurious (type 1)
          exp_conclusie_A <- 1L

          # Scenario B: r_XY=0.38 -> r_XY.Z=0.21 -> indirect/partial (type 2)
          exp_conclusie_B <- 2L

          # Scenario C: r_XY=-0.12 -> r_XY.Z=-0.53 -> suppressor (type 3)
          exp_conclusie_C <- 3L

          parse_num <- function(val) {
            if (is.character(val)) {
              val <- trimws(val)
              val <- gsub(",", ".", val, fixed = TRUE)
              val <- gsub("%", "", val, fixed = TRUE)
            }
            suppressWarnings(as.numeric(val))
          }

          check_val <- function(varname, expected, tol = 0) {
            if (!exists(varname, envir = env)) {
              return(list(exists = FALSE, value = NA, correct = FALSE, expected = expected))
            }
            raw <- get(varname, envir = env)
            num <- parse_num(raw)
            ok  <- !is.na(num) && abs(num - expected) <= tol
            list(exists = TRUE, value = raw, value_num = num, correct = ok, expected = expected)
          }

          results$conclusie_A <- check_val("conclusie_A", exp_conclusie_A)
          results$conclusie_B <- check_val("conclusie_B", exp_conclusie_B)
          results$conclusie_C <- check_val("conclusie_C", exp_conclusie_C)

          assign("detailed_results", results, envir = globalenv())

          all(sapply(results, function(x) x$correct))
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("detailed_results", envir = globalenv())

          qnames <- c(
            conclusie_A = "Scenario A: Grootte school vs. pestgedrag (controle SES wijk)",
            conclusie_B = "Scenario B: Alcoholgebruik vs. agressief gedrag (controle stress)",
            conclusie_C = "Scenario C: Rehabilitatie vs. recidive (controle motivatie)"
          )

          parse_num <- function(val) {
            if (is.character(val)) { val <- trimws(val); val <- gsub(",", ".", val, fixed=TRUE) }
            suppressWarnings(as.numeric(val))
          }

          # ── wrong_msg helpers ──────────────────────────────────────────────────

          wrong_msg_A <- function(val) {
            v <- parse_num(val)
            if (!is.na(v) && v == 2) return("**Optie 2 (indirect verband) is onjuist.** Bij indirect verband daalt |r| deels maar blijft er een betekenisvol verband.\n\nHier daalt r van 0.62 naar **0.07** (bijna nul) → het verband verdwijnt bijna volledig → code **1** (schijnverband).")
            if (!is.na(v) && v == 3) return("**Optie 3 (suppressoreffect) is onjuist.** Een suppressoreffect vergroot |r|.\n\nHier krimpt r van 0.62 naar 0.07 → het verband verdwijnt bijna → code **1** (schijnverband).")
            if (!is.na(v) && v == 4) return("**Optie 4 (reëlëel verband) is onjuist.** Een reëlëel verband verandert nauwelijks na controle.\n\nHier daalt r van 0.62 naar 0.07 → bijna nul na controle → code **1** (schijnverband).")
            "**Correct (1 = schijnverband):** r_XY=0.62 daalt naar r_XY.Z=0.07 na controle voor SES.\n\nHet verband was volledig te wijten aan de gemeenschappelijke factor SES van de wijk."
          }

          wrong_msg_B <- function(val) {
            v <- parse_num(val)
            if (!is.na(v) && v == 1) return("**Optie 1 (schijnverband) is onjuist.** Bij een schijnverband daalt r naar ~0.\n\nHier daalt r van 0.38 naar 0.21 — het verband **verzwakt** maar blijft → code **2** (indirect verband).")
            if (!is.na(v) && v == 3) return("**Optie 3 (suppressoreffect) is onjuist.** Een suppressoreffect vergroot |r|.\n\nHier wordt r kleiner (0.38 → 0.21) → code **2** (indirect verband).")
            if (!is.na(v) && v == 4) return("**Optie 4 (reëlëel verband) is onjuist.** Een reëlëel verband verandert nauwelijks.\n\nHier daalt r van 0.38 naar 0.21 (significante daling) → stress medieert het verband deels → code **2** (indirect verband).")
            "**Correct (2 = indirect verband):** r_XY=0.38 daalt naar r_XY.Z=0.21 na controle voor stress.\n\nStress medieert het verband: deel van het alcoholgebruik-effect loopt via stress."
          }

          wrong_msg_C <- function(val) {
            v <- parse_num(val)
            if (!is.na(v) && v == 1) return("**Optie 1 (schijnverband) is onjuist.** Bij een schijnverband daalt |r| naar ~0.\n\nHier wordt |r| groter: van |−0.12|=0.12 naar |−0.53|=0.53 → het verband versterkt na controle → code **3** (suppressoreffect).")
            if (!is.na(v) && v == 2) return("**Optie 2 (indirect verband) is onjuist.** Bij indirect verband verzwakt |r|.\n\nHier gaat |r| van 0.12 naar 0.53 — het verband **versterkt** na controle → code **3** (suppressoreffect).")
            if (!is.na(v) && v == 4) return("**Optie 4 (reëlëel verband) is onjuist.** Een reëlëel verband verandert nauwelijks.\n\nHier gaat |r| van 0.12 naar 0.53 (enorm sterker) → code **3** (suppressoreffect).")
            "**Correct (3 = suppressoreffect):** r_XY=−0.12 wordt r_XY.Z=−0.53 na controle voor motivatie.\n\nMotivatieniveau maskeerde het ware sterkere (negatieve) verband tussen rehabilitatie en recidive."
          }

          # ── labels + functies ──────────────────────────────────────────────────

          qnames <- c(
            conclusie_A = "Scenario A: Grootte school vs. pestgedrag (controle SES wijk)",
            conclusie_B = "Scenario B: Alcoholgebruik vs. agressief gedrag (controle stress)",
            conclusie_C = "Scenario C: Rehabilitatie vs. recidive (controle motivatie)"
          )

          wrong_fns <- list(
            conclusie_A = wrong_msg_A,
            conclusie_B = wrong_msg_B,
            conclusie_C = wrong_msg_C
          )

          correct_msgs <- list(
            conclusie_A = "1 = schijnverband (r: 0.62 → 0.07, na controle voor SES bijna nul) ✓",
            conclusie_B = "2 = indirect verband (r: 0.38 → 0.21, verzwakt maar blijft) ✓",
            conclusie_C = "3 = suppressoreffect (r: −0.12 → −0.53, versterkt na controle) ✓"
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
    "ANOVA — variantieanalyse: misdaadcijfers per gemeentetype",
    {
      testEqual(
        "",
        function(env) {
          results <- list()

          # Data
          groot  <- c(3500, 2700, 2900, 3200, 3150, 3300, 2650, 4000, 3500, 3000)
          middel <- c(1850, 1650, 1450, 1600, 1550, 1800, 1400, 1750, 1250, 1500)
          ruraal <- c(400,  450,  500,  550,  390,  530,  410,  440,  570,  600)

          n_per_group <- 10
          k           <- 3
          N           <- n_per_group * k  # 30

          # Group means
          exp_mean_groot  <- mean(groot)   # 3190
          exp_mean_middel <- mean(middel)  # 1580
          exp_mean_ruraal <- mean(ruraal)  # 484

          all_vals  <- c(groot, middel, ruraal)
          exp_grand <- mean(all_vals)      # 1751.333

          # SS within per group
          SS_g <- function(x) sum((x - mean(x))^2)
          exp_SS_w_groot  <- SS_g(groot)   # 1514000
          exp_SS_w_middel <- SS_g(middel)  # 321000
          exp_SS_w_ruraal <- SS_g(ruraal)  # 52040

          exp_SS_within <- exp_SS_w_groot + exp_SS_w_middel + exp_SS_w_ruraal  # 1887040
          exp_df_within <- N - k                                                  # 27
          exp_MS_within <- exp_SS_within / exp_df_within

          # SS between
          groups      <- list(groot = groot, middel = middel, ruraal = ruraal)
          exp_SS_between <- sum(sapply(groups, function(g)
            n_per_group * (mean(g) - exp_grand)^2
          ))
          exp_df_between <- k - 1                                                 # 2
          exp_MS_between <- exp_SS_between / exp_df_between

          # F and eta^2
          exp_F        <- exp_MS_between / exp_MS_within
          exp_SS_total <- exp_SS_within + exp_SS_between
          exp_eta2     <- exp_SS_between / exp_SS_total
          exp_sig      <- 1  # ja, significant (F >> 3.35)

          parse_num <- function(val) {
            if (is.character(val)) {
              val <- trimws(val)
              val <- gsub(",", ".", val, fixed = TRUE)
            }
            suppressWarnings(as.numeric(val))
          }

          check_val <- function(varname, expected, tol = 1) {
            if (!exists(varname, envir = env)) {
              return(list(exists = FALSE, value = NA, correct = FALSE, expected = expected))
            }
            raw <- get(varname, envir = env)
            num <- parse_num(raw)
            ok  <- !is.na(num) && abs(num - expected) <= tol
            list(exists = TRUE, value = raw, value_num = num, correct = ok, expected = expected)
          }

          results$gemiddelde_groot  <- check_val("gemiddelde_groot",  exp_mean_groot,    tol = 0)
          results$gemiddelde_middel <- check_val("gemiddelde_middel", exp_mean_middel,   tol = 0)
          results$gemiddelde_ruraal <- check_val("gemiddelde_ruraal", exp_mean_ruraal,   tol = 0)
          results$grand_mean        <- check_val("grand_mean",        exp_grand,         tol = 0.1)
          results$SS_within_groot   <- check_val("SS_within_groot",   exp_SS_w_groot,    tol = 50)
          results$SS_within_middel  <- check_val("SS_within_middel",  exp_SS_w_middel,   tol = 50)
          results$SS_within_ruraal  <- check_val("SS_within_ruraal",  exp_SS_w_ruraal,   tol = 50)
          results$SS_within         <- check_val("SS_within",         exp_SS_within,     tol = 100)
          results$df_within         <- check_val("df_within",         exp_df_within,     tol = 0)
          results$MS_within         <- check_val("MS_within",         exp_MS_within,     tol = 50)
          results$SS_between        <- check_val("SS_between",        exp_SS_between,    tol = 500)
          results$df_between        <- check_val("df_between",        exp_df_between,    tol = 0)
          results$MS_between        <- check_val("MS_between",        exp_MS_between,    tol = 500)
          results$F_ratio           <- check_val("F_ratio",           exp_F,             tol = 5)
          results$eta_kwadraat      <- check_val("eta_kwadraat",      exp_eta2,          tol = 0.005)
          results$significant_anova <- check_val("significant_anova", exp_sig,           tol = 0)

          assign("detailed_results", results, envir = globalenv())
          assign("expected_vals", list(
            mean_groot = exp_mean_groot, mean_middel = exp_mean_middel,
            mean_ruraal = exp_mean_ruraal, grand = exp_grand,
            SS_w_groot = exp_SS_w_groot, SS_w_middel = exp_SS_w_middel,
            SS_w_ruraal = exp_SS_w_ruraal, SS_within = exp_SS_within,
            df_within = exp_df_within, MS_within = exp_MS_within,
            SS_between = exp_SS_between, df_between = exp_df_between,
            MS_between = exp_MS_between, F = exp_F,
            eta2 = exp_eta2
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

          # ── wrong_msg helpers (ANOVA) ─────────────────────────────────────────

          wrong_msg_mean2 <- function(val, gn, exp_mean, data_str) {
            sprintf("**Gemiddelde %s** = (%s) / 10 = **%.0f**\n\nJouw antwoord: %s", gn, data_str, exp_mean, val)
          }

          wrong_msg_grand2 <- function(val) {
            sprintf("**Grand mean** = som van alle 30 waarden / 30\n\n→ (%.0f×10 + %.0f×10 + %.0f×10) / 30 = **%.3f**", ev$mean_groot, ev$mean_middel, ev$mean_ruraal, ev$grand)
          }

          wrong_msg_SS_within_g2 <- function(val, gn, exp_SS, exp_mean) {
            v <- parse_num2(val)
            if (!is.na(v) && !is.na(exp_SS) && abs(v - exp_SS/9) < 50)
              return(sprintf("**Waarom fout:** Je gaf de variantie (SS/9≈%.0f).  **SS_within_%s** = Σ(xᵢ − x̄_%s)² = **%d** (niet delen!)", exp_SS/9, gn, gn, as.integer(exp_SS)))
            sprintf("**SS_within_%s** = Σ(xᵢ − x̄_%s)² = Σ(xᵢ − %.0f)² = **%d**", gn, gn, exp_mean, as.integer(exp_SS))
          }

          wrong_msg_SSw_total2 <- function(val) {
            v <- parse_num2(val)
            if (!is.na(v) && !is.na(ev$SS_within) && abs(v - ev$SS_within/ev$df_within) < 100)
              return(sprintf("**Waarom fout:** Je gaf MS_within (SS/df≈%.0f) als SS_within.\n\n**SS_within** = %d + %d + %d = **%d**.", ev$SS_within/ev$df_within, as.integer(ev$SS_w_groot), as.integer(ev$SS_w_middel), as.integer(ev$SS_w_ruraal), as.integer(ev$SS_within)))
            sprintf("**SS_within** = SS_groot + SS_middel + SS_ruraal = %d + %d + %d = **%d**", as.integer(ev$SS_w_groot), as.integer(ev$SS_w_middel), as.integer(ev$SS_w_ruraal), as.integer(ev$SS_within))
          }

          wrong_msg_dfw2 <- function(val) {
            v <- parse_num2(val)
            if (!is.na(v) && abs(v - 30) < 0.5)
              return("**Waarom fout:** df_within = N − k = 30 − 3 = **27** (niet N=30).")
            "**df_within** = N − k = 30 − 3 = **27**"
          }

          wrong_msg_MSw2 <- function(val) {
            v <- parse_num2(val)
            if (!is.na(v) && !is.na(ev$SS_within) && abs(v - ev$SS_within) < 200)
              return(sprintf("**Waarom fout:** Je gaf SS_within (%d) als MS_within. **MS = SS/df.**\n\n**MS_within** = %d/%d = **%.2f**.", as.integer(ev$SS_within), as.integer(ev$SS_within), as.integer(ev$df_within), ev$MS_within))
            sprintf("**MS_within** = SS_within / df_within = %d / %d = **%.2f**", as.integer(ev$SS_within), as.integer(ev$df_within), ev$MS_within)
          }

          wrong_msg_SSb2 <- function(val) {
            v <- parse_num2(val)
            if (!is.na(v) && !is.na(ev$SS_between) && abs(v - ev$SS_between/10) < 5000)
              return(sprintf("**Waarom fout:** Je vergat te vermenigvuldigen met n=10.\n\n**SS_between** = Σ **n** × (x̄_groep − grand mean)² = **%.0f**.", ev$SS_between))
            sprintf("**SS_between** = Σ nⱼ(x̄ⱼ − grand mean)²\n\n= 10×(%.0f−%.3f)² + 10×(%.0f−%.3f)² + 10×(%.0f−%.3f)² = **%.0f**",
              ev$mean_groot, ev$grand, ev$mean_middel, ev$grand, ev$mean_ruraal, ev$grand, ev$SS_between)
          }

          wrong_msg_dfb2 <- function(val) {
            v <- parse_num2(val)
            if (!is.na(v) && abs(v - 3) < 0.5)
              return("**Waarom fout:** df_between = k − 1 = 3 − 1 = **2** (niet k=3).")
            "**df_between** = k − 1 = 3 − 1 = **2**"
          }

          wrong_msg_MSb2 <- function(val) {
            v <- parse_num2(val)
            if (!is.na(v) && !is.na(ev$SS_between) && abs(v - ev$SS_between) < 5000)
              return(sprintf("**Waarom fout:** Je gaf SS_between als MS_between. **MS = SS/df.**\n\n**MS_between** = %.0f/2 = **%.2f**.", ev$SS_between, ev$MS_between))
            sprintf("**MS_between** = SS_between / df_between = %.0f / 2 = **%.2f**", ev$SS_between, ev$MS_between)
          }

          wrong_msg_F2 <- function(val) {
            v <- parse_num2(val)
            if (!is.na(v) && !is.na(ev$F) && abs(v - ev$MS_within/ev$MS_between) < 1)
              return(sprintf("**Waarom fout:** Je deelde MS_within/MS_between (omgekeerd).\n\n**F** = **MS_between** / MS_within = %.2f / %.2f = **%.2f**.", ev$MS_between, ev$MS_within, ev$F))
            sprintf("**F-ratio** = MS_between / MS_within = %.2f / %.2f = **%.2f**", ev$MS_between, ev$MS_within, ev$F)
          }

          wrong_msg_eta2_2 <- function(val) {
            v <- parse_num2(val)
            SS_tot <- ev$SS_within + ev$SS_between
            if (!is.na(v) && !is.na(ev$SS_between) && abs(v - ev$SS_between/ev$SS_within) < 0.05)
              return(sprintf("**Waarom fout:** Je deelde door SS_within. **η² = SS_between / SS_totaal** (niet SS_within).\n\nSS_totaal = %.0f + %.0f = %.0f\n\n→ η² = %.0f / %.0f = **%.4f**.", ev$SS_within, ev$SS_between, SS_tot, ev$SS_between, SS_tot, ev$eta2))
            sprintf("η² = SS_between / SS_totaal = %.0f / %.0f = **%.4f**", ev$SS_between, SS_tot, ev$eta2)
          }

          wrong_msg_sig2 <- function(val) {
            v <- parse_num2(val)
            if (!is.na(v) && v == 2)
              return(sprintf("**Waarom fout:** F=%.2f is **veel groter** dan de kritieke waarde (≈3.35 bij df=2,27, α=0.05) → **significant** → code **1** (ja).", ev$F))
            sprintf("F=%.2f >> 3.35 (kritieke F bij df=2,27, α=0.05) → significant → code **1** (ja).", ev$F)
          }

          # ── labels + functies ──────────────────────────────────────────────────

          qnames <- c(
            gemiddelde_groot  = "Gemiddelde Grootsteden",
            gemiddelde_middel = "Gemiddelde Middelgrote steden",
            gemiddelde_ruraal = "Gemiddelde Rurale gemeenten",
            grand_mean        = "Grand mean (alle 30 gemeenten)",
            SS_within_groot   = "SS within Grootsteden",
            SS_within_middel  = "SS within Middelgrote steden",
            SS_within_ruraal  = "SS within Rurale gemeenten",
            SS_within         = "Totale SS within",
            df_within         = "df within",
            MS_within         = "MS within",
            SS_between        = "SS between",
            df_between        = "df between",
            MS_between        = "MS between",
            F_ratio           = "F-ratio",
            eta_kwadraat      = "η² (eta-kwadraat)",
            significant_anova = "Statistisch significant bij α = 0.05? (1=ja)"
          )

          wrong_fns <- list(
            gemiddelde_groot  = function(v) wrong_msg_mean2(v, "grootsteden",  ev$mean_groot,  "3500+2700+2900+3200+3150+3300+2650+4000+3500+3000"),
            gemiddelde_middel = function(v) wrong_msg_mean2(v, "middelgrote",  ev$mean_middel, "1850+1650+1450+1600+1550+1800+1400+1750+1250+1500"),
            gemiddelde_ruraal = function(v) wrong_msg_mean2(v, "ruraal",       ev$mean_ruraal, "400+450+500+550+390+530+410+440+570+600"),
            grand_mean        = wrong_msg_grand2,
            SS_within_groot   = function(v) wrong_msg_SS_within_g2(v, "groot",  ev$SS_w_groot,  ev$mean_groot),
            SS_within_middel  = function(v) wrong_msg_SS_within_g2(v, "middel", ev$SS_w_middel, ev$mean_middel),
            SS_within_ruraal  = function(v) wrong_msg_SS_within_g2(v, "ruraal", ev$SS_w_ruraal, ev$mean_ruraal),
            SS_within         = wrong_msg_SSw_total2,
            df_within         = wrong_msg_dfw2,
            MS_within         = wrong_msg_MSw2,
            SS_between        = wrong_msg_SSb2,
            df_between        = wrong_msg_dfb2,
            MS_between        = wrong_msg_MSb2,
            F_ratio           = wrong_msg_F2,
            eta_kwadraat      = wrong_msg_eta2_2,
            significant_anova = wrong_msg_sig2
          )

          SS_tot_v <- ev$SS_within + ev$SS_between
          correct_msgs <- list(
            gemiddelde_groot  = sprintf("%.0f ✓", ev$mean_groot),
            gemiddelde_middel = sprintf("%.0f ✓", ev$mean_middel),
            gemiddelde_ruraal = sprintf("%.0f ✓", ev$mean_ruraal),
            grand_mean        = sprintf("%.3f ✓", ev$grand),
            SS_within_groot   = sprintf("%d ✓", as.integer(ev$SS_w_groot)),
            SS_within_middel  = sprintf("%d ✓", as.integer(ev$SS_w_middel)),
            SS_within_ruraal  = sprintf("%d ✓", as.integer(ev$SS_w_ruraal)),
            SS_within         = sprintf("%d ✓", as.integer(ev$SS_within)),
            df_within         = sprintf("%d ✓", as.integer(ev$df_within)),
            MS_within         = sprintf("%.2f ✓", ev$MS_within),
            SS_between        = sprintf("%.0f ✓", ev$SS_between),
            df_between        = sprintf("%d ✓", as.integer(ev$df_between)),
            MS_between        = sprintf("%.2f ✓", ev$MS_between),
            F_ratio           = sprintf("%.2f ✓", ev$F),
            eta_kwadraat      = sprintf("%.4f ✓", ev$eta2),
            significant_anova = sprintf("ja — F=%.2f >> 3.35 ✓", ev$F)
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