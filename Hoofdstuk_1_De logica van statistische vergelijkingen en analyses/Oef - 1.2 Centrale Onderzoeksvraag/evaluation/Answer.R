context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        4,  # Correct answer: To determine focus and direction
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "❌ Fout. De centrale vraag helpt inderdaad om het onderwerp te beperken, maar haar belangrijkste doel is het geven van richting en betekenis aan het hele onderzoek. <a href='https://handboeksgpl.sites.uu.nl/doing-research/central-question-and-sub-questions/?lang=en' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            
            "2" = "❌ Fout. De centrale onderzoeksvraag vormt juist het kader waarbinnen subvraagstukken of hypothesen ontwikkeld worden — ze vervangt die niet. <a href='https://handboeksgpl.sites.uu.nl/doing-research/central-question-and-sub-questions/?lang=en' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            
            "3" = "❌ Fout. De centrale onderzoeksvraag wordt vooraf opgesteld om het onderzoek te sturen, niet om de resultaten achteraf samen te vatten. <a href='https://handboeksgpl.sites.uu.nl/doing-research/central-question-and-sub-questions/?lang=en' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            
            "4" = "✅ Juist! De centrale onderzoeksvraag bepaalt de hoofdfocus, verduidelijkt wat onderzocht wordt en zorgt dat het onderzoek een duidelijke richting en samenhang heeft. <a href='https://handboeksgpl.sites.uu.nl/doing-research/central-question-and-sub-questions/?lang=en' target='_blank' rel='noopener noreferrer'>Lees meer</a>"
          )
          
          likely_reasons <- list(
            "1" = "je herkende terecht dat een centrale vraag het onderwerp afbakent, maar maakte dit mogelijke neveneffect tot haar volledige hoofdfunctie.",
            "2" = "je zag mogelijk de centrale vraag als vervanging voor hypothesen of deelvragen, omdat zij bovenaan de onderzoeksstructuur staat.",
            "3" = "je koppelde ‘centraal’ mogelijk aan een samenvatting achteraf, terwijl de vraag juist vooraf richting geeft."
          )
          key <- as.character(generated)
          msg <- feedbacks[[key]] %||% "❌ Geef een getal tussen 1 en 4 in."
          if (key %in% names(feedbacks) && generated != expected) {
            msg <- paste0(
              "**Waarschijnlijke redenering:** ", likely_reasons[[key]], "\n\n",
              "**Waarom dit niet klopt:** ",
              msg,
              "\n\n**Denkregel:** Verwar de centrale vraag niet met een methode, losse deelvraag of conclusie; zij legt de hoofdfocus vast.\n\n",
              "**Volgende stap:** Kies de optie die richting en samenhang van het volledige onderzoek beschrijft."
            )
          } else if (key %in% names(feedbacks) && generated == expected) {
            msg <- paste0(
              "**Bevestiging:** je gekozen optie is correct.\n\n",
              msg,
              "\n\n**Denkregel:** Een centrale vraag brengt doelgroep, kernvariabelen en het onderzochte verband of verschil samen en bewaakt de focus van het onderzoek.\n\n",
              "**Transferstap:** Formuleer een centrale vraag over politieaanwezigheid en onveiligheidsgevoelens en controleer of de deelvragen er logisch onder passen."
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
