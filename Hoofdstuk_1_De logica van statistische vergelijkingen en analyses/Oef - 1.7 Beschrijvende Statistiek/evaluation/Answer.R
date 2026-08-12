context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        1,  # Correct answer: Q6 from your rotation pattern
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "✅ Juist! Beschrijvende statistiek helpt je om overzicht te krijgen van je data. Voorbeelden: 'De gemiddelde leeftijd van arrestanten was 28 jaar', '60% van de diefstallen gebeurde 's avonds', een grafiek van criminaliteitscijfers per maand. <a href='https://statistics.laerd.com/statistical-guides/descriptive-inferential-statistics.php' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            
            "2" = "❌ Fout. Dit wordt gedaan door inferentiële statistiek. Voorbeeld: op basis van steekproef van 500 mensen voorspellen hoeveel criminaliteit er in een hele stad is. <a href='https://statistics.laerd.com/statistical-guides/descriptive-inferential-statistics.php' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            
            "3" = "❌ Fout. Dit wordt gedaan door inferentiële statistiek. Voorbeeld: testen of werkloosheid echt zorgt voor meer criminaliteit met p-waarden en significantietests. <a href='https://statistics.laerd.com/statistical-guides/descriptive-inferential-statistics.php' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            
            "4" = "❌ Fout. Dit wordt gedaan door predictieve analyse. Beschrijvende statistiek kijkt alleen naar de data die je al hebt. <a href='https://statistics.laerd.com/statistical-guides/descriptive-inferential-statistics.php' target='_blank' rel='noopener noreferrer'>Lees meer</a>"
          )
          
          likely_reasons <- list(
            "2" = "je zag mogelijk een statistische samenvatting als basis voor een uitspraak over de hele populatie, maar die generalisatie is inferentieel.",
            "3" = "je koppelde het toetsen van een inhoudelijke verklaring mogelijk aan statistiek in het algemeen, terwijl hypothesetoetsing buiten louter beschrijven valt.",
            "4" = "je verwarde mogelijk het samenvatten van bestaande gegevens met het voorspellen van toekomstige of onbekende uitkomsten."
          )
          key <- as.character(generated)
          msg <- feedbacks[[key]] %||% "❌ Geef een getal tussen 1 en 4 in."
          if (key %in% names(feedbacks) && generated != expected) {
            msg <- paste0(
              "**Waarom deze keuze begrijpelijk kan lijken:** ", likely_reasons[[key]], "\n\n",
              "**Waarom dit niet klopt:** ",
              msg,
              "\n\n**Denkregel:** Vraag of een uitspraak bij de gemeten data blijft of een conclusie buiten die data trekt; alleen het eerste is beschrijvend.\n\n",
              "**Volgende stap:** Markeer welke optie uitsluitend de waargenomen gegevens samenvat en kies die opnieuw."
            )
          } else if (key %in% names(feedbacks) && generated == expected) {
            msg <- paste0(
              "**Bevestiging:** je gekozen optie is correct.\n\n",
              msg,
              "\n\n**Denkregel:** Beschrijvende statistiek organiseert en vat de geobserveerde data samen zonder automatisch naar een populatie te generaliseren.\n\n",
              "**Transferstap:** Formuleer een gemiddelde en percentage die alleen de geregistreerde inbraken in de steekproef beschrijven."
            )
          }
          
          if (!key %in% names(feedbacks)) {
            msg <- paste0(
              "**Controleer je invoer:** je invoer lijkt niet overeen te komen met één van de aangeboden optienummers; dit kan een typefout of een andere invoerinterpretatie zijn.\n\n",
              "**Waarom dit niet klopt:** de evaluator kan alleen een inhoudelijke optie beoordelen wanneer één geldig optienummer is ingevoerd.\n\n",
              "**Denkregel:** koppel eerst elke antwoordoptie aan haar nummer en voer uitsluitend dat ene nummer in.\n\n",
              "**Volgende stap:** lees de opties opnieuw, kies het nummer dat bij je redenering hoort en dien alleen dat nummer in."
            )
          }
          get_reporter()$add_message(msg, type = "markdown")
          
          generated == expected
        }
      )
    }
  )
})
