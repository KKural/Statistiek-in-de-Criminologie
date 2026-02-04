context({
  testcase(
    " ",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        2, # Correct answer: meetniveau + theoretische richting
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "❌ Fout. Steekproefgrootte en type steekproef bepalen niet rechtstreeks welke **associatiemaat** je kiest. <a href='https://www.statisticssolutions.com/free-resources/directory-of-statistical-analyses/measures-of-association/' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            "2" = "✅ Juist! Je houdt rekening met het **meetniveau** van de variabelen én of de associatie theoretisch **symmetrisch of asymmetrisch** is. <a href='https://www.statisticssolutions.com/free-resources/directory-of-statistical-analyses/measures-of-association/' target='_blank' rel='noopener noreferrer'>Lees meer </a>",
            "3" = "❌ Fout. Celfrequenties en totalen zijn relevant voor het lezen van kruistabellen, maar zijn geen kernregels voor de keuze van een associatiemaat. <a href='https://www.statisticssolutions.com/free-resources/directory-of-statistical-analyses/measures-of-association/' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            "4" = "❌ Fout. De keuze van assen is een visualisatiekeuze, niet de basisregel voor associatiematen. <a href='https://www.statisticssolutions.com/free-resources/directory-of-statistical-analyses/measures-of-association/' target='_blank' rel='noopener noreferrer'>Lees meer </a>"
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
