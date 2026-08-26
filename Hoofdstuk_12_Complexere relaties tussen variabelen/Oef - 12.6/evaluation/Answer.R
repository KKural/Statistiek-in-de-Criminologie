context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        3, # Correct answer: 0.4264
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "❌ Fout. **Waarschijnlijke redenering:** je hebt mogelijk alleen het directe pad afgelezen en het indirecte pad niet meegerekend.\n\n**Waarom dit niet klopt:** een totaal effect bevat zowel het rechtstreekse effect als elk volledig indirect effect.\n\n**Denkregel:** totaal effect = direct effect + de producten van alle volledige indirecte paden.\n\n**Volgende stap:** markeer eerst het directe pad en daarna iedere volledige indirecte route; bereken elk onderdeel afzonderlijk voordat je optelt.",
            "2" = "❌ Fout. **Waarschijnlijke redenering:** deze waarde past mogelijk bij een reken- of decimalenfout, maar de precieze route is uit het antwoord alleen niet zeker.\n\n**Waarom dit niet klopt:** binnen een indirect pad moeten de coëfficiënten worden vermenigvuldigd; pas daarna wordt het padproduct bij het directe effect opgeteld.\n\n**Denkregel:** werk in twee fasen: eerst elk volledig padproduct, daarna de som met het directe effect.\n\n**Volgende stap:** schrijf de bewerking eerst symbolisch uit zonder getallen, vul vervolgens de coëfficiënten in en controleer de decimalen.",
            "3" = "✅ Juist! Het **totale effect** van Empathische bezorgdheid op Geanticipeerde schuld is **0.4264**:\n\n- Direct effect: **0.34**\n- Indirect effect via Morele intuities (ind.): 0.48 × 0.18 = **0.0864**\n- Totaal: 0.34 + 0.0864 = **0.4264**",
            "4" = "❌ Fout. **Waarschijnlijke redenering:** je hebt mogelijk slechts één coëfficiënt van het indirecte pad als volledig effect gebruikt.\n\n**Waarom dit niet klopt:** één coëfficiënt beschrijft maar één segment; een indirect effect omvat het product van de volledige route.\n\n**Denkregel:** een indirect effect is het product van alle coëfficiënten op de volledige route; het totale effect telt daar het directe pad bij.\n\n**Volgende stap:** volg het indirecte pad tot het eindpunt, noteer alle segmenten en bereken daarna pas het totale effect."
          )
          key <- as.character(generated)
          msg <- feedbacks[[key]] %||% "❌ Geef een getal tussen 1 en 4 in."
          if (identical(generated, expected)) {
            msg <- paste0(msg, "\n\n**Bevestiging:** deze keuze komt overeen met de ongewijzigde antwoordsleutel.\n\n**Denkregel:** totaal effect = direct effect + som van de producten binnen alle volledige indirecte paden.\n\n**Transferstap:** schrijf bij een nieuw model eerst direct, daarna elk padproduct en pas als laatste de som.")
          } else if (!key %in% names(feedbacks)) {
          msg <- paste0(msg, "\n\n**Controleer je invoer:** de invoer is leeg, niet-numeriek of buiten de aangeboden opties; daardoor kan geen inhoudelijke keuze worden vastgesteld.\n\n**Waarom dit niet klopt:** alleen één van de aangeboden optienummers kan met de antwoordsleutel worden beoordeeld.\n\n**Denkregel:** alleen een geldige optie kan worden gekoppeld aan direct plus indirect effect.\n\n**Volgende stap:** schrijf eerst symbolisch `direct effect + indirect padeffect` uit en voer daarna één geldig optienummer in.")
          }
          get_reporter()$add_message(msg, type = "markdown")
          generated == expected
        }
      )
    }
  )
})
