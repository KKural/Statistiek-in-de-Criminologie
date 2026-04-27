In deze oefening lees je de output van een meervoudige regressieanalyse af en beantwoord je vragen over modelfit, regressieparameters en voorspellingen.

**Gebruik de app niet voor deze oefening** — de dataset is hieronder volledig weergegeven.

---

## Context

Een criminoloog onderzoekt angst voor criminaliteit bij buurtbewoners. De afhankelijke variabele is **AngstScore** (0–100). De twee onafhankelijke variabelen zijn:

- **WanordeIndex** (0–10): mate van fysieke en sociale wanorde in de buurt
- **ZwerfvuilKlachten** (0–100): aantal klachten over zwerfvuil per buurt

Het regressiemodel is: `AngstScore = a + b₁·WanordeIndex + b₂·ZwerfvuilKlachten + e`

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
| R² | 0.4409 |
| Adjusted R² | −0.1183 |
| N | 5 |

**ANOVA-tabel**

| | SS | df | MS | F | p |
|---|---|---|---|---|---|
| Regressie | 559.51 | 2 | 279.75 | 0.788 | .559 |
| Residu | 709.60 | 2 | 354.80 | | |
| Totaal | 1269.11 | 4 | | | |

**Regressieparameters**

| Parameter | b (ongest.) | β (gest.) | SE | t | p | 95% CI |
|---|---|---|---|---|---|---|
| Intercept | −9.9765 | — | 124.88 | −0.080 | .944 | [−269.44, 249.49] |
| WanordeIndex | 13.5528 | 0.8962 | 18.24 | 0.743 | .535 | [−44.02, 71.12] |
| ZwerfvuilKlachten | −0.3658 | −0.3261 | 2.04 | −0.179 | .874 | [−4.64, 3.90] |

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

**2) Hoeveel bedraagt de determinatiecoefficient R²? Hoeveel procent van de variantie in AngstScore wordt verklaard?**

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

1. 13.55 — de stijging in AngstScore per eenheid WanordeIndex
2. −0.37 — de bijdrage van ZwerfvuilKlachten
3. −9.98 — de verwachte AngstScore als zowel WanordeIndex als ZwerfvuilKlachten gelijk zijn aan 0
4. 68.43 — de gemiddelde AngstScore in de steekproef

---

**7) Wat is de ongestandaardiseerde regressiecoefficient b₁ voor WanordeIndex? Interpreteer.**

1. Een toename van 1 eenheid in WanordeIndex gaat, gecontroleerd voor ZwerfvuilKlachten, gepaard met een gemiddelde stijging van 13.55 punten in AngstScore
2. Een toename van 1 eenheid in WanordeIndex gaat gepaard met een daling van 0.37 punten
3. b₁ = 0.90 is de gestandaardiseerde correlatie met AngstScore
4. b₁ = −9.98 is de startwaarde als WanordeIndex = 0

---

**8) Welke variabele heeft het sterkste relatieve effect op AngstScore? Welke parameter gebruik je hiervoor?**

1. ZwerfvuilKlachten, op basis van b₂ = −0.37
2. WanordeIndex, op basis van β₁ = 0.90 — de gestandaardiseerde coeff vergelijkt effecten op dezelfde schaal
3. ZwerfvuilKlachten, op basis van β₂ = −0.33
4. WanordeIndex, op basis van b₁ = 13.55 — de grootste ongestandaardiseerde coeff

---

**9) Welke regressieparameter(s) zijn statistisch significant op 5%-niveau?**

1. Alleen WanordeIndex (p = .535)
2. Alleen ZwerfvuilKlachten (p = .874)
3. Geen — geen enkele parameter heeft p < .05; ook het overall model is niet significant
4. Intercept en WanordeIndex

---

**10) Wat betekent het 95%-betrouwbaarheidsinterval voor b₁ (WanordeIndex): [−44.02, 71.12]?**

1. Het effect van WanordeIndex is zeker positief
2. Het effect van WanordeIndex is zeker negatief
3. Het interval bevat 0 — we kunnen op 5%-niveau geen significant effect van WanordeIndex concluderen
4. Het model voorspelt altijd goed als b₁ in dit interval ligt

---

**11) Wat is de verwachte AngstScore voor een buurt met WanordeIndex = 7 en ZwerfvuilKlachten = 45?**

1. 76.59
2. 62.44
3. 56.20
4. 68.43


Een criminoloog onderzoekt angst voor criminaliteit bij buurtbewoners. De afhankelijke variabele is **AngstScore** (0–100). De twee onafhankelijke variabelen zijn:

- **WanordeIndex** (0–10): mate van fysieke en sociale wanorde in de buurt
- **ZwerfvuilKlachten** (0–100): aantal klachten over zwerfvuil per buurt

Het regressiemodel is: `AngstScore = a + b₁·WanordeIndex + b₂·ZwerfvuilKlachten + e`

---

## Dataset (n = 20)

| Buurt | WanordeIndex | ZwerfvuilKlachten | AngstScore |
|-------|-------------|-------------------|------------|
| 1  | 8.31 | 68.06 | 65.61 |
| 2  | 5.02 | 35.07 | 36.43 |
| 3  | 6.60 | 31.77 | 59.99 |
| 4  | 7.06 | 58.88 | 76.59 |
| 5  | 6.67 | 39.89 | 82.22 |
| 6  | 5.80 | 68.58 | 53.97 |
| 7  | 8.55 | 52.14 | 67.11 |
| 8  | 5.82 | 57.51 | 39.91 |
| 9  | 9.42 | 65.92 | 78.27 |
| 10 | 5.87 | 37.38 | 52.05 |
| 11 | 8.20 | 79.20 | 73.23 |
| 12 | 9.88 | 72.12 | 82.74 |
| 13 | 3.61 | 41.48 | 60.56 |
| 14 | 5.50 | 51.01 | 50.87 |
| 15 | 5.75 | 57.60 | 63.71 |
| 16 | 7.06 | 54.06 | 45.50 |
| 17 | 5.49 | 4.80  | 48.97 |
| 18 | 1.45 | 36.36 | 31.68 |
| 19 | 1.82 | 28.49 | 16.60 |
| 20 | 8.23 | 59.66 | 68.89 |

---

## Regressie-output

**Model fit**

| | Waarde |
|---|---|
| Multiple R | 0.8055 |
| R² | 0.6488 |
| Adjusted R² | 0.6075 |
| N | 20 |

**ANOVA-tabel**

| | SS | df | MS | F | p |
|---|---|---|---|---|---|
| Regressie | 3910.55 | 2 | 1955.27 | 15.704 | < .001 |
| Residu | 2116.64 | 17 | 124.51 | | |
| Totaal | 6027.19 | 19 | | | |

**Regressieparameters**

| Parameter | b (ongest.) | β (gest.) | SE | t | p | 95% CI |
|---|---|---|---|---|---|---|
| Intercept | 16.2100 | — | 8.51 | 1.905 | .074 | [−1.40, 33.82] |
| WanordeIndex | 6.0883 | 0.7646 | 1.46 | 4.171 | < .001 | [3.02, 9.16] |
| ZwerfvuilKlachten | 0.0629 | 0.0635 | 0.18 | 0.352 | .729 | [−0.32, 0.44] |

---

## Vragen

Vul voor elke vraag het nummer van je antwoord in (bijv. `vraag1 <- 2`).

---

**1) Hoeveel bedraagt de multipele correlatiecoëfficiënt R, afgerond op twee decimalen?**

1. 0.65
2. 0.81
3. 0.61
4. 0.74

---

**2) Hoeveel bedraagt de determinatiecoëfficiënt R²? Interpreteer: hoeveel procent van de variantie in AngstScore wordt verklaard?**

1. 39%
2. 81%
3. 65%
4. 61%

---

**3) Hoeveel procent van de variantie in AngstScore kan **niet** verklaard worden door dit model?**

1. 65%
2. 19%
3. 35%
4. 61%

---

**4) Hoeveel respondenten (buurten) zijn in de analyse betrokken?**

1. 17
2. 19
3. 20
4. 21

---

**5) Hoeveel bedraagt de toetsstatistiek F? Is het model significant op 5%-niveau?**

1. F = 15.70, het model is significant (p < .001)
2. F = 1.905, het model is niet significant (p = .074)
3. F = 4.171, het model is significant (p < .001)
4. F = 0.352, het model is niet significant (p = .729)

---

**6) Hoeveel bedraagt het intercept en wat betekent dit?**

1. 6.09 — bij een WanordeIndex van 0 is de verwachte AngstScore 6.09
2. 0.06 — de bijdrage van ZwerfvuilKlachten als WanordeIndex nul is
3. 16.21 — de verwachte AngstScore als zowel WanordeIndex als ZwerfvuilKlachten gelijk zijn aan 0
4. −1.40 — de ondergrens van het betrouwbaarheidsinterval van het intercept

---

**7) Wat is de ongestandaardiseerde regressiecoëfficiënt b₁ voor WanordeIndex? Interpreteer.**

1. Een toename van 1 eenheid in WanordeIndex gaat, gecontroleerd voor ZwerfvuilKlachten, gepaard met een gemiddelde stijging van 6.09 punten in AngstScore
2. Een toename van 1 eenheid in WanordeIndex gaat gepaard met een stijging van 0.76 standaarddeviaties in AngstScore
3. Een toename van 1 eenheid in WanordeIndex gaat gepaard met een daling van 6.09 punten in AngstScore
4. b₁ = 16.21 is de basiswaarde van AngstScore als WanordeIndex = 0

---

**8) Welke variabele heeft het sterkste **relatieve** effect op AngstScore? Welke parameter gebruik je hiervoor?**

1. ZwerfvuilKlachten, op basis van b₂ = 0.06
2. WanordeIndex, op basis van β₁ = 0.76 — de gestandaardiseerde coëfficiënt vergelijkt effecten op dezelfde schaal
3. ZwerfvuilKlachten, op basis van β₂ = 0.06
4. WanordeIndex, op basis van b₁ = 6.09 — de grootste ongestandaardiseerde coëfficiënt

---

**9) Welke regressieparameter(s) zijn statistisch significant op 5%-niveau?**

1. Intercept en WanordeIndex
2. Alleen WanordeIndex (p < .001); ZwerfvuilKlachten is niet significant (p = .729)
3. Intercept, WanordeIndex en ZwerfvuilKlachten
4. Alleen ZwerfvuilKlachten

---

**10) Wat betekent het 95%-betrouwbaarheidsinterval voor b₁ (WanordeIndex): [3.02, 9.16]?**

1. De kans dat b₁ positief is, is 95%
2. Als we herhaaldelijk steekproeven nemen, bevat 95% van de zo geconstrueerde intervallen de ware populatieparameter; het interval bevat 0 niet, dus het effect is significant positief
3. Het effect van WanordeIndex is negatief in 5% van de gevallen
4. Het intercept ligt met 95% kans tussen 3.02 en 9.16

---

**11) Wat is de verwachte AngstScore voor een buurt met WanordeIndex = 6 en ZwerfvuilKlachten = 55?**

1. 54.38
2. 62.44
3. 56.20
4. 48.97

