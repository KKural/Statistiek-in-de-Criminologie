# **Bevestiging:** correct-option feedback below confirms the answer and its conceptual basis.
context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        3, # Correct answer: inhoudelijk veronderstelde beïnvloeding
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "❌ **Waarschijnlijke redenering:** **Je keuze is begrijpelijk omdat beide variabelen samen veranderen, maar je veronderstelt daardoor wederzijdse beïnvloeding.** Dit is een voorzichtige hypothese op basis van je keuze; dezelfde optie kan ook om een andere reden zijn gekozen.\n\n**Waarom dit niet klopt:** wederzijdse beïnvloeding geeft geen enkele richting X → Y en past bij een symmetrische relatie.\n\n**Denkregel:** teken eerst één inhoudelijk gemotiveerde pijl. Kun je X als verklaring en Y als uitkomst benoemen, dan is de relatie asymmetrisch. <a href='https://www.youtube.com/watch?v=cQ-zAFzdckI' target='_blank' rel='noopener noreferrer'>Bekijk video</a>\n\n**Volgende stap:** pas de denkregel toe op een nieuw criminologisch voorbeeld en benoem het beslissende criterium vóór je kiest.",
            "2" = "❌ **Waarschijnlijke redenering:** **Je antwoord suggereert dat samenhang betekent dat de variabelen dezelfde theoretische rol hebben.** Dit is een voorzichtige hypothese op basis van je keuze; dezelfde optie kan ook om een andere reden zijn gekozen.\n\n**Waarom dit niet klopt:** bij asymmetrie worden de rollen juist onderscheiden: één variabele is verklarend, de andere te verklaren.\n\n**Denkregel:** benoem vóór de analyse expliciet: wat is X, wat is Y en welke richting verwacht de theorie? <a href='https://www.youtube.com/watch?v=cQ-zAFzdckI' target='_blank' rel='noopener noreferrer'>Bekijk video</a>\n\n**Volgende stap:** pas de denkregel toe op een nieuw criminologisch voorbeeld en benoem het beslissende criterium vóór je kiest.",
            "3" = "**Bevestiging:** ✅ **Juist.** In een asymmetrische relatie veronderstellen we inhoudelijk dat X de uitkomst Y beïnvloedt. De richting komt uit theorie en onderzoeksopzet, niet alleen uit de cijfers.\n\n**Denkregel:** schrijf de hypothese steeds als een gerichte pijl: X → Y. <a href='https://www.youtube.com/watch?v=cQ-zAFzdckI' target='_blank' rel='noopener noreferrer'>Bekijk video</a>\n\n**Transferstap:** formuleer dezelfde regel voor een nieuw criminologisch voorbeeld en noteer welk gegeven je daarvoor eerst moet controleren.",
            "4" = "❌ **Waarschijnlijke redenering:** **Je keuze laat zien dat je terecht aan een derde variabele denkt, maar je verwart twee concepten.** Dit is een voorzichtige hypothese op basis van je keuze; dezelfde optie kan ook om een andere reden zijn gekozen.\n\n**Waarom dit niet klopt:** een gemeenschappelijke oorzaak kan een schijnverband creëren; asymmetrie gaat over de veronderstelde richting tussen X en Y.\n\n**Denkregel:** vraag eerst *welke richting heeft de relatie?* en daarna afzonderlijk *kan Z het verband verklaren?* <a href='https://www.youtube.com/watch?v=cQ-zAFzdckI' target='_blank' rel='noopener noreferrer'>Bekijk video</a>\n\n**Volgende stap:** pas de denkregel toe op een nieuw criminologisch voorbeeld en benoem het beslissende criterium vóór je kiest."
          )
          key <- as.character(generated)
          msg <- feedbacks[[key]] %||% "❌ Geef een getal tussen 1 en 4 in."
          if (!key %in% names(feedbacks)) {
            msg <- paste0(
              "**Mogelijke denkroute:** je invoer lijkt niet overeen te komen met één van de aangeboden optienummers; dit kan een typefout of een andere invoerinterpretatie zijn.\n\n",
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
