# Antwoordbank — Hoofdstuk 7

> Alleen voor docenten en technische validatie. De correcte inzendingen zijn rechtstreeks afgeleid van de canonieke `evaluation/Answer.R`-bestanden en door die evaluatoren gevalideerd.

## Gebruik

- **Correcte inzending** is een volledig ingevulde versie van de boilerplate, of het juiste optienummer bij een keuzeoefening.
- Een **Foute testinvoer** vervangt alleen de getoonde regel of keuze.
- De uitleg bij foute invoer beschrijft de bijbehorende misvatting en feedbackroute.

### Oef - 7.1 Nominale samenhang analyseren

Bronmap: `Hoofdstuk_7_Bivariate associatiematen voor nominale en ordinale variabelen/Oef - 7.1.1 Percentages - Geslacht en crimineel gedrag`

#### Correcte inzending

Kopieerbare, volledig ingevulde boilerplate:

```r
# Vul de berekeningen en optienummers in.
percentage_crimineel_mannen <- 25
oddsratio <- 2
interpretatie <- 1
```

#### Foute testinvoer en misvattingen

- Foute testinvoer voor `percentage_crimineel_mannen` (alle andere velden blijven correct):

```r
# Vul de berekeningen en optienummers in.
percentage_crimineel_mannen <- 0.25
oddsratio <- 2
interpretatie <- 1
```

  - **Waarschijnlijke redenering:** je hebt de correcte proportie ingevuld, maar niet het gevraagde percentage. **Waarom dit niet klopt:** de vraag conditioneert op mannen en vraagt `30 / 120 × 100 = 25`.

- Foute testinvoer voor `oddsratio` (alle andere velden blijven correct):

```r
# Vul de berekeningen en optienummers in.
percentage_crimineel_mannen <- 25
oddsratio <- 0.5
interpretatie <- 1
```

  - **Waarschijnlijke redenering:** je hebt de verhouding omgekeerd en B/A berekend. **Waarom dit niet klopt:** de gevraagde richting is A/B, dus `0.50 / 0.25 = 2`.

- Foute testinvoer voor `interpretatie` (alle andere velden blijven correct):

```r
# Vul de berekeningen en optienummers in.
percentage_crimineel_mannen <- 25
oddsratio <- 2
interpretatie <- 2
```

  - **Waarschijnlijke redenering:** je hebt een verhouding van odds geïnterpreteerd als een exacte verhouding van kansen. **Waarom dit niet klopt:** OR = 2 zegt dat de odds in A tweemaal die in B zijn; de kansen hoeven niet exact te verdubbelen.

### Oef - 7.2 Vuurwapenbezit en geslacht

Bronmap: `Hoofdstuk_7_Bivariate associatiematen voor nominale en ordinale variabelen/Oef - 7.2`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Vul je eindantwoorden in na <-.
# Let op:
# - Je berekent alles met de hand (rekenmachine mag).
# - Vul in R enkel je eindresultaten in (geen R-berekeningen nodig).
# - Gebruik decimalen met punt (niet komma) en geen procentteken.
#
# Afronden:
# - Percentages: 2 decimalen
# - chi^2: 2 decimalen
# - phi: 2 decimalen

# 1) Relevante kolompercentages (geslacht is de onafhankelijke variabele = kolommen)
percentage_ja_bij_mannen <- 41.98
percentage_ja_bij_vrouwen <- 25.00

# 2) Relevante percentageverschil (in procentpunten)
percentageverschil_ja <- 16.98  # mannen% - vrouwen%

# 3) Chi-kwadraat (chi^2)
chi_kwadraat <- 60.18

# 4) Associatiemaat gebaseerd op chi^2 (meerkeuze)
# A=1: Phi
# B=2: Cramer's V
# C=3: Spearman rho
# D=4: Pearson r
associatiemaat_mc <- 1

# 5) Phi + interpretatie (meerkeuze)
phi <- 0.18
# Interpretatie:
# A=1: zwak
# B=2: matig
# C=3: sterk
interpretatie_phi_mc <- 1
```

#### Foute testinvoer en misvattingen

- `percentage_ja_bij_mannen <- 42` of `percentage_ja_bij_vrouwen <- 20.38`
  - Misvatting: verkeerde conditionele noemer of de twee kolommen verwisseld.
- `percentageverschil_ja <- -16.98`
  - Misvatting: het verschil in de omgekeerde richting berekend.
- `chi_kwadraat <- 0.18`
  - Misvatting: Phi ingevuld op de plaats van de chi-kwadraatwaarde.
- `associatiemaat_mc <- 3` of `4`
  - Misvatting: een correlatiemaat gekozen die niet de gevraagde op chi-kwadraat gebaseerde maat voor een 2×2-tabel is.
- `phi <- 60.18`
  - Misvatting: chi-kwadraat ingevuld zonder omzetting naar Phi.
- `interpretatie_phi_mc <- 2` of `3`
  - Misvatting: een Phi van ongeveer 0.18 te sterk geïnterpreteerd.

### Oef - 7.3 Spearman's rho

Bronmap: `Hoofdstuk_7_Bivariate associatiematen voor nominale en ordinale variabelen/Oef - 7.3`

#### Correcte inzending

Selecteer deze optie:

```r
# Type of answer below
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
# Type of answer below
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


