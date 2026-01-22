context({
  testcase(
    "Geslacht en crimineel gedrag",
    {
      testEqual(
        "",
        function(env) {
          results <- list()

          total <- 2000

          male_yes <- 380
          male_no <- 850
          female_yes <- 120
          female_no <- 650

          n_male <- male_yes + male_no
          n_female <- female_yes + female_no
          n_yes <- male_yes + female_yes
          n_no <- male_no + female_no

          # Expected values (used for checking only; not printed directly)
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

          exp_e11 <- (n_male * n_yes / total)
          exp_e21 <- (n_female * n_yes / total)
          exp_e12 <- (n_male * n_no / total)
          exp_e22 <- (n_female * n_no / total)

          exp_chi2 <- (male_yes - exp_e11)^2 / exp_e11 +
            (female_yes - exp_e21)^2 / exp_e21 +
            (male_no - exp_e12)^2 / exp_e12 +
            (female_no - exp_e22)^2 / exp_e22

          exp_p_no_female <- female_no / n_female
          exp_antwoord_mc <- 3

          parse_num <- function(val) {
            if (is.character(val)) {
              val <- trimws(val)

              # Allow MC answers as letters (A-D)
              if (grepl("^[A-Da-d]$", val)) {
                return(match(toupper(val), c("A", "B", "C", "D")))
              }

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

          # Accept both full and older short variable names
          results$perc_male <- check_value(c("percentage_mannen", "perc_male"), exp_perc_male, tol = 0.1, allow_percent = FALSE)
          results$perc_female <- check_value(c("percentage_vrouwen", "perc_female"), exp_perc_female, tol = 0.1, allow_percent = FALSE)
          results$perc_yes <- check_value(c("percentage_yes", "perc_yes"), exp_perc_yes, tol = 0.1, allow_percent = FALSE)
          results$perc_no <- check_value(c("percentage_no", "perc_no"), exp_perc_no, tol = 0.1, allow_percent = FALSE)

          results$perc_yes_male <- check_value(c("percentage_yes_bij_mannen", "perc_yes_male"), exp_perc_yes_male, tol = 0.1, allow_percent = FALSE)
          results$perc_yes_female <- check_value(c("percentage_yes_bij_vrouwen", "perc_yes_female"), exp_perc_yes_female, tol = 0.1, allow_percent = FALSE)
          results$perc_diff_yes <- check_value(c("percentageverschil_yes", "perc_diff_yes"), exp_perc_diff_yes, tol = 0.1, allow_percent = FALSE)

          results$odds_male <- check_value(c("odds_mannen", "odds_male"), exp_odds_male, tol = 0.01, allow_percent = FALSE)
          results$odds_female <- check_value(c("odds_vrouwen", "odds_female"), exp_odds_female, tol = 0.01, allow_percent = FALSE)
          results$odds_ratio <- check_value(c("odds_ratio", "or"), exp_or, tol = 0.1, allow_percent = FALSE)

          results$chi2 <- check_value(c("chi_kwadraat", "chi2"), exp_chi2, tol = 0.1, allow_percent = FALSE)
          results$p_no_female <- check_value(c("kans_no_bij_vrouwen", "p_no_female"), exp_p_no_female, tol = 0.01, allow_percent = TRUE)
          results$antwoord_mc <- check_value(c("antwoord_mc"), exp_antwoord_mc, tol = 0.0, allow_percent = FALSE)

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
              exp_e11 = exp_e11,
              exp_e12 = exp_e12,
              exp_e21 = exp_e21,
              exp_e22 = exp_e22
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
              val <- gsub(",", ".", val, fixed = TRUE)
              if (grepl("%$", val)) val <- gsub("%$", "", val)
            }
            suppressWarnings(as.numeric(val))
          }

          qnames <- c(
            perc_male = "Percentage mannen (marginaal)",
            perc_female = "Percentage vrouwen (marginaal)",
            perc_yes = "Percentage YES (marginaal)",
            perc_no = "Percentage NO (marginaal)",
            perc_yes_male = "Percentage YES bij mannen",
            perc_yes_female = "Percentage YES bij vrouwen",
            perc_diff_yes = "Percentageverschil YES (procentpunten)",
            odds_male = "Odds mannen (YES/NO)",
            odds_female = "Odds vrouwen (YES/NO)",
            odds_ratio = "Odds ratio (OR)",
            chi2 = "Chi-kwadraat (χ²)",
            p_no_female = "P(NO | Vrouw)",
            antwoord_mc = "Meerkeuze antwoord"
          )

          approx_eq <- function(a, b, tol = 0.1) {
            !is.na(a) && !is.na(b) && abs(a - b) <= tol
          }

          # --- DIAGNOSTIC FUNCTIONS FOR COMMON MISTAKES ---
          
          wrong_msg_perc_male <- function(val) {
            val_num <- parse_num(val)
            if (is.na(val_num)) {
              return("Je antwoord kon niet als getal geïnterpreteerd worden. Het juiste antwoord is 61.5%.")
            }
            
            # Gave proportion instead of percentage
            if (approx_eq(val_num, 0.615, tol = 0.01)) {
              return("**Waarom dit fout is:** Je gaf 0.615 - een proportie (0-1).\n\n**Wat er gebeurde:** Je vergat te vermenigvuldigen met 100.\n\n**Wat je miste:** Percentages liggen tussen 0 en 100.\n\n**Uitleg:** (1230/2000) × 100 = **61.5%**.")
            }
            
            # Gave absolute count
            if (approx_eq(val_num, 1230, tol = 5)) {
              return("**Waarom dit fout is:** Je gaf 1230 - een absolute frequentie.\n\n**Wat er gebeurde:** Je vergat om te zetten naar percentage.\n\n**Wat je miste:** Marginaal percentage = (rijtotaal/N) × 100.\n\n**Uitleg:** (1230/2000) × 100 = **61.5%**.")
            }
            
            # Gave female percentage
            if (approx_eq(val_num, 38.5, tol = 0.5)) {
              return("**Waarom dit fout is:** Je gaf 38.5% - het percentage vrouwen.\n\n**Wat er gebeurde:** Je wisselde de kolommen om.\n\n**Wat je miste:** Totaal mannen = 380+850 = 1230.\n\n**Uitleg:** (1230/2000) × 100 = **61.5%**.")
            }
            
            # Gave conditional percentage
            if (approx_eq(val_num, 30.89, tol = 0.5)) {
              return("**Waarom dit fout is:** Je gaf 30.89% - P(YES|Man).\n\n**Wat er gebeurde:** Je berekende een conditioneel percentage (kolompercentage) in plaats van een marginaal percentage.\n\n**Wat je miste:** Voor `percentage_mannen` gebruik je (totaal mannen / N) × 100, niet (YES / totaal mannen).\n\n**Uitleg:** (1230/2000) × 100 = **61.5%**.")
            }
            
            # Gave cell percentage
            if (approx_eq(val_num, 19.0, tol = 0.5)) {
              return("**Waarom dit fout is:** Je gaf 19% - een celpercentage (380/2000).\n\n**Wat er gebeurde:** Je gebruikte één cel in plaats van het kolomtotaal.\n\n**Wat je miste:** Tel eerst de kolom op: 380+850 = 1230, dan pas percentage.\n\n**Uitleg:** (1230/2000) × 100 = **61.5%**.")
            }
            
            return(paste0(
              "**Je antwoord ", val, " is niet correct.**\n\n",
              "**Stap-voor-stap controle:**\n",
              "1. **Totaal mannen:** 380 + 850 = 1230 ✓\n",
              "2. **Percentage:** (1230 / 2000) × 100 = **61.5%** ✓"
            ))
          }
          
          wrong_msg_perc_female <- function(val) {
            val_num <- parse_num(val)
            if (is.na(val_num)) {
              return("Je antwoord kon niet als getal geïnterpreteerd worden. Het juiste antwoord is 38.5%.")
            }
            
            if (approx_eq(val_num, 0.385, tol = 0.01)) {
              return("**Waarom dit fout is:** Je gaf 0.385 - een proportie (0-1).\n\n**Wat er gebeurde:** Je vergat te vermenigvuldigen met 100.\n\n**Wat je miste:** Percentages liggen tussen 0 en 100.\n\n**Uitleg:** (770/2000) × 100 = **38.5%**.")
            }
            
            if (approx_eq(val_num, 770, tol = 5)) {
              return("**Waarom dit fout is:** Je gaf 770 - een absolute frequentie.\n\n**Wat er gebeurde:** Je vergat om te zetten naar percentage.\n\n**Wat je miste:** Marginaal percentage = (kolomtotaal/N) × 100.\n\n**Uitleg:** (770/2000) × 100 = **38.5%**.")
            }
            
            if (approx_eq(val_num, 61.5, tol = 0.5)) {
              return("**Waarom dit fout is:** Je gaf 61.5% - het percentage mannen.\n\n**Wat er gebeurde:** Je wisselde de kolommen om.\n\n**Wat je miste:** Totaal vrouwen = 120+650 = 770.\n\n**Uitleg:** (770/2000) × 100 = **38.5%**.")
            }
            
            if (approx_eq(val_num, 15.58, tol = 0.5)) {
              return("**Waarom dit fout is:** Je gaf 15.58% - P(YES|Vrouw).\n\n**Wat er gebeurde:** Je berekende een conditioneel percentage in plaats van marginaal.\n\n**Wat je miste:** Voor `percentage_vrouwen` gebruik je (totaal vrouwen / N) × 100.\n\n**Uitleg:** (770/2000) × 100 = **38.5%**.")
            }
            
            return(paste0(
              "**Je antwoord ", val, " is niet correct.**\n\n",
              "**Stap-voor-stap controle:**\n",
              "1. **Totaal vrouwen:** 120 + 650 = 770 ✓\n",
              "2. **Percentage:** (770 / 2000) × 100 = **38.5%** ✓"
            ))
          }
          
          wrong_msg_perc_yes <- function(val) {
            val_num <- parse_num(val)
            if (is.na(val_num)) {
              return("Je antwoord kon niet als getal geïnterpreteerd worden. Het juiste antwoord is 25%.")
            }
            
            if (approx_eq(val_num, 0.25, tol = 0.01)) {
              return("**Waarom dit fout is:** Je gaf 0.25 - een proportie.\n\n**Wat er gebeurde:** Je vergat te vermenigvuldigen met 100.\n\n**Wat je miste:** Percentages liggen tussen 0 en 100.\n\n**Uitleg:** (500/2000) × 100 = **25%**.")
            }
            
            if (approx_eq(val_num, 500, tol = 5)) {
              return("**Waarom dit fout is:** Je gaf 500 - een absolute frequentie.\n\n**Wat er gebeurde:** Je vergat om te zetten naar percentage.\n\n**Wat je miste:** Marginaal percentage = (rijtotaal/N) × 100.\n\n**Uitleg:** (500/2000) × 100 = **25%**.")
            }
            
            if (approx_eq(val_num, 75, tol = 0.5)) {
              return("**Waarom dit fout is:** Je gaf 75% - het percentage NO.\n\n**Wat er gebeurde:** Je wisselde YES en NO om.\n\n**Wat je miste:** Totaal YES = 380+120 = 500.\n\n**Uitleg:** (500/2000) × 100 = **25%**.")
            }
            
            if (approx_eq(val_num, 30.89, tol = 0.5) || approx_eq(val_num, 15.58, tol = 0.5)) {
              return("**Waarom dit fout is:** Je berekende een conditioneel percentage P(YES|geslacht).\n\n**Wat er gebeurde:** Je deelde door een kolomtotaal in plaats van door N.\n\n**Wat je miste:** Voor `percentage_yes` tel je alle YES-gevallen op en deel je door 2000.\n\n**Uitleg:** (500/2000) × 100 = **25%**.")
            }
            
            return(paste0(
              "**Je antwoord ", val, " is niet correct.**\n\n",
              "**Stap-voor-stap controle:**\n",
              "1. **Totaal YES:** 380 + 120 = 500 ✓\n",
              "2. **Percentage:** (500 / 2000) × 100 = **25%** ✓"
            ))
          }
          
          wrong_msg_perc_no <- function(val) {
            val_num <- parse_num(val)
            if (is.na(val_num)) {
              return("Je antwoord kon niet als getal geïnterpreteerd worden. Het juiste antwoord is 75%.")
            }
            
            if (approx_eq(val_num, 0.75, tol = 0.01)) {
              return("**Waarom dit fout is:** Je gaf 0.75 - een proportie.\n\n**Wat er gebeurde:** Je vergat te vermenigvuldigen met 100.\n\n**Wat je miste:** Percentages liggen tussen 0 en 100.\n\n**Uitleg:** (1500/2000) × 100 = **75%**.")
            }
            
            if (approx_eq(val_num, 1500, tol = 5)) {
              return("**Waarom dit fout is:** Je gaf 1500 - een absolute frequentie.\n\n**Wat er gebeurde:** Je vergat om te zetten naar percentage.\n\n**Wat je miste:** Marginaal percentage = (rijtotaal/N) × 100.\n\n**Uitleg:** (1500/2000) × 100 = **75%**.")
            }
            
            if (approx_eq(val_num, 25, tol = 0.5)) {
              return("**Waarom dit fout is:** Je gaf 25% - het percentage YES.\n\n**Wat er gebeurde:** Je wisselde NO en YES om.\n\n**Wat je miste:** Totaal NO = 850+650 = 1500.\n\n**Uitleg:** (1500/2000) × 100 = **75%**.")
            }
            
            if (approx_eq(val_num, 69.11, tol = 0.5) || approx_eq(val_num, 84.42, tol = 0.5)) {
              return("**Waarom dit fout is:** Je berekende een conditioneel percentage P(NO|geslacht).\n\n**Wat er gebeurde:** Je deelde door een kolomtotaal in plaats van door N.\n\n**Wat je miste:** Voor `percentage_no` tel je alle NO-gevallen op en deel je door 2000.\n\n**Uitleg:** (1500/2000) × 100 = **75%**.")
            }
            
            return(paste0(
              "**Je antwoord ", val, " is niet correct.**\n\n",
              "**Stap-voor-stap controle:**\n",
              "1. **Totaal NO:** 850 + 650 = 1500 ✓\n",
              "2. **Percentage:** (1500 / 2000) × 100 = **75%** ✓"
            ))
          }
          
          wrong_msg_perc_yes_male <- function(val) {
            val_num <- parse_num(val)
            if (is.na(val_num)) {
              return("Je antwoord kon niet als getal geïnterpreteerd worden. Het juiste antwoord is 30.89%.")
            }
            
            if (approx_eq(val_num, 0.3089, tol = 0.01)) {
              return("**Waarom dit fout is:** Je gaf 0.3089 - een kans (0-1).\n\n**Wat er gebeurde:** Je vergat te vermenigvuldigen met 100.\n\n**Wat je miste:** Percentages liggen tussen 0 en 100.\n\n**Uitleg:** (380/1230) × 100 = **30.89%**.")
            }
            
            # Used total N instead of column total
            if (approx_eq(val_num, 19.0, tol = 0.5)) {
              return("**Waarom dit fout is:** Je gaf 19% = 380/2000.\n\n**Wat er gebeurde:** Je deelde door het totaal N in plaats van door het kolomtotaal.\n\n**Wat je miste:** Voor conditionele percentages: P(YES|Man) = (YES bij mannen) / (totaal mannen).\n\n**Uitleg:** (380/1230) × 100 = **30.89%**.")
            }
            
            # Used row total
            if (approx_eq(val_num, 76.0, tol = 0.5)) {
              return("**Waarom dit fout is:** Je deelde door het rijtotaal (totaal YES).\n\n**Wat er gebeurde:** Je berekende P(Man|YES) in plaats van P(YES|Man).\n\n**Wat je miste:** Voor P(YES|Man) deel je door het kolomtotaal (totaal mannen), niet door het rijtotaal.\n\n**Uitleg:** (380/1230) × 100 = **30.89%**.")
            }
            
            # Used female column
            if (approx_eq(val_num, 15.58, tol = 0.5)) {
              return("**Waarom dit fout is:** Je gaf 15.58% - P(YES|Vrouw).\n\n**Wat er gebeurde:** Je gebruikte de vrouwenkolom in plaats van de mannenkolom.\n\n**Wat je miste:** Voor `percentage_yes_bij_mannen` gebruik je (YES bij mannen) / (totaal mannen).\n\n**Uitleg:** (380/1230) × 100 = **30.89%**.")
            }
            
            # Calculated odds instead
            if (approx_eq(val_num, 0.4471, tol = 0.05) || approx_eq(val_num, 44.71, tol = 0.5)) {
              return("**Waarom dit fout is:** Je berekende odds (YES/NO) in plaats van een percentage.\n\n**Wat er gebeurde:** Je deelde YES door NO in plaats van YES door het totaal.\n\n**Wat je miste:** Voor percentages: YES / (YES + NO) × 100.\n\n**Uitleg:** (380/(380+850)) × 100 = **30.89%**.")
            }
            
            # Used NO instead of YES
            if (approx_eq(val_num, 69.11, tol = 0.5)) {
              return("**Waarom dit fout is:** Je gaf 69.11% - P(NO|Man).\n\n**Wat er gebeurde:** Je gebruikte NO in plaats van YES in de teller.\n\n**Wat je miste:** Gevraagd is percentage YES, niet NO.\n\n**Uitleg:** (380/1230) × 100 = **30.89%**.")
            }
            
            return(paste0(
              "**Je antwoord ", val, " is niet correct.**\n\n",
              "**Stap-voor-stap controle:**\n",
              "1. **YES bij mannen:** 380 ✓\n",
              "2. **Totaal mannen:** 380 + 850 = 1230 ✓\n",
              "3. **Percentage:** (380 / 1230) × 100 = **30.89%** ✓"
            ))
          }
          
          wrong_msg_perc_yes_female <- function(val) {
            val_num <- parse_num(val)
            if (is.na(val_num)) {
              return("Je antwoord kon niet als getal geïnterpreteerd worden. Het juiste antwoord is 15.58%.")
            }
            
            if (approx_eq(val_num, 0.1558, tol = 0.01)) {
              return("**Waarom dit fout is:** Je gaf 0.1558 - een kans (0-1).\n\n**Wat er gebeurde:** Je vergat te vermenigvuldigen met 100.\n\n**Wat je miste:** Percentages liggen tussen 0 en 100.\n\n**Uitleg:** (120/770) × 100 = **15.58%**.")
            }
            
            if (approx_eq(val_num, 6.0, tol = 0.5)) {
              return("**Waarom dit fout is:** Je gaf 6% = 120/2000.\n\n**Wat er gebeurde:** Je deelde door N in plaats van door het kolomtotaal.\n\n**Wat je miste:** Voor P(YES|Vrouw) deel je door totaal vrouwen.\n\n**Uitleg:** (120/770) × 100 = **15.58%**.")
            }
            
            if (approx_eq(val_num, 24.0, tol = 0.5)) {
              return("**Waarom dit fout is:** Je deelde door het rijtotaal.\n\n**Wat er gebeurde:** Je berekende P(Vrouw|YES) in plaats van P(YES|Vrouw).\n\n**Wat je miste:** Voor P(YES|Vrouw) deel je door het kolomtotaal (totaal vrouwen).\n\n**Uitleg:** (120/770) × 100 = **15.58%**.")
            }
            
            if (approx_eq(val_num, 30.89, tol = 0.5)) {
              return("**Waarom dit fout is:** Je gaf 30.89% - P(YES|Man).\n\n**Wat er gebeurde:** Je gebruikte de mannenkolom in plaats van de vrouwenkolom.\n\n**Wat je miste:** Voor `percentage_yes_bij_vrouwen` gebruik je (YES bij vrouwen) / (totaal vrouwen).\n\n**Uitleg:** (120/770) × 100 = **15.58%**.")
            }
            
            if (approx_eq(val_num, 0.1846, tol = 0.05) || approx_eq(val_num, 18.46, tol = 0.5)) {
              return("**Waarom dit fout is:** Je berekende odds (YES/NO) in plaats van een percentage.\n\n**Wat er gebeurde:** Je deelde YES door NO (120/650).\n\n**Wat je miste:** Voor percentages: YES / (YES + NO) × 100.\n\n**Uitleg:** (120/770) × 100 = **15.58%**.")
            }
            
            if (approx_eq(val_num, 84.42, tol = 0.5)) {
              return("**Waarom dit fout is:** Je gaf 84.42% - P(NO|Vrouw).\n\n**Wat er gebeurde:** Je gebruikte NO in plaats van YES in de teller.\n\n**Wat je miste:** Gevraagd is percentage YES, niet NO.\n\n**Uitleg:** (120/770) × 100 = **15.58%**.")
            }
            
            return(paste0(
              "**Je antwoord ", val, " is niet correct.**\n\n",
              "**Stap-voor-stap controle:**\n",
              "1. **YES bij vrouwen:** 120 ✓\n",
              "2. **Totaal vrouwen:** 120 + 650 = 770 ✓\n",
              "3. **Percentage:** (120 / 770) × 100 = **15.58%** ✓"
            ))
          }
          
          wrong_msg_perc_diff <- function(val) {
            val_num <- parse_num(val)
            if (is.na(val_num)) {
              return("Je antwoord kon niet als getal geïnterpreteerd worden. Het juiste antwoord is 15.31 procentpunten.")
            }
            
            # Gave proportion difference
            if (approx_eq(val_num, 0.1531, tol = 0.01)) {
              return("**Waarom dit fout is:** Je gaf 0.1531 - een proportieverschil.\n\n**Wat er gebeurde:** Je vergat te vermenigvuldigen met 100.\n\n**Wat je miste:** Percentageverschil = verschil in procentpunten (0-100).\n\n**Uitleg:** 30.89 - 15.58 = **15.31 procentpunten**.")
            }
            
            # Wrong direction
            if (approx_eq(val_num, -15.31, tol = 0.5)) {
              return("**Waarom dit fout is:** Je gaf -15.31 - verkeerde richting.\n\n**Wat er gebeurde:** Je nam vrouwen% - mannen% in plaats van mannen% - vrouwen%.\n\n**Wat je miste:** Voor `percentageverschil_yes`: P(YES|Man) - P(YES|Vrouw).\n\n**Uitleg:** 30.89 - 15.58 = **+15.31 procentpunten**.")
            }
            
            # Used absolute counts
            if (approx_eq(val_num, 260, tol = 5)) {
              return("**Waarom dit fout is:** Je gaf 260 = 380-120 (verschil in aantallen).\n\n**Wat er gebeurde:** Je nam het verschil in absolute frequenties in plaats van in percentages.\n\n**Wat je miste:** Bereken eerst kolompercentages, dan neem je het verschil.\n\n**Uitleg:** 30.89% - 15.58% = **15.31 procentpunten**.")
            }
            
            # Calculated ratio instead of difference
            if (approx_eq(val_num, 1.98, tol = 0.1) || approx_eq(val_num, 0.50, tol = 0.05)) {
              return("**Waarom dit fout is:** Je berekende een verhouding (ratio) in plaats van een verschil.\n\n**Wat er gebeurde:** Je deelde percentages in plaats van ze af te trekken.\n\n**Wat je miste:** Percentageverschil = aftrekking, niet deling.\n\n**Uitleg:** 30.89 - 15.58 = **15.31 procentpunten**.")
            }
            
            # Calculated relative difference
            if (approx_eq(val_num, 98.2, tol = 1.0)) {
              return("**Waarom dit fout is:** Je berekende een relatief verschil (%-toename).\n\n**Wat er gebeurde:** Je gebruikte (verschil/vrouwen%) × 100.\n\n**Wat je miste:** Gevraagd is het absolute verschil in procentpunten, niet het relatieve verschil.\n\n**Uitleg:** 30.89 - 15.58 = **15.31 procentpunten**.")
            }
            
            return(paste0(
              "**Je antwoord ", val, " is niet correct.**\n\n",
              "**Stap-voor-stap controle:**\n",
              "1. **P(YES|Man):** 30.89% ✓\n",
              "2. **P(YES|Vrouw):** 15.58% ✓\n",
              "3. **Verschil:** 30.89 - 15.58 = **15.31 procentpunten** ✓"
            ))
          }
          
          wrong_msg_odds_male <- function(val) {
            val_num <- parse_num(val)
            if (is.na(val_num)) {
              return("Je antwoord kon niet als getal geïnterpreteerd worden. Het juiste antwoord is 0.4471.")
            }
            
            # Gave percentage
            if (approx_eq(val_num, 30.89, tol = 0.5) || approx_eq(val_num, 44.71, tol = 0.5)) {
              return("**Waarom dit fout is:** Je gaf een percentage in plaats van odds.\n\n**Wat er gebeurde:** Je berekende YES/(YES+NO) × 100.\n\n**Wat je miste:** Odds = YES/NO (zonder × 100).\n\n**Uitleg:** 380/850 = **0.4471**.")
            }
            
            # Gave probability
            if (approx_eq(val_num, 0.3089, tol = 0.01)) {
              return("**Waarom dit fout is:** Je gaf een kans P(YES|Man) = 0.3089.\n\n**Wat er gebeurde:** Je deelde YES door het totaal.\n\n**Wat je miste:** Odds = YES/NO, niet YES/(YES+NO).\n\n**Uitleg:** 380/850 = **0.4471**.")
            }
            
            # Inverted odds
            if (approx_eq(val_num, 2.2368, tol = 0.05)) {
              return("**Waarom dit fout is:** Je gaf 2.2368 = NO/YES.\n\n**Wat er gebeurde:** Je keerde de odds om.\n\n**Wat je miste:** Odds = YES/NO, niet NO/YES.\n\n**Uitleg:** 380/850 = **0.4471**.")
            }
            
            # Used female column
            if (approx_eq(val_num, 0.1846, tol = 0.01)) {
              return("**Waarom dit fout is:** Je gaf 0.1846 - odds voor vrouwen.\n\n**Wat er gebeurde:** Je gebruikte de vrouwenkolom (120/650).\n\n**Wat je miste:** Voor `odds_mannen` gebruik je de mannenkolom: 380/850.\n\n**Uitleg:** 380/850 = **0.4471**.")
            }
            
            return(paste0(
              "**Je antwoord ", val, " is niet correct.**\n\n",
              "**Stap-voor-stap controle:**\n",
              "1. **YES bij mannen:** 380 ✓\n",
              "2. **NO bij mannen:** 850 ✓\n",
              "3. **Odds:** 380 / 850 = **0.4471** ✓"
            ))
          }
          
          wrong_msg_odds_female <- function(val) {
            val_num <- parse_num(val)
            if (is.na(val_num)) {
              return("Je antwoord kon niet als getal geïnterpreteerd worden. Het juiste antwoord is 0.1846.")
            }
            
            if (approx_eq(val_num, 15.58, tol = 0.5) || approx_eq(val_num, 18.46, tol = 0.5)) {
              return("**Waarom dit fout is:** Je gaf een percentage in plaats van odds.\n\n**Wat er gebeurde:** Je berekende YES/(YES+NO) × 100.\n\n**Wat je miste:** Odds = YES/NO (zonder × 100).\n\n**Uitleg:** 120/650 = **0.1846**.")
            }
            
            if (approx_eq(val_num, 0.1558, tol = 0.01)) {
              return("**Waarom dit fout is:** Je gaf een kans P(YES|Vrouw) = 0.1558.\n\n**Wat er gebeurde:** Je deelde YES door het totaal.\n\n**Wat je miste:** Odds = YES/NO, niet YES/(YES+NO).\n\n**Uitleg:** 120/650 = **0.1846**.")
            }
            
            if (approx_eq(val_num, 5.4167, tol = 0.05)) {
              return("**Waarom dit fout is:** Je gaf 5.4167 = NO/YES.\n\n**Wat er gebeurde:** Je keerde de odds om.\n\n**Wat je miste:** Odds = YES/NO, niet NO/YES.\n\n**Uitleg:** 120/650 = **0.1846**.")
            }
            
            if (approx_eq(val_num, 0.4471, tol = 0.01)) {
              return("**Waarom dit fout is:** Je gaf 0.4471 - odds voor mannen.\n\n**Wat er gebeurde:** Je gebruikte de mannenkolom (380/850).\n\n**Wat je miste:** Voor `odds_vrouwen` gebruik je de vrouwenkolom: 120/650.\n\n**Uitleg:** 120/650 = **0.1846**.")
            }
            
            return(paste0(
              "**Je antwoord ", val, " is niet correct.**\n\n",
              "**Stap-voor-stap controle:**\n",
              "1. **YES bij vrouwen:** 120 ✓\n",
              "2. **NO bij vrouwen:** 650 ✓\n",
              "3. **Odds:** 120 / 650 = **0.1846** ✓"
            ))
          }
          
          wrong_msg_odds_ratio <- function(val) {
            val_num <- parse_num(val)
            if (is.na(val_num)) {
              return("Je antwoord kon niet als getal geïnterpreteerd worden. Het juiste antwoord is 2.42.")
            }
            
            # Gave risk ratio
            rr <- (380/1230) / (120/770)
            if (approx_eq(val_num, rr, tol = 0.1)) {
              return("**Waarom dit fout is:** Je berekende een risicoratio (kansen-ratio).\n\n**Wat er gebeurde:** Je deelde P(YES|Man) door P(YES|Vrouw).\n\n**Wat je miste:** Odds ratio = (odds mannen) / (odds vrouwen), niet kansenratio.\n\n**Uitleg:** 0.4471 / 0.1846 = **2.42**.")
            }
            
            # Inverted OR
            if (approx_eq(val_num, 0.41, tol = 0.05)) {
              return("**Waarom dit fout is:** Je gaf 0.41 = 1/2.42.\n\n**Wat er gebeurde:** Je keerde de odds ratio om (vrouwen/mannen).\n\n**Wat je miste:** OR = (odds mannen) / (odds vrouwen), niet andersom.\n\n**Uitleg:** 0.4471 / 0.1846 = **2.42**.")
            }
            
            # Gave log(OR)
            if (approx_eq(val_num, 0.88, tol = 0.1)) {
              return("**Waarom dit fout is:** Je gaf 0.88 ≈ log(2.42).\n\n**Wat er gebeurde:** Je nam de natuurlijke logaritme van OR.\n\n**Wat je miste:** Rapporteer OR zelf, niet log(OR).\n\n**Uitleg:** 0.4471 / 0.1846 = **2.42**.")
            }
            
            # Only compared YES counts
            if (approx_eq(val_num, 3.17, tol = 0.1)) {
              return("**Waarom dit fout is:** Je gaf 3.17 = 380/120 (YES-ratio).\n\n**Wat er gebeurde:** Je vergeleek alleen de YES-aantallen.\n\n**Wat je miste:** OR vergelijkt ODDS (YES/NO), niet alleen YES-aantallen.\n\n**Uitleg:** (380/850) / (120/650) = **2.42**.")
            }
            
            # Cross-product formula - close but rounding
            cp <- (380 * 650) / (850 * 120)
            if (approx_eq(val_num, cp, tol = 0.05)) {
              return("**Bijna correct!** Je gebruikte de cross-product formule (a×d)/(b×c).\n\n**Controleer afronding:** (380×650)/(850×120) = 247000/102000 = **2.42**.")
            }
            
            return(paste0(
              "**Je antwoord ", val, " is niet correct.**\n\n",
              "**Stap-voor-stap controle:**\n",
              "1. **Odds mannen:** 380/850 = 0.4471 ✓\n",
              "2. **Odds vrouwen:** 120/650 = 0.1846 ✓\n",
              "3. **OR:** 0.4471 / 0.1846 = **2.42** ✓\n\n",
              "**Alternatief:** (380×650)/(850×120) = **2.42** ✓"
            ))
          }
          
          wrong_msg_chi2 <- function(val) {
            val_num <- parse_num(val)
            if (is.na(val_num)) {
              return("Je antwoord kon niet als getal geïnterpreteerd worden. Het juiste antwoord is 56.3423.")
            }
            
            # Gave p-value
            p_val <- suppressWarnings(pchisq(56.3423, df = 1, lower.tail = FALSE))
            if (!is.na(p_val) && val_num < 0.001) {
              return("**Waarom dit fout is:** Je gaf een zeer kleine waarde - dit lijkt de p-waarde.\n\n**Wat er gebeurde:** Je rapporteerde de significantie in plaats van de teststatistiek.\n\n**Wat je miste:** Gevraagd is χ² (chi-kwadraat), niet de p-waarde.\n\n**Uitleg:** Sommeer (O-E)²/E over alle cellen = **56.3423**.")
            }
            
            # Gave Phi or Cramer's V
            phi <- sqrt(56.3423 / 2000)
            if (approx_eq(val_num, phi, tol = 0.01)) {
              return("**Waarom dit fout is:** Je gaf 0.168 ≈ √(χ²/N) = Phi.\n\n**Wat er gebeurde:** Je berekende de effectgrootte in plaats van de teststatistiek.\n\n**Wat je miste:** χ² = som van (O-E)²/E, Phi = √(χ²/N).\n\n**Uitleg:** χ² = **56.3423**, Phi = 0.168.")
            }
            
            # Only one cell contribution
            e11 <- (1230 * 500) / 2000
            contrib1 <- (380 - e11)^2 / e11
            if (approx_eq(val_num, contrib1, tol = 0.5)) {
              return("**Waarom dit fout is:** Je gaf ~14 - slechts één celbijdrage.\n\n**Wat er gebeurde:** Je berekende (O-E)²/E voor één cel, maar vergat de andere 3.\n\n**Wat je miste:** χ² = som van ALLE 4 celbijdrages.\n\n**Uitleg:** Tel alle celbijdragen op: **56.3423**.")
            }
            
            # Forgot to divide by E
            if (val_num > 200) {
              return("**Waarom dit fout is:** Je χ² is veel te groot.\n\n**Wat er gebeurde:** Waarschijnlijk vergat je te delen door E.\n\n**Wat je miste:** Elke celbijdrage = (O-E)²/E, niet alleen (O-E)².\n\n**Uitleg:** Bereken per cel (O-E)²/E, tel op: **56.3423**.")
            }
            
            # Divided by N again
            if (approx_eq(val_num, 0.0282, tol = 0.01)) {
              return("**Waarom dit fout is:** Je gaf 0.0282 = χ²/N.\n\n**Wat er gebeurde:** Je deelde χ² nog eens door 2000.\n\n**Wat je miste:** Bij χ² deel je per cel door E, niet nog eens door N.\n\n**Uitleg:** χ² = **56.3423** (geen extra deling door N).")
            }
            
            return(paste0(
              "**Je antwoord ", val, " is niet correct.**\n\n",
              "**Stap-voor-stap controle:**\n",
              "1. **Verwachte frequenties:**\n",
              "   - E₁₁ = (1230×500)/2000 = 307.5\n",
              "   - E₁₂ = (1230×1500)/2000 = 922.5\n",
              "   - E₂₁ = (770×500)/2000 = 192.5\n",
              "   - E₂₂ = (770×1500)/2000 = 577.5 ✓\n",
              "2. **Celbijdragen:**\n",
              "   - (380-307.5)²/307.5 = 17.0894\n",
              "   - (850-922.5)²/922.5 = 5.6967\n",
              "   - (120-192.5)²/192.5 = 27.2727\n",
              "   - (650-577.5)²/577.5 = 9.1017 ✓\n",
              "3. **χ²:** 17.0894 + 5.6967 + 27.2727 + 9.1017 = **59.16** (afgerond op 4 dec: 59.1606) ✓"
            ))
          }
          
          wrong_msg_p_no_female <- function(val) {
            val_num <- parse_num(val)
            if (is.na(val_num)) {
              return("Je antwoord kon niet als getal geïnterpreteerd worden. Het juiste antwoord is 0.8442 (of 84.42%).")
            }
            
            # Gave P(NO | all), not P(NO | female)
            if (approx_eq(val_num, 0.75, tol = 0.01) || approx_eq(val_num, 75, tol = 0.5)) {
              return("**Waarom dit fout is:** Je gaf 75% - het marginale percentage NO.\n\n**Wat er gebeurde:** Je deelde door N=2000 in plaats van door totaal vrouwen.\n\n**Wat je miste:** P(NO|Vrouw) = (NO bij vrouwen) / (totaal vrouwen).\n\n**Uitleg:** 650/770 = **0.8442** = **84.42%**.")
            }
            
            # Gave P(YES | female) instead
            if (approx_eq(val_num, 0.1558, tol = 0.01) || approx_eq(val_num, 15.58, tol = 0.5)) {
              return("**Waarom dit fout is:** Je gaf 15.58% - P(YES|Vrouw).\n\n**Wat er gebeurde:** Je gebruikte YES in plaats van NO in de teller.\n\n**Wat je miste:** Gevraagd is P(NO|Vrouw), niet P(YES|Vrouw).\n\n**Uitleg:** 650/770 = **0.8442** = **84.42%**.")
            }
            
            # Gave P(NO | male)
            if (approx_eq(val_num, 0.6911, tol = 0.01) || approx_eq(val_num, 69.11, tol = 0.5)) {
              return("**Waarom dit fout is:** Je gaf 69.11% - P(NO|Man).\n\n**Wat er gebeurde:** Je gebruikte de mannenkolom in plaats van vrouwenkolom.\n\n**Wat je miste:** Voor P(NO|Vrouw) gebruik je de vrouwenkolom: 650/770.\n\n**Uitleg:** 650/770 = **0.8442** = **84.42%**.")
            }
            
            # Gave P(YES | male)
            if (approx_eq(val_num, 0.3089, tol = 0.01) || approx_eq(val_num, 30.89, tol = 0.5)) {
              return("**Waarom dit fout is:** Je gaf 30.89% - P(YES|Man).\n\n**Wat er gebeurde:** Je gebruikte YES bij mannen in plaats van NO bij vrouwen.\n\n**Wat je miste:** Gevraagd is P(NO|Vrouw) = 650/770.\n\n**Uitleg:** 650/770 = **0.8442** = **84.42%**.")
            }
            
            return(paste0(
              "**Je antwoord ", val, " is niet correct.**\n\n",
              "**Stap-voor-stap controle:**\n",
              "1. **NO bij vrouwen:** 650 ✓\n",
              "2. **Totaal vrouwen:** 120 + 650 = 770 ✓\n",
              "3. **P(NO|Vrouw):** 650 / 770 = **0.8442** = **84.42%** ✓"
            ))
          }
          
          wrong_msg_mc <- function(val) {
            val_num <- parse_num(val)
            if (is.na(val_num)) {
              return("Je antwoord kon niet als getal geïnterpreteerd worden. Geef 1, 2, 3, of 4 (A, B, C, of D).")
            }
            
            if (val_num < 1 || val_num > 4) {
              return("**Waarom dit fout is:** Je moet een keuze maken tussen 1-4 (A-D).\n\n**Wat er gebeurde:** Je gaf een ongeldig antwoord.\n\n**Wat je miste:** A=1, B=2, C=3, D=4.\n\n**Uitleg:** P(NO|Vrouw) = 84.42% → antwoord C (85%) is het dichtst bij.")
            }
            
            if (val_num == 1) {
              return("**Waarom dit fout is:** Je koos A (30%).\n\n**Wat er gebeurde:** Je berekende waarschijnlijk P(YES|Man) = 30.89% in plaats van P(NO|Vrouw).\n\n**Wat je miste:** Gevraagd is de kans dat een VROUW GEEN misdrijf pleegde.\n\n**Uitleg:** P(NO|Vrouw) = 650/770 = 84.42% → **antwoord C**.")
            }
            
            if (val_num == 2) {
              return("**Waarom dit fout is:** Je koos B (15%).\n\n**Wat er gebeurde:** Je berekende waarschijnlijk P(YES|Vrouw) = 15.58%.\n\n**Wat je miste:** Gevraagd is P(NO|Vrouw), niet P(YES|Vrouw).\n\n**Uitleg:** P(NO|Vrouw) = 650/770 = 84.42% → **antwoord C**.")
            }
            
            if (val_num == 4) {
              return("**Waarom dit fout is:** Je koos D (6%).\n\n**Wat er gebeurde:** 6% ≈ 120/2000 = marginale kans YES bij vrouwen.\n\n**Wat je miste:** Gebruik P(NO|Vrouw) = conditionele kans, niet marginaal.\n\n**Uitleg:** P(NO|Vrouw) = 650/770 = 84.42% → **antwoord C**.")
            }
            
            return("Bereken P(NO|Vrouw) = 650/770 = 84.42%, kies het dichtstbijzijnde antwoord.")
          }
          
          # --- BUILD FEEDBACK TEXT ---
          
          wrong_msg <- function(key) {
            r <- results[[key]]
            if (!r$exists) return("Je hebt deze variabele niet ingevuld.")
            if (is.na(r$value_num)) return("Je antwoord kon niet als getal geïnterpreteerd worden.")
            
            # Dispatch to specific diagnostic functions
            if (key == "perc_male") return(wrong_msg_perc_male(r$value))
            if (key == "perc_female") return(wrong_msg_perc_female(r$value))
            if (key == "perc_yes") return(wrong_msg_perc_yes(r$value))
            if (key == "perc_no") return(wrong_msg_perc_no(r$value))
            if (key == "perc_yes_male") return(wrong_msg_perc_yes_male(r$value))
            if (key == "perc_yes_female") return(wrong_msg_perc_yes_female(r$value))
            if (key == "perc_diff_yes") return(wrong_msg_perc_diff(r$value))
            if (key == "odds_male") return(wrong_msg_odds_male(r$value))
            if (key == "odds_female") return(wrong_msg_odds_female(r$value))
            if (key == "odds_ratio") return(wrong_msg_odds_ratio(r$value))
            if (key == "chi2") return(wrong_msg_chi2(r$value))
            if (key == "p_no_female") return(wrong_msg_p_no_female(r$value))
            if (key == "antwoord_mc") return(wrong_msg_mc(r$value))
            
            "Controleer je berekening en afronding."
          }
          
          feedback_text <- "**Gegeven:**\n- N = 2000 volwassenen\n- Man: YES=380, NO=850 (totaal=1230)\n- Vrouw: YES=120, NO=650 (totaal=770)\n\n"
          
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
            "- **Marginale percentages:** Mannen=61.5%, Vrouwen=38.5%, YES=25%, NO=75%\n",
            "- **Conditionele percentages:** YES|Man=30.9%, YES|Vrouw=15.6%\n",
            "- **Percentageverschil:** 15.3 procentpunten\n",
            "- **Odds ratio:** 2.42 (mannen hebben 2.42× hogere odds op crimineel gedrag)\n",
            "- **Chi-kwadraat:** 63.76\n",
            "\n**Meer leren?** [Chi-kwadraat test uitleg](https://www.scribbr.com/statistics/chi-square-tests/) | [Odds Ratio](https://www.theanalysisfactor.com/odds-ratio-cross-tabulation-table/) | [Kruistabellen](https://www.scribbr.com/statistics/chi-square-tests/)\n\n",
            "- **Conditionele percentages:** P(YES|Man)=30.89%, P(YES|Vrouw)=15.58%\n",
            "- **Percentageverschil:** 30.89 - 15.58 = 15.31 procentpunten\n",
            "- **Odds:** Mannen=0.4471, Vrouwen=0.1846\n",
            "- **OR:** 0.4471/0.1846 = 2.42 (mannen ~2.4× meer kans op crimineel gedrag)\n",
            "- **χ²:** 59.16 (df=1, p<0.001 → significant verband)\n",
            "- **P(NO|Vrouw):** 650/770 = 0.8442 = 84.42% → antwoord C (85%)\n\n"
          )

          get_reporter()$add_message(feedback_text, type = "markdown")
          generated == expected
        }
      )
    }
  )
})
