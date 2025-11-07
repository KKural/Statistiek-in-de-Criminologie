# **Samenvatting Hoofdstuk 4: Een inleiding in kansrekenen**

## **Kansen als fundament**
Een **kans (P)** is een waarde tussen 0 en 1 of 0–100%:

### **Drie definities van kansen:**
- **Laplace-kans** (theoretisch): P(A) = N(A)/N
- **Relatieve frequentie** (experimenteel): P(A) = n(A)/n  
- **Subjectieve kans**: persoonlijke inschatting

## **Belangrijke kansregels**

### **Somregels**
- **Algemene somregel**: P(A of B) = P(A) + P(B) - P(A en B)
- **Speciale somregel** (disjuncte gebeurtenissen): P(A of B) = P(A) + P(B)

### **Productregels**
- **Algemene productregel**: P(A en B) = P(A) × P(B|A)
- **Speciale productregel** (onafhankelijke gebeurtenissen): P(A en B) = P(A) × P(B)

### **Complementregel**
- P(A) = 1 - P(niet-A)

## **Permutaties en combinaties**

### **Permutaties**
- **Volgorde wél belangrijk** → n!
- Voor r uit n objecten: nPr = n!/(n-r)!

### **Combinaties**  
- **Volgorde niet belangrijk** → n!/(k!(n-k)!)
- Voor k uit n objecten: nCk = (n over k)

## **Kansvariabelen**

### **Discrete kansvariabelen**
- **Afzonderlijke waarden** (bv. aantal delicten)
- **Verwachte waarde**: E(X) = Σ P(X=x) · x
- **Standaardafwijking**: spreiding rond verwachte waarde

### **Continue kansvariabelen**
- **Elke tussenliggende waarde mogelijk** (bv. reactietijd)
- Kansen via **oppervlaktes onder curve**

## **Binomiale verdeling**

### **Kenmerken**
- **Twee mogelijke uitkomsten** (0/1, ja/nee)
- **Vaste kans p** per trial
- **Onafhankelijke** herhalingen

### **Kansformule**
P(k) = (n over k) × p^k × (1-p)^(n-k)

### **Eigenschappen**
- **Gemiddelde**: μ = n × p
- **Standaardafwijking**: σ = √(n × p × (1-p))
- Wordt **symmetrischer** naarmate n groter
- **Benadert normale verdeling** bij grote n

## **Belang voor criminologie**

### **Typische toepassingen**
- **Slachtofferschap** (ja/nee per persoon)
- **Recidive** (wel/niet binnen bepaalde tijd)
- **Overtreding** (gepleegd/niet gepleegd)
- **Steekproeftrekking** (geselecteerd/niet geselecteerd)

### **Brug naar inferentiële statistiek**
- **Kansmodellen** vormen basis voor hypothesetoetsing
- **Onzekerheid kwantificeren** in steekproefresultaten
- **P-waarden** en **betrouwbaarheidsintervallen** interpreteren