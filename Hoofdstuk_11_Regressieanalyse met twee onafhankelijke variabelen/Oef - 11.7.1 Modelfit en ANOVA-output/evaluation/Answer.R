context({
  testcase("", {
    testEqual("", function(env) {
      expected_values <- c(modelconclusie = 1, voorspelling = 16)
      read_number <- function(name) {
        if (!exists(name, envir = env)) return(NA_real_)
        value <- suppressWarnings(as.numeric(get(name, envir = env)))
        if (length(value) != 1L || !is.finite(value)) return(NA_real_)
        value
      }
      values <- vapply(names(expected_values), read_number, numeric(1))
      valid <- all(is.finite(values))
      correct <- valid && all(abs(values - expected_values) <= 0.0005)
      assign("results_11_7_1_combined", list(values = values, expected = expected_values, valid = valid), envir = globalenv())
      correct
    }, TRUE, comparator = function(generated, expected, ...) {
      results <- get("results_11_7_1_combined", envir = globalenv())
      if (isTRUE(generated == expected)) {
        message <- paste(
          "**Bevestiging:** je interpreteert de globale F-toets correct en gebruikt de volledige regressievergelijking voor de voorspelling.",
          "**Denkregel:** de globale F-toets vergelijkt het predictormodel met het nulmodel; een voorspelling telt het intercept en alle coëfficiënt×predictor-bijdragen op.",
          "**Transferstap:** scheid ook bij nieuwe output eerst de conclusie over het volledige model van de berekening voor een individuele observatie.",
          sep = "\n\n"
        )
      } else if (!results$valid) {
        missing_fields <- names(results$expected)[!is.finite(results$values)]
        message <- paste(
          paste0("**Waarschijnlijke redenering:** de volgende antwoorden ontbreken of zijn geen enkel eindig getal: ", paste(missing_fields, collapse = ", "), "."),
          "**Waarom dit niet klopt:** de eerste lege plaats verwacht een antwoordcode en de tweede een numerieke voorspelling.",
          "**Denkregel:** gebruik per lege plaats precies één eindige numerieke waarde.",
          "**Volgende stap:** vul beide velden in en controleer de modelconclusie en voorspelling afzonderlijk.",
          sep = "\n\n"
        )
      } else {
        wrong_field <- names(which(abs(results$values - results$expected) > 0.0005))[[1L]]
        likely <- switch(wrong_field,
          modelconclusie = "Je hebt de globale F-toets waarschijnlijk als bewijs over elke afzonderlijke coëfficiënt of over een regressieassumptie gelezen.",
          voorspelling = "Je hebt waarschijnlijk het intercept of een product van coëfficiënt en predictor weggelaten.",
          "Je hebt een onderdeel van de regressie-output verwisseld."
        )
        why <- switch(wrong_field,
          modelconclusie = "F = 12.4 met p < 0.001 betekent dat het volledige model significant meer variantie verklaart dan het nulmodel; dat is code 1.",
          voorspelling = "De volledige berekening is 5 + 2(1) + 3(3) = 16.",
          "Het antwoord volgt niet uit de genoemde output."
        )
        next_step <- switch(wrong_field,
          modelconclusie = "Formuleer eerst welke twee modellen de globale F-toets vergelijkt.",
          voorspelling = "Vul beide predictorwaarden in hun eigen term in en tel het intercept eenmaal op.",
          "Lees de bijbehorende genummerde vraag opnieuw."
        )
        message <- paste(
          paste0("**Waarschijnlijke redenering:** ", likely),
          paste0("**Waarom dit niet klopt:** ", why),
          "**Denkregel:** een globale modeltoets en een voorspelling beantwoorden twee verschillende regressievragen.",
          paste0("**Volgende stap:** ", next_step),
          sep = "\n\n"
        )
      }
      get_reporter()$add_message(message, type = "markdown")
      generated == expected
    })
  })
})
