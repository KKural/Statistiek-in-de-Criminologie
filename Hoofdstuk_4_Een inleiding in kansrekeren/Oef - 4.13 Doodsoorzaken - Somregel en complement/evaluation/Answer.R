context({
  testcase(
    "Disjuncte doodsoorzaken en complement",
    {
      testEqual(
        "",
        function(env) {
          inspect <- function(name, expected) {
            present <- exists(name, envir = env, inherits = FALSE)
            value <- if (present) suppressWarnings(as.numeric(get(name, envir = env))) else NA_real_
            value <- if (length(value) == 1L) value else NA_real_
            list(present = present, value = value, correct = present && is.finite(value) && abs(value - expected) <= 0.0005)
          }
          results <- list(
            kans_schot_of_wurging = inspect("kans_schot_of_wurging", 0.67),
            kans_andere_oorzaak = inspect("kans_andere_oorzaak", 0.33)
          )
          assign("chapter4_13_results", results, envir = globalenv())
          all(vapply(results, function(item) isTRUE(item$correct), logical(1)))
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("chapter4_13_results", envir = globalenv())
          read_more <- "<a href='https://openstax.org/books/introductory-statistics-2e/pages/3-3-two-basic-rules-of-probability' target='_blank' rel='noopener noreferrer'>Lees meer over de som- en complementregel</a>"
          near <- function(item, target, tolerance = 0.001) is.finite(item$value) && abs(item$value - target) <= tolerance

          union_feedback <- function(item) {
            if (!item$present || !is.finite(item$value)) {
              return(paste(
                "**Controleer je invoer:** `kans_schot_of_wurging` ontbreekt of bevat niet precies één eindig getal.",
                "**Waarom dit niet klopt:** het veld moet één decimale kans bevatten.",
                sep = "\n\n"
              ))
            }
            if (near(item, 0.099)) {
              return(paste(
                "**Waarschijnlijke redenering:** deze waarde is consistent met `0.45 × 0.22`, alsof ‘of’ om de productregel vraagt. Dezelfde waarde kan ook anders ontstaan.",
                "**Waarom dit niet klopt:** de vraag gaat over de unie van twee disjuncte categorieën; daarvoor tel je de kansen op.",
                sep = "\n\n"
              ))
            }
            if (near(item, 67, 0.01)) {
              return(paste(
                "**Waarschijnlijke redenering:** 67 is het correcte percentage, maar niet de gevraagde proportie. Dezelfde waarde kan ook anders ontstaan.",
                "**Waarom dit niet klopt:** 67% moet als decimale kans `0.67` worden ingevoerd.",
                sep = "\n\n"
              ))
            }
            paste(
              "**Waarschijnlijke redenering:** uit de eindwaarde is de precieze route niet zeker; mogelijk zijn ‘of’, disjunctie of de schaal van het antwoord anders geïnterpreteerd.",
              "**Waarom dit niet klopt:** bij disjuncte oorzaken geldt `P(S of W)=0.45+0.22=0.67`.",
              sep = "\n\n"
            )
          }

          complement_feedback <- function(item) {
            if (!item$present || !is.finite(item$value)) {
              return(paste(
                "**Controleer je invoer:** `kans_andere_oorzaak` ontbreekt of bevat niet precies één eindig getal.",
                "**Waarom dit niet klopt:** het veld moet één decimale kans bevatten.",
                sep = "\n\n"
              ))
            }
            if (near(item, 0.67)) {
              return(paste(
                "**Waarschijnlijke redenering:** je hebt mogelijk de kans op schotwonde of wurging opnieuw ingevuld. Dit is een voorzichtige hypothese op basis van de waarde.",
                "**Waarom dit niet klopt:** ‘andere oorzaak’ is het complement van die unie en vraagt daarom `1 - 0.67`.",
                sep = "\n\n"
              ))
            }
            if (near(item, 33, 0.01)) {
              return(paste(
                "**Waarschijnlijke redenering:** 33 is het correcte percentage, maar niet de gevraagde proportie. Dezelfde waarde kan ook anders ontstaan.",
                "**Waarom dit niet klopt:** 33% moet als decimale kans `0.33` worden ingevoerd.",
                sep = "\n\n"
              ))
            }
            if (near(item, 0.55) || near(item, 0.78)) {
              return(paste(
                "**Waarschijnlijke redenering:** deze waarde past bij het complement van slechts één oorzaak. Dezelfde waarde kan ook anders ontstaan.",
                "**Waarom dit niet klopt:** ‘andere oorzaak’ sluit zowel schotwonde als wurging uit; neem dus het complement van hun volledige unie.",
                sep = "\n\n"
              ))
            }
            paste(
              "**Waarschijnlijke redenering:** uit de eindwaarde is de precieze route niet zeker; mogelijk is het complement vóór het samenvoegen van de twee categorieën genomen.",
              "**Waarom dit niet klopt:** `P(andere oorzaak)=1-P(S of W)=1-0.67=0.33`.",
              sep = "\n\n"
            )
          }

          if (isTRUE(generated == expected)) {
            message <- paste0(
              "**Bevestiging:** beide kansen zijn correct: `P(S of W)=0.67` en `P(andere oorzaak)=0.33`.\n\n",
              "**Waarom dit klopt:** de categorieën zijn disjunct, zodat hun unie de som is; alle overige categorieën vormen samen het complement van die unie.\n\n",
              "**Denkregel:** tel kansen alleen rechtstreeks op wanneer de gebeurtenissen niet samen kunnen voorkomen; bereken ‘geen van beide’ daarna als `1 - P(unie)`.\n\n",
              "**Transferstap:** voeg een derde, eveneens disjuncte oorzaak met kans 0.08 toe en bereken opnieuw de kans op alle andere oorzaken.\n\n",
              read_more
            )
          } else {
            parts <- character()
            if (!results$kans_schot_of_wurging$correct) {
              parts <- c(parts, paste0("### `kans_schot_of_wurging`\n\n", union_feedback(results$kans_schot_of_wurging)))
            }
            if (!results$kans_andere_oorzaak$correct) {
              parts <- c(parts, paste0("### `kans_andere_oorzaak`\n\n", complement_feedback(results$kans_andere_oorzaak)))
            }
            message <- paste(
              c(
                parts,
                "**Denkregel:** bepaal eerst of overlap mogelijk is; voeg disjuncte kansen samen en neem pas daarna het complement.",
                "**Volgende stap:** schrijf eerst `P(S ∩ W)=0`, bereken vervolgens `0.45+0.22` en trek die uitkomst in een aparte regel af van 1.",
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
