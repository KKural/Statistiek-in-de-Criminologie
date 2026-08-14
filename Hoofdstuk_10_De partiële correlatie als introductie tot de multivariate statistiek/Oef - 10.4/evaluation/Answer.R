context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          results <- list()

          # Scenario A: r_XY=0.62 -> r_XY.Z=0.07 -> spurious (type 1)
          exp_conclusie_A <- 1L

          # Scenario B: r_XY=0.38 -> r_XY.Z=0.21 -> indirect/partial (type 2)
          exp_conclusie_B <- 2L

          # Scenario C: r_XY=-0.12 -> r_XY.Z=-0.53 -> suppressor (type 3)
          exp_conclusie_C <- 3L

          parse_num <- function(val) {
            if (is.character(val)) {
              val <- trimws(val)
              val <- gsub(",", ".", val, fixed = TRUE)
              val <- gsub("%", "", val, fixed = TRUE)
            }
            suppressWarnings(as.numeric(val))
          }

          check_val <- function(varname, expected, tol = 0) {
            if (!exists(varname, envir = env)) {
              return(list(exists = FALSE, value = NA, correct = FALSE, expected = expected))
            }
            raw <- get(varname, envir = env)
            num <- parse_num(raw)
            ok  <- !is.na(num) && abs(num - expected) <= tol
            list(exists = TRUE, value = raw, value_num = num, correct = ok, expected = expected)
          }

          results$conclusie_A <- check_val("conclusie_A", exp_conclusie_A)
          results$conclusie_B <- check_val("conclusie_B", exp_conclusie_B)
          results$conclusie_C <- check_val("conclusie_C", exp_conclusie_C)

          assign("detailed_results", results, envir = globalenv())

          all(sapply(results, function(x) x$correct))
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("detailed_results", envir = globalenv())

          qnames <- c(
            conclusie_A = "Scenario A: Grootte school vs. pestgedrag (controle SES wijk)",
            conclusie_B = "Scenario B: Alcoholgebruik vs. agressief gedrag (controle stress)",
            conclusie_C = "Scenario C: Rehabilitatie vs. recidive (controle motivatie)"
          )

          parse_num <- function(val) {
            if (is.character(val)) { val <- trimws(val); val <- gsub(",", ".", val, fixed=TRUE) }
            suppressWarnings(as.numeric(val))
          }

          # ── wrong_msg helpers ──────────────────────────────────────────────────

          wrong_msg_A <- function(val) {
            v <- parse_num(val)
            if (!is.na(v) && v == 2) return("**Optie 2 (indirect verband) is onjuist.** Bij indirect verband daalt |r| deels maar blijft er een betekenisvol verband.\n\nHier daalt r van 0.62 naar **0.07** (bijna nul) → het verband verdwijnt bijna volledig → code **1** (schijnverband).")
            if (!is.na(v) && v == 3) return("**Optie 3 (suppressoreffect) is onjuist.** Een suppressoreffect vergroot |r|.\n\nHier krimpt r van 0.62 naar 0.07 → het verband verdwijnt bijna → code **1** (schijnverband).")
            if (!is.na(v) && v == 4) return("**Optie 4 (reëel verband) is onjuist.** Een reëel verband verandert nauwelijks na controle.\n\nHier daalt r van 0.62 naar 0.07 → bijna nul na controle → code **1** (schijnverband).")
            "**Correct (1 = schijnverband):** r_XY=0.62 daalt naar r_XY.Z=0.07 na controle voor SES.\n\nHet verband was volledig te wijten aan de gemeenschappelijke factor SES van de wijk."
          }

          wrong_msg_B <- function(val) {
            v <- parse_num(val)
            if (!is.na(v) && v == 1) return("**Optie 1 (schijnverband) is onjuist.** Bij een schijnverband daalt r naar ~0.\n\nHier daalt r van 0.38 naar 0.21 — het verband **verzwakt** maar blijft → code **2** (indirect verband).")
            if (!is.na(v) && v == 3) return("**Optie 3 (suppressoreffect) is onjuist.** Een suppressoreffect vergroot |r|.\n\nHier wordt r kleiner (0.38 → 0.21) → code **2** (indirect verband).")
            if (!is.na(v) && v == 4) return("**Optie 4 (reëel verband) is onjuist.** Een reëel verband verandert nauwelijks.\n\nHier daalt r van 0.38 naar 0.21 (significante daling) → stress medieert het verband deels → code **2** (indirect verband).")
            "**Correct (2 = indirect verband):** r_XY=0.38 daalt naar r_XY.Z=0.21 na controle voor stress.\n\nStress medieert het verband: deel van het alcoholgebruik-effect loopt via stress."
          }

          wrong_msg_C <- function(val) {
            v <- parse_num(val)
            if (!is.na(v) && v == 1) return("**Optie 1 (schijnverband) is onjuist.** Bij een schijnverband daalt |r| naar ~0.\n\nHier wordt |r| groter: van |−0.12|=0.12 naar |−0.53|=0.53 → het verband versterkt na controle → code **3** (suppressoreffect).")
            if (!is.na(v) && v == 2) return("**Optie 2 (indirect verband) is onjuist.** Bij indirect verband verzwakt |r|.\n\nHier gaat |r| van 0.12 naar 0.53 — het verband **versterkt** na controle → code **3** (suppressoreffect).")
            if (!is.na(v) && v == 4) return("**Optie 4 (reëel verband) is onjuist.** Een reëel verband verandert nauwelijks.\n\nHier gaat |r| van 0.12 naar 0.53 (enorm sterker) → code **3** (suppressoreffect).")
            "**Correct (3 = suppressoreffect):** r_XY=−0.12 wordt r_XY.Z=−0.53 na controle voor motivatie.\n\nMotivatieniveau maskeerde het ware sterkere (negatieve) verband tussen rehabilitatie en recidive."
          }

          # ── labels + functies ──────────────────────────────────────────────────

          qnames <- c(
            conclusie_A = "Scenario A: Grootte school vs. pestgedrag (controle SES wijk)",
            conclusie_B = "Scenario B: Alcoholgebruik vs. agressief gedrag (controle stress)",
            conclusie_C = "Scenario C: Rehabilitatie vs. recidive (controle motivatie)"
          )

          wrong_fns <- list(
            conclusie_A = wrong_msg_A,
            conclusie_B = wrong_msg_B,
            conclusie_C = wrong_msg_C
          )

          likely_routes <- list(
            conclusie_A = c(
              "correct",
              "Je ziet mogelijk dat de correlatie daalt en noemt elke daling indirect, hoewel 0,07 hier praktisch nul is.",
              "Je ziet mogelijk een derde variabele en denkt meteen aan suppressie, maar de absolute correlatie wordt juist kleiner.",
              "Je beschouwt mogelijk de resterende 0,07 als bewijs dat het verband robuust blijft."
            ),
            conclusie_B = c(
              "Je noemt mogelijk elke daling na controle een schijnverband, hoewel 0,21 als resterend verband overblijft.",
              "correct",
              "Je noemt mogelijk elke verandering suppressie, maar de absolute correlatie neemt hier af.",
              "Je focust mogelijk op het resterende verband en negeert dat de daling van 0,38 naar 0,21 inhoudelijk relevant is."
            ),
            conclusie_C = c(
              "Je kijkt mogelijk alleen naar het negatieve teken en mist dat de absolute correlatie sterk toeneemt.",
              "Je behandelt mogelijk elke invloed van de controlevariabele als een indirect verband, hoewel het verband hier sterker wordt.",
              "correct",
              "Je ziet mogelijk hetzelfde teken vóór en na controle en concludeert onveranderd, terwijl de grootte van 0,12 naar 0,53 stijgt."
            )
          )

          correct_msgs <- list(
            conclusie_A = "1 = schijnverband (r: 0.62 → 0.07, na controle voor SES bijna nul) ✓",
            conclusie_B = "2 = indirect verband (r: 0.38 → 0.21, verzwakt maar blijft) ✓",
            conclusie_C = "3 = suppressoreffect (r: −0.12 → −0.53, versterkt na controle) ✓"
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
              lines <- c(lines, paste0("✅ **", lbl, "**: correct (", as.character(r$value),
                ") — ", correct_msgs[[key]], "\n"))
              score <- score + 1
            } else {
              choice <- parse_num(r$value)
              likely <- if (!is.na(choice) && choice %in% 1:4) {
                likely_routes[[key]][[as.integer(choice)]]
              } else {
                "De invoer is niet eenduidig aan één aangeboden scenario-optie te koppelen."
              }
              lines <- c(lines, paste0("❌ **", lbl, "** — jouw antwoord: **", as.character(r$value),
                "**\n\n**Waarschijnlijke redenering:** ", likely,
                "\n\n**Waarom dit niet klopt:** ", wrong_fns[[key]](r$value), "\n"))
            }
          }

          lines <- c(lines, sprintf("---\n\n**Score: %d / %d**", score, total))
          invalid_finite_choice <- function(value) {
            num <- suppressWarnings(as.numeric(as.character(value)))
            length(num) != 1 || is.na(num) || !(num %in% 1:4)
          }
          contract_lines <- c("\n---\n\n## Denk- en herstelaanpak")
          for (key in names(qnames)) {
            r <- results[[key]]
            rule <- "Vergelijk bivariate en partiële correlatie op grootte én teken: bijna nul wijst op schijn, vergelijkbaar op robuustheid en sterker of omgekeerd op mogelijke suppressie."
            step <- paste0("Schrijf voor ", qnames[[key]], " de twee correlaties naast elkaar en benoem eerst het patroon voordat je een conclusie kiest.")
            if (!r$exists) {
              contract_lines <- c(contract_lines, paste0(
                "### ", qnames[[key]], "\n\n",
                "**Waarom nog geen diagnose mogelijk is:** er is geen keuze om aan een redenering te koppelen.\n\n",
                "**Denkregel:** ", rule, "\n\n**Volgende stap:** ", step
              ))
            } else if (r$correct) {
              contract_lines <- c(contract_lines, paste0(
                "### ", qnames[[key]], "\n\n",
                "✅ **Bevestiging:** correct.\n\n**Waarom dit klopt:** de gekozen classificatie past bij de verandering in grootte en teken na controle.\n\n",
                "**Denkregel:** ", rule, "\n\n**Transferstap:** ", step
              ))
            } else if (invalid_finite_choice(r$value)) {
              contract_lines <- c(contract_lines, paste0(
                "### ", qnames[[key]], "\n\n",
                "**Controleer je invoer:** de invoer is niet eenduidig aan één van de vier aangeboden antwoordopties te koppelen.\n\n",
                "**Waarom dit niet klopt:** een waarde buiten opties 1–4 kan niet als inhoudelijke classificatie worden beoordeeld.\n\n",
                "**Denkregel:** ", rule, "\n\n**Volgende stap:** voer exact één geldig optienummer in. ", step
              ))
            } else {
              contract_lines <- c(contract_lines, paste0(
                "### ", qnames[[key]], "\n\n",
                "**Waarschijnlijke redenering:** de gekozen optie past mogelijk bij het bekijken van slechts één correlatie; uit de keuze alleen is dat niet met zekerheid af te leiden.\n\n",
                "**Waarom dit niet klopt:** de bovenstaande optiecontrole laat zien welk patroon in grootte of teken is gemist.\n\n",
                "**Denkregel:** ", rule, "\n\n**Volgende stap:** ", step
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
