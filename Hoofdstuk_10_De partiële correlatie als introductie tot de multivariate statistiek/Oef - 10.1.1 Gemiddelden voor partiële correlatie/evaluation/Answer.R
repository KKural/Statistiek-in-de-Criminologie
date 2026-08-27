context({
  testcase("", {
    testEqual("", function(env) {
      expected_values <- c(gemiddelde_x = 2.5, scp_xy = -4, variantie_x = 6, r_xy = 0.5, r_xy_z = 0.504)
      read_number <- function(name) {
        if (!exists(name, envir = env)) return(NA_real_)
        value <- suppressWarnings(as.numeric(get(name, envir = env)))
        if (length(value) != 1L || !is.finite(value)) return(NA_real_)
        value
      }
      values <- vapply(names(expected_values), read_number, numeric(1))
      valid <- all(is.finite(values))
      correct <- valid && all(abs(values - expected_values) <= 0.0005)
      assign("results_10_1_1_combined", list(values = values, expected = expected_values, valid = valid), envir = globalenv())
      correct
    }, TRUE, comparator = function(generated, expected, ...) {
      results <- get("results_10_1_1_combined", envir = globalenv())
      if (isTRUE(generated == expected)) {
        message <- paste(
          "**Bevestiging:** de volledige berekeningsketen is correct: 2.5, −4, 6, 0.5 en 0.504.",
          "**Denkregel:** centreren levert somkwadraten en kruisproductsommen; standaardiseren levert correlaties; controleren voor Z levert de partiële correlatie.",
          "**Transferstap:** benoem bij nieuwe gegevens eerst welke bouwsteen je berekent en pas pas daarna de bijbehorende formule toe.",
          sep = "\n\n"
        )
      } else if (!results$valid) {
        missing_fields <- names(results$expected)[!is.finite(results$values)]
        message <- paste(
          paste0("**Waarschijnlijke redenering:** de volgende antwoorden ontbreken of zijn geen enkel eindig getal: ", paste(missing_fields, collapse = ", "), "."),
          "**Waarom dit niet klopt:** de evaluator heeft voor ieder stadium van de berekeningsketen één numeriek resultaat nodig.",
          "**Denkregel:** vul per lege plaats alleen het eindresultaat van de overeenkomstige genummerde vraag in.",
          "**Volgende stap:** vul alle vijf velden in en controleer de gevraagde afronding bij de twee correlaties.",
          sep = "\n\n"
        )
      } else {
        wrong_field <- names(which(abs(results$values - results$expected) > 0.0005))[[1L]]
        likely <- switch(wrong_field,
          gemiddelde_x = "Je hebt waarschijnlijk de som of het aantal waarnemingen ingevuld in plaats van het gemiddelde.",
          scp_xy = "Je hebt waarschijnlijk de producten zonder hun negatieve teken verwerkt of de afwijkingen opgeteld.",
          variantie_x = "Je hebt waarschijnlijk door n gedeeld in plaats van door n − 1.",
          r_xy = "Je hebt de covariantie waarschijnlijk niet door het product van beide standaarddeviaties gedeeld.",
          r_xy_z = "Je hebt waarschijnlijk alleen de teller berekend of één wortelterm uit de noemer weggelaten.",
          "Je hebt een bouwsteen van de keten verwisseld."
        )
        why <- switch(wrong_field,
          gemiddelde_x = "(1 + 2 + 3 + 4) / 4 = 2.5.",
          scp_xy = "(−1)(2) + 0(0) + 1(−2) = −4.",
          variantie_x = "Een steekproefvariantie gebruikt 18 / (4 − 1) = 6.",
          r_xy = "r_XY = 3 / (2 × 3) = 0.5.",
          r_xy_z = "De standaardformule geeft (0.60 − 0.50 × 0.40) / √[(1 − 0.50²)(1 − 0.40²)] = 0.5040.",
          "Het antwoord hoort niet bij de gevraagde berekeningsstap."
        )
        next_step <- switch(wrong_field,
          gemiddelde_x = "Deel de som 10 door vier.",
          scp_xy = "Schrijf de drie producten met hun teken afzonderlijk uit.",
          variantie_x = "Vervang n − 1 eerst door 3 en deel daarna.",
          r_xy = "Bereken eerst SD_X × SD_Y en deel daarna de covariantie.",
          r_xy_z = "Bereken teller en beide factoren onder de wortel afzonderlijk.",
          "Koppel het veld opnieuw aan de juiste genummerde vraag."
        )
        message <- paste(
          paste0("**Waarschijnlijke redenering:** ", likely),
          paste0("**Waarom dit niet klopt:** ", why),
          "**Denkregel:** controleer per stap zowel de juiste grootheid als de juiste deler, standaardisering en afronding.",
          paste0("**Volgende stap:** ", next_step),
          sep = "\n\n"
        )
      }
      get_reporter()$add_message(message, type = "markdown")
      generated == expected
    })
  })
})
