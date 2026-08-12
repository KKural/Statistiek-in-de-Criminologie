context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        3, # Correct answer: inhoudelijk veronderstelde beïnvloeding
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "❌ **Je keuze is begrijpelijk omdat beide variabelen samen veranderen, maar je veronderstelt daardoor wederzijdse beïnvloeding.**\n\n**Waarom dit niet asymmetrisch is:** wederzijdse beïnvloeding geeft geen enkele richting X → Y en past bij een symmetrische relatie.\n\n**Denkregel:** teken eerst één inhoudelijk gemotiveerde pijl. Kun je X als verklaring en Y als uitkomst benoemen, dan is de relatie asymmetrisch. <a href='https://www.youtube.com/watch?v=cQ-zAFzdckI' target='_blank' rel='noopener noreferrer'>Bekijk video</a>",
            "2" = "❌ **Je antwoord suggereert dat samenhang betekent dat de variabelen dezelfde theoretische rol hebben.**\n\n**Waarom dit fout is:** bij asymmetrie worden de rollen juist onderscheiden: één variabele is verklarend, de andere te verklaren.\n\n**Denkregel:** benoem vóór de analyse expliciet: wat is X, wat is Y en welke richting verwacht de theorie? <a href='https://www.youtube.com/watch?v=cQ-zAFzdckI' target='_blank' rel='noopener noreferrer'>Bekijk video</a>",
            "3" = "✅ **Juist.** In een asymmetrische relatie veronderstellen we inhoudelijk dat X de uitkomst Y beïnvloedt. De richting komt uit theorie en onderzoeksopzet, niet alleen uit de cijfers.\n\n**Versterk je redenering:** schrijf de hypothese steeds als een gerichte pijl: X → Y. <a href='https://www.youtube.com/watch?v=cQ-zAFzdckI' target='_blank' rel='noopener noreferrer'>Bekijk video</a>",
            "4" = "❌ **Je keuze laat zien dat je terecht aan een derde variabele denkt, maar je verwart twee concepten.**\n\n**Waarom dit niet de definitie is:** een gemeenschappelijke oorzaak kan een schijnverband creëren; asymmetrie gaat over de veronderstelde richting tussen X en Y.\n\n**Denkregel:** vraag eerst *welke richting heeft de relatie?* en daarna afzonderlijk *kan Z het verband verklaren?* <a href='https://www.youtube.com/watch?v=cQ-zAFzdckI' target='_blank' rel='noopener noreferrer'>Bekijk video</a>"
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
