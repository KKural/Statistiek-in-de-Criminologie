# Antwoordbank — Hoofdstuk 4

> Alleen voor docenten en technische validatie. De correcte inzendingen zijn rechtstreeks afgeleid van de canonieke `evaluation/Answer.R`-bestanden en door die evaluatoren gevalideerd.

## Gebruik

- **Correcte inzending** is een volledig ingevulde versie van de boilerplate, of het juiste optienummer bij een keuzeoefening.
- Een **Foute testinvoer** wijzigt steeds precies één antwoord terwijl de andere antwoorden correct blijven.
- De uitleg na elke foute invoer benoemt de bijbehorende misvatting en gerichte feedbackroute.

### Oef - 4.1 Kansregels en gebeurtenisrelaties

Bronmap: `Hoofdstuk_4_Een inleiding in kansrekeren/Oef - 4.1 Kansbegrip en Laplace-kans`

#### Correcte inzending

Kopieerbare, volledig ingevulde boilerplate:

```r
# Vul voor elk onderdeel het nummer van de gekozen optie in.
basisregel_kans <- 2
algemene_somregel <- 2
relatie_gebeurtenissen <- 2
```

#### Foute testinvoer en misvattingen

- Foute testinvoer voor `basisregel_kans` (alle andere velden blijven correct):

```r
# Vul voor elk onderdeel het nummer van de gekozen optie in.
basisregel_kans <- 1
algemene_somregel <- 2
relatie_gebeurtenissen <- 2
```

  - **Waarschijnlijke redenering:** Voor onderdeel 1 (kans en Laplace) vulde je 1 in. **Waarom dit niet klopt:** Een kans is een aandeel tussen nul en één; de Laplace-formule geldt wanneer de elementaire uitkomsten even waarschijnlijk zijn.

- Foute testinvoer voor `algemene_somregel` (alle andere velden blijven correct):

```r
# Vul voor elk onderdeel het nummer van de gekozen optie in.
basisregel_kans <- 2
algemene_somregel <- 1
relatie_gebeurtenissen <- 2
```

  - **Waarschijnlijke redenering:** Voor onderdeel 2 (somregel met overlap) vulde je 1 in. **Waarom dit niet klopt:** Bij mogelijke overlap worden de gezamenlijke uitkomsten eerst dubbel geteld en daarom eenmaal afgetrokken.

- Foute testinvoer voor `relatie_gebeurtenissen` (alle andere velden blijven correct):

```r
# Vul voor elk onderdeel het nummer van de gekozen optie in.
basisregel_kans <- 2
algemene_somregel <- 2
relatie_gebeurtenissen <- 1
```

  - **Waarschijnlijke redenering:** Voor onderdeel 3 (disjunct en onafhankelijk) vulde je 1 in. **Waarom dit niet klopt:** Disjuncte gebeurtenissen met beide een positieve kans kunnen niet onafhankelijk zijn, want hun gezamenlijke kans is nul.

### Oef - 4.2 Somregel en complement

Bronmap: `Hoofdstuk_4_Een inleiding in kansrekeren/Oef - 4.4 Woninginbraak of geweldsmisdrijf`

#### Correcte inzending

Kopieerbare, volledig ingevulde boilerplate:

```r
# Vul de drie kansen als proporties in.
kans_inbraak_of_geweld <- 0.64
kans_geen_van_beide <- 0.36
kans_met_overlap <- 0.8
```

#### Foute testinvoer en misvattingen

- Foute testinvoer voor `kans_inbraak_of_geweld` (alle andere velden blijven correct):

```r
# Vul de drie kansen als proporties in.
kans_inbraak_of_geweld <- 64
kans_geen_van_beide <- 0.36
kans_met_overlap <- 0.8
```

  - **Waarschijnlijke redenering:** Voor onderdeel 1 (disjuncte som) vulde je 64 in. **Waarom dit niet klopt:** Voor disjuncte gebeurtenissen tel je de twee kansen rechtstreeks op.

- Foute testinvoer voor `kans_geen_van_beide` (alle andere velden blijven correct):

```r
# Vul de drie kansen als proporties in.
kans_inbraak_of_geweld <- 0.64
kans_geen_van_beide <- 36
kans_met_overlap <- 0.8
```

  - **Waarschijnlijke redenering:** Voor onderdeel 2 (complement) vulde je 36 in. **Waarom dit niet klopt:** De kans op geen van beide is één min de kans op de vereniging.

- Foute testinvoer voor `kans_met_overlap` (alle andere velden blijven correct):

```r
# Vul de drie kansen als proporties in.
kans_inbraak_of_geweld <- 0.64
kans_geen_van_beide <- 0.36
kans_met_overlap <- 80
```

  - **Waarschijnlijke redenering:** Voor onderdeel 3 (som met overlap) vulde je 80 in. **Waarom dit niet klopt:** Gebruik de algemene somregel en trek de gezamenlijke kans eenmaal af.

### Oef - 4.3 Diplomaontvangers - Kansregels

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

### Oef - 4.4 Verdachten en drugsmisdrijven - Productregel

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

### Oef - 4.5 Richting van voorwaardelijke kansen

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

### Oef - 4.6 Permutaties en combinaties

Bronmap: `Hoofdstuk_4_Een inleiding in kansrekeren/Oef - 4.9 Permutatie of combinatie`

#### Correcte inzending

Kopieerbare, volledig ingevulde boilerplate:

```r
# Vul eerst het optienummer en daarna drie aantallen in.
telmethode_lotto <- 4
aantal_multiset_rangschikkingen <- 560
permutaties_7 <- 5040
permutaties_10 <- 3628800
```

#### Foute testinvoer en misvattingen

- Foute testinvoer voor `telmethode_lotto` (alle andere velden blijven correct):

```r
# Vul eerst het optienummer en daarna drie aantallen in.
telmethode_lotto <- 1
aantal_multiset_rangschikkingen <- 560
permutaties_7 <- 5040
permutaties_10 <- 3628800
```

  - **Waarschijnlijke redenering:** Voor onderdeel 1 (lottoselectie) vulde je 1 in. **Waarom dit niet klopt:** Omdat de volgorde niet telt, gebruik je een combinatie en deel je ook door 6!.

- Foute testinvoer voor `aantal_multiset_rangschikkingen` (alle andere velden blijven correct):

```r
# Vul eerst het optienummer en daarna drie aantallen in.
telmethode_lotto <- 4
aantal_multiset_rangschikkingen <- 561
permutaties_7 <- 5040
permutaties_10 <- 3628800
```

  - **Waarschijnlijke redenering:** Voor onderdeel 2 (multisetpermutatie) vulde je 561 in. **Waarom dit niet klopt:** Begin met 8! en deel door de faculteiten van de aantallen onderling gelijke labels.

- Foute testinvoer voor `permutaties_7` (alle andere velden blijven correct):

```r
# Vul eerst het optienummer en daarna drie aantallen in.
telmethode_lotto <- 4
aantal_multiset_rangschikkingen <- 560
permutaties_7 <- 5041
permutaties_10 <- 3628800
```

  - **Waarschijnlijke redenering:** Voor onderdeel 3 (zeven dossiers) vulde je 5041 in. **Waarom dit niet klopt:** Voor zeven verschillende objecten waarvan de volledige volgorde telt, gebruik je 7!.

- Foute testinvoer voor `permutaties_10` (alle andere velden blijven correct):

```r
# Vul eerst het optienummer en daarna drie aantallen in.
telmethode_lotto <- 4
aantal_multiset_rangschikkingen <- 560
permutaties_7 <- 5040
permutaties_10 <- 3628801
```

  - **Waarschijnlijke redenering:** Voor onderdeel 4 (tien examenvragen) vulde je 3628801 in. **Waarom dit niet klopt:** Voor tien verschillende objecten waarvan de volledige volgorde telt, gebruik je 10!.

### Oef - 4.7 Grensgevallen combinaties en lotto

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
- Foute testinvoer: `combinatie_5_5 <- 0`
  - Misvatting: **Waarschijnlijke redenering:** je denkt mogelijk dat alle vijf dossiers kiezen geen keuze meer inhoudt. Er is juist precies één mogelijke selectie: de volledige set.
- Foute testinvoer: `lotto_combinaties <- 1`
  - Misvatting: **Waarschijnlijke redenering:** uit de eindwaarde is de precieze route niet zeker; mogelijk is volgorde of teruglegging anders geïnterpreteerd.
- Foute testinvoer: `lotto_combinaties <- 3237399360`
  - Misvatting: **Waarschijnlijke redenering:** deze waarde is consistent met `41!/(41-6)!`, waarbij volgordes afzonderlijk worden geteld. Dezelfde waarde kan ook anders ontstaan.
- Foute testinvoer: `lotto_combinaties <- 4750104241`
  - Misvatting: **Waarschijnlijke redenering:** deze waarde past bij `41^6`, met 41 mogelijkheden bij elk van zes posities. Dezelfde waarde kan ook anders ontstaan.

### Oef - 4.8 Doodsoorzaken - Somregel en complement

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

### Oef - 4.9 Optionele verdieping - Binomiale kans

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
