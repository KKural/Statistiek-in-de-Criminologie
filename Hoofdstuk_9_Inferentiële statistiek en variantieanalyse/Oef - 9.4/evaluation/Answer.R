context({
  testcase(
    "",
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

          parse_num <- function(val) {
            if (is.character(val)) { val <- trimws(val); val <- gsub(",", ".", val, fixed=TRUE) }
            suppressWarnings(as.numeric(val))
          }

          # ── wrong_msg helpers ──────────────────────────────────────────────────

          wrong_msg_mean <- function(val, group_name, exp_mean, data_str) {
            v <- parse_num(val)
            sprintf("**Hoe te corrigeren:** Gemiddelde %s = som van de 10 waarden / 10\n\n**Data:** %s\n\n→ x̄ = **%.0f**", group_name, data_str, exp_mean)
          }

          wrong_msg_grand <- function(val) {
            v <- parse_num(val)
            if (!is.na(v) && abs(v - (ev$mean_groot + ev$mean_middel + ev$mean_ruraal)/3) < 1)
              return(sprintf("**Bijna goed!** Je nam het gemiddelde van de drie groepsgemiddelden, wat correct is als de groepen even groot zijn (wat hier geldt):\n\n→ (%.0f + %.0f + %.0f) / 3 = **%.3f** ✓", ev$mean_groot, ev$mean_middel, ev$mean_ruraal, ev$grand))
            sprintf("**Hoe te corrigeren:** Grand mean = gemiddelde van **alle** 30 waarden = som van alle waarden / 30\n\n→ (%.0f×10 + %.0f×10 + %.0f×10) / 30 = **%.3f**", ev$mean_groot, ev$mean_middel, ev$mean_ruraal, ev$grand)
          }

          wrong_msg_SS_within_group <- function(val, group_name, exp_SS, exp_mean) {
            v <- parse_num(val)
            if (!is.na(v) && !is.na(exp_SS) && abs(v - exp_SS/(9)) < 5)
              return(sprintf("**Waarom fout:** Je gaf de variantie (SS/9 = %.1f), niet de somkwadraat.\n\n**SS_within_%s** = Σ(xᵢ − x̄_%s)² = **%d** (niet delen door df!)", exp_SS/9, group_name, group_name, as.integer(exp_SS)))
            if (!is.na(v) && !is.na(ev$grand) && abs(v - sum((c(exp_mean) - ev$grand)^2 * 10)) < 100)
              return(sprintf("**Waarom fout:** Je gebruikte de **grand mean** (%.3f) in plaats van het **groepsgemiddelde** (%.0f).\n\n**SS_within** berekent spreiding **binnen** een groep: Σ(xᵢ − x̄_groep)².", ev$grand, exp_mean))
            sprintf("**Hoe te corrigeren:** SS_within_%s = Σ(xᵢ − x̄_%s)² = Σ(xᵢ − %.0f)² = **%d**", group_name, group_name, exp_mean, as.integer(exp_SS))
          }

          wrong_msg_SS_within_total <- function(val) {
            v <- parse_num(val)
            if (!is.na(v) && abs(v - ev$SS_within / ev$df_within) < 50)
              return(sprintf("**Waarom fout:** Je gaf MS_within (SS/df = %.1f) in plaats van SS_within.\n\n**SS_within** = SS_groot + SS_middel + SS_ruraal = %d + %d + %d = **%d**.", ev$SS_within/ev$df_within, as.integer(ev$SS_w_groot), as.integer(ev$SS_w_middel), as.integer(ev$SS_w_ruraal), as.integer(ev$SS_within)))
            sprintf("**Hoe te corrigeren:** SS_within = SS_groot + SS_middel + SS_ruraal = %d + %d + %d = **%d**", as.integer(ev$SS_w_groot), as.integer(ev$SS_w_middel), as.integer(ev$SS_w_ruraal), as.integer(ev$SS_within))
          }

          wrong_msg_df_within <- function(val) {
            v <- parse_num(val)
            if (!is.na(v) && abs(v - 30) < 0.5)
              return("**Waarom fout:** Je gaf N=30 als df_within, maar df_within = N − k (aantal groepen aftrekken).\n\n**df_within** = 30 − 3 = **27**.")
            if (!is.na(v) && abs(v - 27/3) < 0.5)
              return("**Waarom fout:** Je deelde door het aantal groepen. df_within = N − k = 30 − 3 = **27**.")
            "**Hoe te corrigeren:** df_within = N − k = 30 − 3 = **27**"
          }

          wrong_msg_MS_within <- function(val) {
            v <- parse_num(val)
            if (!is.na(v) && abs(v - ev$SS_within) < 100)
              return(sprintf("**Waarom fout:** Je gaf SS_within (%d) als MS_within. MS = SS / df.\n\n**MS_within** = %d / %d = **%.2f**.", as.integer(ev$SS_within), as.integer(ev$SS_within), as.integer(ev$df_within), ev$MS_within))
            if (!is.na(v) && abs(v - ev$SS_within / 30) < 100)
              return(sprintf("**Waarom fout:** Je deelde door N=30 in plaats van df_within=%d.\n\n**MS_within** = SS_within / df_within = %d / **%d** = **%.2f**.", as.integer(ev$df_within), as.integer(ev$SS_within), as.integer(ev$df_within), ev$MS_within))
            sprintf("**Hoe te corrigeren:** MS_within = SS_within / df_within = %d / %d = **%.2f**", as.integer(ev$SS_within), as.integer(ev$df_within), ev$MS_within)
          }

          wrong_msg_SS_between <- function(val) {
            v <- parse_num(val)
            if (!is.na(v) && abs(v - ev$SS_between / ev$df_between) < 500)
              return(sprintf("**Waarom fout:** Je gaf MS_between (SS/df = %.1f) als SS_between.\n\n**SS_between** = Σ nⱼ × (x̄ⱼ − grand mean)² = **%.0f**.", ev$SS_between/ev$df_between, ev$SS_between))
            if (!is.na(v) && abs(v - ev$SS_between / 10) < 500)
              return(sprintf("**Waarom fout:** Je vergat te vermenigvuldigen met de groepsgrootte nⱼ=10.\n\n**Formule:** SS_between = Σ **nⱼ** × (x̄ⱼ − grand mean)² = **%.0f**.", ev$SS_between))
            sprintf("**Hoe te corrigeren:** SS_between = Σ nᴶ(x̄ᴶ − grand mean)²\n\n= 10×(%.0f−%.3f)² + 10×(%.0f−%.3f)² + 10×(%.0f−%.3f)²\n\n= **%.0f**",
              ev$mean_groot, ev$grand, ev$mean_middel, ev$grand, ev$mean_ruraal, ev$grand, ev$SS_between)
          }

          wrong_msg_df_between <- function(val) {
            v <- parse_num(val)
            if (!is.na(v) && abs(v - 3) < 0.5)
              return("**Waarom fout:** Je gaf k=3 als df, maar df_between = k − 1 (aantal groepen min 1).\n\n**df_between** = 3 − 1 = **2**.")
            "**Hoe te corrigeren:** df_between = k − 1 = 3 − 1 = **2**"
          }

          wrong_msg_MS_between <- function(val) {
            v <- parse_num(val)
            if (!is.na(v) && abs(v - ev$SS_between) < 500)
              return(sprintf("**Waarom fout:** Je gaf SS_between (%.0f) als MS_between. MS = SS / df.\n\n**MS_between** = %.0f / %d = **%.2f**.", ev$SS_between, ev$SS_between, as.integer(ev$df_between), ev$MS_between))
            sprintf("**Hoe te corrigeren:** MS_between = SS_between / df_between = %.0f / %d = **%.2f**", ev$SS_between, as.integer(ev$df_between), ev$MS_between)
          }

          wrong_msg_F <- function(val) {
            v <- parse_num(val)
            if (!is.na(v) && abs(v - ev$MS_within / ev$MS_between) < 1)
              return(sprintf("**Waarom fout:** Je deelde MS_within door MS_between (omgekeerd).\n\n**F-ratio** = **MS_between** / MS_within = %.2f / %.2f = **%.2f**.", ev$MS_between, ev$MS_within, ev$F))
            sprintf("**Hoe te corrigeren:** F-ratio = MS_between / MS_within = %.2f / %.2f = **%.2f**", ev$MS_between, ev$MS_within, ev$F)
          }

          wrong_msg_eta2 <- function(val) {
            v <- parse_num(val)
            SS_total <- ev$SS_within + ev$SS_between
            if (!is.na(v) && abs(v - ev$SS_between / ev$SS_within) < 0.05)
              return(sprintf("**Waarom fout:** Je deelde door SS_within, maar η² = SS_between / **SS_totaal**.\n\n**SS_totaal** = SS_within + SS_between = %.0f + %.0f = %.0f\n\n→ η² = %.0f / %.0f = **%.4f**.", ev$SS_within, ev$SS_between, SS_total, ev$SS_between, SS_total, ev$eta2))
            sprintf("**Hoe te corrigeren:** η² = SS_between / SS_totaal = %.0f / %.0f = **%.4f**", ev$SS_between, SS_total, ev$eta2)
          }

          wrong_msg_sig_anova <- function(val) {
            v <- parse_num(val)
            if (!is.na(v) && v == 2)
              return(sprintf("**Waarom fout:** Je antwoordde 'niet significant'. F=%.2f is **veel groter** dan de kritieke waarde (~3.35 bij df 2 en 27, α=0.05).\n\n→ Er is een **sterk significant** verschil tussen de gemeentetypen → code **1** (ja).", ev$F))
            sprintf("**F=%.2f >> 3.35** (kritieke F bij df=2,27, α=0.05) → significant → code **1** (ja).", ev$F)
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
            gemiddelde_groot  = function(v) wrong_msg_mean(v, "grootsteden",  ev$mean_groot,  "3500 2700 2900 3200 3150 3300 2650 4000 3500 3000"),
            gemiddelde_middel = function(v) wrong_msg_mean(v, "middelgrote",  ev$mean_middel, "1850 1650 1450 1600 1550 1800 1400 1750 1250 1500"),
            gemiddelde_ruraal = function(v) wrong_msg_mean(v, "ruraal",       ev$mean_ruraal, "400 450 500 550 390 530 410 440 570 600"),
            grand_mean        = wrong_msg_grand,
            SS_within_groot   = function(v) wrong_msg_SS_within_group(v, "groot",  ev$SS_w_groot,  ev$mean_groot),
            SS_within_middel  = function(v) wrong_msg_SS_within_group(v, "middel", ev$SS_w_middel, ev$mean_middel),
            SS_within_ruraal  = function(v) wrong_msg_SS_within_group(v, "ruraal", ev$SS_w_ruraal, ev$mean_ruraal),
            SS_within         = wrong_msg_SS_within_total,
            df_within         = wrong_msg_df_within,
            MS_within         = wrong_msg_MS_within,
            SS_between        = wrong_msg_SS_between,
            df_between        = wrong_msg_df_between,
            MS_between        = wrong_msg_MS_between,
            F_ratio           = wrong_msg_F,
            eta_kwadraat      = wrong_msg_eta2,
            significant_anova = wrong_msg_sig_anova
          )

          SS_total_val <- ev$SS_within + ev$SS_between
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