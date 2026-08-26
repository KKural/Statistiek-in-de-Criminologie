context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        2,
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "❌ Fout. **Waarschijnlijke redenering:** je hebt mogelijk één denkbare bron van onverklaarde variantie als de enige bewezen oorzaak geïnterpreteerd.\n\n**Waarom dit niet klopt:** meetfout kan een rol spelen, maar R² alleen identificeert geen specifieke oorzaak.\n\n**Denkregel:** `1 − R²` kwantificeert hoeveel variantie het model niet verklaart; het diagnosticeert niet waarom.\n\n**Volgende stap:** zoek de antwoordoptie die alleen een voorzichtige, algemeen ondersteunde interpretatie geeft en geen specifieke oorzaak als bewezen voorstelt.",
            "2" = "✅ Juist! De **57% onverklaarde variantie** betekent dat er andere factoren zijn die het moreel oordeel beïnvloeden maar niet in dit model zijn opgenomen. Het model is een theoretisch gemotiveerde vereenvoudiging van de werkelijkheid — niet alle determinanten van moreel oordeel zijn erin opgenomen.",
            "3" = "❌ Fout. **Waarschijnlijke redenering:** je hebt mogelijk de omvang van afzonderlijke padcoëfficiënten gelijkgesteld aan het onverklaarde aandeel.\n\n**Waarom dit niet klopt:** padcoëfficiënten en R² beschrijven verschillende eigenschappen van het model; R² toont niet dat alle afzonderlijke paden te klein zijn.\n\n**Denkregel:** padcoëfficiënten beschrijven specifieke verbanden, terwijl R² het gezamenlijk verklaarde aandeel in de uitkomst beschrijft.\n\n**Volgende stap:** beperk je interpretatie tot wat het gezamenlijke verklaarde en onverklaarde aandeel daadwerkelijk ondersteunt.",
            "4" = "❌ Fout. **Waarschijnlijke redenering:** je hebt mogelijk een onvolledig verklaard aandeel geïnterpreteerd als bewijs dat het model te complex of onbetrouwbaar is.\n\n**Waarom dit niet klopt:** R² alleen beoordeelt niet hoeveel variabelen een model mag bevatten en bewijst geen onbetrouwbaarheid.\n\n**Denkregel:** onverklaarde variantie zegt welk aandeel buiten de voorspelling van dit model blijft, niet waarom dat zo is.\n\n**Volgende stap:** kies een interpretatie die geen modeldiagnose claimt die niet rechtstreeks uit R² volgt."
          )
          key <- as.character(generated)
          msg <- feedbacks[[key]] %||% "❌ Geef een getal tussen 1 en 4 in."
          if (identical(generated, expected)) {
            msg <- paste0(msg, "\n\n**Bevestiging:** deze keuze komt overeen met de ongewijzigde antwoordsleutel.\n\n**Denkregel:** 1 − R² kwantificeert wat het model niet verklaart, maar identificeert zonder extra analyse geen specifieke oorzaak.\n\n**Transferstap:** formuleer bij een nieuw model mogelijke ontbrekende factoren als hypothesen, niet als bewezen verklaringen.")
          } else if (!key %in% names(feedbacks)) {
          msg <- paste0(msg, "\n\n**Controleer je invoer:** de invoer is leeg, niet-numeriek of buiten de aangeboden opties; daardoor kan geen inhoudelijke keuze worden vastgesteld.\n\n**Waarom dit niet klopt:** alleen één van de aangeboden optienummers kan met de antwoordsleutel worden beoordeeld.\n\n**Denkregel:** kies een geldige optie die onverklaarde variantie voorzichtig interpreteert.\n\n**Volgende stap:** voer 1, 2, 3 of 4 in en vermijd causale zekerheid uit R² alleen.")
          }
          get_reporter()$add_message(msg, type = "markdown")
          generated == expected
        }
      )
    }
  )
})
