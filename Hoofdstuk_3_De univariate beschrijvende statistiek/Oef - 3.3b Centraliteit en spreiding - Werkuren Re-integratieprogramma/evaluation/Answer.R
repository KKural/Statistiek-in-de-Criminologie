context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          expected_values <- c(
            modus = 36, mediaan = 36, gemiddelde = 33.55,
            variatiebreedte = 16, q1 = 30, q3 = 36, ika = 6
          )
          tolerances <- c(
            modus = 0, mediaan = 0, gemiddelde = 0.005,
            variatiebreedte = 0, q1 = 0, q3 = 0, ika = 0
          )
          check_value <- function(name) {
            if (!exists(name, envir = env)) {
              return(list(ok = FALSE, valid = FALSE, value = NA_real_, expected = expected_values[[name]]))
            }
            value <- suppressWarnings(as.numeric(get(name, envir = env)))
            valid <- length(value) == 1L && is.finite(value)
            list(
              ok = valid && abs(value - expected_values[[name]]) <= tolerances[[name]],
              valid = valid,
              value = value,
              expected = expected_values[[name]]
            )
          }
          results <- lapply(names(expected_values), check_value)
          names(results) <- names(expected_values)
          assign("results_3_3b", results, envir = globalenv())
          all(vapply(results, function(result) isTRUE(result$ok), logical(1)))
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("results_3_3b", envir = globalenv())
          if (isTRUE(generated == expected)) {
            message <- paste(
              "**Bevestiging:** modus, mediaan, gemiddelde, variatiebreedte, Tukey-hinges en interkwartielafstand zijn allemaal correct.",
              "**Denkregel:** gebruik voor ratiodata de numerieke waarden; bepaal positie-statistieken pas na sorteren en pas de opgegeven kwartielconventie consequent toe.",
              "**Transferstap:** bereken dezelfde zeven maten voor een nieuwe kleine steekproef en vermeld expliciet welke kwartielconventie je gebruikt.",
              sep = "\n\n"
            )
          } else {
            wrong_name <- names(results)[!vapply(results, function(result) isTRUE(result$ok), logical(1))][1]
            result <- results[[wrong_name]]
            if (!result$valid) {
              likely <- paste0("`", wrong_name, "` is nog niet als één eindig getal ingevuld.")
              why <- "Een ontbrekende of niet-numerieke waarde kan niet worden vergeleken met de gevraagde statistiek."
              next_step <- paste0("Bereken `", wrong_name, "` opnieuw en vervang de bijbehorende `NA`.")
            } else if (wrong_name == "q1" && abs(result$value - 31) < 0.0001) {
              likely <- "Je hebt waarschijnlijk R's standaardinterpolatie gebruikt in plaats van de opgegeven Tukey-hinges."
              why <- "Verschillende kwartielconventies kunnen legitiem verschillen, maar deze oefening vraagt expliciet de mediaan van de onderste tien gesorteerde waarden."
              next_step <- "Sorteer de data, neem de onderste helft van tien waarden en bereken daarvan de mediaan."
            } else if (wrong_name == "gemiddelde" && abs(result$value - 36) < 0.0001) {
              likely <- "Je hebt de mediaan of modus overgenomen als gemiddelde."
              why <- "Het gemiddelde gebruikt de som van alle twintig waarden gedeeld door 20."
              next_step <- "Tel alle werkuren op en deel één keer door de steekproefgrootte."
            } else if (wrong_name == "ika") {
              likely <- "Je hebt mogelijk Q1 en Q3 correct gelokaliseerd maar de verkeerde volgorde of maat gebruikt."
              why <- "De interkwartielafstand gebruikt uitsluitend het verschil Q3 − Q1; de uiterste waarden horen niet in die aftrekking."
              next_step <- "Trek Q1 van Q3 af, niet omgekeerd en niet de uiterste waarden."
            } else {
              likely <- paste0("De berekeningsregel of sortering voor `", wrong_name, "` wijkt af.")
              why <- "De ingevulde waarde volgt niet uit de definitie van deze statistiek toegepast op alle twintig waarnemingen."
              next_step <- "Schrijf de passende definitie naast het veld en pas die opnieuw toe op de volledige dataset."
            }
            message <- paste(
              paste0("**Waarschijnlijke redenering:** ", likely),
              paste0("**Waarom dit niet klopt:** ", why),
              "**Denkregel:** koppel iedere statistiek aan haar eigen definitie en rond pas het gevraagde eindantwoord af.",
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
