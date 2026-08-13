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
              "**Waarom deze keuze begrijpelijk kan lijken:** optellen past bij het woord 'of', maar je hebt mogelijk de expliciete overlap tussen A en B buiten beschouwing gelaten.\n\n",
              "**Waarom dit niet klopt:** dossiers in A ∩ B staan zowel in P(A) als in P(B) en worden met deze formule dus tweemaal geteld. De overlap moet eenmaal worden afgetrokken.\n\n",
              "**Denkregel:** gebruik de speciale somregel zonder aftrek alleen voor disjuncte gebeurtenissen; gebruik bij mogelijke overlap de algemene somregel.\n\n",
              "**Volgende stap:** markeer A ∩ B in een venndiagram en corrigeer de dubbele telling. ",
              "<a href='https://openstax.org/books/introductory-statistics-2e/pages/3-3-two-basic-rules-of-probability' target='_blank' rel='noopener noreferrer'>Lees meer</a>"
            ),
            "2" = paste0(
              "**Bevestiging:** juist. De algemene somregel P(A ∪ B)=P(A)+P(B)−P(A ∩ B) telt alle dossiers in A of B precies eenmaal.\n\n",
              "**Denkregel:** bij 'A of B' controleer je eerst of overlap mogelijk is; zo ja, trek je P(A ∩ B) eenmaal af.\n\n",
              "**Transferstap:** pas dezelfde regel toe op 'eerder veroordeeld of jonger dan 25' wanneer 12% van de dossiers aan beide kenmerken voldoet. ",
              "<a href='https://openstax.org/books/introductory-statistics-2e/pages/3-3-two-basic-rules-of-probability' target='_blank' rel='noopener noreferrer'>Lees meer</a>"
            ),
            "3" = paste0(
              "**Waarom deze keuze begrijpelijk kan lijken:** vermenigvuldigen is een centrale kansregel en kan worden geassocieerd met het combineren van twee gebeurtenissen.\n\n",
              "**Waarom dit niet klopt:** een productregel berekent een doorsnede ('A en B'), onder passende onafhankelijkheids- of voorwaardelijke aannames. De vraag vraagt naar de unie ('A of B').\n\n",
              "**Denkregel:** vertaal eerst de taal: 'en' wijst naar een doorsnede; 'of' wijst naar een unie en dus naar een somregel.\n\n",
              "**Volgende stap:** onderstreep het woord 'of' en kies de formule die de unie mét overlap berekent. ",
              "<a href='https://openstax.org/books/introductory-statistics-2e/pages/3-3-two-basic-rules-of-probability' target='_blank' rel='noopener noreferrer'>Lees meer</a>"
            ),
            "4" = paste0(
              "**Waarom deze keuze begrijpelijk kan lijken:** de overlap A ∩ B komt in de vraag voor en je hebt die mogelijk gekoppeld aan de formule voor een voorwaardelijke kans.\n\n",
              "**Waarom dit niet klopt:** P(A ∩ B)/P(B) is P(A|B), de kans op A binnen de beperkte uitkomstenruimte B. Dat is niet de kans op alle dossiers in A of B.\n\n",
              "**Denkregel:** een deling door P(B) beperkt de uitkomstenruimte tot B; een unie combineert de uitkomsten van A en B.\n\n",
              "**Volgende stap:** beschrijf in woorden wat A|B en A ∪ B elk omvatten en kies daarna de unieformule. ",
              "<a href='https://openstax.org/books/introductory-statistics-2e/pages/3-3-two-basic-rules-of-probability' target='_blank' rel='noopener noreferrer'>Lees meer</a>"
            )
          )

          key <- if (length(generated) == 1L && is.finite(generated)) as.character(generated) else ""
          msg <- if (key %in% names(feedbacks)) feedbacks[[key]] else NULL

          if (is.null(msg)) {
            msg <- paste0(
              "**Controleer je invoer:** je invoer komt niet overeen met één van de aangeboden optienummers.\n\n",
              "**Waarom dit niet klopt:** de evaluator kan de gekozen formule alleen beoordelen wanneer je één getal van 1 tot en met 4 invoert.\n\n",
              "**Denkregel:** koppel elke formule aan haar optienummer en voer uitsluitend dat nummer in.\n\n",
              "**Volgende stap:** kies de formule voor een unie met overlap en dien alleen het bijbehorende nummer in. ",
              "<a href='https://openstax.org/books/introductory-statistics-2e/pages/3-3-two-basic-rules-of-probability' target='_blank' rel='noopener noreferrer'>Lees meer</a>"
            )
          }

          get_reporter()$add_message(msg, type = "markdown")
          identical(key, as.character(expected))
        }
      )
    }
  )
})
