# Antwoordbank — Hoofdstuk 12

> Alleen voor docenten en technische validatie. De correcte inzendingen zijn rechtstreeks afgeleid van de canonieke `evaluation/Answer.R`-bestanden en door die evaluatoren gevalideerd.

## Gebruik

- **Correcte inzending** is een volledig ingevulde versie van de boilerplate, of het juiste optienummer bij een keuzeoefening.
- Een **Foute testinvoer** wijzigt steeds precies één antwoord terwijl de andere antwoorden correct blijven.
- De uitleg na elke foute invoer benoemt de bijbehorende misvatting en gerichte feedbackroute.

### Oef - 12.1 Padmodel - Rollen van variabelen

Bronmap: `Hoofdstuk_12_Complexere relaties tussen variabelen/Oef - 12.1`

#### Correcte inzending

Kopieerbare, volledig ingevulde boilerplate:

```r
# Vul voor elke variabelenrol de juiste antwoordcode in na <-.
exogene_variabelen <- 1
endogene_uitkomst <- 2
intermediaire_variabelen <- 3
```

#### Foute testinvoer en misvattingen

- Foute testinvoer voor `exogene_variabelen` (alle andere velden blijven correct):

```r
# Vul voor elke variabelenrol de juiste antwoordcode in na <-.
exogene_variabelen <- 2
endogene_uitkomst <- 2
intermediaire_variabelen <- 3
```

  - **Waarschijnlijke redenering:** Je hebt waarschijnlijk variabelen met inkomende pijlen gekozen in plaats van de startvariabelen van het model. **Waarom dit niet klopt:** Empathische bezorgdheid en perspectiefneming ontvangen in dit model geen pijlen en horen bij code 1.

- Foute testinvoer voor `endogene_uitkomst` (alle andere velden blijven correct):

```r
# Vul voor elke variabelenrol de juiste antwoordcode in na <-.
exogene_variabelen <- 1
endogene_uitkomst <- 1
intermediaire_variabelen <- 3
```

  - **Waarschijnlijke redenering:** Je hebt waarschijnlijk een intermediaire variabele gekozen in plaats van het eindpunt van de paden. **Waarom dit niet klopt:** Moreel oordeel is het uiteindelijke knooppunt waarop de verklarende routes uitkomen en hoort bij code 2.

- Foute testinvoer voor `intermediaire_variabelen` (alle andere velden blijven correct):

```r
# Vul voor elke variabelenrol de juiste antwoordcode in na <-.
exogene_variabelen <- 1
endogene_uitkomst <- 2
intermediaire_variabelen <- 1
```

  - **Waarschijnlijke redenering:** Je hebt waarschijnlijk alleen de emoties geselecteerd en de morele intuïties met inkomende én uitgaande pijlen gemist. **Waarom dit niet klopt:** De intuïties, schuld en boosheid liggen tussen empathie en het uiteindelijke oordeel en horen samen bij code 3.

### Oef - 12.2 Padmodel - Paden en effecten

Bronmap: `Hoofdstuk_12_Complexere relaties tussen variabelen/Oef - 12.4`

#### Correcte inzending

Kopieerbare, volledig ingevulde boilerplate:

```r
# Vul elk antwoord in na <-.
padcoefficient_ind_schuld <- 0.18
aantal_indirecte_paden <- 3
totaal_effect <- 0.4264
```

#### Foute testinvoer en misvattingen

- Foute testinvoer voor `padcoefficient_ind_schuld` (alle andere velden blijven correct):

```r
# Vul elk antwoord in na <-.
padcoefficient_ind_schuld <- 18
aantal_indirecte_paden <- 3
totaal_effect <- 0.4264
```

  - **Waarschijnlijke redenering:** Je hebt waarschijnlijk een nabijgelegen coëfficiënt afgelezen in plaats van de gerichte pijl tussen de twee genoemde knooppunten. **Waarom dit niet klopt:** De gerichte pijl van individualiserende intuïties naar geanticipeerde schuld draagt de padcoëfficiënt 0.18.

- Foute testinvoer voor `aantal_indirecte_paden` (alle andere velden blijven correct):

```r
# Vul elk antwoord in na <-.
padcoefficient_ind_schuld <- 0.18
aantal_indirecte_paden <- 2
totaal_effect <- 0.4264
```

  - **Waarschijnlijke redenering:** Je hebt waarschijnlijk alleen de twee langere routes via de morele intuïties geteld en de kortere route via geanticipeerde schuld gemist. **Waarom dit niet klopt:** Er zijn drie routes: via individualiserende intuïties en schuld, via groepsgerichte intuïties en boosheid, en rechtstreeks via schuld.

- Foute testinvoer voor `totaal_effect` (alle andere velden blijven correct):

```r
# Vul elk antwoord in na <-.
padcoefficient_ind_schuld <- 0.18
aantal_indirecte_paden <- 3
totaal_effect <- 42.64
```

  - **Waarschijnlijke redenering:** Je hebt waarschijnlijk het directe en indirecte effect opgeteld zonder de coëfficiënten binnen het indirecte pad eerst te vermenigvuldigen. **Waarom dit niet klopt:** Het indirecte effect is 0.48 × 0.18 = 0.0864; 0.34 + 0.0864 = 0.4264.

### Oef - 12.3 Padmodel - R-kwadraat interpreteren

Bronmap: `Hoofdstuk_12_Complexere relaties tussen variabelen/Oef - 12.7`

#### Correcte inzending

Kopieerbare, volledig ingevulde boilerplate:

```r
# Vul elk antwoord in na <-.
r2_groepsgericht_pct <- 2
onverklaard_pct <- 57
interpretatie_onverklaard <- 2
```

#### Foute testinvoer en misvattingen

- Foute testinvoer voor `r2_groepsgericht_pct` (alle andere velden blijven correct):

```r
# Vul elk antwoord in na <-.
r2_groepsgericht_pct <- 1
onverklaard_pct <- 57
interpretatie_onverklaard <- 2
```

  - **Waarschijnlijke redenering:** Je hebt waarschijnlijk het R²-label van een nabijgelegen, andere endogene variabele afgelezen. **Waarom dit niet klopt:** Het R²-label bij groepsgerichte morele intuïties is 2%.

- Foute testinvoer voor `onverklaard_pct` (alle andere velden blijven correct):

```r
# Vul elk antwoord in na <-.
r2_groepsgericht_pct <- 2
onverklaard_pct <- 58
interpretatie_onverklaard <- 2
```

  - **Waarschijnlijke redenering:** Je hebt waarschijnlijk het verklaarde percentage 43 zelf ingevuld of het verkeerde complement genomen. **Waarom dit niet klopt:** Onverklaard is het complement: 100 − 43 = 57.

- Foute testinvoer voor `interpretatie_onverklaard` (alle andere velden blijven correct):

```r
# Vul elk antwoord in na <-.
r2_groepsgericht_pct <- 2
onverklaard_pct <- 57
interpretatie_onverklaard <- 1
```

  - **Waarschijnlijke redenering:** Je hebt waarschijnlijk één mogelijke oorzaak als bewezen diagnose geïnterpreteerd. **Waarom dit niet klopt:** R² kwantificeert het niet-verklaarde aandeel, maar identificeert zonder extra analyse geen specifieke oorzaak; code 2 is de voorzichtige interpretatie.

### Oef - 12.4 Regressie - Vier assumpties beoordelen

Bronmap: `Hoofdstuk_12_Complexere relaties tussen variabelen/Oef - 12.11`

#### Correcte inzending

Kopieerbare, volledig ingevulde boilerplate:

```r
# Vul voor elke regressieassumptie de juiste antwoordcode in na <-.
lineariteit <- 2
homoscedasticiteit <- 1
normaliteit <- 3
multicollineariteit <- 4
```

#### Foute testinvoer en misvattingen

- Foute testinvoer voor `lineariteit` (alle andere velden blijven correct):

```r
# Vul voor elke regressieassumptie de juiste antwoordcode in na <-.
lineariteit <- 1
homoscedasticiteit <- 1
normaliteit <- 3
multicollineariteit <- 4
```

  - **Waarschijnlijke redenering:** Je hebt waarschijnlijk willekeurige verticale spreiding verward met systematische kromming van de gemiddelde residutrend. **Waarom dit niet klopt:** De duidelijke kromming van de LOESS-lijn in B wijst op niet-lineariteit; daarom is code 2 correct.

- Foute testinvoer voor `homoscedasticiteit` (alle andere velden blijven correct):

```r
# Vul voor elke regressieassumptie de juiste antwoordcode in na <-.
lineariteit <- 2
homoscedasticiteit <- 2
normaliteit <- 3
multicollineariteit <- 4
```

  - **Waarschijnlijke redenering:** Je hebt waarschijnlijk de hoogte van afzonderlijke punten beoordeeld in plaats van de verandering van de spreiding over de horizontale as. **Waarom dit niet klopt:** De rode trendlijn stijgt duidelijk in A, terwijl zij in B ongeveer horizontaal blijft; alleen A toont heteroscedasticiteit en code 1 is correct.

- Foute testinvoer voor `normaliteit` (alle andere velden blijven correct):

```r
# Vul voor elke regressieassumptie de juiste antwoordcode in na <-.
lineariteit <- 2
homoscedasticiteit <- 1
normaliteit <- 2
multicollineariteit <- 4
```

  - **Waarschijnlijke redenering:** Je hebt waarschijnlijk slechts één soort afwijking herkend: zware staarten in A of rechtsscheefheid in B. **Waarom dit niet klopt:** A vertoont een systematische S-vorm door zware staarten en B een systematische kromming door rechtsscheefheid; beide schenden normaliteit en code 3 is correct.

- Foute testinvoer voor `multicollineariteit` (alle andere velden blijven correct):

```r
# Vul voor elke regressieassumptie de juiste antwoordcode in na <-.
lineariteit <- 2
homoscedasticiteit <- 1
normaliteit <- 3
multicollineariteit <- 2
```

  - **Waarschijnlijke redenering:** Je hebt waarschijnlijk elke VIF groter dan 1 als problematisch beschouwd in plaats van de waarden met de aangegeven grens te vergelijken. **Waarom dit niet klopt:** Alle vier VIF-waarden blijven onder de aangegeven probleemgrens van 10; geen van beide modellen toont dit probleem en code 4 is correct.
