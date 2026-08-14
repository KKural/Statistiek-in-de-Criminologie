context({
  testcase(
    "",
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

          results$gemiddelde    <- check_val("gemiddelde",    exp_mean,       tol = 0.0500001)
          results$standaardfout <- check_val("standaardfout", exp_SE,         tol = 0.0000501)
          results$BI_90_onder   <- check_val("BI_90_onder",   exp_BI90_onder, tol = 0.0050001)
          results$BI_90_boven   <- check_val("BI_90_boven",   exp_BI90_boven, tol = 0.0050001)
          results$BI_99_onder   <- check_val("BI_99_onder",   exp_BI99_onder, tol = 0.0050001)
          results$BI_99_boven   <- check_val("BI_99_boven",   exp_BI99_boven, tol = 0.0050001)
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
              return("**Waarschijnlijke redenering:** je koppelt mogelijk een lager betrouwbaarheidsniveau aan meer spreiding.\n\n**Waarom dit niet klopt:** 99% gebruikt een grotere kritieke z dan 90% en geeft daarom het bredere interval; de juiste code is 2.")
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
          contract_rule <- function(key) {
            k <- tolower(key)
            if (grepl("gemiddelde|_bar", k)) return("Gemiddelde = som / n; gebruik n-1 alleen bij een steekproefvariantie.")
            if (grepl("^ss|scp", k)) return("Centreer eerst, vorm kwadraten of kruisproducten en sommeer; een SS/SCP wordt niet gedeeld.")
            if (grepl("variantie|^var", k)) return("Steekproefvariantie = SS / (n-1); houd SS, variantie en standaardafwijking uit elkaar.")
            if (grepl("standaardfout", k)) return("Standaardfout = standaardafwijking / wortel(n); gebruik de juiste onzekerheidsmaat.")
            if (grepl("^sd|sigma", k)) return("Een standaardafwijking is de positieve wortel van de variantie en behoudt de oorspronkelijke eenheid.")
            if (grepl("cov|scp", k)) return("Covariantie gebruikt de getekende gecentreerde kruisproducten en de afgesproken deler.")
            if (grepl("teller", k)) return("Werk de volledige teller met tekens en haakjes uit voordat je door de noemer deelt.")
            if (grepl("noemer", k)) return("Bereken beide factoren onder de wortel afzonderlijk; de noemer moet positief zijn.")
            if (grepl("r_|pearson|partial", k)) return("Een correlatie is schaalvrij en ligt tussen -1 en 1; koppel elke correlatie aan de juiste variabelen en controles.")
            if (grepl("^bi_|interval|breder", k)) return("Een betrouwbaarheidsinterval is schatting plus/minus kritieke waarde maal standaardfout; meer betrouwbaarheid geeft een breder interval.")
            if (grepl("^df", k)) return("Vrijheidsgraden volgen uit het aantal onafhankelijke informatiedelen of geschatte parameters; tel die eerst expliciet.")
            if (grepl("^ms", k)) return("Mean square = bijbehorende sum of squares / bijbehorende vrijheidsgraden.")
            if (grepl("f_ratio|^f_", k)) return("F = MS tussen / MS binnen; houd teller en noemer op hun juiste ANOVA-rij.")
            if (grepl("eta|r_kwadraat", k)) return("Een verklaarde proportie vergelijkt verklaarde met totale variatie en ligt tussen 0 en 1, of 0% en 100%.")
            if (grepl("chi", k)) return("Sommeer voor elke cel (O-E)^2/E met de verwachte, niet de geobserveerde, frequentie als deler.")
            if (grepl("^e_", k)) return("Verwachte frequentie = rijtotaal maal kolomtotaal / N.")
            if (grepl("kritieke", k)) return("Lees de kritieke waarde af met zowel het juiste alfa als de juiste vrijheidsgraden.")
            if (grepl("significant|conclusie|richting|vraag|h0", k)) return("Pas eerst de expliciete beslisregel toe en formuleer daarna alleen de conclusie die door die vergelijking wordt gedragen.")
            if (grepl("n_minimum|n_voor|quotient", k)) return("Bereken de steekproefgrootte met ongeafronde tussenwaarden en rond het eindresultaat altijd naar boven af.")
            "Benoem de doelgrootheid, schrijf de bijbehorende formule en eenheid op en rond pas het eindresultaat af."
          }

          contract_step <- function(key, label) {
            k <- tolower(key)
            if (grepl("significant|conclusie|richting|vraag|h0|breder", k)) {
              return(paste0("Lees ", label, " opnieuw, noteer de relevante vergelijking in één regel en kies pas daarna de conclusie."))
            }
            paste0("Herbereken alleen ", label, ": schrijf de formule, vul de ongeafronde inputs met tekens in en controleer daarna bereik, eenheid en afronding.")
          }

          finite_choices <- list(breder_interval = 1:2)
          invalid_finite_choice <- function(key, value) {
            if (!(key %in% names(finite_choices))) return(FALSE)
            num <- suppressWarnings(as.numeric(as.character(value)))
            length(num) != 1 || is.na(num) || !(num %in% finite_choices[[key]])
          }

          contract_lines <- c("\n---\n\n## Denk- en herstelaanpak")
          for (key in names(qnames)) {
            r <- results[[key]]
            rule <- contract_rule(key)
            step <- contract_step(key, qnames[[key]])
            if (!r$exists) {
              contract_lines <- c(contract_lines, paste0(
                "### ", qnames[[key]], "\n\n",
                "**Waarom nog geen diagnose mogelijk is:** er is geen antwoordwaarde om aan een denkroute te koppelen.\n\n",
                "**Denkregel:** ", rule, "\n\n",
                "**Volgende stap:** vul de ontbrekende variabele in. ", step
              ))
            } else if (r$correct) {
              contract_lines <- c(contract_lines, paste0(
                "### ", qnames[[key]], "\n\n",
                "✅ **Bevestiging:** correct.\n\n**Waarom dit klopt:** het antwoord voldoet aan de hierboven bevestigde berekening of beslissing.\n\n",
                "**Denkregel:** ", rule, "\n\n",
                "**Transferstap:** ", step
              ))
            } else if (invalid_finite_choice(key, r$value)) {
              contract_lines <- c(contract_lines, paste0(
                "### ", qnames[[key]], "\n\n",
                "**Controleer je invoer:** de invoer is niet eenduidig aan één van de aangeboden antwoordopties te koppelen.\n\n",
                "**Waarom dit niet klopt:** een waarde buiten de aangeboden opties kan niet als inhoudelijke keuze worden beoordeeld.\n\n",
                "**Denkregel:** ", rule, "\n\n",
                "**Volgende stap:** voer exact één geldig optienummer in. ", step
              ))
            } else {
              contract_lines <- c(contract_lines, paste0(
                "### ", qnames[[key]], "\n\n",
                "**Waarschijnlijke redenering:** uit één eindantwoord is de precieze denkstap niet zeker. De waarde of optie past mogelijk bij de hierboven uitgewerkte verwisseling, tussenstap, deler, schaal of afronding.\n\n",
                "**Waarom dit niet klopt:** de bovenstaande componentcontrole toont waar het antwoord van de vereiste definitie, formule of beslisregel afwijkt.\n\n",
                "**Denkregel:** ", rule, "\n\n",
                "**Volgende stap:** ", step
              ))
            }
          }
          lines <- c(lines, contract_lines)

          get_reporter()$add_message(paste(lines, collapse = "\n"), type = "markdown")
          generated == expected
        }
      )
    }
  )
})
