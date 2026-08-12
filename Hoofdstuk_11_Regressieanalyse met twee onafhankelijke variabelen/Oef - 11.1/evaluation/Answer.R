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
              return(list(q = q, ok = FALSE, val = NA, num = NA_real_,
                          expected = expected[[q]], reason = "missing"))
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

          diagnostics <- list(
            afhankelijke_variabele = c(
              "Mogelijk heb je een verklarende variabele gekozen omdat die inhoudelijk belangrijk lijkt.",
              "De afhankelijke variabele is de uitkomst die het model probeert te verklaren; hier is dat de criminaliteitsindex Y.",
              "Zoek eerst Y aan de linkerkant van de regressievergelijking.",
              "Label criminaliteitsindex als Y en politiedichtheid en werkloosheid als X1 en X2."
            ),
            gemiddelde_x1 = c(
              "Mogelijk heb je de waarden opgeteld maar niet door alle vijf steden gedeeld, of X1 en X2 verwisseld.",
              "Voor X1 is de som 15 en n = 5, dus het gemiddelde is 15 / 5 = 3.",
              "Gemiddelde = som van de juiste kolom / aantal observaties.",
              "Markeer de X1-kolom, tel 1+2+3+4+5 en deel eenmaal door 5."
            ),
            gemiddelde_x2 = c(
              "Mogelijk heb je de ruwe som gebruikt, door n-1 gedeeld, of de X1-kolom genomen.",
              "Voor X2 is de som 35 en een gemiddelde gebruikt n = 5 als deler, niet n-1.",
              "Een gemiddelde gebruikt n; n-1 hoort pas bij een steekproefvariantie.",
              "Bereken 5+10+5+10+5 en deel door het aantal rijen."
            ),
            gemiddelde_y = c(
              "Mogelijk heb je de som van Y gerapporteerd of de deler n-1 gebruikt.",
              "De vijf criminaliteitsindices tellen op tot 90; 90 / 5 = 18.",
              "Gebruik voor een rekenkundig gemiddelde altijd som / n.",
              "Schrijf eerst de Y-som en n apart op en voer dan precies een deling uit."
            ),
            SSx1 = c(
              "Mogelijk heb je variantie in plaats van SS berekend, of de ruwe waarden gekwadrateerd zonder centreren.",
              "SSx1 is de som van gekwadrateerde afwijkingen en wordt hier niet door n of n-1 gedeeld.",
              "SSx = som van (x - xgemiddelde)^2; centreren, kwadrateren, sommeren.",
              "Maak de rij -2, -1, 0, 1, 2 en tel de kwadraten op zonder einddeling."
            ),
            SSx2 = c(
              "Mogelijk heb je SS door n of n-1 gedeeld en zo een variantie verkregen, of SSx1 gebruikt.",
              "De gekwadrateerde X2-afwijkingen zijn 4, 9, 4, 9 en 4; hun som is 30.",
              "Een som van kwadraten heeft geen deler; variantie wel.",
              "Controleer de X2-afwijkingen -2, 3, -2, 3, -2 en sommeer hun kwadraten."
            ),
            SSy = c(
              "Mogelijk heb je de variantie van Y gerapporteerd of met de ongecentreerde Y-waarden gerekend.",
              "SSy telt de gekwadrateerde afwijkingen rond Ygemiddelde: 4+36+4+0+36 = 80.",
              "Centreer eerst rond het gemiddelde en deel de SS daarna niet.",
              "Maak een aparte kolom Y-18, kwadrateer die en tel op."
            ),
            SSx1x2 = c(
              "Mogelijk heb je ruwe producten X1 maal X2 gebruikt in plaats van gecentreerde kruisproducten.",
              "De gecentreerde producten 4, -3, 0, 3 en -4 heffen elkaar precies op.",
              "Een kruisproduct gebruikt (x1-x1gemiddelde)(x2-x2gemiddelde), met behoud van tekens.",
              "Schrijf beide afwijkingskolommen naast elkaar en vermenigvuldig rij per rij."
            ),
            SSx1y = c(
              "Mogelijk heb je het minteken verloren, een covariantie gerapporteerd, of ruwe X1Y-producten gebruikt.",
              "De gecentreerde kruisproducten tellen op tot -22; delen door n of n-1 zou een andere grootheid geven.",
              "SSxy is een onverdeelde, getekende som van gecentreerde producten.",
              "Bereken per rij (X1-3)(Y-18), behoud elk teken en tel pas daarna op."
            ),
            SSx2y = c(
              "Mogelijk heb je covariantie in plaats van SSx2y berekend, of ongecentreerde producten gebruikt.",
              "De gecentreerde producten -4, 18, 4, 0 en 12 sommeren tot 30.",
              "Voor SSxy: centreren, rijgewijs vermenigvuldigen en niet delen.",
              "Zet X2-7 naast Y-18 en controleer elk product voordat je sommeert."
            ),
            determinant_D = c(
              "Mogelijk heb je de vierkantswortel genomen of een tussenproduct in plaats van de determinant gerapporteerd.",
              "D = SSx1 maal SSx2 min SSx1x2 in het kwadraat = 10 maal 30 min 0 = 300.",
              "Werk eerst beide termen volledig uit en trek daarna af.",
              "Vul 10, 30 en 0 afzonderlijk in de determinantformule in."
            ),
            b1 = c(
              "Mogelijk heb je het minteken verloren, de teller niet door D gedeeld, of b2 gebruikt.",
              "Voor b1 is de teller -660 en D = 300, zodat b1 = -2,20.",
              "Koppel in de b1-formule X1Y aan SSx2 en deel de volledige teller door D.",
              "Bereken eerst de teller met teken en voer daarna -660 / 300 uit."
            ),
            b2 = c(
              "Mogelijk heb je de teller 300 als eindantwoord genomen, b1 verwisseld met b2, of een correlatie berekend.",
              "Voor b2 is de teller 300 en D = 300, dus b2 = 1,00.",
              "Een regressiegewicht is teller / determinant en is niet automatisch een correlatie.",
              "Label de b2-formule, bereken de teller en deel als laatste door D."
            ),
            intercept_a = c(
              "Mogelijk heb je alleen Ygemiddelde gebruikt of een minteken bij b1 maal X1gemiddelde gemist.",
              "Het intercept volgt uit 18 - (-2,2 maal 3) - (1 maal 7) = 17,6.",
              "Gebruik a = Ygemiddelde - b1X1gemiddelde - b2X2gemiddelde en behandel negatieve b zorgvuldig.",
              "Zet haakjes rond elk coefficient-gemiddeldeproduct voordat je aftrekt."
            ),
            voorspelling = c(
              "Mogelijk heb je het intercept weggelaten, een coefficientteken omgedraaid, of de gemiddelden ingevuld.",
              "Voor X1=3 en X2=8 is Yhat = 17,6 - 2,2 maal 3 + 1 maal 8 = 19.",
              "Een voorspelling gebruikt intercept plus elk coefficient-predictorproduct met het oorspronkelijke teken.",
              "Schrijf drie termen op: 17,6; -2,2 maal 3; en 1 maal 8, en tel ze daarna op."
            ),
            R_kwadraat = c(
              "Mogelijk heb je 98 als percentage ingevoerd, R in plaats van R-kwadraat genomen, of de teller 78,4 niet door SSy gedeeld.",
              "De gevraagde decimale R-kwadraat is 78,4 / 80 = 0,98; 98% is dezelfde informatie op een andere schaal.",
              "Controleer of de vraag om R, R-kwadraat, een decimaal of een percentage vraagt.",
              "Bereken eerst 78,4 / 80 en noteer vier decimalen zonder procentomzetting."
            ),
            richting_b1 = c(
              "Mogelijk heb je de inhoudelijke woorden zwaarder laten wegen dan het teken van b1.",
              "Omdat b1 = -2,20, daalt de voorspelde criminaliteitsindex wanneer X1 stijgt en X2 gelijk blijft.",
              "De richting volgt uitsluitend uit het teken van de coefficient; voeg daarna ceteris paribus toe.",
              "Omcirkel het minteken van b1 en vertaal dat naar daling bij een eenheid stijging."
            ),
            sterkste_predictor = c(
              "Mogelijk heb je alleen het positieve teken van beta2 bekeken in plaats van de absolute gestandaardiseerde effecten.",
              "De absolute beta voor X1 is ongeveer 0,78 en voor X2 ongeveer 0,61; X1 is dus relatief sterker.",
              "Vergelijk voor relatieve sterkte absolute gestandaardiseerde beta's, niet tekens of meeteenheden.",
              "Schrijf |beta1| en |beta2| naast elkaar en kies de grootste."
            )
          )

          signature_reasoning <- function(q, value, fallback) {
            if (is.na(value)) return(fallback)
            near <- function(target, tolerance = 0.02) abs(value - target) <= tolerance

            if (q == "afhankelijke_variabele" && near(1)) return("Je kiest mogelijk politiedichtheid omdat die als eerste predictor wordt genoemd; zij staat echter als X1 aan de verklarende kant.")
            if (q == "afhankelijke_variabele" && near(2)) return("Je kiest mogelijk werkloosheid omdat die een inhoudelijk belangrijke predictor is; zij staat echter als X2 aan de verklarende kant.")
            if (q == "richting_b1" && near(1)) return("Je leest mogelijk 'meer politie' als automatisch positief en kijkt daardoor voorbij aan het minteken van b1.")
            if (q == "sterkste_predictor" && near(2)) return("Je kiest mogelijk X2 omdat beta2 positief is; relatieve sterkte vraagt de grootste absolute beta, ongeacht het teken.")

            if (q == "gemiddelde_x1" && near(15)) return("Je antwoord is de ruwe som 15; waarschijnlijk ontbreekt de deling door n = 5.")
            if (q == "gemiddelde_x2" && near(35)) return("Je antwoord is de ruwe som 35; waarschijnlijk ontbreekt de deling door n = 5.")
            if (q == "gemiddelde_y" && near(90)) return("Je antwoord is de ruwe som 90; waarschijnlijk ontbreekt de deling door n = 5.")
            if (q == "gemiddelde_x1" && near(3.75)) return("Je antwoord past bij delen door n-1; voor een gemiddelde moet je door n delen.")
            if (q == "gemiddelde_x2" && near(8.75)) return("Je antwoord past bij delen door n-1; voor een gemiddelde moet je door n delen.")
            if (q == "gemiddelde_y" && near(22.5)) return("Je antwoord past bij delen door n-1; voor een gemiddelde moet je door n delen.")

            if (q == "SSx1" && (near(2.5) || near(2))) return("Je antwoord lijkt een steekproef- of populatievariantie; waarschijnlijk heb je SS nog door n-1 of n gedeeld.")
            if (q == "SSx2" && (near(7.5) || near(6))) return("Je antwoord lijkt een steekproef- of populatievariantie; waarschijnlijk heb je SS nog door n-1 of n gedeeld.")
            if (q == "SSy" && (near(20) || near(16))) return("Je antwoord lijkt een steekproef- of populatievariantie; waarschijnlijk heb je SS nog door n-1 of n gedeeld.")
            if (q == "SSx1" && near(55)) return("Je antwoord is de som van de ruwe X1-kwadraten; waarschijnlijk heb je niet rond X1gemiddelde gecentreerd.")
            if (q == "SSx2" && near(275)) return("Je antwoord is de som van de ruwe X2-kwadraten; waarschijnlijk heb je niet rond X2gemiddelde gecentreerd.")
            if (q == "SSy" && near(1700)) return("Je antwoord is de som van de ruwe Y-kwadraten; waarschijnlijk heb je niet rond Ygemiddelde gecentreerd.")

            if (q == "SSx1x2" && near(105)) return("Je antwoord is de som van ruwe X1X2-producten; waarschijnlijk ontbreken de gecentreerde afwijkingen.")
            if (q == "SSx1y" && near(22)) return("De grootte klopt maar het teken niet; waarschijnlijk is een negatief kruisproduct als positief opgeteld.")
            if (q == "SSx1y" && (near(-5.5) || near(-4.4))) return("Je antwoord lijkt een covariantie; waarschijnlijk heb je de kruisproductsom door n-1 of n gedeeld.")
            if (q == "SSx1y" && near(248)) return("Je antwoord is de som van ruwe X1Y-producten; waarschijnlijk ontbreken de gecentreerde afwijkingen.")
            if (q == "SSx2y" && (near(7.5) || near(6))) return("Je antwoord lijkt een covariantie; waarschijnlijk heb je de kruisproductsom door n-1 of n gedeeld.")
            if (q == "SSx2y" && near(660)) return("Je antwoord is de som van ruwe X2Y-producten; waarschijnlijk ontbreken de gecentreerde afwijkingen.")

            if (q == "determinant_D" && near(sqrt(300), 0.05)) return("Je antwoord lijkt de vierkantswortel van D; gevraagd is de determinant zelf.")
            if (q == "b1" && near(2.2)) return("De grootte klopt maar het teken niet; waarschijnlijk is het negatieve SSx1y-teken verloren gegaan.")
            if (q == "b1" && near(-660)) return("Je antwoord is de teller van b1; waarschijnlijk ontbreekt de laatste deling door D = 300.")
            if (q == "b1" && near(1)) return("Je antwoord komt overeen met b2; waarschijnlijk zijn de twee regressiegewichten verwisseld.")
            if (q == "b2" && near(300)) return("Je antwoord is de teller van b2; waarschijnlijk ontbreekt de laatste deling door D = 300.")
            if (q == "b2" && near(-2.2)) return("Je antwoord komt overeen met b1; waarschijnlijk zijn de twee regressiegewichten verwisseld.")

            if (q == "intercept_a" && near(18)) return("Je antwoord is Ygemiddelde; waarschijnlijk zijn de twee coefficient-gemiddeldecorrecties weggelaten.")
            if (q == "intercept_a" && near(24.6)) return("Je antwoord past bij het verwerken van b1 maar niet van b2.")
            if (q == "intercept_a" && near(11)) return("Je antwoord past bij het verwerken van b2 maar niet van het negatieve b1-product.")
            if (q == "voorspelling" && near(1.4)) return("Je antwoord bevat alleen de twee predictorbijdragen; waarschijnlijk ontbreekt het intercept 17,6.")
            if (q == "voorspelling" && near(32.2)) return("Je antwoord past bij +2,2 maal 3; waarschijnlijk is het negatieve teken van b1 omgedraaid.")
            if (q == "voorspelling" && near(18)) return("Je antwoord is de voorspelling in het gemiddelde punt; waarschijnlijk heb je X2gemiddelde = 7 gebruikt in plaats van X2 = 8.")

            if (q == "R_kwadraat" && near(98, 0.1)) return("Je antwoord is het percentage 98; gevraagd is R-kwadraat als decimaal met vier decimalen.")
            if (q == "R_kwadraat" && near(sqrt(0.98), 0.002)) return("Je antwoord lijkt R = de wortel van R-kwadraat; gevraagd is R-kwadraat zelf.")
            if (q == "R_kwadraat" && near(78.4, 0.1)) return("Je antwoord is de teller; waarschijnlijk ontbreekt de deling door SSy = 80.")
            if (q == "R_kwadraat" && near(0.02, 0.002)) return("Je antwoord is de onverklaarde proportie 1 - R-kwadraat, niet R-kwadraat zelf.")

            fallback
          }

          lines  <- character(0)
          score  <- 0
          total  <- length(res)
          finite_choices <- list(
            afhankelijke_variabele = 1:3,
            richting_b1 = 1:2,
            sterkste_predictor = 1:2
          )
          invalid_finite_choice <- function(key, value) {
            if (!(key %in% names(finite_choices))) return(FALSE)
            num <- suppressWarnings(as.numeric(as.character(value)))
            length(num) != 1 || is.na(num) || !(num %in% finite_choices[[key]])
          }

          for (q in names(res)) {
            r   <- res[[q]]
            fb  <- feedbacks[[q]]
            diag <- diagnostics[[q]]
            lbl <- labels[[q]]
            if (isTRUE(r$ok)) {
              lines <- c(lines, paste0(
                "✅ **", lbl, "**: ", fb$right, "\n\n",
                "**Bevestiging:** de ingevoerde waarde of keuze is correct binnen de oorspronkelijke tolerantie.\n\n",
                "**Waarom dit klopt:** de ingevoerde waarde of keuze valt binnen de oorspronkelijke beoordelingsregel en past bij de uitgewerkte berekening.\n\n",
                "**Denkregel:** ", diag[[3]], "\n\n",
                "**Volgende stap:** ", diag[[4]], "\n\n",
                "**Transferstap:** pas dezelfde denkregel toe op een nieuwe dataset en controleer formule, schaal en interpretatie opnieuw."
              ))
              score <- score + 1
            } else if (identical(r$reason, "missing")) {
              lines <- c(lines, paste0(
                "❌ **", lbl, "**: variabele ", q, " ontbreekt in je script.\n\n",
                "**Denkregel:** elke deelvraag vereist een afzonderlijke variabele.\n\n",
                "**Volgende stap:** voeg ", q, " toe en vul daarna de gevraagde eindwaarde in."
              ))
            } else if (invalid_finite_choice(q, r$val)) {
              lines <- c(lines, paste0(
                "❌ **", lbl, "** (ongeldige keuze: ", as.character(r$val), ").\n\n",
                "**Mogelijke denkroute:** de invoer is niet eenduidig aan één van de aangeboden antwoordopties te koppelen.\n\n",
                "**Waarom dit niet klopt:** een waarde buiten de aangeboden opties kan niet als inhoudelijke keuze worden beoordeeld.\n\n",
                "**Denkregel:** ", diag[[3]], "\n\n",
                "**Volgende stap:** voer exact één geldig optienummer in en pas daarna deze regel toe: ", diag[[4]]
              ))
            } else {
              likely <- signature_reasoning(q, r$num, diag[[1]])
              lines <- c(lines, paste0(
                "❌ **", lbl, "** (jouw antwoord: ", as.character(r$val), ").\n\n",
                "**Waarschijnlijke redenering:** ", likely, "\n\n",
                "**Waarom dit niet klopt:** ", diag[[2]], " ", fb$wrong, "\n\n",
                "**Denkregel:** ", diag[[3]], "\n\n",
                "**Volgende stap:** ", diag[[4]]
              ))
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
