context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          check_vector <- function(name, expected, tolerance) {
            if (!exists(name, envir = env)) {
              return(list(ok = FALSE, valid = FALSE, value = numeric(0), expected = expected))
            }
            value <- suppressWarnings(as.numeric(get(name, envir = env)))
            valid <- length(value) == length(expected) && all(is.finite(value))
            list(
              ok = valid && all(abs(value - expected) <= tolerance),
              valid = valid,
              value = value,
              expected = expected
            )
          }
          results <- list(
            frequenties = check_vector("frequenties", c(1, 7, 1, 3), 0),
            percentages = check_vector("percentages", c(5, 35, 5, 15), 0.005)
          )
          assign("results_3_3a2", results, envir = globalenv())
          all(vapply(results, function(result) isTRUE(result$ok), logical(1)))
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("results_3_3a2", envir = globalenv())
          freq <- results$frequenties
          pct <- results$percentages
          if (isTRUE(generated == expected)) {
            message <- paste(
              "**Bevestiging:** de vier frequenties en vier percentages voor dit waardenblok zijn correct.",
              "**Denkregel:** tel eerst per unieke waarde en bereken daarna percentage = frequentie / n × 100.",
              "**Transferstap:** pas dezelfde telling en omzetting toe op vier andere waarden uit een nieuwe werkurenreeks.",
              sep = "\n\n"
            )
          } else {
            if (!freq$valid || !pct$valid) {
              likely <- "Minstens één vector bevat nog `NA`, tekst of niet precies vier waarden."
              why <- "Elke waarde in dit blok moet één frequentie en één percentage krijgen."
              next_step <- "Vul beide vectoren met vier eindige getallen in de volgorde 35, 36, 38, 40."
            } else if (all(abs(pct$value - pct$expected / 100) <= 0.00005)) {
              likely <- "Je hebt proporties tussen 0 en 1 ingevuld in plaats van percentages."
              why <- "De gevraagde percentages zijn de proporties vermenigvuldigd met 100."
              next_step <- "Vermenigvuldig iedere proportie met 100 en laat het procentteken weg."
            } else if (!freq$ok) {
              values <- c(35, 36, 38, 40)
              pos <- which(freq$value != freq$expected)[1]
              likely <- paste0("De telling voor ", values[pos], " uur wijkt af.")
              why <- "De ingevulde telling stemt niet overeen met alle voorkomens in de ruwe lijst."
              next_step <- paste0("Markeer alleen de voorkomens van ", values[pos], " en bereken daarna het bijbehorende percentage opnieuw.")
            } else {
              values <- c(35, 36, 38, 40)
              pos <- which(abs(pct$value - pct$expected) > 0.005)[1]
              likely <- paste0("De percentageberekening of afronding voor ", values[pos], " uur wijkt af.")
              why <- "Het ingevulde percentage volgt niet uit de getelde frequentie met n = 20."
              next_step <- "Gebruik frequentie / 20 × 100 en rond alleen het eindresultaat af."
            }
            message <- paste(
              paste0("**Waarschijnlijke redenering:** ", likely),
              paste0("**Waarom dit niet klopt:** ", why),
              "**Denkregel:** controleer de telling in de ruwe lijst en zet pas daarna om naar een percentage.",
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
