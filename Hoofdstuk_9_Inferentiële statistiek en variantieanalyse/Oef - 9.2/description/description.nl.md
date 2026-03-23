## Oef - 9.2: Betrouwbaarheidsintervallen voor de gemiddelde leeftijd

In een steekproevenverdeling van de gemiddelde leeftijd uit 1899 heeft **95%** van alle steekproeven (elk bestaande uit **1000 personen**) een gemiddelde leeftijd die ligt **tussen 25.8 en 28.4**.

Je berekent alles **met de hand** (rekenmachine mag). In R vul je enkel je **eindresultaten** in.

---

## **Berekeningsstappen**

**Stap 1 – Bepaal het steekproefgemiddelde (ā)**
$$\bar{x} = \frac{\text{ondergrens} + \text{bovengrens}}{2}$$

**Stap 2 – Bepaal de standaardfout (SE)**
$$SE = \frac{\text{halve breedte}}{z_{\alpha/2}}$$
- Bij 95% is $z_{\alpha/2} = 1.96$
- Halve breedte = $\frac{\text{bovengrens} - \text{ondergrens}}{2}$

**Stap 3 – Bereken het 90%-betrouwbaarheidsinterval**
$$\bar{x} \pm z_{0.05} \times SE \quad \text{waarbij } z_{0.05} = 1.645$$

**Stap 4 – Bereken het 99%-betrouwbaarheidsinterval**
$$\bar{x} \pm z_{0.005} \times SE \quad \text{waarbij } z_{0.005} = 2.576$$

---

## **Opgaven**

### **Deel A: Gemiddelde en standaardfout**

1) **Steekproefgemiddelde (ā)**
   - `gemiddelde` (1 decimaal)

2) **Standaardfout (SE)**
   - `standaardfout` (rond af op 4 decimalen)

### **Deel B: 90%-betrouwbaarheidsinterval**

3) **Ondergrens van het 90%-BI**
   - `BI_90_onder` (rond af op 2 decimalen)

4) **Bovengrens van het 90%-BI**
   - `BI_90_boven` (rond af op 2 decimalen)

### **Deel C: 99%-betrouwbaarheidsinterval**

5) **Ondergrens van het 99%-BI**
   - `BI_99_onder` (rond af op 2 decimalen)

6) **Bovengrens van het 99%-BI**
   - `BI_99_boven` (rond af op 2 decimalen)

### **Deel D: Interpretatie**

7) **Welk interval is breder?**
   - 1 = 90%-BI is breder, 2 = 99%-BI is breder
   - `breder_interval`
