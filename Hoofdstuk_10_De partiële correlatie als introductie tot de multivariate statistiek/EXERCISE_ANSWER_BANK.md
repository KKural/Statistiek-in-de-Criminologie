# Antwoordbank — Hoofdstuk 10

> Alleen voor docenten en technische validatie. De correcte inzendingen zijn rechtstreeks afgeleid van de canonieke `evaluation/Answer.R`-bestanden en door die evaluatoren gevalideerd.

## Gebruik

- **Correcte inzending** is een volledig ingevulde versie van de boilerplate, of het juiste optienummer bij een keuzeoefening.
- Een **Foute testinvoer** vervangt alleen de getoonde regel of keuze.
- De uitleg bij foute invoer beschrijft de bijbehorende misvatting en feedbackroute.

### Oef - 10.1.1 Partiële correlatie - Eén gemiddelde

Bronmap: `Hoofdstuk_10_De partiële correlatie als introductie tot de multivariate statistiek/Oef - 10.1.1 Gemiddelden voor partiële correlatie`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Vul het antwoord in na <-.
gemiddelde_x <- 2.5
```

#### Foute testinvoer en misvattingen

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
gemiddelde_x <-10
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt de som ingevuld zonder door het aantal waarnemingen te delen.

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
gemiddelde_x <-4
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt de grootste waarde gebruikt in plaats van het gemiddelde.

- Ongeldige of ontbrekende invoer:

```r
gemiddelde_x <-
```

  - Misvatting: geen eindig getal ingevuld; de evaluator geeft de aparte route **Waarom dit niet klopt**, **Denkregel** en **Volgende stap**.

### Oef - 10.1.2 Partiële correlatie - Eén kruisproductsom

Bronmap: `Hoofdstuk_10_De partiële correlatie als introductie tot de multivariate statistiek/Oef - 10.1.2 Somkwadraten en kruisproductsommen`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Vul het antwoord in na <-.
scp_xy <- -4
```

#### Foute testinvoer en misvattingen

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
scp_xy <-4
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt het negatieve teken van de gepaarde producten verloren.

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
scp_xy <-0
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt de afwijkingen afzonderlijk gesommeerd in plaats van kruisproducten te vormen.

- Ongeldige of ontbrekende invoer:

```r
scp_xy <-
```

  - Misvatting: geen eindig getal ingevuld; de evaluator geeft de aparte route **Waarom dit niet klopt**, **Denkregel** en **Volgende stap**.

### Oef - 10.1.3 Partiële correlatie - Van SS naar variantie

Bronmap: `Hoofdstuk_10_De partiële correlatie als introductie tot de multivariate statistiek/Oef - 10.1.3 Varianties en standaarddeviaties`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Vul het antwoord in na <-.
variantie_x <- 6
```

#### Foute testinvoer en misvattingen

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
variantie_x <-4.5
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt door n gedeeld en zo de populatievariantie berekend.

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
variantie_x <-18
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt de som van kwadraten niet door de vrijheidsgraden gedeeld.

- Ongeldige of ontbrekende invoer:

```r
variantie_x <-
```

  - Misvatting: geen eindig getal ingevuld; de evaluator geeft de aparte route **Waarom dit niet klopt**, **Denkregel** en **Volgende stap**.

### Oef - 10.1.4 Partiële correlatie - Eén bivariate correlatie

Bronmap: `Hoofdstuk_10_De partiële correlatie als introductie tot de multivariate statistiek/Oef - 10.1.4 Covarianties en bivariate correlaties`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Vul het antwoord in na <-.
r_xy <- 0.5
```

#### Foute testinvoer en misvattingen

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
r_xy <-3
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt de covariantie overgenomen zonder te standaardiseren.

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
r_xy <-1.5
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt slechts door één standaardafwijking gedeeld.

- Ongeldige of ontbrekende invoer:

```r
r_xy <-
```

  - Misvatting: geen eindig getal ingevuld; de evaluator geeft de aparte route **Waarom dit niet klopt**, **Denkregel** en **Volgende stap**.

### Oef - 10.1.5 Partiële correlatie - Eén controleberekening

Bronmap: `Hoofdstuk_10_De partiële correlatie als introductie tot de multivariate statistiek/Oef - 10.1.5 Partiële correlatie en interpretatie`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Vul het antwoord in na <-.
r_xy_z <- 0.504
```

#### Foute testinvoer en misvattingen

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
r_xy_z <-0.6
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt de bivariate correlatie overgenomen zonder voor Z te controleren.

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
r_xy_z <-0.4
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt een van de correlaties uit de formule overgenomen in plaats van de partiële correlatie te berekenen.

- Ongeldige of ontbrekende invoer:

```r
r_xy_z <-
```

  - Misvatting: geen eindig getal ingevuld; de evaluator geeft de aparte route **Waarom dit niet klopt**, **Denkregel** en **Volgende stap**.

### Oef - 10.2 Partiële correlatie - Schijnverband herkennen

Bronmap: `Hoofdstuk_10_De partiële correlatie als introductie tot de multivariate statistiek/Oef - 10.2`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Vul het antwoord in na <-.
relatietype <- 1
```

#### Foute testinvoer en misvattingen

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
relatietype <-2
```

  - Misvatting: **Waarschijnlijke redenering:** Bij suppressie wordt het gecontroleerde verband juist sterker zichtbaar.

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
relatietype <-3
```

  - Misvatting: **Waarschijnlijke redenering:** De daling van 0.60 naar 0.10 is inhoudelijk groot.

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
relatietype <-4
```

  - Misvatting: **Waarschijnlijke redenering:** Een correlatiepatroon bewijst geen perfect causaal verband.

- Ongeldige of ontbrekende invoer:

```r
relatietype <-
```

  - Misvatting: geen eindig getal ingevuld; de evaluator geeft de aparte route **Waarom dit niet klopt**, **Denkregel** en **Volgende stap**.

### Oef - 10.3 Partiële correlatie - Suppressoreffect herkennen

Bronmap: `Hoofdstuk_10_De partiële correlatie als introductie tot de multivariate statistiek/Oef - 10.3`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Vul het antwoord in na <-.
relatietype <- 3
```

#### Foute testinvoer en misvattingen

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
relatietype <-1
```

  - Misvatting: **Waarschijnlijke redenering:** Een schijnverband zou na controle juist sterk afnemen.

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
relatietype <-2
```

  - Misvatting: **Waarschijnlijke redenering:** De grote verandering laat zien dat Z wel degelijk een belangrijke rol speelt.

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
relatietype <-4
```

  - Misvatting: **Waarschijnlijke redenering:** Het gecontroleerde verband wordt sterker in plaats van te verdwijnen.

- Ongeldige of ontbrekende invoer:

```r
relatietype <-
```

  - Misvatting: geen eindig getal ingevuld; de evaluator geeft de aparte route **Waarom dit niet klopt**, **Denkregel** en **Volgende stap**.

### Oef - 10.4 Partiële correlatie - Nauwelijks verandering

Bronmap: `Hoofdstuk_10_De partiële correlatie als introductie tot de multivariate statistiek/Oef - 10.4`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Vul het antwoord in na <-.
conclusie <- 3
```

#### Foute testinvoer en misvattingen

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
conclusie <-1
```

  - Misvatting: **Waarschijnlijke redenering:** Het verband blijft bijna even sterk en verdwijnt dus niet.

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
conclusie <-2
```

  - Misvatting: **Waarschijnlijke redenering:** Suppressie zou een duidelijke versterking veroorzaken.

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
conclusie <-4
```

  - Misvatting: **Waarschijnlijke redenering:** Beide correlaties liggen duidelijk boven nul.

- Ongeldige of ontbrekende invoer:

```r
conclusie <-
```

  - Misvatting: geen eindig getal ingevuld; de evaluator geeft de aparte route **Waarom dit niet klopt**, **Denkregel** en **Volgende stap**.

### Oef - 10.5 Multivariate statistiek - Unieke bijdrage

Bronmap: `Hoofdstuk_10_De partiële correlatie als introductie tot de multivariate statistiek/Oef - 10.5`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Vul het antwoord in na <-.
antwoord <- 2
```

#### Foute testinvoer en misvattingen

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
antwoord <-1
```

  - Misvatting: **Waarschijnlijke redenering:** Controlevariabelen maken correlaties niet automatisch nul.

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
antwoord <-3
```

  - Misvatting: **Waarschijnlijke redenering:** Ook multivariate modellen worden met steekproefgegevens geschat.

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
antwoord <-4
```

  - Misvatting: **Waarschijnlijke redenering:** Statistische controle alleen bewijst geen causaliteit.

- Ongeldige of ontbrekende invoer:

```r
antwoord <-
```

  - Misvatting: geen eindig getal ingevuld; de evaluator geeft de aparte route **Waarom dit niet klopt**, **Denkregel** en **Volgende stap**.
