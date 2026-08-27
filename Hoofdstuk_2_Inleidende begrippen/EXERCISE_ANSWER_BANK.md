# Antwoordbank — Hoofdstuk 2

> Alleen voor docenten en technische validatie. De correcte inzendingen zijn rechtstreeks afgeleid van de canonieke `evaluation/Answer.R`-bestanden en door die evaluatoren gevalideerd.

## Gebruik

- **Correcte inzending** is een volledig ingevulde versie van de boilerplate, of het juiste optienummer bij een keuzeoefening.
- Een **Foute testinvoer** wijzigt steeds precies één antwoord terwijl de andere antwoorden correct blijven.
- De uitleg na elke foute invoer benoemt de bijbehorende misvatting en gerichte feedbackroute.

### Oef - 2.1 Meetniveaus classificeren

Bronmap: `Hoofdstuk_2_Inleidende begrippen/Oef - 2.1 Meetniveau - Delicten rangschikken`

#### Correcte inzending

Kopieerbare, volledig ingevulde boilerplate:

```r
# Kies per variabele 1 (nominaal), 2 (ordinaal), 3 (interval) of 4 (ratio).
meetniveau_ernst_delict <- 2
meetniveau_empathieschaal <- 2
meetniveau_nationaliteit <- 1
meetniveau_motivatieschaal <- 2
meetniveau_aantal_diefstallen <- 4
```

#### Foute testinvoer en misvattingen

- Foute testinvoer voor `meetniveau_ernst_delict` (alle andere velden blijven correct):

```r
# Kies per variabele 1 (nominaal), 2 (ordinaal), 3 (interval) of 4 (ratio).
meetniveau_ernst_delict <- 1
meetniveau_empathieschaal <- 2
meetniveau_nationaliteit <- 1
meetniveau_motivatieschaal <- 2
meetniveau_aantal_diefstallen <- 4
```

  - **Waarschijnlijke redenering:** Bij onderdeel 1 (ernst van delicten) koos je optie 1. **Waarom dit niet klopt:** De categorieën hebben een rangorde, maar de afstanden in ernst zijn niet meetbaar; dit is ordinaal.

- Foute testinvoer voor `meetniveau_empathieschaal` (alle andere velden blijven correct):

```r
# Kies per variabele 1 (nominaal), 2 (ordinaal), 3 (interval) of 4 (ratio).
meetniveau_ernst_delict <- 2
meetniveau_empathieschaal <- 1
meetniveau_nationaliteit <- 1
meetniveau_motivatieschaal <- 2
meetniveau_aantal_diefstallen <- 4
```

  - **Waarschijnlijke redenering:** Bij onderdeel 2 (empathieschaal) koos je optie 1. **Waarom dit niet klopt:** De antwoordcategorieën zijn geordend, maar gelijke betekenisafstanden zijn niet gegarandeerd; dit is ordinaal.

- Foute testinvoer voor `meetniveau_nationaliteit` (alle andere velden blijven correct):

```r
# Kies per variabele 1 (nominaal), 2 (ordinaal), 3 (interval) of 4 (ratio).
meetniveau_ernst_delict <- 2
meetniveau_empathieschaal <- 2
meetniveau_nationaliteit <- 2
meetniveau_motivatieschaal <- 2
meetniveau_aantal_diefstallen <- 4
```

  - **Waarschijnlijke redenering:** Bij onderdeel 3 (nationaliteit) koos je optie 2. **Waarom dit niet klopt:** Nationaliteiten zijn categorieën zonder natuurlijke rangorde; dit is nominaal.

- Foute testinvoer voor `meetniveau_motivatieschaal` (alle andere velden blijven correct):

```r
# Kies per variabele 1 (nominaal), 2 (ordinaal), 3 (interval) of 4 (ratio).
meetniveau_ernst_delict <- 2
meetniveau_empathieschaal <- 2
meetniveau_nationaliteit <- 1
meetniveau_motivatieschaal <- 1
meetniveau_aantal_diefstallen <- 4
```

  - **Waarschijnlijke redenering:** Bij onderdeel 4 (motivatieschaal) koos je optie 1. **Waarom dit niet klopt:** Cijfers op een beoordelingsschaal bewijzen geen gelijke afstanden; de geordende antwoorden zijn ordinaal.

- Foute testinvoer voor `meetniveau_aantal_diefstallen` (alle andere velden blijven correct):

```r
# Kies per variabele 1 (nominaal), 2 (ordinaal), 3 (interval) of 4 (ratio).
meetniveau_ernst_delict <- 2
meetniveau_empathieschaal <- 2
meetniveau_nationaliteit <- 1
meetniveau_motivatieschaal <- 2
meetniveau_aantal_diefstallen <- 1
```

  - **Waarschijnlijke redenering:** Bij onderdeel 5 (aantal diefstallen) koos je optie 1. **Waarom dit niet klopt:** Een telling heeft gelijke afstanden en een werkelijk nulpunt; dit is ratio.

### Oef - 2.2 Meetniveaus in een studentenonderzoek

Bronmap: `Hoofdstuk_2_Inleidende begrippen/Oef - 2.6 Variabeletype - Studentnummer classificatie`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Vul het juiste meetniveau in tussen de aanhalingstekens.
# Mogelijke antwoorden: "Nominaal", "Ordinaal", "Interval", "Ratio"

# Favoriete keuze voor online onderzoek (Google, Bibliotheek, Wikipedia, etc.)
favoriete_keuze <- "Nominaal"

# Leeftijd van studenten (17, 18, 19 jaar etc.)
leeftijd <- "Ratio"

# Geslacht (man/vrouw)
geslacht <- "Nominaal"

# Studierichting (verschillende richtingen)
studierichting <- "Nominaal"

# Studentnummer (1-552 voor identificatie)
studentnummer <- "Nominaal"
```

#### Foute testinvoer en misvattingen

- Foute testinvoer voor `favoriete_keuze` (alle andere velden blijven correct):

```r
# Vul het juiste meetniveau in tussen de aanhalingstekens.
# Mogelijke antwoorden: "Nominaal", "Ordinaal", "Interval", "Ratio"

# Favoriete keuze voor online onderzoek (Google, Bibliotheek, Wikipedia, etc.)
favoriete_keuze <- "Ordinaal"

# Leeftijd van studenten (17, 18, 19 jaar etc.)
leeftijd <- "Ratio"

# Geslacht (man/vrouw)
geslacht <- "Nominaal"

# Studierichting (verschillende richtingen)
studierichting <- "Nominaal"

# Studentnummer (1-552 voor identificatie)
studentnummer <- "Nominaal"
```

  - Misvatting: favoriete zoekbron is een categorie zonder natuurlijke rangorde en is daarom nominaal.

- Foute testinvoer voor `leeftijd` (alle andere velden blijven correct):

```r
# Vul het juiste meetniveau in tussen de aanhalingstekens.
# Mogelijke antwoorden: "Nominaal", "Ordinaal", "Interval", "Ratio"

# Favoriete keuze voor online onderzoek (Google, Bibliotheek, Wikipedia, etc.)
favoriete_keuze <- "Nominaal"

# Leeftijd van studenten (17, 18, 19 jaar etc.)
leeftijd <- "Interval"

# Geslacht (man/vrouw)
geslacht <- "Nominaal"

# Studierichting (verschillende richtingen)
studierichting <- "Nominaal"

# Studentnummer (1-552 voor identificatie)
studentnummer <- "Nominaal"
```

  - Misvatting: leeftijd heeft een werkelijk nulpunt en betekenisvolle verhoudingen en is daarom ratio.

- Foute testinvoer voor `geslacht` (alle andere velden blijven correct):

```r
# Vul het juiste meetniveau in tussen de aanhalingstekens.
# Mogelijke antwoorden: "Nominaal", "Ordinaal", "Interval", "Ratio"

# Favoriete keuze voor online onderzoek (Google, Bibliotheek, Wikipedia, etc.)
favoriete_keuze <- "Nominaal"

# Leeftijd van studenten (17, 18, 19 jaar etc.)
leeftijd <- "Ratio"

# Geslacht (man/vrouw)
geslacht <- "Ordinaal"

# Studierichting (verschillende richtingen)
studierichting <- "Nominaal"

# Studentnummer (1-552 voor identificatie)
studentnummer <- "Nominaal"
```

  - Misvatting: de categorieën hebben geen natuurlijke rangorde en zijn daarom nominaal.

- Foute testinvoer voor `studierichting` (alle andere velden blijven correct):

```r
# Vul het juiste meetniveau in tussen de aanhalingstekens.
# Mogelijke antwoorden: "Nominaal", "Ordinaal", "Interval", "Ratio"

# Favoriete keuze voor online onderzoek (Google, Bibliotheek, Wikipedia, etc.)
favoriete_keuze <- "Nominaal"

# Leeftijd van studenten (17, 18, 19 jaar etc.)
leeftijd <- "Ratio"

# Geslacht (man/vrouw)
geslacht <- "Nominaal"

# Studierichting (verschillende richtingen)
studierichting <- "Ordinaal"

# Studentnummer (1-552 voor identificatie)
studentnummer <- "Nominaal"
```

  - Misvatting: studierichtingen zijn labels zonder natuurlijke rangorde en zijn daarom nominaal.

- Foute testinvoer voor `studentnummer` (alle andere velden blijven correct):

```r
# Vul het juiste meetniveau in tussen de aanhalingstekens.
# Mogelijke antwoorden: "Nominaal", "Ordinaal", "Interval", "Ratio"

# Favoriete keuze voor online onderzoek (Google, Bibliotheek, Wikipedia, etc.)
favoriete_keuze <- "Nominaal"

# Leeftijd van studenten (17, 18, 19 jaar etc.)
leeftijd <- "Ratio"

# Geslacht (man/vrouw)
geslacht <- "Nominaal"

# Studierichting (verschillende richtingen)
studierichting <- "Nominaal"

# Studentnummer (1-552 voor identificatie)
studentnummer <- "Ratio"
```

  - Misvatting: een studentnummer is alleen een identificatielabel; rekenkundige bewerkingen hebben geen betekenis, dus het meetniveau is nominaal.

### Oef - 2.3 Meetniveaus classificeren - Pythonversie

Bronmap: `Hoofdstuk_2_Inleidende begrippen/Oef - 2.8.1 Meetniveau classificatie - Python versie`

#### Correcte inzending

Kopieerbare, volledig ingevulde boilerplate:

```python
# BELANGRIJK: Vul de juiste meetniveaus in!
# Mogelijke antwoorden: "Nominaal", "Ordinaal", "Interval", "Ratio"

# Variabele 1: Favoriete keuze uit meerkeuzevraag
favoriete_keuze = "Nominaal"

# Variabele 2: Leeftijd in jaren
leeftijd = "Ratio"

# Variabele 3: Geslacht (man/vrouw)
geslacht = "Nominaal"

# Variabele 4: Studierichting
studierichting = "Nominaal"

# Variabele 5: Studentnummer
studentnummer = "Nominaal"

# Print de antwoorden (NIET AANPASSEN!)
print(favoriete_keuze)
print(leeftijd)
print(geslacht)
print(studierichting)
print(studentnummer)
```

#### Foute testinvoer en misvattingen

- Foute testinvoer: `favoriete_keuze = "Ordinaal"`
  - Misvatting: de antwoordopties zijn categorieën zonder natuurlijke rangorde; deze variabele is nominaal.
- Foute testinvoer: `leeftijd = "Interval"`
  - Misvatting: leeftijd heeft een werkelijk nulpunt en verhoudingen zijn betekenisvol; deze variabele is ratio.
- Foute testinvoer: `geslacht = "Ordinaal"`
  - Misvatting: de categorieën hebben geen natuurlijke rangorde; deze variabele is nominaal.
- Foute testinvoer: `studierichting = "Ordinaal"`
  - Misvatting: studierichtingen zijn labels zonder natuurlijke rangorde; deze variabele is nominaal.
- Foute testinvoer: `studentnummer = "Ratio"`
  - Misvatting: een studentnummer is alleen een identificatielabel; rekenkundige verschillen en verhoudingen hebben geen betekenis, dus het meetniveau is nominaal.

### Oef - 2.4 Onafhankelijke en afhankelijke variabelen - Jongeren interventie

Bronmap: `Hoofdstuk_2_Inleidende begrippen/Oef - 2.7 Onafhankelijke en afhankelijke variabelen - Jongeren interventie`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Vul elk tekstantwoord in tussen de aanhalingstekens.

# a. Wat is hier de onafhankelijke variabele?
onafhankelijke_variabele <- "De interventie"

# b. Wat is het meetniveau van de onafhankelijke variabele? (nominaal, ordinaal, interval, ratio)
meetniveau_onafhankelijk_variabele <- "nominaal"

# c. Wat is hier de afhankelijke variabele?
afhankelijke_variabele <- "Het aantal meldingen van overlast"

# d. Wat is het meetniveau van de afhankelijke variabele? (nominaal, ordinaal, interval, ratio)
meetniveau_afhankelijk_variabele <- "ratio"
```

#### Foute testinvoer en misvattingen

- Foute testinvoer voor `onafhankelijke_variabele` (alle andere velden blijven correct):

```r
# Vul elk tekstantwoord in tussen de aanhalingstekens.

# a. Wat is hier de onafhankelijke variabele?
onafhankelijke_variabele <- "Het aantal meldingen van overlast"

# b. Wat is het meetniveau van de onafhankelijke variabele? (nominaal, ordinaal, interval, ratio)
meetniveau_onafhankelijk_variabele <- "nominaal"

# c. Wat is hier de afhankelijke variabele?
afhankelijke_variabele <- "Het aantal meldingen van overlast"

# d. Wat is het meetniveau van de afhankelijke variabele? (nominaal, ordinaal, interval, ratio)
meetniveau_afhankelijk_variabele <- "ratio"
```

  - Misvatting: oorzaak en uitkomst zijn verwisseld; de interventie of groepsindeling is de onafhankelijke variabele.

- Foute testinvoer voor `meetniveau_onafhankelijk_variabele` (alle andere velden blijven correct):

```r
# Vul elk tekstantwoord in tussen de aanhalingstekens.

# a. Wat is hier de onafhankelijke variabele?
onafhankelijke_variabele <- "De interventie"

# b. Wat is het meetniveau van de onafhankelijke variabele? (nominaal, ordinaal, interval, ratio)
meetniveau_onafhankelijk_variabele <- "ratio"

# c. Wat is hier de afhankelijke variabele?
afhankelijke_variabele <- "Het aantal meldingen van overlast"

# d. Wat is het meetniveau van de afhankelijke variabele? (nominaal, ordinaal, interval, ratio)
meetniveau_afhankelijk_variabele <- "ratio"
```

  - Misvatting: interventie versus controle zijn categorieën zonder rangorde; het meetniveau is nominaal.

- Foute testinvoer voor `afhankelijke_variabele` (alle andere velden blijven correct):

```r
# Vul elk tekstantwoord in tussen de aanhalingstekens.

# a. Wat is hier de onafhankelijke variabele?
onafhankelijke_variabele <- "De interventie"

# b. Wat is het meetniveau van de onafhankelijke variabele? (nominaal, ordinaal, interval, ratio)
meetniveau_onafhankelijk_variabele <- "nominaal"

# c. Wat is hier de afhankelijke variabele?
afhankelijke_variabele <- "De interventie"

# d. Wat is het meetniveau van de afhankelijke variabele? (nominaal, ordinaal, interval, ratio)
meetniveau_afhankelijk_variabele <- "ratio"
```

  - Misvatting: de gemeten uitkomst is het aantal overlastmeldingen; de interventie is de verklaring, niet de afhankelijke variabele.

- Foute testinvoer voor `meetniveau_afhankelijk_variabele` (alle andere velden blijven correct):

```r
# Vul elk tekstantwoord in tussen de aanhalingstekens.

# a. Wat is hier de onafhankelijke variabele?
onafhankelijke_variabele <- "De interventie"

# b. Wat is het meetniveau van de onafhankelijke variabele? (nominaal, ordinaal, interval, ratio)
meetniveau_onafhankelijk_variabele <- "nominaal"

# c. Wat is hier de afhankelijke variabele?
afhankelijke_variabele <- "Het aantal meldingen van overlast"

# d. Wat is het meetniveau van de afhankelijke variabele? (nominaal, ordinaal, interval, ratio)
meetniveau_afhankelijk_variabele <- "nominaal"
```

  - Misvatting: een aantal is een telling met een werkelijk nulpunt; het meetniveau is ratio.

### Oef - 2.6 Kwantitatieve variabelen en meetniveau

Bronmap: `Hoofdstuk_2_Inleidende begrippen/Oef - 2.9 Onderzoeksvraag classificatie - Inbraken per maand`

#### Correcte inzending

Kopieerbare, volledig ingevulde boilerplate:

```r
# Vul voor elk onderdeel het nummer van de gekozen optie in.
meetniveau_aantal_inbraken <- 4
meetniveau_percentage_onveilig <- 4
type_politiedichtheid_en_diefstallen <- 1
```

#### Foute testinvoer en misvattingen

- Foute testinvoer voor `meetniveau_aantal_inbraken` (alle andere velden blijven correct):

```r
# Vul voor elk onderdeel het nummer van de gekozen optie in.
meetniveau_aantal_inbraken <- 1
meetniveau_percentage_onveilig <- 4
type_politiedichtheid_en_diefstallen <- 1
```

  - **Waarschijnlijke redenering:** Bij onderdeel 1 (aantal inbraken) koos je optie 1. **Waarom dit niet klopt:** Een telling heeft gelijke afstanden en nul betekent geen gebeurtenissen; daarom is het meetniveau ratio.

- Foute testinvoer voor `meetniveau_percentage_onveilig` (alle andere velden blijven correct):

```r
# Vul voor elk onderdeel het nummer van de gekozen optie in.
meetniveau_aantal_inbraken <- 4
meetniveau_percentage_onveilig <- 1
type_politiedichtheid_en_diefstallen <- 1
```

  - **Waarschijnlijke redenering:** Bij onderdeel 2 (percentage onveiligheid) koos je optie 1. **Waarom dit niet klopt:** Het percentage is numeriek, heeft gelijke afstanden en een betekenisvol nulpunt; daarom is het meetniveau ratio.

- Foute testinvoer voor `type_politiedichtheid_en_diefstallen` (alle andere velden blijven correct):

```r
# Vul voor elk onderdeel het nummer van de gekozen optie in.
meetniveau_aantal_inbraken <- 4
meetniveau_percentage_onveilig <- 4
type_politiedichtheid_en_diefstallen <- 2
```

  - **Waarschijnlijke redenering:** Bij onderdeel 3 (politiedichtheid en diefstallen) koos je optie 2. **Waarom dit niet klopt:** Beide variabelen zijn numerieke aantallen per vaste populatie-eenheid en dus kwantitatief.

### Oef - 2.7 Onderzoeksvragen, variabelerollen en opzet

Bronmap: `Hoofdstuk_2_Inleidende begrippen/Oef - 2.10 Onderzoeksvraag classificatie - Recidive en leeftijd`

#### Correcte inzending

Kopieerbare, volledig ingevulde boilerplate:

```r
# Vul voor elk onderdeel het nummer van de gekozen optie in.
type_vraag_leeftijd_recidive <- 3
uitkomst_recidive_geslacht <- 2
opzet_cameratoezicht <- 2
type_vraag_gemiddelde_leeftijd <- 1
```

#### Foute testinvoer en misvattingen

- Foute testinvoer voor `type_vraag_leeftijd_recidive` (alle andere velden blijven correct):

```r
# Vul voor elk onderdeel het nummer van de gekozen optie in.
type_vraag_leeftijd_recidive <- 1
uitkomst_recidive_geslacht <- 2
opzet_cameratoezicht <- 2
type_vraag_gemiddelde_leeftijd <- 1
```

  - **Waarschijnlijke redenering:** Bij onderdeel 1 (leeftijd en recidive) koos je optie 1. **Waarom dit niet klopt:** De vraag bevat een voorspeller en een uitkomst en vraagt naar voorspelling; dit is bivariaat verklarend.

- Foute testinvoer voor `uitkomst_recidive_geslacht` (alle andere velden blijven correct):

```r
# Vul voor elk onderdeel het nummer van de gekozen optie in.
type_vraag_leeftijd_recidive <- 3
uitkomst_recidive_geslacht <- 1
opzet_cameratoezicht <- 2
type_vraag_gemiddelde_leeftijd <- 1
```

  - **Waarschijnlijke redenering:** Bij onderdeel 2 (recidive en geslacht) koos je optie 1. **Waarom dit niet klopt:** Recidive is de uitkomst die tussen de geslachtsgroepen wordt vergeleken.

- Foute testinvoer voor `opzet_cameratoezicht` (alle andere velden blijven correct):

```r
# Vul voor elk onderdeel het nummer van de gekozen optie in.
type_vraag_leeftijd_recidive <- 3
uitkomst_recidive_geslacht <- 2
opzet_cameratoezicht <- 1
type_vraag_gemiddelde_leeftijd <- 1
```

  - **Waarschijnlijke redenering:** Bij onderdeel 3 (cameratoezicht) koos je optie 1. **Waarom dit niet klopt:** Een interventie met een voor-na-vergelijking maar zonder randomisatie is quasi-experimenteel.

- Foute testinvoer voor `type_vraag_gemiddelde_leeftijd` (alle andere velden blijven correct):

```r
# Vul voor elk onderdeel het nummer van de gekozen optie in.
type_vraag_leeftijd_recidive <- 3
uitkomst_recidive_geslacht <- 2
opzet_cameratoezicht <- 2
type_vraag_gemiddelde_leeftijd <- 2
```

  - **Waarschijnlijke redenering:** Bij onderdeel 4 (gemiddelde leeftijd) koos je optie 2. **Waarom dit niet klopt:** De vraag vat één variabele samen en onderzoekt geen verschil of relatie; dit is univariaat beschrijvend.
