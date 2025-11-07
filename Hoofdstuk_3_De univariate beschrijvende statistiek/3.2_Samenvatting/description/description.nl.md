# **Samenvatting Hoofdstuk 3: De univariate beschrijvende statistiek**

## **Frequentieverdelingen en grafische voorstellingen**

### **Absolute en relatieve frequenties**
- **Absolute frequentie**: aantal keer dat een waarde voorkomt
- **Relatieve frequentie** (proportie): absolute frequentie gedeeld door totaal aantal
- **Percentages**: relatieve frequentie × 100
- **Cumulatieve frequenties**: opgetelde frequenties tot een bepaalde waarde (alleen vanaf ordinaal niveau)

### **Grafische voorstellingen per meetniveau**
- **Nominaal/Ordinaal**: **taartdiagram** (max 5 categorieën), **staafdiagram** (meer categorieën mogelijk)
- **Metrisch**: **histogram** (balkjes raken elkaar), **lijndiagram**, **frequentiepolygoon**
- **Cumulatief frequentiediagram**: vanaf ordinaal niveau

**Opgelet**: grafieken kunnen misleiden door schaalindeling van assen!

## **Parameters van centraliteit**

### **Modus**
- **Definitie**: meest voorkomende waarde/categorie
- **Toepassing**: alle meetniveaus
- **Eigenschap**: stabiel, maar beperkte betekenis

### **Mediaan**
- **Definitie**: waarde die verdeling in twee gelijke delen verdeelt (50e percentiel)
- **Toepassing**: vanaf ordinaal niveau
- **Berekening**: middelste waarde bij oneven n; gemiddelde van twee middelste bij even n
- **Eigenschap**: **robuust** (weinig gevoelig voor uitschieters)

### **Kwartielen en percentielen**
- **Q1** (25%), **Q2** (mediaan, 50%), **Q3** (75%)
- **Interkwartiel-afstand** (IKA): Q3 - Q1 (spreidingsmaat)

### **Rekenkundig gemiddelde**
- **Definitie**: som van alle waarden gedeeld door aantal waarnemingen
- **Toepassing**: alleen metrisch niveau
- **Eigenschappen**: 
  - Evenwichtspunt van verdeling
  - **Niet robuust** (gevoelig voor uitschieters)
  - Som van afwijkingen = 0

## **Parameters van spreiding**

### **Nominaal niveau**
- **Variatieratio** (VR): proportie niet in modale categorie
- **Index van diversiteit** (ID): kans dat twee willekeurige eenheden verschillende waarde hebben

### **Ordinaal niveau**
- **Variatiebreedte**: verschil tussen hoogste en laagste waarde
- **Interkwartiel-afstand**: Q3 - Q1 (robuust voor uitschieters)

### **Metrisch niveau**
Alle gebaseerd op afwijkingen ten opzichte van het gemiddelde:
- **Variatie** (Sum of Squares): Σ(xi - x̄)²
- **Variantie** (s²): variatie/(n-1) 
- **Standaardafwijking** (s): √variantie
- **Variatiecoëfficiënt** (v): s/x̄ (dimensieloos, vergelijking mogelijk)

**Eigenschap**: metrische spreidingsmaten zijn **niet robuust** voor uitschieters.

## **Parameters van vorm**

### **Symmetrie en asymmetrie**
- **Symmetrisch**: gemiddelde = mediaan
- **Positief asymmetrisch** (rechtsscheef): gemiddelde > mediaan, lange staart rechts
- **Negatief asymmetrisch** (linksscheef): gemiddelde < mediaan, lange staart links
- **Pearson coëfficiënt**: 3(gemiddelde - mediaan)/standaardafwijking

**Criminologie**: veel variabelen zijn rechtsscheef (criminaliteit, slachtofferschap)

## **Box plots en vijf-getallensamenvatting**

### **Vijf-getallensamenvatting**
Minimum - Q1 - Mediaan - Q3 - Maximum (niet-uitschietende waarden)

### **Box plot interpretatie**
- **Centrale box**: Q1 tot Q3 (centrale 50%)
- **Mediaan**: lijn in box
- **Whiskers**: tot 1.5×IKA vanaf kwartielen
- **Uitschieters**: buiten whiskers (° = zwak, * = extreem)

### **Uitschieters detectie**
**1.5×IKA criterium**: waarden buiten Q1-1.5×IKA en Q3+1.5×IKA zijn verdachte uitschieters

## **Praktische richtlijnen**

### **Keuze centrummaat**
- **Symmetrische verdelingen**: gemiddelde
- **Asymmetrische verdelingen**: mediaan (robuuster)
- **Nominaal**: alleen modus

### **Belangrijk**
- **Meetniveau** bepaalt keuze analysemethoden
- **Uitschieters** beïnvloeden gemiddelde en standaardafwijking sterk
- **Variabiliteit** is essentieel voor criminologische theorievorming
- Percentages alleen bij n ≥ 30, anders absolute aantallen gebruiken