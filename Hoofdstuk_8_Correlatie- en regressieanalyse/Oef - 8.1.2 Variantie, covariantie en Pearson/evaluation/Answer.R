context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          expected_values <- c(
            variantie_x = 266.5,
            variantie_y = 0.8609,
            sd_x = 16.3248,
            sd_y = 0.9278,
            covariantie = 14.4675,
            pearson_r = 0.9552,
            correlatie_verandert = 2
          )
          tolerances <- c(
            variantie_x = 0.0501,
            variantie_y = 0.000051,
            sd_x = 0.000051,
            sd_y = 0.000051,
            covariantie = 0.000051,
            pearson_r = 0.000051,
            correlatie_verandert = 0
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

          text_present <- exists("verklaring_euro", envir = env, inherits = FALSE)
          text_raw <- if (text_present) get("verklaring_euro", envir = env, inherits = FALSE) else NA_character_
          text <- if (length(text_raw) == 1L && !is.na(text_raw)) tolower(trimws(as.character(text_raw))) else ""
          unchanged <- grepl(
            "^nee\\b|onveranderd|blijft[^.]{0,40}(?:zelfde|gelijk)|verandert[^.]{0,20}niet|niet[^.]{0,20}verandert",
            text,
            perl = TRUE
          )
          contradiction <- grepl(
            "niet\\s+(?:hetzelfde|gelijk)|(?:schaal|eenheid|transformatie)[^.]{0,40}verandert\\s+(?:r|de correlatie)|(?:r|de correlatie)[^.]{0,40}verandert(?:\\s+wel)?",
            text,
            perl = TRUE
          ) && !grepl("verandert[^.]{0,20}niet|niet[^.]{0,20}verandert", text, perl = TRUE)
          reason <- grepl("lineair|transformatie|eenheid|schaal|constante|vermenig|eenheidsloos|dimensieloos", text, perl = TRUE)
          results$verklaring_euro <- list(
            exists = text_present,
            value = text_raw,
            correct = nzchar(text) && unchanged && reason && !contradiction
          )

          assign("detailed_results", results, envir = globalenv())
          all(vapply(results, function(item) item$correct, logical(1)))
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("detailed_results", envir = globalenv())
          labels <- c(
            variantie_x = "variantie van X",
            variantie_y = "variantie van Y",
            sd_x = "standaardafwijking van X",
            sd_y = "standaardafwijking van Y",
            covariantie = "covariantie",
            pearson_r = "Pearsons r",
            correlatie_verandert = "keuze over de eenheidsomzetting",
            verklaring_euro = "motivering van de eenheidsomzetting"
          )

          if (isTRUE(generated == expected)) {
            feedback <- paste(
              "**Bevestiging:** alle resultaten zijn correct: s²x = 266.5, s²y = 0.8609, sx = 16.3248, sy = 0.9278, cov(X,Y) = 14.4675 en r = 0.9552. Een positieve lineaire eenheidsomzetting verandert r niet.",
              "**Denkregel:** variantie en covariantie veranderen met de schaal, maar in r worden die schaalfactoren gedeeld door de twee standaardafwijkingen en vallen ze weg.",
              "**Transferstap:** voorspel vóór een volgende berekening welke grootheden wel en niet veranderen wanneer één variabele in een andere eenheid wordt uitgedrukt.",
              sep = "\n\n"
            )
          } else {
            wrong <- names(results)[!vapply(results, function(item) item$correct, logical(1))]
            feedback <- paste(
              paste0("**Waarschijnlijke redenering:** bij ", paste(labels[wrong], collapse = ", "), " is mogelijk n in plaats van n−1 gebruikt, of zijn variantie, standaardafwijking en covariantie door elkaar gehaald. Dit is een hypothese op basis van de afwijkende velden."),
              "**Waarom dit niet klopt:** een steekproefvariantie en -covariantie delen door n−1; een standaardafwijking is de wortel van een variantie. Correlatie standaardiseert de covariantie en is daardoor eenheidsloos.",
              "**Denkregel:** bouw de keten in vaste volgorde op: sommen → delen door n−1 → wortels → covariantie standaardiseren.",
              "**Volgende stap:** controleer het eerste afwijkende veld met de opgegeven SS-waarde en gebruik het niet-afgeronde resultaat in de volgende stap.",
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
