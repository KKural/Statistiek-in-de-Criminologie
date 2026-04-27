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
            "1" = "❌ Fout. Meetfouten zijn een mogelijke bron van variantie, maar de meest correcte interpretatie van onverklaarde variantie in een padmodel is dat relevante variabelen buiten het model vallen.\n\n**Correct antwoord:** 2",
            "2" = "✅ Juist! De **57% onverklaarde variantie** betekent dat er andere factoren zijn die het moreel oordeel beïnvloeden maar niet in dit model zijn opgenomen. Het model is een theoretisch gemotiveerde vereenvoudiging van de werkelijkheid — niet alle determinanten van moreel oordeel zijn erin opgenomen.",
            "3" = "❌ Fout. De grootte van padcoëfficiënten zegt iets over de *sterkte* van gevonden effecten, niet over wat er onverklaard blijft. Onverklaarde variantie verwijst naar variabelen buiten het model.\n\n**Correct antwoord:** 2",
            "4" = "❌ Fout. Meer variabelen zou R² verhogen, niet verlagen. Onverklaarde variantie betekent dat er nog andere, niet-opgenomen factoren een rol spelen.\n\n**Correct antwoord:** 2"
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
