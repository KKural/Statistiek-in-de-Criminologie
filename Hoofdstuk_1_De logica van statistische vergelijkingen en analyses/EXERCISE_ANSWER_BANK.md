# Antwoordbank — Hoofdstuk 1

> Alleen voor docenten en technische validatie. De correcte inzendingen zijn rechtstreeks afgeleid van de canonieke `evaluation/Answer.R`-bestanden en door die evaluatoren gevalideerd.

## Gebruik

- **Correcte inzending** is een volledig ingevulde versie van de boilerplate, of het juiste optienummer bij een keuzeoefening.
- Een **Foute testinvoer** wijzigt steeds precies één antwoord terwijl de andere antwoorden correct blijven.
- De uitleg na elke foute invoer benoemt de bijbehorende misvatting en gerichte feedbackroute.

### Oef - 1.1 Statistische basisbegrippen

Bronmap: `Hoofdstuk_1_De logica van statistische vergelijkingen en analyses/Oef - 1.1 Meetniveau - Leeftijd`

#### Correcte inzending

Kopieerbare, volledig ingevulde boilerplate:

```r
# Vul voor elk onderdeel het nummer van de gekozen optie in.
meetniveau_leeftijd <- 4
nominale_variabele <- 1
populatie_steekproef <- 4
doel_beschrijvende_statistiek <- 1
causale_beperking <- 3
```

#### Foute testinvoer en misvattingen

- Foute testinvoer voor `meetniveau_leeftijd` (alle andere velden blijven correct):

```r
# Vul voor elk onderdeel het nummer van de gekozen optie in.
meetniveau_leeftijd <- 1
nominale_variabele <- 1
populatie_steekproef <- 4
doel_beschrijvende_statistiek <- 1
causale_beperking <- 3
```

  - **Waarschijnlijke redenering:** Bij onderdeel 1 (meetniveau van leeftijd) koos je optie 1. **Waarom dit niet klopt:** Exacte leeftijd heeft gelijke afstanden en een betekenisvol nulpunt; daarom is de ratioschaal passend.

- Foute testinvoer voor `nominale_variabele` (alle andere velden blijven correct):

```r
# Vul voor elk onderdeel het nummer van de gekozen optie in.
meetniveau_leeftijd <- 4
nominale_variabele <- 2
populatie_steekproef <- 4
doel_beschrijvende_statistiek <- 1
causale_beperking <- 3
```

  - **Waarschijnlijke redenering:** Bij onderdeel 2 (nominale variabele) koos je optie 2. **Waarom dit niet klopt:** Een nominale variabele heeft categorieën zonder natuurlijke rangorde; typen misdrijven voldoen daaraan.

- Foute testinvoer voor `populatie_steekproef` (alle andere velden blijven correct):

```r
# Vul voor elk onderdeel het nummer van de gekozen optie in.
meetniveau_leeftijd <- 4
nominale_variabele <- 1
populatie_steekproef <- 1
doel_beschrijvende_statistiek <- 1
causale_beperking <- 3
```

  - **Waarschijnlijke redenering:** Bij onderdeel 3 (populatie en steekproef) koos je optie 1. **Waarom dit niet klopt:** De populatie is de volledige doelgroep en de steekproef is het werkelijk onderzochte deel.

- Foute testinvoer voor `doel_beschrijvende_statistiek` (alle andere velden blijven correct):

```r
# Vul voor elk onderdeel het nummer van de gekozen optie in.
meetniveau_leeftijd <- 4
nominale_variabele <- 1
populatie_steekproef <- 4
doel_beschrijvende_statistiek <- 2
causale_beperking <- 3
```

  - **Waarschijnlijke redenering:** Bij onderdeel 4 (beschrijvende statistiek) koos je optie 2. **Waarom dit niet klopt:** Beschrijvende statistiek blijft bij het ordenen en samenvatten van de geobserveerde gegevens.

- Foute testinvoer voor `causale_beperking` (alle andere velden blijven correct):

```r
# Vul voor elk onderdeel het nummer van de gekozen optie in.
meetniveau_leeftijd <- 4
nominale_variabele <- 1
populatie_steekproef <- 4
doel_beschrijvende_statistiek <- 1
causale_beperking <- 1
```

  - **Waarschijnlijke redenering:** Bij onderdeel 5 (correlatie en causaliteit) koos je optie 1. **Waarom dit niet klopt:** Een waargenomen samenhang sluit confounding en omgekeerde causaliteit niet uit.

### Oef - 1.2 Onderzoeksproces en onderzoekskwaliteit

Bronmap: `Hoofdstuk_1_De logica van statistische vergelijkingen en analyses/Oef - 1.2 Centrale Onderzoeksvraag`

#### Correcte inzending

Kopieerbare, volledig ingevulde boilerplate:

```r
# Vul voor elk onderdeel het nummer van de gekozen optie in.
functie_centrale_vraag <- 4
doel_deelvragen <- 1
eerste_onderzoeksstap <- 4
belang_negatieve_resultaten <- 2
kwaliteit_steekproef <- 3
```

#### Foute testinvoer en misvattingen

- Foute testinvoer voor `functie_centrale_vraag` (alle andere velden blijven correct):

```r
# Vul voor elk onderdeel het nummer van de gekozen optie in.
functie_centrale_vraag <- 1
doel_deelvragen <- 1
eerste_onderzoeksstap <- 4
belang_negatieve_resultaten <- 2
kwaliteit_steekproef <- 3
```

  - **Waarschijnlijke redenering:** Bij onderdeel 1 (centrale onderzoeksvraag) koos je optie 1. **Waarom dit niet klopt:** De centrale vraag legt de hoofdfocus vast en bewaakt de samenhang van het volledige onderzoek.

- Foute testinvoer voor `doel_deelvragen` (alle andere velden blijven correct):

```r
# Vul voor elk onderdeel het nummer van de gekozen optie in.
functie_centrale_vraag <- 4
doel_deelvragen <- 2
eerste_onderzoeksstap <- 4
belang_negatieve_resultaten <- 2
kwaliteit_steekproef <- 3
```

  - **Waarschijnlijke redenering:** Bij onderdeel 2 (deelvragen) koos je optie 2. **Waarom dit niet klopt:** Deelvragen maken de centrale vraag systematisch en hanteerbaar zonder haar te vervangen.

- Foute testinvoer voor `eerste_onderzoeksstap` (alle andere velden blijven correct):

```r
# Vul voor elk onderdeel het nummer van de gekozen optie in.
functie_centrale_vraag <- 4
doel_deelvragen <- 1
eerste_onderzoeksstap <- 1
belang_negatieve_resultaten <- 2
kwaliteit_steekproef <- 3
```

  - **Waarschijnlijke redenering:** Bij onderdeel 3 (start van onderzoek) koos je optie 1. **Waarom dit niet klopt:** Een onderzoekbaar probleem ontstaat eerst uit systematische observatie en nieuwsgierige verkenning.

- Foute testinvoer voor `belang_negatieve_resultaten` (alle andere velden blijven correct):

```r
# Vul voor elk onderdeel het nummer van de gekozen optie in.
functie_centrale_vraag <- 4
doel_deelvragen <- 1
eerste_onderzoeksstap <- 4
belang_negatieve_resultaten <- 1
kwaliteit_steekproef <- 3
```

  - **Waarschijnlijke redenering:** Bij onderdeel 4 (negatieve resultaten) koos je optie 1. **Waarom dit niet klopt:** Selectieve publicatie van positieve uitkomsten veroorzaakt publicatiebias en vertekent het totale bewijs.

- Foute testinvoer voor `kwaliteit_steekproef` (alle andere velden blijven correct):

```r
# Vul voor elk onderdeel het nummer van de gekozen optie in.
functie_centrale_vraag <- 4
doel_deelvragen <- 1
eerste_onderzoeksstap <- 4
belang_negatieve_resultaten <- 2
kwaliteit_steekproef <- 1
```

  - **Waarschijnlijke redenering:** Bij onderdeel 5 (steekproefstrategie) koos je optie 1. **Waarom dit niet klopt:** Een grote steekproef herstelt geen onderdekking; het steekproefkader moet alle relevante groepen bereiken.
