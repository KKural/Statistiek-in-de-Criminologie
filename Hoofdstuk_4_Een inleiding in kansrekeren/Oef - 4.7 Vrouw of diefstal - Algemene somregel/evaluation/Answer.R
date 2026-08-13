context({
  testcase(
    "Algemene somregel met overlap",
    {
      testEqual(
        "",
        function(env) {
          parse_num <- function(value) {
            if (is.null(value) || length(value) != 1L) return(NA_real_)
            if (is.character(value)) {
              value <- trimws(value)
              value <- gsub(",", ".", value, fixed = TRUE)
              value <- gsub("%", "", value, fixed = TRUE)
            }
            suppressWarnings(as.numeric(value))
          }

          check_value <- function(name, expected) {
            if (!exists(name, envir = env, inherits = FALSE)) {
              return(list(exists = FALSE, raw = NA, num = NA_real_, correct = FALSE))
            }
            raw <- get(name, envir = env, inherits = FALSE)
            num <- parse_num(raw)
            list(
              exists = TRUE,
              raw = raw,
              num = num,
              correct = is.finite(num) && abs(num - expected) <= 0.00005
            )
          }

          results <- list(
            p_vrouw = check_value("p_vrouw", 0.1497),
            p_diefstal = check_value("p_diefstal", 0.5578),
            p_overlap = check_value("p_overlap", 0.0816),
            p_union = check_value("p_union", 0.6259)
          )

          assign("chapter4_7_results", results, envir = globalenv())
          all(vapply(results, function(item) isTRUE(item$correct), logical(1)))
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("chapter4_7_results", envir = globalenv())
          read_more <- "<a href='https://openstax.org/books/introductory-statistics-2e/pages/3-3-two-basic-rules-of-probability' target='_blank' rel='noopener noreferrer'>Lees meer over de algemene somregel</a>"

          near <- function(value, target, tolerance = 0.0002) {
            is.finite(value) && abs(value - target) <= tolerance
          }
          missing_message <- function(variable) {
            paste0(
              "**Controleer je invoer:** `", variable,
              "` ontbreekt of is geen enkel eindig getal. Vervang de `NA` door één decimale kans."
            )
          }

          feedback_marginal <- function(item, variable, numerator, label, common_wrong = NULL, wrong_text = NULL) {
            if (!item$exists || !is.finite(item$num)) return(missing_message(variable))
            if (!is.null(common_wrong) && near(item$num, common_wrong)) {
              return(paste0(
                "**Waarschijnlijke redenering:** deze waarde is consistent met ", wrong_text,
                ". Dezelfde waarde kan ook via een andere route ontstaan.\n\n",
                "**Waarom dit niet klopt:** voor `", variable, "` heb je het volledige ", label,
                "totaal nodig, gedeeld door 147."
              ))
            }
            if (near(item$num, numerator, 0.01)) {
              return(paste0(
                "**Waarschijnlijke redenering:** ", numerator,
                " is de juiste frequentie, maar nog geen kans.\n\n",
                "**Waarom dit niet klopt:** deel de frequentie door het algemene totaal 147."
              ))
            }
            paste0(
              "**Controlepunt:** gebruik voor `", variable, "` de totalenrand: `", numerator, "/147`.\n\n",
              "**Waarom dit niet klopt:** `", item$raw, "` komt niet overeen met die verhouding op vier decimalen."
            )
          }

          feedback_overlap <- function(item) {
            if (!item$exists || !is.finite(item$num)) return(missing_message("p_overlap"))
            if (near(item$num, 0.5455)) {
              return(paste0(
                "**Waarschijnlijke redenering:** deze waarde is consistent met `P(diefstal | vrouw)=12/22`.\n\n",
                "**Waarom dit niet klopt:** gevraagd is de gezamenlijke kans in de volledige groep, dus de cel 12 gedeeld door 147."
              ))
            }
            if (near(item$num, 0.1463)) {
              return(paste0(
                "**Waarschijnlijke redenering:** deze waarde past bij `P(vrouw | diefstal)=12/82`. Dit is een voorzichtige diagnose op basis van het getal.\n\n",
                "**Waarom dit niet klopt:** de overlap in de algemene somregel is de gezamenlijke kans `P(vrouw ∩ diefstal)=12/147`."
              ))
            }
            if (near(item$num, 12, 0.01)) {
              return(paste0(
                "**Waarschijnlijke redenering:** 12 is de juiste overlapfrequentie, maar nog geen kans.\n\n",
                "**Waarom dit niet klopt:** deel de doorsnedecel door alle 147 verdachten."
              ))
            }
            paste0(
              "**Controlepunt:** de overlap is de cel die tegelijk aan beide voorwaarden voldoet: `12/147`.\n\n",
              "**Waarom dit niet klopt:** een rij- of kolomtotaal is hier niet de teller."
            )
          }

          feedback_union <- function(item) {
            if (!item$exists || !is.finite(item$num)) return(missing_message("p_union"))
            if (near(item$num, 0.7075)) {
              return(paste0(
                "**Waarschijnlijke redenering:** deze waarde is consistent met `P(vrouw)+P(diefstal)` zonder de overlap af te trekken. Dezelfde waarde kan ook via een andere route ontstaan.\n\n",
                "**Waarom dit niet klopt:** de 12 vrouwelijke diefstalverdachten zijn dan tweemaal geteld; trek `P(vrouw ∩ diefstal)` eenmaal af."
              ))
            }
            if (near(item$num, 0.0816)) {
              return(paste0(
                "**Waarschijnlijke redenering:** deze waarde is alleen de doorsnede `P(vrouw ∩ diefstal)`.\n\n",
                "**Waarom dit niet klopt:** 'of' vraagt de unie: alle vrouwen, alle diefstalregistraties, met één correctie voor hun overlap."
              ))
            }
            if (near(item$num, 0.5443)) {
              return(paste0(
                "**Waarschijnlijke redenering:** deze waarde is consistent met het tweemaal aftrekken van de overlap. De diagnose blijft voorzichtig omdat afronding dezelfde waarde kan benaderen.\n\n",
                "**Waarom dit niet klopt:** na het optellen is de overlap tweemaal aanwezig en moet die precies eenmaal worden afgetrokken."
              ))
            }
            paste0(
              "**Controlepunt:** pas `P(V ∪ D)=P(V)+P(D)-P(V ∩ D)` toe.\n\n",
              "**Waarom dit niet klopt:** controleer of de overlap eenmaal, niet nulmaal of tweemaal, is afgetrokken."
            )
          }

          if (isTRUE(generated == expected)) {
            message <- paste0(
              "**Bevestiging:** correct: `P(vrouw)=0.1497`, `P(diefstal)=0.5578`, `P(overlap)=0.0816` en `P(vrouw ∪ diefstal)=0.6259`. De overlap is precies eenmaal afgetrokken.\n\n",
              "**Denkregel:** bij een unie tel je beide marginale kansen op en trek je hun doorsnede eenmaal af, omdat overlappende gevallen anders dubbel worden geteld.\n\n",
              "**Transferstap:** bereken met dezelfde tabel `P(man ∪ drugsmisdrijf)` en markeer vooraf welke cel de overlap vormt.\n\n",
              read_more
            )
          } else {
            parts <- character()
            if (!isTRUE(results$p_vrouw$correct)) {
              parts <- c(parts, paste0(
                "### `p_vrouw`\n\n",
                feedback_marginal(results$p_vrouw, "p_vrouw", 22, "vrouwen", 0.8503, "het complement `P(man)=125/147`")
              ))
            }
            if (!isTRUE(results$p_diefstal$correct)) {
              parts <- c(parts, paste0(
                "### `p_diefstal`\n\n",
                feedback_marginal(results$p_diefstal, "p_diefstal", 82, "diefstal", 0.4762, "de celkans voor mannelijke diefstalverdachten `70/147`")
              ))
            }
            if (!isTRUE(results$p_overlap$correct)) {
              parts <- c(parts, paste0("### `p_overlap`\n\n", feedback_overlap(results$p_overlap)))
            }
            if (!isTRUE(results$p_union$correct)) {
              parts <- c(parts, paste0("### `p_union`\n\n", feedback_union(results$p_union)))
            }
            message <- paste(
              c(
                parts,
                "**Denkregel:** `of` betekent unie. Als gebeurtenissen kunnen overlappen, gebruik je altijd `P(A)+P(B)-P(A ∩ B)`.",
                "**Volgende stap:** schrijf de drie tellers 22, 82 en 12 naast de gemeenschappelijke noemer 147; vul daarna de algemene somregel in en rond alleen de uitkomst af.",
                read_more
              ),
              collapse = "\n\n"
            )
          }

          get_reporter()$add_message(message, type = "markdown")
          generated == expected
        }
      )
    }
  )
})
