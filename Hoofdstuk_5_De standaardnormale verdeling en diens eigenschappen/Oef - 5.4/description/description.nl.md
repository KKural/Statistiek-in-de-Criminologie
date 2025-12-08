# Oefening 5.4: Kwaliteitscontrole Trappistenbier

## Situatie

De Trappisten van de Sint-Sixtusabdij in Westvleteren zijn volop bezig met een controle van het productieproces van hun beroemde trappistenbier: **Westvleteren**. Na het controleren van een random sample van 100 flesjes stellen ze vast dat hun bottelmachine een lichte afwijking vertoont: de inhoud van de flesjes is niet exact 33cl, maar volgt een **normaalverdeling**: **N(33, 2)**.

Dit betekent:
- **Gemiddelde (μ) = 33 cl**  
- **Standaardafwijking (σ) = 2 cl**

---

## Vraagstellingen

### Vraag a
**Aangezien de monniken een eerlijk product willen verkopen, willen ze dat er in alle flesjes minstens 32cl en maximum 34cl zit. Hoeveel procent van de flesjes voldoen aan deze vereiste?**

*Bereken het percentage flesjes met een inhoud tussen 32cl en 34cl (inclusief).*

### Vraag b
**Pater Boudewijn, commercieel verantwoordelijke, vraagt zich af hoeveel procent van de flesjes meer dan 35cl bevat.**

*Bereken het percentage flesjes met een inhoud van meer dan 35cl.*

---

## Instructies

1. **Gebruik de standaard normaalverdeling** voor je berekeningen
2. **Bereken eerst de z-scores** voor de gegeven waarden
3. **Gebruik de z-tabel** om de kansen te bepalen
4. **Geef je antwoorden in decimalen** (bijvoorbeeld: 0.3830 voor 38.30%)

### Formule z-score:
**Z = (X - μ) / σ**

waar:
- **X** = de waarde waarvoor je de z-score berekent
- **μ** = gemiddelde (33 cl)  
- **σ** = standaardafwijking (2 cl)

---

## Verwachte Output

Je programma moet **twee waarden** berekenen en toekennen aan variabelen:

```r
# Vraag a: Percentage flesjes tussen 32cl en 34cl (inclusief)
vraag_a <- [jouw berekening]

# Vraag b: Percentage flesjes met meer dan 35cl  
vraag_b <- [jouw berekening]
```

---

## Hulpmiddelen

- **Z-tabel**: [Belfactorij Z-tabel](https://www.belfactorij.be/lessen-statistiek/normale-verdeling/z-tabel/)
- **R functies**: `pnorm()`, `qnorm()`
- **Formule**: Z = (X - μ) / σ

---

## Context: Criminologie en Kwaliteitscontrole

In de criminologie worden normaalverdelingen vaak gebruikt voor:
- **Analyse van responsietijden** bij noodoproepen
- **Beoordeling van testscores** in psychologische evaluaties
- **Kwaliteitscontrole** van forensische metingen
- **Populatiestudies** over criminaliteitsstatistieken

Deze oefening toont hoe statistische concepten uit de criminologie ook toepasbaar zijn in andere domeinen zoals productiekwaliteit en bedrijfsvoering.