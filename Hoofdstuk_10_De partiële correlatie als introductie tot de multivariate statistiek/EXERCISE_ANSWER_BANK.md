# Antwoordbank — Hoofdstuk 10

> Alleen voor docenten en technische validatie. Elke correcte inzending is een volledig ingevulde kopie van de bijbehorende boilerplate.

## Gebruik

- **Correcte inzending** kan rechtstreeks in Dodona worden gekopieerd.
- Een **Foute testinvoer** wijzigt precies één antwoord; alle andere antwoorden blijven correct.
- De uitleg na elke foute invoer benoemt de waarschijnlijke misvatting.

### Oef - 10.1 Partiële correlatie - Bouwstenen

Bronmap: `Hoofdstuk_10_De partiële correlatie als introductie tot de multivariate statistiek/Oef - 10.1.1 Gemiddelden voor partiële correlatie`

#### Correcte inzending

Kopieerbare, volledig ingevulde boilerplate:

```r
# Vul elk antwoord in na <-.
gemiddelde_x <- 2.5
scp_xy <- -4
variantie_x <- 6
r_xy <- 0.5
r_xy_z <- 0.504
```

#### Foute testinvoer en misvattingen

- Foute testinvoer voor `gemiddelde_x`:

```r
# Vul elk antwoord in na <-.
gemiddelde_x <- 10
scp_xy <- -4
variantie_x <- 6
r_xy <- 0.5
r_xy_z <- 0.504
```

  - **Misvatting:** de som is ingevuld zonder door het aantal waarnemingen te delen; het gemiddelde is (1 + 2 + 3 + 4) / 4 = 2.5.

- Foute testinvoer voor `scp_xy`:

```r
# Vul elk antwoord in na <-.
gemiddelde_x <- 2.5
scp_xy <- 4
variantie_x <- 6
r_xy <- 0.5
r_xy_z <- 0.504
```

  - **Misvatting:** de negatieve tekens van de gepaarde afwijkingsproducten zijn verloren; de kruisproductsom is -4.

- Foute testinvoer voor `variantie_x`:

```r
# Vul elk antwoord in na <-.
gemiddelde_x <- 2.5
scp_xy <- -4
variantie_x <- 4.5
r_xy <- 0.5
r_xy_z <- 0.504
```

  - **Misvatting:** er is door n gedeeld in plaats van door n - 1; de steekproefvariantie is 18 / 3 = 6.

- Foute testinvoer voor `r_xy`:

```r
# Vul elk antwoord in na <-.
gemiddelde_x <- 2.5
scp_xy <- -4
variantie_x <- 6
r_xy <- 3
r_xy_z <- 0.504
```

  - **Misvatting:** de covariantie is overgenomen zonder te standaardiseren; 3 / (2 × 3) = 0.5.

- Foute testinvoer voor `r_xy_z`:

```r
# Vul elk antwoord in na <-.
gemiddelde_x <- 2.5
scp_xy <- -4
variantie_x <- 6
r_xy <- 0.5
r_xy_z <- 0.6
```

  - **Misvatting:** de bivariate correlatie is overgenomen zonder voor Z te controleren; de partiële correlatie is ongeveer 0.504.

### Oef - 10.2 Partiële correlatie - Schijnverband herkennen

Bronmap: `Hoofdstuk_10_De partiële correlatie als introductie tot de multivariate statistiek/Oef - 10.2`

#### Correcte inzending

Kopieerbare, volledig ingevulde boilerplate:

```r
# Vul het antwoord in na <-.
relatietype <- 1
```

#### Foute testinvoer en misvattingen

- Foute testinvoer voor `relatietype`:

```r
# Vul het antwoord in na <-.
relatietype <- 2
```

  - **Misvatting:** dit is als suppressie gelezen. Bij suppressie wordt het verband na controle juist sterker; de sterke afname van 0.60 naar 0.10 past bij een schijnverband.

### Oef - 10.3 Partiële correlatie - Suppressoreffect herkennen

Bronmap: `Hoofdstuk_10_De partiële correlatie als introductie tot de multivariate statistiek/Oef - 10.3`

#### Correcte inzending

Kopieerbare, volledig ingevulde boilerplate:

```r
# Vul het antwoord in na <-.
relatietype <- 3
```

#### Foute testinvoer en misvattingen

- Foute testinvoer voor `relatietype`:

```r
# Vul het antwoord in na <-.
relatietype <- 1
```

  - **Misvatting:** dit is als schijnverband gelezen. Een schijnverband neemt na controle sterk af; hier wordt het gecontroleerde verband juist duidelijk sterker.

### Oef - 10.4 Partiële correlatie - Nauwelijks verandering

Bronmap: `Hoofdstuk_10_De partiële correlatie als introductie tot de multivariate statistiek/Oef - 10.4`

#### Correcte inzending

Kopieerbare, volledig ingevulde boilerplate:

```r
# Vul het antwoord in na <-.
conclusie <- 3
```

#### Foute testinvoer en misvattingen

- Foute testinvoer voor `conclusie`:

```r
# Vul het antwoord in na <-.
conclusie <- 1
```

  - **Misvatting:** een klein verschil is als het verdwijnen van het verband gelezen. De correlaties 0.50 en 0.48 zijn vrijwel gelijk; Z verandert het verband nauwelijks.

### Oef - 10.5 Multivariate statistiek - Unieke bijdrage

Bronmap: `Hoofdstuk_10_De partiële correlatie als introductie tot de multivariate statistiek/Oef - 10.5`

#### Correcte inzending

Kopieerbare, volledig ingevulde boilerplate:

```r
# Vul het antwoord in na <-.
antwoord <- 2
```

#### Foute testinvoer en misvattingen

- Foute testinvoer voor `antwoord`:

```r
# Vul het antwoord in na <-.
antwoord <- 4
```

  - **Misvatting:** statistische controle is gelijkgesteld aan causaal bewijs. Een multivariaat model schat unieke bijdragen bij constante andere predictors, maar bewijst daarmee geen causaliteit.
