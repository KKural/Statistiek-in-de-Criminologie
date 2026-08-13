context({
  testcase(
    "Grensgevallen en lotto-combinaties",
    {
      testEqual(
        "",
        function(env) {
          inspect <- function(name, expected) {
            present <- exists(name, envir = env, inherits = FALSE)
            raw <- if (present) get(name, envir = env, inherits = FALSE) else NA
            value <- suppressWarnings(as.numeric(raw))
            value <- if (length(value) == 1L) value else NA_real_
            list(
              present = present,
              raw = raw,
              value = value,
              correct = present && is.finite(value) && abs(value - expected) < 0.000001
            )
          }

          results <- list(
            combinatie_8_0 = inspect("combinatie_8_0", 1),
            combinatie_5_5 = inspect("combinatie_5_5", 1),
            lotto_combinaties = inspect("lotto_combinaties", 4496388)
          )
          assign("chapter4_11_results", results, envir = globalenv())
          all(vapply(results, function(item) isTRUE(item$correct), logical(1)))
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("chapter4_11_results", envir = globalenv())
          read_more <- "<a href='https://openstax.org/books/contemporary-mathematics/pages/7-3-combinations' target='_blank' rel='noopener noreferrer'>Lees meer over combinaties</a>"
          near <- function(item, target) is.finite(item$value) && abs(item$value - target) < 0.000001

          boundary_feedback <- function(item, variable, n) {
            if (!item$present || !is.finite(item$value)) {
              return(paste0(
                "**Controleer je invoer:** `", variable, "` ontbreekt of bevat niet precies één eindig getal.\n\n",
                "**Waarom dit niet klopt:** elk veld moet één gehele combinatie-uitkomst bevatten."
              ))
            }
            if (near(item, 0)) {
              return(paste0(
                "**Waarschijnlijke redenering:** je koppelt ‘geen object kiezen’ mogelijk aan nul mogelijkheden. Dit is een voorzichtige hypothese op basis van de waarde.\n\n",
                "**Waarom dit niet klopt:** er is precies één selectie met nul objecten: de lege verzameling. Evenzo is er precies één manier om alle ", n, " objecten te kiezen."
              ))
            }
            if ((variable == "combinatie_8_0" && near(item, 40320)) ||
                (variable == "combinatie_5_5" && near(item, 120))) {
              return(paste0(
                "**Waarschijnlijke redenering:** de waarde is consistent met `", n, "!`, alsof alle objecten worden gerangschikt. Dezelfde waarde kan ook anders ontstaan.\n\n",
                "**Waarom dit niet klopt:** een combinatie telt selecties, niet volgordes; bij `C(n,0)` en `C(n,n)` bestaat precies één selectie."
              ))
            }
            paste0(
              "**Waarschijnlijke redenering:** uit de eindwaarde is de precieze route niet zeker; mogelijk zijn `0! = 1` of de betekenis van een grensgeval niet toegepast.\n\n",
              "**Waarom dit niet klopt:** zowel `C(n,0)` als `C(n,n)` is gelijk aan 1."
            )
          }

          lotto_feedback <- function(item) {
            if (!item$present || !is.finite(item$value)) {
              return(paste(
                "**Controleer je invoer:** `lotto_combinaties` ontbreekt of bevat niet precies één eindig getal.",
                "**Waarom dit niet klopt:** het veld moet één geheel aantal mogelijke lottoselecties bevatten.",
                sep = "\n\n"
              ))
            }
            if (near(item, 3237399360)) {
              return(paste(
                "**Waarschijnlijke redenering:** deze waarde is consistent met `41!/(41-6)!`, waarbij volgordes afzonderlijk worden geteld. Dezelfde waarde kan ook anders ontstaan.",
                "**Waarom dit niet klopt:** bij een lottoselectie maakt de volgorde niet uit; deel daarom ook door `6!`.",
                sep = "\n\n"
              ))
            }
            if (near(item, 4750104241)) {
              return(paste(
                "**Waarschijnlijke redenering:** deze waarde past bij `41^6`, met 41 mogelijkheden bij elk van zes posities. Dezelfde waarde kan ook anders ontstaan.",
                "**Waarom dit niet klopt:** `41^6` laat herhaling toe en telt volgorde, terwijl lotto zonder teruglegging werkt en volgorde niet relevant is.",
                sep = "\n\n"
              ))
            }
            paste(
              "**Waarschijnlijke redenering:** uit de eindwaarde is de precieze route niet zeker; mogelijk is volgorde of teruglegging anders geïnterpreteerd.",
              "**Waarom dit niet klopt:** `C(41,6) = 41!/(6!35!) = 4 496 388`.",
              sep = "\n\n"
            )
          }

          if (isTRUE(generated == expected)) {
            message <- paste0(
              "**Bevestiging:** alle drie antwoorden zijn correct: `C(8,0)=1`, `C(5,5)=1` en `C(41,6)=4 496 388`.\n\n",
              "**Waarom dit klopt:** de lege selectie en de volledige selectie zijn elk uniek; voor de lotto kies je zes objecten zonder dat volgorde een nieuwe selectie vormt.\n\n",
              "**Denkregel:** `C(n,0)=C(n,n)=1`; voor andere combinaties gebruik je `n!/[k!(n-k)!]`.\n\n",
              "**Transferstap:** verklaar zonder formule waarom `C(9,1)=C(9,8)` en bereken beide waarden.\n\n",
              read_more
            )
          } else {
            parts <- character()
            if (!results$combinatie_8_0$correct) {
              parts <- c(parts, paste0("### `combinatie_8_0`\n\n", boundary_feedback(results$combinatie_8_0, "combinatie_8_0", 8)))
            }
            if (!results$combinatie_5_5$correct) {
              parts <- c(parts, paste0("### `combinatie_5_5`\n\n", boundary_feedback(results$combinatie_5_5, "combinatie_5_5", 5)))
            }
            if (!results$lotto_combinaties$correct) {
              parts <- c(parts, paste0("### `lotto_combinaties`\n\n", lotto_feedback(results$lotto_combinaties)))
            }
            message <- paste(
              c(
                parts,
                "**Denkregel:** interpreteer eerst welke deelverzameling wordt geteld; controleer vervolgens teruglegging en de rol van volgorde.",
                "**Volgende stap:** schrijf voor elk fout veld `n`, `k` en ‘volgorde relevant: ja/nee’ op en vul daarna de combinatieformule in.",
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
