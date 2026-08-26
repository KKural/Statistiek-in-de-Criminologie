context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          expected_values <- c(
            gemiddelde = 238.91, mediaan = 143, modus = 150,
            variatiebreedte = 1655, q1 = 26, q3 = 150, ika = 124
          )
          tolerances <- c(0.005, 0, 0, 0, 0, 0, 0)
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
          assign("results_3_4b", results, envir = globalenv())
          all(vapply(results, function(result) isTRUE(result$ok), logical(1)))
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("results_3_4b", envir = globalenv())
          if (isTRUE(generated == expected)) {
            message <- paste(
              "**Bevestiging:** alle zeven centrum- en spreidingsmaten zijn correct volgens de opgegeven Tukey-hinges.",
              "**Denkregel:** sorteer voor mediaan en kwartielen; gebruik alle waarden voor het gemiddelde en de uitersten voor de variatiebreedte.",
              "**Transferstap:** verwijder in gedachten de meest extreme waarneming en voorspel welke maten sterk en welke nauwelijks zouden veranderen.",
              sep = "\n\n"
            )
          } else {
            wrong_name <- names(results)[!vapply(results, function(result) isTRUE(result$ok), logical(1))][1]
            result <- results[[wrong_name]]
            if (!result$valid) {
              likely <- paste0("`", wrong_name, "` is nog niet als één eindig getal ingevuld.")
              why <- "Een ontbrekend of niet-numeriek antwoord kan niet worden beoordeeld."
              next_step <- paste0("Bereken `", wrong_name, "` uit de elf ruwe waarden en vervang de `NA`.")
            } else if (wrong_name == "gemiddelde" && abs(result$value - 143) < 0.001) {
              likely <- "Je hebt de mediaan ingevuld als gemiddelde."
              why <- "Het gemiddelde gebruikt de som van alle elf waarden en reageert daardoor sterk op een zeer hoge waarneming."
              next_step <- "Tel alle waarden, inclusief de grootste, op en deel door 11."
            } else if (wrong_name %in% c("q1", "q3")) {
              likely <- "Je hebt waarschijnlijk een andere kwartielconventie of de algemene mediaan in een helft meegenomen."
              why <- "Deze oefening vraagt Tukey-hinges waarbij de algemene mediaan buiten beide helften blijft."
              next_step <- "Sorteer de data, verwijder de zesde waarde voor het splitsen en neem de mediaan van elke helft van vijf."
            } else if (wrong_name == "ika") {
              likely <- "Je hebt mogelijk de variatiebreedte gebruikt of Q1 en Q3 in de verkeerde volgorde afgetrokken."
              why <- "IKA gebruikt het verschil Q3 − Q1; de uiterste waarden horen alleen bij de variatiebreedte."
              next_step <- "Trek het eerste kwartiel af van het derde kwartiel."
            } else {
              likely <- paste0("De definitie of sortering voor `", wrong_name, "` is niet consequent toegepast.")
              why <- "De ingevulde waarde volgt niet uit de definitie van deze statistiek toegepast op alle elf waarnemingen."
              next_step <- "Schrijf de definitie van de maat uit en voer de berekening opnieuw uit op de volledige lijst."
            }
            message <- paste(
              paste0("**Waarschijnlijke redenering:** ", likely),
              paste0("**Waarom dit niet klopt:** ", why),
              "**Denkregel:** verschillende statistieken gebruiken verschillende delen van de data; houd hun definities en de kwartielconventie uit elkaar.",
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
