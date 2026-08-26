context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          expected_values <- c(
            percentage_mannen = 61.50,
            percentage_vrouwen = 38.50,
            percentage_yes = 25.00,
            percentage_no = 75.00,
            percentage_yes_bij_mannen = 30.89,
            percentage_yes_bij_vrouwen = 15.58,
            percentageverschil_yes = 15.31
          )

          results <- lapply(names(expected_values), function(name) {
            present <- exists(name, envir = env, inherits = FALSE)
            raw <- if (present) get(name, envir = env, inherits = FALSE) else NA
            value <- suppressWarnings(as.numeric(raw))
            valid <- length(value) == 1L && !is.na(value) && is.finite(value)
            list(
              exists = present,
              value = raw,
              correct = valid && abs(value - expected_values[[name]]) <= 0.0051
            )
          })
          names(results) <- names(expected_values)
          assign("detailed_results", results, envir = globalenv())
          all(vapply(results, function(item) item$correct, logical(1)))
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("detailed_results", envir = globalenv())
          labels <- c(
            percentage_mannen = "marginaal percentage mannen",
            percentage_vrouwen = "marginaal percentage vrouwen",
            percentage_yes = "marginaal percentage YES",
            percentage_no = "marginaal percentage NO",
            percentage_yes_bij_mannen = "YES binnen mannen",
            percentage_yes_bij_vrouwen = "YES binnen vrouwen",
            percentageverschil_yes = "verschil in procentpunten"
          )

          if (isTRUE(generated == expected)) {
            feedback <- paste(
              "**Bevestiging:** alle zeven percentages zijn correct. De marginale percentages zijn 61.50%, 38.50%, 25.00% en 75.00%; de conditionele YES-percentages zijn 30.89% en 15.58%, met een verschil van 15.31 procentpunten.",
              "**Denkregel:** een marginaal percentage gebruikt de volledige steekproef als noemer; een conditioneel percentage gebruikt het totaal van de groep achter de voorwaarde.",
              "**Transferstap:** pas dezelfde noemercontrole toe op een nieuwe kruistabel en formuleer vóór elke deling expliciet welke groep 100% vormt.",
              sep = "\n\n"
            )
          } else {
            wrong <- names(results)[!vapply(results, function(item) item$correct, logical(1))]
            missing <- wrong[!vapply(results[wrong], function(item) item$exists, logical(1))]
            status <- paste(labels[wrong], collapse = ", ")
            missing_text <- if (length(missing)) {
              paste0(" Ontbrekende velden: ", paste(labels[missing], collapse = ", "), ".")
            } else {
              ""
            }
            feedback <- paste(
              paste0("**Waarschijnlijke redenering:** bij ", status, " is vermoedelijk een rij-, kolom- of totaaltelling als verkeerde noemer gebruikt. Dit is een hypothese op basis van de afwijkende velden."),
              paste0("**Waarom dit niet klopt:** de noemer bepaalt de betekenis van een percentage. Marginale en conditionele percentages beantwoorden verschillende vragen.", missing_text),
              "**Denkregel:** schrijf vóór elke breuk in woorden: ‘aantal in de gevraagde categorie / totaal van de groep die 100% vormt’. Trek pas daarna de twee conditionele percentages van elkaar af.",
              "**Volgende stap:** controleer eerst het eerste afwijkende veld, markeer in de tabel de teller en de juiste noemer en dien vervolgens opnieuw in.",
              sep = "\n\n"
            )
          }

          get_reporter()$add_message(feedback, type = "markdown")
          generated == expected
        }
      )
    }
  )
})
