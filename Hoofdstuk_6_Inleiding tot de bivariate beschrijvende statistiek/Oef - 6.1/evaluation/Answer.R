# **Bevestiging:** correct-option feedback below confirms the answer and its conceptual basis.
context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        3,  # Correct answer: causaliteit impliceert statistische samenhang
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "❌ **Waarschijnlijke redenering:** **Je keuze is begrijpelijk:** je koppelt een zichtbaar statistisch verband aan een oorzakelijke verklaring. Dit is een voorzichtige hypothese op basis van je keuze; dezelfde optie kan ook om een andere reden zijn gekozen.\n\n**Waarom dit niet klopt:** hetzelfde verband kan ontstaan door een derde variabele, omgekeerde richting of toeval. Samenhang is dus geen voldoende bewijs voor causaliteit.\n\n**Denkregel:** vraag apart: (1) is er samenhang, en (2) ondersteunen theorie, tijdsvolgorde, mechanisme en onderzoeksdesign een causale interpretatie? <a href='https://www.scribbr.com/methodology/correlation-vs-causation/' target='_blank' rel='noopener noreferrer'>Lees meer</a>\n\n**Volgende stap:** pas de denkregel toe op een nieuw criminologisch voorbeeld en benoem het beslissende criterium vóór je kiest.",
            "2" = "❌ **Waarschijnlijke redenering:** **Je antwoord past bij een veelvoorkomende overcorrectie:** omdat statistiek geen waterdicht causaal bewijs levert, concludeer je dat causaliteit nooit empirisch onderzocht kan worden. Dit is een voorzichtige hypothese op basis van je keuze; dezelfde optie kan ook om een andere reden zijn gekozen.\n\n**Waarom dit niet klopt:** experimenten, longitudinaal onderzoek en mediatieanalyse kunnen causale verklaringen wel degelijk ondersteunen, zonder absolute zekerheid te garanderen.\n\n**Denkregel:** onderscheid *empirisch onderbouwen* van *definitief bewijzen*. <a href='https://www.scribbr.com/methodology/correlation-vs-causation/' target='_blank' rel='noopener noreferrer'>Lees meer</a>\n\n**Volgende stap:** pas de denkregel toe op een nieuw criminologisch voorbeeld en benoem het beslissende criterium vóór je kiest.",
            "3" = "**Bevestiging:** ✅ **Juist.** Een echte causale relatie impliceert in de populatie statistische samenhang, maar de omgekeerde redenering is ongeldig: samenhang alleen bewijst geen causaliteit.\n\n**Denkregel:** onthoud de éénrichtingsregel: causaliteit → samenhang; samenhang ⇏ automatisch causaliteit. <a href='https://www.scribbr.com/methodology/correlation-vs-causation/' target='_blank' rel='noopener noreferrer'>Lees meer</a>\n\n**Transferstap:** formuleer dezelfde regel voor een nieuw criminologisch voorbeeld en noteer welk gegeven je daarvoor eerst moet controleren.",
            "4" = "❌ **Waarschijnlijke redenering:** **Je keuze suggereert dat je een causaal begrip en een statistische beschrijving als hetzelfde behandelt.** Dit is een voorzichtige hypothese op basis van je keuze; dezelfde optie kan ook om een andere reden zijn gekozen.\n\n**Waarom dit niet klopt:** een statistische relatie beschrijft hoe variabelen samen veranderen; causaliteit voegt een inhoudelijke uitspraak toe over wat een verandering voortbrengt. Een schijnverband kan dus statistisch sterk zijn zonder causaal te zijn.\n\n**Denkregel:** vraag: beschrijf ik alleen een patroon, of verklaar ik ook waarom X tot Y leidt? <a href='https://www.scribbr.com/methodology/correlation-vs-causation/' target='_blank' rel='noopener noreferrer'>Lees meer</a>\n\n**Volgende stap:** pas de denkregel toe op een nieuw criminologisch voorbeeld en benoem het beslissende criterium vóór je kiest."
          )
          key <- as.character(generated)
          msg <- feedbacks[[key]] %||% "❌ Geef een getal tussen 1 en 4 in."
          if (!key %in% names(feedbacks)) {
            msg <- paste0(
              "**Invoercontrole:** je invoer lijkt niet overeen te komen met één van de aangeboden optienummers; dit kan een typefout of een andere invoerinterpretatie zijn.\n\n",
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
