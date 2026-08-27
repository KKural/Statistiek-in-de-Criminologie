# Antwoordbank — Hoofdstuk 6

> Alleen voor docenten en technische validatie. De correcte inzendingen zijn rechtstreeks afgeleid van de canonieke `evaluation/Answer.R`-bestanden en door die evaluatoren gevalideerd.

## Gebruik

- **Correcte inzending** is een volledig ingevulde versie van de boilerplate, of het juiste optienummer bij een keuzeoefening.
- Een **Foute testinvoer** wijzigt steeds precies één antwoord terwijl de andere antwoorden correct blijven.
- De uitleg na elke foute invoer benoemt de bijbehorende misvatting en gerichte feedbackroute.

### Oef - 6.1 Causale relaties herkennen

Bronmap: `Hoofdstuk_6_Inleiding tot de bivariate beschrijvende statistiek/Oef - 6.1`

#### Correcte inzending

Kopieerbare, volledig ingevulde boilerplate:

```r
# Vul voor elke vraag één optienummer in.
causale_stelling <- 3
contributieve_oorzaak <- 2
asymmetrische_relatie <- 3
generatieve_causaliteit <- 2
```

#### Foute testinvoer en misvattingen

- Foute testinvoer voor `causale_stelling` (alle andere velden blijven correct):

```r
# Vul voor elke vraag één optienummer in.
causale_stelling <- 1
contributieve_oorzaak <- 2
asymmetrische_relatie <- 3
generatieve_causaliteit <- 2
```

  - **Waarschijnlijke redenering:** je behandelt statistische samenhang als voldoende causaal bewijs. **Waarom dit niet klopt:** causaliteit impliceert een populatiesamenhang, maar samenhang alleen sluit derde variabelen, omgekeerde richting of toeval niet uit.

- Foute testinvoer voor `contributieve_oorzaak` (alle andere velden blijven correct):

```r
# Vul voor elke vraag één optienummer in.
causale_stelling <- 3
contributieve_oorzaak <- 1
asymmetrische_relatie <- 3
generatieve_causaliteit <- 2
```

  - **Waarschijnlijke redenering:** je gebruikt een deterministisch model waarin één factor noodzakelijk én voldoende moet zijn. **Waarom dit niet klopt:** criminologische uitkomsten ontstaan meestal via meerdere routes; afzonderlijke factoren verhogen vaak slechts de kans.

- Foute testinvoer voor `asymmetrische_relatie` (alle andere velden blijven correct):

```r
# Vul voor elke vraag één optienummer in.
causale_stelling <- 3
contributieve_oorzaak <- 2
asymmetrische_relatie <- 1
generatieve_causaliteit <- 2
```

  - **Waarschijnlijke redenering:** je hebt gezamenlijke verandering geïnterpreteerd als wederzijdse beïnvloeding. **Waarom dit niet klopt:** asymmetrie betekent dat theorie een richting X → Y veronderstelt; de cijfers alleen bepalen die richting niet.

- Foute testinvoer voor `generatieve_causaliteit` (alle andere velden blijven correct):

```r
# Vul voor elke vraag één optienummer in.
causale_stelling <- 3
contributieve_oorzaak <- 2
asymmetrische_relatie <- 3
generatieve_causaliteit <- 1
```

  - **Waarschijnlijke redenering:** je hebt een vergelijking met een tegenfeitelijke toestand gekozen in plaats van een werkingsmechanisme. **Waarom dit niet klopt:** generatieve of productieve causaliteit vraagt hoe een oorzaak via een mechanisme een effect voortbrengt.

### Oef - 6.2 Bivariate beschrijving en methodekeuze

Bronmap: `Hoofdstuk_6_Inleiding tot de bivariate beschrijvende statistiek/Oef - 6.5`

#### Correcte inzending

Kopieerbare, volledig ingevulde boilerplate:

```r
# Vul voor elke vraag één optienummer in.
doel_bivariate_statistiek <- 3
kruistabel_metrisch <- 2
keuze_associatiemaat <- 2
```

#### Foute testinvoer en misvattingen

- Foute testinvoer voor `doel_bivariate_statistiek` (alle andere velden blijven correct):

```r
# Vul voor elke vraag één optienummer in.
doel_bivariate_statistiek <- 1
kruistabel_metrisch <- 2
keuze_associatiemaat <- 2
```

  - **Waarschijnlijke redenering:** je hebt beschrijvende samenhang verward met definitief causaal bewijs. **Waarom dit niet klopt:** bivariate beschrijvende statistiek vat de sterkte, richting en vorm van een relatie tussen twee variabelen samen.

- Foute testinvoer voor `kruistabel_metrisch` (alle andere velden blijven correct):

```r
# Vul voor elke vraag één optienummer in.
doel_bivariate_statistiek <- 3
kruistabel_metrisch <- 1
keuze_associatiemaat <- 2
```

  - **Waarschijnlijke redenering:** je hebt de geschiktheid van kruistabellen voor categorieën omgekeerd. **Waarom dit niet klopt:** bij veel unieke metrische waarden ontstaan te veel rijen en kolommen; een scatterplot of correlatiemaat is dan meestal duidelijker.

- Foute testinvoer voor `keuze_associatiemaat` (alle andere velden blijven correct):

```r
# Vul voor elke vraag één optienummer in.
doel_bivariate_statistiek <- 3
kruistabel_metrisch <- 2
keuze_associatiemaat <- 1
```

  - **Waarschijnlijke redenering:** je laat steekproefkenmerken de inhoudelijke methodekeuze volledig bepalen. **Waarom dit niet klopt:** het meetniveau bepaalt welke berekeningen betekenisvol zijn; theoretische richting bepaalt of een symmetrische of asymmetrische maat past.
