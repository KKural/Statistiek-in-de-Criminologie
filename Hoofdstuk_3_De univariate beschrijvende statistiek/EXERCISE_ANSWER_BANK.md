# Antwoordbank — Hoofdstuk 3

> Alleen voor docenten en technische validatie. De correcte inzendingen zijn rechtstreeks afgeleid van de canonieke `evaluation/Answer.R`-bestanden en door die evaluatoren gevalideerd.

## Gebruik

- **Correcte inzending** is een volledig ingevulde versie van de boilerplate, of het juiste optienummer bij een keuzeoefening.
- Een **Foute testinvoer** wijzigt steeds precies één antwoord terwijl de andere antwoorden correct blijven.
- De uitleg na elke foute invoer benoemt de bijbehorende misvatting en gerichte feedbackroute.

### Oef - 3.1 Energiedrankjes - Eén absolute frequentie

Bronmap: `Hoofdstuk_3_De univariate beschrijvende statistiek/Oef - 3.1 Frequentietabel - Energiedrankjes consumptie`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Vul het antwoord in na <-.
frequentie_vaak <- 3
```

#### Foute testinvoer en misvattingen

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
frequentie_vaak <- 8
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt het totale aantal antwoorden ingevuld.

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
frequentie_vaak <- 0.375
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt de relatieve frequentie ingevuld in plaats van de telling.

- Ongeldige of ontbrekende invoer:

```r
frequentie_vaak <-
```

  - Misvatting: geen eindig getal ingevuld; de evaluator geeft de aparte route **Waarom dit niet klopt**, **Denkregel** en **Volgende stap**.

### Oef - 3.2 Tevredenheid - Frequenties en passende maten

Bronmap: `Hoofdstuk_3_De univariate beschrijvende statistiek/Oef - 3.2.1 Cumulatieve absolute frequenties - Tevredenheid Reclasseringsbegeleiding`

#### Correcte inzending

Kopieerbare, volledig ingevulde boilerplate:

```r
# Vul drie berekende waarden en daarna het nummer van de gekozen optie in.
cumulatieve_frequentie_neutraal <- 20
relatieve_frequentie_tevreden <- 0.3
cumulatieve_relatieve_frequentie_neutraal <- 0.65
samenvattingspaar_ordinaal <- 2
```

#### Foute testinvoer en misvattingen

- Foute testinvoer voor `cumulatieve_frequentie_neutraal` (alle andere velden blijven correct):

```r
# Vul drie berekende waarden en daarna het nummer van de gekozen optie in.
cumulatieve_frequentie_neutraal <- 21
relatieve_frequentie_tevreden <- 0.3
cumulatieve_relatieve_frequentie_neutraal <- 0.65
samenvattingspaar_ordinaal <- 2
```

  - **Waarschijnlijke redenering:** Voor onderdeel 1 (cumulatieve absolute frequentie) vulde je 21 in. **Waarom dit niet klopt:** Cumulatief tot en met neutraal betekent de frequenties 5, 8 en 7 optellen.

- Foute testinvoer voor `relatieve_frequentie_tevreden` (alle andere velden blijven correct):

```r
# Vul drie berekende waarden en daarna het nummer van de gekozen optie in.
cumulatieve_frequentie_neutraal <- 20
relatieve_frequentie_tevreden <- 30
cumulatieve_relatieve_frequentie_neutraal <- 0.65
samenvattingspaar_ordinaal <- 2
```

  - **Waarschijnlijke redenering:** Voor onderdeel 2 (relatieve frequentie) vulde je 30 in. **Waarom dit niet klopt:** Een relatieve frequentie is de categoriefrequentie gedeeld door het groepstotaal: 12 gedeeld door 40.

- Foute testinvoer voor `cumulatieve_relatieve_frequentie_neutraal` (alle andere velden blijven correct):

```r
# Vul drie berekende waarden en daarna het nummer van de gekozen optie in.
cumulatieve_frequentie_neutraal <- 20
relatieve_frequentie_tevreden <- 0.3
cumulatieve_relatieve_frequentie_neutraal <- 65
samenvattingspaar_ordinaal <- 2
```

  - **Waarschijnlijke redenering:** Voor onderdeel 3 (cumulatieve relatieve frequentie) vulde je 65 in. **Waarom dit niet klopt:** Tel de proporties op vanaf de laagste categorie tot en met neutraal.

- Foute testinvoer voor `samenvattingspaar_ordinaal` (alle andere velden blijven correct):

```r
# Vul drie berekende waarden en daarna het nummer van de gekozen optie in.
cumulatieve_frequentie_neutraal <- 20
relatieve_frequentie_tevreden <- 0.3
cumulatieve_relatieve_frequentie_neutraal <- 0.65
samenvattingspaar_ordinaal <- 1
```

  - **Waarschijnlijke redenering:** Voor onderdeel 4 (ordinale samenvattingsmaten) vulde je 1 in. **Waarom dit niet klopt:** Bij ordinale data gebruiken mediaan en interkwartielafstand de rangorde zonder gelijke afstanden te veronderstellen.

### Oef - 3.3 Werkuren - Frequentie, proportie en percentage

Bronmap: `Hoofdstuk_3_De univariate beschrijvende statistiek/Oef - 3.3.1 Absolute frequentie - Werkuren`

#### Correcte inzending

Kopieerbare, volledig ingevulde boilerplate:

```r
# Vul de drie antwoorden in.
frequentie_32 <- 3
proportie_32 <- 0.375
percentage_32 <- 37.5
```

#### Foute testinvoer en misvattingen

- Foute testinvoer voor `frequentie_32` (alle andere velden blijven correct):

```r
# Vul de drie antwoorden in.
frequentie_32 <- 1
proportie_32 <- 0.375
percentage_32 <- 37.5
```

  - **Waarschijnlijke redenering:** Voor onderdeel 1 (absolute frequentie) vulde je 1 in. **Waarom dit niet klopt:** Tel alleen de waarden die exact gelijk zijn aan 32.

- Foute testinvoer voor `proportie_32` (alle andere velden blijven correct):

```r
# Vul de drie antwoorden in.
frequentie_32 <- 3
proportie_32 <- 37.5
percentage_32 <- 37.5
```

  - **Waarschijnlijke redenering:** Voor onderdeel 2 (proportie) vulde je 37.5 in. **Waarom dit niet klopt:** De proportie is de absolute frequentie gedeeld door alle acht waarnemingen.

- Foute testinvoer voor `percentage_32` (alle andere velden blijven correct):

```r
# Vul de drie antwoorden in.
frequentie_32 <- 3
proportie_32 <- 0.375
percentage_32 <- 38.5
```

  - **Waarschijnlijke redenering:** Voor onderdeel 3 (percentage) vulde je 38.5 in. **Waarom dit niet klopt:** Het percentage is de proportie maal 100 en wordt zonder procentteken ingevuld.

### Oef - 3.4 Werkuren - Centrum- en spreidingsmaten

Bronmap: `Hoofdstuk_3_De univariate beschrijvende statistiek/Oef - 3.3.3 Centraliteit en spreiding - Werkuren Re-integratieprogramma`

#### Correcte inzending

Kopieerbare, volledig ingevulde boilerplate:

```r
# Vul twee berekeningen en daarna drie optienummers in.
som_werkuren <- 72
gemiddelde_werkuren <- 24
keuze_centraliteitsmaat <- 3
keuze_spreidingsmaat <- 3
reden_maatkeuze <- 3
```

#### Foute testinvoer en misvattingen

- Foute testinvoer voor `som_werkuren` (alle andere velden blijven correct):

```r
# Vul twee berekeningen en daarna drie optienummers in.
som_werkuren <- 73
gemiddelde_werkuren <- 24
keuze_centraliteitsmaat <- 3
keuze_spreidingsmaat <- 3
reden_maatkeuze <- 3
```

  - **Waarschijnlijke redenering:** Voor onderdeel 1 (som) vulde je 73 in. **Waarom dit niet klopt:** Tel 20, 24 en 28 op voordat je door het aantal waarnemingen deelt.

- Foute testinvoer voor `gemiddelde_werkuren` (alle andere velden blijven correct):

```r
# Vul twee berekeningen en daarna drie optienummers in.
som_werkuren <- 72
gemiddelde_werkuren <- 25
keuze_centraliteitsmaat <- 3
keuze_spreidingsmaat <- 3
reden_maatkeuze <- 3
```

  - **Waarschijnlijke redenering:** Voor onderdeel 2 (gemiddelde) vulde je 25 in. **Waarom dit niet klopt:** Het gemiddelde is de som van 72 gedeeld door drie.

- Foute testinvoer voor `keuze_centraliteitsmaat` (alle andere velden blijven correct):

```r
# Vul twee berekeningen en daarna drie optienummers in.
som_werkuren <- 72
gemiddelde_werkuren <- 24
keuze_centraliteitsmaat <- 1
keuze_spreidingsmaat <- 3
reden_maatkeuze <- 3
```

  - **Waarschijnlijke redenering:** Voor onderdeel 3 (centrummaat) vulde je 1 in. **Waarom dit niet klopt:** Bij symmetrische ratiodata zonder uitbijter is het gemiddelde een passende centrummaat.

- Foute testinvoer voor `keuze_spreidingsmaat` (alle andere velden blijven correct):

```r
# Vul twee berekeningen en daarna drie optienummers in.
som_werkuren <- 72
gemiddelde_werkuren <- 24
keuze_centraliteitsmaat <- 3
keuze_spreidingsmaat <- 1
reden_maatkeuze <- 3
```

  - **Waarschijnlijke redenering:** Voor onderdeel 4 (spreidingsmaat) vulde je 1 in. **Waarom dit niet klopt:** De standaardafwijking vormt met het gemiddelde een samenhangend paar dat alle afstanden gebruikt.

- Foute testinvoer voor `reden_maatkeuze` (alle andere velden blijven correct):

```r
# Vul twee berekeningen en daarna drie optienummers in.
som_werkuren <- 72
gemiddelde_werkuren <- 24
keuze_centraliteitsmaat <- 3
keuze_spreidingsmaat <- 3
reden_maatkeuze <- 1
```

  - **Waarschijnlijke redenering:** Voor onderdeel 5 (reden) vulde je 1 in. **Waarom dit niet klopt:** Gemiddelde en standaardafwijking benutten alle numerieke waarden en afstanden in de reeks.

### Oef - 3.5 Werkuren - Getekende afwijkingen

Bronmap: `Hoofdstuk_3_De univariate beschrijvende statistiek/Oef - 3.3.5 Getekende afwijking - Werkuren`

#### Correcte inzending

Kopieerbare, volledig ingevulde boilerplate:

```r
# Vul twee berekeningen en daarna het nummer van de gekozen optie in.
gemiddelde_werkuren <- 24
afwijking_20 <- -4
teken_afwijking_34 <- 1
```

#### Foute testinvoer en misvattingen

- Foute testinvoer voor `gemiddelde_werkuren` (alle andere velden blijven correct):

```r
# Vul twee berekeningen en daarna het nummer van de gekozen optie in.
gemiddelde_werkuren <- 25
afwijking_20 <- -4
teken_afwijking_34 <- 1
```

  - **Waarschijnlijke redenering:** Voor onderdeel 1 (gemiddelde) vulde je 25 in. **Waarom dit niet klopt:** Het gemiddelde van 20, 24 en 28 is de som gedeeld door drie.

- Foute testinvoer voor `afwijking_20` (alle andere velden blijven correct):

```r
# Vul twee berekeningen en daarna het nummer van de gekozen optie in.
gemiddelde_werkuren <- 24
afwijking_20 <- 4
teken_afwijking_34 <- 1
```

  - **Waarschijnlijke redenering:** Voor onderdeel 2 (afwijking van 20) vulde je 4 in. **Waarom dit niet klopt:** Gebruik waarneming min gemiddelde; een waarde onder het gemiddelde geeft een negatieve afwijking.

- Foute testinvoer voor `teken_afwijking_34` (alle andere velden blijven correct):

```r
# Vul twee berekeningen en daarna het nummer van de gekozen optie in.
gemiddelde_werkuren <- 24
afwijking_20 <- -4
teken_afwijking_34 <- 2
```

  - **Waarschijnlijke redenering:** Voor onderdeel 3 (teken van 34 min 30) vulde je 2 in. **Waarom dit niet klopt:** Een waarneming boven het gemiddelde heeft een positieve afwijking.

### Oef - 3.6 Werkuren - Gekwadrateerde afwijkingen

Bronmap: `Hoofdstuk_3_De univariate beschrijvende statistiek/Oef - 3.3.7 Afwijking kwadrateren - Werkuren`

#### Correcte inzending

Kopieerbare, volledig ingevulde boilerplate:

```r
# Vul twee berekeningen en daarna het nummer van de gekozen optie in.
afwijking_26 <- -4
gekwadrateerde_afwijking_26 <- 16
reden_kwadrateren <- 2
```

#### Foute testinvoer en misvattingen

- Foute testinvoer voor `afwijking_26` (alle andere velden blijven correct):

```r
# Vul twee berekeningen en daarna het nummer van de gekozen optie in.
afwijking_26 <- 4
gekwadrateerde_afwijking_26 <- 16
reden_kwadrateren <- 2
```

  - **Waarschijnlijke redenering:** Voor onderdeel 1 (getekende afwijking) vulde je 4 in. **Waarom dit niet klopt:** Gebruik waarneming min gemiddelde: 26 min 30 is negatief.

- Foute testinvoer voor `gekwadrateerde_afwijking_26` (alle andere velden blijven correct):

```r
# Vul twee berekeningen en daarna het nummer van de gekozen optie in.
afwijking_26 <- -4
gekwadrateerde_afwijking_26 <- 17
reden_kwadrateren <- 2
```

  - **Waarschijnlijke redenering:** Voor onderdeel 2 (gekwadrateerde afwijking) vulde je 17 in. **Waarom dit niet klopt:** Bij het kwadrateren hoort de volledige negatieve afwijking tussen haakjes; het resultaat is niet negatief.

- Foute testinvoer voor `reden_kwadrateren` (alle andere velden blijven correct):

```r
# Vul twee berekeningen en daarna het nummer van de gekozen optie in.
afwijking_26 <- -4
gekwadrateerde_afwijking_26 <- 16
reden_kwadrateren <- 1
```

  - **Waarschijnlijke redenering:** Voor onderdeel 3 (reden voor kwadrateren) vulde je 1 in. **Waarom dit niet klopt:** Kwadrateren voorkomt dat positieve en negatieve afwijkingen elkaar in de som opheffen.

### Oef - 3.7 Werkuren - Afwijkingensom en variantie

Bronmap: `Hoofdstuk_3_De univariate beschrijvende statistiek/Oef - 3.3.9 Som van de afwijkingen - Werkuren`

#### Correcte inzending

Kopieerbare, volledig ingevulde boilerplate:

```r
# Vul de drie berekende waarden in.
ontbrekende_afwijking <- 2
som_afwijkingen <- 0
steekproefvariantie <- 20
```

#### Foute testinvoer en misvattingen

- Foute testinvoer voor `ontbrekende_afwijking` (alle andere velden blijven correct):

```r
# Vul de drie berekende waarden in.
ontbrekende_afwijking <- 1
som_afwijkingen <- 0
steekproefvariantie <- 20
```

  - **Waarschijnlijke redenering:** Voor onderdeel 1 (ontbrekende afwijking) vulde je 1 in. **Waarom dit niet klopt:** De afwijking van 6 ten opzichte van 4 is 6 min 4.

- Foute testinvoer voor `som_afwijkingen` (alle andere velden blijven correct):

```r
# Vul de drie berekende waarden in.
ontbrekende_afwijking <- 2
som_afwijkingen <- 1
steekproefvariantie <- 20
```

  - **Waarschijnlijke redenering:** Voor onderdeel 2 (som van afwijkingen) vulde je 1 in. **Waarom dit niet klopt:** Getekende afwijkingen rond hun eigen rekenkundig gemiddelde tellen op tot nul.

- Foute testinvoer voor `steekproefvariantie` (alle andere velden blijven correct):

```r
# Vul de drie berekende waarden in.
ontbrekende_afwijking <- 2
som_afwijkingen <- 0
steekproefvariantie <- 21
```

  - **Waarschijnlijke redenering:** Voor onderdeel 3 (steekproefvariantie) vulde je 21 in. **Waarom dit niet klopt:** Voor een steekproef deel je SS door n min 1; hier is de noemer vier.

### Oef - 3.8 Huwelijksduur - Frequenties en percentages

Bronmap: `Hoofdstuk_3_De univariate beschrijvende statistiek/Oef - 3.4.1 Absolute frequentie - Huwelijksduur`

#### Correcte inzending

Kopieerbare, volledig ingevulde boilerplate:

```r
# Vul de vijf berekende waarden in.
frequentie_60 <- 2
relatieve_frequentie_120 <- 0.33
percentage_120 <- 33.33
cumulatieve_frequentie_90 <- 4
cumulatief_percentage_90 <- 66.67
```

#### Foute testinvoer en misvattingen

- Foute testinvoer voor `frequentie_60` (alle andere velden blijven correct):

```r
# Vul de vijf berekende waarden in.
frequentie_60 <- 1
relatieve_frequentie_120 <- 0.33
percentage_120 <- 33.33
cumulatieve_frequentie_90 <- 4
cumulatief_percentage_90 <- 66.67
```

  - **Waarschijnlijke redenering:** Voor onderdeel 1 (frequentie van 60) vulde je 1 in. **Waarom dit niet klopt:** De duur 60 komt tweemaal in de reeks voor.

- Foute testinvoer voor `relatieve_frequentie_120` (alle andere velden blijven correct):

```r
# Vul de vijf berekende waarden in.
frequentie_60 <- 2
relatieve_frequentie_120 <- 33
percentage_120 <- 33.33
cumulatieve_frequentie_90 <- 4
cumulatief_percentage_90 <- 66.67
```

  - **Waarschijnlijke redenering:** Voor onderdeel 2 (relatieve frequentie van 120) vulde je 33 in. **Waarom dit niet klopt:** De duur 120 komt tweemaal voor bij zes waarnemingen; gebruik de breuk twee zesde.

- Foute testinvoer voor `percentage_120` (alle andere velden blijven correct):

```r
# Vul de vijf berekende waarden in.
frequentie_60 <- 2
relatieve_frequentie_120 <- 0.33
percentage_120 <- 34.33
cumulatieve_frequentie_90 <- 4
cumulatief_percentage_90 <- 66.67
```

  - **Waarschijnlijke redenering:** Voor onderdeel 3 (percentage van 120) vulde je 34.33 in. **Waarom dit niet klopt:** Zet de ongeronde relatieve frequentie twee zesde om naar een percentage.

- Foute testinvoer voor `cumulatieve_frequentie_90` (alle andere velden blijven correct):

```r
# Vul de vijf berekende waarden in.
frequentie_60 <- 2
relatieve_frequentie_120 <- 0.33
percentage_120 <- 33.33
cumulatieve_frequentie_90 <- 1
cumulatief_percentage_90 <- 66.67
```

  - **Waarschijnlijke redenering:** Voor onderdeel 4 (cumulatieve frequentie tot 90) vulde je 1 in. **Waarom dit niet klopt:** Tot en met 90 omvat de waarden 30, 60, 60 en 90.

- Foute testinvoer voor `cumulatief_percentage_90` (alle andere velden blijven correct):

```r
# Vul de vijf berekende waarden in.
frequentie_60 <- 2
relatieve_frequentie_120 <- 0.33
percentage_120 <- 33.33
cumulatieve_frequentie_90 <- 4
cumulatief_percentage_90 <- 67.67
```

  - **Waarschijnlijke redenering:** Voor onderdeel 5 (cumulatief percentage tot 90) vulde je 67.67 in. **Waarom dit niet klopt:** De cumulatieve proportie is vier zesde; vermenigvuldig die ongeronde breuk met 100.

### Oef - 3.9 Huwelijksduur - Uitbijters en centraliteit

Bronmap: `Hoofdstuk_3_De univariate beschrijvende statistiek/Oef - 3.4.4 Centraliteit en spreiding - Beroemde huwelijken`

#### Correcte inzending

Kopieerbare, volledig ingevulde boilerplate:

```r
# Vul drie berekeningen en daarna het nummer van de gekozen optie in.
mediaan_eerste_reeks <- 30
gemiddelde_met_uitbijter <- 120
mediaan_met_uitbijter <- 50
beste_centraliteitsmaat <- 2
```

#### Foute testinvoer en misvattingen

- Foute testinvoer voor `mediaan_eerste_reeks` (alle andere velden blijven correct):

```r
# Vul drie berekeningen en daarna het nummer van de gekozen optie in.
mediaan_eerste_reeks <- 31
gemiddelde_met_uitbijter <- 120
mediaan_met_uitbijter <- 50
beste_centraliteitsmaat <- 2
```

  - **Waarschijnlijke redenering:** Voor onderdeel 1 (eerste mediaan) vulde je 31 in. **Waarom dit niet klopt:** Bij vijf geordende waarden is de mediaan de derde waarde.

- Foute testinvoer voor `gemiddelde_met_uitbijter` (alle andere velden blijven correct):

```r
# Vul drie berekeningen en daarna het nummer van de gekozen optie in.
mediaan_eerste_reeks <- 30
gemiddelde_met_uitbijter <- 121
mediaan_met_uitbijter <- 50
beste_centraliteitsmaat <- 2
```

  - **Waarschijnlijke redenering:** Voor onderdeel 2 (gemiddelde met uitbijter) vulde je 121 in. **Waarom dit niet klopt:** Het gemiddelde gebruikt alle vijf waarden, inclusief 420, en is de som gedeeld door vijf.

- Foute testinvoer voor `mediaan_met_uitbijter` (alle andere velden blijven correct):

```r
# Vul drie berekeningen en daarna het nummer van de gekozen optie in.
mediaan_eerste_reeks <- 30
gemiddelde_met_uitbijter <- 120
mediaan_met_uitbijter <- 51
beste_centraliteitsmaat <- 2
```

  - **Waarschijnlijke redenering:** Voor onderdeel 3 (mediaan met uitbijter) vulde je 51 in. **Waarom dit niet klopt:** De mediaan is de derde waarde van de geordende reeks en blijft 50.

- Foute testinvoer voor `beste_centraliteitsmaat` (alle andere velden blijven correct):

```r
# Vul drie berekeningen en daarna het nummer van de gekozen optie in.
mediaan_eerste_reeks <- 30
gemiddelde_met_uitbijter <- 120
mediaan_met_uitbijter <- 50
beste_centraliteitsmaat <- 1
```

  - **Waarschijnlijke redenering:** Voor onderdeel 4 (beste centraliteitsmaat) vulde je 1 in. **Waarom dit niet klopt:** De sterke uitbijter trekt het gemiddelde omhoog; de mediaan blijft dichter bij de vier typische waarden.

### Oef - 3.10 Huwelijksduur - Afwijking en kwadraat

Bronmap: `Hoofdstuk_3_De univariate beschrijvende statistiek/Oef - 3.4.6 Afwijking en kwadraat - Huwelijksduur`

#### Correcte inzending

Kopieerbare, volledig ingevulde boilerplate:

```r
# Vul de getallen in na <-.
gemiddelde <- 30
afwijking_20 <- -10
gekwadrateerde_afwijking_20 <- 100
```

#### Foute testinvoer en misvattingen

- Foute testinvoer voor `gemiddelde` (alle andere velden blijven correct):

```r
# Vul de getallen in na <-.
gemiddelde <- 31
afwijking_20 <- -10
gekwadrateerde_afwijking_20 <- 100
```

  - **Waarschijnlijke redenering:** Je hebt een verwante grootheid of tussenstap ingevuld. **Waarom dit niet klopt:** De ingevulde waarde beantwoordt niet precies de gevraagde statistische vraag.

- Foute testinvoer voor `afwijking_20` (alle andere velden blijven correct):

```r
# Vul de getallen in na <-.
gemiddelde <- 30
afwijking_20 <- 10
gekwadrateerde_afwijking_20 <- 100
```

  - **Waarschijnlijke redenering:** Je hebt de absolute afstand genomen of de aftrekking omgekeerd. **Waarom dit niet klopt:** Twintig ligt onder het gemiddelde en heeft daarom een negatieve getekende afwijking.

- Foute testinvoer voor `gekwadrateerde_afwijking_20` (alle andere velden blijven correct):

```r
# Vul de getallen in na <-.
gemiddelde <- 30
afwijking_20 <- -10
gekwadrateerde_afwijking_20 <- 101
```

  - **Waarschijnlijke redenering:** Het gemiddelde klopt, maar een vervolgstap gebruikt een verkeerd teken of een verkeerde bewerking. **Waarom dit niet klopt:** Beide vervolgwaarden moeten rechtstreeks uit 20 − gemiddelde volgen.

### Oef - 3.11 Huwelijksduur - Bijdrage aan de spreiding

Bronmap: `Hoofdstuk_3_De univariate beschrijvende statistiek/Oef - 3.4.7 Bijdrage aan de spreiding - Huwelijksduur`

#### Correcte inzending

Kopieerbare, volledig ingevulde boilerplate:

```r
# Vul de kwadraten in en kies daarna 1 (huwelijk A) of 2 (huwelijk B).
kwadraat_20 <- 400
kwadraat_100 <- 3600
grootste_bijdrage <- 2
```

#### Foute testinvoer en misvattingen

- Foute testinvoer voor `kwadraat_20` (alle andere velden blijven correct):

```r
# Vul de kwadraten in en kies daarna 1 (huwelijk A) of 2 (huwelijk B).
kwadraat_20 <- 401
kwadraat_100 <- 3600
grootste_bijdrage <- 2
```

  - **Waarschijnlijke redenering:** Je hebt een verwante grootheid of tussenstap ingevuld. **Waarom dit niet klopt:** De ingevulde waarde beantwoordt niet precies de gevraagde statistische vraag.

- Foute testinvoer voor `kwadraat_100` (alle andere velden blijven correct):

```r
# Vul de kwadraten in en kies daarna 1 (huwelijk A) of 2 (huwelijk B).
kwadraat_20 <- 400
kwadraat_100 <- 3601
grootste_bijdrage <- 2
```

  - **Waarschijnlijke redenering:** Je hebt een verwante grootheid of tussenstap ingevuld. **Waarom dit niet klopt:** De ingevulde waarde beantwoordt niet precies de gevraagde statistische vraag.

- Foute testinvoer voor `grootste_bijdrage` (alle andere velden blijven correct):

```r
# Vul de kwadraten in en kies daarna 1 (huwelijk A) of 2 (huwelijk B).
kwadraat_20 <- 400
kwadraat_100 <- 3600
grootste_bijdrage <- 1
```

  - **Waarschijnlijke redenering:** Je hebt de laagste waarneming gekozen in plaats van de grootste afstand tot het gemiddelde. **Waarom dit niet klopt:** Niet hoog of laag op zichzelf, maar de absolute afstand tot 40 bepaalt de bijdrage.

### Oef - 3.12 Huwelijksduur - Variantie en standaardafwijking

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

### Oef - 3.13 Politie-incidenten - Passende spreidingsmaat

Bronmap: `Hoofdstuk_3_De univariate beschrijvende statistiek/Oef - 3.5 Beschrijvende statistiek - Politiepatrouille en incidenten`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Vul het antwoord in na <-.
spreidingsmaat <- 1
```

#### Foute testinvoer en misvattingen

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
spreidingsmaat <- 2
```

  - Misvatting: **Waarschijnlijke redenering:** Je kiest een robuuste maat terwijl de context geen sterke uitbijters of scheefheid vermeldt.

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
spreidingsmaat <- 3
```

  - Misvatting: **Waarschijnlijke redenering:** De modus is een centrummaat en geen spreidingsmaat.

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
spreidingsmaat <- 4
```

  - Misvatting: **Waarschijnlijke redenering:** De mediaan is eveneens een centrummaat.

- Ongeldige of ontbrekende invoer:

```r
spreidingsmaat <-
```

  - Misvatting: geen eindig getal ingevuld; de evaluator geeft de aparte route **Waarom dit niet klopt**, **Denkregel** en **Volgende stap**.
