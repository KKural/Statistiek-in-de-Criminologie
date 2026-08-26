context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          expected_values <- c(
            odds_mannen = 0.4471,
            odds_vrouwen = 0.1846,
            odds_ratio = 2.42,
            chi_kwadraat = 59.1983,
            kans_no_bij_vrouwen = 0.8442,
            antwoord_mc = 3
          )
          tolerances <- c(
            odds_mannen = 0.000051,
            odds_vrouwen = 0.000051,
            odds_ratio = 0.0051,
            chi_kwadraat = 0.000051,
            kans_no_bij_vrouwen = 0.000051,
            antwoord_mc = 0
          )

          parse_value <- function(raw, name) {
            if (name == "antwoord_mc" && is.character(raw) && grepl("^[A-Da-d]$", trimws(raw))) {
              return(match(toupper(trimws(raw)), LETTERS[1:4]))
            }
            if (is.character(raw)) raw <- sub("%$", "", trimws(raw))
            suppressWarnings(as.numeric(raw))
          }

          results <- lapply(names(expected_values), function(name) {
            present <- exists(name, envir = env, inherits = FALSE)
            raw <- if (present) get(name, envir = env, inherits = FALSE) else NA
            value <- parse_value(raw, name)
            valid <- length(value) == 1L && !is.na(value) && is.finite(value)
            correct <- valid && abs(value - expected_values[[name]]) <= tolerances[[name]]
            if (name == "kans_no_bij_vrouwen" && valid) {
              correct <- correct || abs(value / 100 - expected_values[[name]]) <= tolerances[[name]]
            }
            list(exists = present, value = raw, correct = correct)
          })
          names(results) <- names(expected_values)
          assign("detailed_results", results, envir = globalenv())
          all(vapply(results, function(item) item$correct, logical(1)))
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("detailed_results", envir = globalenv())
          labels <- c(
            odds_mannen = "odds bij mannen",
            odds_vrouwen = "odds bij vrouwen",
            odds_ratio = "odds ratio",
            chi_kwadraat = "chi-kwadraat",
            kans_no_bij_vrouwen = "P(NO | Vrouw)",
            antwoord_mc = "interpretatie van P(NO | Vrouw)"
          )

          if (isTRUE(generated == expected)) {
            feedback <- paste(
              "**Bevestiging:** alle onderdelen zijn correct. De odds zijn 0.4471 en 0.1846, de odds ratio is 2.42, χ² = 59.1983 en P(NO | Vrouw) = 0.8442 (84.42%); optie C verwoordt die voorwaardelijke kans juist.",
              "**Denkregel:** bij odds vergelijk je binnen één groep YES met NO; bij een odds ratio vergelijk je vervolgens die twee odds. In P(A | B) bepaalt B altijd de groep die de noemer vormt.",
              "**Transferstap:** formuleer voor een nieuwe 2 × 2-tabel eerst de richting van de vergelijking en benoem daarna in woorden de groep achter de verticale streep.",
              sep = "\n\n"
            )
          } else {
            wrong <- names(results)[!vapply(results, function(item) item$correct, logical(1))]
            feedback <- paste(
              paste0("**Waarschijnlijke redenering:** bij ", paste(labels[wrong], collapse = ", "), " zijn mogelijk de vergelijkingsrichting, de voorwaarde of geobserveerde en verwachte aantallen verwisseld. Dit is een hypothese op basis van de foutieve velden."),
              "**Waarom dit niet klopt:** odds, odds ratio, chi-kwadraat en een conditionele kans gebruiken elk een andere vergelijking. Eén vaste deling kan daarom niet voor alle velden worden hergebruikt.",
              "**Denkregel:** schrijf per onderdeel eerst in woorden welke twee aantallen worden vergeleken; bouw voor χ² afzonderlijk de verwachte aantallen uit de rij- en kolomtotalen op.",
              "**Volgende stap:** herstel het eerste afwijkende veld zonder de andere antwoorden te wijzigen en controleer of de noemer overeenkomt met de gevraagde groep.",
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
