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

          type_labels <- c(
            "1 = Schijnverband", "2 = Indirect verband",
            "3 = Suppressoreffect", "4 = Reeel verband"
          )

          hints <- list(
            conclusie_A = "Verwacht: 1  [r_XY=0.62 daalt naar r_XY.Z=0.07 → schijnverband: SES van de wijk verklaart alles]",
            conclusie_B = "Verwacht: 2  [r_XY=0.38 daalt naar r_XY.Z=0.21 → indirect verband: stress medieert deels]",
            conclusie_C = "Verwacht: 3  [r_XY=-0.12 → r_XY.Z=-0.53 → suppressoreffect: motivatie maskeert het ware verband]"
          )

          lines <- character(0)
          score <- 0
          total <- length(qnames)

          for (key in names(qnames)) {
            r <- results[[key]]
            label <- qnames[[key]]
            if (!r$exists) {
              lines <- c(lines, sprintf("❌ **%s** (`%s`): niet ingevuld\\\n  → %s\n", label, key, hints[[key]]))
            } else if (!r$correct) {
              lines <- c(lines, sprintf("❌ **%s**: jouw antwoord = %s\\\n  → %s\n", label, as.character(r$value), hints[[key]]))
            } else {
              lines <- c(lines, sprintf("✅ **%s**: correct (%s)\n", label, as.character(r$value)))
              score <- score + 1
            }
          }

          lines <- c(lines,
            sprintf("---\n\n**Score: %d / %d**", score, total)
          )

          msg <- paste(lines, collapse = "\n")
          get_reporter()$add_message(msg, type = "markdown")
          generated == expected
        }
      )
    }
  )
})
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

          hints <- list(
            gemiddelde_groot  = sprintf("Verwacht: %d  [gemiddelde van 10 grootstadswaarden]", as.integer(ev$mean_groot)),
            gemiddelde_middel = sprintf("Verwacht: %d  [gemiddelde van 10 middelgrote waarden]", as.integer(ev$mean_middel)),
            gemiddelde_ruraal = sprintf("Verwacht: %d  [gemiddelde van 10 rurale waarden]", as.integer(ev$mean_ruraal)),
            grand_mean        = sprintf("Verwacht: %.3f  [gemiddelde van alle 30 waarden]", ev$grand),
            SS_within_groot   = sprintf("Verwacht: %d  [som van (x - groepsgemiddelde)²]", as.integer(ev$SS_w_groot)),
            SS_within_middel  = sprintf("Verwacht: %d  [som van (x - groepsgemiddelde)²]", as.integer(ev$SS_w_middel)),
            SS_within_ruraal  = sprintf("Verwacht: %d  [som van (x - groepsgemiddelde)²]", as.integer(ev$SS_w_ruraal)),
            SS_within         = sprintf("Verwacht: %d  [SS_groot + SS_middel + SS_ruraal]", as.integer(ev$SS_within)),
            df_within         = sprintf("Verwacht: %d  [N - k = 30 - 3]", as.integer(ev$df_within)),
            MS_within         = sprintf("Verwacht: %.2f  [SS_within / df_within]", ev$MS_within),
            SS_between        = sprintf("Verwacht: %.2f  [som van n × (groepsgemiddelde - grand mean)²]", ev$SS_between),
            df_between        = sprintf("Verwacht: %d  [k - 1 = 3 - 1]", as.integer(ev$df_between)),
            MS_between        = sprintf("Verwacht: %.2f  [SS_between / df_between]", ev$MS_between),
            F_ratio           = sprintf("Verwacht: %.2f  [MS_between / MS_within]", ev$F),
            eta_kwadraat      = sprintf("Verwacht: %.4f  [SS_between / SS_totaal]", ev$eta2),
            significant_anova = sprintf("Verwacht: 1 (ja)  [F=%.2f is veel groter dan kritieke waarde ≈ 3.35]", ev$F)
          )

          lines <- character(0)
          score <- 0
          total <- length(qnames)

          for (key in names(qnames)) {
            r     <- results[[key]]
            label <- qnames[[key]]
            if (!r$exists) {
              lines <- c(lines, sprintf("❌ **%s** (`%s`): niet ingevuld\\\n  → %s\n", label, key, hints[[key]]))
            } else if (!r$correct) {
              lines <- c(lines, sprintf("❌ **%s**: jouw antwoord = %s\\\n  → %s\n", label, as.character(r$value), hints[[key]]))
            } else {
              lines <- c(lines, sprintf("✅ **%s**: correct (%s)\n", label, as.character(r$value)))
              score <- score + 1
            }
          }

          lines <- c(lines,
            sprintf("---\n\n**Score: %d / %d**", score, total)
          )

          msg <- paste(lines, collapse = "\n")
          get_reporter()$add_message(msg, type = "markdown")
          generated == expected
        }
      )
    }
  )
})