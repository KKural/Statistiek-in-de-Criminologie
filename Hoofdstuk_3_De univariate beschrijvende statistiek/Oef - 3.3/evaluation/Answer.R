context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          # ---------------------------------------
          # Helper functions for safe extraction
          # ---------------------------------------
          get_numeric <- function(name, env) {
            if (!exists(name, envir = env)) return(list(exists = FALSE, value = NA))
            val <- get(name, envir = env)
            if (is.numeric(val)) {
              return(list(exists = TRUE, value = as.numeric(val)))
            }
            out <- tryCatch(as.numeric(eval(val, envir = env)), error = function(e) NA)
            list(exists = TRUE, value = out)
          }
          
          get_string <- function(name, env) {
            if (!exists(name, envir = env)) return(list(exists = FALSE, value = NA))
            val <- get(name, envir = env)
            if (is.character(val) || is.factor(val)) {
              return(list(exists = TRUE, value = as.character(val)))
            }
            out <- tryCatch(as.character(eval(val, envir = env)), error = function(e) as.character(val))
            list(exists = TRUE, value = out)
          }
          
          get_vector_numeric <- function(name, env) {
            if (!exists(name, envir = env)) return(list(exists = FALSE, value = NA))
            val <- get(name, envir = env)
            if (is.numeric(val)) {
              return(list(exists = TRUE, value = as.numeric(val)))
            }
            out <- tryCatch(as.numeric(eval(val, envir = env)), error = function(e) NA)
            list(exists = TRUE, value = out)
          }
          
          results <- list()
          
          # ---------------------------------------
          # DATA & EXPECTED VALUES (Oefening 3)
          # ---------------------------------------
          waarden <- c(24, 36, 35, 28, 24, 28, 24, 36, 32, 36,
                       40, 38, 36, 34, 40, 36, 32, 36, 40, 36)
          
          n <- length(waarden)                      # 20
          expected_mean    <- mean(waarden)         # 33.55
          expected_median  <- median(waarden)       # 36
          # modus: waarde met hoogste frequentie
          tbl <- table(waarden)
          expected_mode    <- as.numeric(names(tbl)[which.max(tbl)])
          
          # kwartielen & IKA handmatig volgens jouw oplossing
          expected_q1  <- 30
          expected_q3  <- 36
          expected_ika <- expected_q3 - expected_q1   # 6
          
          # frequenties & percentages
          freq <- table(waarden)
          get_freq <- function(x) as.numeric(freq[as.character(x)])
          get_pct  <- function(x) get_freq(x) / n * 100
          
          expected_freqs <- c(
            "freq_24" = get_freq(24),
            "freq_28" = get_freq(28),
            "freq_32" = get_freq(32),
            "freq_34" = get_freq(34),
            "freq_35" = get_freq(35),
            "freq_36" = get_freq(36),
            "freq_38" = get_freq(38),
            "freq_40" = get_freq(40)
          )
          
          expected_pcts <- c(
            "percent_24" = get_pct(24),
            "percent_28" = get_pct(28),
            "percent_32" = get_pct(32),
            "percent_34" = get_pct(34),
            "percent_35" = get_pct(35),
            "percent_36" = get_pct(36),
            "percent_38" = get_pct(38),
            "percent_40" = get_pct(40)
          )
          
          # afwijkingen en gekwadrateerde afwijkingen (vector!)
          expected_deviations <- waarden - expected_mean
          expected_squared    <- expected_deviations^2
          expected_ss         <- sum(expected_squared)
          expected_variance   <- expected_ss / (n - 1)
          expected_sd         <- sqrt(expected_variance)
          expected_cv         <- expected_sd / expected_mean
          
          # ---------------------------------------
          # STAP 1: FREQUENTIES & CENTRALITEIT
          # ---------------------------------------
          # Frequenties
          for (nm in names(expected_freqs)) {
            tmp <- get_numeric(nm, env)
            results[[nm]] <- list(
              exists  = tmp$exists,
              value   = tmp$value,
              correct = tmp$exists && !is.na(tmp$value) &&
                        abs(tmp$value - expected_freqs[[nm]]) < 1e-6,
              expected = expected_freqs[[nm]]
            )
          }
          
          # Percentages
          for (nm in names(expected_pcts)) {
            tmp <- get_numeric(nm, env)
            results[[nm]] <- list(
              exists  = tmp$exists,
              value   = tmp$value,
              correct = tmp$exists && !is.na(tmp$value) &&
                        abs(tmp$value - expected_pcts[[nm]]) < 0.01,  # bv. 15, 10, 35, ...
              expected = expected_pcts[[nm]]
            )
          }
          
          # Modus, mediaan, gemiddelde
          tmp <- get_numeric("modus", env)
          results$modus <- list(
            exists  = tmp$exists,
            value   = tmp$value,
            correct = tmp$exists && !is.na(tmp$value) &&
                      abs(tmp$value - expected_mode) < 0.01,
            expected = expected_mode
          )
          
          tmp <- get_numeric("mediaan", env)
          results$mediaan <- list(
            exists  = tmp$exists,
            value   = tmp$value,
            correct = tmp$exists && !is.na(tmp$value) &&
                      abs(tmp$value - expected_median) < 0.01,
            expected = expected_median
          )
          
          tmp <- get_numeric("gemiddelde", env)
          results$gemiddelde <- list(
            exists  = tmp$exists,
            value   = tmp$value,
            correct = tmp$exists && !is.na(tmp$value) &&
                      abs(tmp$value - expected_mean) < 0.01,
            expected = expected_mean
          )
          
          # ---------------------------------------
          # STAP 2: SPREIDING & KEUZES
          # ---------------------------------------
          tmp <- get_numeric("variatiebreedte", env)
          results$variatiebreedte <- list(
            exists  = tmp$exists,
            value   = tmp$value,
            correct = tmp$exists && !is.na(tmp$value) &&
                      abs(tmp$value - (max(waarden) - min(waarden))) < 0.01,
            expected = max(waarden) - min(waarden)
          )
          
          tmp <- get_numeric("q1", env)
          results$q1 <- list(
            exists  = tmp$exists,
            value   = tmp$value,
            correct = tmp$exists && !is.na(tmp$value) &&
                      abs(tmp$value - expected_q1) < 0.01,
            expected = expected_q1
          )
          
          tmp <- get_numeric("q3", env)
          results$q3 <- list(
            exists  = tmp$exists,
            value   = tmp$value,
            correct = tmp$exists && !is.na(tmp$value) &&
                      abs(tmp$value - expected_q3) < 0.01,
            expected = expected_q3
          )
          
          tmp <- get_numeric("ika", env)
          results$ika <- list(
            exists  = tmp$exists,
            value   = tmp$value,
            correct = tmp$exists && !is.na(tmp$value) &&
                      abs(tmp$value - expected_ika) < 0.01,
            expected = expected_ika
          )
          
          # Keuze van centrale maat / spreidingsmaat / reden
          tmp <- get_string("meest_relevante_centraliteit", env)
          results$meest_relevante_centraliteit <- list(
            exists  = tmp$exists,
            value   = tmp$value,
            correct = tmp$exists && !is.na(tmp$value) &&
                      tolower(trimws(tmp$value)) == "gemiddelde",
            expected = "gemiddelde"
          )
          
          tmp <- get_string("meest_relevante_spreiding", env)
          results$meest_relevante_spreiding <- list(
            exists  = tmp$exists,
            value   = tmp$value,
            correct = tmp$exists && !is.na(tmp$value) &&
                      tolower(trimws(tmp$value)) == "interkwartielafstand",
            expected = "interkwartielafstand"
          )
          
          tmp <- get_string("reden", env)
          results$reden <- list(
            exists  = tmp$exists,
            value   = tmp$value,
            correct = tmp$exists && !is.na(tmp$value) &&
                      tolower(trimws(tmp$value)) == "gebruikt alle informatie",
            expected = "gebruikt alle informatie"
          )
          
          # ---------------------------------------
          # STAP 3: AFWIJKINGEN & VARIANTIE
          # ---------------------------------------
          # Vector met afwijkingen
          tmp <- get_vector_numeric("afwijkingen", env)
          results$afwijkingen <- list(
            exists  = tmp$exists,
            value   = tmp$value,
            correct = tmp$exists &&
                      !any(is.na(tmp$value)) &&
                      length(tmp$value) == length(expected_deviations) &&
                      all(abs(tmp$value - expected_deviations) < 0.01),
            expected = expected_deviations
          )
          
          # Vector met gekwadrateerde afwijkingen
          tmp <- get_vector_numeric("gekwadrateerde_afwijkingen", env)
          results$gekwadrateerde_afwijkingen <- list(
            exists  = tmp$exists,
            value   = tmp$value,
            correct = tmp$exists &&
                      !any(is.na(tmp$value)) &&
                      length(tmp$value) == length(expected_squared) &&
                      all(abs(tmp$value - expected_squared) < 0.01),
            expected = expected_squared
          )
          
          # Som van kwadraten
          tmp <- get_numeric("sum_of_squares", env)
          results$sum_of_squares <- list(
            exists  = tmp$exists,
            value   = tmp$value,
            correct = tmp$exists && !is.na(tmp$value) &&
                      abs(tmp$value - expected_ss) < 0.01,
            expected = expected_ss
          )
          
          # Variantie (steekproef)
          tmp <- get_numeric("variantie", env)
          results$variantie <- list(
            exists  = tmp$exists,
            value   = tmp$value,
            correct = tmp$exists && !is.na(tmp$value) &&
                      abs(tmp$value - expected_variance) < 0.01,
            expected = expected_variance
          )
          
          # Standaardafwijking
          tmp <- get_numeric("standaardafwijking", env)
          results$standaardafwijking <- list(
            exists  = tmp$exists,
            value   = tmp$value,
            correct = tmp$exists && !is.na(tmp$value) &&
                      abs(tmp$value - expected_sd) < 0.01,
            expected = expected_sd
          )
          
          # Variatiecoëfficiënt
          tmp <- get_numeric("variatiecoefficient", env)
          results$variatiecoefficient <- list(
            exists  = tmp$exists,
            value   = tmp$value,
            correct = tmp$exists && !is.na(tmp$value) &&
                      abs(tmp$value - expected_cv) < 0.001,
            expected = expected_cv
          )
          
          # Bewaar alles voor comparator
          assign("detailed_results", results, envir = globalenv())
          
          # Overall resultaat
          all_correct <- all(sapply(results, function(x) x$correct))
          all_correct
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("detailed_results", envir = globalenv())
          
          feedback_parts <- c("**Resultaten per onderdeel:**\n")
          
          nice_names <- c(
            "freq_24" = "1.1 Frequentie 24",
            "freq_28" = "1.1 Frequentie 28",
            "freq_32" = "1.1 Frequentie 32",
            "freq_34" = "1.1 Frequentie 34",
            "freq_35" = "1.1 Frequentie 35",
            "freq_36" = "1.1 Frequentie 36",
            "freq_38" = "1.1 Frequentie 38",
            "freq_40" = "1.1 Frequentie 40",
            "percent_24" = "1.2 Percentage 24",
            "percent_28" = "1.2 Percentage 28",
            "percent_32" = "1.2 Percentage 32",
            "percent_34" = "1.2 Percentage 34",
            "percent_35" = "1.2 Percentage 35",
            "percent_36" = "1.2 Percentage 36",
            "percent_38" = "1.2 Percentage 38",
            "percent_40" = "1.2 Percentage 40",
            "modus"        = "1.3 Modus",
            "mediaan"      = "1.3 Mediaan",
            "gemiddelde"   = "1.3 Gemiddelde",
            "variatiebreedte" = "2.1 Variatiebreedte",
            "q1"              = "2.1 Eerste kwartiel (Q1)",
            "q3"              = "2.1 Derde kwartiel (Q3)",
            "ika"             = "2.1 Interkwartielafstand",
            "meest_relevante_centraliteit" = "2.2 Keuze centrale maat",
            "meest_relevante_spreiding"    = "2.2 Keuze spreidingsmaat",
            "reden"                         = "2.2 Reden",
            "afwijkingen"                  = "3.1 Afwijkingen (vector)",
            "gekwadrateerde_afwijkingen"   = "3.2 Gekwadrateerde afwijkingen (vector)",
            "sum_of_squares"               = "3.3 Som gekwadrateerde afwijkingen",
            "variantie"                    = "3.3 Variantie",
            "standaardafwijking"           = "3.3 Standaardafwijking",
            "variatiecoefficient"          = "3.3 Variatiecoëfficiënt"
          )
          
          counter <- 1
          for (nm in names(nice_names)) {
            res <- results[[nm]]
            label <- nice_names[[nm]]
            if (!res$exists) {
              feedback_parts <- c(feedback_parts,
                                  paste0(counter, ". **", label, "**: *Ontbreekt* ❌"))
            } else if (res$correct) {
              if (nm %in% c("afwijkingen", "gekwadrateerde_afwijkingen")) {
                feedback_parts <- c(feedback_parts,
                                    paste0(counter, ". **", label, "**: c(",
                                           paste(round(res$value, 2), collapse = ", "),
                                           ") ✅"))
              } else {
                feedback_parts <- c(feedback_parts,
                                    paste0(counter, ". **", label, "**: ",
                                           paste(round(res$value, 4), collapse = ", "),
                                           " ✅"))
              }
            } else {
              if (nm %in% c("afwijkingen", "gekwadrateerde_afwijkingen")) {
                feedback_parts <- c(feedback_parts,
                                    paste0(counter, ". **", label, "**: c(",
                                           paste(round(res$value, 2), collapse = ", "),
                                           ") ❌"))
              } else {
                feedback_parts <- c(feedback_parts,
                                    paste0(counter, ". **", label, "**: ",
                                           paste(round(res$value, 4), collapse = ", "),
                                           " ❌"))
              }
            }
            counter <- counter + 1
          }
          
          correct_count <- sum(sapply(results, function(x) x$correct))
          total_count   <- length(results)
          
          feedback_parts <- c(
            feedback_parts,
            "",
            paste0("**", correct_count, " van ", total_count, " onderdelen juist.**"),
            "",
            "🔍 **Belangrijke regels (intervaldata & spreiding):**",
            "• Frequentie → tel hoe vaak elke waarde voorkomt.",
            "• Percentage = (frequentie / n) × 100.",
            "• Modus = meest voorkomende waarde (hier: 36).",
            "• Mediaan = middelste waarde (na sorteren).",
            "• Variatiebreedte = max − min.",
            "• IKA = Q3 − Q1 (hier: 36 − 30 = 6).",
            "• Afwijkingen = X − gemiddelde (mogen negatief zijn).",
            "• Variantie (steekproef) = som(gekwadrateerde afwijkingen)/(n − 1).",
            "• Standaardafwijking = √variantie.",
            "• Variatiecoëfficiënt = SD/gemiddelde.",
            "• Bij intervaldata is **gemiddelde** + **interkwartielafstand** een goede keuze;",
            "  het gemiddelde **gebruikt alle informatie** (alle waarden tellen mee)."
          )
          
          get_reporter()$add_message(
            paste(feedback_parts, collapse = "\n\n"),
            type = "markdown"
          )
          
          generated == expected
        }
      )
    }
  )
})
