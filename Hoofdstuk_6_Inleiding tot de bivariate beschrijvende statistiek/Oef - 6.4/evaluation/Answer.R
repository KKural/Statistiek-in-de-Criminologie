context({
  testcase(
    " ",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        2, # Correct answer: generatieve causaliteit
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
          "1" = "❌ Fout. **Tegenfeitelijke causaliteit** vraagt: *wat zou er gebeuren als X anders was?* 
          Het richt zich op hypothetische interventies, niet op het proces dat het effect voortbrengt. Denk hier niet in termen van 'wat als', maar in termen van *hoe ontstaat het effect?* Zie theorieboek p. 118 en voor meer uitleg <a href='https://www.google.com/url?sa=t&source=web&rct=j&opi=89978449&url=https://www-personal.umd.umich.edu/~delittle/resources/causal%2520mechanism.pdf&ved=2ahUKEwii14jf07-SAxWkKvsDHcH8Fc4QFnoECBoQAQ&usg=AOvVaw0Gd7sJjVyoNDUuJat6pOJX' target='_blank' rel='noopener noreferrer'>Lees meer</a>",

          "2" = "✅ Juist! **Generatieve (productieve) causaliteit** verklaart een effect door het **onderliggende mechanisme** te beschrijven: welke actoren, processen of interacties zorgen ervoor dat X leidt tot Y. Focus op concrete causale processen, niet alleen op verbanden. Zie theorieboek p. 117 en voor meer uitleg <a href='https://www.google.com/url?sa=t&source=web&rct=j&opi=89978449&url=https://www-personal.umd.umich.edu/~delittle/resources/causal%2520mechanism.pdf&ved=2ahUKEwii14jf07-SAxWkKvsDHcH8Fc4QFnoECBoQAQ&usg=AOvVaw0Gd7sJjVyoNDUuJat6pOJX' target='_blank' rel='noopener noreferrer'>Lees meer</a>",

          "3" = "❌ Fout. **Robuuste statistische afhankelijkheid** toont samenhang (correlatie), maar zegt niets over *waardoor* het effect ontstaat. Vraag jezelf af: welk mechanisme verbindt oorzaak en gevolg? Zie theorieboek p. 118 en voor meer uitleg <a href='https://www.google.com/url?sa=t&source=web&rct=j&opi=89978449&url=https://www-personal.umd.umich.edu/~delittle/resources/causal%2520mechanism.pdf&ved=2ahUKEwii14jf07-SAxWkKvsDHcH8Fc4QFnoECBoQAQ&usg=AOvVaw0Gd7sJjVyoNDUuJat6pOJX' target='_blank' rel='noopener noreferrer'>Lees meer</a>",

          "4" = "❌ Fout. **Contributieve causaliteit** geeft aan dat iets *bijdraagt* aan een effect, maar verklaart niet het causale proces zelf. De vraag gaat niet over bijdragen, maar over *hoe* het effect tot stand komt. Zie theorieboek p. 116 en voor meer uitleg <a href='https://www.google.com/url?sa=t&source=web&rct=j&opi=89978449&url=https://www-personal.umd.umich.edu/~delittle/resources/causal%2520mechanism.pdf&ved=2ahUKEwii14jf07-SAxWkKvsDHcH8Fc4QFnoECBoQAQ&usg=AOvVaw0Gd7sJjVyoNDUuJat6pOJX' target='_blank' rel='noopener noreferrer'>Lees meer</a>"

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
