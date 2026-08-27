# Antwoordbank — Hoofdstuk 7

> Alleen voor docenten en technische validatie. De correcte inzendingen zijn rechtstreeks afgeleid van de canonieke `evaluation/Answer.R`-bestanden en door die evaluatoren gevalideerd.

## Gebruik

- **Correcte inzending** is een volledig ingevulde versie van de boilerplate, of het juiste optienummer bij een keuzeoefening.
- Een **Foute testinvoer** vervangt alleen de getoonde regel of keuze.
- De uitleg bij foute invoer beschrijft de bijbehorende misvatting en feedbackroute.

### Oef - 7.1.1 Geslacht en crimineel gedrag - Conditioneel percentage

Bronmap: `Hoofdstuk_7_Bivariate associatiematen voor nominale en ordinale variabelen/Oef - 7.1.1 Percentages - Geslacht en crimineel gedrag`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Vul het antwoord in na <-.
percentage_crimineel_mannen <-25
```

#### Foute testinvoer en misvattingen

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
percentage_crimineel_mannen <-30
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt de celfrequentie ingevuld in plaats van een percentage.

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
percentage_crimineel_mannen <-0.25
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt de proportie ingevuld zonder naar procenten om te zetten.

- Ongeldige of ontbrekende invoer:

```r
percentage_crimineel_mannen <-
```

  - Misvatting: geen eindig getal ingevuld; de evaluator geeft de aparte route **Waarom dit niet klopt**, **Denkregel** en **Volgende stap**.

### Oef - 7.1.2 Geslacht en crimineel gedrag - Oddsratio

Bronmap: `Hoofdstuk_7_Bivariate associatiematen voor nominale en ordinale variabelen/Oef - 7.1.2 Odds, chi-kwadraat en kansinterpretatie`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Vul de antwoorden in na <-.
oddsratio <-2
interpretatie <-1
```

#### Foute testinvoer en misvattingen

- Foute testinvoer:

```r
# Vul de antwoorden in na <-.
oddsratio <-0.5
interpretatie <-1
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt de verhouding omgekeerd en B door A gedeeld.

- Foute testinvoer:

```r
# Vul de antwoorden in na <-.
oddsratio <-2
interpretatie <-2
```

  - Misvatting: **Waarschijnlijke redenering:** Je verwart een verhouding van odds met een verhouding van kansen.

- Foute testinvoer:

```r
# Vul de antwoorden in na <-.
oddsratio <-2
interpretatie <-3
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt de richting van de vergelijking omgekeerd.

- Ongeldige of ontbrekende invoer:

```r
oddsratio <-
```

  - Misvatting: geen eindig getal ingevuld; de evaluator geeft de aparte route **Waarom dit niet klopt**, **Denkregel** en **Volgende stap**.

### Oef - 7.2 Vuurwapenbezit en geslacht - Chi-kwadraatbeslissing

Bronmap: `Hoofdstuk_7_Bivariate associatiematen voor nominale en ordinale variabelen/Oef - 7.2`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Vul het antwoord in na <-.
conclusie <-1
```

#### Foute testinvoer en misvattingen

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
conclusie <-2
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt de richting van de p-waardevergelijking omgekeerd.

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
conclusie <-3
```

  - Misvatting: **Waarschijnlijke redenering:** Je trekt een causale conclusie uit een associatietoets.

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
conclusie <-4
```

  - Misvatting: **Waarschijnlijke redenering:** Samenhang betekent niet dat twee variabelen identiek zijn.

- Ongeldige of ontbrekende invoer:

```r
conclusie <-
```

  - Misvatting: geen eindig getal ingevuld; de evaluator geeft de aparte route **Waarom dit niet klopt**, **Denkregel** en **Volgende stap**.

### Oef - 7.3 Spearman's rho

Bronmap: `Hoofdstuk_7_Bivariate associatiematen voor nominale en ordinale variabelen/Oef - 7.3`

#### Correcte inzending

Selecteer deze optie:

```r
4
```

#### Foute testinvoer en misvattingen

- Foute testinvoer: `1`
  - Misvatting: ❌ Dit is niet de foute uitspraak. **Waarschijnlijke redenering:** je hebt mogelijk gedacht dat een rangcorrelatie buiten de gebruikelijke correlatiegrenzen kan vallen. Spearman's rho is echter begrensd tussen −1 en +1.
- Foute testinvoer: `2`
  - Misvatting: ❌ Dit is niet de foute uitspraak. **Waarschijnlijke redenering:** je hebt mogelijk ‘monotoon’ verward met ‘perfect lineair’. Spearman's rho beoordeelt juist of rangen systematisch in dezelfde of tegengestelde richting bewegen.
- Foute testinvoer: `3`
  - Misvatting: ❌ Dit is niet de foute uitspraak. **Waarschijnlijke redenering:** je hebt mogelijk aangenomen dat ‘samenhang’ alleen betekent dat beide variabelen samen stijgen. Een consistente tegengestelde rangorde levert echter een negatieve rho op.
- Foute testinvoer: `5`
  - Misvatting: **Controleer je invoer:** je invoer lijkt niet overeen te komen met één van de aangeboden optienummers; dit kan een typefout of een andere invoerinterpretatie zijn.

### Oef - 7.4 Gamma

Bronmap: `Hoofdstuk_7_Bivariate associatiematen voor nominale en ordinale variabelen/Oef - 7.4`

#### Correcte inzending

Selecteer deze optie:

```r
1
```

#### Foute testinvoer en misvattingen

- Foute testinvoer: `2`
  - Misvatting: ❌ Dit is niet de foute uitspraak. **Waarschijnlijke redenering:** je hebt mogelijk gedacht dat Gamma alleen de sterkte en niet de richting weergeeft. De verhouding tussen concordante en discordante paren bepaalt ook het teken.
- Foute testinvoer: `3`
  - Misvatting: ❌ Dit is niet de foute uitspraak. **Waarschijnlijke redenering:** je hebt mogelijk het negeren van ties geïnterpreteerd als een mogelijkheid om buiten de correlatiegrenzen te vallen. Dat verandert het bereik niet.
- Foute testinvoer: `4`
  - Misvatting: ❌ Dit is niet de foute uitspraak. **Waarschijnlijke redenering:** je hebt mogelijk Gamma verward met een ordinale maat die ties expliciet in de noemer corrigeert. In de klassieke Gamma-berekening worden gebonden paren niet als concordant of discordant meegeteld.
- Foute testinvoer: `5`
  - Misvatting: **Controleer je invoer:** je invoer lijkt niet overeen te komen met één van de aangeboden optienummers; dit kan een typefout of een andere invoerinterpretatie zijn.

### Oef - 7.5 Kendall's tau

Bronmap: `Hoofdstuk_7_Bivariate associatiematen voor nominale en ordinale variabelen/Oef - 7.5`

#### Correcte inzending

Selecteer deze optie:

```r
2
```

#### Foute testinvoer en misvattingen

- Foute testinvoer: `1`
  - Misvatting: ❌ Dit is niet de foute uitspraak. **Waarschijnlijke redenering:** je hebt mogelijk gedacht dat het aantal rangparen het bereik van tau vergroot. Normalisatie houdt Kendall's tau echter binnen −1 en +1.
- Foute testinvoer: `3`
  - Misvatting: ❌ Dit is niet de foute uitspraak. **Waarschijnlijke redenering:** je hebt mogelijk Kendall's tau verward met een maat die rechtstreeks met ruwe waarden rekent. Tau vergelijkt juist rangparen als concordant of discordant.
- Foute testinvoer: `4`
  - Misvatting: ❌ Dit is niet de foute uitspraak. **Waarschijnlijke redenering:** je hebt mogelijk ‘overeenkomst’ opgevat als uitsluitend perfecte gelijkheid. Kendall's tau kwantificeert juist de mate waarin twee rangorden overeenkomen.
- Foute testinvoer: `5`
  - Misvatting: **Controleer je invoer:** je invoer lijkt niet overeen te komen met één van de aangeboden optienummers; dit kan een typefout of een andere invoerinterpretatie zijn.

### Oef - 7.6 Spearman's rho (II)

Bronmap: `Hoofdstuk_7_Bivariate associatiematen voor nominale en ordinale variabelen/Oef - 7.6`

#### Correcte inzending

Selecteer deze optie:

```r
3
```

#### Foute testinvoer en misvattingen

- Foute testinvoer: `1`
  - Misvatting: ❌ Dit is niet de foute uitspraak. **Waarschijnlijke redenering:** je hebt mogelijk ordinale data verward met nominale categorieën zonder rangorde. Spearman's rho gebruikt juist de ranginformatie in ordinale data.
- Foute testinvoer: `2`
  - Misvatting: ❌ Dit is niet de foute uitspraak. **Waarschijnlijke redenering:** je hebt mogelijk ‘niet-parametrisch’ geïnterpreteerd als ‘geen correlatiemaat’. Spearman's rho is wel een correlatiemaat, maar werkt met rangen en vereist geen lineair verband tussen ruwe waarden.
- Foute testinvoer: `4`
  - Misvatting: ❌ Dit is niet de foute uitspraak. **Waarschijnlijke redenering:** je hebt mogelijk gedacht dat een niet-monotoon patroon uitspraak 4 weerlegt. Rho = 0 sluit zo'n patroon echter niet uit; het zegt juist dat er geen monotone stijgende of dalende trend is.
- Foute testinvoer: `5`
  - Misvatting: **Controleer je invoer:** je invoer lijkt niet overeen te komen met één van de aangeboden optienummers; dit kan een typefout of een andere invoerinterpretatie zijn.

## Hoofdstuk 8
