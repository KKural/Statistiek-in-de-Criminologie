context({
  testcase(
    "Richting van de voorwaarde",
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
            p_drug_given_man = check_value("p_drug_given_man", 0.1200),
            p_man_given_drug = check_value("p_man_given_drug", 0.8333)
          )

          assign("chapter4_8_results", results, envir = globalenv())
          all(vapply(results, function(item) isTRUE(item$correct), logical(1)))
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("chapter4_8_results", envir = globalenv())
          read_more <- "<a href='https://openstax.org/books/introductory-statistics-2e/pages/3-4-contingency-tables' target='_blank' rel='noopener noreferrer'>Lees meer over voorwaardelijke kansen in kruistabellen</a>"

          near <- function(value, target, tolerance = 0.0002) {
            is.finite(value) && abs(value - target) <= tolerance
          }
          missing_message <- function(variable) {
            paste0(
              "**Controleer je invoer:** `", variable,
              "` ontbreekt of is geen enkel eindig getal. Vervang de `NA` door één decimale kans."
            )
          }

          feedback_drug_given_man <- function(item) {
            if (!item$exists || !is.finite(item$num)) return(missing_message("p_drug_given_man"))
            if (near(item$num, 0.8333)) {
              return(paste0(
                "**Waarschijnlijke redenering:** deze waarde is consistent met het verwisselen van de twee voorwaardelijke kansen. Dezelfde waarde kan ook via een andere route ontstaan.\n\n",
                "**Waarom dit niet klopt:** in `P(drugsmisdrijf | man)` is de gegeven groep 'man'; de noemer is daarom 125, niet 18."
              ))
            }
            if (near(item$num, 0.1224)) {
              return(paste0(
                "**Waarschijnlijke redenering:** deze waarde past bij de marginale kans `P(drugsmisdrijf)=18/147`; de voorwaarde is dan genegeerd.\n\n",
                "**Waarom dit niet klopt:** beperk de referentiegroep tot de 125 mannen en gebruik 15 als teller."
              ))
            }
            if (near(item$num, 0.1020)) {
              return(paste0(
                "**Waarschijnlijke redenering:** deze waarde is de gezamenlijke kans `P(man ∩ drugsmisdrijf)=15/147`.\n\n",
                "**Waarom dit niet klopt:** een voorwaardelijke kans gebruikt het totaal van de gegeven groep, hier 125."
              ))
            }
            paste0(
              "**Controlepunt:** lees de uitdrukking van rechts naar links: gegeven man betekent rekenen binnen de 125 mannen.\n\n",
              "**Waarom dit niet klopt:** gebruik `15/125` voor dit veld."
            )
          }

          feedback_man_given_drug <- function(item) {
            if (!item$exists || !is.finite(item$num)) return(missing_message("p_man_given_drug"))
            if (near(item$num, 0.1200)) {
              return(paste0(
                "**Waarschijnlijke redenering:** deze waarde is consistent met het verwisselen van `P(man | drugsmisdrijf)` en `P(drugsmisdrijf | man)`. Dit is een voorzichtige diagnose op basis van het getal.\n\n",
                "**Waarom dit niet klopt:** in dit veld is de gegeven groep 'drugsmisdrijf'; de noemer is 18."
              ))
            }
            if (near(item$num, 0.8503)) {
              return(paste0(
                "**Waarschijnlijke redenering:** deze waarde past bij de marginale kans `P(man)=125/147`; de voorwaarde is dan niet toegepast.\n\n",
                "**Waarom dit niet klopt:** bekijk uitsluitend de 18 drugsmisdrijfregistraties, waarvan er 15 mannen betreffen."
              ))
            }
            if (near(item$num, 0.1020)) {
              return(paste0(
                "**Waarschijnlijke redenering:** deze waarde is de gezamenlijke kans `15/147`.\n\n",
                "**Waarom dit niet klopt:** de voorwaardelijke vraag gebruikt de 18 drugsmisdrijfregistraties als noemer."
              ))
            }
            paste0(
              "**Controlepunt:** de groep rechts van de verticale streep bepaalt de noemer: 18 drugsmisdrijfregistraties.\n\n",
              "**Waarom dit niet klopt:** gebruik `15/18` voor dit veld."
            )
          }

          if (isTRUE(generated == expected)) {
            message <- paste0(
              "**Bevestiging:** correct: `P(drugsmisdrijf | man)=0.1200` en `P(man | drugsmisdrijf)=0.8333`. Dezelfde teller 15 leidt tot verschillende kansen omdat de referentiegroep verandert.\n\n",
              "**Denkregel:** bij `P(A | B)` bepaalt B de noemer. Voorwaardelijke kansen zijn gericht: `P(A | B)` en `P(B | A)` zijn doorgaans niet gelijk.\n\n",
              "**Transferstap:** vergelijk met dezelfde tabel `P(diefstal | vrouw)` en `P(vrouw | diefstal)` en benoem vóór het rekenen beide noemers.\n\n",
              read_more
            )
          } else {
            parts <- character()
            if (!isTRUE(results$p_drug_given_man$correct)) {
              parts <- c(parts, paste0("### `p_drug_given_man`\n\n", feedback_drug_given_man(results$p_drug_given_man)))
            }
            if (!isTRUE(results$p_man_given_drug$correct)) {
              parts <- c(parts, paste0("### `p_man_given_drug`\n\n", feedback_man_given_drug(results$p_man_given_drug)))
            }
            message <- paste(
              c(
                parts,
                "**Denkregel:** houd de gezamenlijke cel 15 vast en verander alleen de noemer volgens de gegeven groep: 125 voor `| man`, 18 voor `| drugsmisdrijf`.",
                "**Volgende stap:** onderstreep in elke vraag de woorden na 'gegeven' en schrijf dat groepstotaal eerst als noemer voordat je deelt.",
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
