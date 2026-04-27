context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          expected <- list(
            afhankelijke_variabele = 3,
            gemiddelde_x1   = 3.0,
            gemiddelde_x2   = 7.0,
            gemiddelde_y    = 18.0,
            SSx1            = 10,
            SSx2            = 30,
            SSy             = 80,
            SSx1x2          = 0,
            SSx1y           = -22,
            SSx2y           = 30,
            determinant_D   = 300,
            b1              = -2.2,
            b2              = 1.0,
            intercept_a     = 17.6,
            voorspelling    = 19.0,
            R_kwadraat      = 0.9800,
            richting_b1     = 2,
            sterkste_predictor = 1
          )

          tol <- list(
            afhankelijke_variabele = 0.4,
            gemiddelde_x1   = 0.05,
            gemiddelde_x2   = 0.05,
            gemiddelde_y    = 0.05,
            SSx1            = 0.5,
            SSx2            = 0.5,
            SSy             = 0.5,
            SSx1x2          = 0.5,
            SSx1y           = 0.5,
            SSx2y           = 0.5,
            determinant_D   = 1,
            b1              = 0.05,
            b2              = 0.05,
            intercept_a     = 0.1,
            voorspelling    = 0.1,
            R_kwadraat      = 0.001,
            richting_b1     = 0.4,
            sterkste_predictor = 0.4
          )

          parse_num <- function(x) {
            if (is.character(x)) {
              x <- trimws(x)
              x <- gsub(",", ".", x, fixed = TRUE)
              x <- gsub("%", "", x, fixed = TRUE)
            }
            suppressWarnings(as.numeric(x))
          }

          res <- lapply(names(expected), function(q) {
            if (!exists(q, envir = env))
              return(list(q = q, ok = FALSE, val = NA, reason = "missing"))
            raw <- get(q, envir = env)
            num <- parse_num(raw)
            ok  <- !is.na(num) && abs(num - expected[[q]]) <= tol[[q]]
            list(q = q, ok = ok, val = raw, num = num,
                 expected = expected[[q]], reason = if (ok) "ok" else "wrong")
          })
          names(res) <- names(expected)
          assign("results_11_1", res, envir = globalenv())
          all(vapply(res, function(x) isTRUE(x$ok), logical(1)))
        },
        TRUE,
        comparator = function(generated, expected_val, ...) {
          res <- get("results_11_1", envir = globalenv())

          labels <- c(
            afhankelijke_variabele  = "Afhankelijke variabele (Y)",
            gemiddelde_x1           = "Gemiddelde X1",
            gemiddelde_x2           = "Gemiddelde X2",
            gemiddelde_y            = "Gemiddelde Y",
            SSx1                    = "SSx1",
            SSx2                    = "SSx2",
            SSy                     = "SSy",
            SSx1x2                  = "SSx1x2 (kruisproduct predictoren)",
            SSx1y                   = "SSx1y",
            SSx2y                   = "SSx2y",
            determinant_D           = "Determinant D",
            b1                      = "Regressiegewicht b1 (politiedichtheid)",
            b2                      = "Regressiegewicht b2 (werkloosheid)",
            intercept_a             = "Intercept a",
            voorspelling            = "Voorspelling Y_hat (X1=3, X2=8)",
            R_kwadraat              = "Determinatiecoefficient R2",
            richting_b1             = "Richting van b1",
            sterkste_predictor      = "Sterkste relatieve predictor (beta)"
          )

          feedbacks <- list(
            afhankelijke_variabele = list(
              right = "Correct! **Criminaliteitsindex (Y)** is de afhankelijke variabele.",
              wrong = "De afhankelijke variabele is de variabele die je wilt verklaren: **criminaliteitsindex (Y)** -> antwoord 3."
            ),
            gemiddelde_x1 = list(
              right = "Correct! x1_gem = (1+2+3+4+5)/5 = **3.00**.",
              wrong  = "x1_gem = (1+2+3+4+5)/5 = 15/5 = **3.00**."
            ),
            gemiddelde_x2 = list(
              right = "Correct! x2_gem = (5+10+5+10+5)/5 = **7.00**.",
              wrong  = "x2_gem = (5+10+5+10+5)/5 = 35/5 = **7.00**."
            ),
            gemiddelde_y = list(
              right = "Correct! Y_gem = (20+24+16+18+12)/5 = **18.00**.",
              wrong  = "Y_gem = (20+24+16+18+12)/5 = 90/5 = **18.00**."
            ),
            SSx1 = list(
              right = "Correct! SSx1 = (-2)^2+(-1)^2+0^2+1^2+2^2 = 4+1+0+1+4 = **10**.",
              wrong  = "Afwijkingen x1-x1_gem: -2, -1, 0, 1, 2. Kwadraten: 4+1+0+1+4 = **10**."
            ),
            SSx2 = list(
              right = "Correct! Afwijkingen x2-x2_gem: -2, 3, -2, 3, -2. Kwadraten: 4+9+4+9+4 = **30**.",
              wrong  = "Afwijkingen x2-x2_gem: -2, 3, -2, 3, -2. Kwadraten: 4+9+4+9+4 = **30**."
            ),
            SSy = list(
              right = "Correct! Afwijkingen Y-Y_gem: 2, 6, -2, 0, -6. Kwadraten: 4+36+4+0+36 = **80**.",
              wrong  = "Afwijkingen Y-Y_gem: 2, 6, -2, 0, -6. Kwadraten: 4+36+4+0+36 = **80**."
            ),
            SSx1x2 = list(
              right = "Correct! (-2)(-2)+(-1)(3)+0(-2)+1(3)+2(-2) = 4-3+0+3-4 = **0**. De predictoren zijn ongecorreleerd!",
              wrong  = "Kruisproducten (x1-x1_gem)(x2-x2_gem): 4, -3, 0, 3, -4. Som = **0**. De predictoren zijn orthogonaal."
            ),
            SSx1y = list(
              right = "Correct! (-2)(2)+(-1)(6)+0(-2)+1(0)+2(-6) = -4-6+0+0-12 = **-22**.",
              wrong  = "Kruisproducten (x1-x1_gem)(Y-Y_gem): -4, -6, 0, 0, -12. Som = **-22**. Let op de negatieve tekens!"
            ),
            SSx2y = list(
              right = "Correct! (-2)(2)+3(6)+(-2)(-2)+3(0)+(-2)(-6) = -4+18+4+0+12 = **30**.",
              wrong  = "Kruisproducten (x2-x2_gem)(Y-Y_gem): -4, 18, 4, 0, 12. Som = **30**."
            ),
            determinant_D = list(
              right = "Correct! D = SSx1*SSx2 - SSx1x2^2 = 10*30 - 0^2 = **300**.",
              wrong  = "D = SSx1*SSx2 - SSx1x2^2 = 10*30 - 0 = **300**."
            ),
            b1 = list(
              right = "Correct! b1 = (SSx1y*SSx2 - SSx2y*SSx1x2)/D = ((-22)*30 - 30*0)/300 = -660/300 = **-2.20**.",
              wrong  = "b1 = (SSx1y*SSx2 - SSx2y*SSx1x2)/D = ((-22)*30 - 0)/300 = -660/300 = **-2.20**."
            ),
            b2 = list(
              right = "Correct! b2 = (SSx2y*SSx1 - SSx1y*SSx1x2)/D = (30*10 - (-22)*0)/300 = 300/300 = **1.00**.",
              wrong  = "b2 = (SSx2y*SSx1 - SSx1y*SSx1x2)/D = (300 - 0)/300 = **1.00**."
            ),
            intercept_a = list(
              right = "Correct! a = Y_gem - b1*x1_gem - b2*x2_gem = 18 - (-2.2)(3) - 1.0(7) = 18+6.6-7 = **17.60**.",
              wrong  = "a = Y_gem - b1*x1_gem - b2*x2_gem = 18 - (-2.2)(3) - (1.0)(7) = 18+6.6-7 = **17.60**."
            ),
            voorspelling = list(
              right = "Correct! Y_hat = 17.60 + (-2.20)(3) + 1.00(8) = 17.60-6.60+8.00 = **19.00**.",
              wrong  = "Y_hat = a + b1*x1 + b2*x2 = 17.60 + (-2.20)(3) + 1.00(8) = **19.00**."
            ),
            R_kwadraat = list(
              right = "Correct! R2 = (b1*SSx1y + b2*SSx2y)/SSy = ((-2.2)(-22)+1.0*30)/80 = 78.4/80 = **0.9800**.",
              wrong  = "R2 = (b1*SSx1y + b2*SSx2y)/SSy = (48.4+30)/80 = 78.4/80 = **0.9800**. Het model verklaart 98% van de variatie."
            ),
            richting_b1 = list(
              right = "Correct! b1 = -2.20 is **negatief**: meer agenten per km2 gaat samen met minder criminaliteit, ceteris paribus.",
              wrong  = "b1 = -2.20 is **negatief** (antwoord 2): meer politie -> minder criminaliteit. Let op het minteken."
            ),
            sterkste_predictor = list(
              right = "Correct! beta1 = b1*(sx1/sy) = -2.2*(sqrt(2.5)/sqrt(20)) = -0.7778 en beta2 = 0.6124. |beta1|>|beta2| -> X1 heeft het sterkste relatieve effect.",
              wrong  = "Bereken beta1 = b1*(sx1/sy) = -2.2*(sqrt(10/4)/sqrt(80/4)) = -0.78 en beta2 = 1.0*(sqrt(7.5)/sqrt(20)) = 0.61. |beta1|>|beta2| -> **X1 (politiedichtheid)** -> antwoord 1."
            )
          )

          lines  <- character(0)
          score  <- 0
          total  <- length(res)

          for (q in names(res)) {
            r   <- res[[q]]
            fb  <- feedbacks[[q]]
            lbl <- labels[[q]]
            if (isTRUE(r$ok)) {
              lines <- c(lines, paste0("\u2705 **", lbl, "**: ", fb$right))
              score <- score + 1
            } else if (identical(r$reason, "missing")) {
              lines <- c(lines, paste0("\u274c **", lbl, "**: variabele `", q, "` ontbreekt in je script."))
            } else {
              lines <- c(lines, paste0("\u274c **", lbl, "** (jouw antwoord: `", as.character(r$val), "`): ", fb$wrong))
            }
          }

          lines <- c(lines, paste0("\n**Score: ", score, " / ", total, "**"))
          get_reporter()$add_message(paste(lines, collapse = "\n\n"), type = "markdown")
          generated == expected_val
        }
      )
    }
  )
})
