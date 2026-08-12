# **Bevestiging:** correct-route feedback below confirms the result before the Denkregel and Transferstap.
context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        2,  # Correct answer: 2) 0.9%
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "❌ Fout. **Waarschijnlijke redenering:** 0.3% past mogelijk bij een andere Z-tabelwaarde of een reken-/afrondingsfout, maar deze antwoordwaarde toont niet eenduidig welke stap is misgelopen.\n\n**Waarom dit niet klopt:** de gevraagde sterftekans vereist eerst de 92%-dosis uit de effectieve verdeling en daarna de bijbehorende linkerstaart in de letale verdeling; 0.3% volgt niet uit die keten.\n\n**Denkregel:** bepaal eerst de dosis op het 92ste percentiel van de effectieve-dosisverdeling en bereken daarna de linkerstaartkans in de letale-dosisverdeling.\n\n**Volgende stap:** gebruik z₀.₉₂ ≈ 1.405: X = 45 + 1.405×9 = 57.65 mg. Vervolgens z = (57.65−100)/18 ≈ −2.36 en P(Z ≤ −2.36) ≈ **0.9%**.\n\n**Correct antwoord:** 2",
            
            "2" = "**Bevestiging:** ✅ **Juist!** Optie 2 (0.9%) is correct. Met N(45,9) anesthesie en N(100,18) letaal voor 92% effectiviteit berekenen we: **Stap 1:** Z₉₂% = 1.405 → X = 1.405×9+45 = 57.65 mg **Stap 2:** Z = (57.65-100)/18 = -2.36 → P(Z ≤ -2.36) = 0.0091 = **0.9%**. Dit is een realistische mortaliteit voor anesthesie bij deze dosering. <a href='https://www.belfactorij.nl/voorinloggen/kansverdelingen/Normaal.htm' target='_blank' rel='noopener noreferrer'>Z-tabel referentie</a>\n\n**Denkregel:** wanneer één drempel twee verdelingen verbindt, bereken je eerst de drempel in verdeling 1 en gebruik je exact die waarde in verdeling 2.\n\n**Transferstap:** herhaal de keten voor een ander effectiviteitspercentiel en voorspel vooraf of de sterftekans stijgt of daalt.",
            
            "3" = "❌ Fout. **Waarschijnlijke redenering:** 1.4% is onder meer verenigbaar met het gebruik van een te hoog effectiviteitspercentiel, bijvoorbeeld ongeveer 95% in plaats van 92%, of met een afwijkende tabelaflezing. De antwoordwaarde alleen bewijst de gevolgde route niet.\n\n**Waarom dit niet klopt:** een hoger percentiel levert een hogere dosis en daarmee een andere sterftekans; het vervangt dus de gevraagde 92%-voorwaarde door een ander probleem.\n\n**Denkregel:** zet het gevraagde percentage rechtstreeks om naar de bijbehorende cumulatieve kans: 92% betekent z₀.₉₂ ≈ 1.405, niet z₀.₉₅ ≈ 1.645.\n\n**Volgende stap:** herbereken de dosis met 1.405 en gebruik die dosis vervolgens in de letale verdeling; de linkerstaartkans is ongeveer **0.9%**.\n\n**Correct antwoord:** 2",
            
            "4" = "❌ Fout. **Waarschijnlijke redenering:** 2.8% past niet eenduidig bij de vereiste eenzijdige berekening; mogelijk zijn de verkeerde staart, verdeling of Z-tabelwaarde gebruikt.\n\n**Waarom dit niet klopt:** sterfte is hier één specifieke linkerstaartgebeurtenis; een andere staart of tweezijdige oppervlakte telt uitkomsten mee die niet bij de vraag horen.\n\n**Denkregel:** sterfte bij deze toegediende dosis is P(letale drempel ≤ dosis), dus de linkerstaart van N(100,18); er is geen tweezijdige kans nodig.\n\n**Volgende stap:** bereken met X = 57.65 mg: z ≈ −2.36 en lees P(Z ≤ −2.36) ≈ **0.9%** af.\n\n**Correct antwoord:** 2"
          )
            
          
          key <- as.character(generated)
          msg <- feedbacks[[key]] %||% "❌ Geef een getal tussen 1 en 4 in (1=0.3%, 2=0.9%, 3=1.4%, 4=2.8%)"
          
          if (!key %in% names(feedbacks)) {
            msg <- paste0(
              "**Invoercontrole:** je invoer lijkt niet overeen te komen met één van de aangeboden optienummers; dit kan een typefout of een andere invoerinterpretatie zijn.\n\n",
              "**Waarom dit niet klopt:** de evaluator kan alleen een inhoudelijke optie beoordelen wanneer één geldig optienummer is ingevoerd.\n\n",
              "**Denkregel:** koppel eerst elke antwoordoptie aan haar nummer en voer uitsluitend dat ene nummer in.\n\n",
              "**Volgende stap:** lees de opties opnieuw, kies het nummer dat bij je redenering hoort en dien alleen dat nummer in."
            )
          }
          get_reporter()$add_message(msg, type = "markdown")
          
          generated == expected
        }
      )
    }
  )
})
