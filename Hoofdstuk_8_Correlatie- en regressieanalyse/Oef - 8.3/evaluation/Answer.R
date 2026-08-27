context({
  testcase("", {
    testEqual("", function(env) {
      expected_values <- c(grootste_residu_punt = 2, punt_positie = 3, r_kwadraat_pct = 87)
      tolerances <- c(grootste_residu_punt = 0, punt_positie = 0, r_kwadraat_pct = 0)

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
        "results_8_3_grouped",
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
      results <- get("results_8_3_grouped", envir = globalenv())

      if (isTRUE(generated == expected)) {
        message <- paste(
          "**Bevestiging:** puntcode 2 heeft het grootste absolute residu, optie 3 plaatst P onder de lijn en 87% is de afgeronde verklaarde variantie.",
          "**Denkregel:** bereken een residu als e = Y - Ŷ, gebruik het teken voor de positie en interpreteer R² op de gevraagde schaal.",
          "**Transferstap:** maak voor een nieuwe regressie-uitvoer een kleine tabel met Y, Ŷ, e en |e| en lees daarna R² afzonderlijk af.",
          sep = "\n\n"
        )
      } else if (!all(results$valid)) {
        missing_fields <- names(results$valid)[!results$valid]
        message <- paste(
          paste0("**Waarschijnlijke redenering:** er ontbreekt een geldige numerieke invoer voor: ", paste(missing_fields, collapse = ", "), "."),
          "**Waarom dit niet klopt:** elke genummerde deelvraag heeft precies één getal of optienummer nodig; zonder alle antwoorden kan de volledige redenering niet worden beoordeeld.",
          "**Denkregel:** bereken een residu als e = Y - Ŷ, gebruik het teken voor de positie en interpreteer R² op de gevraagde schaal.",
          paste0("**Volgende stap:** vul eerst alleen de lege velden ", paste(missing_fields, collapse = ", "), " in en dien opnieuw in."),
          sep = "\n\n"
        )
      } else {
        wrong_field <- names(results$correct_fields)[!results$correct_fields][[1L]]
        likely <- switch(
          wrong_field,
          grootste_residu_punt = { value <- results$values[[wrong_field]]; if (value == 6) "je hebt een extreme X-positie verward met een groot verticaal residu." else if (value == 1) "je hebt een hoge Y-waarde verward met een grote afstand tot de lijn." else "je hebt waarschijnlijk de residuen niet in absolute waarde vergeleken." },
          punt_positie = { value <- results$values[[wrong_field]]; if (value == 1) "je hebt de visuele positie geschat zonder Y met Ŷ te vergelijken." else "je hebt een niet-nulresidu geïnterpreteerd als exact op de lijn." },
          r_kwadraat_pct = { value <- results$values[[wrong_field]]; if (abs(value - 0.872) <= 0.0005) "je hebt de decimale R² niet naar procent omgezet." else if (abs(value - 86) <= 0.5) "je hebt mogelijk de gecorrigeerde R² gebruikt." else if (abs(value - 93) <= 1) "je hebt mogelijk R in plaats van R² als percentage gelezen." else "je hebt de verkeerde modelmaat of schaal gebruikt." }
        )
        why <- switch(
          wrong_field,
          grootste_residu_punt = "voor punt B, code 2, is e = 29 - 24.2 = 4.8; dat is de grootste absolute waarde in de tabel.",
          punt_positie = "e = 16 - 18.3 = -2.3; een negatief residu betekent dat P onder de regressielijn ligt, optie 3.",
          r_kwadraat_pct = "de gewone R² is 0.872; maal 100 is 87.2%, afgerond als geheel percentage 87."
        )
        next_step <- switch(
          wrong_field,
          grootste_residu_punt = "bereken voor elke rij Y - Ŷ en vergelijk daarna pas de absolute waarden.",
          punt_positie = "bereken Y - Ŷ en vertaal negatief, nul en positief naar onder, op en boven de lijn.",
          r_kwadraat_pct = "wijs eerst de gewone R² aan, vermenigvuldig met 100 en rond pas het percentage af."
        )
        message <- paste(
          paste0("**Waarschijnlijke redenering:** ", likely),
          paste0("**Waarom dit niet klopt:** ", why),
          "**Denkregel:** bereken een residu als e = Y - Ŷ, gebruik het teken voor de positie en interpreteer R² op de gevraagde schaal.",
          paste0("**Volgende stap:** ", next_step),
          sep = "\n\n"
        )
      }

      get_reporter()$add_message(message, type = "markdown")
      generated == expected
    })
  })
})
