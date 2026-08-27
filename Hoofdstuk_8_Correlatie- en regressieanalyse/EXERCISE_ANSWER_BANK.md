# Antwoordbank — Hoofdstuk 8

> Alleen voor docenten en technische validatie. De correcte inzendingen zijn rechtstreeks afgeleid van de canonieke `evaluation/Answer.R`-bestanden en door die evaluatoren gevalideerd.

## Gebruik

- **Correcte inzending** is een volledig ingevulde versie van de boilerplate, of het juiste optienummer bij een keuzeoefening.
- Een **Foute testinvoer** vervangt alleen de getoonde regel of keuze.
- De uitleg bij foute invoer beschrijft de bijbehorende misvatting en feedbackroute.

### Oef - 8.1.1 Koffieprijs en ontbossing - Kruisproductsom

Bronmap: `Hoofdstuk_8_Correlatie- en regressieanalyse/Oef - 8.1.1 Somkwadraten - Koffieprijs en ontbossing`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Vul het antwoord in na <-.
kruisproductsom <- 4
```

#### Foute testinvoer en misvattingen

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
kruisproductsom <--4
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt bij minstens één gepaard product het teken omgekeerd.

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
kruisproductsom <-0
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt de afwijkingen afzonderlijk opgeteld in plaats van gepaarde producten te vormen.

- Ongeldige of ontbrekende invoer:

```r
kruisproductsom <-
```

  - Misvatting: geen eindig getal ingevuld; de evaluator geeft de aparte route **Waarom dit niet klopt**, **Denkregel** en **Volgende stap**.

### Oef - 8.1.2 Koffieprijs en ontbossing - Pearsoncorrelatie

Bronmap: `Hoofdstuk_8_Correlatie- en regressieanalyse/Oef - 8.1.2 Variantie, covariantie en Pearson`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Vul het antwoord in na <-.
pearson_r <- 1
```

#### Foute testinvoer en misvattingen

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
pearson_r <-6
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt de covariantie overgenomen zonder te standaardiseren.

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
pearson_r <-0.5
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt slechts door één schaalfactor of door een verkeerde noemer gedeeld.

- Ongeldige of ontbrekende invoer:

```r
pearson_r <-
```

  - Misvatting: geen eindig getal ingevuld; de evaluator geeft de aparte route **Waarom dit niet klopt**, **Denkregel** en **Volgende stap**.

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

- Foute testinvoer: `uitbijter <- "uitbijter"`
  - Misvatting: ❌ **Punt met het grootste absolute residu** — **Fout. Antwoord: `"UITBIJTER"`. Correct: `"B"`**
- Foute testinvoer: `uitbijter <- "A"`
  - Misvatting: **Waarschijnlijke redenering:** je koos mogelijk A omdat dit punt de hoogste Y-waarde (33) heeft.
- Foute testinvoer: `uitbijter <- "F"`
  - Misvatting: **Waarschijnlijke redenering:** je koos mogelijk F omdat zijn X-waarde het meest extreem is.
- Foute testinvoer: `uitbijter <- "** — **Fout. Antwoord: '\""`
  - Misvatting: ❌ **Punt met het grootste absolute residu** — **Fout. Antwoord: `"** — **FOUT. ANTWOORD: `""`. Correct: `"B"`**

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

## Hoofdstuk 9
