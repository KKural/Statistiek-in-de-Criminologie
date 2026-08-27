context({
  testcase("", {
    testEqual("", function(env) {
      expected_values <- c(causale_stelling = 3, contributieve_oorzaak = 2, asymmetrische_relatie = 3, generatieve_causaliteit = 2)
      tolerances <- c(causale_stelling = 0, contributieve_oorzaak = 0, asymmetrische_relatie = 0, generatieve_causaliteit = 0)

      read_number <- function(name) {
        if (!exists(name, envir = env, inherits = FALSE)) return(NA_real_)
        value <- suppressWarnings(as.numeric(get(name, envir = env, inherits = FALSE)))
        if (length(value) != 1L || !is.finite(value)) return(NA_real_)
        value
      }

      values <- vapply(names(expected_values), read_number, numeric(1))
      valid <- is.finite(values)
      correct_fields <- valid & abs(values - expected_values) <= tolerances

      assign(
        "results_6_1_grouped",
        list(
          values = values,
          expected = expected_values,
          valid = valid,
          correct_fields = correct_fields
        ),
        envir = globalenv()
      )

      all(correct_fields)
    }, TRUE, comparator = function(generated, expected, ...) {
      results <- get("results_6_1_grouped", envir = globalenv())

      if (isTRUE(generated == expected)) {
        message <- paste(
          "**Bevestiging:** je onderscheidt samenhang van causaliteit, herkent contributieve oorzaken, kent de theoretische richting van asymmetrie en koppelt mechanismen aan generatieve causaliteit.",
          "**Denkregel:** beoordeel causaliteit afzonderlijk op statistische samenhang, theoretische richting, alternatieve oorzaken en een aannemelijk mechanisme.",
          "**Transferstap:** pas de vier begrippen toe op één nieuw criminologisch voorbeeld en formuleer welke aanvullende gegevens de causale claim sterker maken.",
          sep = "\n\n"
        )
      } else if (!all(results$valid)) {
        missing_fields <- names(results$valid)[!results$valid]
        message <- paste(
          paste0("**Waarschijnlijke redenering:** er ontbreekt een geldige numerieke invoer voor: ", paste(missing_fields, collapse = ", "), "."),
          "**Waarom dit niet klopt:** elke genummerde deelvraag heeft precies één getal of optienummer nodig; zonder alle antwoorden kan de volledige redenering niet worden beoordeeld.",
          "**Denkregel:** beoordeel causaliteit afzonderlijk op statistische samenhang, theoretische richting, alternatieve oorzaken en een aannemelijk mechanisme.",
          paste0("**Volgende stap:** vul eerst alleen de lege velden ", paste(missing_fields, collapse = ", "), " in en dien opnieuw in."),
          sep = "\n\n"
        )
      } else {
        wrong_field <- names(results$correct_fields)[!results$correct_fields][[1L]]
        likely <- switch(
          wrong_field,
          causale_stelling = { value <- results$values[[wrong_field]]; if (value == 1) "je behandelt statistische samenhang als voldoende causaal bewijs." else "je verwart een statistisch patroon met de sterkere inhoudelijke claim van causaliteit." },
          contributieve_oorzaak = { value <- results$values[[wrong_field]]; if (value == 1) "je gebruikt een deterministisch model waarin één factor noodzakelijk én voldoende moet zijn." else "je kent aan één criminologische factor te veel noodzakelijkheid of voldoende kracht toe." },
          asymmetrische_relatie = { value <- results$values[[wrong_field]]; if (value == 1) "je hebt gezamenlijke verandering geïnterpreteerd als wederzijdse beïnvloeding." else "je hebt de theoretische rollen van verklarende en te verklaren variabele niet onderscheiden." },
          generatieve_causaliteit = { value <- results$values[[wrong_field]]; if (value == 1) "je hebt een vergelijking met een tegenfeitelijke toestand gekozen in plaats van een werkingsmechanisme." else "je hebt causaliteitsvormen op hun statistische resultaat in plaats van hun verklaringsdoel onderscheiden." }
        )
        why <- switch(
          wrong_field,
          causale_stelling = "causaliteit impliceert een populatiesamenhang, maar samenhang alleen sluit derde variabelen, omgekeerde richting of toeval niet uit.",
          contributieve_oorzaak = "criminologische uitkomsten ontstaan meestal via meerdere routes; afzonderlijke factoren verhogen vaak slechts de kans.",
          asymmetrische_relatie = "asymmetrie betekent dat theorie een richting X → Y veronderstelt; de cijfers alleen bepalen die richting niet.",
          generatieve_causaliteit = "generatieve of productieve causaliteit vraagt hoe een oorzaak via een mechanisme een effect voortbrengt."
        )
        next_step <- switch(
          wrong_field,
          causale_stelling = "onthoud de éénrichtingsregel: causaliteit → samenhang, maar samenhang ⇏ automatisch causaliteit.",
          contributieve_oorzaak = "vraag apart of de factor altijd nodig is en of hij alleen steeds voldoende is; meestal zijn beide antwoorden nee.",
          asymmetrische_relatie = "benoem expliciet welke variabele X is, welke Y is en waarom de pijl inhoudelijk die richting heeft.",
          generatieve_causaliteit = "zoek in de casus naar de tussenliggende handeling of het proces dat X met Y verbindt."
        )
        message <- paste(
          paste0("**Waarschijnlijke redenering:** ", likely),
          paste0("**Waarom dit niet klopt:** ", why),
          "**Denkregel:** beoordeel causaliteit afzonderlijk op statistische samenhang, theoretische richting, alternatieve oorzaken en een aannemelijk mechanisme.",
          paste0("**Volgende stap:** ", next_step),
          sep = "\n\n"
        )
      }

      get_reporter()$add_message(message, type = "markdown")
      generated == expected
    })
  })
})
