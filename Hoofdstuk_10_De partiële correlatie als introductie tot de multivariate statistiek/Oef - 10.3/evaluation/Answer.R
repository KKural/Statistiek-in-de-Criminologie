context({
  testcase(
    "Partiele correlatie - schoolbetrokkenheid en suppressorvariabele",
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

          # â”€â”€ wrong_msg helpers â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€

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
              return(sprintf("**Waarom fout:** Je berekende een product i.p.v. een aftrekking.\n\n**Teller** = r_XY **âˆ’** r_XZ Ã— r_YZ = %.2f âˆ’ (%.2f Ã— %.2f) = **%.4f**.", ev$r_XY, ev$r_XZ, ev$r_YZ, ev$teller))
            if (!is.na(v) && abs(v - (ev$r_XY + ev$r_XZ * ev$r_YZ)) < 0.01)
              return(sprintf("**Waarom fout:** Je telde op in plaats van af te trekken.\n\n**Teller** = r_XY âˆ’ r_XZ Ã— r_YZ = %.2f **âˆ’** %.4f = **%.4f**.", ev$r_XY, product, ev$teller))
            sprintf("**Teller** = r_XY âˆ’ r_XZ Ã— r_YZ = %.2f âˆ’ (%.2f Ã— %.2f) = **%.4f**", ev$r_XY, ev$r_XZ, ev$r_YZ, ev$teller)
          }

          wrong_msg_noemer_103 <- function(val) {
            v <- parse_num(val)
            inside <- (1 - ev$r_XZ^2) * (1 - ev$r_YZ^2)
            if (!is.na(v) && abs(v - inside) < 0.01)
              return(sprintf("**Waarom fout:** Je gaf de waarde onder het wortelteken (%.4f). Neem nog **âˆš**.\n\n**Noemer** = âˆš%.4f = **%.4f**.", inside, inside, ev$noemer))
            if (!is.na(v) && abs(v - sqrt(1 - ev$r_XZ^2)) < 0.01)
              return(sprintf("**Waarom fout:** Je vergat de factor (1âˆ’r_YZÂ²).\n\n**Formule:** noemer = âˆš((1âˆ’r_XZÂ²) Ã— (1âˆ’r_YZÂ²)) = âˆš(%.4f Ã— %.4f) = **%.4f**.", 1-ev$r_XZ^2, 1-ev$r_YZ^2, ev$noemer))
            sprintf("**Noemer** = âˆš((1âˆ’r_XZÂ²)(1âˆ’r_YZÂ²)) = âˆš(%.4f Ã— %.4f) = **%.4f**", 1-ev$r_XZ^2, 1-ev$r_YZ^2, ev$noemer)
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
              return(sprintf("**Optie 1 (schijnverband) is onjuist.** Bij een schijnverband daalt r_XY.Z naar ~0.\n\nHier neemt r_XY.Z toe tot **%.4f** (sterker) â†’ dat is een **suppressoreffect** (code 3).", ev$r_XY_Z))
            if (!is.na(v) && v == 2)
              return(sprintf("**Optie 2 (indirect verband) is onjuist.** Bij indirect verband verzwakt |r|.\n\nHier gaat |r| van %.2f naar %.4f â€” **sterker** worden â†’ **suppressoreffect** (code 3).", abs(ev$r_XY), abs(ev$r_XY_Z)))
            if (!is.na(v) && v == 4)
              return(sprintf("**Optie 4 (tekenwisseling) is onjuist.** Het teken draait hier niet om (%.2f en %.4f hebben hetzelfde teken).\n\nMaar |r| wordt sterker â†’ **suppressoreffect** (code 3).", ev$r_XY, ev$r_XY_Z))
            sprintf("**Code 3 (suppressoreffect):** r_XY.Z=%.4f is sterker dan r_XY=%.2f.\n\nLage zelfcontrole (Z) maskeert het ware (negatieve) verband tussen schoolbetrokkenheid en delinquentie.", ev$r_XY_Z, ev$r_XY)
          }

          # â”€â”€ labels + functies â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€

          qnames <- c(
            r_XY           = "Bivariate correlatie r_XY (uit tabel)",
            r_XZ           = "Bivariate correlatie r_XZ (uit tabel)",
            r_YZ           = "Bivariate correlatie r_YZ (uit tabel)",
            r_XY_teller    = "Teller partiÃ«le correlatie",
            r_XY_noemer    = "Noemer partiÃ«le correlatie",
            r_XY_Z         = "PartiÃ«le correlatie r_XY.Z",
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
            r_XY           = sprintf("%.2f (uit tabel) âœ“", ev$r_XY),
            r_XZ           = sprintf("%.2f (uit tabel) âœ“", ev$r_XZ),
            r_YZ           = sprintf("%.2f (uit tabel) âœ“", ev$r_YZ),
            r_XY_teller    = sprintf("%.4f âœ“", ev$teller),
            r_XY_noemer    = sprintf("%.4f âœ“", ev$noemer),
            r_XY_Z         = sprintf("%.4f âœ“", ev$r_XY_Z),
            conclusie_type = sprintf("3 = suppressoreffect (r: %.2f â†’ %.4f, sterker) âœ“", ev$r_XY, ev$r_XY_Z)
          )

          # â”€â”€ feedback opbouwen â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€

          lines <- character(0)
          score <- 0
          total <- length(qnames)

          for (key in names(qnames)) {
            r   <- results[[key]]
            lbl <- qnames[[key]]
            if (!r$exists) {
              lines <- c(lines, paste0("âŒ **", lbl, "** â€” variabele `", key, "` niet ingevuld.\n\n",
                wrong_fns[[key]]("?"), "\n"))
            } else if (r$correct) {
              lines <- c(lines, paste0("âœ… **", lbl, "**: correct (", as.character(r$value),
                ") â€” ", correct_msgs[[key]], "\n"))
              score <- score + 1
            } else {
              lines <- c(lines, paste0("âŒ **", lbl, "** â€” jouw antwoord: **", as.character(r$value),
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
