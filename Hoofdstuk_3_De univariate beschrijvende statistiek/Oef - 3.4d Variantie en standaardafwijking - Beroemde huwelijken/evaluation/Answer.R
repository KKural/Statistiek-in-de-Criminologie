context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          expected_values <- c(
            sum_of_squares = 2268540.91,
            variantie = 226854.09,
            standaardafwijking = 476.29
          )
          check_value <- function(name) {
            if (!exists(name, envir = env)) {
              return(list(ok = FALSE, valid = FALSE, value = NA_real_, expected = expected_values[[name]]))
            }
            value <- suppressWarnings(as.numeric(get(name, envir = env)))
            valid <- length(value) == 1L && is.finite(value)
            list(
              ok = valid && abs(value - expected_values[[name]]) <= 0.005,
              valid = valid,
              value = value,
              expected = expected_values[[name]]
            )
          }
          results <- lapply(names(expected_values), check_value)
          names(results) <- names(expected_values)
          assign("results_3_4d", results, envir = globalenv())
          all(vapply(results, function(result) isTRUE(result$ok), logical(1)))
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("results_3_4d", envir = globalenv())
          if (isTRUE(generated == expected)) {
            message <- paste(
              "**Bevestiging:** SS = 2268540.91, de steekproefvariantie = 226854.09 en de standaardafwijking = 476.29 zijn correct.",
              "**Denkregel:** bereken SS uit ongeronde afwijkingen, deel voor een steekproef door n − 1 en neem daarna de vierkantswortel.",
              "**Transferstap:** herbereken de drie maten voor dezelfde data zonder de meest extreme waarde en vergelijk hoeveel elke spreidingsmaat daalt.",
              sep = "\n\n"
            )
          } else {
            wrong_name <- names(results)[!vapply(results, function(result) isTRUE(result$ok), logical(1))][1]
            result <- results[[wrong_name]]
            if (!result$valid) {
              likely <- paste0("`", wrong_name, "` is nog niet als één eindig getal ingevuld.")
              why <- "Een ontbrekend of niet-numeriek antwoord kan niet door de formuleketen worden gecontroleerd."
              next_step <- paste0("Bereken `", wrong_name, "` opnieuw en vervang de `NA`.")
            } else if (wrong_name == "sum_of_squares" && abs(result$value - 2268540.92) <= 0.005) {
              likely <- "Je hebt de afzonderlijk afgeronde kwadraten uit een weergavetabel opgeteld."
              why <- "De som moet uit de ongeronde afwijkingen komen; optellen na rijgewijze afronding verandert het eindresultaat."
              next_step <- "Bereken `sum((huwelijksduren - mean(huwelijksduren))^2)` met volledige precisie en rond alleen die som af."
            } else if (wrong_name == "sum_of_squares" && abs(result$value - 2268540.93) <= 0.005) {
              likely <- "Je hebt het eerder gebruikte afgeronde gemiddelde en afgeronde afwijkingen door de hele berekening meegenomen."
              why <- "Tussentijds afronden stapelt fout op en levert niet de SS uit de oorspronkelijke data."
              next_step <- "Start opnieuw bij het exacte gemiddelde en behoud alle decimalen tot het eindantwoord."
            } else if (wrong_name == "variantie" && abs(result$value - 206230.99) < 0.1) {
              likely <- "Je hebt door n = 11 gedeeld en zo een populatievariantie berekend."
              why <- "De elf koppels vormen een steekproef, dus de noemer is n − 1 = 10."
              next_step <- "Deel de ongeronde som van kwadraten door 10."
            } else if (wrong_name == "standaardafwijking" && abs(result$value - results$variantie$value) < 0.01) {
              likely <- "Je hebt de variantie opnieuw ingevuld zonder de vierkantswortel te nemen."
              why <- "De standaardafwijking is de positieve wortel van de variantie en staat in dagen."
              next_step <- "Neem de vierkantswortel van de ongeronde steekproefvariantie."
            } else {
              likely <- paste0("Een formule- of afrondingskeuze werkt door in `", wrong_name, "`.")
              why <- "De ingevulde waarde volgt niet uit de ruwe data en de volledige formuleketen met ongeronde tussenwaarden."
              next_step <- "Volg de keten ruwe data → exact gemiddelde → exacte afwijkingen → SS → delen door 10 → wortel, en rond alleen eindantwoorden af."
            }
            message <- paste(
              paste0("**Waarschijnlijke redenering:** ", likely),
              paste0("**Waarom dit niet klopt:** ", why),
              "**Denkregel:** afronden is rapporteren, niet opnieuw definiëren wat in de volgende formule wordt gebruikt.",
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
