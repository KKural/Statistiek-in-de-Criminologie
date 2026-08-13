context({
  testcase(
    "Kansen uit de diplomakruistabel",
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
            p_man = check_value("p_man", 0.4244),
            p_bachelor_given_man = check_value("p_bachelor_given_man", 0.6776),
            p_man_and_bachelor = check_value("p_man_and_bachelor", 0.2876)
          )

          assign("chapter4_5_results", results, envir = globalenv())
          all(vapply(results, function(item) isTRUE(item$correct), logical(1)))
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("chapter4_5_results", envir = globalenv())
          read_more <- "<a href='https://openstax.org/books/introductory-statistics-2e/pages/3-4-contingency-tables' target='_blank' rel='noopener noreferrer'>Lees meer over kansen uit kruistabellen</a>"

          near <- function(value, target, tolerance = 0.0002) {
            is.finite(value) && abs(value - target) <= tolerance
          }

          missing_message <- function(variable) {
            paste0(
              "**Controleer je invoer:** `", variable,
              "` ontbreekt of is geen enkel eindig getal. Vervang de bijbehorende `NA` door één decimale kans."
            )
          }

          feedback_p_man <- function(item) {
            if (!item$exists || !is.finite(item$num)) return(missing_message("p_man"))
            if (near(item$num, 0.5756)) {
              return(paste0(
                "**Waarschijnlijke redenering:** deze waarde is consistent met het aandeel vrouwen, `1119/1944`. Dezelfde waarde kan ook via een andere rekenroute ontstaan.\n\n",
                "**Waarom dit niet klopt:** gevraagd is de kans op een man. Gebruik daarom het rijtotaal 825 als teller."
              ))
            }
            if (near(item$num, 825, 0.01)) {
              return(paste0(
                "**Waarschijnlijke redenering:** 825 is het juiste aantal mannen, maar nog geen kans.\n\n",
                "**Waarom dit niet klopt:** een marginale kans deelt het relevante aantal door alle 1944 ontvangers."
              ))
            }
            paste0(
              "**Controlepunt:** voor `p_man` horen teller en noemer uit de totalenrand van de tabel te komen.\n\n",
              "**Waarom dit niet klopt:** `", item$raw, "` komt niet overeen met `825/1944`, afgerond op vier decimalen."
            )
          }

          feedback_conditional <- function(item) {
            if (!item$exists || !is.finite(item$num)) return(missing_message("p_bachelor_given_man"))
            if (near(item$num, 0.6908)) {
              return(paste0(
                "**Waarschijnlijke redenering:** deze waarde is consistent met de marginale bachelorkans `1343/1944`; de voorwaarde 'gegeven man' is dan niet toegepast.\n\n",
                "**Waarom dit niet klopt:** zodra bekend is dat de ontvanger een man is, bestaat de relevante groep uit 825 mannen."
              ))
            }
            if (near(item$num, 0.4162)) {
              return(paste0(
                "**Waarschijnlijke redenering:** deze waarde past bij de omgekeerde kans `P(man | bachelor)=559/1343`. Dezelfde uitkomst kan ook via een andere route ontstaan.\n\n",
                "**Waarom dit niet klopt:** in `P(bachelor | man)` bepaalt 'man' de noemer, dus 825 en niet 1343."
              ))
            }
            if (near(item$num, 0.2876)) {
              return(paste0(
                "**Waarschijnlijke redenering:** deze waarde is de gezamenlijke kans `559/1944`.\n\n",
                "**Waarom dit niet klopt:** een voorwaardelijke kans deelt door de omvang van de gegeven groep, hier 825 mannen."
              ))
            }
            paste0(
              "**Controlepunt:** lees `P(bachelor | man)` als 'van alle mannen, welk aandeel behaalde een bachelor?'.\n\n",
              "**Waarom dit niet klopt:** gebruik de cel 559 als teller en het mannentotaal 825 als noemer."
            )
          }

          feedback_joint <- function(item) {
            if (!item$exists || !is.finite(item$num)) return(missing_message("p_man_and_bachelor"))
            if (near(item$num, 0.6776)) {
              return(paste0(
                "**Waarschijnlijke redenering:** deze waarde is alleen `P(bachelor | man)`; de marginale kans op een man is nog niet verwerkt.\n\n",
                "**Waarom dit niet klopt:** de productregel vereist `P(man) × P(bachelor | man)`."
              ))
            }
            if (near(item$num, 0.2932)) {
              return(paste0(
                "**Waarschijnlijke redenering:** deze waarde is consistent met `P(man) × P(bachelor)`, alsof geslacht en diplomatype onafhankelijk zijn. Dat is een voorzichtige diagnose op basis van het getal.\n\n",
                "**Waarom dit niet klopt:** de tabel geeft de passende voorwaardelijke kans `P(bachelor | man)`; onafhankelijkheid is niet gegeven."
              ))
            }
            if (near(item$num, 559, 0.01)) {
              return(paste0(
                "**Waarschijnlijke redenering:** 559 is de juiste gezamenlijke cel, maar nog geen kans.\n\n",
                "**Waarom dit niet klopt:** deel de gezamenlijke frequentie door het algemene totaal 1944."
              ))
            }
            paste0(
              "**Controlepunt:** bereken de gezamenlijke kans met `P(man) × P(bachelor | man)` en controleer met `559/1944`.\n\n",
              "**Waarom dit niet klopt:** `", item$raw, "` voldoet niet aan beide equivalente routes."
            )
          }

          if (isTRUE(generated == expected)) {
            message <- paste0(
              "**Bevestiging:** alle drie kansen zijn correct: `P(man)=0.4244`, `P(bachelor | man)=0.6776` en `P(man ∩ bachelor)=0.2876`. De rechtstreekse celberekening bevestigt de productregel.\n\n",
              "**Denkregel:** een marginale kans gebruikt het algemene totaal; een voorwaardelijke kans gebruikt het totaal van de gegeven groep; een gezamenlijke kans gebruikt de doorsnedecel ten opzichte van het algemene totaal.\n\n",
              "**Transferstap:** bereken met dezelfde tabel `P(man | bachelor)` en leg uit waarom die niet gelijk hoeft te zijn aan `P(bachelor | man)`.\n\n",
              read_more
            )
          } else {
            parts <- character()
            if (!isTRUE(results$p_man$correct)) {
              parts <- c(parts, paste0("### `p_man`\n\n", feedback_p_man(results$p_man)))
            }
            if (!isTRUE(results$p_bachelor_given_man$correct)) {
              parts <- c(parts, paste0("### `p_bachelor_given_man`\n\n", feedback_conditional(results$p_bachelor_given_man)))
            }
            if (!isTRUE(results$p_man_and_bachelor$correct)) {
              parts <- c(parts, paste0("### `p_man_and_bachelor`\n\n", feedback_joint(results$p_man_and_bachelor)))
            }
            message <- paste(
              c(
                parts,
                "**Denkregel:** bepaal eerst welke groep de noemer vormt: iedereen voor een marginale of gezamenlijke kans, maar alleen de groep rechts van de verticale streep voor een voorwaardelijke kans.",
                "**Volgende stap:** schrijf bij elk fout veld eerst de teller en noemer als aantallen uit de tabel; deel pas daarna en rond uitsluitend het eindantwoord af op vier decimalen.",
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
