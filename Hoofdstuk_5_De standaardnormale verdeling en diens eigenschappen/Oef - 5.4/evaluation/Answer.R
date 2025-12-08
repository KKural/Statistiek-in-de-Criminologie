# Beoordelingsscript voor Oefening 5.4: Kwaliteitscontrole Trappistenbier
# Normaalverdeling N(33, 2) - Inhoud flesjes bier

context({
  testcase("Oefening 5.4: Kwaliteitscontrole Trappistenbier", {
    
    # Definieer de parameters van de normaalverdeling
    mu <- 33      # gemiddelde in cl
    sigma <- 2    # standaardafwijking in cl
    
    # Verwachte antwoorden (gebaseerd op de uitwerking)
    # Vraag a: P(32 ≤ X ≤ 34)
    # Z1 = (32-33)/2 = -0.5, Z2 = (34-33)/2 = 0.5
    # P(-0.5 ≤ Z ≤ 0.5) = P(Z ≤ 0.5) - P(Z ≤ -0.5) = 0.6915 - 0.3085 = 0.3830
    expected_a <- 0.3830
    
    # Vraag b: P(X > 35)
    # Z = (35-33)/2 = 1
    # P(Z > 1) = 1 - P(Z ≤ 1) = 1 - 0.8413 = 0.1587
    expected_b <- 0.1587
    
    # Controleer of variabelen bestaan
    if (!exists("vraag_a") || !exists("vraag_b")) {
      env$evaluationResult <- list(
        list(
          description = "**❌ Variabelen niet gevonden**",
          format = "markdown",
          content = list(
            "Je moet twee variabelen definiëren:",
            "- `vraag_a`: percentage flesjes tussen 32cl en 34cl",
            "- `vraag_b`: percentage flesjes met meer dan 35cl",
            "",
            "**Voorbeeld:**",
            "```r",
            "vraag_a <- [jouw berekening voor vraag a]",
            "vraag_b <- [jouw berekening voor vraag b]",
            "```"
          )
        )
      )
      return(FALSE)
    }
    
    # Controleer of de waarden numeriek zijn
    if (!is.numeric(vraag_a) || !is.numeric(vraag_b)) {
      env$evaluationResult <- list(
        list(
          description = "**❌ Antwoorden moeten numeriek zijn**",
          format = "markdown", 
          content = list(
            "Je antwoorden moeten numerieke waarden zijn (geen strings).",
            "",
            "**Fout:** Een of beide antwoorden zijn niet numeriek",
            "**Oplossing:** Gebruik numerieke berekeningen",
            "",
            "**Voorbeeld:**",
            "```r",
            "vraag_a <- 0.3830  # Correct: numerieke waarde",
            "vraag_b <- 0.1587  # Correct: numerieke waarde",
            "```"
          )
        )
      )
      return(FALSE)
    }
    
    # Controleer vraag a (met zeer strikte tolerantie)
    tolerance <- 0.0001
    if (abs(vraag_a - expected_a) > tolerance) {
      
      # Bereken de z-scores voor diagnostiek
      z1 <- (32 - mu) / sigma  # -0.5
      z2 <- (34 - mu) / sigma  # 0.5
      
      # Geef gedetailleerde feedback
      env$evaluationResult <- list(
        list(
          description = "**❌ Vraag a: Incorrect percentage (32cl ≤ X ≤ 34cl)**",
          format = "markdown",
          content = list(
            paste("**Je antwoord:** ", round(vraag_a, 4)),
            paste("**Verwacht:** ", expected_a),
            paste("**Verschil:** ", round(abs(vraag_a - expected_a), 4)),
            "",
            "**📊 Stap-voor-stap controle:**",
            "",
            "**Stap 1: Gegeven informatie**",
            "- Normaalverdeling: N(33, 2)",
            "- μ (gemiddelde) = 33 cl", 
            "- σ (standaardafwijking) = 2 cl",
            "- Zoek: P(32 ≤ X ≤ 34)",
            "",
            "**Stap 2: Bereken z-scores**",
            paste("- Z₁ = (32 - 33) / 2 =", z1),
            paste("- Z₂ = (34 - 33) / 2 =", z2),
            "",
            "**Stap 3: Zoek kansen in z-tabel**",
            "- P(Z ≤ 0.5) = 0.6915",
            "- P(Z ≤ -0.5) = 0.3085",
            "",
            "**Stap 4: Bereken interval kans**",
            "- P(-0.5 ≤ Z ≤ 0.5) = P(Z ≤ 0.5) - P(Z ≤ -0.5)",
            "- P(-0.5 ≤ Z ≤ 0.5) = 0.6915 - 0.3085 = 0.3830",
            "",
            "**💡 Tips:**",
            "- Gebruik de formule: Z = (X - μ) / σ",
            "- Voor intervallen: P(a ≤ X ≤ b) = P(Z ≤ z_b) - P(Z ≤ z_a)",
            "- Controleer je z-tabel waarden zorgvuldig",
            "",
            "**🔗 Hulpmiddelen:**",
            "- [Z-tabel Belfactorij](https://www.belfactorij.be/lessen-statistiek/normale-verdeling/z-tabel/)"
          )
        )
      )
      return(FALSE)
    }
    
    # Controleer vraag b (met zeer strikte tolerantie) 
    if (abs(vraag_b - expected_b) > tolerance) {
      
      # Bereken de z-score voor diagnostiek
      z <- (35 - mu) / sigma  # 1
      
      # Geef gedetailleerde feedback
      env$evaluationResult <- list(
        list(
          description = "**❌ Vraag b: Incorrect percentage (X > 35cl)**",
          format = "markdown",
          content = list(
            paste("**Je antwoord:** ", round(vraag_b, 4)),
            paste("**Verwacht:** ", expected_b),
            paste("**Verschil:** ", round(abs(vraag_b - expected_b), 4)),
            "",
            "**📊 Stap-voor-stap controle:**",
            "",
            "**Stap 1: Gegeven informatie**",
            "- Normaalverdeling: N(33, 2)",
            "- μ (gemiddelde) = 33 cl",
            "- σ (standaardafwijking) = 2 cl", 
            "- Zoek: P(X > 35)",
            "",
            "**Stap 2: Bereken z-score**",
            paste("- Z = (35 - 33) / 2 =", z),
            "",
            "**Stap 3: Zoek kans in z-tabel**",
            "- P(Z ≤ 1) = 0.8413",
            "",
            "**Stap 4: Bereken rechterstaartkans**",
            "- P(Z > 1) = 1 - P(Z ≤ 1)",
            "- P(Z > 1) = 1 - 0.8413 = 0.1587",
            "",
            "**💡 Tips:**",
            "- Voor rechterstaartkansen: P(X > a) = 1 - P(X ≤ a)",
            "- Eerst z-score berekenen, dan z-tabel raadplegen",
            "- Let op: P(Z > z) = 1 - P(Z ≤ z)",
            "",
            "**🔗 Hulpmiddelen:**",
            "- [Z-tabel Belfactorij](https://www.belfactorij.be/lessen-statistiek/normale-verdeling/z-tabel/)"
          )
        )
      )
      return(FALSE)
    }
    
    # Als beide antwoorden correct zijn
    env$evaluationResult <- list(
      list(
        description = "**✅ Uitstekend! Beide vragen correct beantwoord**",
        format = "markdown",
        content = list(
          "**🍺 Trappistenbier Kwaliteitscontrole - Volledige Oplossing:**",
          "",
          "**📋 Gegeven:**",
          "- Normaalverdeling: N(33, 2)",
          "- μ = 33 cl, σ = 2 cl",
          "",
          "**📊 Vraag a: P(32 ≤ X ≤ 34)**",
          paste("- **Je antwoord:** ", round(vraag_a, 4), " (38.30%)"),
          "- Z₁ = (32-33)/2 = -0.5 → P(Z ≤ -0.5) = 0.3085",
          "- Z₂ = (34-33)/2 = 0.5 → P(Z ≤ 0.5) = 0.6915", 
          "- P(-0.5 ≤ Z ≤ 0.5) = 0.6915 - 0.3085 = **0.3830**",
          "",
          "**📊 Vraag b: P(X > 35)**", 
          paste("- **Je antwoord:** ", round(vraag_b, 4), " (15.87%)"),
          "- Z = (35-33)/2 = 1 → P(Z ≤ 1) = 0.8413",
          "- P(Z > 1) = 1 - 0.8413 = **0.1587**",
          "",
          "**🎯 Interpretatie:**",
          "- **38.30%** van de flesjes valt binnen het gewenste bereik (32-34cl)",
          "- **15.87%** van de flesjes bevat meer dan 35cl",
          "- De bottelmachine moet wellicht **bijgesteld** worden",
          "",
          "**🔬 Criminologische Context:**",
          "Deze technieken worden ook gebruikt bij:",
          "- Analyse van responsietijden politie",
          "- Kwaliteitscontrole forensische metingen", 
          "- Beoordeling psychologische testscores",
          "",
          "**🏆 Excellent work! Je beheerst normaalverdelingen perfect!**"
        )
      )
    )
    return(TRUE)
  })
})