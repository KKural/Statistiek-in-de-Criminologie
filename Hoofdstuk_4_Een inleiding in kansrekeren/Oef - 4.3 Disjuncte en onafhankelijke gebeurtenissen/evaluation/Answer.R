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
              "**Waarom deze keuze begrijpelijk kan lijken:** 'kunnen niet samen voorkomen' kan intuïtief klinken alsof de gebeurtenissen niets met elkaar te maken hebben. Dat is echter niet de statistische betekenis van onafhankelijkheid.\n\n",
              "**Waarom dit niet klopt:** disjunctie geeft P(A ∩ B)=0. Omdat P(A)>0 en P(B)>0, is P(A)P(B)>0; daarmee faalt de onafhankelijkheidsvoorwaarde P(A ∩ B)=P(A)P(B).\n\n",
              "**Denkregel:** disjunct betekent geen gezamenlijke uitkomst; onafhankelijk betekent dat kennis van de ene gebeurtenis de kans op de andere niet verandert.\n\n",
              "**Volgende stap:** vergelijk P(B|A)=0 met P(B)>0 en beoordeel onafhankelijkheid opnieuw. ",
              "<a href='https://openstax.org/books/introductory-statistics-2e/pages/3-2-independent-and-mutually-exclusive-events' target='_blank' rel='noopener noreferrer'>Lees meer</a>"
            ),
            "2" = paste0(
              "**Bevestiging:** juist. Door de registratie in precies één primaire categorie zijn A en B disjunct: P(A ∩ B)=0. Ze zijn niet onafhankelijk, want bij positieve kansen geldt P(A)P(B)>0 en dus P(A ∩ B)≠P(A)P(B).\n\n",
              "**Denkregel:** toets disjunctie met P(A ∩ B)=0 en onafhankelijkheid afzonderlijk met P(A ∩ B)=P(A)P(B).\n\n",
              "**Transferstap:** beoordeel op dezelfde manier de gebeurtenissen 'primaire categorie fraude' en 'primaire categorie cybercriminaliteit' in een register met precies één primaire categorie. ",
              "<a href='https://openstax.org/books/introductory-statistics-2e/pages/3-2-independent-and-mutually-exclusive-events' target='_blank' rel='noopener noreferrer'>Lees meer</a>"
            ),
            "3" = paste0(
              "**Waarom deze keuze begrijpelijk kan lijken:** de categorieën hebben verschillende labels, waardoor je ze mogelijk als afzonderlijke, onafhankelijke kenmerken hebt behandeld.\n\n",
              "**Waarom dit niet klopt:** de regel 'exact één primaire categorie' maakt een gezamenlijke registratie onmogelijk, dus de gebeurtenissen zijn juist disjunct. Bovendien verlaagt A de voorwaardelijke kans op B tot nul, zodat ze niet onafhankelijk zijn.\n\n",
              "**Denkregel:** kijk niet alleen naar verschillende labels; controleer of één incident beide gebeurtenissen tegelijk kan realiseren en vergelijk daarna P(B|A) met P(B).\n\n",
              "**Volgende stap:** gebruik de registratie-eis om eerst P(A ∩ B) te bepalen en toets vervolgens de onafhankelijkheidsvergelijking. ",
              "<a href='https://openstax.org/books/introductory-statistics-2e/pages/3-2-independent-and-mutually-exclusive-events' target='_blank' rel='noopener noreferrer'>Lees meer</a>"
            ),
            "4" = paste0(
              "**Waarom deze keuze begrijpelijk kan lijken:** in de werkelijkheid kan één incident meerdere kenmerken hebben; je hebt die inhoudelijke mogelijkheid wellicht verward met de hier vastgelegde primaire registratiecategorie.\n\n",
              "**Waarom dit niet klopt:** binnen de gedefinieerde uitkomstenruimte krijgt elk incident exact één primaire categorie. A en B kunnen daarom niet samen optreden en zijn dus disjunct.\n\n",
              "**Denkregel:** baseer de gebeurtenisrelatie op de operationele definitie in de vraag, niet op kenmerken die buiten die definitie mogelijk zijn.\n\n",
              "**Volgende stap:** pas de zin 'exact één primaire categorie' toe om de doorsnede A ∩ B vast te stellen en beoordeel daarna de twee begrippen afzonderlijk. ",
              "<a href='https://openstax.org/books/introductory-statistics-2e/pages/3-2-independent-and-mutually-exclusive-events' target='_blank' rel='noopener noreferrer'>Lees meer</a>"
            )
          )

          key <- if (length(generated) == 1L && is.finite(generated)) as.character(generated) else ""
          msg <- if (key %in% names(feedbacks)) feedbacks[[key]] else NULL

          if (is.null(msg)) {
            msg <- paste0(
              "**Controleer je invoer:** je invoer komt niet overeen met één van de aangeboden optienummers.\n\n",
              "**Waarom dit niet klopt:** de evaluator kan de gekozen uitspraak alleen beoordelen wanneer je één getal van 1 tot en met 4 invoert.\n\n",
              "**Denkregel:** beoordeel disjunctie en onafhankelijkheid als twee afzonderlijke eigenschappen en voer daarna één optienummer in.\n\n",
              "**Volgende stap:** kies de optie die bij beide afzonderlijke toetsen past en dien alleen dat nummer in. ",
              "<a href='https://openstax.org/books/introductory-statistics-2e/pages/3-2-independent-and-mutually-exclusive-events' target='_blank' rel='noopener noreferrer'>Lees meer</a>"
            )
          }

          get_reporter()$add_message(msg, type = "markdown")
          identical(key, as.character(expected))
        }
      )
    }
  )
})
