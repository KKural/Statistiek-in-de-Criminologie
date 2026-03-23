context({
  testcase(
    "Controlevragen - Partiële correlatie en multivariate statistiek",
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
            if (!is.na(v) && v == 1) return("**Optie 1 is onjuist.** De partiële correlatie is *niet* de correlatie tussen X en Z na uitschakelen van Y — dat zou de partiële correlatie r_XZ.Y zijn.\n\nDe (gevraagde) partiële correlatie r_XY.Z is de **correlatie tussen X en Y** nadat het effect van Z op *beide* is uitgeschakeld.")
            if (!is.na(v) && v == 3) return("**Optie 3 is onjuist.** Er is geen 'kwadraat van Z' in de definitie van de partiële correlatie.\n\nDe partiële correlatie r_XY.Z = correlatie X–Y na uitschakelen van het effect van Z op zowel X als Y.")
            if (!is.na(v) && v == 4) return("**Optie 4 is onjuist.** De partiële correlatie meet geen indirect *effect*; dat is het domein van padanalyse.\n\nDe definitie: r_XY.Z = correlatie X–Y nadat het effect van Z op beide variabelen is uitgeschakeld.")
            "**Correct (optie 2):** De partiële correlatie r_XY.Z is de correlatie tussen X en Y nadat het lineaire effect van Z op zowel X als Y is uitgeschakeld (via residuen)."
          }

          wrong_msg_v2 <- function(val) {
            v <- suppressWarnings(as.integer(val))
            if (!is.na(v) && v == 1) return("**Optie 1 (suppressoreffect) is onjuist.** Een suppressoreffect treedt op wanneer r_XY.Z *sterker* is dan r_XY of van teken wisselt.\n\nHier daalt r van 0.70 naar 0.02 (bijna nul) → het verband *verdwijnt* → geen suppressoreffect maar een **schijnverband**.")
            if (!is.na(v) && v == 2) return("**Optie 2 (indirect verband) is onjuist.** Bij een indirect verband verzwakt r deels maar blijft betekenisvol aanwezig.\n\nHier daalt r van 0.70 naar slechts **0.02** — het verband verdwijnt bijna volledig → dit is een **schijnverband** (Z verklaart het volledige verband).")
            if (!is.na(v) && v == 4) return("**Optie 4 (reëel verband) is onjuist.** Een reëel verband verandert nauwelijks na controle voor Z.\n\nHier daalt r van 0.70 naar 0.02 → het verband verdwijnt vrijwel → dit is een **schijnverband** veroorzaakt door Z.")
            "**Correct (optie 3):** r_XY=0.70 → r_XY.Z=0.02 betekent dat het verband praktisch verdwijnt na controle voor Z → **schijnverband**: Z lag aan de basis van zowel X als Y."
          }

          wrong_msg_v3 <- function(val) {
            v <- suppressWarnings(as.integer(val))
            if (!is.na(v) && v == 2) return("**Optie 2 is een correcte bewering.** De partiële correlatie houdt inderdaad rekening met confounders door hun effect op X en Y uit te schakelen.\n\nVraag 3 vraagt naar de **ONJUISTE** bewering → optie 1 is de onjuiste: suppressoreffecten *kunnen* de partiële correlatie groter maken dan r_XY.")
            if (!is.na(v) && v == 3) return("**Optie 3 is een correcte bewering.** Als r_XY.Z ≈ 0 terwijl r_XY groot was, is er inderdaad sprake van een schijnverband.\n\nVraag 3 vraagt naar de **ONJUISTE** bewering → optie 1 is onjuist: via suppressoreffect kan r_XY.Z wel degelijk groter zijn dan r_XY.")
            if (!is.na(v) && v == 4) return("**Optie 4 is een correcte bewering.** De partiële correlatie wordt inderdaad berekend via de residuen van regressie op Z.\n\nVraag 3 vraagt naar de **ONJUISTE** bewering → optie 1 ('pc kan *nooit* groter zijn dan r_XY') is onjuist: suppressoreffecten tonen van wel.")
            "**Correct (optie 1 = ONJUIST):** De bewering 'de partiële correlatie kan nooit groter zijn dan de bivariate correlatie' is **onjuist** — bij een suppressoreffect is r_XY.Z > |r_XY| of wisselt het van teken."
          }

          wrong_msg_v4 <- function(val) {
            v <- suppressWarnings(as.integer(val))
            if (!is.na(v) && v == 1) return("**Optie 1 (schijnverband) is onjuist.** Bij een schijnverband daalt r naar bijna nul.\n\nHier blijft r na controle voor leeftijd vergelijkbaar → het verband is **reëel** en wordt nauwelijks beïnvloed door leeftijd.")
            if (!is.na(v) && v == 2) return("**Optie 2 (indirect via leeftijd) is onjuist.** Bij een indirect verband daalt r significant.\n\nHier verandert r nauwelijks na controle → leeftijd medieert het verband niet → het verband is **direct/reëel**.")
            if (!is.na(v) && v == 4) return("**Optie 4 (suppressoreffect) is onjuist.** Een suppressoreffect versterkt of keert het teken van r om.\n\nHier blijft r vergelijkbaar na controle → geen suppressoreffect maar een **reëel verband** dat niet beïnvloed wordt door leeftijd.")
            "**Correct (optie 3):** Na controle voor leeftijd blijft het verband tussen buurtoverlast en angst vergelijkbaar → **reëel verband** dat nauwelijks wordt beïnvloed door de derde variabele leeftijd."
          }

          wrong_msg_v5 <- function(val) {
            v <- suppressWarnings(as.integer(val))
            if (!is.na(v) && v == 1) return("**Optie 1 is onjuist** — de teller gebruikt *aftrekking*, niet optelling.\n\nFormule: r_XY.Z = **(r_XY − r_XZ × r_YZ)** / √[(1 − r_XZ²)(1 − r_YZ²)]\n\nDe teller is r_XY **verminderd** met het product r_XZ × r_YZ.")
            if (!is.na(v) && v == 3) return("**Optie 3 is onjuist** — de variabelen staan verkeerd in de teller.\n\nDe teller is altijd **r_XY** (de te partialiseren correlatie) minus de correctieterm:\n\nr_XY − r_XZ × r_YZ\n\nNiet r_XZ als basisterm.")
            if (!is.na(v) && v == 4) return("**Optie 4 is onjuist** — r_YZ als basisterm klopt niet.\n\nDe teller bevat **r_XY** (het verband van interesse) minus het product van de correlaties van Z met X en Y:\n\n**r_XY − r_XZ × r_YZ**")
            "**Correct (optie 2):** Teller = r_XY − r_XZ × r_YZ\n\nDe bivariate correlatie X–Y wordt gecorrigeerd door het deel dat verklaard wordt door de overlap van Z met beide variabelen."
          }

          wrong_msg_v6 <- function(val) {
            v <- suppressWarnings(as.integer(val))
            if (!is.na(v) && v == 1) return("**Optie 1 is onjuist.** Wanneer r_XY.Z < r_XY betekent dit dat Z *deels* het verband verklaart — dat duidt op een indirect verband of schijnverband, niet op een suppressoreffect.\n\nEen suppressoreffect treedt op wanneer r_XY.Z **sterker** is dan r_XY of van **teken wisselt**.")
            if (!is.na(v) && v == 2) return("**Optie 2 is onjuist.** Als r_XZ ≈ 0 heeft Z nauwelijks verband met X en kan het geen suppressor zijn.\n\nEen suppressor correleert *wel* met X (of Y) maar maskeert eerder het ware verband. Z is een suppressor wanneer |r_XY.Z| > |r_XY| of wanneer het teken omkeert.")
            if (!is.na(v) && v == 4) return("**Optie 4 is onjuist.** Als r_XY.Z ≈ 0 terwijl r_XY groot was, is dat een **schijnverband** — niet een suppressoreffect.\n\nZ is een suppressor wanneer de partiële correlatie **sterker** is of van **teken wisselt** ten opzichte van r_XY.")
            "**Correct (optie 3):** Z is een suppressorvariabele wanneer r_XY.Z **sterker** is dan r_XY of een **tegenovergesteld teken** heeft — Z maskeerde het ware (sterkere of omgekeerde) verband tussen X en Y."
          }

          wrong_msg_v7 <- function(val) {
            v <- suppressWarnings(as.integer(val))
            if (!is.na(v) && v == 1) return("**Optie 1 is onjuist.** 'Meerdere correlaties tegelijkertijd berekenen' is geen kerngedachte van de partiële correlatie als inleiding tot multivariaat.\n\nHet centrale principe is **controleren voor derde variabelen** — de basis van elke multivariaat-techniek.")
            if (!is.na(v) && v == 3) return("**Optie 3 is onjuist.** Het vergelijken van groepen op meerdere afhankelijke variabelen is MANOVA, niet de partiële correlatie.\n\nPartiële correlatie introduceert het principe van **controleren voor derde variabelen**, wat de kern is van multivariate analyse.")
            if (!is.na(v) && v == 4) return("**Optie 4 is onjuist.** Het modelleren van causale verbanden is structurele vergelijkingsmodellering (SEM), niet de partiële correlatie.\n\nDe partiële correlatie introduceert **controleren voor derde variabelen** als fundamentele actie in de multivariate statistiek.")
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