context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        2, # Correct answer: contributieve oorzaken
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "❌ **Je keuze is consistent met een deterministisch beeld van causaliteit:** een echte oorzaak moet volgens die redenering zowel altijd nodig als op zichzelf genoeg zijn.\n\n**Waarom dit meestal niet past:** crimineel gedrag ontstaat doorgaans uit meerdere risico-, beschermings- en contextfactoren; één factor is zelden noodzakelijk én voldoende.\n\n**Denkregel:** vraag bij elke factor: leidt zij alleen altijd tot het gevolg, en moet zij in elk geval aanwezig zijn? Meestal zijn beide antwoorden *nee*. <a href='https://bookdown.org/paul/applied-causal-analysis/deterministiccausation.html' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            "2" = "✅ **Juist.** Contributieve oorzaken verhogen of verlagen de kans op een uitkomst, maar zijn afzonderlijk niet noodzakelijk en niet voldoende. Dat past bij de multicausale werkelijkheid van criminologisch gedrag.\n\n**Versterk je redenering:** formuleer een risicofactor als een bijdrage binnen een combinatie van persoon, situatie en context. <a href='https://bookdown.org/paul/applied-causal-analysis/deterministiccausation.html' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            "3" = "❌ **Je antwoord suggereert dat één factor op zichzelf het delict kan veroorzaken, ook al bestaan er andere routes.**\n\n**Waarom dit te sterk is:** in criminologisch onderzoek is één factor zelden op zichzelf voldoende; de uitkomst hangt meestal af van een combinatie van omstandigheden.\n\n**Denkregel:** als de factor alleen niet steeds tot de uitkomst leidt, noem haar niet voldoende maar contributief. <a href='https://bookdown.org/paul/applied-causal-analysis/deterministiccausation.html' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            "4" = "❌ **Je keuze is consistent met de gedachte dat één factor in ieder geval aanwezig móét zijn.**\n\n**Waarom dit meestal niet past:** dezelfde criminologische uitkomst kan via verschillende combinaties van factoren ontstaan; één specifieke factor is daardoor zelden noodzakelijk.\n\n**Denkregel:** zoek naar mogelijke alternatieve causale routes. Bestaan die, dan is de factor niet noodzakelijk maar mogelijk contributief. <a href='https://bookdown.org/paul/applied-causal-analysis/deterministiccausation.html' target='_blank' rel='noopener noreferrer'>Lees meer</a>"
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
