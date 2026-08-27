# Antwoordbank — Hoofdstuk 9

> Alleen voor docenten en technische validatie. De correcte inzendingen zijn rechtstreeks afgeleid van de canonieke `evaluation/Answer.R`-bestanden en door die evaluatoren gevalideerd.

## Gebruik

- **Correcte inzending** is een volledig ingevulde versie van de boilerplate, of het juiste optienummer bij een keuzeoefening.
- Een **Foute testinvoer** vervangt alleen de getoonde regel of keuze.
- De uitleg bij foute invoer beschrijft de bijbehorende misvatting en feedbackroute.

### Oef - 9.1 Chi-kwadraat - Eén verwachte frequentie

Bronmap: `Hoofdstuk_9_Inferentiële statistiek en variantieanalyse/Oef - 9.1`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Vul het antwoord in na <-.
verwachte_frequentie <-12
```

#### Foute testinvoer en misvattingen

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
verwachte_frequentie <-70
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt marginale totalen opgeteld in plaats van vermenigvuldigd.

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
verwachte_frequentie <-1200
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt niet door het totale aantal waarnemingen gedeeld.

- Ongeldige of ontbrekende invoer:

```r
verwachte_frequentie <-
```

  - Misvatting: geen eindig getal ingevuld; de evaluator geeft de aparte route **Waarom dit niet klopt**, **Denkregel** en **Volgende stap**.

### Oef - 9.2 Betrouwbaarheidsinterval - Twee grenzen

Bronmap: `Hoofdstuk_9_Inferentiële statistiek en variantieanalyse/Oef - 9.2`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Vul de antwoorden in na <-.
ondergrens <-26.08
bovengrens <-33.92
```

#### Foute testinvoer en misvattingen

- Foute testinvoer:

```r
# Vul de antwoorden in na <-.
ondergrens <-28.04
bovengrens <-33.92
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt alleen de kritieke waarde afgetrokken zonder met de standaardfout te vermenigvuldigen.

- Foute testinvoer:

```r
# Vul de antwoorden in na <-.
ondergrens <-26.08
bovengrens <-31.96
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt alleen de kritieke waarde opgeteld zonder de standaardfout te gebruiken.

- Foute testinvoer:

```r
# Vul de antwoorden in na <-.
ondergrens <-33.92
bovengrens <-33.92
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt de onder- en bovengrens verwisseld.

- Ongeldige of ontbrekende invoer:

```r
ondergrens <-
```

  - Misvatting: geen eindig getal ingevuld; de evaluator geeft de aparte route **Waarom dit niet klopt**, **Denkregel** en **Volgende stap**.

### Oef - 9.3 Steekproefgrootte - Naar boven afronden

Bronmap: `Hoofdstuk_9_Inferentiële statistiek en variantieanalyse/Oef - 9.3`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Vul het antwoord in na <-.
n_minimum <-43
```

#### Foute testinvoer en misvattingen

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
n_minimum <-42
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt volgens de gewone afrondingsregel afgerond en daardoor de minimumvoorwaarde onderschreden.

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
n_minimum <-42.3
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt geen geheel aantal personen gerapporteerd.

- Ongeldige of ontbrekende invoer:

```r
n_minimum <-
```

  - Misvatting: geen eindig getal ingevuld; de evaluator geeft de aparte route **Waarom dit niet klopt**, **Denkregel** en **Volgende stap**.

### Oef - 9.4.1 Fietsdiefstallen - Eén groepsgemiddelde

Bronmap: `Hoofdstuk_9_Inferentiële statistiek en variantieanalyse/Oef - 9.4.1 Groepsgemiddelden fietsdiefstallen`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Vul het antwoord in na <-.
groepsgemiddelde <-4
```

#### Foute testinvoer en misvattingen

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
groepsgemiddelde <-12
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt de groepssom ingevuld zonder door de groepsgrootte te delen.

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
groepsgemiddelde <-3
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt de groepsgrootte ingevuld in plaats van het gemiddelde.

- Ongeldige of ontbrekende invoer:

```r
groepsgemiddelde <-
```

  - Misvatting: geen eindig getal ingevuld; de evaluator geeft de aparte route **Waarom dit niet klopt**, **Denkregel** en **Volgende stap**.

### Oef - 9.4.2 Fietsdiefstallen - Binnengroepssom van kwadraten

Bronmap: `Hoofdstuk_9_Inferentiële statistiek en variantieanalyse/Oef - 9.4.2 Binnengroepsvariatie`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Vul het antwoord in na <-.
ss_binnen <-8
```

#### Foute testinvoer en misvattingen

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
ss_binnen <-4
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt absolute afwijkingen opgeteld zonder ze te kwadrateren.

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
ss_binnen <-16
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt een verkeerde referentiewaarde of een extra factor gebruikt.

- Ongeldige of ontbrekende invoer:

```r
ss_binnen <-
```

  - Misvatting: geen eindig getal ingevuld; de evaluator geeft de aparte route **Waarom dit niet klopt**, **Denkregel** en **Volgende stap**.

### Oef - 9.4.3 ANOVA - F-ratio en beslissing

Bronmap: `Hoofdstuk_9_Inferentiële statistiek en variantieanalyse/Oef - 9.4.3 Tussengroepsvariatie en F-toets`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Vul de antwoorden in na <-.
f_ratio <-4
significant <-1
```

#### Foute testinvoer en misvattingen

- Foute testinvoer:

```r
# Vul de antwoorden in na <-.
f_ratio <-0.25
significant <-1
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt teller en noemer van de F-ratio omgekeerd.

- Foute testinvoer:

```r
# Vul de antwoorden in na <-.
f_ratio <-4
significant <-2
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt de gevonden F-waarde niet correct met de kritieke grens vergeleken.

- Ongeldige of ontbrekende invoer:

```r
f_ratio <-
```

  - Misvatting: geen eindig getal ingevuld; de evaluator geeft de aparte route **Waarom dit niet klopt**, **Denkregel** en **Volgende stap**.

### Oef - 9.5 ANOVA - Relatie tussen F en p

Bronmap: `Hoofdstuk_9_Inferentiële statistiek en variantieanalyse/Oef - 9.5`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Vul het antwoord in na <-.
antwoord <-3
```

#### Foute testinvoer en misvattingen

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
antwoord <-1
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt de richting tussen toetsingsgrootheid en staartkans omgekeerd.

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
antwoord <-2
```

  - Misvatting: **Waarschijnlijke redenering:** Je negeert dat de waargenomen toetsingsgrootheid de staartgrens bepaalt.

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
antwoord <-4
```

  - Misvatting: **Waarschijnlijke redenering:** Een p-waarde is een kans en kan niet negatief zijn.

- Ongeldige of ontbrekende invoer:

```r
antwoord <-
```

  - Misvatting: geen eindig getal ingevuld; de evaluator geeft de aparte route **Waarom dit niet klopt**, **Denkregel** en **Volgende stap**.
