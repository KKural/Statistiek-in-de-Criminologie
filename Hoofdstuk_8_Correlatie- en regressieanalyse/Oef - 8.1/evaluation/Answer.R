context({
  testcase(
    "Koffieprijs en ontbossing",
    {
      testEqual(
        "",
        function(env) {
          results <- list()

          # Data
          x <- c(29, 40, 54, 55, 72)
          y <- c(0.49, 1.59, 1.69, 1.82, 3.10)
          n <- length(x)

          # Verwachte waarden (uit de tabel)
          exp_verklarende <- 1 # prijs
          
          # Gemiddelden
          exp_gemiddelde_x <- 50
          exp_gemiddelde_y <- 1.738
          
          # Sommen
          exp_SSx <- 1066
          exp_SSy <- 3.4434
          exp_SSxy <- 57.87
          
          # Varianties
          exp_variantie_x <- 266.5
          exp_variantie_y <- 0.8609
          
          # Standaardafwijkingen
          exp_sd_x <- 16.3248
          exp_sd_y <- 0.9278
          
          # Covariantie
          exp_covariantie <- 14.4675
          
          # Pearson's r
          exp_r <- 0.9552
          
          # Verandert correlatie bij valuta-omzetting?
          exp_verandert <- 2 # nee

          # Helper functions
          parse_num <- function(val) {
            if (is.character(val)) {
              val <- gsub(",", ".", val, fixed = TRUE)
              val <- gsub("%", "", val, fixed = TRUE)
            }
            suppressWarnings(as.numeric(val))
          }

          check_numeric <- function(varname, expected, tolerance = 0.01, decimals = 2) {
            if (!exists(varname, envir = env)) {
              return(list(exists = FALSE, value = NA, value_num = NA, correct = FALSE, expected = expected, tolerance = tolerance, decimals = decimals))
            }
            raw <- get(varname, envir = env)
            num <- parse_num(raw)
            ok <- !is.na(num) && abs(num - expected) <= tolerance
            list(exists = TRUE, value = raw, value_num = num, correct = ok, expected = expected, tolerance = tolerance, decimals = decimals)
          }

          check_choice <- function(varname, expected, choices) {
            if (!exists(varname, envir = env)) {
              return(list(exists = FALSE, value = NA, value_num = NA, correct = FALSE, expected = expected, choices = choices))
            }
            raw <- get(varname, envir = env)
            num <- parse_num(raw)
            ok <- !is.na(num) && num == expected
            list(exists = TRUE, value = raw, value_num = num, correct = ok, expected = expected, choices = choices)
          }

          check_text <- function(varname) {
            if (!exists(varname, envir = env)) {
              return(list(exists = FALSE, value = NA, correct = FALSE))
            }

            raw <- get(varname, envir = env)
            if (!is.character(raw)) raw <- as.character(raw)
            text <- tolower(raw)

            has_some_length <- nchar(gsub("\\s+", "", text)) >= 15
            has_conclusion <- grepl("\\b(niet|onveranderd|zelfde|blijft|verandert)\\b", text)
            has_reason <- grepl("lineair|transformatie|schaal|eenheid|standaard|z-?score|vermenig|constante", text)

            ok <- has_some_length && has_conclusion && has_reason
            list(
              exists = TRUE,
              value = raw,
              correct = ok,
              has_some_length = has_some_length,
              has_conclusion = has_conclusion,
              has_reason = has_reason
            )
          }

          # Check all values
          results$verklarende_variabele <- check_choice("verklarende_variabele", exp_verklarende, c("1 = prijs", "2 = ontbossing"))
          results$gemiddelde_x <- check_numeric("gemiddelde_x", exp_gemiddelde_x, 0.01, 2)
          results$gemiddelde_y <- check_numeric("gemiddelde_y", exp_gemiddelde_y, 0.0001, 4)
          results$SSx <- check_numeric("SSx", exp_SSx, 1, 0)
          results$SSy <- check_numeric("SSy", exp_SSy, 0.0001, 4)
          results$SSxy <- check_numeric("SSxy", exp_SSxy, 0.01, 2)
          results$variantie_x <- check_numeric("variantie_x", exp_variantie_x, 0.1, 1)
          results$variantie_y <- check_numeric("variantie_y", exp_variantie_y, 0.0001, 4)
          results$sd_x <- check_numeric("sd_x", exp_sd_x, 0.0001, 4)
          results$sd_y <- check_numeric("sd_y", exp_sd_y, 0.0001, 4)
          results$covariantie <- check_numeric("covariantie", exp_covariantie, 0.0001, 4)
          results$pearson_r <- check_numeric("pearson_r", exp_r, 0.0001, 4)
          results$correlatie_verandert <- check_choice("correlatie_verandert", exp_verandert, c("1 = ja", "2 = nee"))
          results$verklaring_euro <- check_text("verklaring_euro")

          assign("detailed_results", results, envir = globalenv())
          all(sapply(results, function(r) isTRUE(r$correct)))
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("detailed_results", envir = globalenv())
          
          parse_num <- function(val) {
            if (is.character(val)) {
              val <- gsub(",", ".", val, fixed = TRUE)
              val <- gsub("%", "", val, fixed = TRUE)
            }
            suppressWarnings(as.numeric(val))
          }

          # --- DIAGNOSTIC FUNCTIONS FOR COMMON MISTAKES ---
          
          wrong_msg_gemiddelde_x <- function(val) {
            val_num <- parse_num(val)
            if (is.na(val_num)) {
              return("Je antwoord kon niet als getal geïnterpreteerd worden. Het juiste antwoord is 50.")
            }
            
            # Forgot to divide by n
            if (abs(val_num - 250) < 1) {
              return("**Waarom dit fout is:** Je gaf 250 - dit is de som van alle X-waarden.\n\n**Wat er gebeurde:** Je berekende 29+40+54+55+72 = 250, maar vergat te delen door n=5.\n\n**Wat je miste:** Gemiddelde = som / aantal observaties.\n\n**Uitleg:** x̄ = 250 / 5 = **50**.")
            }
            
            # Used median instead
            if (abs(val_num - 54) < 1) {
              return("**Waarom dit fout is:** Je gaf 54 - dit is de mediaan, niet het gemiddelde.\n\n**Wat er gebeurde:** Je sorteerde de waarden en nam de middelste.\n\n**Wat je miste:** Voor correlatie gebruik je het rekenkundig gemiddelde (som/n).\n\n**Uitleg:** x̄ = (29+40+54+55+72) / 5 = **50**.")
            }
            
            return(paste0(
              "**Je antwoord ", val, " is niet correct.**\n\n",
              "**Stap-voor-stap controle:**\n",
              "1. **Som:** 29+40+54+55+72 = 250 ✓\n",
              "2. **Aantal:** n = 5 ✓\n",
              "3. **Gemiddelde:** 250/5 = **50** ✓"
            ))
          }
          
          wrong_msg_gemiddelde_y <- function(val) {
            val_num <- parse_num(val)
            if (is.na(val_num)) {
              return("Je antwoord kon niet als getal geïnterpreteerd worden. Het juiste antwoord is 1.738 (of 1.74).")
            }
            
            # Forgot to divide by n
            if (abs(val_num - 8.69) < 0.1) {
              return("**Waarom dit fout is:** Je gaf 8.69 - dit is de som van alle Y-waarden.\n\n**Wat er gebeurde:** Je berekende 0.49+1.59+1.69+1.82+3.10 = 8.69, maar vergat te delen door n=5.\n\n**Wat je miste:** Gemiddelde = som / aantal observaties.\n\n**Uitleg:** ȳ = 8.69 / 5 = **1.738**.")
            }
            
            # Rounding too early
            if (abs(val_num - 1.74) < 0.01) {
              return("**Bijna correct!** Je afrondde naar 2 decimalen, maar we vragen 4 decimalen voor tussenstappen.\n\n**Correctie:** ȳ = 8.69 / 5 = **1.738** (of 1.7380).")
            }
            
            return(paste0(
              "**Je antwoord ", val, " is niet correct.**\n\n",
              "**Stap-voor-stap controle:**\n",
              "1. **Som:** 0.49+1.59+1.69+1.82+3.10 = 8.69 ✓\n",
              "2. **Aantal:** n = 5 ✓\n",
              "3. **Gemiddelde:** 8.69/5 = **1.738** ✓"
            ))
          }
          
          wrong_msg_SSx <- function(val) {
            val_num <- parse_num(val)
            if (is.na(val_num)) {
              return("Je antwoord kon niet als getal geïnterpreteerd worden. Het juiste antwoord is 1066.")
            }
            
            # Used n instead of (n-1) - gave variance instead
            if (abs(val_num - 266.5) < 1) {
              return("**Waarom dit fout is:** Je gaf 266.5 - dit is de variantie s²x, niet SSx.\n\n**Wat er gebeurde:** Je deelde SSx al door (n-1).\n\n**Wat je miste:** SSx = som van (xi - x̄)², ZONDER delen.\n\n**Uitleg:** SSx = 441+100+16+25+484 = **1066**.")
            }
            
            # Forgot to square
            if (abs(val_num - 50) < 5) {
              return("**Waarom dit fout is:** Je antwoord suggereert dat je de afwijkingen niet kwadrateerde.\n\n**Wat er gebeurde:** Je telde |xi - x̄| op in plaats van (xi - x̄)².\n\n**Wat je miste:** SSx vereist gekwadrateerde afwijkingen.\n\n**Uitleg:** SSx = (−21)²+(−10)²+4²+5²+22² = 441+100+16+25+484 = **1066**.")
            }
            
            return(paste0(
              "**Je antwoord ", val, " is niet correct.**\n\n",
              "**Stap-voor-stap controle:**\n",
              "1. **Afwijkingen:** (29−50)²=441, (40−50)²=100, (54−50)²=16, (55−50)²=25, (72−50)²=484 ✓\n",
              "2. **Som:** 441+100+16+25+484 = **1066** ✓"
            ))
          }
          
          wrong_msg_SSy <- function(val) {
            val_num <- parse_num(val)
            if (is.na(val_num)) {
              return("Je antwoord kon niet als getal geïnterpreteerd worden. Het juiste antwoord is 3.4434.")
            }
            
            # Used variance instead
            if (abs(val_num - 0.8609) < 0.01) {
              return("**Waarom dit fout is:** Je gaf 0.8609 - dit is de variantie s²y, niet SSy.\n\n**Wat er gebeurde:** Je deelde SSy al door (n-1).\n\n**Wat je miste:** SSy = som van (yi - ȳ)², ZONDER delen.\n\n**Uitleg:** SSy = 1.5601+0.0219+0.0023+0.0067+1.8524 = **3.4434**.")
            }
            
            # Rounding errors
            if (abs(val_num - 3.44) < 0.01) {
              return("**Bijna correct!** Je afrondde te vroeg. Gebruik 4 decimalen voor alle tussenstappen.\n\n**Correctie:** SSy = 1.5601+0.0219+0.0023+0.0067+1.8524 = **3.4434**.")
            }
            
            return(paste0(
              "**Je antwoord ", val, " is niet correct.**\n\n",
              "**Stap-voor-stap controle:**\n",
              "1. **Afwijkingen gekwadrateerd:** (0.49−1.738)²=1.5601, (1.59−1.738)²=0.0219, (1.69−1.738)²=0.0023, (1.82−1.738)²=0.0067, (3.10−1.738)²=1.8524 ✓\n",
              "2. **Som:** 1.5601+0.0219+0.0023+0.0067+1.8524 = **3.4434** ✓"
            ))
          }
          
          wrong_msg_SSxy <- function(val) {
            val_num <- parse_num(val)
            if (is.na(val_num)) {
              return("Je antwoord kon niet als getal geïnterpreteerd worden. Het juiste antwoord is 57.87.")
            }
            
            # Used covariance instead
            if (abs(val_num - 14.4675) < 0.1) {
              return("**Waarom dit fout is:** Je gaf 14.4675 - dit is de covariantie, niet SSxy.\n\n**Wat er gebeurde:** Je deelde SSxy al door (n-1).\n\n**Wat je miste:** SSxy = som van (xi - x̄)(yi - ȳ), ZONDER delen.\n\n**Uitleg:** SSxy = 26.21+(−1.48)+5.95+4.10+23.09 = **57.87**.")
            }
            
            # Sign error - absolute values
            if (val_num > 0 && abs(val_num - 60.83) < 2) {
              return("**Waarom dit fout is:** Je antwoord is te hoog - controleer de tekens.\n\n**Wat er gebeurde:** Waarschijnlijk nam je absolute waarden of vergat je negatieve producten.\n\n**Wat je miste:** (xi−x̄)(yi−ȳ) kan negatief zijn als één afwijking negatief is.\n\n**Uitleg:** Let op: (40−50)×(1.59−1.738) = (−10)×(−0.148) = +1.48, NIET −1.48.\nSSxy = 26.21+(−1.48)+5.95+4.10+23.09 = **57.87**.")
            }
            
            return(paste0(
              "**Je antwoord ", val, " is niet correct.**\n\n",
              "**Stap-voor-stap controle:**\n",
              "1. **Kruisproducten:** (29−50)(0.49−1.738)=26.21, (40−50)(1.59−1.738)=1.48, (54−50)(1.69−1.738)=−0.19, (55−50)(1.82−1.738)=0.41, (72−50)(3.10−1.738)=29.96 ✓\n",
              "2. **Som:** 26.21+1.48+(−0.19)+0.41+29.96 = **57.87** ✓"
            ))
          }
          
          wrong_msg_variantie_x <- function(val) {
            val_num <- parse_num(val)
            if (is.na(val_num)) {
              return("Je antwoord kon niet als getal geïnterpreteerd worden. Het juiste antwoord is 266.5.")
            }
            
            # Used SSx instead of dividing
            if (abs(val_num - 1066) < 5) {
              return("**Waarom dit fout is:** Je gaf 1066 - dit is SSx, niet de variantie.\n\n**Wat er gebeurde:** Je vergat te delen door (n-1).\n\n**Wat je miste:** Variantie s²x = SSx / (n-1).\n\n**Uitleg:** s²x = 1066 / 4 = **266.5**.")
            }
            
            # Divided by n instead of (n-1)
            if (abs(val_num - 213.2) < 1) {
              return("**Waarom dit fout is:** Je gaf 213.2 - je deelde door n=5 in plaats van (n-1)=4.\n\n**Wat er gebeurde:** Je gebruikte 1066/5 = 213.2.\n\n**Wat je miste:** Steekproefvariantie gebruikt (n-1) als noemer.\n\n**Uitleg:** s²x = 1066 / **4** = **266.5**.")
            }
            
            return(paste0(
              "**Je antwoord ", val, " is niet correct.**\n\n",
              "**Stap-voor-stap controle:**\n",
              "1. **SSx:** 1066 ✓\n",
              "2. **Noemer:** n-1 = 5-1 = 4 ✓\n",
              "3. **Variantie:** 1066/4 = **266.5** ✓"
            ))
          }
          
          wrong_msg_variantie_y <- function(val) {
            val_num <- parse_num(val)
            if (is.na(val_num)) {
              return("Je antwoord kon niet als getal geïnterpreteerd worden. Het juiste antwoord is 0.8609.")
            }
            
            # Used SSy instead
            if (abs(val_num - 3.4434) < 0.1) {
              return("**Waarom dit fout is:** Je gaf 3.4434 - dit is SSy, niet de variantie.\n\n**Wat er gebeurde:** Je vergat te delen door (n-1).\n\n**Wat je miste:** Variantie s²y = SSy / (n-1).\n\n**Uitleg:** s²y = 3.4434 / 4 = **0.8609**.")
            }
            
            # Divided by n
            if (abs(val_num - 0.6887) < 0.01) {
              return("**Waarom dit fout is:** Je deelde door n=5 in plaats van (n-1)=4.\n\n**Wat er gebeurde:** Je gebruikte 3.4434/5.\n\n**Wat je miste:** Steekproefvariantie gebruikt (n-1).\n\n**Uitleg:** s²y = 3.4434 / **4** = **0.8609**.")
            }
            
            return(paste0(
              "**Je antwoord ", val, " is niet correct.**\n\n",
              "**Stap-voor-stap controle:**\n",
              "1. **SSy:** 3.4434 ✓\n",
              "2. **Noemer:** n-1 = 4 ✓\n",
              "3. **Variantie:** 3.4434/4 = **0.8609** ✓"
            ))
          }
          
          wrong_msg_sd_x <- function(val) {
            val_num <- parse_num(val)
            if (is.na(val_num)) {
              return("Je antwoord kon niet als getal geïnterpreteerd worden. Het juiste antwoord is 16.3248.")
            }
            
            # Forgot to take square root
            if (abs(val_num - 266.5) < 1) {
              return("**Waarom dit fout is:** Je gaf 266.5 - dit is de variantie, niet de SD.\n\n**Wat er gebeurde:** Je vergat de vierkantswortel te nemen.\n\n**Wat je miste:** Standaardafwijking sx = √s²x.\n\n**Uitleg:** sx = √266.5 = **16.3248**.")
            }
            
            # Rounding too early
            if (abs(val_num - 16.32) < 0.01) {
              return("**Bijna correct!** Gebruik 4 decimalen voor tussenstappen.\n\n**Correctie:** sx = √266.5 = **16.3248**.")
            }
            
            return(paste0(
              "**Je antwoord ", val, " is niet correct.**\n\n",
              "**Stap-voor-stap controle:**\n",
              "1. **Variantie:** s²x = 266.5 ✓\n",
              "2. **Vierkantswortel:** √266.5 = **16.3248** ✓"
            ))
          }
          
          wrong_msg_sd_y <- function(val) {
            val_num <- parse_num(val)
            if (is.na(val_num)) {
              return("Je antwoord kon niet als getal geïnterpreteerd worden. Het juiste antwoord is 0.9278.")
            }
            
            # Forgot square root
            if (abs(val_num - 0.8609) < 0.01) {
              return("**Waarom dit fout is:** Je gaf 0.8609 - dit is de variantie, niet de SD.\n\n**Wat er gebeurde:** Je vergat de vierkantswortel te nemen.\n\n**Wat je miste:** Standaardafwijking sy = √s²y.\n\n**Uitleg:** sy = √0.8609 = **0.9278**.")
            }
            
            # Rounding too early
            if (abs(val_num - 0.93) < 0.01) {
              return("**Bijna correct!** Gebruik 4 decimalen voor tussenstappen.\n\n**Correctie:** sy = √0.8609 = **0.9278**.")
            }
            
            return(paste0(
              "**Je antwoord ", val, " is niet correct.**\n\n",
              "**Stap-voor-stap controle:**\n",
              "1. **Variantie:** s²y = 0.8609 ✓\n",
              "2. **Vierkantswortel:** √0.8609 = **0.9278** ✓"
            ))
          }
          
          wrong_msg_covariantie <- function(val) {
            val_num <- parse_num(val)
            if (is.na(val_num)) {
              return("Je antwoord kon niet als getal geïnterpreteerd worden. Het juiste antwoord is 14.4675.")
            }
            
            # Used SSxy instead
            if (abs(val_num - 57.87) < 1) {
              return("**Waarom dit fout is:** Je gaf 57.87 - dit is SSxy, niet de covariantie.\n\n**Wat er gebeurde:** Je vergat te delen door (n-1).\n\n**Wat je miste:** Covariantie s²xy = SSxy / (n-1).\n\n**Uitleg:** s²xy = 57.87 / 4 = **14.4675**.")
            }
            
            # Divided by n
            if (abs(val_num - 11.574) < 0.1) {
              return("**Waarom dit fout is:** Je deelde door n=5 in plaats van (n-1)=4.\n\n**Wat er gebeurde:** Je gebruikte 57.87/5.\n\n**Wat je miste:** Steekproefcovariantie gebruikt (n-1).\n\n**Uitleg:** s²xy = 57.87 / **4** = **14.4675**.")
            }
            
            return(paste0(
              "**Je antwoord ", val, " is niet correct.**\n\n",
              "**Stap-voor-stap controle:**\n",
              "1. **SSxy:** 57.87 ✓\n",
              "2. **Noemer:** n-1 = 4 ✓\n",
              "3. **Covariantie:** 57.87/4 = **14.4675** ✓"
            ))
          }
          
          wrong_msg_pearson_r <- function(val) {
            val_num <- parse_num(val)
            if (is.na(val_num)) {
              return("Je antwoord kon niet als getal geïnterpreteerd worden. Het juiste antwoord is 0.9552 (of 0.96).")
            }
            
            # Used covariance instead
            if (abs(val_num - 14.4675) < 0.1) {
              return("**Waarom dit fout is:** Je gaf 14.4675 - dit is de covariantie, niet Pearson's r.\n\n**Wat er gebeurde:** Je vergat te standaardiseren.\n\n**Wat je miste:** r = s²xy / (sx × sy).\n\n**Uitleg:** r = 14.4675 / (16.3248 × 0.9278) = **0.9552**.")
            }
            
            # Used wrong formula (variances instead of SDs)
            if (abs(val_num - 0.0631) < 0.01) {
              return("**Waarom dit fout is:** Je gebruikte varianties in plaats van standaardafwijkingen.\n\n**Wat er gebeurde:** Je berekende s²xy / (s²x × s²y) in plaats van s²xy / (sx × sy).\n\n**Wat je miste:** Pearson's r = covariantie / (SD_x × SD_y), niet door varianties.\n\n**Uitleg:** r = 14.4675 / (**16.3248 × 0.9278**) = **0.9552**.")
            }
            
            # Squared the result
            if (abs(val_num - 0.9124) < 0.01) {
              return("**Waarom dit fout is:** Je gaf 0.9124 ≈ r², niet r.\n\n**Wat er gebeurde:** Je kwadrateerde het resultaat.\n\n**Wat je miste:** Pearson's r is de correlatie zelf, r² is de determinatiecoëfficiënt.\n\n**Uitleg:** r = 14.4675 / (16.3248 × 0.9278) = **0.9552**.")
            }
            
            # Rounding too early
            if (abs(val_num - 0.96) < 0.01) {
              return("**Bijna correct!** Je afrondde naar 2 decimalen, maar we vragen 4 decimalen voor tussenstappen.\n\n**Correctie:** r = 14.4675 / 15.1455 = **0.9552**.")
            }
            
            return(paste0(
              "**Je antwoord ", val, " is niet correct.**\n\n",
              "**Stap-voor-stap controle:**\n",
              "1. **Covariantie:** s²xy = 14.4675 ✓\n",
              "2. **Standaardafwijkingen:** sx = 16.3248, sy = 0.9278 ✓\n",
              "3. **Product:** sx × sy = 15.1455 ✓\n",
              "4. **Pearson's r:** 14.4675 / 15.1455 = **0.9552** ✓"
            ))
          }

          # --- BUILD FEEDBACK TEXT ---
          
          qnames <- c(
            verklarende_variabele = "Verklarende variabele (X)",
            gemiddelde_x = "Gemiddelde X (x̄)",
            gemiddelde_y = "Gemiddelde Y (ȳ)",
            SSx = "SSx (som gekwadrateerde afwijkingen X)",
            SSy = "SSy (som gekwadrateerde afwijkingen Y)",
            SSxy = "SSxy (som kruisproducten)",
            variantie_x = "Variantie X (s²x)",
            variantie_y = "Variantie Y (s²y)",
            sd_x = "Standaardafwijking X (sx)",
            sd_y = "Standaardafwijking Y (sy)",
            covariantie = "Covariantie (s²xy)",
            pearson_r = "Pearson's correlatie (r)",
            correlatie_verandert = "Verandert correlatie bij euro-omzetting?",
            verklaring_euro = "Verklaring waarom"
          )
          
          feedback_text <- "**Gegeven:**\n- Koffieprijs (X): 29, 40, 54, 55, 72 euro/kg\n- Ontbossing (Y): 0.49, 1.59, 1.69, 1.82, 3.10 miljoen ha\n- n = 5\n\n"
          
          # Question 1: Verklarende variabele
          q <- "verklarende_variabele"
          if (results[[q]]$exists) {
            if (results[[q]]$correct) {
              feedback_text <- paste0(feedback_text, "✅ ", qnames[[q]], " **Correct!**\n\n")
            } else {
              feedback_text <- paste0(
                feedback_text,
                "❌ ", qnames[[q]], " **Fout.**\n\n",
                "**Waarom dit fout is:** Je koos ontbossing als verklarende variabele.\n\n",
                "**Wat je miste:** In regressieanalyse is X (prijs) de verklarende variabele die Y (ontbossing) voorspelt.\n\n",
                "**Uitleg:** Hogere koffieprijzen → meer ontbossing (economische prikkel), niet andersom.\n\n"
              )
            }
          } else {
            feedback_text <- paste0(feedback_text, "❌ ", qnames[[q]], " **Je hebt geen antwoord gegeven.**\n\n")
          }
          
          # Question 2: Gemiddelde X
          q <- "gemiddelde_x"
          if (results[[q]]$exists) {
            if (results[[q]]$correct) {
              feedback_text <- paste0(feedback_text, "✅ ", qnames[[q]], " **Correct! (", results[[q]]$value, ")**\n\n")
            } else {
              msg <- wrong_msg_gemiddelde_x(results[[q]]$value)
              feedback_text <- paste0(feedback_text, "❌ ", qnames[[q]], " **Fout.**\n\n", msg, "\n\n")
            }
          } else {
            feedback_text <- paste0(feedback_text, "❌ ", qnames[[q]], " **Je hebt geen antwoord gegeven.**\n\n")
          }
          
          # Question 3: Gemiddelde Y
          q <- "gemiddelde_y"
          if (results[[q]]$exists) {
            if (results[[q]]$correct) {
              feedback_text <- paste0(feedback_text, "✅ ", qnames[[q]], " **Correct! (", results[[q]]$value, ")**\n\n")
            } else {
              msg <- wrong_msg_gemiddelde_y(results[[q]]$value)
              feedback_text <- paste0(feedback_text, "❌ ", qnames[[q]], " **Fout.**\n\n", msg, "\n\n")
            }
          } else {
            feedback_text <- paste0(feedback_text, "❌ ", qnames[[q]], " **Je hebt geen antwoord gegeven.**\n\n")
          }
          
          # Question 4: SSx
          q <- "SSx"
          if (results[[q]]$exists) {
            if (results[[q]]$correct) {
              feedback_text <- paste0(feedback_text, "✅ ", qnames[[q]], " **Correct! (", results[[q]]$value, ")**\n\n")
            } else {
              msg <- wrong_msg_SSx(results[[q]]$value)
              feedback_text <- paste0(feedback_text, "❌ ", qnames[[q]], " **Fout.**\n\n", msg, "\n\n")
            }
          } else {
            feedback_text <- paste0(feedback_text, "❌ ", qnames[[q]], " **Je hebt geen antwoord gegeven.**\n\n")
          }
          
          # Question 5: SSy
          q <- "SSy"
          if (results[[q]]$exists) {
            if (results[[q]]$correct) {
              feedback_text <- paste0(feedback_text, "✅ ", qnames[[q]], " **Correct! (", results[[q]]$value, ")**\n\n")
            } else {
              msg <- wrong_msg_SSy(results[[q]]$value)
              feedback_text <- paste0(feedback_text, "❌ ", qnames[[q]], " **Fout.**\n\n", msg, "\n\n")
            }
          } else {
            feedback_text <- paste0(feedback_text, "❌ ", qnames[[q]], " **Je hebt geen antwoord gegeven.**\n\n")
          }
          
          # Question 6: SSxy
          q <- "SSxy"
          if (results[[q]]$exists) {
            if (results[[q]]$correct) {
              feedback_text <- paste0(feedback_text, "✅ ", qnames[[q]], " **Correct! (", results[[q]]$value, ")**\n\n")
            } else {
              msg <- wrong_msg_SSxy(results[[q]]$value)
              feedback_text <- paste0(feedback_text, "❌ ", qnames[[q]], " **Fout.**\n\n", msg, "\n\n")
            }
          } else {
            feedback_text <- paste0(feedback_text, "❌ ", qnames[[q]], " **Je hebt geen antwoord gegeven.**\n\n")
          }
          
          # Question 7: Variantie X
          q <- "variantie_x"
          if (results[[q]]$exists) {
            if (results[[q]]$correct) {
              feedback_text <- paste0(feedback_text, "✅ ", qnames[[q]], " **Correct! (", results[[q]]$value, ")**\n\n")
            } else {
              msg <- wrong_msg_variantie_x(results[[q]]$value)
              feedback_text <- paste0(feedback_text, "❌ ", qnames[[q]], " **Fout.**\n\n", msg, "\n\n")
            }
          } else {
            feedback_text <- paste0(feedback_text, "❌ ", qnames[[q]], " **Je hebt geen antwoord gegeven.**\n\n")
          }
          
          # Question 8: Variantie Y
          q <- "variantie_y"
          if (results[[q]]$exists) {
            if (results[[q]]$correct) {
              feedback_text <- paste0(feedback_text, "✅ ", qnames[[q]], " **Correct! (", results[[q]]$value, ")**\n\n")
            } else {
              msg <- wrong_msg_variantie_y(results[[q]]$value)
              feedback_text <- paste0(feedback_text, "❌ ", qnames[[q]], " **Fout.**\n\n", msg, "\n\n")
            }
          } else {
            feedback_text <- paste0(feedback_text, "❌ ", qnames[[q]], " **Je hebt geen antwoord gegeven.**\n\n")
          }
          
          # Question 9: SD X
          q <- "sd_x"
          if (results[[q]]$exists) {
            if (results[[q]]$correct) {
              feedback_text <- paste0(feedback_text, "✅ ", qnames[[q]], " **Correct! (", results[[q]]$value, ")**\n\n")
            } else {
              msg <- wrong_msg_sd_x(results[[q]]$value)
              feedback_text <- paste0(feedback_text, "❌ ", qnames[[q]], " **Fout.**\n\n", msg, "\n\n")
            }
          } else {
            feedback_text <- paste0(feedback_text, "❌ ", qnames[[q]], " **Je hebt geen antwoord gegeven.**\n\n")
          }
          
          # Question 10: SD Y
          q <- "sd_y"
          if (results[[q]]$exists) {
            if (results[[q]]$correct) {
              feedback_text <- paste0(feedback_text, "✅ ", qnames[[q]], " **Correct! (", results[[q]]$value, ")**\n\n")
            } else {
              msg <- wrong_msg_sd_y(results[[q]]$value)
              feedback_text <- paste0(feedback_text, "❌ ", qnames[[q]], " **Fout.**\n\n", msg, "\n\n")
            }
          } else {
            feedback_text <- paste0(feedback_text, "❌ ", qnames[[q]], " **Je hebt geen antwoord gegeven.**\n\n")
          }
          
          # Question 11: Covariantie
          q <- "covariantie"
          if (results[[q]]$exists) {
            if (results[[q]]$correct) {
              feedback_text <- paste0(feedback_text, "✅ ", qnames[[q]], " **Correct! (", results[[q]]$value, ")**\n\n")
            } else {
              msg <- wrong_msg_covariantie(results[[q]]$value)
              feedback_text <- paste0(feedback_text, "❌ ", qnames[[q]], " **Fout.**\n\n", msg, "\n\n")
            }
          } else {
            feedback_text <- paste0(feedback_text, "❌ ", qnames[[q]], " **Je hebt geen antwoord gegeven.**\n\n")
          }
          
          # Question 12: Pearson's r
          q <- "pearson_r"
          if (results[[q]]$exists) {
            if (results[[q]]$correct) {
              feedback_text <- paste0(feedback_text, "✅ ", qnames[[q]], " **Correct! (", results[[q]]$value, ")**\n\n")
            } else {
              msg <- wrong_msg_pearson_r(results[[q]]$value)
              feedback_text <- paste0(feedback_text, "❌ ", qnames[[q]], " **Fout.**\n\n", msg, "\n\n")
            }
          } else {
            feedback_text <- paste0(feedback_text, "❌ ", qnames[[q]], " **Je hebt geen antwoord gegeven.**\n\n")
          }
          
          # Question 13a: Verandert correlatie?
          q <- "correlatie_verandert"
          if (results[[q]]$exists) {
            if (results[[q]]$correct) {
              feedback_text <- paste0(feedback_text, "✅ ", qnames[[q]], " **Correct!**\n\n")
            } else {
              feedback_text <- paste0(
                feedback_text,
                "❌ ", qnames[[q]], " **Fout.**\n\n",
                "**Waarom dit fout is:** Correlaties zijn **dimensieloos** en veranderen NIET bij lineaire transformaties.\n\n",
                "**Wat je miste:** Omrekenen van euro naar dollar (× constante) is een lineaire transformatie.\n\n",
                "**Uitleg:** r blijft 0.9552 ongeacht de eenheid van X.\n\n"
              )
            }
          } else {
            feedback_text <- paste0(feedback_text, "❌ ", qnames[[q]], " **Je hebt geen antwoord gegeven.**\n\n")
          }
          
          # Question 13b: Verklaring
          q <- "verklaring_euro"
          if (results[[q]]$exists) {
            if (results[[q]]$correct) {
              feedback_text <- paste0(feedback_text, "✅ ", qnames[[q]], " **Correct!**\n\n")
            } else {
              feedback_text <- paste0(feedback_text, "❌ ", qnames[[q]], " **Nog onvolledig.**\n\n")
              if (!isTRUE(results[[q]]$has_some_length)) {
                feedback_text <- paste0(feedback_text, "- Schrijf minimaal 1-3 zinnen.\n")
              }
              if (!isTRUE(results[[q]]$has_conclusion)) {
                feedback_text <- paste0(feedback_text, "- Vermeld expliciet dat de correlatie NIET verandert.\n")
              }
              if (!isTRUE(results[[q]]$has_reason)) {
                feedback_text <- paste0(feedback_text, "- Leg uit waarom: lineaire transformatie / standaardisatie / dimensieloos.\n")
              }
              feedback_text <- paste0(feedback_text, "\n")
            }
          } else {
            feedback_text <- paste0(feedback_text, "❌ ", qnames[[q]], " **Je hebt geen antwoord gegeven.**\n\n")
          }
          
          # Summary
          feedback_text <- paste0(
            feedback_text,
            "---\n\n",
            "**Samenvatting oplossing:**\n",
            "- **Verklarende variabele:** Prijs (X)\n",
            "- **Gemiddelden:** x̄=50, ȳ=1.738\n",
            "- **Sommen:** SSx=1066, SSy=3.4434, SSxy=57.87\n",
            "- **Varianties:** s²x=266.5, s²y=0.8609\n",
            "- **SD's:** sx=16.3248, sy=0.9278\n",
            "- **Covariantie:** s²xy=14.4675\n",
            "- **Pearson's r:** 0.9552 (zeer sterke positieve correlatie)\n",
            "- **Lineaire transformatie:** Correlatie blijft onveranderd bij euro↔dollar omzetting\n\n"
          )

          get_reporter()$add_message(feedback_text, type = "markdown")
          generated == expected
        }
      )
    }
  )
})
