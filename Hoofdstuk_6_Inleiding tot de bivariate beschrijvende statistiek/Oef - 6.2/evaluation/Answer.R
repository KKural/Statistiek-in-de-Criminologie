# **Bevestiging:** correct-option feedback below confirms the answer and its conceptual basis.
context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        2, # Correct answer: contributieve oorzaken
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "❌ **Waarschijnlijke redenering:** **Je keuze is consistent met een deterministisch beeld van causaliteit:** een echte oorzaak moet volgens die redenering zowel altijd nodig als op zichzelf genoeg zijn. Dit is een voorzichtige hypothese op basis van je keuze; dezelfde optie kan ook om een andere reden zijn gekozen.\n\n**Waarom dit niet klopt:** crimineel gedrag ontstaat doorgaans uit meerdere risico-, beschermings- en contextfactoren; één factor is zelden noodzakelijk én voldoende.\n\n**Denkregel:** vraag bij elke factor: leidt zij alleen altijd tot het gevolg, en moet zij in elk geval aanwezig zijn? Meestal zijn beide antwoorden *nee*. <a href='https://bookdown.org/paul/applied-causal-analysis/deterministiccausation.html' target='_blank' rel='noopener noreferrer'>Lees meer</a>\n\n**Volgende stap:** pas de denkregel toe op een nieuw criminologisch voorbeeld en benoem het beslissende criterium vóór je kiest.",
            "2" = "**Bevestiging:** ✅ **Juist.** Contributieve oorzaken verhogen of verlagen de kans op een uitkomst, maar zijn afzonderlijk niet noodzakelijk en niet voldoende. Dat past bij de multicausale werkelijkheid van criminologisch gedrag.\n\n**Denkregel:** formuleer een risicofactor als een bijdrage binnen een combinatie van persoon, situatie en context. <a href='https://bookdown.org/paul/applied-causal-analysis/deterministiccausation.html' target='_blank' rel='noopener noreferrer'>Lees meer</a>\n\n**Transferstap:** formuleer dezelfde regel voor een nieuw criminologisch voorbeeld en noteer welk gegeven je daarvoor eerst moet controleren.",
            "3" = "❌ **Waarschijnlijke redenering:** **Je antwoord suggereert dat één factor op zichzelf het delict kan veroorzaken, ook al bestaan er andere routes.** Dit is een voorzichtige hypothese op basis van je keuze; dezelfde optie kan ook om een andere reden zijn gekozen.\n\n**Waarom dit niet klopt:** in criminologisch onderzoek is één factor zelden op zichzelf voldoende; de uitkomst hangt meestal af van een combinatie van omstandigheden.\n\n**Denkregel:** als de factor alleen niet steeds tot de uitkomst leidt, noem haar niet voldoende maar contributief. <a href='https://bookdown.org/paul/applied-causal-analysis/deterministiccausation.html' target='_blank' rel='noopener noreferrer'>Lees meer</a>\n\n**Volgende stap:** pas de denkregel toe op een nieuw criminologisch voorbeeld en benoem het beslissende criterium vóór je kiest.",
            "4" = "❌ **Waarschijnlijke redenering:** **Je keuze is consistent met de gedachte dat één factor in ieder geval aanwezig móét zijn.** Dit is een voorzichtige hypothese op basis van je keuze; dezelfde optie kan ook om een andere reden zijn gekozen.\n\n**Waarom dit niet klopt:** dezelfde criminologische uitkomst kan via verschillende combinaties van factoren ontstaan; één specifieke factor is daardoor zelden noodzakelijk.\n\n**Denkregel:** zoek naar mogelijke alternatieve causale routes. Bestaan die, dan is de factor niet noodzakelijk maar mogelijk contributief. <a href='https://bookdown.org/paul/applied-causal-analysis/deterministiccausation.html' target='_blank' rel='noopener noreferrer'>Lees meer</a>\n\n**Volgende stap:** pas de denkregel toe op een nieuw criminologisch voorbeeld en benoem het beslissende criterium vóór je kiest."
          )
          key <- as.character(generated)
          msg <- feedbacks[[key]] %||% "❌ Geef een getal tussen 1 en 4 in."
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
