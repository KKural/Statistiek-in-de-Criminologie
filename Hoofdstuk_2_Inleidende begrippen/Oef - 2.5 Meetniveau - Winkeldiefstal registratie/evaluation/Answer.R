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
            "1" = "❌ Fout - **Nominaal** betekent categorieën zonder rangorde. Criminologische voorbeelden: type winkel (supermarkt, kledingzaak, elektronicazaak), dag van de week waarop diefstal plaatsvond. Aantal meldingen is een telling, geen categorie.",
            
            "2" = "❌ Fout - **Ordinaal** heeft categorieën met rangorde, maar ongelijke afstanden tussen categorieën. Criminologische voorbeelden: ernst van winkeldiefstal (klein, gemiddeld, groot), rang van winkeldetective. Aantal meldingen heeft wel gelijke afstanden: verschil tussen 2 en 3 meldingen is hetzelfde als tussen 5 en 6 meldingen.",
            
            "3" = "❌ Fout - **Interval** heeft numerieke waarden met gelijke afstanden, maar geen absoluut nulpunt. Criminologische voorbeelden: jaar van registratie (2020, 2021, 2022), temperatuur tijdens diefstal in °C. Bij aantal meldingen betekent '0' wel degelijk 'geen meldingen' - het is een echt nulpunt.",
            
            "4" = "✅ Juist - de **registratie** van het aantal meldingen van winkeldiefstal per winkel bevindt zich op het ratio meetniveau. Dit gaat om een kwantitatieve telling waarbij: er een absoluut nulpunt is (0 meldingen betekent geen winkeldiefstal) en er betekenisvolle verhoudingen kunnen worden berekend (bijvoorbeeld: 4 meldingen is tweemaal zoveel als 2 meldingen)."
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