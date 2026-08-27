# Antwoordbank — Hoofdstuk 4

> Alleen voor docenten en technische validatie. De correcte inzendingen zijn rechtstreeks afgeleid van de canonieke `evaluation/Answer.R`-bestanden en door die evaluatoren gevalideerd.

## Gebruik

- **Correcte inzending** is een volledig ingevulde versie van de boilerplate, of het juiste optienummer bij een keuzeoefening.
- Een **Foute testinvoer** vervangt alleen de getoonde regel of keuze.
- De uitleg bij foute invoer beschrijft de bijbehorende misvatting en feedbackroute.

### Oef - 4.1 Kansbegrip en Laplace-kans

Bronmap: `Hoofdstuk_4_Een inleiding in kansrekeren/Oef - 4.1 Kansbegrip en Laplace-kans`

#### Correcte inzending

Selecteer deze optie:

```r
2
```

#### Foute testinvoer en misvattingen

- Foute testinvoer: `1`
  - Misvatting: **Waarom deze keuze begrijpelijk kan lijken:** negatieve waarden komen voor bij afwijkingen, veranderingen en sommige statistische maten; je hebt zo'n schaal mogelijk op een kans toegepast.
- Foute testinvoer: `3`
  - Misvatting: **Waarom deze keuze begrijpelijk kan lijken:** de relatieve frequentie nadert bij veel herhalingen de theoretische kans, waardoor 'nadert' mogelijk als 'is altijd exact gelijk' is gelezen.
- Foute testinvoer: `4`
  - Misvatting: **Waarom deze keuze begrijpelijk kan lijken:** de verhouding N(A)/N is een bekende kansformule en kan daardoor als definitie voor elke soort kans zijn opgevat.
- Foute testinvoer: `5`
  - Misvatting: **Waarom dit niet klopt:** de evaluator kan de inhoudelijke keuze alleen beoordelen wanneer je één getal van 1 tot en met 4 invoert.

### Oef - 4.2 Algemene somregel bij overlap

Bronmap: `Hoofdstuk_4_Een inleiding in kansrekeren/Oef - 4.2 Algemene somregel bij overlap`

#### Correcte inzending

Selecteer deze optie:

```r
2
```

#### Foute testinvoer en misvattingen

- Foute testinvoer: `1`
  - Misvatting: **Waarom deze keuze begrijpelijk kan lijken:** optellen past bij het woord 'of', maar je hebt mogelijk de expliciete overlap tussen A en B buiten beschouwing gelaten.
- Foute testinvoer: `3`
  - Misvatting: **Waarom deze keuze begrijpelijk kan lijken:** vermenigvuldigen is een centrale kansregel en kan worden geassocieerd met het combineren van twee gebeurtenissen.
- Foute testinvoer: `4`
  - Misvatting: **Waarom deze keuze begrijpelijk kan lijken:** de overlap A ∩ B komt in de vraag voor en je hebt die mogelijk gekoppeld aan de formule voor een voorwaardelijke kans.
- Foute testinvoer: `5`
  - Misvatting: **Waarom dit niet klopt:** de evaluator kan de gekozen formule alleen beoordelen wanneer je één getal van 1 tot en met 4 invoert.

### Oef - 4.3 Disjuncte en onafhankelijke gebeurtenissen

Bronmap: `Hoofdstuk_4_Een inleiding in kansrekeren/Oef - 4.3 Disjuncte en onafhankelijke gebeurtenissen`

#### Correcte inzending

Selecteer deze optie:

```r
2
```

#### Foute testinvoer en misvattingen

- Foute testinvoer: `1`
  - Misvatting: **Waarom deze keuze begrijpelijk kan lijken:** 'kunnen niet samen voorkomen' kan intuïtief klinken alsof de gebeurtenissen niets met elkaar te maken hebben. Dat is echter niet de statistische betekenis van onafhankelijkheid.
- Foute testinvoer: `3`
  - Misvatting: **Waarom deze keuze begrijpelijk kan lijken:** de categorieën hebben verschillende labels, waardoor je ze mogelijk als afzonderlijke, onafhankelijke kenmerken hebt behandeld.
- Foute testinvoer: `4`
  - Misvatting: **Waarom deze keuze begrijpelijk kan lijken:** in de werkelijkheid kan één incident meerdere kenmerken hebben; je hebt die inhoudelijke mogelijkheid wellicht verward met de hier vastgelegde primaire registratiecategorie.
- Foute testinvoer: `5`
  - Misvatting: **Waarom dit niet klopt:** de evaluator kan de gekozen uitspraak alleen beoordelen wanneer je één getal van 1 tot en met 4 invoert.

### Oef - 4.4 Woninginbraak of geweldsmisdrijf

Bronmap: `Hoofdstuk_4_Een inleiding in kansrekeren/Oef - 4.4 Woninginbraak of geweldsmisdrijf`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Vervang beide ??? door je antwoord.
# Geef proporties met twee decimalen, met een punt en zonder procentteken.

# 1) P(woninginbraak of geweldsmisdrijf)
kans_inbraak_of_geweld <- 0.64

# 2) P(geen woninginbraak en geen geweldsmisdrijf)
kans_geen_van_beide <- 0.36
```

#### Foute testinvoer en misvattingen

- Foute testinvoer: `kans_inbraak_of_geweld <- 1`
  - Misvatting: **Waarschijnlijke redenering:** de afwijkende waarde kan passen bij een rekenfout of een andere interpretatie van 'of'; het eindgetal alleen laat geen eenduidiger conclusie toe.
- Foute testinvoer: `kans_inbraak_of_geweld <- 0.36`
  - Misvatting: **Waarschijnlijke redenering:** het eerste antwoord komt overeen met het complement en kan passen bij het verwisselen van de twee gevraagde velden.
- Foute testinvoer: `kans_inbraak_of_geweld <- 64`
  - Misvatting: **Waarschijnlijke redenering:** de waarde 64 kan passen bij een correcte omzetting naar procent, terwijl de vraag om een proportie vroeg.
- Foute testinvoer: `kans_inbraak_of_geweld <- 0.0943`
  - Misvatting: **Waarschijnlijke redenering:** de waarde ligt bij 0.23×0.41 en kan dus passen bij het toepassen van een productregel.
- Foute testinvoer: `kans_inbraak_of_geweld <- 0.18`
  - Misvatting: **Waarschijnlijke redenering:** de waarde 0.18 kan passen bij het aftrekken van de twee gegeven kansen.
- Foute testinvoer: `kans_inbraak_of_geweld <- 0.23`
  - Misvatting: **Waarschijnlijke redenering:** het eerste antwoord komt overeen met één van de twee afzonderlijke categorieën; mogelijk is slechts één gebeurtenis meegeteld.
- Foute testinvoer: `kans_inbraak_of_geweld <- 36`
  - Misvatting: **Waarschijnlijke redenering:** de ingevoerde waarde valt buiten het interval voor proporties; mogelijk zijn schaal of rekenbewerking verwisseld.
- Foute testinvoer: `kans_geen_van_beide <- 1`
  - Misvatting: **Waarschijnlijke redenering:** de afwijkende waarde kan passen bij een rekenfout of een onvolledige complementstap; het eindgetal alleen laat geen eenduidiger conclusie toe.
- Foute testinvoer: `kans_geen_van_beide <- 0.64`
  - Misvatting: **Waarschijnlijke redenering:** de uniewaarde lijkt in het tweede veld te zijn herhaald; mogelijk is de complementstap overgeslagen.
- Foute testinvoer: `kans_geen_van_beide <- 64`
  - Misvatting: **Waarschijnlijke redenering:** de ingevoerde waarde valt buiten het interval voor proporties; mogelijk zijn schaal of volgorde van aftrekken verwisseld.
- Foute testinvoer: `kans_geen_van_beide <- 36`
  - Misvatting: **Waarschijnlijke redenering:** de waarde 36 kan passen bij een correcte complementkans in procentvorm, terwijl een proportie werd gevraagd.
- Foute testinvoer: `kans_geen_van_beide <- 0.77`
  - Misvatting: **Waarschijnlijke redenering:** de waarde kan passen bij het complement van slechts één categorie: 1−0.23 of 1−0.41.
- Foute testinvoer: `kans_geen_van_beide <- 0.9057`
  - Misvatting: **Waarschijnlijke redenering:** de waarde ligt bij 1−(0.23×0.41) en kan passen bij een product vóór de complementstap.

### Oef - 4.5 Diplomaontvangers - Kansregels

Bronmap: `Hoofdstuk_4_Een inleiding in kansrekeren/Oef - 4.5 Diplomaontvangers - Kansregels`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Vul elk berekend getal in na `<-`.

# Stap 1: marginale kans P(man)
p_man <- 0.4244

# Stap 2: voorwaardelijke kans P(bachelor | man)
p_bachelor_given_man <- 0.6776

# Stap 3: gezamenlijke kans P(man en bachelor)
p_man_and_bachelor <- 0.2876
```

#### Foute testinvoer en misvattingen

- Foute testinvoer: `p_man <- 1`
  - Misvatting: **Waarom dit niet klopt:** `1` komt niet overeen met `825/1944`, afgerond op vier decimalen.
- Foute testinvoer: `p_man <- 0.5756`
  - Misvatting: **Waarschijnlijke redenering:** deze waarde is consistent met het aandeel vrouwen, `1119/1944`. Dezelfde waarde kan ook via een andere rekenroute ontstaan.
- Foute testinvoer: `p_man <- 825`
  - Misvatting: **Waarschijnlijke redenering:** 825 is het juiste aantal mannen, maar nog geen kans.
- Foute testinvoer: `p_bachelor_given_man <- 1`
  - Misvatting: **Waarom dit niet klopt:** gebruik de cel 559 als teller en het mannentotaal 825 als noemer.
- Foute testinvoer: `p_bachelor_given_man <- 0.2876`
  - Misvatting: **Waarschijnlijke redenering:** deze waarde is de gezamenlijke kans `559/1944`.
- Foute testinvoer: `p_bachelor_given_man <- 0.6908`
  - Misvatting: **Waarschijnlijke redenering:** deze waarde is consistent met de marginale bachelorkans `1343/1944`; de voorwaarde 'gegeven man' is dan niet toegepast.
- Foute testinvoer: `p_bachelor_given_man <- 0.4162`
  - Misvatting: **Waarschijnlijke redenering:** deze waarde past bij de omgekeerde kans `P(man | bachelor)=559/1343`. Dezelfde uitkomst kan ook via een andere route ontstaan.
- Foute testinvoer: `p_man_and_bachelor <- 1`
  - Misvatting: **Waarom dit niet klopt:** `1` voldoet niet aan beide equivalente routes.
- Foute testinvoer: `p_man_and_bachelor <- 0.6776`
  - Misvatting: **Waarschijnlijke redenering:** deze waarde is alleen `P(bachelor | man)`; de marginale kans op een man is nog niet verwerkt.
- Foute testinvoer: `p_man_and_bachelor <- 0.2932`
  - Misvatting: **Waarschijnlijke redenering:** deze waarde is consistent met `P(man) × P(bachelor)`, alsof geslacht en diplomatype onafhankelijk zijn. Dat is een voorzichtige diagnose op basis van het getal.
- Foute testinvoer: `p_man_and_bachelor <- 559`
  - Misvatting: **Waarschijnlijke redenering:** 559 is de juiste gezamenlijke cel, maar nog geen kans.

### Oef - 4.6 Verdachten en drugsmisdrijven - Productregel

Bronmap: `Hoofdstuk_4_Een inleiding in kansrekeren/Oef - 4.6 Verdachten en drugsmisdrijven - Productregel`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Vul elk berekend getal in na `<-`.

# Stap 1: marginale kans P(man)
p_man <- 0.8503

# Stap 2: voorwaardelijke kans P(drugsmisdrijf | man)
p_drug_given_man <- 0.12

# Stap 3: gezamenlijke kans P(man en drugsmisdrijf)
p_joint <- 0.102
```

#### Foute testinvoer en misvattingen

- Foute testinvoer: `p_man <- 1`
  - Misvatting: **Waarom dit niet klopt:** `1` komt niet overeen met die verhouding op vier decimalen.
- Foute testinvoer: `p_man <- 0.1497`
  - Misvatting: **Waarschijnlijke redenering:** deze waarde is consistent met `P(vrouw)=22/147`, het complement van de gevraagde kans. Dezelfde waarde kan ook via een andere route ontstaan.
- Foute testinvoer: `p_man <- 125`
  - Misvatting: **Waarschijnlijke redenering:** 125 is het juiste aantal mannelijke verdachten, maar nog geen kans.
- Foute testinvoer: `p_drug_given_man <- 1`
  - Misvatting: **Waarom dit niet klopt:** de gekozen noemer past niet bij de gegeven groep.
- Foute testinvoer: `p_drug_given_man <- 0.102`
  - Misvatting: **Waarschijnlijke redenering:** deze waarde is de gezamenlijke kans `15/147`.
- Foute testinvoer: `p_drug_given_man <- 0.1224`
  - Misvatting: **Waarschijnlijke redenering:** deze waarde is consistent met de marginale kans op een drugsmisdrijf, `18/147`; de voorwaarde 'gegeven man' is dan niet toegepast.
- Foute testinvoer: `p_drug_given_man <- 0.8333`
  - Misvatting: **Waarschijnlijke redenering:** deze waarde past bij de omgekeerde kans `P(man | drugsmisdrijf)=15/18`. Dit blijft een voorzichtige diagnose op basis van het getal.
- Foute testinvoer: `p_joint <- 1`
  - Misvatting: **Waarom dit niet klopt:** `1` voldoet niet aan die controle.
- Foute testinvoer: `p_joint <- 0.12`
  - Misvatting: **Waarschijnlijke redenering:** deze waarde bevat alleen `P(drugsmisdrijf | man)`; de kans om eerst in de mannengroep te vallen ontbreekt.
- Foute testinvoer: `p_joint <- 0.1041`
  - Misvatting: **Waarschijnlijke redenering:** deze waarde is consistent met `P(man) × P(drugsmisdrijf)`, alsof de gebeurtenissen onafhankelijk zijn. De diagnose is gebaseerd op de numerieke overeenkomst.
- Foute testinvoer: `p_joint <- 15`
  - Misvatting: **Waarschijnlijke redenering:** 15 is de juiste gezamenlijke frequentie, maar geen kans.

### Oef - 4.7 Algemene somregel - Kans op A of B

Bronmap: `Hoofdstuk_4_Een inleiding in kansrekeren/Oef - 4.7 Vrouw of diefstal - Algemene somregel`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Vul het antwoord in na <-.
kans_a_of_b <-0.8
```

#### Foute testinvoer en misvattingen

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
kans_a_of_b <-1.1
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt de kansen opgeteld zonder de overlap af te trekken.

- Foute testinvoer:

```r
# Vul het antwoord in na <-.
kans_a_of_b <-0.3
```

  - Misvatting: **Waarschijnlijke redenering:** Je hebt alleen de doorsnede ingevuld in plaats van de unie.

- Ongeldige of ontbrekende invoer:

```r
kans_a_of_b <-
```

  - Misvatting: geen eindig getal ingevuld; de evaluator geeft de aparte route **Waarom dit niet klopt**, **Denkregel** en **Volgende stap**.

### Oef - 4.8 Richting van voorwaardelijke kansen

Bronmap: `Hoofdstuk_4_Een inleiding in kansrekeren/Oef - 4.8 Richting van voorwaardelijke kansen`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Vul elk berekend getal in na `<-`.

# P(drugsmisdrijf | man)
p_drug_given_man <- 0.12

# P(man | drugsmisdrijf)
p_man_given_drug <- 0.8333
```

#### Foute testinvoer en misvattingen

- Foute testinvoer: `p_drug_given_man <- 1`
  - Misvatting: **Waarom dit niet klopt:** gebruik `15/125` voor dit veld.
- Foute testinvoer: `p_drug_given_man <- 0.8333`
  - Misvatting: **Waarschijnlijke redenering:** deze waarde is consistent met het verwisselen van de twee voorwaardelijke kansen. Dezelfde waarde kan ook via een andere route ontstaan.
- Foute testinvoer: `p_drug_given_man <- 0.1224`
  - Misvatting: **Waarschijnlijke redenering:** deze waarde past bij de marginale kans `P(drugsmisdrijf)=18/147`; de voorwaarde is dan genegeerd.
- Foute testinvoer: `p_drug_given_man <- 0.102`
  - Misvatting: **Waarschijnlijke redenering:** deze waarde is de gezamenlijke kans `P(man ∩ drugsmisdrijf)=15/147`.
- Foute testinvoer: `p_man_given_drug <- 0.12`
  - Misvatting: **Waarschijnlijke redenering:** deze waarde is consistent met het verwisselen van `P(man | drugsmisdrijf)` en `P(drugsmisdrijf | man)`. Dit is een voorzichtige diagnose op basis van het getal.
- Foute testinvoer: `p_man_given_drug <- 0.8503`
  - Misvatting: **Waarschijnlijke redenering:** deze waarde past bij de marginale kans `P(man)=125/147`; de voorwaarde is dan niet toegepast.

### Oef - 4.9 Permutatie of combinatie

Bronmap: `Hoofdstuk_4_Een inleiding in kansrekeren/Oef - 4.9 Permutatie of combinatie`

#### Correcte inzending

Selecteer deze optie:

```r
4
```

#### Foute testinvoer en misvattingen

- Foute testinvoer: `1`
  - Misvatting: **Waarschijnlijke redenering:** je behandelt mogelijk alle 41 balletjes alsof ze volledig moeten worden gerangschikt. Dit is een voorzichtige hypothese op basis van je keuze.
- Foute testinvoer: `2`
  - Misvatting: **Waarschijnlijke redenering:** je ziet mogelijk zes opeenvolgende trekkingen en gebruikt daarom voor elke trekking opnieuw 41 mogelijkheden. Dit is een voorzichtige hypothese op basis van je keuze.
- Foute testinvoer: `3`
  - Misvatting: **Waarschijnlijke redenering:** je houdt rekening met trekken zonder teruglegging, maar telt verschillende volgordes mogelijk nog als verschillende uitkomsten. Dit is een voorzichtige hypothese op basis van je keuze.
- Foute testinvoer: `5`
  - Misvatting: **Waarom dit niet klopt:** de evaluator kan alleen een inhoudelijke keuze beoordelen wanneer exact één getal van 1 tot en met 4 is ingevoerd.

### Oef - 4.10 Herhaalde objecten - Multisetpermutatie

Bronmap: `Hoofdstuk_4_Een inleiding in kansrekeren/Oef - 4.10 Herhaalde objecten - Multisetpermutatie`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# A, A, B, B, B, C, C, C
# Geef één geheel getal.
aantal_rangschikkingen <- 560
```

#### Foute testinvoer en misvattingen

- Foute testinvoer: `aantal_rangschikkingen <- 1`
  - Misvatting: **Waarschijnlijke redenering:** uit alleen deze eindwaarde is de precieze denkstap niet zeker; mogelijk is een faculteit, herhalingsfactor of deling onvolledig toegepast.
- Foute testinvoer: `aantal_rangschikkingen <- 40320`
  - Misvatting: **Waarschijnlijke redenering:** deze waarde is consistent met `8!`, alsof alle acht labels verschillend zijn. Dezelfde waarde kan ook via een andere route ontstaan.
- Foute testinvoer: `aantal_rangschikkingen <- 72`
  - Misvatting: **Waarschijnlijke redenering:** deze waarde is consistent met alleen de correctiefactor `2! × 3! × 3!`. Dezelfde waarde kan ook via een andere route ontstaan.
- Foute testinvoer: `aantal_rangschikkingen <- 28`
  - Misvatting: **Waarschijnlijke redenering:** deze waarde past bij het kiezen van alleen de twee A-posities, `C(8,2)`. Dezelfde waarde kan ook via een andere route ontstaan.

### Oef - 4.11 Grensgevallen combinaties en lotto

Bronmap: `Hoofdstuk_4_Een inleiding in kansrekeren/Oef - 4.11 Grensgevallen combinaties en lotto`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Geef drie gehele getallen.
combinatie_8_0 <- 1
combinatie_5_5 <- 1
lotto_combinaties <- 4496388
```

#### Foute testinvoer en misvattingen

- Foute testinvoer: `combinatie_8_0 <- 0.000001`
  - Misvatting: **Waarschijnlijke redenering:** uit de eindwaarde is de precieze route niet zeker; mogelijk zijn `0! = 1` of de betekenis van een grensgeval niet toegepast.
- Foute testinvoer: `combinatie_8_0 <- 0`
  - Misvatting: **Waarschijnlijke redenering:** je koppelt ‘geen object kiezen’ mogelijk aan nul mogelijkheden. Dit is een voorzichtige hypothese op basis van de waarde.
- Foute testinvoer: `combinatie_8_0 <- 40320`
  - Misvatting: **Waarschijnlijke redenering:** de waarde is consistent met `8!`, alsof alle objecten worden gerangschikt. Dezelfde waarde kan ook anders ontstaan.
- Foute testinvoer: `lotto_combinaties <- 1`
  - Misvatting: **Waarschijnlijke redenering:** uit de eindwaarde is de precieze route niet zeker; mogelijk is volgorde of teruglegging anders geïnterpreteerd.
- Foute testinvoer: `lotto_combinaties <- 3237399360`
  - Misvatting: **Waarschijnlijke redenering:** deze waarde is consistent met `41!/(41-6)!`, waarbij volgordes afzonderlijk worden geteld. Dezelfde waarde kan ook anders ontstaan.
- Foute testinvoer: `lotto_combinaties <- 4750104241`
  - Misvatting: **Waarschijnlijke redenering:** deze waarde past bij `41^6`, met 41 mogelijkheden bij elk van zes posities. Dezelfde waarde kan ook anders ontstaan.

### Oef - 4.12 Permutaties van objecten en examenvragen

Bronmap: `Hoofdstuk_4_Een inleiding in kansrekeren/Oef - 4.12 Permutaties van objecten en examenvragen`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Geef twee gehele getallen.
permutaties_7 <- 5040
permutaties_10 <- 3628800
```

#### Foute testinvoer en misvattingen

- Foute testinvoer: `permutaties_7 <- 1`
  - Misvatting: **Waarschijnlijke redenering:** uit de eindwaarde is de precieze route niet zeker; mogelijk is de faculteit te vroeg gestopt of is opgeteld in plaats van vermenigvuldigd.
- Foute testinvoer: `permutaties_7 <- 7`
  - Misvatting: **Waarschijnlijke redenering:** je geeft mogelijk alleen het aantal objecten, zonder de afnemende keuzemogelijkheden voor de volgende posities mee te tellen. Dit is een voorzichtige hypothese.
- Foute testinvoer: `permutaties_7 <- 2520`
  - Misvatting: **Waarschijnlijke redenering:** deze waarde is consistent met een faculteitsproduct waarin één factor ontbreekt. Dezelfde waarde kan ook via een andere route ontstaan.

### Oef - 4.13 Doodsoorzaken - Somregel en complement

Bronmap: `Hoofdstuk_4_Een inleiding in kansrekeren/Oef - 4.13 Doodsoorzaken - Somregel en complement`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# Geef proporties met twee decimalen, bijvoorbeeld 0.25.
kans_schot_of_wurging <- 0.67
kans_andere_oorzaak <- 0.33
```

#### Foute testinvoer en misvattingen

- Foute testinvoer: `kans_schot_of_wurging <- 1`
  - Misvatting: **Waarschijnlijke redenering:** uit de eindwaarde is de precieze route niet zeker; mogelijk zijn ‘of’, disjunctie of de schaal van het antwoord anders geïnterpreteerd.
- Foute testinvoer: `kans_schot_of_wurging <- 0.099`
  - Misvatting: **Waarschijnlijke redenering:** deze waarde is consistent met `0.45 × 0.22`, alsof ‘of’ om de productregel vraagt. Dezelfde waarde kan ook anders ontstaan.
- Foute testinvoer: `kans_schot_of_wurging <- 67`
  - Misvatting: **Waarschijnlijke redenering:** 67 is het correcte percentage, maar niet de gevraagde proportie. Dezelfde waarde kan ook anders ontstaan.
- Foute testinvoer: `kans_andere_oorzaak <- 1`
  - Misvatting: **Waarschijnlijke redenering:** uit de eindwaarde is de precieze route niet zeker; mogelijk is het complement vóór het samenvoegen van de twee categorieën genomen.
- Foute testinvoer: `kans_andere_oorzaak <- 0.67`
  - Misvatting: **Waarschijnlijke redenering:** je hebt mogelijk de kans op schotwonde of wurging opnieuw ingevuld. Dit is een voorzichtige hypothese op basis van de waarde.
- Foute testinvoer: `kans_andere_oorzaak <- 0.55`
  - Misvatting: **Waarschijnlijke redenering:** deze waarde past bij het complement van slechts één oorzaak. Dezelfde waarde kan ook anders ontstaan.

### Oef - 4.14 Optionele verdieping - Binomiale kans

Bronmap: `Hoofdstuk_4_Een inleiding in kansrekeren/Oef - 4.14 Optionele verdieping - Binomiale kans`

#### Correcte inzending

Kopieerbare boilerplate:

```r
# OPTIONELE VERDIEPING
# P(X = 2) voor X ~ Binomiaal(n = 5, p = 0.30)
# Geef een proportie met vier decimalen.
p_exact_twee <- 0.3087
```

#### Foute testinvoer en misvattingen

- Foute testinvoer: `p_exact_twee <- 1`
  - Misvatting: **Waarschijnlijke redenering:** uit deze eindwaarde is de precieze denkstap niet zeker; mogelijk ontbreekt de combinatiecoëfficiënt of is ‘exact’ als cumulatieve kans gelezen.
- Foute testinvoer: `p_exact_twee <- 0.03087`
  - Misvatting: **Waarschijnlijke redenering:** deze waarde is consistent met de kans op één specifieke volgorde van twee recidivisten en drie niet-recidivisten. Dezelfde waarde kan ook anders ontstaan.
- Foute testinvoer: `p_exact_twee <- 0.09`
  - Misvatting: **Waarschijnlijke redenering:** deze waarde past bij alleen `0.30²`. Dezelfde waarde kan ook anders ontstaan.
- Foute testinvoer: `p_exact_twee <- 0.4718`
  - Misvatting: **Waarschijnlijke redenering:** deze waarde is consistent met de kans op minstens twee recidivisten. Dezelfde waarde kan ook anders ontstaan.
- Foute testinvoer: `p_exact_twee <- 0.8369`
  - Misvatting: **Waarschijnlijke redenering:** deze waarde is consistent met de cumulatieve kans op hoogstens twee recidivisten. Dezelfde waarde kan ook anders ontstaan.
- Foute testinvoer: `p_exact_twee <- 30.87`
  - Misvatting: **Waarschijnlijke redenering:** 30.87 is het correcte percentage, maar niet de gevraagde proportie. Dezelfde waarde kan ook anders ontstaan.

## Hoofdstuk 5
