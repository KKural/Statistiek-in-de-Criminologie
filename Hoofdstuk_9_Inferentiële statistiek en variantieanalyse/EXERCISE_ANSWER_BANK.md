# Antwoordbank — Hoofdstuk 9

> Alleen voor docenten en technische validatie. De correcte inzendingen zijn rechtstreeks afgeleid van de canonieke `evaluation/Answer.R`-bestanden en door die evaluatoren gevalideerd.

## Gebruik

- **Correcte inzending** is een volledig ingevulde versie van de boilerplate, of het juiste optienummer bij een keuzeoefening.
- Een **Foute testinvoer** wijzigt steeds precies één antwoord terwijl de andere antwoorden correct blijven.
- De uitleg na elke foute invoer benoemt de bijbehorende misvatting en gerichte feedbackroute.

### Oef - 9.1 Chi-kwadraat - Eén verwachte frequentie

Bronmap: `Hoofdstuk_9_Inferentiële statistiek en variantieanalyse/Oef - 9.1`

#### Correcte inzending

Kopieerbare, volledig ingevulde boilerplate:

```r
# Vul het antwoord in na <-.
verwachte_frequentie <- 12
```

#### Foute testinvoer en misvattingen

- Foute testinvoer voor `verwachte_frequentie` (alle andere velden blijven correct):

```r
# Vul het antwoord in na <-.
verwachte_frequentie <- 13
```

  - **Waarschijnlijke redenering:** Je hebt een verwante grootheid of verkeerde antwoordoptie gekozen. **Waarom dit niet klopt:** Onder onafhankelijkheid is E = rijtotaal × kolomtotaal / N.

### Oef - 9.2 Betrouwbaarheidsinterval - Twee grenzen

Bronmap: `Hoofdstuk_9_Inferentiële statistiek en variantieanalyse/Oef - 9.2`

#### Correcte inzending

Kopieerbare, volledig ingevulde boilerplate:

```r
# Vul de antwoorden in na <-.
ondergrens <- 26.08
bovengrens <- 33.92
```

#### Foute testinvoer en misvattingen

- Foute testinvoer voor `ondergrens` (alle andere velden blijven correct):

```r
# Vul de antwoorden in na <-.
ondergrens <- 27.08
bovengrens <- 33.92
```

  - **Waarschijnlijke redenering:** Je hebt een verwante grootheid of verkeerde antwoordoptie gekozen. **Waarom dit niet klopt:** Een tweezijdig interval is schatting ± kritieke waarde × standaardfout.

- Foute testinvoer voor `bovengrens` (alle andere velden blijven correct):

```r
# Vul de antwoorden in na <-.
ondergrens <- 26.08
bovengrens <- 34.92
```

  - **Waarschijnlijke redenering:** Je hebt een verwante grootheid of verkeerde antwoordoptie gekozen. **Waarom dit niet klopt:** Een tweezijdig interval is schatting ± kritieke waarde × standaardfout.

### Oef - 9.3 Steekproefgrootte - Naar boven afronden

Bronmap: `Hoofdstuk_9_Inferentiële statistiek en variantieanalyse/Oef - 9.3`

#### Correcte inzending

Kopieerbare, volledig ingevulde boilerplate:

```r
# Vul het antwoord in na <-.
n_minimum <- 43
```

#### Foute testinvoer en misvattingen

- Foute testinvoer voor `n_minimum` (alle andere velden blijven correct):

```r
# Vul het antwoord in na <-.
n_minimum <- 44
```

  - **Waarschijnlijke redenering:** Je hebt een verwante grootheid of verkeerde antwoordoptie gekozen. **Waarom dit niet klopt:** Een minimale steekproefgrootte wordt altijd naar boven afgerond zodat de vereiste precisie behouden blijft.

### Oef - 9.4 Fietsdiefstallen - ANOVA van beschrijving tot beslissing

Bronmap: `Hoofdstuk_9_Inferentiële statistiek en variantieanalyse/Oef - 9.4.1 Groepsgemiddelden fietsdiefstallen`

#### Correcte inzending

Kopieerbare, volledig ingevulde boilerplate:

```r
# Vul elk antwoord in na <-.
groepsgemiddelde <- 4
ss_binnen <- 8
f_ratio <- 4
significant <- 1
relatie_f_p <- 3
```

#### Foute testinvoer en misvattingen

- Foute testinvoer voor `groepsgemiddelde` (alle andere velden blijven correct):

```r
# Vul elk antwoord in na <-.
groepsgemiddelde <- 1
ss_binnen <- 8
f_ratio <- 4
significant <- 1
relatie_f_p <- 3
```

  - **Waarschijnlijke redenering:** Je hebt waarschijnlijk de groepssom of groepsgrootte gebruikt in plaats van som gedeeld door drie. **Waarom dit niet klopt:** Het gemiddelde van 2, 4 en 6 is 12 / 3 = 4.

- Foute testinvoer voor `ss_binnen` (alle andere velden blijven correct):

```r
# Vul elk antwoord in na <-.
groepsgemiddelde <- 4
ss_binnen <- 9
f_ratio <- 4
significant <- 1
relatie_f_p <- 3
```

  - **Waarschijnlijke redenering:** Je hebt waarschijnlijk absolute afwijkingen opgeteld of niet ten opzichte van het groepsgemiddelde gewerkt. **Waarom dit niet klopt:** De gekwadrateerde afwijkingen zijn 4, 0 en 4 en tellen op tot 8.

- Foute testinvoer voor `f_ratio` (alle andere velden blijven correct):

```r
# Vul elk antwoord in na <-.
groepsgemiddelde <- 4
ss_binnen <- 8
f_ratio <- 1
significant <- 1
relatie_f_p <- 3
```

  - **Waarschijnlijke redenering:** Je hebt waarschijnlijk MS_binnen en MS_tussen omgewisseld. **Waarom dit niet klopt:** F gebruikt MS_tussen als teller en MS_binnen als noemer: 24 / 6 = 4.

- Foute testinvoer voor `significant` (alle andere velden blijven correct):

```r
# Vul elk antwoord in na <-.
groepsgemiddelde <- 4
ss_binnen <- 8
f_ratio <- 4
significant <- 2
relatie_f_p <- 3
```

  - **Waarschijnlijke redenering:** Je hebt F = 4 waarschijnlijk niet met de kritieke grens 3.2 vergeleken. **Waarom dit niet klopt:** Omdat 4 groter is dan 3.2, is de toets significant en hoort code 1 erbij.

- Foute testinvoer voor `relatie_f_p` (alle andere velden blijven correct):

```r
# Vul elk antwoord in na <-.
groepsgemiddelde <- 4
ss_binnen <- 8
f_ratio <- 4
significant <- 1
relatie_f_p <- 1
```

  - **Waarschijnlijke redenering:** Je hebt de richting tussen een toetsingsgrootheid en haar rechterstaartkans omgekeerd. **Waarom dit niet klopt:** Bij vaste vrijheidsgraden ligt een grotere F verder in de rechterstaart en hoort daar een kleinere p bij.
