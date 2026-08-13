context({
  testcase(
    "Productregel in de verdachtentabel",
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
            p_man = check_value("p_man", 0.8503),
            p_drug_given_man = check_value("p_drug_given_man", 0.1200),
            p_joint = check_value("p_joint", 0.1020)
          )

          assign("chapter4_6_results", results, envir = globalenv())
          all(vapply(results, function(item) isTRUE(item$correct), logical(1)))
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("chapter4_6_results", envir = globalenv())
          read_more <- "<a href='https://openstax.org/books/introductory-statistics-2e/pages/3-4-contingency-tables' target='_blank' rel='noopener noreferrer'>Lees meer over kansen uit kruistabellen</a>"

          near <- function(value, target, tolerance = 0.0002) {
            is.finite(value) && abs(value - target) <= tolerance
          }
          missing_message <- function(variable) {
            paste0(
              "**Controleer je invoer:** `", variable,
              "` ontbreekt of is geen enkel eindig getal. Vervang de `NA` door één decimale kans."
            )
          }

          feedback_p_man <- function(item) {
            if (!item$exists || !is.finite(item$num)) return(missing_message("p_man"))
            if (near(item$num, 0.1497)) {
              return(paste0(
                "**Waarschijnlijke redenering:** deze waarde is consistent met `P(vrouw)=22/147`, het complement van de gevraagde kans. Dezelfde waarde kan ook via een andere route ontstaan.\n\n",
                "**Waarom dit niet klopt:** voor `P(man)` hoort het mannentotaal 125 in de teller."
              ))
            }
            if (near(item$num, 125, 0.01)) {
              return(paste0(
                "**Waarschijnlijke redenering:** 125 is het juiste aantal mannelijke verdachten, maar nog geen kans.\n\n",
                "**Waarom dit niet klopt:** deel dit aantal door alle 147 verdachten."
              ))
            }
            paste0(
              "**Controlepunt:** gebruik voor de marginale kans de totalenrand `125/147`.\n\n",
              "**Waarom dit niet klopt:** `", item$raw, "` komt niet overeen met die verhouding op vier decimalen."
            )
          }

          feedback_conditional <- function(item) {
            if (!item$exists || !is.finite(item$num)) return(missing_message("p_drug_given_man"))
            if (near(item$num, 0.1224)) {
              return(paste0(
                "**Waarschijnlijke redenering:** deze waarde is consistent met de marginale kans op een drugsmisdrijf, `18/147`; de voorwaarde 'gegeven man' is dan niet toegepast.\n\n",
                "**Waarom dit niet klopt:** binnen de gegeven groep zijn er 125 mannen, van wie 15 in de drugscel staan."
              ))
            }
            if (near(item$num, 0.8333)) {
              return(paste0(
                "**Waarschijnlijke redenering:** deze waarde past bij de omgekeerde kans `P(man | drugsmisdrijf)=15/18`. Dit blijft een voorzichtige diagnose op basis van het getal.\n\n",
                "**Waarom dit niet klopt:** in `P(drugsmisdrijf | man)` bepaalt 'man' de noemer, dus 125."
              ))
            }
            if (near(item$num, 0.1020)) {
              return(paste0(
                "**Waarschijnlijke redenering:** deze waarde is de gezamenlijke kans `15/147`.\n\n",
                "**Waarom dit niet klopt:** de gevraagde voorwaardelijke kans gebruikt alleen de 125 mannen als referentiegroep."
              ))
            }
            paste0(
              "**Controlepunt:** lees de verticale streep als 'binnen de groep mannen': `15/125`.\n\n",
              "**Waarom dit niet klopt:** de gekozen noemer past niet bij de gegeven groep."
            )
          }

          feedback_joint <- function(item) {
            if (!item$exists || !is.finite(item$num)) return(missing_message("p_joint"))
            if (near(item$num, 0.1200)) {
              return(paste0(
                "**Waarschijnlijke redenering:** deze waarde bevat alleen `P(drugsmisdrijf | man)`; de kans om eerst in de mannengroep te vallen ontbreekt.\n\n",
                "**Waarom dit niet klopt:** pas `P(man) × P(drugsmisdrijf | man)` toe."
              ))
            }
            if (near(item$num, 0.1041)) {
              return(paste0(
                "**Waarschijnlijke redenering:** deze waarde is consistent met `P(man) × P(drugsmisdrijf)`, alsof de gebeurtenissen onafhankelijk zijn. De diagnose is gebaseerd op de numerieke overeenkomst.\n\n",
                "**Waarom dit niet klopt:** onafhankelijkheid is niet gegeven; gebruik de voorwaardelijke kans `15/125`."
              ))
            }
            if (near(item$num, 15, 0.01)) {
              return(paste0(
                "**Waarschijnlijke redenering:** 15 is de juiste gezamenlijke frequentie, maar geen kans.\n\n",
                "**Waarom dit niet klopt:** deel de doorsnedecel door alle 147 verdachten."
              ))
            }
            paste0(
              "**Controlepunt:** beide routes moeten overeenkomen: `P(man) × P(drug | man)` en rechtstreeks `15/147`.\n\n",
              "**Waarom dit niet klopt:** `", item$raw, "` voldoet niet aan die controle."
            )
          }

          if (isTRUE(generated == expected)) {
            message <- paste0(
              "**Bevestiging:** correct: `P(man)=0.8503`, `P(drugsmisdrijf | man)=0.1200` en `P(man ∩ drugsmisdrijf)=0.1020`. De productregel en de rechtstreekse celberekening leveren hetzelfde resultaat.\n\n",
              "**Denkregel:** bij `P(A ∩ B)=P(A)P(B | A)` vernauwt de voorwaarde eerst de referentiegroep; de gezamenlijke kans wordt daarna weer uitgedrukt ten opzichte van de volledige groep.\n\n",
              "**Transferstap:** bereken `P(vrouw ∩ drugsmisdrijf)` op dezelfde twee manieren en controleer of beide uitkomsten samenvallen.\n\n",
              read_more
            )
          } else {
            parts <- character()
            if (!isTRUE(results$p_man$correct)) {
              parts <- c(parts, paste0("### `p_man`\n\n", feedback_p_man(results$p_man)))
            }
            if (!isTRUE(results$p_drug_given_man$correct)) {
              parts <- c(parts, paste0("### `p_drug_given_man`\n\n", feedback_conditional(results$p_drug_given_man)))
            }
            if (!isTRUE(results$p_joint$correct)) {
              parts <- c(parts, paste0("### `p_joint`\n\n", feedback_joint(results$p_joint)))
            }
            message <- paste(
              c(
                parts,
                "**Denkregel:** de noemer van `P(drugsmisdrijf | man)` is het mannentotaal 125; de noemer van de gezamenlijke kans is het algemene totaal 147.",
                "**Volgende stap:** noteer voor elk fout veld eerst teller/noemer als aantallen, bereken daarna de decimale kans en rond alleen het eindantwoord af op vier decimalen.",
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
