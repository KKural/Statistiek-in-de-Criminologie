# Antwoordbank — Hoofdstuk 7

> Alleen voor docenten en technische validatie. De correcte inzendingen zijn rechtstreeks afgeleid van de canonieke `evaluation/Answer.R`-bestanden en door die evaluatoren gevalideerd.

## Gebruik

- **Correcte inzending** is een volledig ingevulde versie van de boilerplate, of het juiste optienummer bij een keuzeoefening.
- Een **Foute testinvoer** wijzigt steeds precies één antwoord terwijl de andere antwoorden correct blijven.
- De uitleg na elke foute invoer benoemt de bijbehorende misvatting en gerichte feedbackroute.

### Oef - 7.1 Nominale samenhang analyseren

Bronmap: `Hoofdstuk_7_Bivariate associatiematen voor nominale en ordinale variabelen/Oef - 7.1.1 Percentages - Geslacht en crimineel gedrag`

#### Correcte inzending

Kopieerbare, volledig ingevulde boilerplate:

```r
# Vul de berekeningen en optienummers in.
percentage_crimineel_mannen <- 25
oddsratio <- 2
interpretatie <- 1
chi_kwadraat_conclusie <- 1
```

#### Foute testinvoer en misvattingen

- Foute testinvoer voor `percentage_crimineel_mannen` (alle andere velden blijven correct):

```r
# Vul de berekeningen en optienummers in.
percentage_crimineel_mannen <- 26
oddsratio <- 2
interpretatie <- 1
chi_kwadraat_conclusie <- 1
```

  - **Waarschijnlijke redenering:** je hebt waarschijnlijk het verkeerde totaal als conditionele noemer gebruikt. **Waarom dit niet klopt:** de vraag conditioneert op mannen: 30 / 120 × 100 = 25%.

- Foute testinvoer voor `oddsratio` (alle andere velden blijven correct):

```r
# Vul de berekeningen en optienummers in.
percentage_crimineel_mannen <- 25
oddsratio <- 1
interpretatie <- 1
chi_kwadraat_conclusie <- 1
```

  - **Waarschijnlijke redenering:** je hebt odds mogelijk als kansen behandeld. **Waarom dit niet klopt:** de gevraagde richting is A ten opzichte van B: 0.50 / 0.25 = 2.

- Foute testinvoer voor `interpretatie` (alle andere velden blijven correct):

```r
# Vul de berekeningen en optienummers in.
percentage_crimineel_mannen <- 25
oddsratio <- 2
interpretatie <- 2
chi_kwadraat_conclusie <- 1
```

  - **Waarschijnlijke redenering:** je hebt een verhouding van odds geïnterpreteerd als een exacte verhouding van kansen. **Waarom dit niet klopt:** OR = 2 zegt dat de odds in A tweemaal die in B zijn; dit betekent niet automatisch dat de kansen exact verdubbelen.

- Foute testinvoer voor `chi_kwadraat_conclusie` (alle andere velden blijven correct):

```r
# Vul de berekeningen en optienummers in.
percentage_crimineel_mannen <- 25
oddsratio <- 2
interpretatie <- 1
chi_kwadraat_conclusie <- 2
```

  - **Waarschijnlijke redenering:** je hebt p = 0.03 ten onrechte als groter dan α = 0.05 beoordeeld. **Waarom dit niet klopt:** omdat p < α verwerpen we onafhankelijkheid en concluderen we statistisch bewijs voor samenhang, niet causaliteit.

### Oef - 7.2 Ordinale associatiematen vergelijken

Bronmap: `Hoofdstuk_7_Bivariate associatiematen voor nominale en ordinale variabelen/Oef - 7.3`

#### Correcte inzending

Kopieerbare, volledig ingevulde boilerplate:

```r
# Vul voor elke vraag het nummer van de foute uitspraak in.
spearman_richting <- 4
gamma_bereik <- 1
kendall_bereik <- 2
spearman_nul <- 3
```

#### Foute testinvoer en misvattingen

- Foute testinvoer voor `spearman_richting` (alle andere velden blijven correct):

```r
# Vul voor elke vraag het nummer van de foute uitspraak in.
spearman_richting <- 1
gamma_bereik <- 1
kendall_bereik <- 2
spearman_nul <- 3
```

  - **Waarschijnlijke redenering:** je denkt dat rangcorrelaties buiten de gebruikelijke correlatiegrenzen kunnen vallen. **Waarom dit niet klopt:** een tegengestelde monotone rangorde levert een negatieve rho; de bewering dat rho niet negatief kan zijn is dus fout.

- Foute testinvoer voor `gamma_bereik` (alle andere velden blijven correct):

```r
# Vul voor elke vraag het nummer van de foute uitspraak in.
spearman_richting <- 4
gamma_bereik <- 2
kendall_bereik <- 2
spearman_nul <- 3
```

  - **Waarschijnlijke redenering:** je hebt een geldige eigenschap van Gamma als fout aangeduid. **Waarom dit niet klopt:** Gamma = (C - D)/(C + D) blijft tussen -1 en +1; ties maken een waarde boven 1 niet mogelijk.

- Foute testinvoer voor `kendall_bereik` (alle andere velden blijven correct):

```r
# Vul voor elke vraag het nummer van de foute uitspraak in.
spearman_richting <- 4
gamma_bereik <- 1
kendall_bereik <- 1
spearman_nul <- 3
```

  - **Waarschijnlijke redenering:** je hebt de geldige begrenzing van tau afgewezen. **Waarom dit niet klopt:** Kendall's tau is genormaliseerd en kan nooit 2 of -2 zijn; uitspraak 2 is fout.

- Foute testinvoer voor `spearman_nul` (alle andere velden blijven correct):

```r
# Vul voor elke vraag het nummer van de foute uitspraak in.
spearman_richting <- 4
gamma_bereik <- 1
kendall_bereik <- 2
spearman_nul <- 1
```

  - **Waarschijnlijke redenering:** je hebt een geldige eigenschap van Spearman's rho afgewezen. **Waarom dit niet klopt:** rho = 0 sluit een monotone trend uit, maar niet elk mogelijk niet-monotoon verband; uitspraak 3 is daarom fout.
