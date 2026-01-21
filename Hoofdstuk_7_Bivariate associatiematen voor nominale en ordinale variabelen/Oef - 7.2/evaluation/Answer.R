context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          results <- list()

          # Given data
          total <- 2000
          n_male <- 1230
          n_female <- 770
          n_yes <- 500
          n_no <- 1500

          male_yes <- 380
          male_no <- 850
          female_yes <- 120
          female_no <- 650

          # Expected values
          exp_perc_male <- 61.5
          exp_perc_female <- 38.5
          exp_perc_yes <- 25.0
          exp_perc_no <- 75.0

          exp_perc_yes_male <- round(male_yes / n_male * 100, 2)      # 30.89
          exp_perc_yes_female <- round(female_yes / n_female * 100, 2) # 15.58
          exp_perc_diff_yes <- round(exp_perc_yes_male - exp_perc_yes_female, 2) # 15.31

          exp_odds_male <- round(male_yes / male_no, 4)       # 0.4471
          exp_odds_female <- round(female_yes / female_no, 4) # 0.1846
          exp_or <- round((male_yes / male_no) / (female_yes / female_no), 2) # 2.42

          exp_chi2 <- round(
            (male_yes - (n_male * n_yes / total))^2 / (n_male * n_yes / total) +
              (female_yes - (n_female * n_yes / total))^2 / (n_female * n_yes / total) +
              (male_no - (n_male * n_no / total))^2 / (n_male * n_no / total) +
              (female_no - (n_female * n_no / total))^2 / (n_female * n_no / total),
            4
          ) # 59.2093

          exp_p_no_female <- round(female_no / n_female, 4) # 0.8442
          exp_antwoord_mc <- 3

          parse_num <- function(val) {
            if (is.character(val)) {
              val <- gsub(",", ".", val, fixed = TRUE)
              if (grepl("%$", val)) val <- gsub("%$", "", val)
            }
            suppressWarnings(as.numeric(val))
          }

          pick_var <- function(varnames) {
            for (name in varnames) {
              if (exists(name, envir = env)) return(name)
            }
            NA_character_
          }

          check_value <- function(varnames, expected, tol = 0.01, allow_percent = TRUE) {
            used_var <- pick_var(varnames)
            if (is.na(used_var)) {
              return(list(
                exists = FALSE,
                used_var = NA_character_,
                value = NA,
                value_num = NA,
                correct = FALSE,
                expected = expected
              ))
            }
            raw <- get(used_var, envir = env)
            num <- parse_num(raw)
            if (is.na(num)) {
              return(list(
                exists = TRUE,
                used_var = used_var,
                value = raw,
                value_num = NA,
                correct = FALSE,
                expected = expected
              ))
            }

            ok <- abs(num - expected) <= tol
            if (!ok && allow_percent) {
              # Allow probability written as percent or vice versa when it is unambiguous
              if (expected <= 1 && abs(num / 100 - expected) <= tol) ok <- TRUE
              if (expected > 1 && abs(num * 100 - expected) <= tol) ok <- TRUE
            }
            list(
              exists = TRUE,
              used_var = used_var,
              value = raw,
              value_num = num,
              correct = ok,
              expected = expected
            )
          }

          # Collect results
          results$perc_male <- check_value(c("percentage_mannen", "perc_male"), exp_perc_male, tol = 0.05, allow_percent = FALSE)
          results$perc_female <- check_value(c("percentage_vrouwen", "perc_female"), exp_perc_female, tol = 0.05, allow_percent = FALSE)
          results$perc_yes <- check_value(c("percentage_yes", "perc_yes"), exp_perc_yes, tol = 0.05, allow_percent = FALSE)
          results$perc_no <- check_value(c("percentage_no", "perc_no"), exp_perc_no, tol = 0.05, allow_percent = FALSE)

          results$perc_yes_male <- check_value(c("percentage_yes_bij_mannen", "perc_yes_male"), exp_perc_yes_male, tol = 0.05, allow_percent = FALSE)
          results$perc_yes_female <- check_value(c("percentage_yes_bij_vrouwen", "perc_yes_female"), exp_perc_yes_female, tol = 0.05, allow_percent = FALSE)
          results$perc_diff_yes <- check_value(c("percentageverschil_yes", "perc_diff_yes"), exp_perc_diff_yes, tol = 0.05, allow_percent = FALSE)

          results$odds_male <- check_value(c("odds_mannen", "odds_male"), exp_odds_male, tol = 0.005, allow_percent = FALSE)
          results$odds_female <- check_value(c("odds_vrouwen", "odds_female"), exp_odds_female, tol = 0.005, allow_percent = FALSE)
          results$odds_ratio <- check_value(c("odds_ratio"), exp_or, tol = 0.05, allow_percent = FALSE)

          results$chi2 <- check_value(c("chi_kwadraat", "chi2"), exp_chi2, tol = 0.05, allow_percent = FALSE)

          results$p_no_female <- check_value(c("kans_no_bij_vrouwen", "p_no_female"), exp_p_no_female, tol = 0.01, allow_percent = TRUE)
          results$antwoord_mc <- check_value(c("antwoord_mc"), exp_antwoord_mc, tol = 0.0, allow_percent = FALSE)

          assign("detailed_results", results, envir = globalenv())
          all(sapply(results, function(x) x$correct))
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("detailed_results", envir = globalenv())

          qnames <- c(
            perc_male = "1) Percentage mannen (marginaal) (`percentage_mannen`)",
            perc_female = "1) Percentage vrouwen (marginaal) (`percentage_vrouwen`)",
            perc_yes = "1) Percentage YES (marginaal) (`percentage_yes`)",
            perc_no = "1) Percentage NO (marginaal) (`percentage_no`)",
            perc_yes_male = "2) Percentage YES bij mannen (`percentage_yes_bij_mannen`)",
            perc_yes_female = "3) Percentage YES bij vrouwen (`percentage_yes_bij_vrouwen`)",
            perc_diff_yes = "4) Percentageverschil (procentpunten) (`percentageverschil_yes`)",
            odds_male = "5) Odds mannen (YES/NO) (`odds_mannen`)",
            odds_female = "5) Odds vrouwen (YES/NO) (`odds_vrouwen`)",
            odds_ratio = "5) Odds ratio (OR) (`odds_ratio`)",
            chi2 = "6) Chi-kwadraat (chi^2) (`chi_kwadraat`)",
            p_no_female = "7) P(NO | Vrouw) (`kans_no_bij_vrouwen`)",
            antwoord_mc = "7) Meerkeuze (`antwoord_mc`)"
          )

          msg_for <- function(key) {
            r <- results[[key]]
            if (!r$exists) return("Je hebt deze variabele niet aangemaakt.")
            if (is.na(r$value_num) && !is.numeric(r$value)) return("Je antwoord kon niet als getal geinterpreteerd worden.")

            v <- r$value_num
            e <- r$expected

            if (key %in% c("perc_male", "perc_female", "perc_yes", "perc_no")) {
              if (!is.na(v) && e > 1 && abs(v - e / 100) < 0.01) {
                return("Je lijkt een proportie (0-1) te geven. Geef een **percentage** (0-100).")
              }
              if (key == "perc_male" && !is.na(v) && abs(v - 38.5) < 0.1) return("Je wisselde mannen en vrouwen om. Mannen = 1230/2000 = 61.5%.")
              if (key == "perc_female" && !is.na(v) && abs(v - 61.5) < 0.1) return("Je wisselde vrouwen en mannen om. Vrouwen = 770/2000 = 38.5%.")
              if (key == "perc_yes" && !is.na(v) && abs(v - 500) < 1) return("Je vergat te delen door het totaal. % YES = 500/2000 × 100.")
              if (key == "perc_no" && !is.na(v) && abs(v - 1500) < 1) return("Je vergat te delen door het totaal. % NO = 1500/2000 × 100.")
              return(paste0("Gebruik: (totaal categorie / 2000) × 100. Juiste waarde: ", e, "."))
            }

            if (key == "perc_yes_male") {
              if (!is.na(v) && abs(v - (380 / 2000 * 100)) < 0.1) return("Je deelde door 2000 i.p.v. door het aantal mannen. Gebruik 380/1230 × 100.")
              if (!is.na(v) && abs(v - (380 / 500 * 100)) < 0.1) return("Je deelde door totaal YES (500). Voor P(YES|Man) deel je door het aantal mannen (1230).")
              return(paste0("Gebruik: 380/1230 × 100. Juiste waarde: ", e, "%."))
            }

            if (key == "perc_yes_female") {
              if (!is.na(v) && abs(v - (120 / 2000 * 100)) < 0.1) return("Je deelde door 2000 i.p.v. door het aantal vrouwen. Gebruik 120/770 × 100.")
              if (!is.na(v) && abs(v - (120 / 500 * 100)) < 0.1) return("Je deelde door totaal YES (500). Voor P(YES|Vrouw) deel je door het aantal vrouwen (770).")
              return(paste0("Gebruik: 120/770 × 100. Juiste waarde: ", e, "%."))
            }

            if (key == "perc_diff_yes") {
              if (!is.na(v) && abs(v + e) < 0.1) return("Je nam het verschil in omgekeerde richting. Neem (mannen% - vrouwen%) voor YES.")
              if (!is.na(v) && abs(v - e / 100) < 0.01) return("Je lijkt een proportie te geven. Het verschil moet in **procentpunten** zijn (bv. 15.31).")
              return(paste0("Verschil in procentpunten: P(YES|Man) − P(YES|Vrouw). Juiste waarde: ", e, "."))
            }

            if (key == "odds_male") {
              if (!is.na(v) && abs(v - (380 / 1230)) < 0.01) return("Dat is een kans, geen odds. Odds = YES/NO = 380/850.")
              if (!is.na(v) && abs(v - (850 / 380)) < 0.05) return("Je keerde de odds om. Gebruik 380/850 (niet 850/380).")
              return(paste0("Odds mannen: YES/NO = 380/850. Juiste waarde: ", e, "."))
            }

            if (key == "odds_female") {
              if (!is.na(v) && abs(v - (120 / 770)) < 0.01) return("Dat is een kans, geen odds. Odds = YES/NO = 120/650.")
              if (!is.na(v) && abs(v - (650 / 120)) < 0.1) return("Je keerde de odds om. Gebruik 120/650 (niet 650/120).")
              return(paste0("Odds vrouwen: YES/NO = 120/650. Juiste waarde: ", e, "."))
            }

            if (key == "odds_ratio") {
              rr <- (380 / 1230) / (120 / 770)
              if (!is.na(v) && abs(v - rr) < 0.1) return("Je berekende een **risicoratio** (kansenratio). Gevraagd is de **odds ratio**: (380/850)/(120/650) ≈ 2.42.")
              if (!is.na(v) && abs(v - 1 / e) < 0.05) return("Je nam het omgekeerde (vrouwen t.o.v. mannen). Gevraagd is mannen t.o.v. vrouwen.")
              return(paste0("OR = (380/850) / (120/650). Juiste waarde: ", e, "."))
            }

            if (key == "chi2") {
              if (!is.na(v) && abs(v - 0.059) < 0.01) return("Je lijkt te delen door 1000 of met proporties te werken. Gebruik frequenties en \u03A3 (O−E)^2/E.")
              return(paste0("Voor 2×2: bereken verwachte frequenties en sommeer (O−E)^2/E. Juiste waarde: ", e, "."))
            }

            if (key == "p_no_female") {
              if (!is.na(v) && abs(v - (650 / 2000)) < 0.01) return("Je deelde door 2000 i.p.v. door het aantal vrouwen. Gebruik 650/770.")
              if (!is.na(v) && abs(v - (120 / 770)) < 0.01) return("Je nam P(YES|Vrouw) i.p.v. P(NO|Vrouw). Gebruik 650/770.")
              return(paste0("P(NO|Vrouw) = 650/770. Juiste waarde: ", e, " (≈ ", round(e * 100, 2), "%)."))
            }

            if (key == "antwoord_mc") {
              return("Correct is optie C (=3), want P(NO|Vrouw) ≈ 85%.")
            }

            paste0("Verwacht: ", e, ".")
          }

          feedback <- "**Resultaten:**\n\n"
          for (key in names(qnames)) {
            r <- results[[key]]
            if (!r$exists) {
              feedback <- paste0(feedback, "❌ ", qnames[[key]], " — geen antwoord\n\n", msg_for(key), "\n\n")
              next
            }

            if (r$correct) {
              feedback <- paste0(feedback, "✅ ", qnames[[key]], " — correct (", r$value, ")\n\n")
            } else {
              feedback <- paste0(feedback, "❌ ", qnames[[key]], " — fout (", r$value, ")\n\n", msg_for(key), "\n\n")
            }
          }

          get_reporter()$add_message(feedback, type = "markdown")
          generated == expected
        }
      )
    }
  )
})
