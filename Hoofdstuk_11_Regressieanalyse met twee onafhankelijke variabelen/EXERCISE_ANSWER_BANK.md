# Antwoordbank — Hoofdstuk 11

> Alleen voor docenten en technische validatie. De correcte inzendingen zijn rechtstreeks afgeleid van de canonieke `evaluation/Answer.R`-bestanden en door die evaluatoren gevalideerd.

## Gebruik

- **Correcte inzending** is een volledig ingevulde versie van de boilerplate, of het juiste optienummer bij een keuzeoefening.
- Een **Foute testinvoer** wijzigt steeds precies één antwoord terwijl de andere antwoorden correct blijven.
- De uitleg na elke foute invoer benoemt de bijbehorende misvatting en gerichte feedbackroute.

### Oef - 11.1 Regressie - Van variabelen naar interpretatie

Bronmap: `Hoofdstuk_11_Regressieanalyse met twee onafhankelijke variabelen/Oef - 11.1.1 Variabelen en gemiddelden`

#### Correcte inzending

Kopieerbare, volledig ingevulde boilerplate:

```r
# Vul elk antwoord in na <-.
afhankelijke_variabele <- 3
scp_x1y <- -4
voorspelling <- 10
interpretatie_b1 <- 2
```

#### Foute testinvoer en misvattingen

- Foute testinvoer voor `afhankelijke_variabele` (alle andere velden blijven correct):

```r
# Vul elk antwoord in na <-.
afhankelijke_variabele <- 1
scp_x1y <- -4
voorspelling <- 10
interpretatie_b1 <- 2
```

  - **Waarschijnlijke redenering:** Je hebt waarschijnlijk een predictor gekozen in plaats van de variabele die wordt voorspeld. **Waarom dit niet klopt:** De angstscore Y wordt voorspeld en is dus de afhankelijke variabele, code 3.

- Foute testinvoer voor `scp_x1y` (alle andere velden blijven correct):

```r
# Vul elk antwoord in na <-.
afhankelijke_variabele <- 3
scp_x1y <- 4
voorspelling <- 10
interpretatie_b1 <- 2
```

  - **Waarschijnlijke redenering:** Je hebt waarschijnlijk de tekens van de gecentreerde producten genegeerd. **Waarom dit niet klopt:** (−1)(2) + 0(0) + 1(−2) = −4.

- Foute testinvoer voor `voorspelling` (alle andere velden blijven correct):

```r
# Vul elk antwoord in na <-.
afhankelijke_variabele <- 3
scp_x1y <- -4
voorspelling <- 11
interpretatie_b1 <- 2
```

  - **Waarschijnlijke redenering:** Je hebt waarschijnlijk het minteken voor X2 gemist of een coëfficiënt niet vermenigvuldigd. **Waarom dit niet klopt:** 5 + 2(4) − 1(3) = 10.

- Foute testinvoer voor `interpretatie_b1` (alle andere velden blijven correct):

```r
# Vul elk antwoord in na <-.
afhankelijke_variabele <- 3
scp_x1y <- -4
voorspelling <- 10
interpretatie_b1 <- 1
```

  - **Waarschijnlijke redenering:** Je hebt waarschijnlijk alleen naar de grootte van b1 gekeken en het negatieve teken of de controle voor X2 gemist. **Waarom dit niet klopt:** b1 = −2.2 betekent dat de voorspelde Y daalt wanneer X1 stijgt, bij constante X2; dat is code 2.

### Oef - 11.3 Regressie - Residuen en modelpassing

Bronmap: `Hoofdstuk_11_Regressieanalyse met twee onafhankelijke variabelen/Oef - 11.3`

#### Correcte inzending

Kopieerbare, volledig ingevulde boilerplate:

```r
# Vul elk antwoord in na <-.
uitbijter_code <- 2
punt_positie <- 3
r_kwadraat_pct <- 87
```

#### Foute testinvoer en misvattingen

- Foute testinvoer voor `uitbijter_code` (alle andere velden blijven correct):

```r
# Vul elk antwoord in na <-.
uitbijter_code <- 1
punt_positie <- 3
r_kwadraat_pct <- 87
```

  - **Waarschijnlijke redenering:** Je hebt waarschijnlijk het punt met een extreme X- of Y-waarde gekozen in plaats van de grootste verticale afstand. **Waarom dit niet klopt:** Punt B heeft een residu van ongeveer +4.8, de grootste absolute verticale afstand; B hoort bij code 2.

- Foute testinvoer voor `punt_positie` (alle andere velden blijven correct):

```r
# Vul elk antwoord in na <-.
uitbijter_code <- 2
punt_positie <- 1
r_kwadraat_pct <- 87
```

  - **Waarschijnlijke redenering:** Je hebt waarschijnlijk de positie visueel benoemd zonder het teken van Y − Ŷ te gebruiken. **Waarom dit niet klopt:** 16 − 18.3 = −2.3, dus P ligt onder de lijn en hoort bij code 3.

- Foute testinvoer voor `r_kwadraat_pct` (alle andere velden blijven correct):

```r
# Vul elk antwoord in na <-.
uitbijter_code <- 2
punt_positie <- 3
r_kwadraat_pct <- 88
```

  - **Waarschijnlijke redenering:** Je hebt waarschijnlijk R, adjusted R² of de decimale R² ingevuld. **Waarom dit niet klopt:** De gewone R² is 0.872; als geheel percentage is dat 87, niet 93, 86 of 0.872.

### Oef - 11.4 Meervoudige regressie - Output en voorspelling

Bronmap: `Hoofdstuk_11_Regressieanalyse met twee onafhankelijke variabelen/Oef - 11.6.1 Basisconcepten meervoudige regressie`

#### Correcte inzending

Kopieerbare, volledig ingevulde boilerplate:

```r
# Vul elk antwoord in na <-.
interpretatie_b1 <- 1
delta_r2 <- 0.08
modelverbetering <- 1
modelconclusie <- 1
voorspelling <- 16
```

#### Foute testinvoer en misvattingen

- Foute testinvoer voor `interpretatie_b1` (alle andere velden blijven correct):

```r
# Vul elk antwoord in na <-.
interpretatie_b1 <- 2
delta_r2 <- 0.08
modelverbetering <- 1
modelconclusie <- 1
voorspelling <- 16
```

  - **Waarschijnlijke redenering:** Je hebt waarschijnlijk de voorwaarde bij constante X2 of het verschil tussen gemiddeld en altijd gemist. **Waarom dit niet klopt:** b1 = 3 beschrijft de gemiddelde verandering in ŷ per eenheid X1 terwijl X2 constant blijft; dat is code 1.

- Foute testinvoer voor `delta_r2` (alle andere velden blijven correct):

```r
# Vul elk antwoord in na <-.
interpretatie_b1 <- 1
delta_r2 <- 8
modelverbetering <- 1
modelconclusie <- 1
voorspelling <- 16
```

  - **Waarschijnlijke redenering:** Je hebt waarschijnlijk de twee R²-waarden opgeteld of in de verkeerde richting afgetrokken. **Waarom dit niet klopt:** ΔR² = 0.38 − 0.30 = 0.08.

- Foute testinvoer voor `modelverbetering` (alle andere velden blijven correct):

```r
# Vul elk antwoord in na <-.
interpretatie_b1 <- 1
delta_r2 <- 0.08
modelverbetering <- 2
modelconclusie <- 1
voorspelling <- 16
```

  - **Waarschijnlijke redenering:** Je hebt p = 0.02 waarschijnlijk niet met α = 0.05 vergeleken. **Waarom dit niet klopt:** 0.02 is kleiner dan 0.05, dus de verbetering is significant en hoort bij code 1.

- Foute testinvoer voor `modelconclusie` (alle andere velden blijven correct):

```r
# Vul elk antwoord in na <-.
interpretatie_b1 <- 1
delta_r2 <- 0.08
modelverbetering <- 1
modelconclusie <- 2
voorspelling <- 16
```

  - **Waarschijnlijke redenering:** Je hebt de globale F-toets waarschijnlijk als bewijs over elke afzonderlijke coëfficiënt of aanname gelezen. **Waarom dit niet klopt:** De globale F-toets vergelijkt het volledige predictormodel met het nulmodel; alleen code 1 drukt dat uit.

- Foute testinvoer voor `voorspelling` (alle andere velden blijven correct):

```r
# Vul elk antwoord in na <-.
interpretatie_b1 <- 1
delta_r2 <- 0.08
modelverbetering <- 1
modelconclusie <- 1
voorspelling <- 17
```

  - **Waarschijnlijke redenering:** Je hebt waarschijnlijk het intercept of een product van coëfficiënt en predictor weggelaten. **Waarom dit niet klopt:** 5 + 2(1) + 3(3) = 16.
