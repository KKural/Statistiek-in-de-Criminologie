context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          werkuren <- c(24, 36, 35, 28, 24, 28, 24, 36, 32, 36,
                        40, 38, 36, 34, 40, 36, 32, 36, 40, 36)
          posities <- 5:8
          gemiddelde <- mean(werkuren)
          expected_deviations <- round(werkuren[posities] - gemiddelde, 4)
          expected_squared <- round((werkuren[posities] - gemiddelde)^2, 4)
          check_vector <- function(name, expected) {
            if (!exists(name, envir = env)) {
              return(list(ok = FALSE, valid = FALSE, value = numeric(0), expected = expected))
            }
            value <- suppressWarnings(as.numeric(get(name, envir = env)))
            valid <- length(value) == length(expected) && all(is.finite(value))
            list(
              ok = valid && all(abs(value - expected) <= 0.00005),
              valid = valid,
              value = value,
              expected = expected
            )
          }
          results <- list(
            deviations = check_vector("afwijkingen", expected_deviations),
            squared = check_vector("gekwadrateerde_afwijkingen", expected_squared)
          )
          assign("results_3_3d2", results, envir = globalenv())
          all(vapply(results, function(result) isTRUE(result$ok), logical(1)))
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("results_3_3d2", envir = globalenv())
          deviations <- results$deviations
          squared <- results$squared
          if (isTRUE(generated == expected)) {
            message <- paste(
              "**Bevestiging:** de vier afwijkingen en vier gekwadrateerde afwijkingen voor observaties 5 tot en met 8 zijn correct.",
              "**Denkregel:** afwijking = x − gemiddelde; kwadrateer de ongeronde getekende afstand en rond pas het eindresultaat af.",
              "**Transferstap:** pas dezelfde methode toe op een volgend gegevensblok en behoud de oorspronkelijke waarnemingsvolgorde.",
              sep = "\n\n"
            )
          } else {
            if (!deviations$valid || !squared$valid) {
              likely <- "Minstens één vector bevat nog `NA`, tekst of niet precies vier waarden."
              why <- "Elke geselecteerde observatie heeft één afwijking en één kwadraat op dezelfde positie nodig."
              next_step <- "Vul beide vectoren met vier eindige getallen voor het gevraagde observatieblok."
            } else if (all(abs(deviations$value - abs(deviations$expected)) <= 0.00005)) {
              likely <- "Je hebt absolute afstanden gebruikt en tekens onder het gemiddelde verwijderd."
              why <- "Een afwijking is `x - gemiddelde` en kan negatief zijn."
              next_step <- "Herbereken eerst de getekende afwijkingen; pas bij het kwadrateren verdwijnen de tekens."
            } else if (any(squared$value < 0)) {
              likely <- "Je hebt bij minstens één kwadraat een negatief teken behouden."
              why <- "Het kwadraat van een reëel getal is nooit negatief."
              next_step <- "Plaats de volledige ongeronde afwijking tussen haakjes en kwadrateer die waarde."
            } else if (!deviations$ok) {
              pos <- which(abs(deviations$value - deviations$expected) > 0.00005)[1]
              likely <- paste0("De afwijking voor de ", pos, "e geselecteerde observatie gebruikt waarschijnlijk een verkeerd gemiddelde, teken of volgorde.")
              why <- "De ingevulde waarde volgt niet uit de betreffende waarneming min het gemiddelde van alle twintig observaties."
              next_step <- "Bereken het gemiddelde opnieuw uit de volledige reeks en trek het daarna af van deze waarneming."
            } else {
              pos <- which(abs(squared$value - squared$expected) > 0.00005)[1]
              likely <- paste0("Het kwadrateren of afronden wijkt voor het eerst af bij de ", pos, "e geselecteerde observatie.")
              why <- "Het ingevulde kwadraat volgt niet uit de ongeronde afwijking op dezelfde positie."
              next_step <- "Kwadrateer de ongeronde afwijking en rond pas daarna af op vier decimalen."
            }
            message <- paste(
              paste0("**Waarschijnlijke redenering:** ", likely),
              paste0("**Waarom dit niet klopt:** ", why),
              "**Denkregel:** behoud waarnemingsvolgorde en volledige precisie tot het gerapporteerde eindantwoord.",
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

