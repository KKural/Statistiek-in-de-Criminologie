context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          results <- list()

          exp_answers <- list(
            vraag1 = 2,  # correlatie X-Y na uitschakelen effect van Z op beide
            vraag2 = 3,  # hoogstwaarschijnlijk een schijnverband veroorzaakt door Z
            vraag3 = 1,  # ONJUIST: pc kan nooit groter zijn -- suppressoreffect toont van wel
            vraag4 = 3,  # reëel verband dat nauwelijks beïnvloed wordt door leeftijd
            vraag5 = 2,  # r_XY verminderd met het product van r_XZ en r_YZ
            vraag6 = 3,  # sterker of tegenovergesteld teken dan r_XY
            vraag7 = 2   # principe van controleren voor derde variabelen
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

          # ── wrong_msg helpers ─────────────────────────────────────────────────

          wrong_msg_v1 <- function(val) {
            v <- suppressWarnings(as.integer(val))
            if (!is.na(v) && v == 1) return("**Optie 1 is onjuist.** Alleen de variantie van Z constant houden beschrijft geen partiële correlatie. Bij r_XY.Z wordt het lineaire effect van Z uit **zowel X als Y** verwijderd.\n\nDe (gevraagde) partiële correlatie r_XY.Z is de correlatie tussen X en Y nadat voor Z is gecontroleerd.")
            if (!is.na(v) && v == 3) return("**Optie 3 is onjuist.** Dit beschrijft r_XZ.Y: de correlatie tussen X en Z, gecorrigeerd voor Y.\n\nDe gevraagde partiële correlatie r_XY.Z gaat over het verband tussen **X en Y** na controle voor Z.")
            if (!is.na(v) && v == 4) return("**Optie 4 is onjuist.** Een partiële correlatie is geen gemiddelde van de drie onderlinge correlaties.\n\nDe definitie: r_XY.Z = correlatie X–Y nadat het effect van Z op beide variabelen is uitgeschakeld.")
            "**Correct (optie 2):** De partiële correlatie r_XY.Z is de correlatie tussen X en Y nadat het lineaire effect van Z op zowel X als Y is uitgeschakeld (via residuen)."
          }

          wrong_msg_v2 <- function(val) {
            v <- suppressWarnings(as.integer(val))
            if (!is.na(v) && v == 1) return("**Optie 1 (suppressoreffect) is onjuist.** Een suppressoreffect treedt op wanneer r_XY.Z *sterker* is dan r_XY of van teken wisselt.\n\nHier daalt r van 0.70 naar 0.02 (bijna nul) → het verband *verdwijnt* → geen suppressoreffect maar een **schijnverband**.")
            if (!is.na(v) && v == 2) return("**Optie 2 is onjuist.** Het verband is niet sterk ongeacht Z: na controle voor Z daalt r van 0.70 naar **0.02**.\n\nDat betekent dat het oorspronkelijke verband vrijwel volledig door Z wordt verklaard → **schijnverband**.")
            if (!is.na(v) && v == 4) return("**Optie 4 is onjuist.** De gegevens tonen dat het verband na controle voor Z bijna verdwijnt. Dat past bij een **schijnverband** door Z.\n\nEen indirect verband via Z is een causale interpretatie die je hier niet louter uit deze twee correlaties kunt besluiten.")
            "**Correct (optie 3):** r_XY=0.70 → r_XY.Z=0.02 betekent dat het verband praktisch verdwijnt na controle voor Z → **schijnverband**: Z lag aan de basis van zowel X als Y."
          }

          wrong_msg_v3 <- function(val) {
            v <- suppressWarnings(as.integer(val))
            if (!is.na(v) && v == 2) return("**Optie 2 is een correcte bewering.** Voor een partiële correlatie met één controlevariabele volstaan r_XY, r_XZ en r_YZ.\n\nVraag 3 vraagt naar de **ONJUISTE** bewering → optie 1 is onjuist: suppressoreffecten kunnen de partiële correlatie groter maken dan de bivariate correlatie.")
            if (!is.na(v) && v == 3) return("**Optie 3 is een correcte bewering.** Een partiële correlatie kan inderdaad van teken veranderen wanneer de controlevariabele het oorspronkelijke verband maskeerde.\n\nVraag 3 vraagt naar de **ONJUISTE** bewering → optie 1 is onjuist.")
            if (!is.na(v) && v == 4) return("**Optie 4 is een correcte bewering.** Partiële correlatie introduceert het controleren voor derde variabelen en vormt zo een opstap naar multivariate analyse.\n\nVraag 3 vraagt naar de **ONJUISTE** bewering → optie 1 is onjuist.")
            "**Correct (optie 1 = ONJUIST):** De bewering 'de partiële correlatie kan nooit groter zijn dan de bivariate correlatie' is **onjuist** — bij een suppressoreffect is r_XY.Z > |r_XY| of wisselt het van teken."
          }

          wrong_msg_v4 <- function(val) {
            v <- suppressWarnings(as.integer(val))
            if (!is.na(v) && v == 1) return("**Optie 1 (schijnverband) is onjuist.** Bij een schijnverband daalt r naar bijna nul.\n\nHier blijft r na controle voor leeftijd vergelijkbaar → het verband is **reëel** en wordt nauwelijks beïnvloed door leeftijd.")
            if (!is.na(v) && v == 2) return("**Optie 2 (suppressorvariabele) is onjuist.** Bij suppressie wordt de partiële correlatie sterker of keert het teken om.\n\nHier verandert r nauwelijks na controle → geen suppressorvariabele, maar een **reëel verband** dat nauwelijks door leeftijd wordt beïnvloed.")
            if (!is.na(v) && v == 4) return("**Optie 4 is onjuist.** Uit deze informatie kun je geen statistische significantie besluiten; daarvoor heb je minstens N, een toetsstatistiek of een p-waarde nodig.\n\nDe meest passende inhoudelijke conclusie is dat het verband reëel blijft na controle voor leeftijd.")
            "**Correct (optie 3):** Na controle voor leeftijd blijft het verband tussen buurtoverlast en angst vergelijkbaar → **reëel verband** dat nauwelijks wordt beïnvloed door de derde variabele leeftijd."
          }

          wrong_msg_v5 <- function(val) {
            v <- suppressWarnings(as.integer(val))
            if (!is.na(v) && v == 1) return("**Optie 1 is onjuist.** De teller is niet het verschil tussen de partiële correlatie en de bivariate correlatie.\n\nDe teller is **r_XY − r_XZ × r_YZ**: de bivariate correlatie X–Y verminderd met de overlap die via Z loopt.")
            if (!is.na(v) && v == 3) return("**Optie 3 is onjuist.** De teller is geen som van de drie bivariate correlaties.\n\nDe teller is **r_XY − r_XZ × r_YZ**.")
            if (!is.na(v) && v == 4) return("**Optie 4 is onjuist.** Het product r_XZ × r_YZ is slechts de correctieterm; die wordt afgetrokken van r_XY.\n\nDe volledige teller is **r_XY − r_XZ × r_YZ**.")
            "**Correct (optie 2):** Teller = r_XY − r_XZ × r_YZ\n\nDe bivariate correlatie X–Y wordt gecorrigeerd door het deel dat verklaard wordt door de overlap van Z met beide variabelen."
          }

          wrong_msg_v6 <- function(val) {
            v <- suppressWarnings(as.integer(val))
            if (!is.na(v) && v == 1) return("**Optie 1 is onjuist.** Wanneer r_XY.Z < r_XY betekent dit dat Z *deels* het verband verklaart — dat duidt op een indirect verband of schijnverband, niet op een suppressoreffect.\n\nEen suppressoreffect treedt op wanneer r_XY.Z **sterker** is dan r_XY of van **teken wisselt**.")
            if (!is.na(v) && v == 2) return("**Optie 2 is onjuist.** Als r_XY.Z ongeveer nul wordt na controle voor Z, wijst dat op een schijnverband of een volledig verklaard verband, niet op suppressie.\n\nBij suppressie wordt het partiële verband juist sterker of verandert het van teken.")
            if (!is.na(v) && v == 4) return("**Optie 4 is onjuist.** Als r_XY.Z gelijk blijft aan r_XY, heeft Z nauwelijks invloed op het verband tussen X en Y.\n\nZ is een suppressor wanneer de partiële correlatie **sterker** is of van **teken wisselt** ten opzichte van r_XY.")
            "**Correct (optie 3):** Z is een suppressorvariabele wanneer r_XY.Z **sterker** is dan r_XY of een **tegenovergesteld teken** heeft — Z maskeerde het ware (sterkere of omgekeerde) verband tussen X en Y."
          }

          wrong_msg_v7 <- function(val) {
            v <- suppressWarnings(as.integer(val))
            if (!is.na(v) && v == 1) return("**Optie 1 is onjuist.** Partiële correlatie kan al met drie variabelen worden toegepast: X, Y en één controlevariabele Z.\n\nDe multivariate kern is **controleren voor derde variabelen**.")
            if (!is.na(v) && v == 3) return("**Optie 3 is onjuist.** Partiële correlatie is verwant aan regressiedenken, maar is niet hetzelfde als meervoudige regressie.\n\nDe overeenkomst is dat beide technieken het principe van controleren voor andere variabelen gebruiken.")
            if (!is.na(v) && v == 4) return("**Optie 4 is onjuist.** Partiële correlatie wordt gebruikt bij metrische variabelen, niet enkel bij nominale variabelen.\n\nZe introduceert **controleren voor derde variabelen** als fundamentele actie in de multivariate statistiek.")
            "**Correct (optie 2):** De partiële correlatie introduceert het principe van **controleren voor derde variabelen** — de kern van alle multivariate technieken: is een verband direct, indirect, schijn, of verstopt door een suppressor?"
          }

          # ── labels + functies ──────────────────────────────────────────────────

          qnames <- c(
            vraag1 = "Vraag 1: Definitie van partiële correlatie",
            vraag2 = "Vraag 2: r_XY=0.70 maar r_XY.Z=0.02 — wat betekent dit?",
            vraag3 = "Vraag 3: Welke bewering is ONJUIST?",
            vraag4 = "Vraag 4: Buurtoverlast–angst na controle voor leeftijd",
            vraag5 = "Vraag 5: Wat staat in de teller van de formule?",
            vraag6 = "Vraag 6: Wanneer is Z een suppressorvariabele?",
            vraag7 = "Vraag 7: Partiële correlatie als introductie tot multivariate statistiek"
          )

          wrong_fns <- list(
            vraag1 = wrong_msg_v1,
            vraag2 = wrong_msg_v2,
            vraag3 = wrong_msg_v3,
            vraag4 = wrong_msg_v4,
            vraag5 = wrong_msg_v5,
            vraag6 = wrong_msg_v6,
            vraag7 = wrong_msg_v7
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
              lines <- c(lines, paste0("✅ **", lbl, "**: correct (antwoord ",
                as.integer(r$expected), ")\n\n", wrong_fns[[key]](r$value), "\n"))
              score <- score + 1
            } else {
              lines <- c(lines, paste0("❌ **", lbl, "** — jouw antwoord: **", as.character(r$value),
                "**\n\n", wrong_fns[[key]](r$value), "\n"))
            }
          }

          lines <- c(lines, sprintf("---\n\n**Score: %d / %d**", score, total))
          get_reporter()$add_message(paste(lines, collapse = "\n"), type = "markdown")
          generated == expected
        }
      )
    }
  )
})
