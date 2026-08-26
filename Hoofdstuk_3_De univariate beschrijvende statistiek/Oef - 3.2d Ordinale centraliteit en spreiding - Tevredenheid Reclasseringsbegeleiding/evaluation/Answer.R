context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          expected_values <- list(
            meetniveau = "ordinaal",
            modus = "noch tevreden, noch ontevreden",
            mediaan = "noch tevreden, noch ontevreden",
            meest_relevante_centraliteit = "mediaan",
            q1 = "ontevreden",
            q3 = "tevreden",
            variatiebreedte = "zeer ontevreden tot zeer tevreden",
            ika = "ontevreden tot tevreden"
          )
          check_text <- function(name, expected) {
            if (!exists(name, envir = env)) {
              return(list(ok = FALSE, valid = FALSE, value = NA_character_, expected = expected))
            }
            raw <- get(name, envir = env)
            valid <- length(raw) == 1L && !is.na(raw) && nzchar(trimws(as.character(raw)))
            value <- if (valid) tolower(trimws(as.character(raw))) else NA_character_
            list(ok = valid && identical(value, expected), valid = valid, value = value, expected = expected)
          }
          results <- lapply(names(expected_values), function(name) check_text(name, expected_values[[name]]))
          names(results) <- names(expected_values)
          assign("results_3_2d", results, envir = globalenv())
          all(vapply(results, function(result) isTRUE(result$ok), logical(1)))
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("results_3_2d", envir = globalenv())
          if (isTRUE(generated == expected)) {
            message <- paste(
              "**Bevestiging:** je behandelt tevredenheid correct als ordinaal en lokaliseert modus, mediaan, kwartielen en categorie-intervallen juist.",
              "**Denkregel:** ordinale categorieën hebben een volgorde maar geen gegarandeerd gelijke afstanden; gebruik daarom positie- en ranggebaseerde maten.",
              "**Transferstap:** pas dezelfde keuzeprocedure toe op een nieuwe vijfpuntsschaal en leg uit waarom het gemiddelde daar niet automatisch betekenisvol is.",
              sep = "\n\n"
            )
          } else {
            wrong_name <- names(results)[!vapply(results, function(result) isTRUE(result$ok), logical(1))][1]
            result <- results[[wrong_name]]
            labels <- c(
              meetniveau = "meetniveau", modus = "modus", mediaan = "mediaan",
              meest_relevante_centraliteit = "meest relevante centrummaat",
              q1 = "Q1", q3 = "Q3", variatiebreedte = "variatiebreedte", ika = "interkwartielafstand"
            )
            if (!result$valid) {
              likely <- paste0("Het veld `", wrong_name, "` is nog niet eenduidig ingevuld.")
              why <- "Een ontbrekende of lege tekstwaarde kan niet aan een categorie of maat worden gekoppeld."
              next_step <- paste0("Vul `", wrong_name, "` in met de gevraagde term of categorie uit de tabel.")
            } else if (wrong_name == "meetniveau" && result$value == "nominaal") {
              likely <- "Je hebt alleen gezien dat tevredenheid uit categorieën bestaat en de inhoudelijke volgorde genegeerd."
              why <- "Van zeer ontevreden naar zeer tevreden bestaat wel een natuurlijke rangorde."
              next_step <- "Schrijf de categorieën van laag naar hoog en kies het meetniveau dat rangorde toestaat."
            } else if (wrong_name == "meest_relevante_centraliteit" && result$value == "gemiddelde") {
              likely <- "Je hebt categorieposities behandeld alsof de afstanden ertussen exact gelijk zijn."
              why <- "Bij ordinale data zijn die afstanden niet gegarandeerd, waardoor een gemiddelde niet verantwoord is."
              next_step <- "Kies de meest informatieve centrummaat die alleen de rangorde nodig heeft."
            } else {
              likely <- paste0("Je afleiding voor `", labels[[wrong_name]], "` gebruikt waarschijnlijk de verkeerde frequentie of positie.")
              why <- paste0("De geordende cumulatieve verdeling leidt hier tot `", result$expected, "`, niet `", result$value, "`.")
              next_step <- "Bouw de cumulatieve absolute frequenties opnieuw op en markeer waar 25%, 50% en 75% voor het eerst worden bereikt."
            }
            message <- paste(
              paste0("**Waarschijnlijke redenering:** ", likely),
              paste0("**Waarom dit niet klopt:** ", why),
              "**Denkregel:** bepaal eerst het meetniveau en gebruik daarna alleen maten die niet méér informatie veronderstellen dan de schaal biedt.",
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
