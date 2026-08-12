context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          results <- list()

          exp_answers <- list(
            vraag1 = 2,  # gemiddelde verschilt tussen 2+ groepen
            vraag2 = 4,  # F-waarde
            vraag3 = 2,  # F > 1
            vraag4 = 3,  # p-waarde kleiner
            vraag5 = 1,  # model verklaart meer dan nulmodel
            vraag6 = 3,  # model verklaart significant meer
            vraag7 = 2   # t-toets voor individuele coefficienten
          )

          parse_num <- function(val) {
            if (is.character(val)) {
              val <- trimws(val)
              if (grepl("^[A-Da-d]$", val)) {
                return(match(toupper(val), c("A", "B", "C", "D")))
              }
              val <- gsub(",", ".", val, fixed = TRUE)
            }
            suppressWarnings(as.numeric(val))
          }

          check_mc <- function(varname, expected) {
            if (!exists(varname, envir = env)) {
              return(list(exists = FALSE, value = NA, correct = FALSE, expected = expected))
            }
            raw <- get(varname, envir = env)
            num <- parse_num(raw)
            ok  <- !is.na(num) && abs(num - expected) < 0.5
            list(exists = TRUE, value = raw, value_num = num, correct = ok, expected = expected)
          }

          for (q in names(exp_answers)) {
            results[[q]] <- check_mc(q, exp_answers[[q]])
          }

          assign("detailed_results", results, envir = globalenv())
          all(sapply(results, function(x) x$correct))
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("detailed_results", envir = globalenv())

          parse_num <- function(val) {
            if (is.character(val)) { val <- trimws(val); val <- gsub(",", ".", val, fixed=TRUE)
              if (grepl("^[A-Da-d]$", val)) return(match(toupper(val), c("A","B","C","D"))) }
            suppressWarnings(as.numeric(val))
          }

          # ── wrong_msg helpers ──────────────────────────────────────────────────

          wrong_msg_vraag1 <- function(val) {
            v <- parse_num(val)
            if (!is.na(v) && v == 1)
              return("**Optie 1 is onjuist.** Een significant verband tussen twee nominale variabelen toets je typisch met een chi-kwadraattoets, niet met ANOVA.\n\n**Correct (2):** ANOVA test of het gemiddelde van een metrische variabele verschilt tussen twee of meer groepen.")
            if (!is.na(v) && v == 3)
              return("**Optie 3 is onjuist.** Of een correlatiecoëfficiënt significant verschilt van nul toets je met een correlatietoets, niet met ANOVA.\n\n**Correct (2):** ANOVA test groepsverschillen in gemiddelden.")
            if (!is.na(v) && v == 4)
              return("**Optie 4 is onjuist.** Normaliteit is een assumptie die je kunt controleren, maar het is niet de hypothese die ANOVA zelf test.\n\n**Correct (2):** ANOVA test of minstens één groepsgemiddelde verschilt.")
            "**Correct antwoord: 2** — H₀: alle groepsgemiddelden zijn gelijk (μ₁=μ₂=...=μₖ); Hₐ: minstens één gemiddelde verschilt."
          }

          wrong_msg_vraag2 <- function(val) {
            v <- parse_num(val)
            if (!is.na(v) && v == 1)
              return("**Optie 1 is onjuist.** De t-waarde hoort bij de t-toets (twee groepen / individuele coëfficiënten bij regressie), niet bij ANOVA.\n\n**Correct (4):** De **F-waarde** is de toetsingsgrootheid bij ANOVA.")
            if (!is.na(v) && v == 2)
              return("**Optie 2 is onjuist.** De z-waarde hoort bij de z-toets (grote steekproef, bekende σ).\n\n**Correct (4):** De **F-waarde** = MS_between / MS_within bij ANOVA.")
            if (!is.na(v) && v == 3)
              return("**Optie 3 is onjuist.** De chi-kwadraatwaarde hoort bij nominale variabelen en toetsen van onafhankelijkheid.\n\n**Correct (4):** Bij ANOVA gebruik je de **F-statistiek**.")
            "**Correct antwoord: 4** — De F-waarde (F = MS_between / MS_within) is de toetsingsgrootheid bij ANOVA."
          }

          wrong_msg_vraag3 <- function(val) {
            v <- parse_num(val)
            if (!is.na(v) && v == 1)
              return("**Optie 1 is onjuist.** Als de tussengroepsvariantie groter is dan de binnengroepsvariantie, wordt F juist groter dan 1, niet kleiner dan 1.\n\n**Correct (2):** F > 1 betekent dat de tussengroepsvariantie **groter** is dan de binnengroepsvariantie.")
            if (!is.na(v) && v == 3)
              return("**Optie 3 is onjuist.** F blijft niet gelijk aan 1 wanneer de tussengroepsvariantie groter wordt dan de binnengroepsvariantie.\n\n**Correct (2):** F > 1 → tussengroepsvariantie > binnengroepsvariantie.")
            if (!is.na(v) && v == 4)
              return("**Optie 4 is onjuist.** Een F-waarde kan niet negatief zijn, omdat ze een verhouding van varianties is.\n\n**Correct (2):** F > 1 wanneer de tussengroepsvariantie groter is dan de binnengroepsvariantie.")
            "**Correct antwoord: 2** — F > 1 betekent dat de tussengroepsvariantie (MS_between) groter is dan de binnengroepsvariantie (MS_within), wat wijst op een groepseffect."
          }

          wrong_msg_vraag4 <- function(val) {
            v <- parse_num(val)
            if (!is.na(v) && v == 1)
              return("**Optie 1 is onjuist.** Naarmate F groter is, wordt de p-waarde **kleiner** (niet groter) — een grote F-waarde levert sterk bewijs tegen H₀.\n\n**Correct (3):** Grotere F → kleinere p.")
            if (!is.na(v) && v == 2)
              return("**Optie 2 is onjuist.** De p-waarde blijft niet gelijk als F verandert — p is een functie van F.\n\n**Correct (3):** Grotere F → kleinere p-waarde.")
            if (!is.na(v) && v == 4)
              return("**Optie 4 is onjuist.** De p-waarde fluctueert niet willekeurig; bij gegeven vrijheidsgraden is p een functie van F.\n\n**Correct (3):** Grotere F → kleinere p.")
            "**Correct antwoord: 3** — Hoe groter de F-waarde, hoe kleiner de p-waarde. Een grote F levert sterk bewijs tegen H₀."
          }

          wrong_msg_vraag5 <- function(val) {
            v <- parse_num(val)
            if (!is.na(v) && v == 2)
              return("**Optie 2 is onjuist.** De F-toets test het *gehele* regressiemodel, niet individuele coëfficiënten. Voor individuele coëfficiënten gebruik je de t-toets.\n\n**Correct (1):** F-toets = test of model als geheel significant is ten opzichte van het nulmodel.")
            if (!is.na(v) && v == 3)
              return("**Optie 3 is onjuist.** De normaliteit van residuen is een regressieassumptie, maar de F-toets test die assumptie niet.\n\n**Correct (1):** De F-toets vergelijkt het regressiemodel als geheel met het nulmodel.")
            if (!is.na(v) && v == 4)
              return("**Optie 4 is onjuist.** Multicollineariteit controleer je met diagnostieken zoals VIF, niet met de globale F-toets.\n\n**Correct (1):** De F-toets test of R² significant groter is dan 0.")
            "**Correct antwoord: 1** — De F-toets bij regressie test of het model als geheel significant meer variantie verklaart dan het nulmodel (enkel het intercept)."
          }

          wrong_msg_vraag6 <- function(val) {
            v <- parse_num(val)
            if (!is.na(v) && v == 1)
              return("**Optie 1 is onjuist.** Een significante F-toets betekent dat het regressiemodel als geheel variantie verklaart; ze zegt niet rechtstreeks dat er een sterke bivariate correlatie tussen X en Y is.\n\n**Correct (3):** Het model verklaart significant meer variantie dan verwacht op basis van toeval.")
            if (!is.na(v) && v == 2)
              return("**Optie 2 is onjuist.** p<0.05 bij de F-toets betekent niet dat de regressielijn perfect bij de data past; ook bij significante modellen blijven residuen over.\n\n**Correct (3):** p<0.05 bij F-toets → het complete model is significant.")
            if (!is.na(v) && v == 4)
              return("**Optie 4 is onjuist.** De significantie van het intercept toets je met een afzonderlijke t-toets op het intercept, niet met de globale F-toets.\n\n**Correct (3):** p<0.05 bij F-toets = het regressiemodel verklaart significant meer dan het nulmodel.")
            "**Correct antwoord: 3** — p<0.05 bij de F-toets betekent dat het regressiemodel als geheel significant meer variantie verklaart dan het nulmodel."
          }

          wrong_msg_vraag7 <- function(val) {
            v <- parse_num(val)
            if (!is.na(v) && v == 1)
              return("**Optie 1 is onjuist.** De chi-kwadraattoets gebruik je voor onafhankelijkheid tussen nominale variabelen, niet voor individuele regressiecoëfficiënten.\n\n**Correct (2):** De t-toets test of een individuele regressiecoëfficiënt significant van 0 verschilt.")
            if (!is.na(v) && v == 3)
              return("**Optie 3 is onjuist.** De Mann-Whitney U-toets vergelijkt twee onafhankelijke groepen op een ordinale of niet-normale metrische uitkomst; ze test geen regressiecoëfficiënten.\n\n**Correct (2):** t-toets voor B₁, B₂, ... elk afzonderlijk.")
            if (!is.na(v) && v == 4)
              return("**Optie 4 is onjuist.** De Levene-toets controleert homogeniteit van varianties, niet de significantie van regressiecoëfficiënten.\n\n**Correct (2):** t-toets voor individuele regressiecoëfficiënten.")
            "**Correct antwoord: 2** — De t-toets wordt gebruikt om individuele regressiecoëfficiënten te toetsen (H₀: Bⱼ = 0)."
          }

          # ── labels + functies ──────────────────────────────────────────────────

          qnames <- c(
            vraag1 = "Vraag 1: Hypothesen bij ANOVA",
            vraag2 = "Vraag 2: Toetsingsgrootheid ANOVA",
            vraag3 = "Vraag 3: F-waarde en tussengroepsvariantie",
            vraag4 = "Vraag 4: p-waarde naarmate F groter is",
            vraag5 = "Vraag 5: Doel F-toets bij regressie",
            vraag6 = "Vraag 6: Betekenis p<0.05 bij F-toets regressie",
            vraag7 = "Vraag 7: Andere toets bij regressie"
          )

          wrong_fns <- list(
            vraag1 = wrong_msg_vraag1,
            vraag2 = wrong_msg_vraag2,
            vraag3 = wrong_msg_vraag3,
            vraag4 = wrong_msg_vraag4,
            vraag5 = wrong_msg_vraag5,
            vraag6 = wrong_msg_vraag6,
            vraag7 = wrong_msg_vraag7
          )

          correct_msgs <- list(
            vraag1 = "H₀: alle groepsgemiddelden gelijk; Hₐ: minstens één verschilt ✓",
            vraag2 = "F-waarde (= MS_between / MS_within) ✓",
            vraag3 = "F > 1 → tussengroepsvariantie > binnengroepsvariantie ✓",
            vraag4 = "Grotere F → kleinere p ✓",
            vraag5 = "F-toets test of het model significant meer verklaart dan het nulmodel ✓",
            vraag6 = "Model verklaart significant meer variantie dan nulmodel ✓",
            vraag7 = "t-toets voor individuele regressiecoëfficiënten ✓"
          )

          likely_routes <- list(
            vraag1 = c(
              "Je koppelt ANOVA mogelijk aan elke toets van samenhang en kiest daarom nominale associatie.",
              "correct",
              "Je verwart mogelijk de ANOVA-toets van groepsgemiddelden met een toets van Pearson-correlatie.",
              "Je behandelt mogelijk normaliteit als de onderzoekshypothese in plaats van als een assumptie."
            ),
            vraag2 = c(
              "Je kiest mogelijk t omdat ANOVA gemiddelden vergelijkt, maar t is niet de globale toetsingsgrootheid voor meerdere groepen.",
              "Je kiest mogelijk z vanuit algemene hypothesetoetsing zonder de ANOVA-tabel te gebruiken.",
              "Je koppelt mogelijk elke categorische groepsindeling aan chi-kwadraat, hoewel de uitkomst metrisch is.",
              "correct"
            ),
            vraag3 = c(
              "Je leest de verhouding mogelijk omgekeerd als MS binnen gedeeld door MS tussen.",
              "correct",
              "Je denkt mogelijk dat F altijd rond 1 blijft, ongeacht het verschil tussen teller en noemer.",
              "Je behandelt F mogelijk als een getekend verschil; als verhouding van varianties kan F niet negatief zijn."
            ),
            vraag4 = c(
              "Je redeneert mogelijk dat een grotere toetsingsgrootheid een grotere kanswaarde geeft, terwijl de rechterstaart juist kleiner wordt.",
              "Je beschouwt p mogelijk als onafhankelijk van F bij vaste vrijheidsgraden.",
              "correct",
              "Je ziet p mogelijk als een willekeurige schommeling in plaats van als de staartkans die bij F hoort."
            ),
            vraag5 = c(
              "correct",
              "Je verwart mogelijk de globale F-toets met de t-toets voor één regressiecoëfficiënt.",
              "Je verwart mogelijk modelinferentie met de diagnostiek van residunormaliteit.",
              "Je verwart mogelijk de globale modeltoets met een multicollineariteitsdiagnose zoals VIF."
            ),
            vraag6 = c(
              "Je stelt statistische significantie mogelijk gelijk aan een sterk verband; de F-toets beoordeelt bewijs voor het model als geheel.",
              "Je stelt significant mogelijk gelijk aan perfecte voorspelling en vergeet dat residuen kunnen blijven bestaan.",
              "correct",
              "Je verwart mogelijk de globale F-toets met de afzonderlijke t-toets van het intercept."
            ),
            vraag7 = c(
              "Je kiest mogelijk chi-kwadraat vanuit algemene toetsingskennis, maar regressiecoëfficiënten zijn geen kruistabelfrequenties.",
              "correct",
              "Je kiest mogelijk een niet-parametrische groepsvergelijking in plaats van een coefficienttoets.",
              "Je verwart mogelijk een assumptietoets voor varianties met de t-toets van individuele regressiecoëfficiënten."
            )
          )

          # ── feedback opbouwen ─────────────────────────────────────────────────

          lines <- character(0)
          score <- 0
          total <- length(qnames)

          for (key in names(qnames)) {
            r   <- results[[key]]
            lbl <- qnames[[key]]
            if (!r$exists) {
              lines <- c(lines, paste0("❌ **", lbl, "** — variabele `", key, "` niet ingevuld.\n\n",
                wrong_fns[[key]]("?"), "\n"))
            } else if (r$correct) {
              lines <- c(lines, paste0("✅ **", lbl, "** (antwoord ", as.integer(r$expected),
                "): correct — ", correct_msgs[[key]], "\n"))
              score <- score + 1
            } else {
              choice <- parse_num(r$value)
              likely <- if (!is.na(choice) && choice %in% 1:4) {
                likely_routes[[key]][[as.integer(choice)]]
              } else {
                "De invoer is niet eenduidig aan één aangeboden optie te koppelen."
              }
              lines <- c(lines, paste0("❌ **", lbl, "** — jouw antwoord: **", as.character(r$value),
                "**\n\n**Waarschijnlijke redenering:** ", likely,
                "\n\n**Waarom dit niet klopt:** ", wrong_fns[[key]](r$value), "\n"))
            }
          }

          lines <- c(lines, sprintf("---\n\n**Score: %d / %d**", score, total))
          contract_rule <- function(key) {
            k <- tolower(key)
            if (grepl("gemiddelde|_bar", k)) return("Gemiddelde = som / n; gebruik n-1 alleen bij een steekproefvariantie.")
            if (grepl("^ss|scp", k)) return("Centreer eerst, vorm kwadraten of kruisproducten en sommeer; een SS/SCP wordt niet gedeeld.")
            if (grepl("variantie|^var", k)) return("Steekproefvariantie = SS / (n-1); houd SS, variantie en standaardafwijking uit elkaar.")
            if (grepl("standaardfout", k)) return("Standaardfout = standaardafwijking / wortel(n); gebruik de juiste onzekerheidsmaat.")
            if (grepl("^sd|sigma", k)) return("Een standaardafwijking is de positieve wortel van de variantie en behoudt de oorspronkelijke eenheid.")
            if (grepl("cov|scp", k)) return("Covariantie gebruikt de getekende gecentreerde kruisproducten en de afgesproken deler.")
            if (grepl("teller", k)) return("Werk de volledige teller met tekens en haakjes uit voordat je door de noemer deelt.")
            if (grepl("noemer", k)) return("Bereken beide factoren onder de wortel afzonderlijk; de noemer moet positief zijn.")
            if (grepl("r_|pearson|partial", k)) return("Een correlatie is schaalvrij en ligt tussen -1 en 1; koppel elke correlatie aan de juiste variabelen en controles.")
            if (grepl("^bi_|interval|breder", k)) return("Een betrouwbaarheidsinterval is schatting plus/minus kritieke waarde maal standaardfout; meer betrouwbaarheid geeft een breder interval.")
            if (grepl("^df", k)) return("Vrijheidsgraden volgen uit het aantal onafhankelijke informatiedelen of geschatte parameters; tel die eerst expliciet.")
            if (grepl("^ms", k)) return("Mean square = bijbehorende sum of squares / bijbehorende vrijheidsgraden.")
            if (grepl("f_ratio|^f_", k)) return("F = MS tussen / MS binnen; houd teller en noemer op hun juiste ANOVA-rij.")
            if (grepl("eta|r_kwadraat", k)) return("Een verklaarde proportie vergelijkt verklaarde met totale variatie en ligt tussen 0 en 1, of 0% en 100%.")
            if (grepl("chi", k)) return("Sommeer voor elke cel (O-E)^2/E met de verwachte, niet de geobserveerde, frequentie als deler.")
            if (grepl("^e_", k)) return("Verwachte frequentie = rijtotaal maal kolomtotaal / N.")
            if (grepl("kritieke", k)) return("Lees de kritieke waarde af met zowel het juiste alfa als de juiste vrijheidsgraden.")
            if (grepl("significant|conclusie|richting|vraag|h0", k)) return("Pas eerst de expliciete beslisregel toe en formuleer daarna alleen de conclusie die door die vergelijking wordt gedragen.")
            if (grepl("n_minimum|n_voor|quotient", k)) return("Bereken de steekproefgrootte met ongeafronde tussenwaarden en rond het eindresultaat altijd naar boven af.")
            "Benoem de doelgrootheid, schrijf de bijbehorende formule en eenheid op en rond pas het eindresultaat af."
          }

          contract_step <- function(key, label) {
            k <- tolower(key)
            if (grepl("significant|conclusie|richting|vraag|h0|breder", k)) {
              return(paste0("Lees ", label, " opnieuw, noteer de relevante vergelijking in één regel en kies pas daarna de conclusie."))
            }
            paste0("Herbereken alleen ", label, ": schrijf de formule, vul de ongeafronde inputs met tekens in en controleer daarna bereik, eenheid en afronding.")
          }

          finite_choices <- setNames(rep(list(1:4), length(qnames)), names(qnames))
          invalid_finite_choice <- function(key, value) {
            if (!(key %in% names(finite_choices))) return(FALSE)
            num <- suppressWarnings(as.numeric(as.character(value)))
            length(num) != 1 || is.na(num) || !(num %in% finite_choices[[key]])
          }

          contract_lines <- c("\n---\n\n## Denk- en herstelaanpak")
          for (key in names(qnames)) {
            r <- results[[key]]
            rule <- contract_rule(key)
            step <- contract_step(key, qnames[[key]])
            if (!r$exists) {
              contract_lines <- c(contract_lines, paste0(
                "### ", qnames[[key]], "\n\n",
                "**Waarom nog geen diagnose mogelijk is:** er is geen antwoordwaarde om aan een denkroute te koppelen.\n\n",
                "**Denkregel:** ", rule, "\n\n",
                "**Volgende stap:** vul de ontbrekende variabele in. ", step
              ))
            } else if (r$correct) {
              contract_lines <- c(contract_lines, paste0(
                "### ", qnames[[key]], "\n\n",
                "✅ **Bevestiging:** correct.\n\n**Waarom dit klopt:** het antwoord voldoet aan de hierboven bevestigde berekening of beslissing.\n\n",
                "**Denkregel:** ", rule, "\n\n",
                "**Transferstap:** ", step
              ))
            } else if (invalid_finite_choice(key, r$value)) {
              contract_lines <- c(contract_lines, paste0(
                "### ", qnames[[key]], "\n\n",
                "**Mogelijke denkroute:** de invoer is niet eenduidig aan één van de aangeboden antwoordopties te koppelen.\n\n",
                "**Waarom dit niet klopt:** een waarde buiten de aangeboden opties kan niet als inhoudelijke keuze worden beoordeeld.\n\n",
                "**Denkregel:** ", rule, "\n\n",
                "**Volgende stap:** voer exact één geldig optienummer in. ", step
              ))
            } else {
              contract_lines <- c(contract_lines, paste0(
                "### ", qnames[[key]], "\n\n",
                "**Waarschijnlijke redenering:** uit één eindantwoord is de precieze denkstap niet zeker. De waarde of optie past mogelijk bij de hierboven uitgewerkte verwisseling, tussenstap, deler, schaal of afronding.\n\n",
                "**Waarom dit niet klopt:** de bovenstaande componentcontrole toont waar het antwoord van de vereiste definitie, formule of beslisregel afwijkt.\n\n",
                "**Denkregel:** ", rule, "\n\n",
                "**Volgende stap:** ", step
              ))
            }
          }
          lines <- c(lines, contract_lines)

          get_reporter()$add_message(paste(lines, collapse = "\n"), type = "markdown")
          generated == expected
        }
      )
    }
  )
})
