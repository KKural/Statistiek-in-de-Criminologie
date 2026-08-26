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
            list(ok = valid && all(abs(value - expected) <= tolerance), valid = valid, value = value, expected = expected)
          }
          results <- list(
            frequenties = check_vector("frequenties", c(1, 1, 1, 1), 0),
            percentages = check_vector("percentages", c(9.09, 9.09, 9.09, 9.09), 0.005)
          )
          assign("results_3_4a", results, envir = globalenv())
          all(vapply(results, function(result) isTRUE(result$ok), logical(1)))
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("results_3_4a", envir = globalenv())
          freq <- results$frequenties
          pct <- results$percentages
          if (isTRUE(generated == expected)) {
            message <- paste(
              "**Bevestiging:** de vier frequenties en vier percentages voor dit waardenblok zijn correct.",
              "**Denkregel:** tel voorkomens per waarde en bereken percentage = frequentie / 11 × 100.",
              "**Transferstap:** gebruik dezelfde twee controles voor het volgende blok huwelijksduren.",
              sep = "\n\n"
            )
          } else {
            if (!freq$valid || !pct$valid) {
              likely <- "Minstens één vector bevat nog `NA`, tekst of niet precies vier waarden."
              why <- "Elke waarde in dit blok heeft één frequentie en één percentage nodig."
              next_step <- "Vul beide vectoren met vier eindige getallen in de volgorde 2, 14, 26, 30."
            } else if (all(abs(pct$value - pct$expected / 100) <= 0.00005)) {
              likely <- "Je hebt proporties tussen 0 en 1 ingevuld in plaats van percentages."
              why <- "De opgave vraagt de met 100 vermenigvuldigde vorm zonder procentteken."
              next_step <- "Vermenigvuldig iedere proportie met 100 en rond alleen het eindresultaat af."
            } else if (!freq$ok) {
              values <- c(2, 14, 26, 30)
              pos <- which(freq$value != freq$expected)[1]
              likely <- paste0("De telling van ", values[pos], " dagen wijkt af.")
              why <- "De ingevulde telling stemt niet overeen met alle voorkomens in de ruwe lijst."
              next_step <- paste0("Markeer de voorkomens van ", values[pos], " opnieuw en werk daarna het percentage bij.")
            } else {
              values <- c(2, 14, 26, 30)
              pos <- which(abs(pct$value - pct$expected) > 0.005)[1]
              likely <- paste0("De percentageberekening of afronding voor ", values[pos], " dagen wijkt af.")
              why <- "Het ingevulde percentage volgt niet uit de getelde frequentie met n = 11."
              next_step <- "Deel de frequentie door 11, vermenigvuldig met 100 en rond daarna af op twee decimalen."
            }
            message <- paste(
              paste0("**Waarschijnlijke redenering:** ", likely),
              paste0("**Waarom dit niet klopt:** ", why),
              "**Denkregel:** controleer eerst de telling en zet die daarna om naar een percentage.",
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
