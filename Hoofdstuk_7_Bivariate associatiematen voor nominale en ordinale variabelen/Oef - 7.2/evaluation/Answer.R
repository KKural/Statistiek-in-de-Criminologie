context({
  testcase(
    "Vuurwapenbezit en geslacht",
    {
      testEqual(
        "",
        function(env) {
          results <- list()

          total <- 1857

          male_yes <- 343
          male_no <- 474
          female_yes <- 260
          female_no <- 780

          n_male <- male_yes + male_no
          n_female <- female_yes + female_no
          n_yes <- male_yes + female_yes
          n_no <- male_no + female_no

          exp_perc_yes_male <- male_yes / n_male * 100
          exp_perc_yes_female <- female_yes / n_female * 100
          exp_perc_diff <- exp_perc_yes_male - exp_perc_yes_female

          exp_e11 <- (n_yes * n_male / total)
          exp_e21 <- (n_yes * n_female / total)
          exp_e12 <- (n_no * n_male / total)
          exp_e22 <- (n_no * n_female / total)

          exp_chi2 <- (male_yes - exp_e11)^2 / exp_e11 +
            (female_yes - exp_e21)^2 / exp_e21 +
            (male_no - exp_e12)^2 / exp_e12 +
            (female_no - exp_e22)^2 / exp_e22

          exp_chi2_yates <- suppressWarnings(chisq.test(
            matrix(c(male_yes, male_no, female_yes, female_no), nrow = 2, byrow = TRUE),
            correct = TRUE
          )$statistic)

          exp_phi <- sqrt(exp_chi2 / total)

          parse_num <- function(val) {
            if (is.character(val)) {
              val <- trimws(val)

              # Allow letters for MC answers
              if (grepl("^[A-Da-d]$", val)) return(match(toupper(val), c("A", "B", "C", "D")))
              if (grepl("^[A-Ca-c]$", val)) return(match(toupper(val), c("A", "B", "C")))

              low <- tolower(val)
              if (low %in% c("zwak", "weak")) return(1)
              if (low %in% c("matig", "medium", "moderate")) return(2)
              if (low %in% c("sterk", "strong")) return(3)

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

          check_value <- function(varnames, expected, tol = 0.01) {
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
            list(exists = TRUE, used_var = used_var, value = raw, value_num = num, correct = ok, expected = expected)
          }

          check_choice <- function(varnames, correct_choices) {
            used_var <- pick_var(varnames)
            if (is.na(used_var)) {
              return(list(exists = FALSE, used_var = NA_character_, value = NA, value_num = NA, correct = FALSE))
            }
            raw <- get(used_var, envir = env)
            num <- parse_num(raw)
            ok <- !is.na(num) && num %in% correct_choices
            list(exists = TRUE, used_var = used_var, value = raw, value_num = num, correct = ok)
          }

          check_chi2 <- function(varnames, tol = 0.3) {
            used_var <- pick_var(varnames)
            if (is.na(used_var)) {
              return(list(exists = FALSE, used_var = NA_character_, value = NA, value_num = NA, correct = FALSE, expected = exp_chi2))
            }
            raw <- get(used_var, envir = env)
            num <- parse_num(raw)
            if (is.na(num)) {
              return(list(exists = TRUE, used_var = used_var, value = raw, value_num = NA, correct = FALSE, expected = exp_chi2))
            }
            ok <- abs(num - exp_chi2) <= tol
            if (!ok && !is.na(exp_chi2_yates) && abs(num - exp_chi2_yates) <= tol) ok <- TRUE
            list(exists = TRUE, used_var = used_var, value = raw, value_num = num, correct = ok, expected = exp_chi2)
          }

          results$perc_yes_male <- check_value(c("percentage_ja_bij_mannen"), exp_perc_yes_male, tol = 0.05)
          results$perc_yes_female <- check_value(c("percentage_ja_bij_vrouwen"), exp_perc_yes_female, tol = 0.05)
          results$perc_diff <- check_value(c("percentageverschil_ja"), exp_perc_diff, tol = 0.05)

          results$chi2 <- check_chi2(c("chi_kwadraat", "chi2"), tol = 0.3)

          # For a 2x2 table: Phi and Cramer's V are both derived from chi^2
          results$assoc_mc <- check_choice(c("associatiemaat_mc"), correct_choices = c(1, 2))

          results$phi <- check_value(c("phi"), exp_phi, tol = 0.02)
          results$interpret_mc <- check_choice(c("interpretatie_phi_mc"), correct_choices = c(1))

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
              n_no = n_no,
              exp_phi = exp_phi
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
            perc_yes_male = "1) Percentage JA bij mannen (`percentage_ja_bij_mannen`)",
            perc_yes_female = "1) Percentage JA bij vrouwen (`percentage_ja_bij_vrouwen`)",
            perc_diff = "2) Percentageverschil (procentpunten) (`percentageverschil_ja`)",
            chi2 = "3) Chi-kwadraat (chi^2) (`chi_kwadraat`)",
            assoc_mc = "4) Associatiemaat gebaseerd op chi^2 (`associatiemaat_mc`)",
            phi = "5) Phi (`phi`)",
            interpret_mc = "5) Interpretatie phi (`interpretatie_phi_mc`)"
          )

          approx_eq <- function(a, b, tol = 0.01) {
            !is.na(a) && !is.na(b) && abs(a - b) <= tol
          }

          wrong_msg <- function(key) {
            r <- results[[key]]
            if (!r$exists) return("Je hebt deze variabele niet ingevuld.")
            if (is.na(r$value_num)) return("Je antwoord kon niet als getal geinterpreteerd worden.")

            v <- r$value_num

            if (key == "perc_yes_male") {
              if (v >= 0 && v <= 1) return("Je lijkt een proportie (0-1) te geven. Geef een percentage (0-100): (JA bij mannen / totaal mannen) * 100.")
              if (approx_eq(v, (cst$male_yes / cst$total * 100), tol = 0.2)) return("Je deelde door N i.p.v. door het aantal mannen. Gebruik: (JA bij mannen / totaal mannen) * 100.")
              if (approx_eq(v, (cst$male_yes / cst$n_yes * 100), tol = 0.2)) return("Je gebruikte het rijtotaal (totaal JA) als noemer. Voor P(JA|Man) deel je door het kolomtotaal (totaal mannen).")
              if (approx_eq(v, (cst$female_yes / cst$n_female * 100), tol = 0.2)) return("Je lijkt de vrouwenkolom te gebruiken. Voor `percentage_ja_bij_mannen` werk je binnen mannen.")
              if (approx_eq(v, (cst$male_yes / cst$male_no), tol = 0.03) || approx_eq(v, (cst$male_yes / cst$male_no * 100), tol = 0.3)) {
                return("Je lijkt odds (JA/NEEN) te hebben berekend. Gevraagd is een percentage binnen mannen: JA/(JA+NEEN) * 100.")
              }
              return("Gebruik kolompercentages: (JA bij mannen / totaal mannen) * 100. Rond af op 2 decimalen.")
            }

            if (key == "perc_yes_female") {
              if (v >= 0 && v <= 1) return("Je lijkt een proportie (0-1) te geven. Geef een percentage (0-100): (JA bij vrouwen / totaal vrouwen) * 100.")
              if (approx_eq(v, (cst$female_yes / cst$total * 100), tol = 0.2)) return("Je deelde door N i.p.v. door het aantal vrouwen. Gebruik: (JA bij vrouwen / totaal vrouwen) * 100.")
              if (approx_eq(v, (cst$female_yes / cst$n_yes * 100), tol = 0.2)) return("Je gebruikte het rijtotaal (totaal JA) als noemer. Voor P(JA|Vrouw) deel je door het kolomtotaal (totaal vrouwen).")
              if (approx_eq(v, (cst$male_yes / cst$n_male * 100), tol = 0.2)) return("Je lijkt de mannenkolom te gebruiken. Voor `percentage_ja_bij_vrouwen` werk je binnen vrouwen.")
              if (approx_eq(v, (cst$female_yes / cst$female_no), tol = 0.03) || approx_eq(v, (cst$female_yes / cst$female_no * 100), tol = 0.3)) {
                return("Je lijkt odds (JA/NEEN) te hebben berekend. Gevraagd is een percentage binnen vrouwen: JA/(JA+NEEN) * 100.")
              }
              return("Gebruik kolompercentages: (JA bij vrouwen / totaal vrouwen) * 100. Rond af op 2 decimalen.")
            }

            if (key == "perc_diff") {
              if (v >= 0 && v <= 1) return("Je lijkt het verschil op 0-1 schaal te geven. Gevraagd is procentpunten: (mannen% - vrouwen%). Vermenigvuldig met 100.")
              if (abs(v) < 1) return("Je verschil is erg klein. Werk je wel met percentages (0-100) en niet met proporties (0-1)?")
              if (!is.na(r$expected) && abs(v + r$expected) < 0.2) return("Je nam het verschil in omgekeerde richting. Neem (mannen% - vrouwen%).")
              if (abs(v - (cst$male_yes - cst$female_yes)) < 2) return("Je nam het verschil in aantallen i.p.v. in procentpunten. Maak eerst kolompercentages, neem daarna het verschil.")
              return("Percentageverschil in procentpunten: P(JA|Man) - P(JA|Vrouw).")
            }

            if (key == "chi2") {
              if (v >= 0 && v <= 1) {
                if (approx_eq(v, cst$exp_phi, tol = 0.03)) return("Je gaf phi i.p.v. chi^2. Voor chi^2 sommeer je per cel (O - E)^2 / E.")
                return("Je antwoord is erg klein voor chi^2. Controleer of je niet per ongeluk een kans/phi invulde.")
              }
              if (v > 0 && v < 0.001) return("Je lijkt een p-waarde te geven. Gevraagd is de chi^2 teststatistiek.")
              if (!is.na(r$expected) && approx_eq(v, sqrt(r$expected / cst$total), tol = 0.03)) return("Je gaf phi (sqrt(chi^2/N)) i.p.v. chi^2.")
              if (v > 500) return("Je chi^2 is erg groot. Controleer dat je per cel (O - E)^2 door E deelt en daarna optelt.")
              return("Bereken eerst de verwachte frequenties E_ij en sommeer daarna (O - E)^2/E over de 4 cellen.")
            }

            if (key == "assoc_mc") {
              if (v %in% c(3, 4)) return("Deze optie is geen associatiemaat gebaseerd op chi^2 voor een 2x2 kruistabel. Denk aan Phi en (bij uitbreiding) Cramer's V.")
              return("Kies A=Phi of B=Cramer's V (voor 2x2 is dit inhoudelijk dezelfde schaal).")
            }

            if (key == "phi") {
              if (v > 1 && approx_eq(v, results$chi2$value_num, tol = 0.5)) return("Je vulde chi^2 in bij phi. Phi = sqrt(chi^2 / N) en ligt tussen 0 en 1.")
              if (v > 1 && v <= 100) return("Phi ligt tussen 0 en 1. Je lijkt een percentage te geven. Geef phi zonder procentteken.")
              if (approx_eq(v, (results$chi2$value_num / cst$total), tol = 0.01)) return("Je gaf chi^2/N maar vergat de wortel. Phi = sqrt(chi^2 / N).")
              if (v < 0) return("Phi is niet negatief. Gebruik phi = sqrt(chi^2 / N).")
              return("Gebruik: phi = sqrt(chi^2 / N) en rond af op 2 decimalen.")
            }

            if (key == "interpret_mc") {
              if (v %in% c(2, 3)) return("Je interpretatie is te sterk. Vergelijk je phi met de richtwaarden (bv. 0.10 zwak, 0.30 matig, 0.50 sterk).")
              return("Kies A=zwak, B=matig of C=sterk op basis van de richtwaarden.")
            }

            "Controleer je berekening en afronding."
          }

          feedback <- "**Resultaten:**\n\n"
          for (key in names(qnames)) {
            r <- results[[key]]
            if (!r$exists) {
              feedback <- paste0(feedback, "[FOUT] ", qnames[[key]], " - geen antwoord.\n\n", wrong_msg(key), "\n\n")
              next
            }
            if (r$correct) {
              feedback <- paste0(feedback, "[OK] ", qnames[[key]], " - correct.\n\n")
            } else {
              feedback <- paste0(feedback, "[FOUT] ", qnames[[key]], " - fout (", r$value, ").\n\n", wrong_msg(key), "\n\n")
            }
          }

          feedback <- paste0(feedback, "\n**Meer leren?** [Chi-kwadraat test](https://support.minitab.com/en-us/minitab/help-and-how-to/statistics/tables/how-to/cross-tabulation-and-chi-square/interpret-the-results/key-results/) | [Verwachte waarden](https://support.minitab.com/en-us/minitab/help-and-how-to/statistics/tables/how-to/cross-tabulation-and-chi-square/interpret-the-results/key-results/) | [Kruistabellen](https://support.minitab.com/en-us/minitab/help-and-how-to/statistics/tables/how-to/cross-tabulation-and-chi-square/interpret-the-results/key-results/)\n\n")

          get_reporter()$add_message(feedback, type = "markdown")
          generated == expected
        }
      )
    }
  )
})

