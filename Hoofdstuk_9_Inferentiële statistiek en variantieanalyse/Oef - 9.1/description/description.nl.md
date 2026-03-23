## Oef - 9.1: Beleidsverklaringen Premier vs. Minister van Binnenlandse Zaken

Dave neemt een willekeurige steekproef uit de toespraken, interviews en officiële verklaringen die de **Premier** en de **minister van Binnenlandse Zaken** in de loop van een jaar hebben gegeven, en waarin wordt gerefereerd naar "gevangenisbeleid". Hij analyseert de inhoud van zijn steekproef en ontdekt **vijf verschillende soorten rechtvaardigingen** voor het gevangenisbeleid van de regering. Dave registreert vervolgens elke keer dat de Premier of minister van Binnenlandse Zaken naar één van de vijf rechtvaardigingstypes verwijst.

De resultaten zijn als volgt:

**Tabel 1**

*Rechtvaardigingstypes per beleidsmaker*

<table style="border-collapse: collapse; width: 70%; margin: 20px auto; font-family: Times, serif;">
<thead>
<tr style="border-top: 2px solid #000; border-bottom: 1px solid #000;">
<th style="padding: 6px 8px; text-align: left; font-weight: bold;">Rechtvaardigingstype</th>
<th style="padding: 6px 8px; text-align: center; font-weight: bold;">Premier</th>
<th style="padding: 6px 8px; text-align: center; font-weight: bold;">Minister van BZ</th>
<th style="padding: 6px 8px; text-align: center; font-weight: bold;">Totaal</th>
</tr>
</thead>
<tbody>
<tr><td style="padding: 4px 8px;">Opsluiting (beveiligen van de samenleving)</td><td style="padding: 4px 8px; text-align: center;">6</td><td style="padding: 4px 8px; text-align: center;">16</td><td style="padding: 4px 8px; text-align: center;">22</td></tr>
<tr><td style="padding: 4px 8px;">Specifieke afschrikking</td><td style="padding: 4px 8px; text-align: center;">2</td><td style="padding: 4px 8px; text-align: center;">14</td><td style="padding: 4px 8px; text-align: center;">16</td></tr>
<tr><td style="padding: 4px 8px;">Algemene afschrikking</td><td style="padding: 4px 8px; text-align: center;">4</td><td style="padding: 4px 8px; text-align: center;">20</td><td style="padding: 4px 8px; text-align: center;">24</td></tr>
<tr><td style="padding: 4px 8px;">Rehabilitatie</td><td style="padding: 4px 8px; text-align: center;">0</td><td style="padding: 4px 8px; text-align: center;">15</td><td style="padding: 4px 8px; text-align: center;">15</td></tr>
<tr style="border-bottom: 2px solid #000;"><td style="padding: 4px 8px;">Gedwongen betaling</td><td style="padding: 4px 8px; text-align: center;">13</td><td style="padding: 4px 8px; text-align: center;">10</td><td style="padding: 4px 8px; text-align: center;">23</td></tr>
<tr style="border-top: 1px solid #000;"><td style="padding: 4px 8px; font-weight: bold;">Totaal</td><td style="padding: 4px 8px; text-align: center; font-weight: bold;">25</td><td style="padding: 4px 8px; text-align: center; font-weight: bold;">75</td><td style="padding: 4px 8px; text-align: center; font-weight: bold;">100</td></tr>
</tbody>
</table>

**Hypothesen:**

> **H₀:** Er is geen verband tussen de beleidsverklaringen van de Premier en die van de minister van Binnenlandse Zaken.
>
> **Hₐ:** Er is een verband tussen de beleidsverklaringen van de Premier en die van de minister van Binnenlandse Zaken.

**Welke toets?** → Chi²-toets voor de associatie/het verband tussen twee nominale variabelen

Je berekent alles **met de hand** (rekenmachine mag). In R vul je enkel je **eindresultaten** in.

---

## **Berekeningsstappen**

1. Bereken de **verwachte frequenties** voor elke cel: $E_{ij} = \frac{\text{rijtotaal}_i \times \text{kolomtotaal}_j}{N}$
2. Bereken de **chi-kwadraatbijdrage** voor elke cel: $\frac{(O_{ij} - E_{ij})^2}{E_{ij}}$
3. Tel alle bijdragen op: $\chi^2 = \sum \frac{(O - E)^2}{E}$
4. Bepaal het aantal vrijheidsgraden: $df = (r-1)(k-1)$
5. Vergelijk met de kritieke waarde bij het gekozen significantieniveau

---

## **Opgaven**

### **Deel A: Hypothesen**

1) **Welke soort nulhypothese hoor je hier te formuleren?**
   - 1 = Er is GEEN verband tussen de twee beleidsmakers
   - 2 = Er IS een verband tussen de twee beleidsmakers
   - `H0_richting` = 1 of 2

### **Deel B: Verwachte frequenties (selectie)**

2) **Verwachte frequentie: Opsluiting & Premier**
   - `E_opsluiting_premier` (1 decimaal)

3) **Verwachte frequentie: Gedwongen betaling & Premier**
   - `E_betaling_premier` (2 decimalen)

4) **Verwachte frequentie: Rehabilitatie & Minister BZ**
   - `E_rehab_minister` (2 decimalen)

### **Deel C: Chi-kwadraat**

5) **Bereken de chi-kwadraatwaarde (χ²)**
   - `chi_kwadraat` (rond af op 3 decimalen)

6) **Aantal vrijheidsgraden (df)**
   - `df_chi` (geheel getal)

### **Deel D: Significantie**

7) **Kritieke waarde bij α = 0.05 en jouw df**
   - `kritieke_waarde_005` (rond af op 3 decimalen)

8) **Is het verband statistisch significant bij α = 0.05?**
   - 1 = ja, 2 = nee
   - `significant_005`

9) **Kritieke waarde bij α = 0.01 en jouw df**
   - `kritieke_waarde_001` (rond af op 3 decimalen)

10) **Is het verband ook significant bij α = 0.01?**
    - 1 = ja, 2 = nee
    - `significant_001`
