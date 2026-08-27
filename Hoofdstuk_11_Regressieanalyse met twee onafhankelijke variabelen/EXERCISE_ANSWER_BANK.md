# Antwoordbank — Hoofdstuk 11

> Alleen voor docenten en technische validatie. De correcte inzendingen zijn rechtstreeks afgeleid van de canonieke `evaluation/Answer.R`-bestanden en door die evaluatoren gevalideerd.

## Gebruik

- **Correcte inzending** is een volledig ingevulde versie van de boilerplate, of het juiste optienummer bij een keuzeoefening.
- Een **Foute testinvoer** vervangt alleen de getoonde regel of keuze.
- De uitleg bij foute invoer beschrijft de bijbehorende misvatting en feedbackroute.

### Oef - 11.1.1 Regressie - Afhankelijke variabele

Bronmap: `Hoofdstuk_11_Regressieanalyse met twee onafhankelijke variabelen/Oef - 11.1.1 Variabelen en gemiddelden`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Vul het antwoord in na <-.
afhankelijke_variabele <- 3
```

#### Foute testinvoer en misvattingen

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
afhankelijke_variabele <-1
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt een predictor gekozen omdat die een mogelijke verklaring vormt.

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
afhankelijke_variabele <-2
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt de tweede predictor als uitkomst gelezen.

- Ongeldige of ontbrekende invoer:

```r
afhankelijke_variabele <-
```

  - Misvatting: geen eindig getal ingevuld; de evaluator geeft de aparte route **Waarom dit niet klopt**, **Denkregel** en **Volgende stap**.

### Oef - 11.1.2 Regressie - Eén kruisproductsom

Bronmap: `Hoofdstuk_11_Regressieanalyse met twee onafhankelijke variabelen/Oef - 11.1.2 Somkwadraten en kruisproducten`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Vul het antwoord in na <-.
scp_x1y <- -4
```

#### Foute testinvoer en misvattingen

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
scp_x1y <-4
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt de negatieve tekens van de kruisproducten verloren.

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
scp_x1y <-0
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt de afwijkingen afzonderlijk opgeteld in plaats van gepaarde producten te vormen.

- Ongeldige of ontbrekende invoer:

```r
scp_x1y <-
```

  - Misvatting: geen eindig getal ingevuld; de evaluator geeft de aparte route **Waarom dit niet klopt**, **Denkregel** en **Volgende stap**.

### Oef - 11.1.3 Regressie - Eén voorspelling

Bronmap: `Hoofdstuk_11_Regressieanalyse met twee onafhankelijke variabelen/Oef - 11.1.3 Regressiemodel en voorspelling`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Vul het antwoord in na <-.
voorspelling <- 10
```

#### Foute testinvoer en misvattingen

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
voorspelling <-16
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt de negatieve coëfficiënt van X2 als positief behandeld.

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
voorspelling <-5
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt alleen het intercept ingevuld zonder de predictorbijdragen.

- Ongeldige of ontbrekende invoer:

```r
voorspelling <-
```

  - Misvatting: geen eindig getal ingevuld; de evaluator geeft de aparte route **Waarom dit niet klopt**, **Denkregel** en **Volgende stap**.

### Oef - 11.1.4 Regressie - Teken van een partiële coëfficiënt

Bronmap: `Hoofdstuk_11_Regressieanalyse met twee onafhankelijke variabelen/Oef - 11.1.4 Interpretatie van regressiegewichten`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Vul het antwoord in na <-.
interpretatie_b1 <- 2
```

#### Foute testinvoer en misvattingen

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
interpretatie_b1 <-1
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt het minteken van de coëfficiënt genegeerd.

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
interpretatie_b1 <-3
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt negatief verward met afwezig; een niet-nulcoëfficiënt geeft wel een richting aan.

- Ongeldige of ontbrekende invoer:

```r
interpretatie_b1 <-
```

  - Misvatting: geen eindig getal ingevuld; de evaluator geeft de aparte route **Waarom dit niet klopt**, **Denkregel** en **Volgende stap**.

### Oef - 11.3 Uitbijter herkennen via residu

Bronmap: `Hoofdstuk_11_Regressieanalyse met twee onafhankelijke variabelen/Oef - 11.3`

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

### Oef - 11.4 Ligging van een punt t.o.v. de regressielijn

Bronmap: `Hoofdstuk_11_Regressieanalyse met twee onafhankelijke variabelen/Oef - 11.4`

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

### Oef - 11.5 R² omzetten naar een percentage

Bronmap: `Hoofdstuk_11_Regressieanalyse met twee onafhankelijke variabelen/Oef - 11.5`

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

### Oef - 11.6.1 Meervoudige regressie - Partiële interpretatie

Bronmap: `Hoofdstuk_11_Regressieanalyse met twee onafhankelijke variabelen/Oef - 11.6.1 Basisconcepten meervoudige regressie`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Vul het antwoord in na <-.
interpretatie_b1 <- 1
```

#### Foute testinvoer en misvattingen

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
interpretatie_b1 <-2
```

  - Misvatting: **Waarschijnlijke redenering:** Je maakt van een gemiddelde modelrelatie een deterministische garantie voor ieder individu.

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
interpretatie_b1 <-3
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt de uitkomst en de andere predictor verwisseld.

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
interpretatie_b1 <-4
```

  - Misvatting: **Waarschijnlijke redenering:** Je verwart de helling met het intercept.

- Ongeldige of ontbrekende invoer:

```r
interpretatie_b1 <-
```

  - Misvatting: geen eindig getal ingevuld; de evaluator geeft de aparte route **Waarom dit niet klopt**, **Denkregel** en **Volgende stap**.

### Oef - 11.6.2 Meervoudige regressie - Toename in verklaarde variantie

Bronmap: `Hoofdstuk_11_Regressieanalyse met twee onafhankelijke variabelen/Oef - 11.6.2 Modelvergelijking en interpretatie`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Vul de antwoorden in na <-.
delta_r2 <- 0.08
conclusie <- 1
```

#### Foute testinvoer en misvattingen

- Foute testinvoer:

```r
# Vul de antwoorden in na <-.
delta_r2 <-0.68
conclusie <-1
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt de twee R²-waarden opgeteld in plaats van het verschil te nemen.

- Foute testinvoer:

```r
# Vul de antwoorden in na <-.
delta_r2 <-0.21
conclusie <-1
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt een relatieve procentuele groei berekend in plaats van het absolute R²-verschil.

- Foute testinvoer:

```r
# Vul de antwoorden in na <-.
delta_r2 <-0.08
conclusie <-2
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt p = 0.02 niet correct met α = 0.05 vergeleken.

- Ongeldige of ontbrekende invoer:

```r
delta_r2 <-
```

  - Misvatting: geen eindig getal ingevuld; de evaluator geeft de aparte route **Waarom dit niet klopt**, **Denkregel** en **Volgende stap**.

### Oef - 11.7.1 Regressie-output - Modeltoets

Bronmap: `Hoofdstuk_11_Regressieanalyse met twee onafhankelijke variabelen/Oef - 11.7.1 Modelfit en ANOVA-output`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Vul het antwoord in na <-.
modelconclusie <- 1
```

#### Foute testinvoer en misvattingen

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
modelconclusie <-2
```

  - Misvatting: **Waarschijnlijke redenering:** Je trekt uit de globale F-toets een conclusie over iedere afzonderlijke coëfficiënt.

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
modelconclusie <-3
```

  - Misvatting: **Waarschijnlijke redenering:** Je gebruikt de F-toets ten onrechte als normaliteitstoets.

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
modelconclusie <-4
```

  - Misvatting: **Waarschijnlijke redenering:** Significantie betekent niet dat het model alle variantie verklaart.

- Ongeldige of ontbrekende invoer:

```r
modelconclusie <-
```

  - Misvatting: geen eindig getal ingevuld; de evaluator geeft de aparte route **Waarom dit niet klopt**, **Denkregel** en **Volgende stap**.

### Oef - 11.7.2 Regressie-output - Voorspelde waarde

Bronmap: `Hoofdstuk_11_Regressieanalyse met twee onafhankelijke variabelen/Oef - 11.7.2 Regressieparameters en voorspelling`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Vul het antwoord in na <-.
voorspelling <- 16
```

#### Foute testinvoer en misvattingen

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
voorspelling <-11
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt één predictorbijdrage weggelaten.

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
voorspelling <-15
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt het intercept niet toegevoegd.

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
voorspelling <-10
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt coëfficiënten of predictorwaarden bij elkaar opgeteld zonder de producten te vormen.

- Ongeldige of ontbrekende invoer:

```r
voorspelling <-
```

  - Misvatting: geen eindig getal ingevuld; de evaluator geeft de aparte route **Waarom dit niet klopt**, **Denkregel** en **Volgende stap**.
