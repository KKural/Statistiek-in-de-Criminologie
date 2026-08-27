# Antwoordbank — Hoofdstuk 8

> Alleen voor docenten en technische validatie. De correcte inzendingen zijn rechtstreeks afgeleid van de canonieke `evaluation/Answer.R`-bestanden en door die evaluatoren gevalideerd.

## Gebruik

- **Correcte inzending** is een volledig ingevulde versie van de boilerplate, of het juiste optienummer bij een keuzeoefening.
- Een **Foute testinvoer** vervangt alleen de getoonde regel of keuze.
- De uitleg bij foute invoer beschrijft de bijbehorende misvatting en feedbackroute.

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

  - **Waarschijnlijke redenering:** je hebt de producten niet per observatie gevormd. **Waarom dit niet klopt:** `(-1)(-2) + 0×0 + 1×2 = 4`.

- Foute testinvoer voor `steekproefcovariantie` (alle andere velden blijven correct):

```r
# Vul de berekeningen en het optienummer in.
kruisproductsom <- 4
steekproefcovariantie <- 1
pearson_r <- 1
interpretatie <- 1
```

  - **Waarschijnlijke redenering:** je hebt een verkeerde noemer gebruikt. **Waarom dit niet klopt:** bij n = 3 is de steekproefnoemer n − 1 = 2, zodat `4 / 2 = 2`.

- Foute testinvoer voor `pearson_r` (alle andere velden blijven correct):

```r
# Vul de berekeningen en het optienummer in.
kruisproductsom <- 4
steekproefcovariantie <- 2
pearson_r <- 2
interpretatie <- 1
```

  - **Waarschijnlijke redenering:** je hebt de covariantie niet gestandaardiseerd. **Waarom dit niet klopt:** `r = 2 / (1 × 2) = 1` en moet binnen [−1, +1] liggen.

- Foute testinvoer voor `interpretatie` (alle andere velden blijven correct):

```r
# Vul de berekeningen en het optienummer in.
kruisproductsom <- 4
steekproefcovariantie <- 2
pearson_r <- 1
interpretatie <- 2
```

  - **Waarschijnlijke redenering:** je hebt r = 1 geïnterpreteerd als afwezigheid van samenhang. **Waarom dit niet klopt:** r = 1 betekent een perfect positief lineair verband.

### Oef - 8.3 Uitbijter herkennen via residu

Bronmap: `Hoofdstuk_8_Correlatie- en regressieanalyse/Oef - 8.3`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Welk gelabeld punt heeft het grootste residu (grootste verticale afstand tot de regressielijn)?
# Geef de bijbehorende letter als tekst (bijv. "A", "B", "C", "D", "E" of "F")

uitbijter <- "B"
```

#### Foute testinvoer en misvattingen

- Foute testinvoer: `uitbijter <- "A"`
  - **Waarschijnlijke redenering:** je koos A omdat dit punt de hoogste Y-waarde heeft. **Waarom dit niet klopt:** een groot residu is de grootste verticale afstand `|Y − Ŷ|`; voor A is die ongeveer 1,1, tegenover 4,8 voor B.
- Foute testinvoer: `uitbijter <- "F"`
  - **Waarschijnlijke redenering:** je koos F omdat zijn X-waarde het meest extreem is. **Waarom dit niet klopt:** leverage en residu zijn verschillende kenmerken; voor F is `|e| ≈ 2,4`, kleiner dan voor B.
- Foute testinvoer: `uitbijter <- "C"`
  - **Waarschijnlijke redenering:** je hebt één verticale afstand geschat zonder alle punten te vergelijken. **Waarom dit niet klopt:** voor C is `|e| ≈ 2,3`, terwijl B een absoluut residu van 4,8 heeft.
- Ongeldige of ontbrekende invoer: `uitbijter <- "uitbijter"`
  - **Misvatting:** de invoer is geen aangeboden puntletter A–F; voer exact één letter in en vergelijk daarna de absolute residuen.

### Oef - 8.4 Ligging van een punt t.o.v. de regressielijn

Bronmap: `Hoofdstuk_8_Correlatie- en regressieanalyse/Oef - 8.4`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Waar ligt punt P ten opzichte van de regressielijn?
# Gebruik de juiste code: 1 = boven de lijn, 2 = op de lijn, 3 = onder de lijn

punt_positie <- 3
```

#### Foute testinvoer en misvattingen

- Foute testinvoer: `punt_positie <- 0`
  - Misvatting: **Waarom dit niet klopt:** alleen code 1 (boven), 2 (op) of 3 (onder) kan de positie ten opzichte van de lijn weergeven.
- Foute testinvoer: `punt_positie <- 1`
  - Misvatting: **Waarschijnlijke redenering:** je hebt mogelijk de visuele positie geschat zonder het residu expliciet te berekenen.
- Foute testinvoer: `punt_positie <- 2`
  - Misvatting: **Waarschijnlijke redenering:** je hebt aangenomen dat P op de lijn ligt. **Waarom dit niet klopt:** bij x = 8 is Ŷ ≈ 18,3 en Y = 16, dus het residu is −2,3 en P ligt onder de lijn.

### Oef - 8.5 R² omzetten naar een percentage

Bronmap: `Hoofdstuk_8_Correlatie- en regressieanalyse/Oef - 8.5`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Hoeveel procent van de variantie in de responsvariabele wordt verklaard door het model?
# Geef R² als een geheel getal (bijv. 72 voor 72%)

r_kwadraat_pct <- 87
```

#### Foute testinvoer en misvattingen

- Foute testinvoer: `r_kwadraat_pct <- 0`
  - Misvatting: **Waarschijnlijke redenering:** je antwoord past mogelijk bij een verwisseling van R, R², adjusted R² of de decimale en procentuele schaal.
- Foute testinvoer: `r_kwadraat_pct <- 86`
  - Misvatting: **Waarschijnlijke redenering:** je hebt de gecorrigeerde R² van 0,856 gebruikt. **Waarom dit niet klopt:** gevraagd is de gewone R² van 0,872, oftewel afgerond 87%.
- Foute testinvoer: `r_kwadraat_pct <- 93`
  - Misvatting: **Waarschijnlijke redenering:** je hebt R = 0,934 als percentage gelezen. **Waarom dit niet klopt:** gevraagd is R² = 0,872, niet R.
- Foute testinvoer: `r_kwadraat_pct <- 0.872`
  - Misvatting: **Waarschijnlijke redenering:** je hebt de correcte decimale R² ingevoerd zonder naar een percentage om te zetten. **Waarom dit niet klopt:** `0,872 × 100 = 87,2`, afgerond 87.
