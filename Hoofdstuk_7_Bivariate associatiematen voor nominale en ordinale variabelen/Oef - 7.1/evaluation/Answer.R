context({
  testcase(
    "Geslacht en crimineel gedrag",
    {
      testEqual(
        "",
        function(env) {
          results <- list()

          # Data from the table
          total <- 2000

          male_yes <- 380
          male_no <- 850
          female_yes <- 120
          female_no <- 650

          n_male <- male_yes + male_no
          n_female <- female_yes + female_no
          n_yes <- male_yes + female_yes
          n_no <- male_no + female_no

          # Expected values (used for checking, not shown to students)
          exp_perc_male <- n_male / total * 100
          exp_perc_female <- n_female / total * 100
          exp_perc_yes <- n_yes / total * 100
          exp_perc_no <- n_no / total * 100

          exp_perc_yes_male <- male_yes / n_male * 100
          exp_perc_yes_female <- female_yes / n_female * 100
          exp_perc_diff_yes <- exp_perc_yes_male - exp_perc_yes_female

          exp_odds_male <- male_yes / male_no
          exp_odds_female <- female_yes / female_no
          exp_or <- exp_odds_male / exp_odds_female

          exp_chi2 <- (male_yes - (n_male * n_yes / total))^2 / (n_male * n_yes / total) +
            (female_yes - (n_female * n_yes / total))^2 / (n_female * n_yes / total) +
            (male_no - (n_male * n_no / total))^2 / (n_male * n_no / total) +
            (female_no - (n_female * n_no / total))^2 / (n_female * n_no / total)

          exp_p_no_female <- female_no / n_female
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
              return(list(exists = FALSE, used_var = NA_character_, value = NA, value_num = NA, correct = FALSE, expected = expected))
            }

            raw <- get(used_var, envir = env)
            num <- parse_num(raw)
            if (is.na(num)) {
              return(list(exists = TRUE, used_var = used_var, value = raw, value_num = NA, correct = FALSE, expected = expected))
            }

            ok <- abs(num - expected) <= tol
            if (!ok && allow_percent) {
              if (expected <= 1 && abs(num / 100 - expected) <= tol) ok <- TRUE
              if (expected > 1 && abs(num * 100 - expected) <= tol) ok <- TRUE
            }

            list(exists = TRUE, used_var = used_var, value = raw, value_num = num, correct = ok, expected = expected)
          }

          # Collected results (accept both full and older short variable names)
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

          # Provide constants to the comparator (for diagnostic feedback)
          assign("detailed_results", results, envir = globalenv())
          assign(
            "given_constants",
            list(
              total = total,
              male_yes = male_yes,
              male_no = male_no,
              female_yes = female_yes,
              female_no = female_no,
              n_male = n_male,
              n_female = n_female,
              n_yes = n_yes,
              n_no = n_no
            ),
            envir = globalenv()
          )

          all(sapply(results, function(x) x$correct))
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("detailed_results", envir = globalenv())
          cst <- get("given_constants", envir = globalenv())

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

          approx_eq <- function(a, b, tol = 0.01) {
            !is.na(a) && abs(a - b) <= tol
          }

          wrong_msg <- function(key) {
            r <- results[[key]]
            if (!r$exists) return("Je hebt deze variabele niet ingevuld.")
            if (is.na(r$value_num)) return("Je antwoord kon niet als getal geinterpreteerd worden.")

            v <- r$value_num
            e <- r$expected

            if (key %in% c("perc_male", "perc_female", "perc_yes", "perc_no")) {
              if (v >= 0 && v <= 1) return("Je lijkt een proportie (0-1) te geven. Geef een percentage (0-100).")
              if (abs(v - cst$total) < 1) return("Je gaf het totaal N. Gevraagd is een percentage: (totaal categorie / 2000) * 100.")
              if (abs(v - cst$n_male) < 1 || abs(v - cst$n_female) < 1 || abs(v - cst$n_yes) < 1 || abs(v - cst$n_no) < 1) {
                return("Je gaf een absolute frequentie (aantal). Gevraagd is een percentage: (totaal categorie / 2000) * 100.")
              }
              if (key == "perc_male" && abs(v - (cst$n_female / cst$total * 100)) < 0.1) return("Je wisselde mannen en vrouwen om. Gebruik totaal mannen / 2000.")
              if (key == "perc_female" && abs(v - (cst$n_male / cst$total * 100)) < 0.1) return("Je wisselde vrouwen en mannen om. Gebruik totaal vrouwen / 2000.")
              if (key == "perc_yes" && abs(v - (cst$n_no / cst$total * 100)) < 0.1) return("Je wisselde YES en NO om. Gebruik totaal YES / 2000.")
              if (key == "perc_no" && abs(v - (cst$n_yes / cst$total * 100)) < 0.1) return("Je wisselde NO en YES om. Gebruik totaal NO / 2000.")
              return("Gebruik: (totaal categorie / 2000) * 100. Controleer ook je afronding.")
            }

            if (key == "perc_yes_male") {
              if (approx_eq(v, e / 100, tol = 0.01)) return("Je lijkt een kans (0-1) te geven i.p.v. een percentage. Vermenigvuldig met 100.")
              if (approx_eq(v, (cst$male_yes / cst$total * 100), tol = 0.1)) return("Je deelde door 2000 i.p.v. door het aantal mannen. Gebruik: (YES bij mannen / totaal mannen) * 100.")
              if (approx_eq(v, (cst$male_yes / cst$n_yes * 100), tol = 0.2)) return("Je gebruikte het totaal YES als noemer. Voor P(YES|Man) deel je door het totaal aantal mannen.")
              if (approx_eq(v, (cst$male_yes / cst$male_no), tol = 0.02) || approx_eq(v, (cst$male_yes / cst$male_no * 100), tol = 0.2)) {
                return("Je lijkt odds (YES/NO) te hebben berekend. Voor een percentage gebruik je YES / (YES + NO) binnen mannen, maal 100.")
              }
              return("Gebruik: (YES bij mannen / totaal mannen) * 100. Rond af op 2 decimalen.")
            }

            if (key == "perc_yes_female") {
              if (approx_eq(v, e / 100, tol = 0.01)) return("Je lijkt een kans (0-1) te geven i.p.v. een percentage. Vermenigvuldig met 100.")
              if (approx_eq(v, (cst$female_yes / cst$total * 100), tol = 0.1)) return("Je deelde door 2000 i.p.v. door het aantal vrouwen. Gebruik: (YES bij vrouwen / totaal vrouwen) * 100.")
              if (approx_eq(v, (cst$female_yes / cst$n_yes * 100), tol = 0.2)) return("Je gebruikte het totaal YES als noemer. Voor P(YES|Vrouw) deel je door het totaal aantal vrouwen.")
              if (approx_eq(v, (cst$female_yes / cst$female_no), tol = 0.02) || approx_eq(v, (cst$female_yes / cst$female_no * 100), tol = 0.2)) {
                return("Je lijkt odds (YES/NO) te hebben berekend. Voor een percentage gebruik je YES / (YES + NO) binnen vrouwen, maal 100.")
              }
              return("Gebruik: (YES bij vrouwen / totaal vrouwen) * 100. Rond af op 2 decimalen.")
            }

            if (key == "perc_diff_yes") {
              if (approx_eq(v, e / 100, tol = 0.01)) return("Je lijkt een proportieverschil (0-1) te geven. Geef het verschil in procentpunten (0-100 schaal).")
              if (abs(v + e) < 0.1) return("Je nam het verschil in omgekeerde richting. Neem (mannen% - vrouwen%) voor YES.")
              if (abs(v) < 1) return("Je antwoord is erg klein. Controleer of je wel met percentages (0-100) werkt.")
              return("Verschil in procentpunten: P(YES|Man) - P(YES|Vrouw). Gebruik kolompercentages (kolommen = 100%).")
            }

            if (key == "odds_male") {
              if (approx_eq(v, (cst$male_yes / cst$n_male), tol = 0.01) || approx_eq(v, (cst$male_yes / cst$n_male * 100), tol = 0.2)) {
                return("Je berekende een kans (YES/totaal mannen). Odds zijn YES/NO binnen mannen.")
              }
              if (approx_eq(v, (cst$male_no / cst$male_yes), tol = 0.05)) return("Je keerde de odds om. Gebruik YES/NO (niet NO/YES).")
              if (v > 1 && approx_eq(v / 100, (cst$male_yes / cst$male_no), tol = 0.01)) return("Je lijkt odds als percentage te geven. Odds zijn een verhouding (geen %).")
              return("Odds mannen: YES/NO. Rond af op 4 decimalen.")
            }

            if (key == "odds_female") {
              if (approx_eq(v, (cst$female_yes / cst$n_female), tol = 0.01) || approx_eq(v, (cst$female_yes / cst$n_female * 100), tol = 0.2)) {
                return("Je berekende een kans (YES/totaal vrouwen). Odds zijn YES/NO binnen vrouwen.")
              }
              if (approx_eq(v, (cst$female_no / cst$female_yes), tol = 0.1)) return("Je keerde de odds om. Gebruik YES/NO (niet NO/YES).")
              if (v > 1 && approx_eq(v / 100, (cst$female_yes / cst$female_no), tol = 0.01)) return("Je lijkt odds als percentage te geven. Odds zijn een verhouding (geen %).")
              return("Odds vrouwen: YES/NO. Rond af op 4 decimalen.")
            }

            if (key == "odds_ratio") {
              rr <- (cst$male_yes / cst$n_male) / (cst$female_yes / cst$n_female)
              if (approx_eq(v, rr, tol = 0.1)) return("Je berekende een risicoratio (kansenratio). Gevraagd is de odds ratio: (YES/NO bij mannen) / (YES/NO bij vrouwen).")
              if (approx_eq(v, 1 / e, tol = 0.05)) return("Je nam het omgekeerde (vrouwen t.o.v. mannen). Gevraagd is mannen t.o.v. vrouwen.")
              if (approx_eq(v, (cst$male_yes * cst$female_no) / (cst$male_no * cst$female_yes), tol = 0.1)) return("Je zit dicht bij een correcte methode. Voor 2x2 mag je OR ook berekenen als (a*d)/(b*c). Controleer je afronding.")
              return("OR = (YES/NO bij mannen) / (YES/NO bij vrouwen). Rond af op 2 decimalen.")
            }

            if (key == "chi2") {
              if (v < 1) return("Je chi^2 is erg klein. Voor chi-kwadraat gebruik je frequenties en sommeer je per cel (O - E)^2/E.")
              if (approx_eq(v, e / cst$total, tol = 0.01)) return("Je lijkt nog eens door N te delen. Bij chi-kwadraat deel je per cel door E, niet door N.")
              if (v > 500) return("Je chi^2 is erg groot. Controleer of je per cel (O - E)^2 door E deelt en daarna optelt.")
              return("Bereken de verwachte frequenties E_ij en tel per cel (O - E)^2/E op. Rond af op 4 decimalen.")
            }

            if (key == "p_no_female") {
              if (approx_eq(v, (cst$female_no / cst$total), tol = 0.01)) return("Je deelde door 2000 i.p.v. door het aantal vrouwen. Gebruik (NO bij vrouwen) / (totaal vrouwen).")
              if (approx_eq(v, (cst$female_yes / cst$n_female), tol = 0.01)) return("Je nam P(YES|Vrouw) i.p.v. P(NO|Vrouw). Gebruik NO bij vrouwen / totaal vrouwen.")
              if (approx_eq(v, (cst$male_no / cst$n_male), tol = 0.02)) return("Je berekende P(NO|Man). Hier wordt P(NO|Vrouw) gevraagd.")
              return("Gebruik: P(NO|Vrouw) = (NO bij vrouwen) / (totaal vrouwen). Je mag dit als kans (0-1) of als percentage geven.")
            }

            if (key == "antwoord_mc") {
              if (v < 1 || v > 4) return("Geef een keuze van 1 t.e.m. 4 (A=1, B=2, C=3, D=4).")
              if (v %in% c(0, 0.5, 50, 0.85, 85)) return("Je lijkt een kans/percentage te geven. Hier moet je enkel de optie (1-4) invullen.")
              return("Bereken P(NO|Vrouw) en kies de optie (A-D) die het best overeenkomt met je percentage.")
            }

            "Controleer je berekening en afronding."
          }

          feedback <- "**Resultaten:**\n\n"
          for (key in names(qnames)) {
            r <- results[[key]]
            if (!r$exists) {
              feedback <- paste0(feedback, "[FOUT] ", qnames[[key]], " — geen antwoord.\n\n", wrong_msg(key), "\n\n")
              next
            }
            if (r$correct) {
              feedback <- paste0(feedback, "[OK] ", qnames[[key]], " — correct.\n\n")
            } else {
              feedback <- paste0(feedback, "[FOUT] ", qnames[[key]], " — fout (", r$value, ").\n\n", wrong_msg(key), "\n\n")
            }
          }

          get_reporter()$add_message(feedback, type = "markdown")
          generated == expected
        }
      )
    }
  )
})
