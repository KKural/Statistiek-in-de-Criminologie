context({
  testcase("", {
    testEqual("", function(env) {
      expected_values <- c(spearman_richting = 4, gamma_bereik = 1, kendall_bereik = 2, spearman_nul = 3)
      tolerances <- c(spearman_richting = 0, gamma_bereik = 0, kendall_bereik = 0, spearman_nul = 0)

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
        "results_7_3_grouped",
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
      results <- get("results_7_3_grouped", envir = globalenv())

      if (isTRUE(generated == expected)) {
        message <- paste(
          "**Bevestiging:** je herkent de foute uitspraken over negatieve rho, het bereik van Gamma, het bereik van Kendall's tau en de betekenis van rho = 0.",
          "**Denkregel:** controleer bij elke ordinale associatiemaat eerst het bereik, daarna het teken en ten slotte welk type rangpatroon de maat wel of niet samenvat.",
          "**Transferstap:** schets een positief monotoon, negatief monotoon en niet-monotoon patroon en voorspel voor elk het teken van een rangcorrelatie.",
          sep = "\n\n"
        )
      } else if (!all(results$valid)) {
        missing_fields <- names(results$valid)[!results$valid]
        message <- paste(
          paste0("**Waarschijnlijke redenering:** er ontbreekt een geldige numerieke invoer voor: ", paste(missing_fields, collapse = ", "), "."),
          "**Waarom dit niet klopt:** elke genummerde deelvraag heeft precies één getal of optienummer nodig; zonder alle antwoorden kan de volledige redenering niet worden beoordeeld.",
          "**Denkregel:** controleer bij elke ordinale associatiemaat eerst het bereik, daarna het teken en ten slotte welk type rangpatroon de maat wel of niet samenvat.",
          paste0("**Volgende stap:** vul eerst alleen de lege velden ", paste(missing_fields, collapse = ", "), " in en dien opnieuw in."),
          sep = "\n\n"
        )
      } else {
        wrong_field <- names(results$correct_fields)[!results$correct_fields][[1L]]
        likely <- switch(
          wrong_field,
          spearman_richting = { value <- results$values[[wrong_field]]; if (value == 1) "je denkt dat rangcorrelaties buiten de gebruikelijke correlatiegrenzen kunnen vallen." else if (value == 2) "je verwart monotone samenhang met uitsluitend lineaire samenhang." else "je hebt een geldige beschrijving van een negatieve rangrelatie afgewezen." },
          gamma_bereik = { value <- results$values[[wrong_field]]; if (value == 4) "je hebt Gamma verward met een maat die ties expliciet in de noemer corrigeert." else "je hebt een geldige eigenschap van Gamma als fout aangeduid." },
          kendall_bereik = { value <- results$values[[wrong_field]]; if (value == 1) "je hebt de geldige begrenzing van tau afgewezen." else "je hebt een geldige rangpaarinterpretatie als fout aangeduid." },
          spearman_nul = { value <- results$values[[wrong_field]]; if (value == 4) "je denkt dat een niet-monotoon patroon de uitspraak over afwezige monotone samenhang weerlegt." else "je hebt een geldige eigenschap van Spearman's rho afgewezen." }
        )
        why <- switch(
          wrong_field,
          spearman_richting = "een tegengestelde monotone rangorde levert een negatieve rho; de bewering dat rho niet negatief kan zijn is dus fout.",
          gamma_bereik = "Gamma = (C - D)/(C + D) blijft tussen -1 en +1; ties maken een waarde boven 1 niet mogelijk.",
          kendall_bereik = "Kendall's tau is genormaliseerd en kan nooit 2 of -2 zijn; uitspraak 2 is fout.",
          spearman_nul = "rho = 0 sluit een monotone trend uit, maar niet elk mogelijk niet-monotoon verband; uitspraak 3 is daarom fout."
        )
        next_step <- switch(
          wrong_field,
          spearman_richting = "vergelijk twee omgekeerde ranglijsten en bepaal of hogere rangen samengaan met lagere rangen.",
          gamma_bereik = "toets elke uitspraak aan de formule en het vaste bereik [-1,+1].",
          kendall_bereik = "controleer antwoordwaarden eerst op het theoretische interval [-1,+1].",
          spearman_nul = "teken een U-vorm: er is duidelijke structuur, maar geen consequent stijgende of dalende rangtrend."
        )
        message <- paste(
          paste0("**Waarschijnlijke redenering:** ", likely),
          paste0("**Waarom dit niet klopt:** ", why),
          "**Denkregel:** controleer bij elke ordinale associatiemaat eerst het bereik, daarna het teken en ten slotte welk type rangpatroon de maat wel of niet samenvat.",
          paste0("**Volgende stap:** ", next_step),
          sep = "\n\n"
        )
      }

      get_reporter()$add_message(message, type = "markdown")
      generated == expected
    })
  })
})
