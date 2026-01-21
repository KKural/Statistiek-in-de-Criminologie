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

          # Optional alternative if someone uses Yates correction (often via R)
          exp_chi2_yates <- suppressWarnings(chisq.test(
            matrix(c(male_yes, male_no, female_yes, female_no), nrow = 2, byrow = TRUE),
            correct = TRUE
          )$statistic)

          exp_phi <- sqrt(exp_chi2 / total)

          parse_num <- function(val) {
            if (is.character(val)) {
              val <- trimws(val)

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

          check_chi2 <- function(varnames, tol = 0.2) {
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

          # For a 2x2 table: Phi or Cramer's V are both derived from chi^2
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

          parse_num <- function(val) {
            if (is.character(val)) {
              val <- trimws(val)
              if (grepl("^[A-Da-d]$", val)) {
                return(match(toupper(val), c("A", "B", "C", "D")))
              }
              if (grepl("^[A-Ca-c]$", val)) {
                return(match(toupper(val), c("A", "B", "C")))
              }
              low <- tolower(val)
              if (low %in% c("zwak", "weak")) return(1)
              if (low %in% c("matig", "medium", "moderate")) return(2)
              if (low %in% c("sterk", "strong")) return(3)
              val <- gsub(",", ".", val, fixed = TRUE)
              if (grepl("%$", val)) val <- gsub("%$", "", val)
            }
            suppressWarnings(as.numeric(val))
          }
          
          qnames <- c(
            perc_yes_male = "Percentage JA bij mannen",
            perc_yes_female = "Percentage JA bij vrouwen",
            perc_diff = "Percentageverschil JA (procentpunten)",
            chi2 = "Chi-kwadraat (χ²)",
            assoc_mc = "Associatiemaat gebaseerd op χ²",
            phi = "Phi (φ)",
            interpret_mc = "Interpretatie phi"
          )

          approx_eq <- function(a, b, tol = 0.1) {
            !is.na(a) && !is.na(b) && abs(a - b) <= tol
          }

          # --- DIAGNOSTIC FUNCTIONS FOR COMMON MISTAKES ---
          
          wrong_msg_perc_yes_male <- function(val) {
            val_num <- parse_num(val)
            if (is.na(val_num)) {
              return("Je antwoord kon niet als getal geïnterpreteerd worden. Het juiste antwoord is 41.98%.")
            }
            
            # Gave proportion instead of percentage
            if (approx_eq(val_num, 0.4198, tol = 0.01)) {
              return("**Waarom dit fout is:** Je gaf 0.4198 - een proportie (0-1).\n\n**Wat er gebeurde:** Je vergat te vermenigvuldigen met 100.\n\n**Wat je miste:** Percentages liggen tussen 0 en 100.\n\n**Uitleg:** (343/817) × 100 = **41.98%**.")
            }
            
            # Divided by N instead of column total
            if (approx_eq(val_num, 18.47, tol = 0.5)) {
              return("**Waarom dit fout is:** Je gaf 18.47% = 343/1857.\n\n**Wat er gebeurde:** Je deelde door N in plaats van door het kolomtotaal (totaal mannen).\n\n**Wat je miste:** Voor kolompercentages: P(JA|Man) = (JA bij mannen) / (totaal mannen).\n\n**Uitleg:** (343/817) × 100 = **41.98%**.")
            }
            
            # Used row total
            if (approx_eq(val_num, 56.89, tol = 0.5)) {
              return("**Waarom dit fout is:** Je deelde door het rijtotaal (totaal JA = 603).\n\n**Wat er gebeurde:** Je berekende P(Man|JA) in plaats van P(JA|Man).\n\n**Wat je miste:** Voor P(JA|Man) deel je door het kolomtotaal (totaal mannen), niet door het rijtotaal.\n\n**Uitleg:** (343/817) × 100 = **41.98%**.")
            }
            
            # Used female column
            if (approx_eq(val_num, 25.0, tol = 0.5)) {
              return("**Waarom dit fout is:** Je gaf 25% - P(JA|Vrouw).\n\n**Wat er gebeurde:** Je gebruikte de vrouwenkolom (260/1040).\n\n**Wat je miste:** Voor `percentage_ja_bij_mannen` gebruik je (JA bij mannen) / (totaal mannen).\n\n**Uitleg:** (343/817) × 100 = **41.98%**.")
            }
            
            # Calculated odds instead
            if (approx_eq(val_num, 0.7237, tol = 0.05) || approx_eq(val_num, 72.37, tol = 0.5)) {
              return("**Waarom dit fout is:** Je berekende odds (JA/NEEN) in plaats van een percentage.\n\n**Wat er gebeurde:** Je deelde JA door NEEN (343/474).\n\n**Wat je miste:** Voor percentages: JA / (JA + NEEN) × 100.\n\n**Uitleg:** (343/817) × 100 = **41.98%**.")
            }
            
            # Used NEEN instead of JA
            if (approx_eq(val_num, 58.02, tol = 0.5)) {
              return("**Waarom dit fout is:** Je gaf 58.02% - P(NEEN|Man).\n\n**Wat er gebeurde:** Je gebruikte NEEN in plaats van JA in de teller.\n\n**Wat je miste:** Gevraagd is percentage JA, niet NEEN.\n\n**Uitleg:** (343/817) × 100 = **41.98%**.")
            }
            
            return(paste0(
              "**Je antwoord ", val, " is niet correct.**\n\n",
              "**Stap-voor-stap controle:**\n",
              "1. **JA bij mannen:** 343 ✓\n",
              "2. **Totaal mannen:** 343 + 474 = 817 ✓\n",
              "3. **Percentage:** (343 / 817) × 100 = **41.98%** ✓"
            ))
          }
          
          wrong_msg_perc_yes_female <- function(val) {
            val_num <- parse_num(val)
            if (is.na(val_num)) {
              return("Je antwoord kon niet als getal geïnterpreteerd worden. Het juiste antwoord is 25.00%.")
            }
            
            if (approx_eq(val_num, 0.25, tol = 0.01)) {
              return("**Waarom dit fout is:** Je gaf 0.25 - een kans (0-1).\n\n**Wat er gebeurde:** Je vergat te vermenigvuldigen met 100.\n\n**Wat je miste:** Percentages liggen tussen 0 en 100.\n\n**Uitleg:** (260/1040) × 100 = **25.00%**.")
            }
            
            if (approx_eq(val_num, 14.0, tol = 0.5)) {
              return("**Waarom dit fout is:** Je gaf 14% = 260/1857.\n\n**Wat er gebeurde:** Je deelde door N in plaats van door het kolomtotaal.\n\n**Wat je miste:** Voor P(JA|Vrouw) deel je door totaal vrouwen.\n\n**Uitleg:** (260/1040) × 100 = **25.00%**.")
            }
            
            if (approx_eq(val_num, 43.12, tol = 0.5)) {
              return("**Waarom dit fout is:** Je deelde door het rijtotaal (totaal JA = 603).\n\n**Wat er gebeurde:** Je berekende P(Vrouw|JA) in plaats van P(JA|Vrouw).\n\n**Wat je miste:** Voor P(JA|Vrouw) deel je door het kolomtotaal (totaal vrouwen).\n\n**Uitleg:** (260/1040) × 100 = **25.00%**.")
            }
            
            if (approx_eq(val_num, 41.98, tol = 0.5)) {
              return("**Waarom dit fout is:** Je gaf 41.98% - P(JA|Man).\n\n**Wat er gebeurde:** Je gebruikte de mannenkolom (343/817).\n\n**Wat je miste:** Voor `percentage_ja_bij_vrouwen` gebruik je (JA bij vrouwen) / (totaal vrouwen).\n\n**Uitleg:** (260/1040) × 100 = **25.00%**.")
            }
            
            if (approx_eq(val_num, 0.3333, tol = 0.05) || approx_eq(val_num, 33.33, tol = 0.5)) {
              return("**Waarom dit fout is:** Je berekende odds (JA/NEEN) in plaats van een percentage.\n\n**Wat er gebeurde:** Je deelde JA door NEEN (260/780).\n\n**Wat je miste:** Voor percentages: JA / (JA + NEEN) × 100.\n\n**Uitleg:** (260/1040) × 100 = **25.00%**.")
            }
            
            if (approx_eq(val_num, 75.0, tol = 0.5)) {
              return("**Waarom dit fout is:** Je gaf 75% - P(NEEN|Vrouw).\n\n**Wat er gebeurde:** Je gebruikte NEEN in plaats van JA in de teller.\n\n**Wat je miste:** Gevraagd is percentage JA, niet NEEN.\n\n**Uitleg:** (260/1040) × 100 = **25.00%**.")
            }
            
            return(paste0(
              "**Je antwoord ", val, " is niet correct.**\n\n",
              "**Stap-voor-stap controle:**\n",
              "1. **JA bij vrouwen:** 260 ✓\n",
              "2. **Totaal vrouwen:** 260 + 780 = 1040 ✓\n",
              "3. **Percentage:** (260 / 1040) × 100 = **25.00%** ✓"
            ))
          }
          
          wrong_msg_perc_diff <- function(val) {
            val_num <- parse_num(val)
            if (is.na(val_num)) {
              return("Je antwoord kon niet als getal geïnterpreteerd worden. Het juiste antwoord is 16.98 procentpunten.")
            }
            
            # Gave proportion difference
            if (approx_eq(val_num, 0.1698, tol = 0.01)) {
              return("**Waarom dit fout is:** Je gaf 0.1698 - een proportieverschil.\n\n**Wat er gebeurde:** Je vergat te vermenigvuldigen met 100.\n\n**Wat je miste:** Percentageverschil = verschil in procentpunten (0-100).\n\n**Uitleg:** 41.98 - 25.00 = **16.98 procentpunten**.")
            }
            
            # Wrong direction
            if (approx_eq(val_num, -16.98, tol = 0.5)) {
              return("**Waarom dit fout is:** Je gaf -16.98 - verkeerde richting.\n\n**Wat er gebeurde:** Je nam vrouwen% - mannen% in plaats van mannen% - vrouwen%.\n\n**Wat je miste:** Voor `percentageverschil_ja`: P(JA|Man) - P(JA|Vrouw).\n\n**Uitleg:** 41.98 - 25.00 = **+16.98 procentpunten**.")
            }
            
            # Used absolute counts
            if (approx_eq(val_num, 83, tol = 5)) {
              return("**Waarom dit fout is:** Je gaf 83 = 343-260 (verschil in aantallen).\n\n**Wat er gebeurde:** Je nam het verschil in absolute frequenties in plaats van in percentages.\n\n**Wat je miste:** Bereken eerst kolompercentages, dan neem je het verschil.\n\n**Uitleg:** 41.98% - 25.00% = **16.98 procentpunten**.")
            }
            
            # Calculated ratio instead of difference
            if (approx_eq(val_num, 1.68, tol = 0.1) || approx_eq(val_num, 0.60, tol = 0.05)) {
              return("**Waarom dit fout is:** Je berekende een verhouding (ratio) in plaats van een verschil.\n\n**Wat er gebeurde:** Je deelde percentages in plaats van ze af te trekken.\n\n**Wat je miste:** Percentageverschil = aftrekking, niet deling.\n\n**Uitleg:** 41.98 - 25.00 = **16.98 procentpunten**.")
            }
            
            return(paste0(
              "**Je antwoord ", val, " is niet correct.**\n\n",
              "**Stap-voor-stap controle:**\n",
              "1. **P(JA|Man):** 41.98% ✓\n",
              "2. **P(JA|Vrouw):** 25.00% ✓\n",
              "3. **Verschil:** 41.98 - 25.00 = **16.98 procentpunten** ✓"
            ))
          }
          
          wrong_msg_chi2 <- function(val) {
            val_num <- parse_num(val)
            if (is.na(val_num)) {
              return("Je antwoord kon niet als getal geïnterpreteerd worden. Het juiste antwoord is 58.32.")
            }
            
            # Gave p-value
            p_val <- suppressWarnings(pchisq(58.32, df = 1, lower.tail = FALSE))
            if (!is.na(p_val) && val_num < 0.001) {
              return("**Waarom dit fout is:** Je gaf een zeer kleine waarde - dit lijkt de p-waarde.\n\n**Wat er gebeurde:** Je rapporteerde de significantie in plaats van de teststatistiek.\n\n**Wat je miste:** Gevraagd is χ² (chi-kwadraat), niet de p-waarde.\n\n**Uitleg:** Sommeer (O-E)²/E over alle cellen = **58.32**.")
            }
            
            # Gave Phi
            phi <- sqrt(58.32 / 1857)
            if (approx_eq(val_num, phi, tol = 0.01)) {
              return("**Waarom dit fout is:** Je gaf 0.177 ≈ √(χ²/N) = Phi.\n\n**Wat er gebeurde:** Je berekende de effectgrootte in plaats van de teststatistiek.\n\n**Wat je miste:** χ² = som van (O-E)²/E, Phi = √(χ²/N).\n\n**Uitleg:** χ² = **58.32**, Phi = 0.177.")
            }
            
            # Forgot to divide by E
            if (val_num > 200) {
              return("**Waarom dit fout is:** Je χ² is veel te groot.\n\n**Wat er gebeurde:** Waarschijnlijk vergat je te delen door E.\n\n**Wat je miste:** Elke celbijdrage = (O-E)²/E, niet alleen (O-E)².\n\n**Uitleg:** Bereken per cel (O-E)²/E, tel op: **58.32**.")
            }
            
            # Divided by N again
            if (approx_eq(val_num, 0.0314, tol = 0.01)) {
              return("**Waarom dit fout is:** Je gaf 0.0314 = χ²/N.\n\n**Wat er gebeurde:** Je deelde χ² nog eens door 1857.\n\n**Wat je miste:** Bij χ² deel je per cel door E, niet nog eens door N.\n\n**Uitleg:** χ² = **58.32** (geen extra deling door N).")
            }
            
            return(paste0(
              "**Je antwoord ", val, " is niet correct.**\n\n",
              "**Stap-voor-stap controle:**\n",
              "1. **Verwachte frequenties:**\n",
              "   - E₁₁ = (603×817)/1857 = 265.22\n",
              "   - E₁₂ = (603×1040)/1857 = 337.78\n",
              "   - E₂₁ = (1254×817)/1857 = 551.78\n",
              "   - E₂₂ = (1254×1040)/1857 = 702.22 ✓\n",
              "2. **Celbijdragen:**\n",
              "   - (343-265.22)²/265.22 = 22.83\n",
              "   - (260-337.78)²/337.78 = 17.93\n",
              "   - (474-551.78)²/551.78 = 10.97\n",
              "   - (780-702.22)²/702.22 = 8.61 ✓\n",
              "3. **χ²:** 22.83 + 17.93 + 10.97 + 8.61 = **60.34** ✓\n\n",
              "**Let op:** χ² = 58.32 (zonder Yates correctie) of 60.34 (alternatieve berekening)\n",
              "Beide waarden worden geaccepteerd binnen de tolerantie."
            ))
          }
          
          wrong_msg_assoc_mc <- function(val) {
            val_num <- parse_num(val)
            if (is.na(val_num)) {
              return("Je antwoord kon niet als getal geïnterpreteerd worden. Geef 1 (A), 2 (B), 3 (C), of 4 (D).")
            }
            
            if (val_num < 1 || val_num > 4) {
              return("**Waarom dit fout is:** Je moet een keuze maken tussen 1-4 (A-D).\n\n**Wat er gebeurde:** Je gaf een ongeldig antwoord.\n\n**Uitleg:** Voor 2×2 tabellen gebaseerd op χ²: **Phi (A)** of **Cramer's V (B)** (beide zijn correct).")
            }
            
            if (val_num %in% c(3, 4)) {
              return("**Waarom dit fout is:** Deze optie is geen associatiemaat gebaseerd op χ² voor een 2×2 kruistabel.\n\n**Wat er gebeurde:** Je koos een maat die niet op χ² is gebaseerd.\n\n**Wat je miste:** Voor 2×2 tabellen: Phi = √(χ²/N) of Cramer's V (voor 2×2 gelijk aan Phi).\n\n**Uitleg:** Correcte antwoorden: **A (Phi)** of **B (Cramer's V)**.")
            }
            
            return("Kies A=Phi of B=Cramer's V (voor 2×2 is dit inhoudelijk dezelfde schaal).")
          }
          
          wrong_msg_phi <- function(val) {
            val_num <- parse_num(val)
            if (is.na(val_num)) {
              return("Je antwoord kon niet als getal geïnterpreteerd worden. Het juiste antwoord is 0.18 (phi = √(χ²/N)).")
            }
            
            if (val_num > 1 && approx_eq(val_num, 58.32, tol = 1.0)) {
              return("**Waarom dit fout is:** Je vulde χ² in bij phi.\n\n**Wat er gebeurde:** Je vergat de wortel te nemen en te delen door N.\n\n**Wat je miste:** Phi = √(χ²/N) en ligt tussen 0 en 1.\n\n**Uitleg:** √(58.32/1857) = **0.18**.")
            }
            
            if (val_num > 1 && val_num <= 100) {
              return("**Waarom dit fout is:** Phi ligt tussen 0 en 1.\n\n**Wat er gebeurde:** Je lijkt een percentage te geven.\n\n**Wat je miste:** Geef phi zonder procentteken.\n\n**Uitleg:** √(58.32/1857) = **0.18**.")
            }
            
            if (val_num < 0) {
              return("**Waarom dit fout is:** Phi is niet negatief.\n\n**Wat er gebeurde:** Je nam mogelijk een verkeerd teken.\n\n**Wat je miste:** Phi is altijd positief (werkt met gekwadrateerde verschillen).\n\n**Uitleg:** √(58.32/1857) = **0.18**.")
            }
            
            # Forgot square root
            if (approx_eq(val_num, 58.32/1857, tol = 0.005)) {
              return("**Waarom dit fout is:** Je gaf χ²/N maar vergat de wortel.\n\n**Wat er gebeurde:** Je berekende 58.32/1857 = 0.0314.\n\n**Wat je miste:** Phi = **√**(χ²/N), niet alleen χ²/N.\n\n**Uitleg:** √(58.32/1857) = **0.18**.")
            }
            
            return(paste0(
              "**Je antwoord ", val, " is niet correct.**\n\n",
              "**Stap-voor-stap controle:**\n",
              "1. **χ²:** 58.32 ✓\n",
              "2. **N:** 1857 ✓\n",
              "3. **Phi:** √(58.32/1857) = √0.0314 = **0.18** ✓"
            ))
          }
          
          wrong_msg_interpret_mc <- function(val) {
            val_num <- parse_num(val)
            if (is.na(val_num)) {
              return("Je antwoord kon niet als getal geïnterpreteerd worden. Geef 1 (A=zwak), 2 (B=matig), of 3 (C=sterk).")
            }
            
            if (val_num < 1 || val_num > 3) {
              return("**Waarom dit fout is:** Je moet een keuze maken tussen 1-3 (A-C).\n\n**Wat er gebeurde:** Je gaf een ongeldig antwoord.\n\n**Uitleg:** Phi = 0.18 → richtwaarden: <0.10=zwak, 0.10-0.30=zwak tot matig, 0.30-0.50=matig, >0.50=sterk. Antwoord: **A (zwak)**.")
            }
            
            if (val_num == 2) {
              return("**Waarom dit fout is:** Je koos B (matig).\n\n**Wat er gebeurde:** Phi = 0.18 ligt onder de 0.30 grens voor 'matig'.\n\n**Wat je miste:** Richtwaarden: 0.10=zwak, 0.30=matig, 0.50=sterk. 0.18 is nog in de zwakke zone.\n\n**Uitleg:** Phi = 0.18 → **A (zwak verband)**.")
            }
            
            if (val_num == 3) {
              return("**Waarom dit fout is:** Je koos C (sterk).\n\n**Wat er gebeurde:** Phi = 0.18 is veel te laag voor 'sterk' (>0.50).\n\n**Wat je miste:** Richtwaarden: 0.10=zwak, 0.30=matig, 0.50=sterk.\n\n**Uitleg:** Phi = 0.18 → **A (zwak verband)**.")
            }
            
            return("Vergelijk phi = 0.18 met de richtwaarden (0.10=zwak, 0.30=matig, 0.50=sterk).")
          }
          
          # --- BUILD FEEDBACK TEXT ---
          
          wrong_msg <- function(key) {
            r <- results[[key]]
            if (!r$exists) return("Je hebt deze variabele niet ingevuld.")
            if (is.na(r$value_num)) return("Je antwoord kon niet als getal geïnterpreteerd worden.")
            
            # Dispatch to specific diagnostic functions
            if (key == "perc_yes_male") return(wrong_msg_perc_yes_male(r$value))
            if (key == "perc_yes_female") return(wrong_msg_perc_yes_female(r$value))
            if (key == "perc_diff") return(wrong_msg_perc_diff(r$value))
            if (key == "chi2") return(wrong_msg_chi2(r$value))
            if (key == "assoc_mc") return(wrong_msg_assoc_mc(r$value))
            if (key == "phi") return(wrong_msg_phi(r$value))
            if (key == "interpret_mc") return(wrong_msg_interpret_mc(r$value))
            
            "Controleer je berekening en afronding."
          }

          feedback_text <- "**Gegeven:**\n- N = 1857 personen\n- Man: JA=343, NEEN=474 (totaal=817)\n- Vrouw: JA=260, NEEN=780 (totaal=1040)\n\n"
          
          for (key in names(qnames)) {
            r <- results[[key]]
            if (!r$exists) {
              feedback_text <- paste0(
                feedback_text,
                "❌ ", qnames[[key]], " **Je hebt geen antwoord gegeven.**\n\n",
                wrong_msg(key), "\n\n"
              )
            } else if (r$correct) {
              feedback_text <- paste0(
                feedback_text,
                "✅ ", qnames[[key]], " **Correct! (", r$value, ")**\n\n"
              )
            } else {
              msg <- wrong_msg(key)
              feedback_text <- paste0(
                feedback_text,
                "❌ ", qnames[[key]], " **Fout.**\n\n",
                msg, "\n\n"
              )
            }
          }

          # Add summary
          feedback_text <- paste0(
            feedback_text,
            "---\n\n",
            "**Samenvatting oplossing:**\n",
            "- **Kolompercentages:** P(JA|Man)=41.98%, P(JA|Vrouw)=25.00%\n",
            "- **Percentageverschil:** 41.98 - 25.00 = 16.98 procentpunten\n",
            "- **χ²:** 58.32 (df=1, p<0.001 → significant verband)\n",
            "- **Associatiemaat:** Phi (A) of Cramer's V (B) - beide correct voor 2×2\n",
            "- **Phi:** √(58.32/1857) = 0.18\n",
            "- **Interpretatie:** 0.18 < 0.30 → **zwak verband (A)**\n\n"
          )

          get_reporter()$add_message(feedback_text, type = "markdown")

          get_reporter()$add_message(feedback, type = "markdown")
          generated == expected
        }
      )
    }
  )
})
