context({
  testcase(
    "Partiële correlatie — politieagenten en dienstjaren (correlatietabel)",
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