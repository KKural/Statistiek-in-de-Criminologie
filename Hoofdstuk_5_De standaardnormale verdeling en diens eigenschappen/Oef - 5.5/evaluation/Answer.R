context({
  testcase(
    " ",
    {
      testEqual(
        "",
        function(env) as.numeric(env$answer),
        2,  # Correct answer: 2) 45 jaar
        comparator = function(generated, expected, ...) {
          # Feedback messages for each option
          feedbacks <- list(
            "1" = "❌ **Fout: 1) 42.5 jaar**\n\n42.5 jaar is te laag. Je hebt mogelijk een fout gemaakt in de berekening voor het 90ste percentiel.\n\n**Tip:** Voor de oudste 10% zoek je het 90ste percentiel. Controleer je berekening van de z-score en de omzetting naar leeftijd.",
            
            "2" = "✅ **Correct: 2) 45 jaar**\n\n**Juiste redenering:**\n- Oudste 10% betekent het 90ste percentiel\n- Met normale verdeling (μ = 37.8, σ = 5.6) komt dit neer op ongeveer 45 jaar\n- Gedetineerden van 45 jaar en ouder vormen de oudste 10% en zullen deelnemen aan de bevraging\n\n**Uitstekend werk!**",
            
            "3" = "❌ **Fout: 3) 47 jaar**\n\n47 jaar is te hoog. Bij deze leeftijd zou je een kleiner percentage dan 10% krijgen.\n\n**Tip:** Controleer of je het juiste percentiel gebruikt. Voor de oudste 10% heb je het 90ste percentiel nodig, niet het 95ste.",
            
            "4" = "❌ **Fout: 4) 50 jaar**\n\n50 jaar is veel te hoog. Bij deze leeftijd zou slechts een zeer klein percentage van de populatie ouder zijn, veel minder dan 10%.\n\n**Tip:** 50 jaar ligt meer dan 2 standaardafwijkingen boven het gemiddelde. Dit zou betekenen dat minder dan 2.5% van de populatie ouder is.",
            
            "5" = "❌ **Fout: 5) Niet berechenbaar**\n\nDeze opgave is wel degelijk oplosbaar! We hebben alle benodigde informatie:\n- ✅ Gemiddelde (37.8 jaar)\n- ✅ Standaardafwijking (5.6 jaar)\n- ✅ Normale verdeling\n- ✅ Doelgroep (oudste 10%)\n\n**Tip:** Met deze gegevens kun je het 90ste percentiel berekenen."
          )
          
          # Get feedback message
          key <- as.character(generated)
          if (key %in% names(feedbacks)) {
            msg <- feedbacks[[key]]
          } else {
            msg <- "❌ **Ongeldige invoer**\n\nGebruik alleen de getallen 1, 2, 3, 4, of 5 voor je antwoord.\n\n**Voorbeeld:** `answer <- 2`"
          }
          
          get_reporter()$add_message(msg, type = "markdown")
          return(generated == expected)
        }
      )
    }
  )
})
