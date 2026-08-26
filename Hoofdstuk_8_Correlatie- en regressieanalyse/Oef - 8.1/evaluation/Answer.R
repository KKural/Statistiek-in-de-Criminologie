context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          expected_values <- c(
            verklarende_variabele = 1,
            gemiddelde_x = 50.00,
            gemiddelde_y = 1.7380,
            SSx = 1066.0,
            SSy = 3.4435,
            SSxy = 57.87
          )
          tolerances <- c(
            verklarende_variabele = 0,
            gemiddelde_x = 0.0051,
            gemiddelde_y = 0.000051,
            SSx = 0.0501,
            SSy = 0.000051,
            SSxy = 0.0051
          )

          results <- lapply(names(expected_values), function(name) {
            present <- exists(name, envir = env, inherits = FALSE)
            raw <- if (present) get(name, envir = env, inherits = FALSE) else NA
            value <- suppressWarnings(as.numeric(raw))
            valid <- length(value) == 1L && !is.na(value) && is.finite(value)
            list(
              exists = present,
              value = raw,
              correct = valid && abs(value - expected_values[[name]]) <= tolerances[[name]]
            )
          })
          names(results) <- names(expected_values)
          assign("detailed_results", results, envir = globalenv())
          all(vapply(results, function(item) item$correct, logical(1)))
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("detailed_results", envir = globalenv())
          labels <- c(
            verklarende_variabele = "verklarende variabele",
            gemiddelde_x = "gemiddelde van X",
            gemiddelde_y = "gemiddelde van Y",
            SSx = "SSx",
            SSy = "SSy",
            SSxy = "SSxy"
          )

          if (isTRUE(generated == expected)) {
            feedback <- paste(
              "**Bevestiging:** alle tussenresultaten zijn correct: prijs is de verklarende variabele, x̄ = 50.00, ȳ = 1.7380, SSx = 1066.0, SSy = 3.4435 en SSxy = 57.87.",
              "**Denkregel:** SSx en SSy tellen gekwadrateerde afwijkingen op; SSxy telt de producten van gekoppelde X- en Y-afwijkingen op. De kruisproductsom behoudt daardoor de richting van de gezamenlijke beweging.",
              "**Transferstap:** gebruik deze drie sommen in deel 2 om varianties, covariantie en Pearsons r te berekenen.",
              sep = "\n\n"
            )
          } else {
            wrong <- names(results)[!vapply(results, function(item) item$correct, logical(1))]
            feedback <- paste(
              paste0("**Waarschijnlijke redenering:** bij ", paste(labels[wrong], collapse = ", "), " kan een afwijking, kwadraat of kruisproduct te vroeg zijn afgerond. Dit is een hypothese op basis van de foutieve velden."),
              "**Waarom dit niet klopt:** te vroeg afgeronde tussenwaarden veranderen de sommen. SSxy gebruikt bovendien producten van gekoppelde afwijkingen en is dus geen som van twee afzonderlijke somkwadraten.",
              "**Denkregel:** bereken eerst beide gemiddelden, maak per rij de twee afwijkingen en behoud de volledige precisie tot de drie kolomsommen klaar zijn.",
              "**Volgende stap:** controleer voor het eerste afwijkende veld één rij van je rekentabel en tel daarna de betreffende kolom opnieuw op.",
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
