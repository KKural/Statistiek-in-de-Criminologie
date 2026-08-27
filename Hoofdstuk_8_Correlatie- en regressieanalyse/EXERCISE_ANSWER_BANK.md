# Antwoordbank — Hoofdstuk 8

> Alleen voor docenten en technische validatie. De correcte inzendingen zijn rechtstreeks afgeleid van de canonieke `evaluation/Answer.R`-bestanden en door die evaluatoren gevalideerd.

## Gebruik

- **Correcte inzending** is een volledig ingevulde versie van de boilerplate, of het juiste optienummer bij een keuzeoefening.
- Een **Foute testinvoer** wijzigt steeds precies één antwoord terwijl de andere antwoorden correct blijven.
- De uitleg na elke foute invoer benoemt de bijbehorende misvatting en gerichte feedbackroute.

### Oef - 8.1 Pearsoncorrelatie stap voor stap

Bronmap: `Hoofdstuk_8_Correlatie- en regressieanalyse/Oef - 8.1.1 Somkwadraten - Koffieprijs en ontbossing`

#### Correcte inzending

Kopieerbare, volledig ingevulde boilerplate:

```r
# Vul de berekeningen en het optienummer in.
kruisproductsom <- 4
steekproefcovariantie <- 2
pearson_r <- 1
interpretatie <- 1
```

#### Foute testinvoer en misvattingen

- Foute testinvoer voor `kruisproductsom` (alle andere velden blijven correct):

```r
# Vul de berekeningen en het optienummer in.
kruisproductsom <- 1
steekproefcovariantie <- 2
pearson_r <- 1
interpretatie <- 1
```

  - **Waarschijnlijke redenering:** je hebt de producten niet per observatie gevormd. **Waarom dit niet klopt:** (-1)(-2) + 0×0 + 1×2 = 2 + 0 + 2 = 4.

- Foute testinvoer voor `steekproefcovariantie` (alle andere velden blijven correct):

```r
# Vul de berekeningen en het optienummer in.
kruisproductsom <- 4
steekproefcovariantie <- 1
pearson_r <- 1
interpretatie <- 1
```

  - **Waarschijnlijke redenering:** je hebt een verkeerde noemer gebruikt. **Waarom dit niet klopt:** bij n = 3 is de steekproefnoemer n - 1 = 2, zodat 4 / 2 = 2.

- Foute testinvoer voor `pearson_r` (alle andere velden blijven correct):

```r
# Vul de berekeningen en het optienummer in.
kruisproductsom <- 4
steekproefcovariantie <- 2
pearson_r <- 2
interpretatie <- 1
```

  - **Waarschijnlijke redenering:** je hebt de covariantie niet gestandaardiseerd. **Waarom dit niet klopt:** r = cov(X,Y) / (sX sY) = 2 / (1 × 2) = 1 en moet binnen [-1,+1] liggen.

- Foute testinvoer voor `interpretatie` (alle andere velden blijven correct):

```r
# Vul de berekeningen en het optienummer in.
kruisproductsom <- 4
steekproefcovariantie <- 2
pearson_r <- 1
interpretatie <- 2
```

  - **Waarschijnlijke redenering:** je hebt r = 1 geïnterpreteerd als afwezigheid van samenhang. **Waarom dit niet klopt:** r = 1 is de bovengrens van Pearson's r en betekent een perfect positief lineair verband.

### Oef - 8.3 Regressieresiduen en modeloutput interpreteren

Bronmap: `Hoofdstuk_8_Correlatie- en regressieanalyse/Oef - 8.3`

#### Correcte inzending

Kopieerbare, volledig ingevulde boilerplate:

```r
# Vul de twee optienummers en het gehele percentage in.
grootste_residu_punt <- 2
punt_positie <- 3
r_kwadraat_pct <- 87
```

#### Foute testinvoer en misvattingen

- Foute testinvoer voor `grootste_residu_punt` (alle andere velden blijven correct):

```r
# Vul de twee optienummers en het gehele percentage in.
grootste_residu_punt <- 1
punt_positie <- 3
r_kwadraat_pct <- 87
```

  - **Waarschijnlijke redenering:** je hebt een hoge Y-waarde verward met een grote afstand tot de lijn. **Waarom dit niet klopt:** voor punt B, code 2, is e = 29 - 24.2 = 4.8; dat is de grootste absolute waarde in de tabel.

- Foute testinvoer voor `punt_positie` (alle andere velden blijven correct):

```r
# Vul de twee optienummers en het gehele percentage in.
grootste_residu_punt <- 2
punt_positie <- 1
r_kwadraat_pct <- 87
```

  - **Waarschijnlijke redenering:** je hebt de visuele positie geschat zonder Y met Ŷ te vergelijken. **Waarom dit niet klopt:** e = 16 - 18.3 = -2.3; een negatief residu betekent dat P onder de regressielijn ligt, optie 3.

- Foute testinvoer voor `r_kwadraat_pct` (alle andere velden blijven correct):

```r
# Vul de twee optienummers en het gehele percentage in.
grootste_residu_punt <- 2
punt_positie <- 3
r_kwadraat_pct <- 88
```

  - **Waarschijnlijke redenering:** je hebt de verkeerde modelmaat of schaal gebruikt. **Waarom dit niet klopt:** de gewone R² is 0.872; maal 100 is 87.2%, afgerond als geheel percentage 87.
