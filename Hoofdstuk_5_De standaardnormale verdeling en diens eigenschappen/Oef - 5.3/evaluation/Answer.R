context({
  testcase(
    " ",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        2,  # Correct answer: 2) 0.9%
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "❌ **Waarom optie 1 (0.3%) fout is:** Dit is te laag voor de werkelijke mortaliteit.\n\n**Mogelijke oorzaak:** Verkeerde Z-waarde gebruikt of rekenfout bij de Z-score berekening voor de effectieve dosis of letale kans.\n\n**Controleer:** Voor 92% effectieve dosis → 57.65 mg → Z = (57.65-100)/18 = -2.36 → P(Z ≤ -2.36) = 0.0091 = **0.9%** (optie 2)",
            
            "2" = "✅ **Juist!** Optie 2 (0.9%) is correct. Met N(45,9) anesthesie en N(100,18) letaal voor 92% effectiviteit berekenen we: **Stap 1:** Z₉₂% = 1.405 → X = 1.405×9+45 = 57.65 mg **Stap 2:** Z = (57.65-100)/18 = -2.36 → P(Z ≤ -2.36) = 0.0091 = **0.9%**. Dit is een realistische mortaliteit voor anesthesie bij deze dosering. <a href='https://www.belfactorij.nl/voorinloggen/kansverdelingen/Normaal.htm' target='_blank' rel='noopener noreferrer'>Z-tabel referentie</a>",
            
            "3" = "❌ **Waarom optie 3 (1.4%) fout is:** Dit is te hoog - waarschijnlijk een rekenfout.\n\n**Mogelijke oorzaak:** Verkeerde berekening van de effectieve dosis (mogelijk Z = 1.645 gebruikt voor 95% i.p.v. 1.405 voor 92%) of fout bij Z-tabel opzoeken.\n\n**Controleer:** 92% effectieve dosis: Z = **1.405** (niet 1.645!) → X = 1.405×9+45 = 57.65 mg",
            
            "4" = "❌ **Waarom optie 4 (2.8%) fout is:** Dit is ongeveer dubbel het juiste antwoord.\n\n**Mogelijke oorzaak:** Dubbeltelling ergens in de berekening, of verkeerde Z-tabel waarde gebruikt.\n\n**Controleer:** P(Z ≤ -2.36) = 0.0091 = 0.9%, niet 2.8%. Mogelijk gebruikte je P(|Z| ≥ 2.36) i.p.v. P(Z ≤ -2.36)"
          )
            
          
          key <- as.character(generated)
          msg <- feedbacks[[key]] %||% "❌ Geef een getal tussen 1 en 4 in (1=0.3%, 2=0.9%, 3=1.4%, 4=2.8%)"
          
          get_reporter()$add_message(msg, type = "markdown")
          
          generated == expected
        }
      )
    }
  )
})
