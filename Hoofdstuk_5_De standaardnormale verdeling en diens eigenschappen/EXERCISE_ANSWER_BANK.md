# Antwoordbank — Hoofdstuk 5

> Alleen voor docenten en technische validatie. De correcte inzendingen zijn rechtstreeks afgeleid van de canonieke `evaluation/Answer.R`-bestanden en door die evaluatoren gevalideerd.

## Gebruik

- **Correcte inzending** is een volledig ingevulde versie van de boilerplate, of het juiste optienummer bij een keuzeoefening.
- Een **Foute testinvoer** wijzigt steeds precies één antwoord terwijl de andere antwoorden correct blijven.
- De uitleg na elke foute invoer benoemt de bijbehorende misvatting en gerichte feedbackroute.

### Oef - 5.1 Standaardiseren en staartkansen

Bronmap: `Hoofdstuk_5_De standaardnormale verdeling en diens eigenschappen/Oef - 5.1`

#### Correcte inzending

Kopieerbare, volledig ingevulde boilerplate:

```r
# Vul elk antwoord in na <-.
z_score <- 2
kans_boven_grens <- 0.16
anesthesie_risico <- 2
```

#### Foute testinvoer en misvattingen

- Foute testinvoer voor `z_score` (alle andere velden blijven correct):

```r
# Vul elk antwoord in na <-.
z_score <- 1
kans_boven_grens <- 0.16
anesthesie_risico <- 2
```

  - **Waarschijnlijke redenering:** je hebt de ruwe afstand en de afstand in standaardafwijkingen door elkaar gehaald. **Waarom dit niet klopt:** een z-score is geen ruwe afstand; 72 ligt 12 punten, dus 12 / 6 = 2 standaardafwijkingen boven het gemiddelde.

- Foute testinvoer voor `kans_boven_grens` (alle andere velden blijven correct):

```r
# Vul elk antwoord in na <-.
z_score <- 2
kans_boven_grens <- 16
anesthesie_risico <- 2
```

  - **Waarschijnlijke redenering:** je hebt de grens waarschijnlijk aan de verkeerde staart gekoppeld. **Waarom dit niet klopt:** P(X > grens) is het complement van P(X ≤ grens), dus 1 - 0.84 = 0.16.

- Foute testinvoer voor `anesthesie_risico` (alle andere velden blijven correct):

```r
# Vul elk antwoord in na <-.
z_score <- 2
kans_boven_grens <- 0.16
anesthesie_risico <- 1
```

  - **Waarschijnlijke redenering:** je hebt de dosisgrens niet consequent van de effectieve naar de letale verdeling overgebracht. **Waarom dit niet klopt:** de 92%-dosis is ongeveer 57.65 mg; in N(100,18) hoort daarbij z ≈ -2.36 en een linkerkans van ongeveer 0.9%, dus optie 2.

### Oef - 5.2 Toepassingen van de normale verdeling

Bronmap: `Hoofdstuk_5_De standaardnormale verdeling en diens eigenschappen/Oef - 5.4`

#### Correcte inzending

Kopieerbare, volledig ingevulde boilerplate:

```r
# Vul percentages zonder procentteken in.
bier_tussen_pct <- 38.3
bier_boven_pct <- 15.87
leeftijdsgrens_optie <- 4
```

#### Foute testinvoer en misvattingen

- Foute testinvoer voor `bier_tussen_pct` (alle andere velden blijven correct):

```r
# Vul percentages zonder procentteken in.
bier_tussen_pct <- 39.3
bier_boven_pct <- 15.87
leeftijdsgrens_optie <- 4
```

  - **Waarschijnlijke redenering:** je hebt waarschijnlijk één staart gebruikt in plaats van het verschil tussen beide cumulatieve kansen. **Waarom dit niet klopt:** tussen 32 en 34 liggen z = -0.5 en z = 0.5; Φ(0.5) - Φ(-0.5) = 0.3830 = 38.30%.

- Foute testinvoer voor `bier_boven_pct` (alle andere velden blijven correct):

```r
# Vul percentages zonder procentteken in.
bier_tussen_pct <- 38.3
bier_boven_pct <- 16.87
leeftijdsgrens_optie <- 4
```

  - **Waarschijnlijke redenering:** je hebt waarschijnlijk de verkeerde staart of schaal gebruikt. **Waarom dit niet klopt:** 35 cl geeft z = 1; P(Z > 1) = 1 - 0.8413 = 0.1587 = 15.87%.

- Foute testinvoer voor `leeftijdsgrens_optie` (alle andere velden blijven correct):

```r
# Vul percentages zonder procentteken in.
bier_tussen_pct <- 38.3
bier_boven_pct <- 15.87
leeftijdsgrens_optie <- 1
```

  - **Waarschijnlijke redenering:** je hebt een grens gekozen waar meer dan 10% boven ligt. **Waarom dit niet klopt:** de oudste 10% begint bij het 90e percentiel: 37.8 + 1.28 × 5.6 ≈ 45 jaar, optie 4.
