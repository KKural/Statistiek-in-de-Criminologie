# Oefening 8.2: Interactieve Correlatie- en Regressie-app

In deze oefening oefen je met **correlatie-analyse** en **bivariate lineaire regressie** aan de hand van een interactieve Shiny-app. De app genereert criminologische datasets en laat je alle tussenstappen handmatig berekenen, vergelijkbaar met Oefening 8.1, maar nu met directe feedback.

---

## De App Openen

De interactieve app is beschikbaar op:

**<a href='https://statistiek-in-de-criminologie.shinyapps.io/Dodona/' target='_blank' rel='noopener noreferrer'>Oefeningen voor Correlatie & Regressie</a>**

> **Let op:** Deze link werkt alleen als de app actief draait op je computer. Vraag je docent om de app te starten als deze niet beschikbaar is.

---

## Leerdoelen

Na het werken met deze app kun je:

- **Correlatie-analyse** uitvoeren met 9 stappen (gemiddelden, afwijkingen, covariantie, correlatie)
- **Bivariate regressie-analyse** uitvoeren met 15 stappen (inclusief intercept, rico, R², residuen)
- Scatterplots interpreteren en de regressielijn begrijpen
- Residuenplots en kalibratieplots lezen
- Het verschil begrijpen tussen symmetrische (correlatie) en asymmetrische (regressie) analyses

---

## Hoe Werkt de App?

### Stap 1: Kies een Scenario

De app bevat **verschillende criminologische scenario's**, zoals:

- **Programma-effectiviteit**: Relatie tussen blootstelling aan een preventieprogramma en inbraakcijfers
- **Voetpatrouilles**: Effect van patrouille-uren op meldingen bij de politie
- **Wanorde en angst**: Samenhang tussen wanorde-index en angstscores
- **Risicogedrag**: Relatie tussen risicogedrag en recidive
- En meer...

Elk scenario heeft **realistische variabelennamen** in het Nederlands.

### Stap 2: Kies de Steekproefgrootte

Selecteer het aantal observaties (N):
- **Klein (5-10)**: Makkelijker voor handmatige berekening
- **Medium (15-25)**: Realistischer
- **Groot (30-50)**: Voor geavanceerde oefeningen

### Stap 3: Kies je Analyse-Modus

De app biedt **twee modi**:

#### **Correlatie-analyse (9 stappen)**
Symmetrische associatiemaat - berekent de sterkte en richting van de lineaire samenhang.

**De 9 stappen zijn:**
1. Gemiddelde van X (x̄)
2. Gemiddelde van Y (ȳ)
3. Som gekwadrateerde afwijkingen X (SSx)
4. Som gekwadrateerde afwijkingen Y (SSy)
5. Som kruisproducten (SSxy)
6. Variantie X (s²x)
7. Variantie Y (s²y)
8. Standaardafwijking X (sx) en Y (sy)
9. **Pearson's correlatie (r)**

#### **Bivariate Regressie (15 stappen)**
Asymmetrische analysetechniek - voorspelt Y op basis van X.

**De 15 stappen zijn:**
1-9. Zelfde als correlatie-analyse
10. Covariantie (s²xy)
11. Ongestandaardiseerde rico (b₁)
12. Intercept (a of b₀)
13. Gestandaardiseerde rico (β)
14. **Determinatiecoëfficiënt (R²)**
15. **Aliënatiecoëfficiënt (1-R²)**

### Stap 4: Genereer Data

Klik op **"Genereer Nieuwe Data"** of voer een **seed** in voor reproduceerbare datasets.

Je krijgt een **datatabel** te zien met de X- en Y-waarden voor elke eenheid.

### Stap 5: Bereken Handmatig

Met de hand (rekenmachine mag!), bereken alle tussenstappen zoals in Hoofdstuk 8 geleerd:

1. **Maak een tabel** met kolommen voor:
   - x, y
   - x - x̄, y - ȳ
   - (x - x̄)², (y - ȳ)²
   - (x - x̄)·(y - ȳ)

2. **Bereken de sommen**: SSx, SSy, SSxy

3. **Bereken varianties en standaardafwijkingen**

4. **Bereken correlatie of regressieparameters**

### Stap 6: Vul je Antwoorden in de App

Voer je berekende waarden in de **invoervelden** in:

- **Tussenstappen**: 4 decimalen nauwkeurigheid
- **Eindstatistieken**: 2 decimalen nauwkeurigheid

> **Belangrijke afrondingsregel**: Rond pas af bij het invullen, niet tijdens de berekening!

### Stap 7: Ontvang Feedback

De app geeft **directe feedback** met kleuren:

- **Groen**: Correct!
- **Rood**: Fout - controleer je berekening
- **Neutraal**: Nog niet ingevuld

De app toont **geen correcte antwoorden**, maar geeft wel aan welke stappen fout zijn zodat je je berekening kunt controleren.

---

## Visualisaties in de App

### Voor Regressie-Modus:

1. **Scatterplot met Regressielijn**
   - Toont de datapunten en de best passende rechte lijn
   - Helpt de sterkte en richting van het verband te zien

2. **Residuenplot**
   - Toont de afstand van elk punt tot de regressielijn
   - Horizontale lijn bij 0 = perfecte voorspelling
   - Helpt patronen in voorspellingsfouten te zien

3. **Kalibratieplot**
   - Vergelijkt voorspelde waarden (Ŷ) met geobserveerde waarden (Y)
   - Diagonale lijn = perfecte voorspelling
   - Hoe dichter punten bij de lijn, hoe beter het model

### Statistieken Samenvatting

De app toont automatisch (na correcte berekening):
- Correlatie (r)
- Determinatiecoëfficiënt (R²)
- Regressiecoëfficiënt (b)
- Intercept (a)

### Interpretatie

De app geeft een **automatische interpretatie** in begrijpelijk Nederlands, bijvoorbeeld:

> "Er is een **sterke positieve** samenhang (r = 0.8234, R² = 0.6780). Een toename van 1 eenheid in ProgrammaBlootstelling gaat gemiddeld gepaard met een verandering van **-2.34** eenheden in InbraakCijfer."

---

## Tips voor Efficiënt Oefenen

1. **Begin klein**: Start met N=5 om de stappen te leren
2. **Controleer tussenstappen**: Als een stap rood is, controleer ook eerdere stappen
3. **Maak een vaste tabel-template**: Zo maak je minder fouten
4. **Gebruik een seed**: Bij dezelfde seed krijg je dezelfde data (handig om samen te oefenen)
5. **Vergelijk modi**: Doe eerst correlatie, dan regressie met dezelfde data om het verschil te zien
6. **Let op afrondingen**: Gebruik de juiste precisie (4 dp voor tussenstappen, 2 dp voor eindresultaat)

---

## Oefenopgaven

### Opdracht 1: Correlatie Basis
- Scenario: **Wanorde en Angst**
- N = 8
- Modus: **Correlatie**
- Seed: 12345

Bereken alle 9 stappen en interpreteer het resultaat.

### Opdracht 2: Regressie Volledig
- Scenario: **Voetpatrouilles**
- N = 12
- Modus: **Bivariate Regressie**
- Seed: 54321

Bereken alle 15 stappen. Wat is de voorspelde waarde voor Y als X = 10?

### Opdracht 3: Vergelijking
Genereer dezelfde data (zelfde seed) en doe:
1. Eerst correlatie-analyse
2. Dan regressie-analyse

Controleer: Is r² (uit correlatie) gelijk aan R² (uit regressie)?

---

## Veelgestelde Vragen

**Q: Waarom verschillen mijn antwoorden van de app?**  
A: Controleer je afrondingen. Gebruik 4 decimalen tijdens berekening en rond pas af bij invoer.

**Q: Kan ik de correcte antwoorden zien?**  
A: Nee, de app toont alleen of je antwoord juist is (kleurcodering), niet het correcte antwoord. Dit stimuleert zelfstandig nadenken.

**Q: Hoe weet ik welke stap fout is?**  
A: Elke stap krijgt apart feedback. Begin bij de eerste rode stap en werk vanaf daar verder.

**Q: Wat betekent de seed?**  
A: Een seed is een getal dat zorgt voor reproduceerbare willekeurige data. Dezelfde seed = dezelfde dataset.

**Q: Moet ik R-code schrijven?**  
A: Nee! Deze oefening is voor **handmatige berekening**. De app is alleen een hulpmiddel voor feedback.

---

## Verband met Hoofdstuk 8

Deze app helpt je oefenen met:
- **§8.1**: Symmetrische associatiematen (covariatie, covariantie, correlatie)
- **§8.2**: Uitgewerkt rekenvoorbeeld correlatie
- **§8.3**: Bivariate lineaire regressieanalyse (OLS)
- **§8.4**: Uitgewerkt rekenvoorbeeld regressie
- **§8.5**: Interpretatie van regressieparameters

---

## Wat Moet Je Inleveren?

**Voor deze oefening hoef je niets in te leveren op Dodona.** Dit is een **oefentool** voor zelfstudie en voorbereiding op het examen.

Gebruik de app om:
- Je begrip van correlatie en regressie te verdiepen
- Snelheid en nauwkeurigheid in handmatige berekening te verbeteren
- Verschillende scenario's en steekproefgroottes te oefenen

---

**Succes met oefenen!**