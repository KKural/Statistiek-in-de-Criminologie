context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          expected_values <- c(0.1000, 0.2545, 0.3091, 0.1909, 0.1455)
          if (!exists("relatieve_frequenties", envir = env)) {
            result <- list(ok = FALSE, valid = FALSE, value = numeric(0), expected = expected_values)
          } else {
            value <- suppressWarnings(as.numeric(get("relatieve_frequenties", envir = env)))
            valid <- length(value) == 5L && all(is.finite(value))
            result <- list(
              ok = valid && all(abs(value - expected_values) <= 0.00005),
              valid = valid,
              value = value,
              expected = expected_values
            )
          }
          assign("results_3_2b", result, envir = globalenv())
          isTRUE(result$ok)
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          result <- get("results_3_2b", envir = globalenv())
          if (isTRUE(generated == expected)) {
            message <- paste(
              "**Bevestiging:** de vijf relatieve frequenties zijn correct en tellen door afronding op tot ongeveer 1.",
              "**Denkregel:** relatieve frequentie = absolute frequentie / N; gebruik voor iedere categorie dezelfde noemer.",
              "**Transferstap:** zet een nieuwe frequentietabel om naar proporties en controleer of hun som, op afronding na, gelijk is aan 1.",
              sep = "\n\n"
            )
          } else {
            if (!result$valid) {
              likely <- "Je vector bevat waarschijnlijk nog een `NA`, tekst of niet precies vijf waarden."
              why <- "De evaluator moet één eindige proportie per categorie kunnen koppelen."
              next_step <- "Vul vijf numerieke waarden tussen 0 en 1 in, in de tabelvolgorde."
            } else if (all(abs(result$value - 100 * result$expected) <= 0.005)) {
              likely <- "Je hebt percentages ingevuld in plaats van proporties."
              why <- "Deze oefening vraagt waarden tussen 0 en 1; een percentage moet nog door 100 worden gedeeld."
              next_step <- "Deel iedere ingevulde percentagewaarde door 100."
            } else {
              first_wrong <- which(abs(result$value - result$expected) > 0.00005)[1]
              labels <- c("zeer ontevreden", "ontevreden", "noch tevreden, noch ontevreden", "tevreden", "zeer tevreden")
              likely <- paste0("De deling of afronding wijkt voor het eerst af bij `", labels[first_wrong], "`.")
              why <- paste0("Voor die categorie is de proportie ", format(result$expected[first_wrong], nsmall = 4), ".")
              next_step <- "Bereken eerst N uit alle absolute frequenties en deel daarna de betrokken frequentie door precies datzelfde N."
            }
            message <- paste(
              paste0("**Waarschijnlijke redenering:** ", likely),
              paste0("**Waarom dit niet klopt:** ", why),
              "**Denkregel:** een proportie gebruikt de totale steekproef als noemer en ligt tussen 0 en 1.",
              paste0("**Volgende stap:** ", next_step),
              sep = "\n\n"
            )
          }
          get_reporter()$add_message(message, type = "markdown")
          generated == expected
        }
      )
    }
  )
})
