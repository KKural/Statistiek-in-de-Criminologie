context({
  testcase(
    "Multisetpermutatie met herhaalde labels",
    {
      testEqual(
        "",
        function(env) {
          exists_value <- exists("aantal_rangschikkingen", envir = env, inherits = FALSE)
          value <- if (exists_value) suppressWarnings(as.numeric(get("aantal_rangschikkingen", envir = env))) else NA_real_
          result <- list(
            exists = exists_value,
            value = if (length(value) == 1L) value else NA_real_,
            correct = exists_value && length(value) == 1L && is.finite(value) && abs(value - 560) < 0.000001
          )
          assign("chapter4_10_result", result, envir = globalenv())
          isTRUE(result$correct)
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          result <- get("chapter4_10_result", envir = globalenv())
          value <- result$value
          near <- function(target) is.finite(value) && abs(value - target) < 0.000001
          read_more <- "<a href='https://openstax.org/books/contemporary-mathematics/pages/7-6-probability-with-permutations-and-combinations' target='_blank' rel='noopener noreferrer'>Lees meer over tellen met permutaties en combinaties</a>"

          if (isTRUE(generated == expected)) {
            message <- paste0(
              "**Bevestiging:** `aantal_rangschikkingen = 560` is correct.\n\n",
              "**Waarom dit klopt:** `8!` telt eerst alle posities; delen door `2!`, `3!` en `3!` verwijdert precies de verwisselingen van identieke A-, B- en C-labels.\n\n",
              "**Denkregel:** bij een rangschikking van `n` objecten met herhalingsaantallen `n1, n2, ...` gebruik je `n!/(n1! n2! ...)`.\n\n",
              "**Transferstap:** pas dezelfde regel toe op de labels A, A, A, B, B, C en verklaar welke dubbeltellingen je verwijdert.\n\n",
              read_more
            )
          } else {
            if (!result$exists || !is.finite(value)) {
              diagnosis <- paste(
                "**Controleer je invoer:** `aantal_rangschikkingen` ontbreekt of bevat niet precies één eindig getal.",
                "**Waarom dit niet klopt:** zonder één numerieke uitkomst kan de evaluator de berekende multisetpermutatie niet vergelijken met het antwoord.",
                sep = "\n\n"
              )
            } else if (near(40320)) {
              diagnosis <- paste(
                "**Waarschijnlijke redenering:** deze waarde is consistent met `8!`, alsof alle acht labels verschillend zijn. Dezelfde waarde kan ook via een andere route ontstaan.",
                "**Waarom dit niet klopt:** het verwisselen van identieke A-, B- of C-labels levert geen nieuwe rangschikking op; `8!` bevat dus dubbeltellingen.",
                sep = "\n\n"
              )
            } else if (near(72)) {
              diagnosis <- paste(
                "**Waarschijnlijke redenering:** deze waarde is consistent met alleen de correctiefactor `2! × 3! × 3!`. Dezelfde waarde kan ook via een andere route ontstaan.",
                "**Waarom dit niet klopt:** 72 is het aantal dubbeltellingen per unieke rangschikking; deel `8!` door 72 om het aantal unieke rangschikkingen te vinden.",
                sep = "\n\n"
              )
            } else if (near(28)) {
              diagnosis <- paste(
                "**Waarschijnlijke redenering:** deze waarde past bij het kiezen van alleen de twee A-posities, `C(8,2)`. Dezelfde waarde kan ook via een andere route ontstaan.",
                "**Waarom dit niet klopt:** na de A-posities moeten ook de drie B-posities uit de zes resterende plaatsen worden gekozen; de C-posities liggen pas daarna vast.",
                sep = "\n\n"
              )
            } else {
              diagnosis <- paste(
                "**Waarschijnlijke redenering:** uit alleen deze eindwaarde is de precieze denkstap niet zeker; mogelijk is een faculteit, herhalingsfactor of deling onvolledig toegepast.",
                "**Waarom dit niet klopt:** de ingevoerde waarde is niet gelijk aan `8!/(2! × 3! × 3!) = 560`.",
                sep = "\n\n"
              )
            }

            message <- paste(
              diagnosis,
              "**Denkregel:** begin met `n!` en deel voor elke groep identieke objecten door de faculteit van haar herhalingsaantal.",
              "**Volgende stap:** bereken afzonderlijk `8! = 40320` en `2! × 3! × 3! = 72`, en deel daarna 40320 door 72.",
              read_more,
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
