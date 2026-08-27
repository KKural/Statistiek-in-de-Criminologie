context({
  testcase("", {
    testEqual("", function(env) {
      expected_values <- c(groepsgemiddelde = 4, ss_binnen = 8, f_ratio = 4, significant = 1, relatie_f_p = 3)
      read_number <- function(name) {
        if (!exists(name, envir = env)) return(NA_real_)
        value <- suppressWarnings(as.numeric(get(name, envir = env)))
        if (length(value) != 1L || !is.finite(value)) return(NA_real_)
        value
      }
      values <- vapply(names(expected_values), read_number, numeric(1))
      valid <- all(is.finite(values))
      correct <- valid && all(abs(values - expected_values) <= 0.0005)
      assign("results_9_4_1_combined", list(values = values, expected = expected_values, valid = valid), envir = globalenv())
      correct
    }, TRUE, comparator = function(generated, expected, ...) {
      results <- get("results_9_4_1_combined", envir = globalenv())
      if (isTRUE(generated == expected)) {
        message <- paste(
          "**Bevestiging:** alle vijf onderdelen zijn correct: gemiddelde 4, SS_binnen 8, F = 4, een significante beslissing en een kleinere p bij een grotere F.",
          "**Denkregel:** ANOVA vergelijkt variatie tussen groepen met variatie binnen groepen; F boven de kritieke grens wijst op een significant groepsverschil.",
          "**Transferstap:** bouw bij een nieuwe ANOVA dezelfde keten op van beschrijvende maten naar F, beslissing en p-interpretatie.",
          sep = "\n\n"
        )
      } else if (!results$valid) {
        missing_fields <- names(results$expected)[!is.finite(results$values)]
        message <- paste(
          paste0("**Waarschijnlijke redenering:** de volgende antwoorden ontbreken of zijn geen enkel eindig getal: ", paste(missing_fields, collapse = ", "), "."),
          "**Waarom dit niet klopt:** voor een volledige ANOVA-redenering moeten alle vijf stappen afzonderlijk kunnen worden beoordeeld.",
          "**Denkregel:** gebruik één numerieke waarde per lege plaats en gebruik bij keuzevragen de opgegeven antwoordcode.",
          "**Volgende stap:** vul eerst alle lege plaatsen in en controleer daarna de berekening en code van elke genummerde vraag.",
          sep = "\n\n"
        )
      } else {
        wrong_field <- names(which(abs(results$values - results$expected) > 0.0005))[[1L]]
        likely <- switch(wrong_field,
          groepsgemiddelde = "Je hebt waarschijnlijk de groepssom of groepsgrootte gebruikt in plaats van som gedeeld door drie.",
          ss_binnen = "Je hebt waarschijnlijk absolute afwijkingen opgeteld of niet ten opzichte van het groepsgemiddelde gewerkt.",
          f_ratio = "Je hebt waarschijnlijk MS_binnen en MS_tussen omgewisseld.",
          significant = "Je hebt F = 4 waarschijnlijk niet met de kritieke grens 3.2 vergeleken.",
          relatie_f_p = "Je hebt de richting tussen een toetsingsgrootheid en haar rechterstaartkans omgekeerd.",
          "Je hebt een tussenstap of antwoordcode verwisseld."
        )
        why <- switch(wrong_field,
          groepsgemiddelde = "Het gemiddelde van 2, 4 en 6 is 12 / 3 = 4.",
          ss_binnen = "De gekwadrateerde afwijkingen zijn 4, 0 en 4 en tellen op tot 8.",
          f_ratio = "F gebruikt MS_tussen als teller en MS_binnen als noemer: 24 / 6 = 4.",
          significant = "Omdat 4 groter is dan 3.2, is de toets significant en hoort code 1 erbij.",
          relatie_f_p = "Bij vaste vrijheidsgraden ligt een grotere F verder in de rechterstaart en hoort daar een kleinere p bij.",
          "Het antwoord komt niet overeen met de gevraagde ANOVA-stap."
        )
        next_step <- switch(wrong_field,
          groepsgemiddelde = "Tel de drie waarnemingen op en deel door drie.",
          ss_binnen = "Schrijf de afwijkingen −2, 0 en 2 uit, kwadrateer ze en tel op.",
          f_ratio = "Vul 24 in als teller en 6 als noemer.",
          significant = "Plaats F = 4 en de kritieke waarde 3.2 op dezelfde schaal.",
          relatie_f_p = "Denk aan p als het oppervlak rechts van de waargenomen F.",
          "Controleer de genummerde vraag die bij dit veld hoort."
        )
        message <- paste(
          paste0("**Waarschijnlijke redenering:** ", likely),
          paste0("**Waarom dit niet klopt:** ", why),
          "**Denkregel:** houd groepsbeschrijving, variatie, F-ratio, beslissing en p-interpretatie als opeenvolgende maar verschillende stappen.",
          paste0("**Volgende stap:** ", next_step),
          sep = "\n\n"
        )
      }
      get_reporter()$add_message(message, type = "markdown")
      generated == expected
    })
  })
})
