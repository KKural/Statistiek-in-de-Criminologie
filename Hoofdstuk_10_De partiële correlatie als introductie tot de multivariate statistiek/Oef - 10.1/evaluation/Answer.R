context({
  testcase(
    "Partiële correlatie — scholieren en leeftijd (ruwe data)",
    {
      testEqual(
        "",
        function(env) {
          results <- list()

          # True data
          X_data <- c(2, 0, 0, 6, 3, 0, 2)   # DelictenGepleegd
          Y_data <- c(2, 0, 1, 3, 2, 3, 4)   # DelictenSlachtoffer
          Z_data <- c(17, 15, 14, 16, 15, 14, 18)  # Leeftijd
          n <- 7L

          # Display-rounded data (already integers, round to 2dp is no-op)
          X <- round(X_data, 2)
          Y <- round(Y_data, 2)
          Z <- round(Z_data, 2)

          # Step 1: means (4dp)
          exp_X_bar <- round(mean(X), 4)
          exp_Y_bar <- round(mean(Y), 4)
          exp_Z_bar <- round(mean(Z), 4)

          # Step 2-3: deviations, squares, cross-products
          dx <- round(X - exp_X_bar, 4)
          dy <- round(Y - exp_Y_bar, 4)
          dz <- round(Z - exp_Z_bar, 4)

          exp_SS_X   <- round(sum(round(dx^2,  4)), 4)
          exp_SS_Y   <- round(sum(round(dy^2,  4)), 4)
          exp_SS_Z   <- round(sum(round(dz^2,  4)), 4)
          exp_SCP_XY <- round(sum(round(dx*dy, 4)), 4)
          exp_SCP_XZ <- round(sum(round(dx*dz, 4)), 4)
          exp_SCP_YZ <- round(sum(round(dy*dz, 4)), 4)

          # Step 4: variances, SDs, covariances
          exp_Var_X  <- round(exp_SS_X  / (n - 1L), 4)
          exp_Var_Y  <- round(exp_SS_Y  / (n - 1L), 4)
          exp_Var_Z  <- round(exp_SS_Z  / (n - 1L), 4)
          exp_SD_X   <- round(sqrt(exp_Var_X), 4)
          exp_SD_Y   <- round(sqrt(exp_Var_Y), 4)
          exp_SD_Z   <- round(sqrt(exp_Var_Z), 4)
          exp_Cov_XY <- round(exp_SCP_XY / (n - 1L), 4)
          exp_Cov_XZ <- round(exp_SCP_XZ / (n - 1L), 4)
          exp_Cov_YZ <- round(exp_SCP_YZ / (n - 1L), 4)

          # Step 5: bivariate correlations
          exp_r_XY <- round(exp_Cov_XY / (exp_SD_X * exp_SD_Y), 4)
          exp_r_XZ <- round(exp_Cov_XZ / (exp_SD_X * exp_SD_Z), 4)
          exp_r_YZ <- round(exp_Cov_YZ / (exp_SD_Y * exp_SD_Z), 4)

          # Step 6: partial correlation
          exp_r_XY_teller <- round(exp_r_XY - exp_r_XZ * exp_r_YZ, 4)
          exp_r_XY_noemer <- round(sqrt((1 - exp_r_XZ^2) * (1 - exp_r_YZ^2)), 4)
          exp_r_XY_Z      <- round(exp_r_XY_teller / exp_r_XY_noemer, 4)

          # Interpretation: r_XY drops from ~0.46 to ~0.30 -> indirect/partial effect
          exp_conclusie_type <- 2L  # Indirect verband: verband verzwakt maar blijft

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

          results$X_bar          <- check_val("X_bar",          exp_X_bar)
          results$Y_bar          <- check_val("Y_bar",          exp_Y_bar)
          results$Z_bar          <- check_val("Z_bar",          exp_Z_bar)
          results$SS_X           <- check_val("SS_X",           exp_SS_X,   tol = 0.02)
          results$SS_Y           <- check_val("SS_Y",           exp_SS_Y,   tol = 0.02)
          results$SS_Z           <- check_val("SS_Z",           exp_SS_Z,   tol = 0.02)
          results$SCP_XY         <- check_val("SCP_XY",         exp_SCP_XY, tol = 0.02)
          results$SCP_XZ         <- check_val("SCP_XZ",         exp_SCP_XZ, tol = 0.02)
          results$SCP_YZ         <- check_val("SCP_YZ",         exp_SCP_YZ, tol = 0.02)
          results$Var_X          <- check_val("Var_X",          exp_Var_X)
          results$Var_Y          <- check_val("Var_Y",          exp_Var_Y)
          results$Var_Z          <- check_val("Var_Z",          exp_Var_Z)
          results$SD_X           <- check_val("SD_X",           exp_SD_X)
          results$SD_Y           <- check_val("SD_Y",           exp_SD_Y)
          results$SD_Z           <- check_val("SD_Z",           exp_SD_Z)
          results$Cov_XY         <- check_val("Cov_XY",         exp_Cov_XY)
          results$Cov_XZ         <- check_val("Cov_XZ",         exp_Cov_XZ)
          results$Cov_YZ         <- check_val("Cov_YZ",         exp_Cov_YZ)
          results$r_XY           <- check_val("r_XY",           exp_r_XY)
          results$r_XZ           <- check_val("r_XZ",           exp_r_XZ)
          results$r_YZ           <- check_val("r_YZ",           exp_r_YZ)
          results$r_XY_teller    <- check_val("r_XY_teller",    exp_r_XY_teller)
          results$r_XY_noemer    <- check_val("r_XY_noemer",    exp_r_XY_noemer)
          results$r_XY_Z         <- check_val("r_XY_Z",         exp_r_XY_Z)
          results$conclusie_type <- check_val("conclusie_type", exp_conclusie_type, tol = 0)

          assign("detailed_results", results, envir = globalenv())
          assign("expected_vals", list(
            X_bar = exp_X_bar, Y_bar = exp_Y_bar, Z_bar = exp_Z_bar,
            SS_X = exp_SS_X, SS_Y = exp_SS_Y, SS_Z = exp_SS_Z,
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
          # ev contains: X_bar, Y_bar, Z_bar, SS_X, SS_Y, SS_Z, teller, noemer, r_XY_Z
          # We derive other expected values from ev for context-rich messages.

          wrong_msg_mean <- function(val, vname, exp_val, n, data_str) {
            v <- parse_num(val)
            sprintf("**%s̄** = som / n = (%s) / %d = **%.4f**\n\nJouw antwoord: %s", vname, data_str, n, exp_val, val)
          }

          wrong_msg_SS <- function(val, vname, exp_SS, exp_mean) {
            v <- parse_num(val)
            exp_var <- exp_SS / 6
            if (!is.na(v) && abs(v - exp_var) < 0.01)
              return(sprintf("**Waarom fout:** Je gaf de **variantie** (SS/(n−1) = %.4f) als SS.\n\n**SS_%s** = Σ(xᵢ − x̄)² = **%.4f** — je deelt de SS _niet_ door (n−1).", exp_var, vname, exp_SS))
            if (!is.na(v) && abs(v - exp_SS * 6) < 1)
              return(sprintf("**Waarom fout:** Je vermenigvuldigde de SS met (n−1)=6 in plaats van te kwadrateren en te sommeren.\n\n**SS_%s** = Σdeviaties² = **%.4f**.", vname, exp_SS))
            sprintf("**SS_%s** = Σ(xᵢ − x̄_%s)² = Σ afwijkingen²\n\n(x̄_%s = %.4f, n=7)\n\n→ SS_%s = **%.4f**", vname, vname, vname, exp_mean, vname, exp_SS)
          }

          wrong_msg_SCP <- function(val, vname1, vname2, exp_SCP, exp_mean1, exp_mean2) {
            v <- parse_num(val)
            exp_cov <- exp_SCP / 6
            if (!is.na(v) && abs(v - exp_cov) < 0.01)
              return(sprintf("**Waarom fout:** Je gaf de **covariantie** (SCP/(n−1) = %.4f) als SCP.\n\n**SCP_%s%s** = Σ(xᵢ − x̄_%s)(yᵢ − ȳ_%s) = **%.4f** — niet delen door (n−1).", exp_cov, vname1, vname2, vname1, vname2, exp_SCP))
            sprintf("**SCP_%s%s** = Σ(xᵢ − x̄_%s)(yᵢ − ȳ_%s)\n\n(x̄_%s=%.4f, ȳ_%s=%.4f, n=7)\n\n→ SCP = **%.4f**", vname1, vname2, vname1, vname2, vname1, exp_mean1, vname2, exp_mean2, exp_SCP)
          }

          wrong_msg_Var <- function(val, vname, exp_SS, exp_var) {
            v <- parse_num(val)
            if (!is.na(v) && abs(v - exp_SS) < 0.02)
              return(sprintf("**Waarom fout:** Je gaf **SS_%s** (%.4f) als variantie. Variantie = SS / (n−1).\n\n**Var_%s** = %.4f / 6 = **%.4f**.", vname, exp_SS, vname, exp_SS, exp_var))
            if (!is.na(v) && abs(v - exp_SS / 7) < 0.01)
              return(sprintf("**Waarom fout:** Je deelde door n=7 (populatievariantie). Voor steekproefvariantie deel je door **n−1=6**.\n\n**Var_%s** = %.4f / **6** = **%.4f**.", vname, exp_SS, exp_var))
            sprintf("**Var_%s** = SS_%s / (n−1) = %.4f / 6 = **%.4f**", vname, vname, exp_SS, exp_var)
          }

          wrong_msg_SD <- function(val, vname, exp_var, exp_SD) {
            v <- parse_num(val)
            if (!is.na(v) && abs(v - exp_var) < 0.01)
              return(sprintf("**Waarom fout:** Je gaf de **variantie** (%.4f) als standaarddeviatie. SD = √Var.\n\n**SD_%s** = √%.4f = **%.4f**.", exp_var, vname, exp_var, exp_SD))
            if (!is.na(v) && abs(v - exp_SD^2) < 0.02)
              return(sprintf("**Waarom fout:** Je kwadrateerde i.p.v. de vierkantswortel te nemen.\n\n**SD_%s** = **√**Var = √%.4f = **%.4f**.", vname, exp_var, exp_SD))
            sprintf("**SD_%s** = √Var_%s = √%.4f = **%.4f**", vname, vname, exp_var, exp_SD)
          }

          wrong_msg_Cov <- function(val, vname1, vname2, exp_SCP, exp_cov) {
            v <- parse_num(val)
            if (!is.na(v) && abs(v - exp_SCP) < 0.02)
              return(sprintf("**Waarom fout:** Je gaf **SCP_%s%s** (%.4f) als covariantie. Covariantie = SCP / (n−1).\n\n**Cov_%s%s** = %.4f / 6 = **%.4f**.", vname1, vname2, exp_SCP, vname1, vname2, exp_SCP, exp_cov))
            sprintf("**Cov_%s%s** = SCP_%s%s / (n−1) = %.4f / 6 = **%.4f**", vname1, vname2, vname1, vname2, exp_SCP, exp_cov)
          }

          wrong_msg_r <- function(val, v1, v2, exp_r, exp_cov, exp_sd1, exp_sd2) {
            v <- parse_num(val)
            if (!is.na(v) && abs(v - exp_cov) < 0.01)
              return(sprintf("**Waarom fout:** Je gaf de **covariantie** (%.4f) als correlatie. Deel door SD_%s × SD_%s.\n\n**r_%s%s** = Cov / (SD_%s × SD_%s) = %.4f / (%.4f × %.4f) = **%.4f**.", exp_cov, v1, v2, v1, v2, v1, v2, exp_cov, exp_sd1, exp_sd2, exp_r))
            if (!is.na(v) && abs(abs(v) - 1) < 0.01 && abs(v - exp_r) > 0.1)
              return(sprintf("**Waarom fout:** Je kregen ±1 — controleer je berekening van SS of SCP.\n\n**r_%s%s** = Cov_(%.4f) / (SD_%s(%.4f) × SD_%s(%.4f)) = **%.4f**.", v1, v2, exp_cov, v1, exp_sd1, v2, exp_sd2, exp_r))
            sprintf("**r_%s%s** = Cov_%s%s / (SD_%s × SD_%s) = %.4f / (%.4f × %.4f) = **%.4f**", v1, v2, v1, v2, v1, v2, exp_cov, exp_sd1, exp_sd2, exp_r)
          }

          wrong_msg_teller <- function(val) {
            v <- parse_num(val)
            r_XY <- results$r_XY$expected
            r_XZ <- results$r_XZ$expected
            r_YZ <- results$r_YZ$expected
            product <- r_XZ * r_YZ
            if (!is.na(v) && !is.na(r_XY) && abs(v - r_XY * product) < 0.01)
              return(sprintf("**Waarom fout:** Je berekende het **product** r_XY × r_XZ × r_YZ = %.4f, maar de formule gebruikt een **aftrekking**.\n\n**Formule:** teller = r_XY **−** r_XZ × r_YZ = %.4f − (%.4f × %.4f) = **%.4f**.", r_XY * product, r_XY, r_XZ, r_YZ, ev$teller))
            if (!is.na(v) && !is.na(r_XY) && abs(v - r_XY) < 0.01)
              return(sprintf("**Waarom fout:** Je gaf r_XY (%.4f) als teller, maar je moet het **product r_XZ × r_YZ aftrekken**.\n\n**Formule:** teller = r_XY − r_XZ × r_YZ = %.4f − %.4f = **%.4f**.", r_XY, r_XY, product, ev$teller))
            sprintf("**Teller** = r_XY − r_XZ × r_YZ = %.4f − (%.4f × %.4f) = **%.4f**", results$r_XY$expected, results$r_XZ$expected, results$r_YZ$expected, ev$teller)
          }

          wrong_msg_noemer <- function(val) {
            v <- parse_num(val)
            r_XZ <- results$r_XZ$expected
            r_YZ <- results$r_YZ$expected
            inside <- (1 - r_XZ^2) * (1 - r_YZ^2)
            if (!is.na(v) && abs(v - inside) < 0.01)
              return(sprintf("**Waarom fout:** Je gaf de waarde **onder** het wortelteken (%.4f) als noemer. Je moet nog de vierkantswortel nemen.\n\n**Noemer** = √(%.4f) = **%.4f**.", inside, inside, ev$noemer))
            if (!is.na(v) && abs(v - (1 - r_XZ^2)) < 0.01)
              return(sprintf("**Waarom fout:** Je nam slechts (1−r_XZ²). Je vergat de factor met r_YZ.\n\n**Formule:** noemer = √((1−r_XZ²) × (1−r_YZ²)) = √(%.4f × %.4f) = **%.4f**.", 1 - r_XZ^2, 1 - r_YZ^2, ev$noemer))
            sprintf("**Noemer** = √((1−r_XZ²)(1−r_YZ²)) = √((1−%.4f²)(1−%.4f²)) = √%.4f = **%.4f**", r_XZ, r_YZ, inside, ev$noemer)
          }

          wrong_msg_r_partial <- function(val) {
            v <- parse_num(val)
            if (!is.na(v) && abs(v - ev$noemer / ev$teller) < 0.01)
              return(sprintf("**Waarom fout:** Je deelde noemer door teller (omgekeerd).\n\n**r_XY.Z** = **teller** / noemer = %.4f / %.4f = **%.4f**.", ev$teller, ev$noemer, ev$r_XY_Z))
            sprintf("**r_XY.Z** = teller / noemer = %.4f / %.4f = **%.4f**", ev$teller, ev$noemer, ev$r_XY_Z)
          }

          wrong_msg_conclusie_type <- function(val) {
            v <- parse_num(val)
            r_XY_orig <- results$r_XY$expected
            if (!is.na(v) && v == 1)
              return(sprintf("**Optie 1 (schijnverband) is onjuist.** Bij een schijnverband zou r_XY.Z ≈ 0 worden.\n\nHier is r_XY.Z=%.4f — het verband *verzwakt* maar blijft bestaan → **indirect verband** (code 2).", ev$r_XY_Z))
            if (!is.na(v) && v == 3)
              return(sprintf("**Optie 3 (suppressoreffect) is onjuist.** Bij een suppressoreffect zou r_XY.Z *sterker* worden dan r_XY.\n\nHier verzwakt het van %.4f naar %.4f → het is een **indirect verband** (code 2).", r_XY_orig, ev$r_XY_Z))
            if (!is.na(v) && v == 4)
              return(sprintf("**Optie 4 (tekenwisseling) is onjuist.** Bij een tekenwisseling zou het teken (+/−) omdraaien.\n\nHier blijft het teken hetzelfde (r_XY.Z=%.4f) → **indirect verband** (code 2).", ev$r_XY_Z))
            sprintf("**Code 2 (indirect verband):** r_XY.Z=%.4f is kleiner dan r_XY=%.4f maar heeft hetzelfde teken → leeftijd medieert het verband deels.", ev$r_XY_Z, r_XY_orig)
          }

          # ── labels + functies ──────────────────────────────────────────────────

          # Derive expected values from ev + results for intermediate vars
          exp_Var_X  <- ev$SS_X  / 6; exp_SD_X <- sqrt(exp_Var_X)
          exp_Var_Y  <- ev$SS_Y  / 6; exp_SD_Y <- sqrt(exp_Var_Y)
          exp_Var_Z  <- ev$SS_Z  / 6; exp_SD_Z <- sqrt(exp_Var_Z)
          exp_SCP_XY <- results$SCP_XY$expected; exp_Cov_XY <- exp_SCP_XY / 6
          exp_SCP_XZ <- results$SCP_XZ$expected; exp_Cov_XZ <- exp_SCP_XZ / 6
          exp_SCP_YZ <- results$SCP_YZ$expected; exp_Cov_YZ <- exp_SCP_YZ / 6
          exp_r_XY   <- results$r_XY$expected
          exp_r_XZ   <- results$r_XZ$expected
          exp_r_YZ   <- results$r_YZ$expected

          qnames <- c(
            X_bar          = "Gemiddelde X (DelictenGepleegd)",
            Y_bar          = "Gemiddelde Y (DelictenSlachtoffer)",
            Z_bar          = "Gemiddelde Z (Leeftijd)",
            SS_X           = "Somkwadraat SS_X",
            SS_Y           = "Somkwadraat SS_Y",
            SS_Z           = "Somkwadraat SS_Z",
            SCP_XY         = "Kruisproductsom SCP_XY",
            SCP_XZ         = "Kruisproductsom SCP_XZ",
            SCP_YZ         = "Kruisproductsom SCP_YZ",
            Var_X          = "Variantie Var_X",
            Var_Y          = "Variantie Var_Y",
            Var_Z          = "Variantie Var_Z",
            SD_X           = "Standaarddeviatie SD_X",
            SD_Y           = "Standaarddeviatie SD_Y",
            SD_Z           = "Standaarddeviatie SD_Z",
            Cov_XY         = "Covariantie Cov_XY",
            Cov_XZ         = "Covariantie Cov_XZ",
            Cov_YZ         = "Covariantie Cov_YZ",
            r_XY           = "Bivariate correlatie r_XY",
            r_XZ           = "Bivariate correlatie r_XZ",
            r_YZ           = "Bivariate correlatie r_YZ",
            r_XY_teller    = "Teller partiële correlatie",
            r_XY_noemer    = "Noemer partiële correlatie",
            r_XY_Z         = "Partiële correlatie r_XY.Z",
            conclusie_type = "Interpretatie (conclusie_type)"
          )

          wrong_fns <- list(
            X_bar          = function(v) wrong_msg_mean(v, "X", ev$X_bar, 7, "2+0+0+6+3+0+2"),
            Y_bar          = function(v) wrong_msg_mean(v, "Y", ev$Y_bar, 7, "2+0+1+3+2+3+4"),
            Z_bar          = function(v) wrong_msg_mean(v, "Z", ev$Z_bar, 7, "17+15+14+16+15+14+18"),
            SS_X           = function(v) wrong_msg_SS(v, "X", ev$SS_X, ev$X_bar),
            SS_Y           = function(v) wrong_msg_SS(v, "Y", ev$SS_Y, ev$Y_bar),
            SS_Z           = function(v) wrong_msg_SS(v, "Z", ev$SS_Z, ev$Z_bar),
            SCP_XY         = function(v) wrong_msg_SCP(v, "X", "Y", exp_SCP_XY, ev$X_bar, ev$Y_bar),
            SCP_XZ         = function(v) wrong_msg_SCP(v, "X", "Z", exp_SCP_XZ, ev$X_bar, ev$Z_bar),
            SCP_YZ         = function(v) wrong_msg_SCP(v, "Y", "Z", exp_SCP_YZ, ev$Y_bar, ev$Z_bar),
            Var_X          = function(v) wrong_msg_Var(v, "X", ev$SS_X, exp_Var_X),
            Var_Y          = function(v) wrong_msg_Var(v, "Y", ev$SS_Y, exp_Var_Y),
            Var_Z          = function(v) wrong_msg_Var(v, "Z", ev$SS_Z, exp_Var_Z),
            SD_X           = function(v) wrong_msg_SD(v, "X", exp_Var_X, exp_SD_X),
            SD_Y           = function(v) wrong_msg_SD(v, "Y", exp_Var_Y, exp_SD_Y),
            SD_Z           = function(v) wrong_msg_SD(v, "Z", exp_Var_Z, exp_SD_Z),
            Cov_XY         = function(v) wrong_msg_Cov(v, "X", "Y", exp_SCP_XY, exp_Cov_XY),
            Cov_XZ         = function(v) wrong_msg_Cov(v, "X", "Z", exp_SCP_XZ, exp_Cov_XZ),
            Cov_YZ         = function(v) wrong_msg_Cov(v, "Y", "Z", exp_SCP_YZ, exp_Cov_YZ),
            r_XY           = function(v) wrong_msg_r(v, "X", "Y", exp_r_XY, exp_Cov_XY, exp_SD_X, exp_SD_Y),
            r_XZ           = function(v) wrong_msg_r(v, "X", "Z", exp_r_XZ, exp_Cov_XZ, exp_SD_X, exp_SD_Z),
            r_YZ           = function(v) wrong_msg_r(v, "Y", "Z", exp_r_YZ, exp_Cov_YZ, exp_SD_Y, exp_SD_Z),
            r_XY_teller    = wrong_msg_teller,
            r_XY_noemer    = wrong_msg_noemer,
            r_XY_Z         = wrong_msg_r_partial,
            conclusie_type = wrong_msg_conclusie_type
          )

          correct_msgs <- list(
            X_bar          = sprintf("%.4f ✓", ev$X_bar),
            Y_bar          = sprintf("%.4f ✓", ev$Y_bar),
            Z_bar          = sprintf("%.4f ✓", ev$Z_bar),
            SS_X           = sprintf("%.4f ✓", ev$SS_X),
            SS_Y           = sprintf("%.4f ✓", ev$SS_Y),
            SS_Z           = sprintf("%.4f ✓", ev$SS_Z),
            SCP_XY         = sprintf("%.4f ✓", exp_SCP_XY),
            SCP_XZ         = sprintf("%.4f ✓", exp_SCP_XZ),
            SCP_YZ         = sprintf("%.4f ✓", exp_SCP_YZ),
            Var_X          = sprintf("%.4f ✓", exp_Var_X),
            Var_Y          = sprintf("%.4f ✓", exp_Var_Y),
            Var_Z          = sprintf("%.4f ✓", exp_Var_Z),
            SD_X           = sprintf("%.4f ✓", exp_SD_X),
            SD_Y           = sprintf("%.4f ✓", exp_SD_Y),
            SD_Z           = sprintf("%.4f ✓", exp_SD_Z),
            Cov_XY         = sprintf("%.4f ✓", exp_Cov_XY),
            Cov_XZ         = sprintf("%.4f ✓", exp_Cov_XZ),
            Cov_YZ         = sprintf("%.4f ✓", exp_Cov_YZ),
            r_XY           = sprintf("%.4f ✓", exp_r_XY),
            r_XZ           = sprintf("%.4f ✓", exp_r_XZ),
            r_YZ           = sprintf("%.4f ✓", exp_r_YZ),
            r_XY_teller    = sprintf("%.4f ✓", ev$teller),
            r_XY_noemer    = sprintf("%.4f ✓", ev$noemer),
            r_XY_Z         = sprintf("%.4f ✓", ev$r_XY_Z),
            conclusie_type = "2 = indirect verband (verband verzwakt maar blijft) ✓"
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