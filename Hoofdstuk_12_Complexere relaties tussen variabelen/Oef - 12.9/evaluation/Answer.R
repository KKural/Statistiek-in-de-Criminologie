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
            "1" = "❌ Fout. **Waarschijnlijke redenering:** je hebt mogelijk één mogelijke bron van onverklaarde variantie als de enige bewezen oorzaak geïnterpreteerd. Meetfout kan een rol spelen, maar R² alleen toont dat niet aan.\n\n**Denkregel:** 1 − R² geeft aan hoeveel variantie het model niet verklaart; het identificeert niet automatisch de precieze oorzaak daarvan.\n\n**Volgende stap:** kies de breedste interpretatie die door R² wordt ondersteund: factoren buiten het opgenomen model kunnen nog invloed hebben.\n\n**Correct antwoord:** 2",
            "2" = "✅ Juist! De **57% onverklaarde variantie** betekent dat er andere factoren zijn die het moreel oordeel beïnvloeden maar niet in dit model zijn opgenomen. Het model is een theoretisch gemotiveerde vereenvoudiging van de werkelijkheid — niet alle determinanten van moreel oordeel zijn erin opgenomen.",
            "3" = "❌ Fout. **Waarschijnlijke redenering:** je hebt mogelijk de omvang van afzonderlijke padcoëfficiënten gelijkgesteld aan het onverklaarde aandeel. Dat zijn verschillende kenmerken van het model.\n\n**Denkregel:** padcoëfficiënten beschrijven specifieke verbanden; R² beschrijft het gezamenlijk verklaarde aandeel in de uitkomst.\n\n**Volgende stap:** interpreteer 57% als ruimte voor niet-opgenomen invloeden, zonder daaruit af te leiden dat alle paden te klein zijn.\n\n**Correct antwoord:** 2",
            "4" = "❌ Fout. **Waarschijnlijke redenering:** je hebt mogelijk een lager R² geïnterpreteerd als bewijs dat het model te complex of onbetrouwbaar is. R² alleen ondersteunt die diagnose niet.\n\n**Denkregel:** onverklaarde variantie zegt welk aandeel buiten de voorspelling van dit model blijft, niet hoeveel variabelen het model ‘zou mogen’ bevatten.\n\n**Volgende stap:** formuleer alleen wat de informatie toelaat: andere niet-opgenomen factoren kunnen Moreel oordeel mede beïnvloeden.\n\n**Correct antwoord:** 2"
          )
          key <- as.character(generated)
          msg <- feedbacks[[key]] %||% "❌ Geef een getal tussen 1 en 4 in."
          if (identical(generated, expected)) {
            msg <- paste0(msg, "\n\n**Bevestiging:** deze keuze komt overeen met de ongewijzigde antwoordsleutel.\n\n**Denkregel:** 1 − R² kwantificeert wat het model niet verklaart, maar identificeert zonder extra analyse geen specifieke oorzaak.\n\n**Transferstap:** formuleer bij een nieuw model mogelijke ontbrekende factoren als hypothesen, niet als bewezen verklaringen.")
          } else if (key %in% names(feedbacks)) {
            msg <- sub("**Denkregel:**", "**Waarom dit niet klopt:** de optie maakt uit R² alleen een specifieke diagnose die deze modelmaat niet kan aantonen.\n\n**Denkregel:**", msg, fixed = TRUE)
          } else {
          msg <- paste0(msg, "\n\n**Mogelijke denkroute:** de invoer is leeg, niet-numeriek of buiten de aangeboden opties; daardoor kan geen inhoudelijke keuze worden vastgesteld.\n\n**Waarom dit niet klopt:** alleen één van de aangeboden optienummers kan met de antwoordsleutel worden beoordeeld.\n\n**Denkregel:** kies een geldige optie die onverklaarde variantie voorzichtig interpreteert.\n\n**Volgende stap:** voer 1, 2, 3 of 4 in en vermijd causale zekerheid uit R² alleen.")
          }
          get_reporter()$add_message(msg, type = "markdown")
          generated == expected
        }
      )
    }
  )
})
