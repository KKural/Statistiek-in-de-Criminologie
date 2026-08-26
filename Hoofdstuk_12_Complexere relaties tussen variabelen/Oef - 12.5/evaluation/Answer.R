context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        2,  # Correct answer: Twee indirecte paden
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "❌ Fout. **Waarschijnlijke redenering:** je hebt mogelijk een gedeeld beginstuk als één volledig indirect pad geteld en de latere vertakkingen niet afzonderlijk gevolgd.\n\n**Waarom dit niet klopt:** een volledig pad loopt ononderbroken van de bron tot de uitkomst; elke unieke vertakking kan een afzonderlijke route vormen.\n\n**Denkregel:** elk uniek volledig gericht traject van bron naar uitkomst via minstens één tussenvariabele telt als een afzonderlijk indirect pad.\n\n**Volgende stap:** teken of kleur iedere vertakking afzonderlijk en volg elke route helemaal tot de uitkomst voordat je telt.",
            "2" = "✅ Juist! **Empathische perspectiefneming** werkt via **twee indirecte paden** door op Moreel oordeel:\n\n1. via Morele intuities (ind.) → Geanticipeerde schuld → Moreel oordeel\n2. via Morele intuities (ind.) → Morele boosheid → Moreel oordeel",
            "3" = "❌ Fout. **Waarschijnlijke redenering:** je hebt mogelijk een route dubbel geteld of een verbinding meegeteld die geen volledig gericht pad vormt.\n\n**Waarom dit niet klopt:** alleen unieke, ononderbroken routes die alle pijlen van bron tot uitkomst volgen, tellen mee.\n\n**Denkregel:** een gedeeld deel van verschillende routes is geen extra route op zichzelf.\n\n**Volgende stap:** schrijf elk volledig pad op een aparte regel en verwijder routes die onderbroken zijn of exact dubbel voorkomen.",
            "4" = "❌ Fout. **Waarschijnlijke redenering:** je hebt mogelijk elke tussenvariabele of losse pijl als een nieuw pad geteld.\n\n**Waarom dit niet klopt:** een indirect pad is de volledige keten van bron tot uitkomst, niet het aantal knopen of pijlen in die keten.\n\n**Denkregel:** tel volledige unieke routes van begin- tot eindvariabele.\n\n**Volgende stap:** volg elke vertakking vanaf de bron tot de uitkomst en tel pas nadat alle complete routes zijn uitgeschreven."
          )
          key <- as.character(generated)
          msg <- feedbacks[[key]] %||% "❌ Geef een getal tussen 1 en 4 in."
          if (identical(generated, expected)) {
            msg <- paste0(msg, "\n\n**Bevestiging:** deze keuze komt overeen met de ongewijzigde antwoordsleutel.\n\n**Denkregel:** tel unieke volledige gerichte routes van bron naar uitkomst, niet losse pijlen of tussenschakels.\n\n**Transferstap:** schrijf bij een nieuw model elke route als een afzonderlijke keten en vink af dat begin- en eindvariabele kloppen.")
          } else if (!key %in% names(feedbacks)) {
          msg <- paste0(msg, "\n\n**Controleer je invoer:** de invoer is leeg, niet-numeriek of buiten de aangeboden opties; daardoor kan geen inhoudelijke keuze worden vastgesteld.\n\n**Waarom dit niet klopt:** alleen één van de aangeboden optienummers kan met de antwoordsleutel worden beoordeeld.\n\n**Denkregel:** kies een geldig aantal uit opties 1–4 nadat volledige routes zijn uitgeschreven.\n\n**Volgende stap:** voer één optienummer in.")
          }
          get_reporter()$add_message(msg, type = "markdown")
          generated == expected
        }
      )
    }
  )
})
