context({
  testcase("", {
    testEqual("", function(env) {
      expected_values <- c(doel_bivariate_statistiek = 3, kruistabel_metrisch = 2, keuze_associatiemaat = 2)
      tolerances <- c(doel_bivariate_statistiek = 0, kruistabel_metrisch = 0, keuze_associatiemaat = 0)

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
        "results_6_5_grouped",
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
      results <- get("results_6_5_grouped", envir = globalenv())

      if (isTRUE(generated == expected)) {
        message <- paste(
          "**Bevestiging:** je koppelt bivariate beschrijving aan het samenvatten van relaties, herkent waarom metrische kruistabellen onpraktisch zijn en kiest op basis van meetniveau en theoretische richting.",
          "**Denkregel:** begin methodekeuze bij het onderzoeksdoel, bepaal daarna de meetniveaus en pas vervolgens de richting en vorm van de relatie toe.",
          "**Transferstap:** kies voor een nieuw variabelenpaar eerst een passende weergave en daarna een associatiemaat, met één zin verantwoording.",
          sep = "\n\n"
        )
      } else if (!all(results$valid)) {
        missing_fields <- names(results$valid)[!results$valid]
        message <- paste(
          paste0("**Waarschijnlijke redenering:** er ontbreekt een geldige numerieke invoer voor: ", paste(missing_fields, collapse = ", "), "."),
          "**Waarom dit niet klopt:** elke genummerde deelvraag heeft precies één getal of optienummer nodig; zonder alle antwoorden kan de volledige redenering niet worden beoordeeld.",
          "**Denkregel:** begin methodekeuze bij het onderzoeksdoel, bepaal daarna de meetniveaus en pas vervolgens de richting en vorm van de relatie toe.",
          paste0("**Volgende stap:** vul eerst alleen de lege velden ", paste(missing_fields, collapse = ", "), " in en dien opnieuw in."),
          sep = "\n\n"
        )
      } else {
        wrong_field <- names(results$correct_fields)[!results$correct_fields][[1L]]
        likely <- switch(
          wrong_field,
          doel_bivariate_statistiek = { value <- results$values[[wrong_field]]; if (value == 1) "je hebt beschrijvende samenhang verward met definitief causaal bewijs." else if (value == 2) "je hebt een bivariate vraag teruggebracht tot één univariate verdeling." else "je gebruikt methodekeuze om de theoretische rollen te vervangen." },
          kruistabel_metrisch = { value <- results$values[[wrong_field]]; if (value == 1) "je hebt de geschiktheid van kruistabellen voor categorieën omgekeerd." else "je hebt een praktisch leesbaarheidsprobleem als een absoluut verbod geïnterpreteerd." },
          keuze_associatiemaat = { value <- results$values[[wrong_field]]; if (value == 1) "je laat steekproefkenmerken de inhoudelijke methodekeuze volledig bepalen." else if (value == 3) "je kiest op basis van toevallige tabeltotalen in plaats van de variabele-eigenschappen." else "je verwart grafische plaatsing met statistische geschiktheid." }
        )
        why <- switch(
          wrong_field,
          doel_bivariate_statistiek = "bivariate beschrijvende statistiek vat de sterkte, richting en vorm van een relatie tussen twee variabelen samen.",
          kruistabel_metrisch = "bij veel unieke metrische waarden ontstaan te veel rijen en kolommen; een scatterplot of correlatiemaat is dan meestal duidelijker.",
          keuze_associatiemaat = "het meetniveau bepaalt welke berekeningen betekenisvol zijn; theoretische richting bepaalt of een symmetrische of asymmetrische maat past."
        )
        next_step <- switch(
          wrong_field,
          doel_bivariate_statistiek = "onderstreep in het woord bivariaat dat twee variabelen gezamenlijk worden beschreven.",
          kruistabel_metrisch = "tel hoeveel unieke waarden beide variabelen hebben en kies een weergave die hun relatie zichtbaar houdt.",
          keuze_associatiemaat = "noteer eerst het meetniveau van X en Y en teken daarna de veronderstelde richting."
        )
        message <- paste(
          paste0("**Waarschijnlijke redenering:** ", likely),
          paste0("**Waarom dit niet klopt:** ", why),
          "**Denkregel:** begin methodekeuze bij het onderzoeksdoel, bepaal daarna de meetniveaus en pas vervolgens de richting en vorm van de relatie toe.",
          paste0("**Volgende stap:** ", next_step),
          sep = "\n\n"
        )
      }

      get_reporter()$add_message(message, type = "markdown")
      generated == expected
    })
  })
})
