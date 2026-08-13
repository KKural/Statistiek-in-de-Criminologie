context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) suppressWarnings(as.numeric(env$evaluationResult)),
        2,
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = paste0(
              "**Waarom deze keuze begrijpelijk kan lijken:** negatieve waarden komen voor bij afwijkingen, veranderingen en sommige statistische maten; je hebt zo'n schaal mogelijk op een kans toegepast.\n\n",
              "**Waarom dit niet klopt:** een kans drukt een aandeel van de uitkomsten uit en ligt daarom altijd tussen 0 en 1. Een onmogelijke gebeurtenis heeft kans 0, niet een negatieve kans.\n\n",
              "**Denkregel:** controleer eerst de grenzen: voor elke gebeurtenis geldt 0 ≤ P(A) ≤ 1.\n\n",
              "**Volgende stap:** toets elke uitspraak opnieuw aan dit interval en zoek daarna de optie die ook de voorwaarde van even waarschijnlijke uitkomsten correct gebruikt. ",
              "<a href='https://openstax.org/books/introductory-statistics-2e/pages/3-1-terminology' target='_blank' rel='noopener noreferrer'>Lees meer</a>"
            ),
            "2" = paste0(
              "**Bevestiging:** juist. Wanneer alle elementaire uitkomsten even waarschijnlijk zijn, is de Laplace-kans het aantal gunstige uitkomsten gedeeld door het totale aantal mogelijke uitkomsten: P(A)=N(A)/N. Deze verhouding ligt tussen 0 en 1.\n\n",
              "**Denkregel:** gebruik N(A)/N alleen nadat je hebt vastgesteld dat de elementaire uitkomsten even waarschijnlijk zijn.\n\n",
              "**Transferstap:** neem een willekeurige steekproef van 20 gelijk selecteerbare dossiers waarvan er 5 aan criterium A voldoen en bereken P(A). Leg ook uit waarom de formule ongeschikt kan zijn als sommige dossiers een grotere selectiekans hebben. ",
              "<a href='https://openstax.org/books/introductory-statistics-2e/pages/3-1-terminology' target='_blank' rel='noopener noreferrer'>Lees meer</a>"
            ),
            "3" = paste0(
              "**Waarom deze keuze begrijpelijk kan lijken:** de relatieve frequentie nadert bij veel herhalingen de theoretische kans, waardoor 'nadert' mogelijk als 'is altijd exact gelijk' is gelezen.\n\n",
              "**Waarom dit niet klopt:** in een eindige reeks blijft toevalsvariatie mogelijk. De wet van de grote aantallen beschrijft toenadering op lange termijn, geen exacte gelijkheid in iedere steekproef.\n\n",
              "**Denkregel:** theoretische kans is een modelwaarde; relatieve frequentie is een steekproefuitkomst die rond die waarde kan variëren.\n\n",
              "**Volgende stap:** vergelijk twee denkbeeldige reeksen van 20 trekkingen met dezelfde theoretische kans en controleer waarom hun relatieve frequenties toch kunnen verschillen. ",
              "<a href='https://openstax.org/books/introductory-statistics-2e/pages/3-1-terminology' target='_blank' rel='noopener noreferrer'>Lees meer</a>"
            ),
            "4" = paste0(
              "**Waarom deze keuze begrijpelijk kan lijken:** de verhouding N(A)/N is een bekende kansformule en kan daardoor als definitie voor elke soort kans zijn opgevat.\n\n",
              "**Waarom dit niet klopt:** die verhouding definieert de Laplace-kans bij even waarschijnlijke uitkomsten. Een subjectieve kans berust op een onderbouwde inschatting en hoeft niet uit een telbare, equiprobabele uitkomstenruimte te volgen.\n\n",
              "**Denkregel:** koppel de berekeningswijze aan het kansbegrip: tellen bij Laplace, observeren bij experimentele kans en beargumenteerd inschatten bij subjectieve kans.\n\n",
              "**Volgende stap:** bepaal eerst welk kansbegrip past bij een deskundigeninschatting van recidiverisico en kies daarna opnieuw. ",
              "<a href='https://openstax.org/books/introductory-statistics-2e/pages/3-1-terminology' target='_blank' rel='noopener noreferrer'>Lees meer</a>"
            )
          )

          key <- if (length(generated) == 1L && is.finite(generated)) as.character(generated) else ""
          msg <- if (key %in% names(feedbacks)) feedbacks[[key]] else NULL

          if (is.null(msg)) {
            msg <- paste0(
              "**Controleer je invoer:** je invoer komt niet overeen met één van de aangeboden optienummers.\n\n",
              "**Waarom dit niet klopt:** de evaluator kan de inhoudelijke keuze alleen beoordelen wanneer je één getal van 1 tot en met 4 invoert.\n\n",
              "**Denkregel:** koppel elke antwoordoptie aan haar nummer en voer uitsluitend dat ene nummer in.\n\n",
              "**Volgende stap:** lees de vier opties opnieuw en dien alleen het nummer van je keuze in. ",
              "<a href='https://openstax.org/books/introductory-statistics-2e/pages/3-1-terminology' target='_blank' rel='noopener noreferrer'>Lees meer</a>"
            )
          }

          get_reporter()$add_message(msg, type = "markdown")
          identical(key, as.character(expected))
        }
      )
    }
  )
})
