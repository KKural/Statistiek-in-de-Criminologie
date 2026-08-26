context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          durations <- c(240, 144, 143, 72, 30, 26, 2, 150, 14, 150, 1657)
          positions <- 9:11
          exact_mean <- sum(durations) / length(durations)
          expected_deviations <- round(durations[positions] - exact_mean, 2)
          expected_squared <- round((durations[positions] - exact_mean)^2, 2)
          check_vector <- function(name, expected) {
            if (!exists(name, envir = env)) {
              return(list(ok = FALSE, valid = FALSE, value = numeric(0), expected = expected))
            }
            value <- suppressWarnings(as.numeric(get(name, envir = env)))
            valid <- length(value) == length(expected) && all(is.finite(value))
            list(ok = valid && all(abs(value - expected) <= 0.005), valid = valid, value = value, expected = expected)
          }
          results <- list(
            deviations = check_vector("afwijkingen", expected_deviations),
            squared = check_vector("gekwadrateerde_afwijkingen", expected_squared)
          )
          assign("results_3_4c3", results, envir = globalenv())
          all(vapply(results, function(result) isTRUE(result$ok), logical(1)))
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("results_3_4c3", envir = globalenv())
          deviations <- results$deviations
          squared <- results$squared
          if (isTRUE(generated == expected)) {
            message <- paste(
              "**Bevestiging:** de drie afwijkingen en drie kwadraten voor observaties 9 tot en met 11 zijn correct berekend met het exacte gemiddelde 2628/11 en ongeronde tussenwaarden.",
              "**Denkregel:** bereken met volledige precisie en rond alleen gerapporteerde eindwaarden.",
              "**Transferstap:** gebruik dezelfde precisieregel wanneer een extreem hoge waarneming in een ander gegevensblok voorkomt.",
              sep = "\n\n"
            )
          } else {
            if (!deviations$valid || !squared$valid) {
              likely <- "Minstens één vector bevat nog `NA`, tekst of niet precies drie waarden."
              why <- "Elke geselecteerde huwelijksduur heeft één afwijking en één kwadraat op dezelfde positie nodig."
              next_step <- "Vul beide vectoren met drie eindige getallen voor het gevraagde observatieblok."
            } else if (all(abs(squared$value - round(deviations$value^2, 2)) <= 0.005) && !squared$ok) {
              likely <- "Je hebt de eerst op twee decimalen afgeronde afwijkingen gekwadrateerd."
              why <- "Daardoor stapelt afrondingsfout zich op; kwadraten moeten uit de ongeronde afwijkingen komen."
              next_step <- "Bewaar het exacte gemiddelde en de ongeronde afwijkingen en rond alleen de uiteindelijk ingediende waarden af."
            } else if (any(squared$value < 0)) {
              likely <- "Je hebt bij minstens één kwadraat een negatief teken behouden."
              why <- "Een gekwadrateerde afwijking kan nooit negatief zijn."
              next_step <- "Plaats de volledige ongeronde afwijking tussen haakjes en kwadrateer die waarde."
            } else if (!deviations$ok) {
              pos <- which(abs(deviations$value - deviations$expected) > 0.005)[1]
              likely <- paste0("De afwijking voor de ", pos, "e geselecteerde observatie gebruikt waarschijnlijk een afgerond gemiddelde of een andere volgorde.")
              why <- "De ingevulde waarde volgt niet uit de betreffende waarneming min het exacte gemiddelde van alle elf observaties."
              next_step <- "Bereken het gemiddelde als som gedeeld door 11 en trek het zonder tussentijdse afronding af."
            } else {
              pos <- which(abs(squared$value - squared$expected) > 0.005)[1]
              likely <- paste0("Het kwadrateren of afronden wijkt voor het eerst af bij de ", pos, "e geselecteerde observatie.")
              why <- "Het ingevulde kwadraat volgt niet uit de ongeronde afwijking op dezelfde positie."
              next_step <- "Kwadrateer de ongeronde afwijking en rond alleen het eindresultaat af op twee decimalen."
            }
            message <- paste(
              paste0("**Waarschijnlijke redenering:** ", likely),
              paste0("**Waarom dit niet klopt:** ", why),
              "**Denkregel:** ongeronde tussenwaarden blijven het vertrekpunt voor iedere vervolgformule.",
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

