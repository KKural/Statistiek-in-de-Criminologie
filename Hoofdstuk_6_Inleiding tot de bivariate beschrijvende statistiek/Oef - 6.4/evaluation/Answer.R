context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        2, # Correct answer: generatieve causaliteit
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
          "1" = "❌ **Je keuze is consistent met het sleutelwoord ‘causaliteit’, maar je focust op een interventievergelijking.** Tegenfeitelijke causaliteit vraagt: *wat zou er gebeuren als X anders was?* De vraag vraagt hier naar het proces dat het effect voortbrengt.\n\n**Denkregel:** staat *wat als* centraal, denk tegenfeitelijk; staat *hoe ontstaat het effect* centraal, denk generatief. Zie theorieboek p. 118.",

          "2" = "✅ **Juist.** Generatieve (productieve) causaliteit beschrijft het **onderliggende mechanisme**: welke actoren, processen of interacties ervoor zorgen dat X tot Y leidt.\n\n**Versterk je redenering:** probeer het mechanisme als een keten te formuleren: X → proces/actor → Y. Zie theorieboek p. 117.",

          "3" = "❌ **Je keuze suggereert dat een stabiel statistisch verband ook verklaart hoe het effect ontstaat.**\n\n**Waarom dit fout is:** robuuste afhankelijkheid toont dat X en Y samenhangen, maar benoemt geen voortbrengend proces.\n\n**Denkregel:** vraag jezelf af: kan ik de actoren, stappen of interacties tussen X en Y beschrijven? Zo ja, dan zoek je generatieve causaliteit. Zie theorieboek p. 118.",

          "4" = "❌ **Je keuze is begrijpelijk omdat contributieve oorzaken een effect helpen verklaren, maar ze beantwoorden een andere vraag.**\n\n**Waarom dit niet past:** contributief betekent dat een factor bijdraagt; het specificeert niet welk proces het effect produceert.\n\n**Denkregel:** onderscheid *draagt X bij?* van *via welk mechanisme produceert X het effect?* De tweede vraag is generatief. Zie theorieboek p. 116."

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
