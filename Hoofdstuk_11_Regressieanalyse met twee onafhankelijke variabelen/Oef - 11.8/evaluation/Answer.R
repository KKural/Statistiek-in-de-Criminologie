context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          expected <- c(
            vraag1  = 2,   # R = 0.664 ~ 0.66
            vraag2  = 4,   # R2 = 0.4409 ~ 44%
            vraag3  = 3,   # 1 - 0.44 = 56%
            vraag4  = 4,   # N = 5
            vraag5  = 3,   # F = 0.79, niet significant (p = .559)
            vraag6  = 3,   # intercept = -9.98
            vraag7  = 1,   # b1 = 13.55, ceteris paribus
            vraag8  = 2,   # WanordeIndex, beta1 = 0.90
            vraag9  = 3,   # geen enkele parameter significant
            vraag10 = 3,   # CI bevat 0 -> niet significant
            vraag11 = 4    # predicted = 68.43
          )

          parse_num <- function(x) {
            if (is.character(x)) {
              x <- trimws(x)
              if (grepl("^[A-Da-d]$", x)) return(match(toupper(x), c("A", "B", "C", "D")))
              x <- gsub(",", ".", x, fixed = TRUE)
            }
            suppressWarnings(as.numeric(x))
          }

          res <- lapply(names(expected), function(q) {
            if (!exists(q, envir = env)) return(list(q = q, ok = FALSE, val = NA, reason = "missing"))
            raw <- get(q, envir = env)
            num <- parse_num(raw)
            ok <- !is.na(num) && abs(num - expected[[q]]) < 0.5
            list(q = q, ok = ok, val = raw, expected = expected[[q]], reason = if (ok) "ok" else "wrong")
          })
          names(res) <- names(expected)
          assign("mcq_results_11_8", res, envir = globalenv())

          all(vapply(res, function(x) isTRUE(x$ok), logical(1)))
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          res <- get("mcq_results_11_8", envir = globalenv())
          labels <- c(
            vraag1  = "Multiple R (2 decimalen)",
            vraag2  = "R\u00b2 als % verklaarde variantie",
            vraag3  = "% NIET verklaarde variantie",
            vraag4  = "Aantal observaties N",
            vraag5  = "F-statistiek en modelsignificantie",
            vraag6  = "Intercept en betekenis",
            vraag7  = "b\u2081 WanordeIndex en interpretatie",
            vraag8  = "Sterkste relatieve effect en parameter",
            vraag9  = "Significante regressieparameter(s)",
            vraag10 = "Betekenis 95%-CI voor b\u2081",
            vraag11 = "Voorspelde AngstScore (W=7, Z=45)"
          )

          feedbacks <- list(
            vraag1  = list(
              wrong = "R = 0.6640, afgerond op twee decimalen = **0.66** \u2192 antwoord 2.",
              right = "Correct! R = 0.6640 \u2248 **0.66** \u2014 een matige positieve samenhang."
            ),
            vraag2  = list(
              wrong = "R\u00b2 = 0.4409, dus het model verklaart **44%** van de variantie \u2192 antwoord 4.",
              right = "Correct! R\u00b2 = 0.4409 \u2014 het model verklaart **44%** van de variantie in AngstScore."
            ),
            vraag3  = list(
              wrong = "Niet-verklaarde variantie = 100% \u2212 44% = **56%** \u2192 antwoord 3.",
              right = "Correct! **56%** van de variantie in AngstScore blijft onverklaard."
            ),
            vraag4  = list(
              wrong = "De dataset bevat **5 buurten** (N = 5) \u2192 antwoord 4.",
              right = "Correct! N = **5** observaties."
            ),
            vraag5  = list(
              wrong = "F = **0.788** met p = .559 \u2014 het model is **niet** statistisch significant op 5%-niveau \u2192 antwoord 3. Let op: met slechts 5 observaties en 2 predictors zijn er maar 2 vrijheidsgraden voor de foutterm — het model is sterk onderbezet.",
              right = "Correct! F = **0.788**, p = .559. We verwerpen H\u2080 **niet** \u2014 het model is niet significant. Met N=5 en k=2 zijn er slechts df_res=2, wat de toets weinig power geeft."
            ),
            vraag6  = list(
              wrong = "Het intercept is **\u22129.98**: de verwachte AngstScore als WanordeIndex = 0 \u00e9n ZwerfvuilKlachten = 0 \u2192 antwoord 3.",
              right = "Correct! Intercept = **\u22129.98** \u2014 de (theoretische) verwachte AngstScore wanneer beide predictors nul zijn."
            ),
            vraag7  = list(
              wrong = "b\u2081 = **13.55**: een stijging van 1 eenheid in WanordeIndex gaat, gecontroleerd voor ZwerfvuilKlachten, gepaard met gemiddeld +13.55 punten in AngstScore \u2192 antwoord 1.",
              right = "Correct! b\u2081 = **13.55** ceteris paribus: +1 WanordeIndex \u2192 gemiddeld +13.55 AngstScore, gecontroleerd voor ZwerfvuilKlachten."
            ),
            vraag8  = list(
              wrong = "Het relatieve effect vergelijk je via de **gestandaardiseerde co\u00ebffici\u00ebnten (\u03b2)**. \u03b2\u2081 = 0.90 (WanordeIndex) tegenover \u03b2\u2082 = \u22120.33 (ZwerfvuilKlachten) \u2192 antwoord 2.",
              right = "Correct! **WanordeIndex** heeft het sterkste relatieve effect: \u03b2\u2081 = **0.90** tegenover |\u03b2\u2082| = 0.33. Gestandaardiseerde co\u00ebffici\u00ebnten zijn vergelijkbaar omdat ze op dezelfde schaal (z-scores) staan."
            ),
            vraag9  = list(
              wrong = "**Geen** enkele parameter is significant: WanordeIndex p = .535, ZwerfvuilKlachten p = .874, intercept p = .944. Ook het overall model is niet significant (F p = .559) \u2192 antwoord 3.",
              right = "Correct! **Geen enkele** parameter bereikt p < .05. Dit is typisch bij een zeer kleine steekproef (N=5): de standaardfouten zijn enorm groot en de toetsen hebben weinig onderscheidingsvermogen."
            ),
            vraag10 = list(
              wrong = "CI b\u2081 = [\u221244.02, 71.12]: het interval **bevat 0** \u2014 het effect van WanordeIndex is op 5%-niveau niet significant \u2192 antwoord 3.",
              right = "Correct! Het CI [\u221244.02, 71.12] bevat 0 \u2014 we kunnen geen significant effect van WanordeIndex concluderen. Het enorm brede interval weerspiegelt de grote onzekerheid bij N=5."
            ),
            vraag11 = list(
              wrong = "Voorspelling: \u22129.98 + 13.55 \u00d7 7 + (\u22120.37) \u00d7 45 = \u22129.98 + 94.85 \u2212 16.46 = **68.41 \u2248 68.43** \u2192 antwoord 4.",
              right = "Correct! \u0176 = \u22129.98 + 13.55 \u00d7 7 \u2212 0.37 \u00d7 45 = **68.43**."
            )
          )

          lines <- character(0)
          score <- 0
          total <- length(res)

          for (q in names(res)) {
            r <- res[[q]]
            fb <- feedbacks[[q]]
            if (isTRUE(r$ok)) {
              lines <- c(lines, paste0("\u2705 **", labels[[q]], "**: ", fb$right))
              score <- score + 1
            } else if (identical(r$reason, "missing")) {
              lines <- c(lines, paste0("\u274c **", labels[[q]], "**: variabele `", q, "` ontbreekt."))
            } else {
              lines <- c(lines, paste0("\u274c **", labels[[q]], "** (jouw antwoord: `", as.character(r$val), "`): ", fb$wrong))
            }
          }

          lines <- c(lines, paste0("\n**Score: ", score, " / ", total, "**"))
          get_reporter()$add_message(paste(lines, collapse = "\n\n"), type = "markdown")

          generated == expected
        }
      )
    }
  )
})


          parse_num <- function(x) {
            if (is.character(x)) {
              x <- trimws(x)
              if (grepl("^[A-Da-d]$", x)) return(match(toupper(x), c("A", "B", "C", "D")))
              x <- gsub(",", ".", x, fixed = TRUE)
            }
            suppressWarnings(as.numeric(x))
          }

          res <- lapply(names(expected), function(q) {
            if (!exists(q, envir = env)) return(list(q = q, ok = FALSE, val = NA, reason = "missing"))
            raw <- get(q, envir = env)
            num <- parse_num(raw)
            ok <- !is.na(num) && abs(num - expected[[q]]) < 0.5
            list(q = q, ok = ok, val = raw, expected = expected[[q]], reason = if (ok) "ok" else "wrong")
          })
          names(res) <- names(expected)
          assign("mcq_results_11_8", res, envir = globalenv())

          all(vapply(res, function(x) isTRUE(x$ok), logical(1)))
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          res <- get("mcq_results_11_8", envir = globalenv())
          labels <- c(
            vraag1  = "Multiple R (2 decimalen)",
            vraag2  = "R² als % verklaarde variantie",
            vraag3  = "% NIET verklaarde variantie",
            vraag4  = "Aantal observaties N",
            vraag5  = "F-statistiek en modelssignificantie",
            vraag6  = "Intercept en betekenis",
            vraag7  = "b1 WanordeIndex en interpretatie",
            vraag8  = "Sterkste relatieve effect en parameter",
            vraag9  = "Significante regressieparameter(s)",
            vraag10 = "Betekenis 95%-CI voor b1",
            vraag11 = "Voorspelde AngstScore (W=6, Z=55)"
          )

          feedbacks <- list(
            vraag1  = list(
              wrong = "R = 0.8055, afgerond op twee decimalen = **0.81** \u2192 antwoord 2.",
              right = "Correct! R = 0.8055 \u2248 **0.81** \u2014 een sterke positieve samenhang tussen de predictors en AngstScore."
            ),
            vraag2  = list(
              wrong = "R\u00b2 = 0.6488, dus het model verklaart **64.88% \u2248 65%** van de variantie \u2192 antwoord 3.",
              right = "Correct! R\u00b2 = 0.6488 \u2014 het model verklaart **65%** van de variantie in AngstScore."
            ),
            vraag3  = list(
              wrong = "Niet-verklaarde variantie = 100% \u2212 65% = **35%** \u2192 antwoord 3.",
              right = "Correct! **35%** van de variantie in AngstScore blijft onverklaard (100% \u2212 65%)."
            ),
            vraag4  = list(
              wrong = "De dataset bevat **20 buurten** (N = 20) \u2192 antwoord 3.",
              right = "Correct! N = **20** observaties (buurten)."
            ),
            vraag5  = list(
              wrong = "F = **15.704** met p < .001 \u2014 het model is statistisch significant \u2192 antwoord 1.",
              right = "Correct! F = **15.704**, p < .001. We verwerpen H\u2080 dat alle b-coeff gelijk aan 0 zijn \u2014 het model is significant."
            ),
            vraag6  = list(
              wrong = "Het intercept is **16.21**: de verwachte AngstScore als WanordeIndex = 0 \u00e9n ZwerfvuilKlachten = 0 \u2192 antwoord 3.",
              right = "Correct! Intercept = **16.21** \u2014 de verwachte AngstScore wanneer beide predictors gelijk zijn aan nul."
            ),
            vraag7  = list(
              wrong = "b\u2081 = **6.09**: een stijging van 1 eenheid in WanordeIndex gaat, gecontroleerd voor ZwerfvuilKlachten, gepaard met gemiddeld +6.09 punten in AngstScore \u2192 antwoord 1.",
              right = "Correct! b\u2081 = **6.09** ceteris paribus: +1 WanordeIndex \u2192 gemiddeld +6.09 AngstScore, gecontroleerd voor ZwerfvuilKlachten."
            ),
            vraag8  = list(
              wrong = "Het relatieve effect vergelijk je via de **gestandaardiseerde co\u00ebffici\u00ebnten (\u03b2)**. \u03b2\u2081 = 0.76 (WanordeIndex) >> \u03b2\u2082 = 0.06 (ZwerfvuilKlachten) \u2192 antwoord 2.",
              right = "Correct! **WanordeIndex** heeft het sterkste relatieve effect: \u03b2\u2081 = **0.76** tegenover \u03b2\u2082 = 0.06. Gestandaardiseerde co\u00ebffici\u00ebnten zijn vergelijkbaar omdat ze op dezelfde schaal (z-scores) staan."
            ),
            vraag9  = list(
              wrong = "Alleen **WanordeIndex** is significant (p < .001). ZwerfvuilKlachten heeft p = .729 \u2014 niet significant op 5%-niveau \u2192 antwoord 2.",
              right = "Correct! Alleen **WanordeIndex** is statistisch significant (p < .001). ZwerfvuilKlachten is niet significant (p = .729)."
            ),
            vraag10 = list(
              wrong = "CI b\u2081 = [3.02, 9.16]: het interval bevat **niet de nul**, wat betekent dat het effect statistisch significant positief is. Bij herhaald steekproeven bevat 95% van de zo geconstrueerde intervallen de ware parameter \u2192 antwoord 2.",
              right = "Correct! Het CI [3.02, 9.16] bevat geen nul \u2014 het effect is statistisch significant positief. De 95%-interpretatie verwijst naar de procedure over herhaalde steekproeven."
            ),
            vraag11 = list(
              wrong = paste0("Voorspelling: 16.21 + 6.09 \u00d7 6 + 0.06 \u00d7 55 = 16.21 + 36.53 + 3.46 = **56.20** \u2192 antwoord 3."),
              right = "Correct! \u0176 = 16.21 + 6.09 \u00d7 6 + 0.06 \u00d7 55 = **56.20**."
            )
          )

          lines <- character(0)
          score <- 0
          total <- length(res)

          for (q in names(res)) {
            r <- res[[q]]
            fb <- feedbacks[[q]]
            if (isTRUE(r$ok)) {
              lines <- c(lines, paste0("\u2705 **", labels[[q]], "**: ", fb$right))
              score <- score + 1
            } else if (identical(r$reason, "missing")) {
              lines <- c(lines, paste0("\u274c **", labels[[q]], "**: variabele `", q, "` ontbreekt."))
            } else {
              lines <- c(lines, paste0("\u274c **", labels[[q]], "** (jouw antwoord: `", as.character(r$val), "`): ", fb$wrong))
            }
          }

          lines <- c(lines, paste0("\n**Score: ", score, " / ", total, "**"))
          get_reporter()$add_message(paste(lines, collapse = "\n\n"), type = "markdown")

          generated == expected
        }
      )
    }
  )
})
