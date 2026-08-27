# Antwoordbank — Hoofdstuk 5

> Alleen voor docenten en technische validatie. De correcte inzendingen zijn rechtstreeks afgeleid van de canonieke `evaluation/Answer.R`-bestanden en door die evaluatoren gevalideerd.

## Gebruik

- **Correcte inzending** is een volledig ingevulde versie van de boilerplate, of het juiste optienummer bij een keuzeoefening.
- Een **Foute testinvoer** vervangt alleen de getoonde regel of keuze.
- De uitleg bij foute invoer beschrijft de bijbehorende misvatting en feedbackroute.

### Oef - 5.1 Standaardnormale verdeling - Eén z-score

Bronmap: `Hoofdstuk_5_De standaardnormale verdeling en diens eigenschappen/Oef - 5.1`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Vul het antwoord in na <-.
z_score <- 2
```

#### Foute testinvoer en misvattingen

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
z_score <-12
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt alleen de afstand tot het gemiddelde berekend.

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
z_score <-22
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt gedeeld of afgetrokken in de verkeerde volgorde.

- Ongeldige of ontbrekende invoer:

```r
z_score <-
```

  - Misvatting: geen eindig getal ingevuld; de evaluator geeft de aparte route **Waarom dit niet klopt**, **Denkregel** en **Volgende stap**.

### Oef - 5.2 Selectiekans - Complementregel

Bronmap: `Hoofdstuk_5_De standaardnormale verdeling en diens eigenschappen/Oef - 5.2`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Vul het antwoord in na <-.
kans_boven_grens <- 0.16
```

#### Foute testinvoer en misvattingen

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
kans_boven_grens <-0.84
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt de gegeven ondergrenskans overgenomen in plaats van het complement.

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
kans_boven_grens <-1.84
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt de kans bij 1 opgeteld in plaats van ervan afgetrokken.

- Ongeldige of ontbrekende invoer:

```r
kans_boven_grens <-
```

  - Misvatting: geen eindig getal ingevuld; de evaluator geeft de aparte route **Waarom dit niet klopt**, **Denkregel** en **Volgende stap**.

### Oef - 5.3: Anesthesie Risico Analyse

Bronmap: `Hoofdstuk_5_De standaardnormale verdeling en diens eigenschappen/Oef - 5.3`

#### Correcte inzending

Selecteer deze optie:

```r
2
```

#### Foute testinvoer en misvattingen

- Foute testinvoer: `1`
  - Misvatting: ❌ Fout. **Waarschijnlijke redenering:** 0.3% past mogelijk bij een andere Z-tabelwaarde of een reken-/afrondingsfout, maar deze antwoordwaarde toont niet eenduidig welke stap is misgelopen.
- Foute testinvoer: `3`
  - Misvatting: ❌ Fout. **Waarschijnlijke redenering:** 1.4% is onder meer verenigbaar met het gebruik van een te hoog effectiviteitspercentiel, bijvoorbeeld ongeveer 95% in plaats van 92%, of met een afwijkende tabelaflezing. De antwoordwaarde alleen bewijst de gevolgde route niet.
- Foute testinvoer: `4`
  - Misvatting: ❌ Fout. **Waarschijnlijke redenering:** 2.8% past niet eenduidig bij de vereiste eenzijdige berekening; mogelijk zijn de verkeerde staart, verdeling of Z-tabelwaarde gebruikt.
- Foute testinvoer: `5`
  - Misvatting: **Controleer je invoer:** je invoer lijkt niet overeen te komen met één van de aangeboden optienummers; dit kan een typefout of een andere invoerinterpretatie zijn.

### Oef - 5.4: Kwaliteitscontrole Trappistenbier

Bronmap: `Hoofdstuk_5_De standaardnormale verdeling en diens eigenschappen/Oef - 5.4`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Gegeven: μ = 33, σ = 2

# INSTRUCTIE: Bereken handmatig alle stappen met de formules uit de beschrijving
# Gebruik de standaardnormale tabel om de waarschijnlijkheden op te zoeken
# LET OP: Geef percentages als getallen ZONDER %-teken!
# Rond beide eindpercentages af op 2 decimalen.

# a. Kans dat inhoud tussen 32cl en 34cl ligt
# Bereken handmatig alle stappen en voer alleen het eindpercentage in
vraag_a <- 38.3 # Eindantwoord als percentage

# b. Kans dat inhoud hoger dan 35cl is
# Bereken handmatig alle stappen en voer alleen het eindpercentage in
vraag_b <- 15.87 # Eindantwoord als percentage
```

#### Foute testinvoer en misvattingen

- Foute testinvoer: `vraag_a <- 15.87`
  - Misvatting: **Waarschijnlijke redenering:** het afwijkende getal kan passen bij het complement van het gevraagde gebied, één ontbrekende intervalgrens, een verkeerde z-score, delen of verdubbelen door symmetrie, een schaalfactor 100 of vroege afronding. Dit zijn mogelijke signatures, geen zekere reconstructie.

### Oef - 5.5: Gevangenispopulatie - Oudste 10% bevragen

Bronmap: `Hoofdstuk_5_De standaardnormale verdeling en diens eigenschappen/Oef - 5.5`

#### Correcte inzending

Selecteer deze optie:

```r
4
```

#### Foute testinvoer en misvattingen

- Foute testinvoer: `1`
  - Misvatting: ❌ Fout. **Waarschijnlijke redenering:** je hebt mogelijk een percentielgrens gekozen die niet overeenkomt met de gevraagde bovenstaart.
- Foute testinvoer: `2`
  - Misvatting: ❌ Fout. **Waarschijnlijke redenering:** je hebt mogelijk een grens voor een kleinere bovenstaart gekozen.
- Foute testinvoer: `3`
  - Misvatting: ❌ Fout. **Waarschijnlijke redenering:** je hebt mogelijk automatisch een grens van ongeveer twee standaardafwijkingen boven het gemiddelde gebruikt.
- Foute testinvoer: `5`
  - Misvatting: ❌ Fout. **Waarschijnlijke redenering:** je dacht mogelijk dat individuele leeftijden of de populatieomvang nodig zijn.
- Foute testinvoer: `6`
  - Misvatting: **Controleer je invoer:** je invoer lijkt niet overeen te komen met één van de aangeboden optienummers; dit kan een typefout of een andere invoerinterpretatie zijn.

## Hoofdstuk 6
