context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          results <- list()

          # Given correlation table (n=50 police officers)
          exp_r_XY <- -0.44   # Fysieke bekwaamheid vs Jaarsalaris
          exp_r_XZ <- -0.68   # Fysieke bekwaamheid vs Dienstjaren
          exp_r_YZ <-  0.82   # Jaarsalaris vs Dienstjaren

          # Partial correlation formula
          exp_r_XY_teller <- round(exp_r_XY - exp_r_XZ * exp_r_YZ, 4)
          exp_r_XY_noemer <- round(sqrt((1 - exp_r_XZ^2) * (1 - exp_r_YZ^2)), 4)
          exp_r_XY_Z      <- round(exp_r_XY_teller / exp_r_XY_noemer, 4)

          # Conclusion: r_XY goes from -0.44 to +0.28 -> sign reversal (type 4)
          exp_conclusie_type <- 4L

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
          results$r_XY_teller    <- check_val("r_XY_teller",    exp_r_XY_teller,    tol = 0.0051)
          results$r_XY_noemer    <- check_val("r_XY_noemer",    exp_r_XY_noemer,    tol = 0.03)
          results$r_XY_Z         <- check_val("r_XY_Z",         exp_r_XY_Z,         tol = 0.03)
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

          wrong_msg_r_from_table <- function(val, var_label, exp_r, x_label, y_label) {
            v <- parse_num(val)
            if (!is.na(v) && abs(v - (-exp_r)) < 0.005)
              return(sprintf("**Waarom fout:** Je gaf %.2f — dat is het teken omgekeerd. Controleer de richting in de correlatietabel.\n\n**%s:** r = **%.2f**.", -exp_r, var_label, exp_r))
            if (!is.na(v) && abs(v) > 1)
              return(sprintf("**Ongeldige correlatie:** correlatiewaarden liggen altijd tussen −1 en +1.\n\n**%s:** r = **%.2f**.", var_label, exp_r))
            sprintf("**%s:** r(%s, %s) = **%.2f** (lees rechtstreeks uit de correlatietabel).", var_label, x_label, y_label, exp_r)
          }

          wrong_msg_teller_10_2 <- function(val) {
            v <- parse_num(val)
            product <- ev$r_XZ * ev$r_YZ
            if (!is.na(v) && abs(v - ev$r_XY * product) < 0.01)
              return(sprintf("**Waarom fout:** Je berekende r_XY × r_XZ × r_YZ = **product**, maar de formule gebruikt **aftrekking**.\n\n**Formule:** teller = r_XY **−** r_XZ × r_YZ = %.2f − (%.2f × %.2f) = **%.4f**.", ev$r_XY, ev$r_XZ, ev$r_YZ, ev$teller))
            if (!is.na(v) && abs(v - ev$r_XY) < 0.005)
              return(sprintf("**Waarom fout:** Je gaf r_XY (%.2f) als teller. Je moet r_XZ × r_YZ **aftrekken**.\n\n**Teller** = r_XY − r_XZ × r_YZ = %.2f − (%.2f × %.2f) = **%.4f**.", ev$r_XY, ev$r_XY, ev$r_XZ, ev$r_YZ, ev$teller))
            if (!is.na(v) && abs(v - (ev$r_XY + ev$r_XZ * ev$r_YZ)) < 0.01)
              return(sprintf("**Waarom fout:** Je telde op in plaats van af te trekken.\n\n**Formule:** teller = r_XY **−** r_XZ × r_YZ = %.2f **−** %.4f = **%.4f**.", ev$r_XY, ev$r_XZ * ev$r_YZ, ev$teller))
            sprintf("**Teller** = r_XY − r_XZ × r_YZ = %.2f − (%.2f × %.2f) = %.2f − %.4f = **%.4f**", ev$r_XY, ev$r_XZ, ev$r_YZ, ev$r_XY, ev$r_XZ * ev$r_YZ, ev$teller)
          }

          wrong_msg_noemer_10_2 <- function(val) {
            v <- parse_num(val)
            inside <- (1 - ev$r_XZ^2) * (1 - ev$r_YZ^2)
            if (!is.na(v) && abs(v - inside) < 0.01)
              return(sprintf("**Waarom fout:** Je gaf de waarde **onder** het wortelteken (%.4f). Je moet nog **√** nemen.\n\n**Noemer** = √%.4f = **%.4f**.", inside, inside, ev$noemer))
            if (!is.na(v) && abs(v - sqrt(1 - ev$r_XZ^2)) < 0.01)
              return(sprintf("**Waarom fout:** Je nam √(1−r_XZ²) maar vergat de factor √(1−r_YZ²).\n\n**Formule:** noemer = √((1−r_XZ²) × **(1−r_YZ²)**) = √(%.4f × %.4f) = **%.4f**.", 1-ev$r_XZ^2, 1-ev$r_YZ^2, ev$noemer))
            sprintf("**Noemer** = √((1−r_XZ²)(1−r_YZ²))\n\n= √((1−%.2f²)(1−%.2f²)) = √(%.4f × %.4f) = √%.4f = **%.4f**", ev$r_XZ, ev$r_YZ, 1-ev$r_XZ^2, 1-ev$r_YZ^2, inside, ev$noemer)
          }

          wrong_msg_r_partial_10_2 <- function(val) {
            v <- parse_num(val)
            if (!is.na(v) && abs(v - ev$noemer / ev$teller) < 0.05)
              return(sprintf("**Waarom fout:** Je deelde noemer door teller (omgekeerd).\n\n**r_XY.Z** = **teller** / noemer = %.4f / %.4f = **%.4f**.", ev$teller, ev$noemer, ev$r_XY_Z))
            sprintf("**r_XY.Z** = teller / noemer = %.4f / %.4f = **%.4f**", ev$teller, ev$noemer, ev$r_XY_Z)
          }

          wrong_msg_conclusie_10_2 <- function(val) {
            v <- parse_num(val)
            if (!is.na(v) && v == 1)
              return(sprintf("**Optie 1 (schijnverband) is onjuist.** Bij een schijnverband daalt r_XY.Z richting 0.\n\nHier keert **het teken om**: van %.2f naar %.4f → dat is een **tekenwisseling** (code 4).", ev$r_XY, ev$r_XY_Z))
            if (!is.na(v) && v == 2)
              return(sprintf("**Optie 2 (indirect verband) is onjuist.** Bij indirect verband verzwakt |r| maar blijft het teken hetzelfde.\n\nHier gaat r van **%.2f** (negatief) naar **%.4f** (positief) → het teken draait om → code **4** (tekenwisseling).", ev$r_XY, ev$r_XY_Z))
            if (!is.na(v) && v == 3)
              return(sprintf("**Optie 3 (suppressoreffect) is onjuist.** Een suppressoreffect versterkt |r|.\n\nHier draait het teken om (%.2f → %.4f) → dat is een **tekenwisseling** → code **4**.", ev$r_XY, ev$r_XY_Z))
            sprintf("**Code 4 (tekenwisseling):** r_XY.Z=%.4f heeft een ander teken dan r_XY=%.2f.\n\nDienstjaren (Z) correleert negatief met X én positief met Y — dit maskeert het ware (positieve) verband tussen X en Y.", ev$r_XY_Z, ev$r_XY)
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
            r_XY           = function(v) wrong_msg_r_from_table(v, "r_XY", ev$r_XY, "Fysieke bekwaamheid", "Jaarsalaris"),
            r_XZ           = function(v) wrong_msg_r_from_table(v, "r_XZ", ev$r_XZ, "Fysieke bekwaamheid", "Dienstjaren"),
            r_YZ           = function(v) wrong_msg_r_from_table(v, "r_YZ", ev$r_YZ, "Jaarsalaris", "Dienstjaren"),
            r_XY_teller    = wrong_msg_teller_10_2,
            r_XY_noemer    = wrong_msg_noemer_10_2,
            r_XY_Z         = wrong_msg_r_partial_10_2,
            conclusie_type = wrong_msg_conclusie_10_2
          )

          correct_msgs <- list(
            r_XY           = sprintf("%.2f (uit tabel) ✓", ev$r_XY),
            r_XZ           = sprintf("%.2f (uit tabel) ✓", ev$r_XZ),
            r_YZ           = sprintf("%.2f (uit tabel) ✓", ev$r_YZ),
            r_XY_teller    = sprintf("%.4f ✓", ev$teller),
            r_XY_noemer    = sprintf("%.4f ✓", ev$noemer),
            r_XY_Z         = sprintf("%.4f ✓", ev$r_XY_Z),
            conclusie_type = sprintf("4 = tekenwisseling (r: %.2f → %.4f) ✓", ev$r_XY, ev$r_XY_Z)
          )

          likely_conclusion <- c(
            "Je ziet mogelijk dat het oorspronkelijke verband wordt ontmaskerd en noemt dat verdwijnen, maar de partiële correlatie wisselt hier van teken.",
            "Je focust mogelijk op de verandering in grootte en negeert dat negatief naar positief een tekenwisseling is.",
            "Je gebruikt mogelijk suppressie als verzamelnaam voor elke versterking na controle, terwijl de aangeboden classificatie de tekenomslag afzonderlijk benoemt.",
            "correct"
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
              detail <- wrong_fns[[key]](r$value)
              if (identical(key, "conclusie_type")) {
                choice <- parse_num(r$value)
                likely <- if (!is.na(choice) && choice %in% 1:4) {
                  likely_conclusion[[as.integer(choice)]]
                } else {
                  "De invoer is niet eenduidig aan één aangeboden effecttype te koppelen."
                }
                detail <- paste0(
                  "**Waarschijnlijke redenering:** ", likely, "\n\n",
                  "**Waarom dit niet klopt:** ", detail
                )
              }
              lines <- c(lines, paste0("❌ **", lbl, "** — jouw antwoord: **", as.character(r$value),
                "**\n\n", detail, "\n"))
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

          finite_choices <- list(conclusie_type = 1:4)
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
                "**Mogelijke denkroute:** de invoer is niet eenduidig aan één van de aangeboden antwoordopties te koppelen.\n\n",
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
