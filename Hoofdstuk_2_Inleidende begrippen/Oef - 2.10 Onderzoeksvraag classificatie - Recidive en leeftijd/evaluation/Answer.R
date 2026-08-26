context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          read_text <- function(name) {
            present <- exists(name, envir = env, inherits = FALSE)
            raw <- if (present) get(name, envir = env, inherits = FALSE) else NA_character_
            valid <- present && length(raw) == 1L && !is.na(raw)
            value <- if (valid) tolower(trimws(as.character(raw))) else ""
            list(exists = present, raw = raw, value = value, valid = valid && nzchar(value))
          }

          accepted <- list(
            type_vraag = c(
              "bivariate verklarende", "bivariaat verklarende",
              "bivariate verklarend", "bivariaat verklarend"
            ),
            bestudeerde_variabele = c(
              "recidive en leeftijd van de dader",
              "recidive en exacte leeftijd van de dader",
              "recidive en leeftijd",
              "leeftijd van de dader en recidive",
              "leeftijd en recidive",
              "leeftijd dader en recidive"
            ),
            meetniveau_recidive = "nominaal",
            kwantitatief_recidive = c("nee", "no", "n"),
            meetniveau_leeftijd = "ratio",
            kwantitatief_leeftijd = c("ja", "yes", "j"),
            type_waarden_leeftijd = c(
              "continue waarden", "continue waarde", "continu",
              "continue getallen", "continu waarden"
            )
          )

          results <- lapply(names(accepted), function(name) {
            item <- read_text(name)
            list(
              exists = item$exists,
              value = item$raw,
              correct = item$valid && item$value %in% accepted[[name]]
            )
          })
          names(results) <- names(accepted)

          example <- read_text("voorbeeld_waarden_leeftijd")
          number_matches <- if (example$valid) {
            regmatches(example$value, gregexpr("[0-9]+(?:[.,][0-9]+)?", example$value, perl = TRUE))[[1L]]
          } else {
            character()
          }
          ages <- suppressWarnings(as.numeric(gsub(",", ".", number_matches, fixed = TRUE)))
          example_ok <- length(ages) >= 2L && all(is.finite(ages)) && all(ages >= 0 & ages <= 120)
          results$voorbeeld_waarden_leeftijd <- list(
            exists = example$exists,
            value = example$raw,
            correct = example$valid && example_ok
          )

          assign("detailed_results", results, envir = globalenv())
          all(vapply(results, function(item) isTRUE(item$correct), logical(1)))
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("detailed_results", envir = globalenv())
          labels <- c(
            type_vraag = "type onderzoeksvraag",
            bestudeerde_variabele = "bestudeerde variabelen",
            meetniveau_recidive = "meetniveau van recidive",
            kwantitatief_recidive = "kwantitatief karakter van recidive",
            meetniveau_leeftijd = "meetniveau van leeftijd",
            kwantitatief_leeftijd = "kwantitatief karakter van leeftijd",
            type_waarden_leeftijd = "waardetype van leeftijd",
            voorbeeld_waarden_leeftijd = "voorbeelden van leeftijden"
          )

          if (isTRUE(generated == expected)) {
            feedback <- paste(
              "**Bevestiging:** alle classificaties zijn correct. Dit is een bivariate verklarende vraag met recidive als nominale, niet-kwantitatieve ja/nee-uitkomst en exacte leeftijd als kwantitatieve ratiovariabele met continue waarden.",
              "**Denkregel:** tel eerst de variabelen, bepaal daarna beschrijven versus verklaren en classificeer ten slotte elk kenmerk los op categorie/rangorde, gelijke afstanden en echt nulpunt.",
              "**Transferstap:** gebruik dezelfde beslisvolgorde bij een nieuwe criminologische voorspeller-uitkomstvraag en vermeld daarbij altijd hoe elke variabele precies gemeten wordt.",
              sep = "\n\n"
            )
          } else {
            wrong <- names(results)[!vapply(results, function(item) isTRUE(item$correct), logical(1))]
            missing <- wrong[!vapply(results[wrong], function(item) item$exists, logical(1))]
            missing_text <- if (length(missing)) {
              paste0(" Ontbrekende antwoordobjecten: ", paste(labels[missing], collapse = ", "), ".")
            } else {
              ""
            }
            feedback <- paste(
              paste0("**Waarschijnlijke redenering:** bij ", paste(labels[wrong], collapse = ", "), " is mogelijk de rol van een variabele verward met haar meetniveau, of het meetniveau met het type waarden. Dit is een hypothese op basis van de afwijkende velden."),
              paste0("**Waarom dit niet klopt:** vraagdoel, variabelenrol, meetniveau en continu/discreet zijn afzonderlijke beslissingen en hebben elk een eigen criterium.", missing_text),
              "**Denkregel:** werk in vier stappen: tel de variabelen, zoek het vraagdoel, schrijf de richting als X → Y en toets daarna per variabele rangorde, afstanden, nulpunt en mogelijke tussenwaarden.",
              "**Volgende stap:** herstel alleen het eerste afwijkende veld. Schrijf eerst in één zin welk criterium je daarvoor gebruikt en dien daarna opnieuw in.",
              sep = "\n\n"
            )
          }

          get_reporter()$add_message(feedback, type = "markdown")
          generated == expected
        }
      )
    }
  )
})
