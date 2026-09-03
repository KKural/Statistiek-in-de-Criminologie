context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        3, # Correct answer: Q8 from your rotation pattern
        comparator = function(generated, expected, ...) {
          key <- as.character(generated)
          option_feedback <- list(
            "1" = paste0(
              "**Waarom je keuze niet klopt:**\n",
              "De gevonden **samenhang** toont niet dat straatverlichting eerst veranderde en daarna de criminaliteit verminderde. Andere factoren, zoals **politie-inzet** of **buurtwelvaart**, kunnen beide variabelen beïnvloeden.\n\n",
              "**Controleer:**\n",
              "Vermeldt het onderzoek dat de verlichting doelgericht werd veranderd en dat andere verklaringen werden gecontroleerd? Zo niet, welke optie beschrijft alleen de samenhang zonder een oorzaak vast te leggen?\n\n",
              "**In het handboek:** **Deel I, Hoofdstuk 6, p. 115** (**PDF p. 129**) bespreekt expliciet dat statistiek samenhang toont, maar causaliteit niet bewijst.\n\n",
              "**Lees meer:** [Correlatie en causaliteit](https://maatschappij-wetenschappen.nl/havo/druk2/5-correlatie-en-causaliteit/)"
            ),
            "2" = paste0(
              "**Waarom je keuze niet klopt:**\n",
              "**Omgekeerde causaliteit** is mogelijk, maar het resultaat bewijst deze richting niet. Je vervangt daardoor één onbewezen causale conclusie door een andere.\n\n",
              "**Controleer:**\n",
              "Toont het onderzoek welke variabele eerst veranderde? Als de tijdsvolgorde onbekend is, welke optie laat de causale richting dan open?\n\n",
              "**In het handboek:** **Deel I, Hoofdstuk 6, p. 115** (**PDF p. 129**) bespreekt expliciet dat statistiek samenhang toont, maar causaliteit niet bewijst.\n\n",
              "**Lees meer:** [Correlatie en causaliteit](https://maatschappij-wetenschappen.nl/havo/druk2/5-correlatie-en-causaliteit/)"
            ),
            "3" = paste0(
              "**Juist:**\n",
              "Het resultaat toont een **samenhang**, maar levert onvoldoende bewijs om één causale verklaring te kiezen.\n\n",
              "**In het handboek:** **Deel I, Hoofdstuk 6, p. 115** (**PDF p. 129**) bespreekt expliciet dat statistiek samenhang toont, maar causaliteit niet bewijst.\n\n",
              "**Lees meer:** [Correlatie en causaliteit](https://maatschappij-wetenschappen.nl/havo/druk2/5-correlatie-en-causaliteit/)"
            ),
            "4" = paste0(
              "**Waarom je keuze niet klopt:**\n",
              "De sterkte van een **correlatie** toont niet dat **derde variabelen** zijn uitgesloten. Ook een sterke samenhang kan ontstaan doordat bijvoorbeeld **buurtwelvaart** zowel de straatverlichting als de criminaliteit beïnvloedt.\n\n",
              "**Controleer:**\n",
              "Staat er dat buurtwelvaart, politie-inzet of andere factoren werden gecontroleerd? Zo niet, welke optie houdt deze alternatieve verklaringen open?\n\n",
              "**In het handboek:** **Deel I, Hoofdstuk 6, p. 115** (**PDF p. 129**) bespreekt expliciet dat statistiek samenhang toont, maar causaliteit niet bewijst.\n\n",
              "**Lees meer:** [Correlatie en causaliteit](https://maatschappij-wetenschappen.nl/havo/druk2/5-correlatie-en-causaliteit/)"
            )
          )

          if (!key %in% names(option_feedback)) {
            msg <- paste0(
              "**Controleer je invoer:** je invoer lijkt niet overeen te komen met één van de aangeboden optienummers; dit kan een typefout of een andere invoerinterpretatie zijn.\n\n",
              "**Waarom dit niet klopt:** de evaluator kan alleen een inhoudelijke optie beoordelen wanneer één geldig optienummer is ingevoerd.\n\n",
              "**Denkregel:** koppel eerst elke antwoordoptie aan haar nummer en voer uitsluitend dat ene nummer in.\n\n",
              "**Volgende stap:** lees de opties opnieuw, kies het nummer dat bij je redenering hoort en dien alleen dat nummer in."
            )
          } else {
            msg <- option_feedback[[key]]
          }
          get_reporter()$add_message(msg, type = "markdown")

          generated == expected
        }
      )
    }
  )
})
