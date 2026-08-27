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
            "1" = "❌ Fout. **Waarschijnlijke redenering:** je hebt mogelijk de gedeelde eerste stap via Morele intuïties (individualiserend) als één volledig indirect pad geteld. Daarna splitst de route echter naar Schuld en Boosheid.\n\n**Denkregel:** elk uniek volledig gericht traject van bron naar uitkomst via minstens één tussenvariabele telt als een afzonderlijk indirect pad.\n\n**Volgende stap:** volg elke vertakking tot Moreel oordeel: één route loopt via Geanticipeerde schuld en één via Morele boosheid.\n\n**Correct antwoord:** 2 (twee indirecte paden)",
            "2" = "✅ Juist! **Empathische perspectiefneming** werkt via **twee indirecte paden** door op Moreel oordeel:\n\n1. via Morele intuities (ind.) → Geanticipeerde schuld → Moreel oordeel\n2. via Morele intuities (ind.) → Morele boosheid → Moreel oordeel",
            "3" = "❌ Fout. **Waarschijnlijke redenering:** je hebt mogelijk een route dubbel geteld of een verbinding meegeteld die geen volledig gericht pad van Perspectiefneming naar Moreel oordeel vormt.\n\n**Denkregel:** noteer alleen unieke, ononderbroken routes die de pijlen van bron tot uitkomst volgen; een gedeeld deel van twee routes telt niet als extra route.\n\n**Volgende stap:** schrijf de routes volledig uit. Ze eindigen respectievelijk via Geanticipeerde schuld en via Morele boosheid.\n\n**Correct antwoord:** 2",
            "4" = "❌ Fout. **Waarschijnlijke redenering:** je hebt mogelijk elke tussenvariabele afzonderlijk als een nieuw pad geteld. Een pad is echter de volledige keten, niet het aantal variabelen dat erin voorkomt.\n\n**Denkregel:** tel volledige unieke routes van begin- tot eindvariabele, niet losse knopen of pijlen.\n\n**Volgende stap:** kleur de twee vertakkingen na Morele intuïties (individualiserend) afzonderlijk en volg ze allebei tot Moreel oordeel.\n\n**Correct antwoord:** 2 (twee indirecte paden)"
          )
          key <- as.character(generated)
          msg <- feedbacks[[key]] %||% "❌ Geef een getal tussen 1 en 4 in."
          if (identical(generated, expected)) {
            msg <- paste0(msg, "\n\n**Bevestiging:** deze keuze komt overeen met de ongewijzigde antwoordsleutel.\n\n**Denkregel:** tel unieke volledige gerichte routes van bron naar uitkomst, niet losse pijlen of tussenschakels.\n\n**Transferstap:** schrijf bij een nieuw model elke route als een afzonderlijke keten en vink af dat begin- en eindvariabele kloppen.")
          } else if (key %in% names(feedbacks)) {
            msg <- sub("**Denkregel:**", "**Waarom dit niet klopt:** het gekozen aantal telt een gedeeld segment, losse variabelen of een onvolledige route als afzonderlijk pad.\n\n**Denkregel:**", msg, fixed = TRUE)
          } else {
          msg <- paste0(msg, "\n\n**Controleer je invoer:** de invoer is leeg, niet-numeriek of buiten de aangeboden opties; daardoor kan geen inhoudelijke keuze worden vastgesteld.\n\n**Waarom dit niet klopt:** alleen één van de aangeboden optienummers kan met de antwoordsleutel worden beoordeeld.\n\n**Denkregel:** kies een geldig aantal uit opties 1–4 nadat volledige routes zijn uitgeschreven.\n\n**Volgende stap:** voer één optienummer in.")
          }
          get_reporter()$add_message(msg, type = "markdown")
          generated == expected
        }
      )
    }
  )
})
