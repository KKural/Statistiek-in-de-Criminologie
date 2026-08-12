# **Bevestiging:** correct-option feedback below confirms the answer and its conceptual basis.
context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        2, # Correct answer: generatieve causaliteit
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
          "1" = "❌ **Waarschijnlijke redenering:** **Je keuze is consistent met het sleutelwoord ‘causaliteit’, maar je focust op een interventievergelijking.** Tegenfeitelijke causaliteit vraagt: *wat zou er gebeuren als X anders was?* De vraag vraagt hier naar het proces dat het effect voortbrengt. Dit is een voorzichtige hypothese op basis van je keuze; dezelfde optie kan ook om een andere reden zijn gekozen.\n\n**Waarom dit niet klopt:** de gekozen optie voldoet niet aan het beslissende criterium dat in de uitleg hierboven wordt onderscheiden.\n\n**Denkregel:** staat *wat als* centraal, denk tegenfeitelijk; staat *hoe ontstaat het effect* centraal, denk generatief. Zie theorieboek p. 118.\n\n**Volgende stap:** pas de denkregel toe op een nieuw criminologisch voorbeeld en benoem het beslissende criterium vóór je kiest.",

          "2" = "**Bevestiging:** ✅ **Juist.** Generatieve (productieve) causaliteit beschrijft het **onderliggende mechanisme**: welke actoren, processen of interacties ervoor zorgen dat X tot Y leidt.\n\n**Denkregel:** probeer het mechanisme als een keten te formuleren: X → proces/actor → Y. Zie theorieboek p. 117.\n\n**Transferstap:** formuleer dezelfde regel voor een nieuw criminologisch voorbeeld en noteer welk gegeven je daarvoor eerst moet controleren.",

          "3" = "❌ **Waarschijnlijke redenering:** **Je keuze suggereert dat een stabiel statistisch verband ook verklaart hoe het effect ontstaat.** Dit is een voorzichtige hypothese op basis van je keuze; dezelfde optie kan ook om een andere reden zijn gekozen.\n\n**Waarom dit niet klopt:** robuuste afhankelijkheid toont dat X en Y samenhangen, maar benoemt geen voortbrengend proces.\n\n**Denkregel:** vraag jezelf af: kan ik de actoren, stappen of interacties tussen X en Y beschrijven? Zo ja, dan zoek je generatieve causaliteit. Zie theorieboek p. 118.\n\n**Volgende stap:** pas de denkregel toe op een nieuw criminologisch voorbeeld en benoem het beslissende criterium vóór je kiest.",

          "4" = "❌ **Waarschijnlijke redenering:** **Je keuze is begrijpelijk omdat contributieve oorzaken een effect helpen verklaren, maar ze beantwoorden een andere vraag.** Dit is een voorzichtige hypothese op basis van je keuze; dezelfde optie kan ook om een andere reden zijn gekozen.\n\n**Waarom dit niet klopt:** contributief betekent dat een factor bijdraagt; het specificeert niet welk proces het effect produceert.\n\n**Denkregel:** onderscheid *draagt X bij?* van *via welk mechanisme produceert X het effect?* De tweede vraag is generatief. Zie theorieboek p. 116.\n\n**Volgende stap:** pas de denkregel toe op een nieuw criminologisch voorbeeld en benoem het beslissende criterium vóór je kiest."

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
