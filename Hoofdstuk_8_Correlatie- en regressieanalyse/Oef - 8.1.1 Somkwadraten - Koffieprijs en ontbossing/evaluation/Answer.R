context({
  testcase("", {
    testEqual("", function(env) {
      expected_values <- c(kruisproductsom = 4, steekproefcovariantie = 2, pearson_r = 1, interpretatie = 1)
      tolerances <- c(kruisproductsom = 0.0005, steekproefcovariantie = 0.0005, pearson_r = 0.0005, interpretatie = 0)

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
        "results_8_1_grouped",
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
      results <- get("results_8_1_grouped", envir = globalenv())

      if (isTRUE(generated == expected)) {
        message <- paste(
          "**Bevestiging:** de kruisproductsom is 4, de steekproefcovariantie is 2, Pearson's r is 1 en optie 1 herkent het perfect positieve lineaire verband.",
          "**Denkregel:** bouw Pearson's r in volgorde op: gepaarde afwijkingsproducten, covariantie en standaardisering door sX × sY.",
          "**Transferstap:** herhaal de keten met één tegengesteld getekend afwijkingspaar en voorspel vooraf hoe het teken van r verandert.",
          sep = "\n\n"
        )
      } else if (!all(results$valid)) {
        missing_fields <- names(results$valid)[!results$valid]
        message <- paste(
          paste0("**Waarschijnlijke redenering:** er ontbreekt een geldige numerieke invoer voor: ", paste(missing_fields, collapse = ", "), "."),
          "**Waarom dit niet klopt:** elke genummerde deelvraag heeft precies één getal of optienummer nodig; zonder alle antwoorden kan de volledige redenering niet worden beoordeeld.",
          "**Denkregel:** bouw Pearson's r in volgorde op: gepaarde afwijkingsproducten, covariantie en standaardisering door sX × sY.",
          paste0("**Volgende stap:** vul eerst alleen de lege velden ", paste(missing_fields, collapse = ", "), " in en dien opnieuw in."),
          sep = "\n\n"
        )
      } else {
        wrong_field <- names(results$correct_fields)[!results$correct_fields][[1L]]
        likely <- switch(
          wrong_field,
          kruisproductsom = { value <- results$values[[wrong_field]]; if (abs(value + 4) <= 0.0005) "je hebt het teken van één of meer gepaarde producten omgekeerd." else if (abs(value) <= 0.0005) "je hebt de afwijkingen afzonderlijk opgeteld in plaats van hun gepaarde producten." else "je hebt de producten niet per observatie gevormd." },
          steekproefcovariantie = { value <- results$values[[wrong_field]]; if (abs(value - 4) <= 0.0005) "je hebt de kruisproductsom overgenomen zonder door n - 1 te delen." else if (abs(value - 1.3333) <= 0.005) "je hebt voor de steekproefcovariantie door n gedeeld." else "je hebt een verkeerde noemer gebruikt." },
          pearson_r = { value <- results$values[[wrong_field]]; if (abs(value - 2) <= 0.0005) "je hebt de covariantie niet gestandaardiseerd." else "je hebt niet door het product van beide standaardafwijkingen gedeeld." },
          interpretatie = { value <- results$values[[wrong_field]]; if (value == 4) "je ziet de positieve richting maar onderschat dat alle punten exact op één stijgende lijn liggen." else if (value == 3) "je hebt het teken van de gepaarde afwijkingen omgekeerd." else "je hebt r = 1 geïnterpreteerd als afwezigheid van samenhang." }
        )
        why <- switch(
          wrong_field,
          kruisproductsom = "(-1)(-2) + 0×0 + 1×2 = 2 + 0 + 2 = 4.",
          steekproefcovariantie = "bij n = 3 is de steekproefnoemer n - 1 = 2, zodat 4 / 2 = 2.",
          pearson_r = "r = cov(X,Y) / (sX sY) = 2 / (1 × 2) = 1 en moet binnen [-1,+1] liggen.",
          interpretatie = "r = 1 is de bovengrens van Pearson's r en betekent een perfect positief lineair verband."
        )
        next_step <- switch(
          wrong_field,
          kruisproductsom = "maak één product per rij en tel die drie producten met hun teken op.",
          steekproefcovariantie = "schrijf vóór het delen expliciet of het om een steekproef- of populatiecovariantie gaat.",
          pearson_r = "deel de covariantie door 1 × 2 en controleer het resultaat aan het bereik van r.",
          interpretatie = "koppel eerst het teken aan de richting en daarna |r| = 1 aan perfectie."
        )
        message <- paste(
          paste0("**Waarschijnlijke redenering:** ", likely),
          paste0("**Waarom dit niet klopt:** ", why),
          "**Denkregel:** bouw Pearson's r in volgorde op: gepaarde afwijkingsproducten, covariantie en standaardisering door sX × sY.",
          paste0("**Volgende stap:** ", next_step),
          sep = "\n\n"
        )
      }

      get_reporter()$add_message(message, type = "markdown")
      generated == expected
    })
  })
})
