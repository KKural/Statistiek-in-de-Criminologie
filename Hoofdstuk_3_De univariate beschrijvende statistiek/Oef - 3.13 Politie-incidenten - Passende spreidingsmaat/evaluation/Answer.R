context({
  testcase("", {
    testEqual(
      "",
      function(env) as.numeric(env$evaluationResult),
      1,
      comparator = function(generated, expected, ...) {
        feedbacks <- list(
          "1" = "De standaardafwijking past bij kwantitatieve, ongeveer symmetrische gegevens zonder sterke uitbijters.",
          "2" = "De interkwartielafstand is vooral aangewezen bij een scheve verdeling of sterke uitbijters.",
          "3" = "De modus beschrijft het meest voorkomende resultaat en is een centrummaat, geen spreidingsmaat.",
          "4" = "De mediaan beschrijft het midden van de verdeling en is een centrummaat, geen spreidingsmaat."
        )
        likely_reasons <- list(
          "2" = "je koos mogelijk automatisch voor een robuuste maat, hoewel de context geen scheefheid of sterke uitbijters vermeldt.",
          "3" = "je herkende de modus als een beschrijvende maat, maar controleerde mogelijk niet of ze centrum of spreiding meet.",
          "4" = "je koppelde de mediaan mogelijk terecht aan robuuste statistiek, maar de mediaan meet het centrum en niet de spreiding."
        )

        key <- as.character(generated)
        if (identical(generated, expected)) {
          message <- paste(
            "**Bevestiging:** je koos de standaardafwijking; dat is correct.",
            feedbacks[[key]],
            "**Denkregel:** Koppel bij ongeveer symmetrische kwantitatieve gegevens zonder sterke uitbijters het gemiddelde aan de standaardafwijking.",
            "**Transferstap:** Kies opnieuw een spreidingsmaat wanneer dezelfde verdeling één sterke uitbijter bevat en leg uit waarom je keuze verandert.",
            sep = "\n\n"
          )
        } else if (key %in% names(feedbacks)) {
          message <- paste(
            paste0("**Waarom deze keuze begrijpelijk kan lijken:** ", likely_reasons[[key]]),
            paste0("**Waarom dit niet klopt:** ", feedbacks[[key]]),
            "**Denkregel:** Controleer eerst of een maat centrum of spreiding beschrijft en kijk daarna naar scheefheid en uitbijters.",
            "**Volgende stap:** Vergelijk de vier opties opnieuw en kies de spreidingsmaat die bij deze symmetrische verdeling past.",
            sep = "\n\n"
          )
        } else {
          message <- paste(
            "**Controleer je invoer:** typ uitsluitend één optienummer van 1 tot en met 4.",
            "**Waarom dit niet klopt:** alleen de vier aangeboden antwoordopties kunnen inhoudelijk worden beoordeeld.",
            "**Denkregel:** Koppel elke antwoordoptie aan haar nummer en voer alleen dat nummer in.",
            "**Volgende stap:** Lees de vier opties opnieuw en dien één geldig nummer in.",
            sep = "\n\n"
          )
        }

        get_reporter()$add_message(message, type = "markdown")
        generated == expected
      }
    )
  })
})
