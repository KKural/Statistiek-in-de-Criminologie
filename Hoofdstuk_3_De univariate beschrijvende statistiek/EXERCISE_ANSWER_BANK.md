# Antwoordbank — Hoofdstuk 3

> Alleen voor docenten en technische validatie. De correcte inzendingen zijn rechtstreeks afgeleid van de canonieke `evaluation/Answer.R`-bestanden en door die evaluatoren gevalideerd.

## Gebruik

- **Correcte inzending** is een volledig ingevulde versie van de boilerplate, of het juiste optienummer bij een keuzeoefening.
- Een **Foute testinvoer** vervangt alleen de getoonde regel of keuze.
- De uitleg bij foute invoer beschrijft de bijbehorende misvatting en feedbackroute.

### Oef - 3.1 Energiedrankjes - Eén absolute frequentie

Bronmap: `Hoofdstuk_3_De univariate beschrijvende statistiek/Oef - 3.1 Frequentietabel - Energiedrankjes consumptie`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Vul het antwoord in na <-.
frequentie_vaak <-3
```

#### Foute testinvoer en misvattingen

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
frequentie_vaak <-8
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt het totale aantal antwoorden ingevuld.

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
frequentie_vaak <-0.375
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt de relatieve frequentie ingevuld in plaats van de telling.

- Ongeldige of ontbrekende invoer:

```r
frequentie_vaak <-
```

  - Misvatting: geen eindig getal ingevuld; de evaluator geeft de aparte route **Waarom dit niet klopt**, **Denkregel** en **Volgende stap**.

### Oef - 3.2.1 Tevredenheid - Eén cumulatieve frequentie

Bronmap: `Hoofdstuk_3_De univariate beschrijvende statistiek/Oef - 3.2.1 Cumulatieve absolute frequenties - Tevredenheid Reclasseringsbegeleiding`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Vul het antwoord in na <-.
cumulatieve_frequentie_neutraal <-20
```

#### Foute testinvoer en misvattingen

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
cumulatieve_frequentie_neutraal <-7
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt alleen de gewone frequentie van de grenscategorie genomen.

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
cumulatieve_frequentie_neutraal <-13
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt de grenscategorie zelf niet meegeteld.

- Ongeldige of ontbrekende invoer:

```r
cumulatieve_frequentie_neutraal <-
```

  - Misvatting: geen eindig getal ingevuld; de evaluator geeft de aparte route **Waarom dit niet klopt**, **Denkregel** en **Volgende stap**.

### Oef - 3.2.2 Tevredenheid - Eén relatieve frequentie

Bronmap: `Hoofdstuk_3_De univariate beschrijvende statistiek/Oef - 3.2.2 Relatieve frequenties - Tevredenheid Reclasseringsbegeleiding`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Vul het antwoord in na <-.
relatieve_frequentie_tevreden <-0.3
```

#### Foute testinvoer en misvattingen

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
relatieve_frequentie_tevreden <-12
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt de absolute frequentie ingevuld zonder door het totaal te delen.

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
relatieve_frequentie_tevreden <-30
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt een percentage ingevuld in plaats van een proportie.

- Ongeldige of ontbrekende invoer:

```r
relatieve_frequentie_tevreden <-
```

  - Misvatting: geen eindig getal ingevuld; de evaluator geeft de aparte route **Waarom dit niet klopt**, **Denkregel** en **Volgende stap**.

### Oef - 3.2.3 Tevredenheid - Eén cumulatieve proportie

Bronmap: `Hoofdstuk_3_De univariate beschrijvende statistiek/Oef - 3.2.3 Cumulatieve relatieve frequenties - Tevredenheid Reclasseringsbegeleiding`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Vul het antwoord in na <-.
cumulatieve_relatieve_frequentie_neutraal <-0.65
```

#### Foute testinvoer en misvattingen

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
cumulatieve_relatieve_frequentie_neutraal <-0.35
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt alleen de relatieve frequentie van neutraal genomen.

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
cumulatieve_relatieve_frequentie_neutraal <-65
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt een percentage ingevuld in plaats van een proportie.

- Ongeldige of ontbrekende invoer:

```r
cumulatieve_relatieve_frequentie_neutraal <-
```

  - Misvatting: geen eindig getal ingevuld; de evaluator geeft de aparte route **Waarom dit niet klopt**, **Denkregel** en **Volgende stap**.

### Oef - 3.2.4 Tevredenheid - Passende ordinale samenvatting

Bronmap: `Hoofdstuk_3_De univariate beschrijvende statistiek/Oef - 3.2.4 Ordinale centraliteit en spreiding - Tevredenheid Reclasseringsbegeleiding`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Vul het antwoord in na <-.
samenvattingspaar <-2
```

#### Foute testinvoer en misvattingen

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
samenvattingspaar <-1
```

  - Misvatting: **Waarschijnlijke redenering:** Je behandelt de categorieafstanden alsof ze exact numeriek gelijk zijn.

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
samenvattingspaar <-3
```

  - Misvatting: **Waarschijnlijke redenering:** De modus kan, maar variantie vereist betekenisvolle numerieke afstanden.

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
samenvattingspaar <-4
```

  - Misvatting: **Waarschijnlijke redenering:** Beide maten veronderstellen kwantitatieve afstanden en verhoudingen.

- Ongeldige of ontbrekende invoer:

```r
samenvattingspaar <-
```

  - Misvatting: geen eindig getal ingevuld; de evaluator geeft de aparte route **Waarom dit niet klopt**, **Denkregel** en **Volgende stap**.

### Oef - 3.3.1 Werkuren - Absolute frequentie

Bronmap: `Hoofdstuk_3_De univariate beschrijvende statistiek/Oef - 3.3.1 Absolute frequentie - Werkuren`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Vul het getal in na <-.
frequentie_32 <- 3
```

#### Foute testinvoer en misvattingen

- Foute testinvoer: `frequentie_32 <- 32`
  - Misvatting: **Waarschijnlijke redenering:** je hebt de gezochte waarde zelf overgenomen in plaats van haar voorkomens te tellen.
- Foute testinvoer: `frequentie_32 <- 0.375`
  - Misvatting: **Waarschijnlijke redenering:** je hebt een relatieve frequentie ingevuld terwijl een geheel aantal voorkomens wordt gevraagd.
- Foute testinvoer: `frequentie_32 <- 2`
  - Misvatting: **Waarschijnlijke redenering:** je hebt een voorkomen gemist of een andere waarde geteld.

### Oef - 3.3.2 Werkuren - Van frequentie naar percentage

Bronmap: `Hoofdstuk_3_De univariate beschrijvende statistiek/Oef - 3.3.2 Van frequentie naar percentage - Werkuren`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Vul de getallen in na <-.
proportie_32 <- 0.375
percentage_32 <- 37.5
```

#### Foute testinvoer en misvattingen

- Foute testinvoer: `proportie_32 <- 37.5`
  - Misvatting: **Waarschijnlijke redenering:** je hebt de proportie en het percentage verwisseld.
- Foute testinvoer: `proportie_32 <- 3`
  - Misvatting: **Waarschijnlijke redenering:** je hebt de absolute frequentie laten staan zonder door het totaal te delen.
- Foute testinvoer: `percentage_32 <- 0.375`
  - Misvatting: **Waarschijnlijke redenering:** de proportie klopt, maar je hebt haar niet met 100 omgezet naar een percentage.

### Oef - 3.3.3 Werkuren - Eén gemiddelde

Bronmap: `Hoofdstuk_3_De univariate beschrijvende statistiek/Oef - 3.3.3 Centraliteit en spreiding - Werkuren Re-integratieprogramma`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Vul het antwoord in na <-.
gemiddelde <-24
```

#### Foute testinvoer en misvattingen

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
gemiddelde <-72
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt de som ingevuld zonder door het aantal waarden te delen.

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
gemiddelde <-28
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt de grootste waarneming gekozen in plaats van het gemiddelde.

- Ongeldige of ontbrekende invoer:

```r
gemiddelde <-
```

  - Misvatting: geen eindig getal ingevuld; de evaluator geeft de aparte route **Waarom dit niet klopt**, **Denkregel** en **Volgende stap**.

### Oef - 3.3.4 Werkuren - Passende samenvattingsmaten

Bronmap: `Hoofdstuk_3_De univariate beschrijvende statistiek/Oef - 3.3.4 Passende samenvattingsmaten - Werkuren Re-integratieprogramma`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Vul getallen in na <- of tussen de komma's in c(...); typ tekst tussen "".
werkuren <- c(24, 36, 35, 28, 24, 28, 24, 36, 32, 36,
              40, 38, 36, 34, 40, 36, 32, 36, 40, 36)

meest_relevante_centraliteit <- "gemiddelde"
meest_relevante_spreiding <- "standaardafwijking"
reden <- "gebruikt alle informatie"
```

#### Foute testinvoer en misvattingen

- Foute testinvoer: `meest_relevante_centraliteit <- "standaardafwijking"`
  - Misvatting: **Waarschijnlijke redenering:** De gekozen centrummaat, spreidingsmaat en reden beantwoorden niet dezelfde samenvattingsstrategie.
- Foute testinvoer: `meest_relevante_centraliteit <- "mediaan"`
  - Misvatting: **Waarschijnlijke redenering:** Je kiest robuuste maten alsof de verdeling een problematische uitbijter bevat.
- Foute testinvoer: `meest_relevante_centraliteit <- ""`
  - Misvatting: **Waarschijnlijke redenering:** Minstens één keuzeveld is leeg, `NA` of gebruikt niet exact een aangeboden term.

### Oef - 3.3.5 Werkuren - Getekende afwijking

Bronmap: `Hoofdstuk_3_De univariate beschrijvende statistiek/Oef - 3.3.5 Getekende afwijking - Werkuren`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Vul de getallen in na <-.
gemiddelde <- 24
afwijking_20 <- -4
```

#### Foute testinvoer en misvattingen

- Foute testinvoer: `afwijking_20 <- 4`
  - Misvatting: **Waarschijnlijke redenering:** je hebt de absolute afstand genomen of de aftrekking omgekeerd.
- Foute testinvoer: `afwijking_20 <- 20`
  - Misvatting: **Waarschijnlijke redenering:** je hebt de ruwe waarneming ingevuld in plaats van waarneming min gemiddelde.
- Foute testinvoer: `gemiddelde <- 72`
  - Misvatting: **Waarschijnlijke redenering:** je hebt de som gebruikt zonder door het aantal waarnemingen te delen.

### Oef - 3.3.6 Werkuren - Teken van een afwijking

Bronmap: `Hoofdstuk_3_De univariate beschrijvende statistiek/Oef - 3.3.6 Teken van een afwijking - Werkuren`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Kies 1 (positief), 2 (nul) of 3 (negatief).
teken_afwijking <- 1
```

#### Foute testinvoer en misvattingen

- Foute testinvoer: `teken_afwijking <- 2`
  - Misvatting: **Waarschijnlijke redenering:** je hebt de afwijking als nul beschouwd, terwijl waarneming en gemiddelde niet gelijk zijn.
- Foute testinvoer: `teken_afwijking <- 3`
  - Misvatting: **Waarschijnlijke redenering:** je hebt gemiddelde min waarneming gebruikt in plaats van waarneming min gemiddelde.
- Foute testinvoer: `teken_afwijking <- 4`
  - Misvatting: de invoer verwijst niet naar één van de drie aangeboden tekens.

### Oef - 3.3.7 Werkuren - Afwijking kwadrateren

Bronmap: `Hoofdstuk_3_De univariate beschrijvende statistiek/Oef - 3.3.7 Afwijking kwadrateren - Werkuren`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Vul de getallen in na <-.
afwijking_26 <- -4
gekwadrateerde_afwijking_26 <- 16
```

#### Foute testinvoer en misvattingen

- Foute testinvoer: `gekwadrateerde_afwijking_26 <- -16`
  - Misvatting: **Waarschijnlijke redenering:** je hebt het minteken buiten het kwadraat laten staan; een kwadraat kan niet negatief zijn.
- Foute testinvoer: `afwijking_26 <- 4`
  - Misvatting: **Waarschijnlijke redenering:** je hebt de afwijking als absolute afstand behandeld en het teken verloren.
- Foute testinvoer: `gekwadrateerde_afwijking_26 <- 4`
  - Misvatting: **Waarschijnlijke redenering:** je hebt de grootte van de afwijking gekopieerd zonder haar met zichzelf te vermenigvuldigen.

### Oef - 3.3.8 Werkuren - Waarom afwijkingen kwadrateren

Bronmap: `Hoofdstuk_3_De univariate beschrijvende statistiek/Oef - 3.3.8 Waarom afwijkingen kwadrateren - Werkuren`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Kies 1, 2, 3 of 4.
reden_kwadrateren <- 2
```

#### Foute testinvoer en misvattingen

- Foute testinvoer: `reden_kwadrateren <- 1`
  - Misvatting: **Waarschijnlijke redenering:** je denkt dat kwadrateren waarden altijd kleiner maakt.
- Foute testinvoer: `reden_kwadrateren <- 3`
  - Misvatting: **Waarschijnlijke redenering:** je verwart de nul-som van gewone afwijkingen met het doel van kwadrateren.
- Foute testinvoer: `reden_kwadrateren <- 4`
  - Misvatting: **Waarschijnlijke redenering:** je koppelt een rekenbewerking ten onrechte aan een verandering van meetniveau.
- Foute testinvoer: `reden_kwadrateren <- 5`
  - Misvatting: de invoer verwijst niet naar één van de vier aangeboden verklaringen.

### Oef - 3.3.9 Werkuren - Som van de afwijkingen

Bronmap: `Hoofdstuk_3_De univariate beschrijvende statistiek/Oef - 3.3.9 Som van de afwijkingen - Werkuren`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Vul de getallen in na <-.
ontbrekende_afwijking <- 2
som_afwijkingen <- 0
```

#### Foute testinvoer en misvattingen

- Foute testinvoer: `ontbrekende_afwijking <- -2`
  - Misvatting: **Waarschijnlijke redenering:** je hebt gemiddelde min waarneming gebruikt voor de laatste waarde.
- Foute testinvoer: `som_afwijkingen <- 4`
  - Misvatting: **Waarschijnlijke redenering:** je hebt absolute afstanden opgeteld en het negatieve teken verwijderd.
- Foute testinvoer: `som_afwijkingen <- 2`
  - Misvatting: **Waarschijnlijke redenering:** de ontbrekende afwijking klopt, maar de optelling van tegengestelde tekens niet.

### Oef - 3.3.10 Werkuren - Steekproefvariantie uit SS

Bronmap: `Hoofdstuk_3_De univariate beschrijvende statistiek/Oef - 3.3.10 Variantie en standaardafwijking - Werkuren Re-integratieprogramma`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Vul het antwoord in na <-.
steekproefvariantie <-20
```

#### Foute testinvoer en misvattingen

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
steekproefvariantie <-16
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt door n gedeeld en de populatievariantie berekend.

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
steekproefvariantie <-80
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt SS overgenomen zonder door de vrijheidsgraden te delen.

- Ongeldige of ontbrekende invoer:

```r
steekproefvariantie <-
```

  - Misvatting: geen eindig getal ingevuld; de evaluator geeft de aparte route **Waarom dit niet klopt**, **Denkregel** en **Volgende stap**.

### Oef - 3.4.1 Huwelijksduur - Absolute frequentie

Bronmap: `Hoofdstuk_3_De univariate beschrijvende statistiek/Oef - 3.4.1 Absolute frequentie - Huwelijksduur`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Vul het getal in na <-.
frequentie_60 <- 2
```

#### Foute testinvoer en misvattingen

- Foute testinvoer: `frequentie_60 <- 60`
  - Misvatting: **Waarschijnlijke redenering:** je hebt de duur zelf ingevuld in plaats van het aantal voorkomens.
- Foute testinvoer: `frequentie_60 <- 0.33`
  - Misvatting: **Waarschijnlijke redenering:** je hebt een relatieve frequentie ingevuld terwijl een absoluut aantal wordt gevraagd.
- Foute testinvoer: `frequentie_60 <- 1`
  - Misvatting: **Waarschijnlijke redenering:** je hebt één voorkomen gemist of een andere duur geteld.

### Oef - 3.4.2 Huwelijksduur - Relatieve frequentie en percentage

Bronmap: `Hoofdstuk_3_De univariate beschrijvende statistiek/Oef - 3.4.2 Relatieve frequentie en percentage - Huwelijksduur`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Vul de getallen in na <-.
relatieve_frequentie_120 <- 0.33
percentage_120 <- 33.33
```

#### Foute testinvoer en misvattingen

- Foute testinvoer: `relatieve_frequentie_120 <- 33.33`
  - Misvatting: **Waarschijnlijke redenering:** je hebt de relatieve frequentie en het percentage verwisseld.
- Foute testinvoer: `relatieve_frequentie_120 <- 2`
  - Misvatting: **Waarschijnlijke redenering:** je hebt de absolute frequentie ingevuld zonder door het totaal te delen.
- Foute testinvoer: `percentage_120 <- 0.33`
  - Misvatting: **Waarschijnlijke redenering:** de relatieve frequentie klopt, maar je hebt de percentageschaal niet toegepast.
- Foute testinvoer: `percentage_120 <- 33`
  - Misvatting: **Waarschijnlijke redenering:** je hebt de afgeronde relatieve frequentie als tussenwaarde gebruikt in plaats van pas het eindantwoord af te ronden.

### Oef - 3.4.3 Huwelijksduur - Cumulatieve frequentie

Bronmap: `Hoofdstuk_3_De univariate beschrijvende statistiek/Oef - 3.4.3 Cumulatieve frequentie - Huwelijksduur`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Vul de getallen in na <-.
cumulatieve_frequentie_90 <- 4
cumulatief_percentage_90 <- 66.67
```

#### Foute testinvoer en misvattingen

- Foute testinvoer: `cumulatieve_frequentie_90 <- 1`
  - Misvatting: **Waarschijnlijke redenering:** je hebt alleen de gewone frequentie van 90 dagen genomen.
- Foute testinvoer: `cumulatieve_frequentie_90 <- 3`
  - Misvatting: **Waarschijnlijke redenering:** je hebt de waarden onder 90 geteld maar de grenswaarde zelf weggelaten.
- Foute testinvoer: `cumulatief_percentage_90 <- 0.6667`
  - Misvatting: **Waarschijnlijke redenering:** je hebt de cumulatieve proportie ingevuld in plaats van het percentage.
- Foute testinvoer: `cumulatief_percentage_90 <- 4`
  - Misvatting: **Waarschijnlijke redenering:** de cumulatieve telling klopt, maar de omzetting naar een percentage niet.
- Foute testinvoer: `cumulatief_percentage_90 <- 67`
  - Misvatting: **Waarschijnlijke redenering:** je hebt een afgeronde proportie als tussenwaarde gebruikt.

### Oef - 3.4.4 Huwelijksduur - Mediaan bij een uitbijter

Bronmap: `Hoofdstuk_3_De univariate beschrijvende statistiek/Oef - 3.4.4 Centraliteit en spreiding - Beroemde huwelijken`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Vul het antwoord in na <-.
mediaan <-30
```

#### Foute testinvoer en misvattingen

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
mediaan <-80
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt het gemiddelde berekend, dat door de uitbijter omhoog wordt getrokken.

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
mediaan <-300
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt de grootste waarde gekozen in plaats van de middelste.

- Ongeldige of ontbrekende invoer:

```r
mediaan <-
```

  - Misvatting: geen eindig getal ingevuld; de evaluator geeft de aparte route **Waarom dit niet klopt**, **Denkregel** en **Volgende stap**.

### Oef - 3.4.5 Huwelijksduur - Uitbijter, gemiddelde en mediaan

Bronmap: `Hoofdstuk_3_De univariate beschrijvende statistiek/Oef - 3.4.5 Uitbijter, gemiddelde en mediaan - Huwelijksduur`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Vul getallen in na <-; plaats tekst tussen "".
gemiddelde <- 120
mediaan <- 50
beste_centraliteitsmaat <- "mediaan"
```

#### Foute testinvoer en misvattingen

- Foute testinvoer: `beste_centraliteitsmaat <- "gemiddelde"`
  - Misvatting: **Waarschijnlijke redenering:** je hebt het gemiddelde gekozen omdat het alle waarden gebruikt, zonder rekening te houden met de sterke uitbijter.
- Foute testinvoer: `gemiddelde <- 50`
  - Misvatting: **Waarschijnlijke redenering:** je hebt gemiddelde en mediaan verwisseld.
- Foute testinvoer: `beste_centraliteitsmaat <- "modus"`
  - Misvatting: je hebt een andere term gebruikt dan één van de twee gevraagde centraliteitsmaten.
- Foute testinvoer: `beste_centraliteitsmaat <- ""`
  - Misvatting: de gekozen maat ontbreekt of is niet als tekst tussen aanhalingstekens ingevuld.

### Oef - 3.4.6 Huwelijksduur - Afwijking en kwadraat

Bronmap: `Hoofdstuk_3_De univariate beschrijvende statistiek/Oef - 3.4.6 Afwijking en kwadraat - Huwelijksduur`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Vul de getallen in na <-.
gemiddelde <- 30
afwijking_20 <- -10
gekwadrateerde_afwijking_20 <- 100
```

#### Foute testinvoer en misvattingen

- Foute testinvoer: `afwijking_20 <- 10`
  - Misvatting: **Waarschijnlijke redenering:** je hebt de absolute afstand genomen of de aftrekking omgekeerd.
- Foute testinvoer: `gekwadrateerde_afwijking_20 <- -100`
  - Misvatting: **Waarschijnlijke redenering:** je hebt het negatieve teken na het kwadrateren behouden.
- Foute testinvoer: `gekwadrateerde_afwijking_20 <- 10`
  - Misvatting: **Waarschijnlijke redenering:** je hebt de grootte van de afwijking gekopieerd zonder haar te kwadrateren.
- Foute testinvoer: `gemiddelde <- 90`
  - Misvatting: **Waarschijnlijke redenering:** je hebt de som gebruikt zonder door drie te delen.

### Oef - 3.4.7 Huwelijksduur - Bijdrage aan de spreiding

Bronmap: `Hoofdstuk_3_De univariate beschrijvende statistiek/Oef - 3.4.7 Bijdrage aan de spreiding - Huwelijksduur`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Vul de kwadraten in en kies daarna 1 (huwelijk A) of 2 (huwelijk B).
kwadraat_20 <- 400
kwadraat_100 <- 3600
grootste_bijdrage <- 2
```

#### Foute testinvoer en misvattingen

- Foute testinvoer: `kwadraat_20 <- 20`
  - Misvatting: **Waarschijnlijke redenering:** je hebt de waarneming overgenomen in plaats van haar afwijking tot het gemiddelde te kwadrateren.
- Foute testinvoer: `kwadraat_20 <- -400`
  - Misvatting: **Waarschijnlijke redenering:** je hebt bij een kwadraat een negatief teken behouden.
- Foute testinvoer: `grootste_bijdrage <- 1`
  - Misvatting: **Waarschijnlijke redenering:** je hebt de laagste waarneming gekozen in plaats van de grootste afstand tot het gemiddelde.
- Foute testinvoer: `grootste_bijdrage <- 3`
  - Misvatting: de keuze verwijst niet naar huwelijk A of huwelijk B.

### Oef - 3.4.8 Huwelijksduur - Variantie en standaardafwijking

Bronmap: `Hoofdstuk_3_De univariate beschrijvende statistiek/Oef - 3.4.8 Variantie en standaardafwijking - Beroemde huwelijken`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Vul getallen in na <- of tussen de komma's in c(...); typ tekst tussen "".
huwelijksduren <- c(240, 144, 143, 72, 30, 26, 2, 150, 14, 150, 1657)

sum_of_squares <- 2268540.91
variantie <- 226854.09
standaardafwijking <- 476.29
```

#### Foute testinvoer en misvattingen

- Foute testinvoer: `sum_of_squares <- 226854.09`
  - Misvatting: **Waarschijnlijke redenering:** Een formule- of afrondingskeuze werkt door in `sum_of_squares`.
- Foute testinvoer: `variantie <- 206230.99`
  - Misvatting: **Waarschijnlijke redenering:** Je hebt door n = 11 gedeeld en zo een populatievariantie berekend.
- Foute testinvoer: `standaardafwijking <- 226854.09`
  - Misvatting: **Waarschijnlijke redenering:** Je hebt de variantie opnieuw ingevuld zonder de vierkantswortel te nemen.

### Oef - 3.5 Politie-incidenten - Passende spreidingsmaat

Bronmap: `Hoofdstuk_3_De univariate beschrijvende statistiek/Oef - 3.5 Beschrijvende statistiek - Politiepatrouille en incidenten`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Vul het antwoord in na <-.
spreidingsmaat <-1
```

#### Foute testinvoer en misvattingen

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
spreidingsmaat <-2
```

  - Misvatting: **Waarschijnlijke redenering:** Je kiest een robuuste maat terwijl de context geen sterke uitbijters of scheefheid vermeldt.

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
spreidingsmaat <-3
```

  - Misvatting: **Waarschijnlijke redenering:** De modus is een centrummaat en geen spreidingsmaat.

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
spreidingsmaat <-4
```

  - Misvatting: **Waarschijnlijke redenering:** De mediaan is eveneens een centrummaat.

- Ongeldige of ontbrekende invoer:

```r
spreidingsmaat <-
```

  - Misvatting: geen eindig getal ingevuld; de evaluator geeft de aparte route **Waarom dit niet klopt**, **Denkregel** en **Volgende stap**.
