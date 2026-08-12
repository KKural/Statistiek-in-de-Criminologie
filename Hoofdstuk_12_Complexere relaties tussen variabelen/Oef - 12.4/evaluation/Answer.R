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
            "1" = "❌ Fout. **Waarschijnlijke redenering:** je hebt mogelijk de juiste doelvariabele maar de verkeerde bronvariabele gevolgd. **.21** hoort bij Empathische perspectiefneming → Geanticipeerde schuld.\n\n**Beslisregel:** een padcoëfficiënt hoort bij één specifieke gerichte pijl; controleer zowel het vertrekpunt als het eindpunt.\n\n**Volgende stap:** begin bij Morele intuïties (individualiserend), volg uitsluitend de pijl naar Geanticipeerde schuld en lees daar **.18** af.\n\n**Correct antwoord:** 3",
            "2" = "❌ Fout. **Waarschijnlijke redenering:** je hebt mogelijk opnieuw een pijl naar Geanticipeerde schuld gelezen, maar vanaf Empathische bezorgdheid. Bij die pijl staat **.34**.\n\n**Beslisregel:** dezelfde doelvariabele kan meerdere inkomende pijlen met verschillende coëfficiënten hebben.\n\n**Volgende stap:** markeer eerst de gevraagde bron én het gevraagde doel; lees pas daarna het getal op de verbindende pijl.\n\n**Correct antwoord:** 3 (.18)",
            "3" = "✅ Juist! De padcoëfficiënt van **Morele intuities (individualiserend) → Geanticipeerde schuld** is **.18**. Dit pad is statistisch significant (p < .001).",
            "4" = "❌ Fout. **Waarschijnlijke redenering:** je hebt mogelijk een pijl gekozen die eindigt bij Morele intuïties (individualiserend), in plaats van de pijl die daar vertrekt. **.48** hoort bij Empathische bezorgdheid → Morele intuïties (individualiserend).\n\n**Beslisregel:** lees een gericht pad van bron naar doel in de richting van de pijlpunt.\n\n**Volgende stap:** vertrek vanuit Morele intuïties (individualiserend) en volg de uitgaande pijl naar Geanticipeerde schuld.\n\n**Correct antwoord:** 3 (.18)"
          )
          key <- as.character(generated)
          msg <- feedbacks[[key]] %||% "❌ Geef een getal tussen 1 en 4 in."
          get_reporter()$add_message(msg, type = "markdown")
          generated == expected
        }
      )
    }
  )
})
