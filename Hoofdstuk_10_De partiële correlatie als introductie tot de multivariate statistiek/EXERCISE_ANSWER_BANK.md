# Antwoordbank — Hoofdstuk 10

> Alleen voor docenten en technische validatie. De correcte inzendingen zijn rechtstreeks afgeleid van de canonieke `evaluation/Answer.R`-bestanden en door die evaluatoren gevalideerd.

## Gebruik

- **Correcte inzending** is een volledig ingevulde versie van de boilerplate, of het juiste optienummer bij een keuzeoefening.
- Een **Foute testinvoer** wijzigt steeds precies één antwoord terwijl de andere antwoorden correct blijven.
- De uitleg na elke foute invoer benoemt de bijbehorende misvatting en gerichte feedbackroute.

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

- Foute testinvoer voor `gemiddelde_x` (alle andere velden blijven correct):

```r
# Vul elk antwoord in na <-.
gemiddelde_x <- 3.5
scp_xy <- -4
variantie_x <- 6
r_xy <- 0.5
r_xy_z <- 0.504
```

  - **Waarschijnlijke redenering:** Je hebt waarschijnlijk de som of het aantal waarnemingen ingevuld in plaats van het gemiddelde. **Waarom dit niet klopt:** (1 + 2 + 3 + 4) / 4 = 2.5.

- Foute testinvoer voor `scp_xy` (alle andere velden blijven correct):

```r
# Vul elk antwoord in na <-.
gemiddelde_x <- 2.5
scp_xy <- 4
variantie_x <- 6
r_xy <- 0.5
r_xy_z <- 0.504
```

  - **Waarschijnlijke redenering:** Je hebt waarschijnlijk de producten zonder hun negatieve teken verwerkt of de afwijkingen opgeteld. **Waarom dit niet klopt:** (−1)(2) + 0(0) + 1(−2) = −4.

- Foute testinvoer voor `variantie_x` (alle andere velden blijven correct):

```r
# Vul elk antwoord in na <-.
gemiddelde_x <- 2.5
scp_xy <- -4
variantie_x <- 1
r_xy <- 0.5
r_xy_z <- 0.504
```

  - **Waarschijnlijke redenering:** Je hebt waarschijnlijk door n gedeeld in plaats van door n − 1. **Waarom dit niet klopt:** Een steekproefvariantie gebruikt 18 / (4 − 1) = 6.

- Foute testinvoer voor `r_xy` (alle andere velden blijven correct):

```r
# Vul elk antwoord in na <-.
gemiddelde_x <- 2.5
scp_xy <- -4
variantie_x <- 6
r_xy <- 50
r_xy_z <- 0.504
```

  - **Waarschijnlijke redenering:** Je hebt de covariantie waarschijnlijk niet door het product van beide standaarddeviaties gedeeld. **Waarom dit niet klopt:** r_XY = 3 / (2 × 3) = 0.5.

- Foute testinvoer voor `r_xy_z` (alle andere velden blijven correct):

```r
# Vul elk antwoord in na <-.
gemiddelde_x <- 2.5
scp_xy <- -4
variantie_x <- 6
r_xy <- 0.5
r_xy_z <- 50.4
```

  - **Waarschijnlijke redenering:** Je hebt waarschijnlijk alleen de teller berekend of één wortelterm uit de noemer weggelaten. **Waarom dit niet klopt:** De standaardformule geeft (0.60 − 0.50 × 0.40) / √[(1 − 0.50²)(1 − 0.40²)] = 0.5040.

### Oef - 10.2 Partiële correlatie - Relatiepatronen interpreteren

Bronmap: `Hoofdstuk_10_De partiële correlatie als introductie tot de multivariate statistiek/Oef - 10.2`

#### Correcte inzending

Kopieerbare, volledig ingevulde boilerplate:

```r
# Vul voor elk scenario de juiste antwoordcode in na <-.
afname_na_controle <- 1
suppressoreffect <- 3
nauwelijks_verandering <- 3
unieke_bijdrage <- 2
```

#### Foute testinvoer en misvattingen

- Foute testinvoer voor `afname_na_controle` (alle andere velden blijven correct):

```r
# Vul voor elk scenario de juiste antwoordcode in na <-.
afname_na_controle <- 2
suppressoreffect <- 3
nauwelijks_verandering <- 3
unieke_bijdrage <- 2
```

  - **Waarschijnlijke redenering:** Je hebt een sterke afname mogelijk als suppressie of als bewijs van causaliteit geïnterpreteerd. **Waarom dit niet klopt:** De daling van 0.60 naar 0.10 wijst erop dat Z een groot deel van het oorspronkelijke gedeelde verband verklaart.

- Foute testinvoer voor `suppressoreffect` (alle andere velden blijven correct):

```r
# Vul voor elk scenario de juiste antwoordcode in na <-.
afname_na_controle <- 1
suppressoreffect <- 1
nauwelijks_verandering <- 3
unieke_bijdrage <- 2
```

  - **Waarschijnlijke redenering:** Je hebt de sterke toename na controle mogelijk als het verdwijnen van een verband gelezen. **Waarom dit niet klopt:** De correlatie wordt na controle veel sterker; dat is het kenmerk van suppressie.

- Foute testinvoer voor `nauwelijks_verandering` (alle andere velden blijven correct):

```r
# Vul voor elk scenario de juiste antwoordcode in na <-.
afname_na_controle <- 1
suppressoreffect <- 3
nauwelijks_verandering <- 1
unieke_bijdrage <- 2
```

  - **Waarschijnlijke redenering:** Je hebt een verschil van slechts 0.02 mogelijk als een grote inhoudelijke verandering beschouwd. **Waarom dit niet klopt:** 0.50 en 0.48 zijn vrijwel gelijk, zodat Z het verband nauwelijks verandert.

- Foute testinvoer voor `unieke_bijdrage` (alle andere velden blijven correct):

```r
# Vul voor elk scenario de juiste antwoordcode in na <-.
afname_na_controle <- 1
suppressoreffect <- 3
nauwelijks_verandering <- 3
unieke_bijdrage <- 1
```

  - **Waarschijnlijke redenering:** Je hebt gezamenlijk modelleren mogelijk gelijkgesteld aan automatisch causaal bewijs. **Waarom dit niet klopt:** Meerdere predictors maken het mogelijk hun partiële, unieke bijdragen te schatten; causaliteit volgt daar niet automatisch uit.
