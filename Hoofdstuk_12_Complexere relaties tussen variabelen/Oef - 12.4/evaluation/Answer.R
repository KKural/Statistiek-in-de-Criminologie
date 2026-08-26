context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        3,  # Correct answer: .18
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "❌ Fout. **Waarschijnlijke redenering:** je hebt mogelijk de juiste doelvariabele maar een andere bronvariabele gevolgd.\n\n**Waarom dit niet klopt:** een coëfficiënt hoort bij één specifieke gerichte pijl; dezelfde doelvariabele kan meerdere inkomende pijlen hebben.\n\n**Denkregel:** controleer vóór het aflezen zowel het vertrekpunt als het eindpunt van de pijl.\n\n**Volgende stap:** markeer de twee gevraagde variabelen, volg alleen hun rechtstreekse verbinding in de richting van de pijlpunt en lees opnieuw af.",
            "2" = "❌ Fout. **Waarschijnlijke redenering:** je hebt mogelijk een andere inkomende pijl naar de juiste doelvariabele gelezen.\n\n**Waarom dit niet klopt:** pijlen met hetzelfde eindpunt kunnen verschillende bronnen en dus verschillende coëfficiënten hebben.\n\n**Denkregel:** koppel een padcoëfficiënt altijd aan het volledige bron-doelpaar.\n\n**Volgende stap:** markeer eerst de gevraagde bron én het gevraagde doel; lees pas daarna het getal op de verbindende pijl.",
            "3" = "✅ Juist! De padcoëfficiënt van **Morele intuities (individualiserend) → Geanticipeerde schuld** is **.18**. Dit pad is statistisch significant (p < .001).",
            "4" = "❌ Fout. **Waarschijnlijke redenering:** je hebt mogelijk een pijl gekozen die bij de gevraagde bron eindigt, in plaats van daar te vertrekken.\n\n**Waarom dit niet klopt:** de richting van de pijlpunt bepaalt welk construct bron en welk construct doel is.\n\n**Denkregel:** lees een gericht pad altijd van bron naar doel in de richting van de pijlpunt.\n\n**Volgende stap:** vertrek bij de gevraagde bron, volg uitsluitend de uitgaande pijl naar het gevraagde doel en lees opnieuw af."
          )
          key <- as.character(generated)
          msg <- feedbacks[[key]] %||% "❌ Geef een getal tussen 1 en 4 in."
          if (identical(generated, expected)) {
            msg <- paste0(msg, "\n\n**Bevestiging:** deze keuze komt overeen met de ongewijzigde antwoordsleutel.\n\n**Denkregel:** lees een padcoëfficiënt pas nadat zowel bron als pijlpunt van precies dezelfde pijl zijn geïdentificeerd.\n\n**Transferstap:** dek in een nieuw diagram alle andere pijlen af en lees alleen het label op het gevraagde bron-doelpad.")
          } else if (!key %in% names(feedbacks)) {
          msg <- paste0(msg, "\n\n**Controleer je invoer:** de invoer is leeg, niet-numeriek of buiten de aangeboden opties; daardoor kan geen inhoudelijke keuze worden vastgesteld.\n\n**Waarom dit niet klopt:** alleen één van de aangeboden optienummers kan met de antwoordsleutel worden beoordeeld.\n\n**Denkregel:** alleen opties 1–4 kunnen aan een specifiek pad worden gekoppeld.\n\n**Volgende stap:** voer één optienummer in en volg de pijl van bron tot pijlpunt.")
          }
          get_reporter()$add_message(msg, type = "markdown")
          generated == expected
        }
      )
    }
  )
})
