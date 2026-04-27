In deze oefening oefen je met **meervoudige regressie-analyse** (met twee onafhankelijke variabelen) aan de hand van een interactieve Shiny-app. De app genereert criminologische datasets en laat je alle tussenstappen handmatig berekenen — vergelijkbaar met Oefening 11.1, maar nu met directe feedback.

---

## **De App Openen**

De interactieve app is beschikbaar op:

**<a href='https://statistiek-in-de-criminologie.shinyapps.io/Meervoudige_regressie/' target='_blank' rel='noopener noreferrer'>Oefeningen voor Meervoudige Regressie</a>**


> **Let op:** Deze link werkt alleen als de app actief draait. Vraag je docent om de app te starten als deze niet beschikbaar is.

---

## **Leerdoelen**

Na het werken met deze app kun je:

- **Meervoudige regressie** uitvoeren met 21 stappen (gemiddelden, afwijkingen, kwadraten, kruisproducten, varianties, covarianties, correlaties, determinant, regressiecoëfficiënten, voorspellingen, R²)
- De rol van de **determinant** van de variantie-covariantiematrix begrijpen
- De ongestandaardiseerde coëfficiënten **b₁ en b₂** handmatig berekenen
- **R²** en de **vervreemdingscoëfficiënt** berekenen en interpreteren
- Het verschil begrijpen tussen bivariate en meervoudige regressie

---

## **Hoe Werkt de App?**

### **Stap 1: Kies een Scenario**

De app bevat **verschillende criminologische scenario's**, zoals:

- **Criminaliteitspreventie**: Effect van programma-blootstelling op inbraakcijfers (met tweede voorspeller)
- **Hot-spot politiestrategie**: Voetpatrouille-uren en meldingen aan politie
- **Wanorde en angst**: Wanorde-index en angstscores per buurt
- **Politie–publiek relaties**: Procedurele rechtvaardigheid en vertrouwen in politie
- En meer...

Elk scenario heeft **twee onafhankelijke variabelen (x₁ en x₂)** en één afhankelijke variabele (Y), met realistische criminologische benamingen.

### **Stap 2: Kies de Steekproefgrootte**

Selecteer het aantal observaties (N):
- **Klein (5-10)**: Makkelijker voor handmatige berekening
- **Medium (15-25)**: Realistischer
- **Groot (30-50)**: Voor geavanceerde oefeningen

### **Stap 3: Genereer Data**

Klik op **"Genereer dataset"** of gebruik **"Willekeurig scenario"** voor een andere dataset. Voer optioneel een **seed** in voor reproduceerbare datasets.

Je krijgt een **datatabel** te zien met x₁-, x₂- en Y-waarden per eenheid.

### **Stap 4: Bereken Handmatig (21 stappen)**

Met de hand (rekenmachine mag!), bereken alle tussenstappen zoals in Hoofdstuk 11 geleerd:

**Deel II — Stap 1: Gemiddelden**
- x̄₁, x̄₂ en Ȳ (4 decimalen)

**Deel III — Stappen 2–6: Afwijkingen, kwadraten & kruisproducten**
- Maak **Tabel 1**: afwijkingen x₁−x̄₁, x₂−x̄₂, Y−Ȳ per observatie
- Maak **Tabel 2**: kwadraten (x₁−x̄₁)², (x₂−x̄₂)², (Y−Ȳ)² en kruisproducten
- Bereken totalen: Σ(x₁−x̄₁)², Σ(x₂−x̄₂)², Σ(x₁−x̄₁)(x₂−x̄₂), Σ(x₁−x̄₁)(Y−Ȳ), Σ(x₂−x̄₂)(Y−Ȳ), Σ(Y−Ȳ)²

**Deel IV — Stappen 7–8: Varianties & standaarddeviaties**
- Var(x₁), SD(x₁), Var(x₂), SD(x₂), Var(Y), SD(Y)

**Deel IV-A — Stappen 9–11: Covarianties**
- Cov(x₁,Y), Cov(x₂,Y), Cov(x₁,x₂)

**Deel IV-B — Stappen 12–14: Correlatiecoëfficiënten**
- r(x₁,Y), r(x₂,Y), r(x₁,x₂)

**Deel V — Stappen 15–18: Regressiecoëfficiënten**
- Stap 15: Determinant = Σ(x₁−x̄₁)²·Σ(x₂−x̄₂)² − [Σ(x₁−x̄₁)(x₂−x̄₂)]²
- Stap 16: b₁ via determinantformule
- Stap 17: b₂ via determinantformule
- Stap 18: Intercept a = Ȳ − b₁·x̄₁ − b₂·x̄₂

**Deel VI — Stap 19: Voorspellingen**
- Ŷ = a + b₁·x₁ + b₂·x₂ voor elke observatie

**Deel VII — Stappen 20–21: Model fit**
- R² = 1 − SSE/SST
- Vervreemdingscoëfficiënt = 1 − R²

### **Stap 5: Vul je Antwoorden in de App**

Voer je berekende waarden in de **invoervelden** in met **4 decimalen** nauwkeurigheid.

> **Belangrijke afrondingsregel**: Rond pas af bij het invullen, niet tijdens de berekening!

### **Stap 6: Ontvang Feedback**

De app geeft **directe feedback** met kleuren:

- **Groen**: Correct!
- **Rood**: Fout — controleer je berekening
- **Neutraal**: Nog niet ingevuld

De app toont **geen correcte antwoorden**, maar geeft per stap aan of je berekening klopt.

---

## **Visualisaties in de App**

De visualisaties worden ontgrendeld wanneer alle stappen correct zijn:

1. **3D-scatterplot (of projectieplot)**
   - Toont de datapunten in de ruimte van x₁, x₂ en Y
   - Helpt het vlak van de meervoudige regressie te begrijpen

2. **Residuenplot**
   - Voorspelde waarden (Ŷ) vs. residuen (Y − Ŷ)
   - Helpt systematische fouten in het model te detecteren

3. **Kalibratieplot**
   - Vergelijkt voorspelde waarden (Ŷ) met geobserveerde waarden (Y)
   - Diagonale lijn = perfecte voorspelling

### **Statistieken Samenvatting**

De app toont automatisch (na correcte berekening):
- Regressiecoëfficiënten b₁ en b₂
- Intercept a
- Determinatiecoëfficiënt R²
- Vervreemdingscoëfficiënt (1 − R²)

---

## **Tips voor Efficiënt Oefenen**

1. **Begin klein**: Start met N=5 om de 21 stappen te leren
2. **Controleer tussenstappen**: Een fout in de kruisproducten werkt door in b₁ en b₂
3. **Maak een vaste tabel-template**: Twee tabellen (afwijkingen + kwadraten/kruisproducten)
4. **Gebruik een seed**: Bij dezelfde seed krijg je dezelfde data (handig om samen te oefenen)
5. **Let op de determinant**: Als de determinant klein is, zijn x₁ en x₂ sterk gecorreleerd (multicollineariteit)
6. **Let op afrondingen**: Gebruik consequent 4 decimalen voor alle tussenstappen

---

## **Oefenopgaven**

### **Opdracht 1: Basisberekening**
- Scenario: **Criminaliteitspreventie**
- N = 8
- Seed: 12345

Bereken alle 21 stappen. Wat zijn b₁, b₂ en het intercept?

### **Opdracht 2: Volledig Model**
- Scenario: **Angst voor criminaliteit & buurtwanorde**
- N = 12
- Seed: 54321

Bereken alle stappen. Welk percentage van de variantie in Y wordt verklaard door x₁ en x₂ samen?

### **Opdracht 3: Vergelijking met Bivariate Regressie**
Gebruik deze app twee keer met dezelfde seed: één keer met alleen x₁ als predictor (bivariate regressie) en één keer met x₁ + x₂ (meervoudige regressie).

Vergelijk:
- R² van bivariate regressie vs. R² van meervoudige regressie
- Verandert b₁ als je x₂ toevoegt? Waarom?

---

## **Veelgestelde Vragen**

**Q: Waarom verschillen mijn antwoorden van de app?**  
A: Controleer je afrondingen. Gebruik 4 decimalen consequent tijdens alle berekeningen.

**Q: Kan ik de correcte antwoorden zien?**  
A: Nee, de app toont alleen of je antwoord juist is (kleurcodering), niet het correcte antwoord. Dit stimuleert zelfstandig nadenken.

**Q: Hoe weet ik welke stap fout is?**  
A: Elke stap krijgt apart feedback. Begin bij de eerste rode stap — fouten propageren naar latere stappen.

**Q: Wat betekent de seed?**  
A: Een seed is een getal dat zorgt voor reproduceerbare willekeurige data. Dezelfde seed = dezelfde dataset.

**Q: Moet ik R-code schrijven?**  
A: Nee! Deze oefening is voor **handmatige berekening**. De app is alleen een hulpmiddel voor feedback.

**Q: Waarom is de determinant nodig?**  
A: De determinant meet de onafhankelijkheid van x₁ en x₂. Bij hoge correlatie tussen de predictoren (multicollineariteit) wordt de determinant klein en worden b₁ en b₂ instabiel.

---

## **Verband met Hoofdstuk 11**

Deze app helpt je oefenen met:
- **§11.1**: Meervoudige regressie met twee onafhankelijke variabelen
- **§11.2**: Berekening van regressiecoëfficiënten via de determinantmethode
- **§11.3**: Determinatiecoëfficiënt R² en model fit bij meervoudige regressie
- **§11.4**: Interpretatie van partiële regressiecoëfficiënten

---

## **Wat Moet Je Inleveren?**

**Voor deze oefening hoef je niets in te leveren op Dodona.** Dit is een **oefentool** voor zelfstudie en voorbereiding op het examen.

Gebruik de app om:
- Je begrip van meervoudige regressie te verdiepen
- De 21 berekeningsstappen te oefenen
- Verschillende scenario's en steekproefgroottes te verkennen

---

**Succes met oefenen!**