# Antwoordbank — Hoofdstuk 11

> Alleen voor docenten en technische validatie. Elke correcte inzending is een volledig ingevulde kopie van de bijbehorende boilerplate.

## Gebruik

- **Correcte inzending** kan rechtstreeks in Dodona worden gekopieerd.
- Een **Foute testinvoer** wijzigt precies één antwoord; alle andere antwoorden blijven correct.
- De uitleg na elke foute invoer benoemt de waarschijnlijke misvatting.

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

- Foute testinvoer voor `afhankelijke_variabele`:

```r
# Vul elk antwoord in na <-.
afhankelijke_variabele <- 1
scp_x1y <- -4
voorspelling <- 10
interpretatie_b1 <- 2
```

  - **Misvatting:** een predictor is gekozen in plaats van de variabele die door het model wordt voorspeld; de angstscore Y is de afhankelijke variabele, code 3.

- Foute testinvoer voor `scp_x1y`:

```r
# Vul elk antwoord in na <-.
afhankelijke_variabele <- 3
scp_x1y <- 4
voorspelling <- 10
interpretatie_b1 <- 2
```

  - **Misvatting:** de negatieve tekens van de gepaarde afwijkingsproducten zijn verloren; de kruisproductsom is -4.

- Foute testinvoer voor `voorspelling`:

```r
# Vul elk antwoord in na <-.
afhankelijke_variabele <- 3
scp_x1y <- -4
voorspelling <- 11
interpretatie_b1 <- 2
```

  - **Misvatting:** het minteken voor X2 of een vermenigvuldiging is gemist; 5 + 2(4) - 1(3) = 10.

- Foute testinvoer voor `interpretatie_b1`:

```r
# Vul elk antwoord in na <-.
afhankelijke_variabele <- 3
scp_x1y <- -4
voorspelling <- 10
interpretatie_b1 <- 1
```

  - **Misvatting:** het negatieve teken of de voorwaarde "bij constante X2" is gemist; b1 = -2.2 beschrijft een gemiddelde daling in Y, code 2.

### Oef - 11.3 Uitbijter herkennen via residu

Bronmap: `Hoofdstuk_11_Regressieanalyse met twee onafhankelijke variabelen/Oef - 11.3`

#### Correcte inzending

Kopieerbare, volledig ingevulde boilerplate:

```r
# Welk gelabeld punt heeft het grootste residu (grootste verticale afstand tot de regressielijn)?
# Geef de bijbehorende letter als tekst (bijv. "A", "B", "C", "D", "E" of "F")

uitbijter <- "B"
```

#### Foute testinvoer en misvattingen

- Foute testinvoer voor `uitbijter`:

```r
# Welk gelabeld punt heeft het grootste residu (grootste verticale afstand tot de regressielijn)?
# Geef de bijbehorende letter als tekst (bijv. "A", "B", "C", "D", "E" of "F")

uitbijter <- "A"
```

  - **Misvatting:** punt A is gekozen omdat het de hoogste Y-waarde heeft. Een residu is de verticale afstand Y - Ŷ; punt B heeft met ongeveer +4.8 het grootste absolute residu.

### Oef - 11.4 Ligging van een punt t.o.v. de regressielijn

Bronmap: `Hoofdstuk_11_Regressieanalyse met twee onafhankelijke variabelen/Oef - 11.4`

#### Correcte inzending

Kopieerbare, volledig ingevulde boilerplate:

```r
# Waar ligt punt P ten opzichte van de regressielijn?
# Gebruik de juiste code: 1 = boven de lijn, 2 = op de lijn, 3 = onder de lijn

punt_positie <- 3
```

#### Foute testinvoer en misvattingen

- Foute testinvoer voor `punt_positie`:

```r
# Waar ligt punt P ten opzichte van de regressielijn?
# Gebruik de juiste code: 1 = boven de lijn, 2 = op de lijn, 3 = onder de lijn

punt_positie <- 1
```

  - **Misvatting:** de visuele positie is gebruikt zonder het residu te berekenen. Omdat 16 - 18.3 = -2.3, ligt P onder de lijn en hoort code 3 bij het antwoord.

### Oef - 11.5 R² omzetten naar een percentage

Bronmap: `Hoofdstuk_11_Regressieanalyse met twee onafhankelijke variabelen/Oef - 11.5`

#### Correcte inzending

Kopieerbare, volledig ingevulde boilerplate:

```r
# Hoeveel procent van de variantie in de responsvariabele wordt verklaard door het model?
# Geef R² als een geheel getal (bijv. 72 voor 72%)

r_kwadraat_pct <- 87
```

#### Foute testinvoer en misvattingen

- Foute testinvoer voor `r_kwadraat_pct`:

```r
# Hoeveel procent van de variantie in de responsvariabele wordt verklaard door het model?
# Geef R² als een geheel getal (bijv. 72 voor 72%)

r_kwadraat_pct <- 93
```

  - **Misvatting:** R = 0.934 is als percentage gebruikt in plaats van R² = 0.872; de gevraagde omzetting is 0.872 × 100, afgerond 87%.

### Oef - 11.6 Meervoudige regressie - Coëfficiënt en modelverbetering

Bronmap: `Hoofdstuk_11_Regressieanalyse met twee onafhankelijke variabelen/Oef - 11.6.1 Basisconcepten meervoudige regressie`

#### Correcte inzending

Kopieerbare, volledig ingevulde boilerplate:

```r
# Vul elk antwoord in na <-.
interpretatie_b1 <- 1
delta_r2 <- 0.08
modelverbetering <- 1
```

#### Foute testinvoer en misvattingen

- Foute testinvoer voor `interpretatie_b1`:

```r
# Vul elk antwoord in na <-.
interpretatie_b1 <- 2
delta_r2 <- 0.08
modelverbetering <- 1
```

  - **Misvatting:** een gemiddelde partiële relatie is als een garantie voor ieder individu gelezen. b1 = 3 geldt gemiddeld en bij constante X2; daarom is code 1 correct.

- Foute testinvoer voor `delta_r2`:

```r
# Vul elk antwoord in na <-.
interpretatie_b1 <- 1
delta_r2 <- 0.68
modelverbetering <- 1
```

  - **Misvatting:** de twee R²-waarden zijn opgeteld; de extra verklaarde variantie is 0.38 - 0.30 = 0.08.

- Foute testinvoer voor `modelverbetering`:

```r
# Vul elk antwoord in na <-.
interpretatie_b1 <- 1
delta_r2 <- 0.08
modelverbetering <- 2
```

  - **Misvatting:** p = 0.02 is niet correct met α = 0.05 vergeleken. Omdat p < α is de modelverbetering significant, code 1.

### Oef - 11.7 Regressie-output - Modeltoets en voorspelling

Bronmap: `Hoofdstuk_11_Regressieanalyse met twee onafhankelijke variabelen/Oef - 11.7.1 Modelfit en ANOVA-output`

#### Correcte inzending

Kopieerbare, volledig ingevulde boilerplate:

```r
# Vul elk antwoord in na <-.
modelconclusie <- 1
voorspelling <- 16
```

#### Foute testinvoer en misvattingen

- Foute testinvoer voor `modelconclusie`:

```r
# Vul elk antwoord in na <-.
modelconclusie <- 2
voorspelling <- 16
```

  - **Misvatting:** de globale F-toets is als bewijs over elke afzonderlijke coëfficiënt gelezen. De toets vergelijkt het volledige predictormodel met het nulmodel; code 1 is correct.

- Foute testinvoer voor `voorspelling`:

```r
# Vul elk antwoord in na <-.
modelconclusie <- 1
voorspelling <- 11
```

  - **Misvatting:** een predictorbijdrage is weggelaten. De volledige voorspelling is 5 + 2(1) + 3(3) = 16.
