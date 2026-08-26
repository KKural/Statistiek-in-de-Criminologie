context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          expected_values <- c(
            sum_of_squares = 528.95,
            variantie = 27.8395,
            standaardafwijking = 5.2763,
            variatiecoefficient = 0.1573
          )
          tolerances <- c(0.005, 0.00005, 0.00005, 0.00005)
          check_value <- function(name, tolerance) {
            if (!exists(name, envir = env)) {
              return(list(ok = FALSE, valid = FALSE, value = NA_real_, expected = expected_values[[name]]))
            }
            value <- suppressWarnings(as.numeric(get(name, envir = env)))
            valid <- length(value) == 1L && is.finite(value)
            list(
              ok = valid && abs(value - expected_values[[name]]) <= tolerance,
              valid = valid,
              value = value,
              expected = expected_values[[name]]
            )
          }
          results <- Map(check_value, names(expected_values), tolerances)
          names(results) <- names(expected_values)
          assign("results_3_3e", results, envir = globalenv())
          all(vapply(results, function(result) isTRUE(result$ok), logical(1)))
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("results_3_3e", envir = globalenv())
          if (isTRUE(generated == expected)) {
            message <- paste(
              "**Bevestiging:** som van kwadraten, steekproefvariantie, standaardafwijking en variatiecoëfficiënt zijn correct.",
              "**Denkregel:** SS wordt gedeeld door n − 1 voor een steekproef; SD is de wortel van variantie en CV is SD gedeeld door het gemiddelde.",
              "**Transferstap:** bereken dezelfde vier maten voor een nieuwe steekproef en leg de variatiecoëfficiënt uit als spreiding relatief aan het gemiddelde.",
              sep = "\n\n"
            )
          } else {
            wrong_name <- names(results)[!vapply(results, function(result) isTRUE(result$ok), logical(1))][1]
            result <- results[[wrong_name]]
            if (!result$valid) {
              likely <- paste0("`", wrong_name, "` is nog niet als één eindig getal ingevuld.")
              why <- "De berekeningsketen kan alleen met een numeriek eindantwoord worden gecontroleerd."
              next_step <- paste0("Bereken `", wrong_name, "` en vervang de geldige `NA` door dat getal.")
            } else if (wrong_name == "variantie" && abs(result$value - 26.4475) < 0.01) {
              likely <- "Je hebt SS door n gedeeld en zo de populatievariantie berekend."
              why <- "De twintig deelnemers vormen een steekproef; daarom is de noemer n − 1."
              next_step <- "Deel de som van kwadraten door 19 en rond pas het eindresultaat af."
            } else if (wrong_name == "standaardafwijking" && abs(result$value - results$variantie$value) < 0.001) {
              likely <- "Je hebt de variantie opnieuw ingevuld zonder de vierkantswortel te nemen."
              why <- "Standaardafwijking staat terug in de oorspronkelijke eenheid en is `sqrt(variantie)`."
              next_step <- "Neem de positieve vierkantswortel van de ongeronde steekproefvariantie."
            } else if (wrong_name == "variatiecoefficient" && abs(result$value - 15.73) < 0.01) {
              likely <- "Je hebt de variatiecoëfficiënt als percentage genoteerd."
              why <- "Deze oefening vraagt de verhouding, niet de met 100 vermenigvuldigde percentagevorm."
              next_step <- "Deel je percentageantwoord door 100."
            } else {
              likely <- paste0("Een eerdere formule of afronding werkt door in `", wrong_name, "`.")
              why <- "De ingevulde waarde volgt niet uit de volledige formuleketen met ongeronde tussenwaarden."
              next_step <- "Herstart bij de som van de ongeronde gekwadrateerde afwijkingen en volg de formuleketen zonder tussentijds af te ronden."
            }
            message <- paste(
              paste0("**Waarschijnlijke redenering:** ", likely),
              paste0("**Waarom dit niet klopt:** ", why),
              "**Denkregel:** SS → delen door n − 1 → wortel → delen door gemiddelde; behoud volledige precisie tussen de pijlen.",
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
