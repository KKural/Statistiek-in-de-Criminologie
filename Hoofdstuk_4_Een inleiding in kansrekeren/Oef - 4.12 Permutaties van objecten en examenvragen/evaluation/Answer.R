context({
  testcase(
    "Permutaties van zeven en tien objecten",
    {
      testEqual(
        "",
        function(env) {
          inspect <- function(name, expected) {
            present <- exists(name, envir = env, inherits = FALSE)
            value <- if (present) suppressWarnings(as.numeric(get(name, envir = env))) else NA_real_
            value <- if (length(value) == 1L) value else NA_real_
            list(present = present, value = value, correct = present && is.finite(value) && abs(value - expected) < 0.000001)
          }
          results <- list(
            permutaties_7 = inspect("permutaties_7", 5040),
            permutaties_10 = inspect("permutaties_10", 3628800)
          )
          assign("chapter4_12_results", results, envir = globalenv())
          all(vapply(results, function(item) isTRUE(item$correct), logical(1)))
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("chapter4_12_results", envir = globalenv())
          read_more <- "<a href='https://openstax.org/books/contemporary-mathematics/pages/7-6-probability-with-permutations-and-combinations' target='_blank' rel='noopener noreferrer'>Lees meer over permutaties</a>"
          near <- function(item, target) is.finite(item$value) && abs(item$value - target) < 0.000001

          explain <- function(item, variable, n, answer) {
            if (!item$present || !is.finite(item$value)) {
              return(paste0(
                "**Controleer je invoer:** `", variable, "` ontbreekt of bevat niet precies één eindig getal.\n\n",
                "**Waarom dit niet klopt:** het veld moet één geheel aantal volgordes bevatten."
              ))
            }
            if ((n == 7 && near(item, 2520)) || (n == 10 && near(item, 362880))) {
              return(paste0(
                "**Waarschijnlijke redenering:** deze waarde is consistent met een faculteitsproduct waarin één factor ontbreekt. Dezelfde waarde kan ook via een andere route ontstaan.\n\n",
                "**Waarom dit niet klopt:** `", n, "!` bevat alle factoren van ", n, " tot en met 1; daardoor is de uitkomst `", answer, "`."
              ))
            }
            if (near(item, n)) {
              return(paste0(
                "**Waarschijnlijke redenering:** je geeft mogelijk alleen het aantal objecten, zonder de afnemende keuzemogelijkheden voor de volgende posities mee te tellen. Dit is een voorzichtige hypothese.\n\n",
                "**Waarom dit niet klopt:** na de eerste positie blijven achtereenvolgens `", n - 1, "`, `", n - 2, "`, enzovoort mogelijkheden over; deze aantallen moeten worden vermenigvuldigd."
              ))
            }
            paste0(
              "**Waarschijnlijke redenering:** uit de eindwaarde is de precieze route niet zeker; mogelijk is de faculteit te vroeg gestopt of is opgeteld in plaats van vermenigvuldigd.\n\n",
              "**Waarom dit niet klopt:** `", n, "! = ", answer, "`."
            )
          }

          if (isTRUE(generated == expected)) {
            message <- paste0(
              "**Bevestiging:** beide permutaties zijn correct: `7! = 5 040` en `10! = 3 628 800`.\n\n",
              "**Waarom dit klopt:** voor elke volgende positie is één object minder beschikbaar; het product van alle aantallen mogelijkheden is `n!`.\n\n",
              "**Denkregel:** wanneer alle verschillende objecten worden gebruikt en volgorde telt, is het aantal rangschikkingen `n!`.\n\n",
              "**Transferstap:** bereken hoeveel volgordes mogelijk zijn wanneer slechts 3 van 7 dossiers worden geselecteerd én gerangschikt, en leg uit waarom dit niet `7!` is.\n\n",
              read_more
            )
          } else {
            parts <- character()
            if (!results$permutaties_7$correct) {
              parts <- c(parts, paste0("### `permutaties_7`\n\n", explain(results$permutaties_7, "permutaties_7", 7, "5040")))
            }
            if (!results$permutaties_10$correct) {
              parts <- c(parts, paste0("### `permutaties_10`\n\n", explain(results$permutaties_10, "permutaties_10", 10, "3628800")))
            }
            message <- paste(
              c(
                parts,
                "**Denkregel:** schrijf `n!` volledig uit als `n × (n-1) × ... × 2 × 1` en controleer of alle factoren aanwezig zijn.",
                "**Volgende stap:** werk elk fout faculteitsproduct in een afzonderlijke regel uit en vermenigvuldig pas daarna de factoren.",
                read_more
              ),
              collapse = "\n\n"
            )
          }

          get_reporter()$add_message(message, type = "markdown")
          generated == expected
        }
      )
    }
  )
})
