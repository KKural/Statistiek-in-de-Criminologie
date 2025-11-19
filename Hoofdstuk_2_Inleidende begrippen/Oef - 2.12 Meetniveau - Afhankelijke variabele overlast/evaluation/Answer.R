context({
  testcase(
    " ",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        4,  # Correct answer
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "❌ Fout - **Nominaal** betekent categorieën zonder rangorde. Criminologische voorbeelden: type overlast (geluid, vervuiling, vandalisme), locatie van melding (park, straat, winkel). Aantal meldingen is een telling met numerieke waarde, geen categorie.",
            
            "2" = "❌ Fout - **Ordinaal** heeft categorieën met rangorde, maar ongelijke afstanden tussen categorieën. Criminologische voorbeelden: ernst van overlast (licht, gemiddeld, zwaar), frequentie (zelden, soms, vaak). Bij aantal meldingen is de afstand tussen 2 en 3 meldingen exact hetzelfde als tussen 8 en 9 meldingen.",
            
            "3" = "❌ Fout - **Interval** heeft numerieke waarden met gelijke afstanden, maar geen absoluut nulpunt. Criminologische voorbeelden: jaar van melding (2020, 2021), temperatuur tijdens incident (°C). Bij aantal meldingen betekent '0' wel degelijk 'geen meldingen' - het is een echt nulpunt.",
            
            "4" = "✅ Juist - **ratio** (aantal meldingen is een getal met een absoluut nulpunt, wat betekent dat '0 meldingen' mogelijk en betekenisvol is). Ook zijn verhoudingen betekenisvol: 8 meldingen is dubbel zoveel als 4 meldingen."
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