context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          check_numeric <- function(name, expected, tolerance = 0) {
            if (!exists(name, envir = env)) {
              return(list(ok = FALSE, valid = FALSE, value = numeric(0), expected = expected))
            }
            value <- suppressWarnings(as.numeric(get(name, envir = env)))
            valid <- length(value) == length(expected) && all(is.finite(value))
            ok <- valid && all(abs(value - expected) <= tolerance)
            list(ok = ok, valid = valid, value = value, expected = expected)
          }

          results <- list(
            cumulatief = check_numeric(
              "cumulatieve_absolute_frequenties",
              c(33, 117, 219, 282, 330)
            ),
            totaal = check_numeric("totaal_n", 330)
          )
          assign("results_3_2a", results, envir = globalenv())
          all(vapply(results, function(result) isTRUE(result$ok), logical(1)))
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("results_3_2a", envir = globalenv())

          if (isTRUE(generated == expected)) {
            message <- paste(
              "**Bevestiging:** alle cumulatieve absolute frequenties zijn correct: 33, 117, 219, 282 en 330; het totaal is 330.",
              "**Denkregel:** begin bij de eerste absolute frequentie en tel bij iedere volgende rij de nieuwe frequentie op bij het vorige cumulatieve totaal.",
              "**Transferstap:** bouw op dezelfde manier een cumulatieve kolom voor een nieuwe geordende tevredenheidsschaal en controleer of de laatste waarde gelijk is aan N.",
              sep = "\n\n"
            )
          } else {
            cum <- results$cumulatief
            totaal <- results$totaal
            if (!cum$valid) {
              likely <- "Je hebt waarschijnlijk nog niet alle vijf posities ingevuld of er staat nog een `NA`/niet-numerieke waarde in de vector."
              why <- "Zonder vijf eindige getallen kan iedere categorie niet afzonderlijk worden gecontroleerd."
              next_step <- "Vul precies vijf waarden in, in de categorievolgorde uit de tabel."
            } else if (identical(as.numeric(cum$value), c(33, 84, 102, 63, 48))) {
              likely <- "Je hebt de gewone absolute frequenties overgenomen in plaats van ze op te tellen."
              why <- "Een cumulatieve frequentie bevat ook alle eerdere categorieën; alleen de eerste rij is gelijk aan de gewone frequentie."
              next_step <- "Laat de eerste waarde staan en bereken elke volgende waarde als vorig cumulatief totaal plus de nieuwe frequentie."
            } else if (cum$ok && !totaal$ok) {
              likely <- "Je cumulatieve kolom is correct, maar je hebt voor N niet het eindtotaal van alle categorieën gebruikt."
              why <- paste0("Het totale aantal respondenten is 330, niet ", totaal$value, ".")
              next_step <- "Neem de laatste cumulatieve absolute frequentie over als N."
            } else {
              first_wrong <- which(abs(cum$value - cum$expected) > 0)[1]
              labels <- c("zeer ontevreden", "ontevreden", "noch tevreden, noch ontevreden", "tevreden", "zeer tevreden")
              likely <- paste0("De optelling loopt voor het eerst mis bij `", labels[first_wrong], "`.")
              why <- paste0("Op die positie hoort het lopende totaal ", cum$expected[first_wrong], " te zijn, niet ", cum$value[first_wrong], ".")
              next_step <- paste0("Tel opnieuw vanaf de vorige rij en controleer daarna alle rijen vanaf positie ", first_wrong, ".")
            }
            if (!totaal$ok && !cum$ok) {
              next_step <- paste0(next_step, " Controleer ook N door alle vijf absolute frequenties één keer op te tellen.")
            }
            message <- paste(
              paste0("**Waarschijnlijke redenering:** ", likely),
              paste0("**Waarom dit niet klopt:** ", why),
              "**Denkregel:** cumulatief betekent een lopend totaal; de laatste cumulatieve absolute frequentie moet exact gelijk zijn aan N.",
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
