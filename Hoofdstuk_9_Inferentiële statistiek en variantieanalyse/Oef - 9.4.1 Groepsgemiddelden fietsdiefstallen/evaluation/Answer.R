context({
  testcase("", {
    testEqual("", function(env) {
      expected_values <- c(
        groepsgemiddelde = 4,
        ss_binnen = 8,
        f_ratio = 4,
        significant = 1
      )

      read_number <- function(name) {
        if (!exists(name, envir = env, inherits = FALSE)) return(NA_real_)
        value <- suppressWarnings(as.numeric(get(name, envir = env, inherits = FALSE)))
        if (length(value) != 1L || !is.finite(value)) return(NA_real_)
        value
      }

      values <- vapply(names(expected_values), read_number, numeric(1))
      valid <- is.finite(values)
      correct_fields <- valid & abs(values - expected_values) <= 0.0005
      assign(
        "results_9_4_1_combined",
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
      results <- get("results_9_4_1_combined", envir = globalenv())

      if (isTRUE(generated == expected)) {
        message <- paste(
          "**Bevestiging:** alle vier onderdelen zijn correct: groepsgemiddelde 4, SS_binnen 8, F = 4 en een significante beslissing.",
          "**Denkregel:** ANOVA vergelijkt variatie tussen groepen met variatie binnen groepen; F boven de kritieke grens wijst op een significant groepsverschil.",
          "**Transferstap:** bouw bij een nieuwe ANOVA dezelfde keten op van groepsgemiddelden via binnengroepsvariatie naar F en de toetsbeslissing.",
          sep = "\n\n"
        )
      } else if (!all(results$valid)) {
        missing_fields <- names(results$valid)[!results$valid]
        message <- paste(
          paste0(
            "**Waarschijnlijke redenering:** de volgende antwoorden ontbreken of zijn geen enkel eindig getal: ",
            paste(missing_fields, collapse = ", "), "."
          ),
          "**Waarom dit niet klopt:** voor de ANOVA-redenering moeten alle vier stappen afzonderlijk kunnen worden beoordeeld.",
          "**Denkregel:** gebruik één numerieke waarde per lege plaats en gebruik bij de keuzevraag de opgegeven antwoordcode.",
          "**Volgende stap:** vul eerst alle lege plaatsen in en controleer daarna de berekening en code van elke genummerde vraag.",
          sep = "\n\n"
        )
      } else {
        wrong_field <- names(results$correct_fields)[!results$correct_fields][[1L]]
        likely <- switch(
          wrong_field,
          groepsgemiddelde = "je hebt waarschijnlijk de groepssom of groepsgrootte gebruikt in plaats van de som door drie te delen.",
          ss_binnen = "je hebt waarschijnlijk absolute afwijkingen opgeteld of niet ten opzichte van het groepsgemiddelde gewerkt.",
          f_ratio = "je hebt waarschijnlijk MS_binnen en MS_tussen omgewisseld.",
          significant = "je hebt F = 4 waarschijnlijk niet met de kritieke grens 3.2 vergeleken."
        )
        why <- switch(
          wrong_field,
          groepsgemiddelde = "het gemiddelde van 2, 4 en 6 is 12 / 3 = 4.",
          ss_binnen = "de gekwadrateerde afwijkingen zijn 4, 0 en 4 en tellen op tot 8.",
          f_ratio = "F gebruikt MS_tussen als teller en MS_binnen als noemer: 24 / 6 = 4.",
          significant = "omdat 4 groter is dan 3.2, is de toets significant en hoort code 1 erbij."
        )
        next_step <- switch(
          wrong_field,
          groepsgemiddelde = "tel de drie waarnemingen op en deel door drie.",
          ss_binnen = "schrijf de afwijkingen −2, 0 en 2 uit, kwadrateer ze en tel op.",
          f_ratio = "vul 24 in als teller en 6 als noemer.",
          significant = "plaats F = 4 en de kritieke waarde 3.2 op dezelfde schaal."
        )
        message <- paste(
          paste0("**Waarschijnlijke redenering:** ", likely),
          paste0("**Waarom dit niet klopt:** ", why),
          "**Denkregel:** houd groepsbeschrijving, variatie, F-ratio en beslissing als opeenvolgende maar verschillende stappen.",
          paste0("**Volgende stap:** ", next_step),
          sep = "\n\n"
        )
      }

      get_reporter()$add_message(message, type = "markdown")
      generated == expected
    })
  })
})
