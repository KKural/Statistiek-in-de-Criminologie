context({
  testcase("", {
    testEqual("", function(env) {
      expected_values <- c(lineariteit = 2, homoscedasticiteit = 1, normaliteit = 3, multicollineariteit = 4)
      read_number <- function(name) {
        if (!exists(name, envir = env)) return(NA_real_)
        value <- suppressWarnings(as.numeric(get(name, envir = env)))
        if (length(value) != 1L || !is.finite(value)) return(NA_real_)
        value
      }
      values <- vapply(names(expected_values), read_number, numeric(1))
      valid <- all(is.finite(values))
      correct <- valid && all(abs(values - expected_values) <= 0.0005)
      assign("results_12_11_combined", list(values = values, expected = expected_values, valid = valid), envir = globalenv())
      correct
    }, TRUE, comparator = function(generated, expected, ...) {
      results <- get("results_12_11_combined", envir = globalenv())
      if (isTRUE(generated == expected)) {
        message <- paste(
          "**Bevestiging:** B schendt lineariteit, A toont heteroscedasticiteit, beide Q-Q-plots schenden normaliteit en geen van beide VIF-diagnoses overschrijdt de probleemgrens.",
          "**Denkregel:** iedere assumptie heeft een eigen signaal: vorm, spreiding, verdelingspatroon of predictoroverlap.",
          "**Transferstap:** benoem bij een nieuw regressiemodel eerst de assumptie en kies daarna pas de passende grafiek of maat.",
          sep = "\n\n"
        )
      } else if (!results$valid) {
        missing_fields <- names(results$expected)[!is.finite(results$values)]
        message <- paste(
          paste0("**Waarschijnlijke redenering:** de volgende antwoordcodes ontbreken of zijn niet numeriek: ", paste(missing_fields, collapse = ", "), "."),
          "**Waarom dit niet klopt:** elke assumptie wordt met een eigen diagnose beoordeeld en vereist één geldige code.",
          "**Denkregel:** vul alleen een code 1–4 in en behandel de vier diagnostieken afzonderlijk.",
          "**Volgende stap:** vul alle vier velden in en controleer vervolgens per vraag welk specifiek patroon problematisch is.",
          sep = "\n\n"
        )
      } else {
        wrong_field <- names(which(abs(results$values - results$expected) > 0.0005))[[1L]]
        likely <- switch(wrong_field,
          lineariteit = "Je hebt waarschijnlijk willekeurige verticale spreiding verward met systematische kromming van de gemiddelde residutrend.",
          homoscedasticiteit = "Je hebt waarschijnlijk de hoogte van afzonderlijke punten beoordeeld in plaats van de verandering van de spreiding over de horizontale as.",
          normaliteit = "Je hebt waarschijnlijk slechts één soort afwijking herkend: zware staarten in A of rechtsscheefheid in B.",
          multicollineariteit = "Je hebt waarschijnlijk elke VIF groter dan 1 als problematisch beschouwd in plaats van de waarden met de aangegeven grens te vergelijken.",
          "Je hebt twee regressieassumpties verwisseld."
        )
        why <- switch(wrong_field,
          lineariteit = "De duidelijke kromming van de LOESS-lijn in B wijst op niet-lineariteit; daarom is code 2 correct.",
          homoscedasticiteit = "De rode trendlijn stijgt duidelijk in A, terwijl zij in B ongeveer horizontaal blijft; alleen A toont heteroscedasticiteit en code 1 is correct.",
          normaliteit = "A vertoont een systematische S-vorm door zware staarten en B een systematische kromming door rechtsscheefheid; beide schenden normaliteit en code 3 is correct.",
          multicollineariteit = "Alle vier VIF-waarden blijven onder de aangegeven probleemgrens van 10; geen van beide modellen toont dit probleem en code 4 is correct.",
          "De gekozen code hoort niet bij het beschreven diagnostische signaal."
        )
        next_step <- switch(wrong_field,
          lineariteit = "Volg alleen de vorm van de rode gemiddelde trend en zoek systematische kromming.",
          homoscedasticiteit = "Volg in elke scale-locationplot de rode lijn van links naar rechts en kies A wanneer de spreiding toeneemt.",
          normaliteit = "Controleer in beide figuren de volledige puntenwolk, inclusief beide staarten, ten opzichte van de rode lijn.",
          multicollineariteit = "Vergelijk in beide figuren eerst de hoogste staaf met de rode grenslijn op 10.",
          "Koppel de diagnose opnieuw aan de juiste assumptie."
        )
        message <- paste(
          paste0("**Waarschijnlijke redenering:** ", likely),
          paste0("**Waarom dit niet klopt:** ", why),
          "**Denkregel:** diagnoseer lineariteit, gelijke variantie, normaliteit en multicollineariteit met hun eigen patronen.",
          paste0("**Volgende stap:** ", next_step),
          sep = "\n\n"
        )
      }
      get_reporter()$add_message(message, type = "markdown")
      generated == expected
    })
  })
})
