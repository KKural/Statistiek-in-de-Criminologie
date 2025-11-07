# **Opdrachten voor de werkcolleges**

## **A. Basisbegrip en rekenvaardigheid**

### **Opdracht 1: Dobbelsteen-experiment**
**Individuele oefening:** 15 minuten

**Taak:**
1. Bereken P(even getal), P(>4), P(even én >4)
2. Verifieer de **somregel**: P(even of >4) = P(even) + P(>4) - P(even én >4)
3. Verifieer de **productregel**: P(even én >4) = P(even) × P(>4|even)

### **Opdracht 2: Kaartspel-voorbeeld**
**Groepsopdracht:** 20 minuten

**Taak:**
1. Bereken P(vrouw of harten) uit standaard kaartspel
2. Verklaar waarom **aftrekken** nodig is in de somregel
3. Controleer met **complementregel**: P(niet(vrouw of harten))

### **Opdracht 3: Voorwaardelijke kans**
**Computer-oefening:**

**Taak:**
1. Simuleer met R of Excel: 200 dobbelsteenworpen
2. Bereken P(≤3 | even) uit simulatiedata
3. Vergelijk met **theoretische waarde**: P(≤3 | even) = P(≤3 én even)/P(even)

---

## **B. Permutaties en combinaties**

### **Opdracht 4: Handmatige berekeningen**
**Individuele oefening:** 20 minuten

**Taak:**
1. Bereken **permutaties** van de letters A, B, C (alle volgorden)
2. Bereken **combinaties** van 5 studenten waarvan 2 worden gekozen
3. Gebruik formule n!/(k!(n-k)!) voor verschillende n en k

### **Opdracht 5: Criminologische toepassing**
**Groepsopdracht:** 15 minuten

**Scenario:** Politie moet 3 verdachten kiezen uit 10 arrestanten voor verder verhoor.

**Taak:**
1. Bereken hoeveel **verschillende selecties** mogelijk zijn
2. Als alle verdachten even waarschijnlijk schuldig zijn, wat is de kans dat de 3 schuldigen gekozen worden?
3. Verschil tussen **permutatie** (volgorde verhoor belangrijk) en **combinatie** (alleen selectie)

---

## **C. Binomiale verdeling – criminologisch scenario**

### **Opdracht 6: Recidive-kansen**
**Computer-oefening met R/Excel:**

**Scenario:** Kans op **recidive** p = 0,4 bij n = 5 veroordeelden

**Taak:**
1. Bereken **alle individuele kansen**: P(k=0), P(k=1), ..., P(k=5)
2. Bereken **cumulatieve kansen**: P(k ≤ 0), P(k ≤ 1), ..., P(k ≤ 5)
3. Visualiseer de verdeling in R (`dbinom()` en `pbinom()` functies)
4. Bereken **verwachte waarde** μ = n×p en **standaardafwijking** σ = √(n×p×(1-p))

### **Opdracht 7: Beleidsinterpretatie**
**Groepsdiscussie:** 15 minuten

**Gegeven:** P(k ≤ 2) = 0,68 bij bovenstaand scenario

**Discussievragen:**
1. Wat betekent P(k ≤ 2) = 0,68 in **beleidscontext**?
2. Hoe verandert de verdeling als p stijgt naar 0,6?
3. Bij welke waarde van p wordt de verdeling **symmetrisch**?

---

## **D. Link met criminologisch onderzoek**

### **Opdracht 8: Kansvariabelen identificeren**
**Groepsopdracht:** 20 minuten

**Taak:**
1. Geef voorbeelden van **discrete kansvariabelen** in criminaliteitsdata
2. Geef voorbeelden van **continue kansvariabelen** in criminaliteitsdata  
3. Leg uit waarom **onafhankelijkheid** tussen observaties cruciaal is
4. Wanneer is de **binomiale verdeling** geschikt vs ongeschikt?

### **Opdracht 9: SPSS-interpretatie**
**Computer-oefening:**

**Gegeven:** SPSS-output van binomiale toets over recidive

**Taak:**
1. Interpreteer de **p-waarde** in gewone taal
2. Interpreteer het **betrouwbaarheidsinterval** voor de kans
3. Formuleer **conclusie** voor beleidsmakers
4. Identificeer **assumpties** van de binomiale toets
Elke groep presenteert hun steekproefstrategie in 3 minuten aan de klas.

---

## **Individuele oefening: Parameters vs. Statistieken**

**Tijd:** 15 minuten

### **Opdracht:**
Voor elk van de volgende stellingen, bepaal of het gaat om een **parameter** of een **statistiek**:

1. Het gemiddelde aantal misdrijven per inwoner in België in 2023
2. Het percentage gewelddadige criminaliteit in een steekproef van 500 politierapporten
3. De correlatie tussen leeftijd en criminaliteit in alle Europese landen
4. De standaarddeviatie van gevangenisstraffen in een onderzoek naar 200 rechtszaken
5. Het percentage recidive in de volledige populatie ex-gedetineerden van 2020

---

## **Groepsopdracht 3: Onderzoeksdesign**

**Tijd:** 30 minuten  
**Groepsgrootte:** 4-5 studenten

### **Casus:**
De burgemeester van Gent wil weten of de invoering van bodycams bij politieagenten het aantal klachten tegen de politie heeft verminderd.

### **Opdracht:**
1. **Formuleer de onderzoeksvraag** precies
2. **Identificeer variabelen:**
   - Afhankelijke variabele(n)
   - Onafhankelijke variabele(n)
   - Mogelijk confounding variabelen
3. **Bepaal meetniveaus** voor alle variabelen
4. **Ontwerp datacollectie:**
   - Welke data heb je nodig?
   - Waar vind je deze data?
   - Hoe lang moet je data verzamelen?

### **Bonus:**
Welke statistische analyses zou je uitvoeren met deze data?

---

## **Reflectieopdracht: Betrouwbaarheid vs. Validiteit**

**Tijd:** 20 minuten  
**Individueel, daarna klassikale discussie**

### **Scenario's:**
Beoordeel voor elk scenario de **betrouwbaarheid** en **validiteit**:

**Scenario A:** Een politieagent telt elke dag het aantal fietsdiefstallen door meldingen op het commissariaat
**Scenario B:** Een onderzoeker gebruikt camerabewaking om geweldsincidenten in uitgaansgebieden te tellen
**Scenario C:** Een enquête vraagt respondenten naar hun eigen criminele gedrag in het afgelopen jaar

### **Vragen:**
1. Welke metingen zijn betrouwbaar maar niet valide?
2. Welke metingen zijn valide maar niet betrouwbaar?
3. Hoe zou je de betrouwbaarheid en validiteit kunnen verbeteren?

---

## **Afronding: Begrippenquiz**

**Tijd:** 10 minuten  
**Teams van 4 studenten**

### **Snelle ronde begrippen:**
De docent noemt een begrip, teams schrijven in 30 seconden de definitie op.

- Nominaal meetniveau
- Parameter
- Steekproefvertekening
- Kwantitatieve variabele
- Betrouwbaarheid
- Populatie
- Statistiek
- Validiteit