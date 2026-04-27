In deze oefening lees je de output van een meervoudige regressieanalyse af en beantwoord je vragen over modelfit, regressieparameters en voorspellingen.

**Gebruik de app niet voor deze oefening** â€” de dataset is hieronder volledig weergegeven.

---

## Context

Een criminoloog onderzoekt angst voor criminaliteit bij buurtbewoners. De afhankelijke variabele is **AngstScore** (0â€“100). De twee onafhankelijke variabelen zijn:

- **WanordeIndex** (0â€“10): mate van fysieke en sociale wanorde in de buurt
- **ZwerfvuilKlachten** (0â€“100): aantal klachten over zwerfvuil per buurt

Het regressiemodel is: `AngstScore = a + bâ‚Â·WanordeIndex + bâ‚‚Â·ZwerfvuilKlachten + e`

---

## Dataset (n = 5)

| Buurt | WanordeIndex | ZwerfvuilKlachten | AngstScore |
|-------|-------------|-------------------|------------|
| 1 | 8.31 | 68.06 | 65.61 |
| 2 | 5.02 | 35.07 | 36.43 |
| 3 | 6.60 | 31.77 | 59.99 |
| 4 | 7.06 | 58.88 | 76.59 |
| 5 | 6.67 | 39.89 | 82.22 |

---

## Regressie-output

**Model fit**

| | Waarde |
|---|---|
| Multiple R | 0.6640 |
| RÂ² | 0.4409 |
| Adjusted RÂ² | âˆ’0.1183 |
| N | 5 |

**ANOVA-tabel**

| | SS | df | MS | F | p |
|---|---|---|---|---|---|
| Regressie | 559.51 | 2 | 279.75 | 0.788 | .559 |
| Residu | 709.60 | 2 | 354.80 | | |
| Totaal | 1269.11 | 4 | | | |

**Regressieparameters**

| Parameter | b (ongest.) | Î² (gest.) | SE | t | p | 95% CI |
|---|---|---|---|---|---|---|
| Intercept | âˆ’9.9765 | â€” | 124.88 | âˆ’0.080 | .944 | [âˆ’269.44, 249.49] |
| WanordeIndex | 13.5528 | 0.8962 | 18.24 | 0.743 | .535 | [âˆ’44.02, 71.12] |
| ZwerfvuilKlachten | âˆ’0.3658 | âˆ’0.3261 | 2.04 | âˆ’0.179 | .874 | [âˆ’4.64, 3.90] |

---

## Vragen

Vul voor elke vraag het nummer van je antwoord in (bijv. `vraag1 <- 2`).

---

**1) Hoeveel bedraagt de multipele correlatiecoefficient R, afgerond op twee decimalen?**

1. 0.44
2. 0.66
3. 0.81
4. 0.61

---

**2) Hoeveel bedraagt de determinatiecoefficient RÂ²? Hoeveel procent van de variantie in AngstScore wordt verklaard?**

1. 66%
2. 81%
3. 35%
4. 44%

---

**3) Hoeveel procent van de variantie in AngstScore kan **niet** verklaard worden door dit model?**

1. 44%
2. 35%
3. 56%
4. 66%

---

**4) Hoeveel buurten zijn in de analyse betrokken?**

1. 2
2. 3
3. 4
4. 5

---

**5) Hoeveel bedraagt de toetsstatistiek F? Is het model significant op 5%-niveau?**

1. F = 0.79; het model is significant (p < .001)
2. F = 13.55; het model is significant (p < .001)
3. F = 0.79; het model is **niet** significant (p = .559)
4. F = 0.66; het model is significant (p = .044)

---

**6) Hoeveel bedraagt het intercept en wat betekent dit?**

1. 13.55 â€” de stijging in AngstScore per eenheid WanordeIndex
2. âˆ’0.37 â€” de bijdrage van ZwerfvuilKlachten
3. âˆ’9.98 â€” de verwachte AngstScore als zowel WanordeIndex als ZwerfvuilKlachten gelijk zijn aan 0
4. 68.43 â€” de gemiddelde AngstScore in de steekproef

---

**7) Wat is de ongestandaardiseerde regressiecoefficient bâ‚ voor WanordeIndex? Interpreteer.**

1. Een toename van 1 eenheid in WanordeIndex gaat, gecontroleerd voor ZwerfvuilKlachten, gepaard met een gemiddelde stijging van 13.55 punten in AngstScore
2. Een toename van 1 eenheid in WanordeIndex gaat gepaard met een daling van 0.37 punten
3. bâ‚ = 0.90 is de gestandaardiseerde correlatie met AngstScore
4. bâ‚ = âˆ’9.98 is de startwaarde als WanordeIndex = 0

---

**8) Welke variabele heeft het sterkste relatieve effect op AngstScore? Welke parameter gebruik je hiervoor?**

1. ZwerfvuilKlachten, op basis van bâ‚‚ = âˆ’0.37
2. WanordeIndex, op basis van Î²â‚ = 0.90 â€” de gestandaardiseerde coeff vergelijkt effecten op dezelfde schaal
3. ZwerfvuilKlachten, op basis van Î²â‚‚ = âˆ’0.33
4. WanordeIndex, op basis van bâ‚ = 13.55 â€” de grootste ongestandaardiseerde coeff

---

**9) Welke regressieparameter(s) zijn statistisch significant op 5%-niveau?**

1. Alleen WanordeIndex (p = .535)
2. Alleen ZwerfvuilKlachten (p = .874)
3. Geen â€” geen enkele parameter heeft p < .05; ook het overall model is niet significant
4. Intercept en WanordeIndex

---

**10) Wat betekent het 95%-betrouwbaarheidsinterval voor bâ‚ (WanordeIndex): [âˆ’44.02, 71.12]?**

1. Het effect van WanordeIndex is zeker positief
2. Het effect van WanordeIndex is zeker negatief
3. Het interval bevat 0 â€” we kunnen op 5%-niveau geen significant effect van WanordeIndex concluderen
4. Het model voorspelt altijd goed als bâ‚ in dit interval ligt

---

**11) Wat is de verwachte AngstScore voor een buurt met WanordeIndex = 7 en ZwerfvuilKlachten = 45?**

1. 76.59
2. 62.44
3. 56.20
4. 68.43
