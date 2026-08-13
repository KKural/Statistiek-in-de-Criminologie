context({
  testcase(
    "Permutatie of combinatie bij de lotto",
    {
      testEqual(
        "",
        function(env) suppressWarnings(as.numeric(env$evaluationResult)),
        4,
        comparator = function(generated, expected, ...) {
          read_more <- "<a href='https://openstax.org/books/contemporary-mathematics/pages/7-6-probability-with-permutations-and-combinations' target='_blank' rel='noopener noreferrer'>Lees meer over permutaties en combinaties</a>"
          key <- if (length(generated) == 1L && is.finite(generated)) as.character(generated) else ""

          reasons <- list(
            "1" = paste0(
              "**Waarschijnlijke redenering:** je behandelt mogelijk alle 41 balletjes alsof ze volledig moeten worden gerangschikt. Dit is een voorzichtige hypothese op basis van je keuze.",
              "\n\n**Waarom dit niet klopt:** er worden slechts 6 van de 41 balletjes gekozen; de overige 35 behoren niet tot de selectie."
            ),
            "2" = paste0(
              "**Waarschijnlijke redenering:** je ziet mogelijk zes opeenvolgende trekkingen en gebruikt daarom voor elke trekking opnieuw 41 mogelijkheden. Dit is een voorzichtige hypothese op basis van je keuze.",
              "\n\n**Waarom dit niet klopt:** `41^6` laat teruglegging en herhaling toe en telt bovendien verschillende volgordes afzonderlijk."
            ),
            "3" = paste0(
              "**Waarschijnlijke redenering:** je houdt rekening met trekken zonder teruglegging, maar telt verschillende volgordes mogelijk nog als verschillende uitkomsten. Dit is een voorzichtige hypothese op basis van je keuze.",
              "\n\n**Waarom dit niet klopt:** de lotto-uitkomst verandert niet wanneer dezelfde zes getallen in een andere volgorde verschijnen; elke selectie wordt met deze formule `6!` keer geteld."
            )
          )

          if (identical(key, as.character(expected))) {
            message <- paste0(
              "**Bevestiging:** optie 4 is correct.\n\n",
              "**Waarom dit klopt:** zes verschillende balletjes worden zonder teruglegging gekozen en de volgorde is niet relevant. Daarom is `C(41,6) = 41!/(6!35!) = 4 496 388`.\n\n",
              "**Denkregel:** gebruik een combinatie wanneer je een deelverzameling kiest en een andere volgorde geen nieuwe uitkomst vormt.\n\n",
              "**Transferstap:** bepaal welke formule nodig is wanneer dezelfde zes dossiers niet alleen worden geselecteerd, maar ook in een presentatievolgorde worden geplaatst.\n\n",
              read_more
            )
          } else if (key %in% names(reasons)) {
            message <- paste(
              reasons[[key]],
              "**Denkregel:** vraag bij elk telprobleem achtereenvolgens: hoeveel objecten worden gekozen, is teruglegging mogelijk en levert een andere volgorde een nieuwe uitkomst op?",
              "**Volgende stap:** noteer ‘6 uit 41, zonder teruglegging, volgorde niet relevant’ en kies daarna de formule die door `6!` corrigeert voor volgorde.",
              read_more,
              sep = "\n\n"
            )
          } else {
            message <- paste(
              "**Controleer je invoer:** de invoer kan niet eenduidig aan één aangeboden optie worden gekoppeld.",
              "**Waarom dit niet klopt:** de evaluator kan alleen een inhoudelijke keuze beoordelen wanneer exact één getal van 1 tot en met 4 is ingevoerd.",
              "**Denkregel:** koppel eerst elke formule aan haar optienummer en voer uitsluitend dat nummer in.",
              "**Volgende stap:** kies één van de vier formules en dien alleen het bijbehorende optienummer in.",
              read_more,
              sep = "\n\n"
            )
          }

          get_reporter()$add_message(message, type = "markdown")
          identical(key, as.character(expected))
        }
      )
    }
  )
})
