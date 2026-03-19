## Oef - 10.3: Partiële correlatie — schoolbetrokkenheid en suppressorvariabele (correlatietabel)

Een criminoloog onderzoekt de relatie tussen **schoolbetrokkenheid** (X) en **delinquentie** (Y) bij adolescenten (n = 85). Op basis van bivariate analyse lijkt er nauwelijks een verband te zijn. De onderzoeker vermoedt echter dat **lage zelfcontrole** (Z) een suppressorvariabele is die een verborgen relatie maskeert.

De volgende **correlatietabel** is beschikbaar:

**Tabel 1**

*Correlatietabel van schoolbetrokkenheid, delinquentie en lage zelfcontrole (n = 85)*

<table style="border-collapse: collapse; width: 60%; margin: 20px auto; font-family: Times, serif;">
<thead>
<tr style="border-top: 2px solid #000; border-bottom: 1px solid #000;">
<th style="padding: 6px 10px; text-align: left; font-weight: bold;">Variabele</th>
<th style="padding: 6px 10px; text-align: center; font-weight: bold;">X (Schoolbetrokkenheid)</th>
<th style="padding: 6px 10px; text-align: center; font-weight: bold;">Y (Delinquentie)</th>
<th style="padding: 6px 10px; text-align: center; font-weight: bold;">Z (Lage zelfcontrole)</th>
</tr>
</thead>
<tbody>
<tr><td style="padding: 4px 10px;">X (Schoolbetrokkenheid)</td><td style="padding: 4px 10px; text-align: center;">1</td><td style="padding: 4px 10px; text-align: center;">0.10</td><td style="padding: 4px 10px; text-align: center;">-0.65</td></tr>
<tr><td style="padding: 4px 10px;">Y (Delinquentie)</td><td style="padding: 4px 10px; text-align: center;">0.10</td><td style="padding: 4px 10px; text-align: center;">1</td><td style="padding: 4px 10px; text-align: center;">-0.55</td></tr>
<tr style="border-bottom: 2px solid #000;"><td style="padding: 4px 10px;">Z (Lage zelfcontrole)</td><td style="padding: 4px 10px; text-align: center;">-0.65</td><td style="padding: 4px 10px; text-align: center;">-0.55</td><td style="padding: 4px 10px; text-align: center;">1</td></tr>
</tbody>
</table>

**Variabelen:**
- **X** = Schoolbetrokkenheid score (0–100, hogere score = meer betrokken)
- **Y** = Aantal gepleegde delicten in het afgelopen jaar
- **Z** = Lage zelfcontrole score (0–50, hogere score = lagere zelfcontrole)

**Onderzoeksvraag:** Wat is de partiële correlatie tussen schoolbetrokkenheid en delinquentie, na uitschakeling van lage zelfcontrole? Wat zegt dit over het type relatie?

Je berekent alles **met de hand** (rekenmachine mag). In R vul je enkel je **eindresultaten** in. Rond alle tussenresultaten af op **4 decimalen**.

---

## **Berekeningsstap**

$$r_{XY \cdot Z} = \frac{r_{XY} - r_{XZ} \cdot r_{YZ}}{\sqrt{(1 - r_{XZ}^2)(1 - r_{YZ}^2)}}$$

---

## **Opgaven**

### **Deel A: Correlaties uit de tabel aflezen**

1) Bivariate correlatie X–Y: `r_XY` (2 decimalen)
2) Bivariate correlatie X–Z: `r_XZ` (2 decimalen)
3) Bivariate correlatie Y–Z: `r_YZ` (2 decimalen)

### **Deel B: Partiële correlatie berekenen**

4) Teller van de formule: `r_XY_teller` (4 decimalen)
5) Noemer van de formule: `r_XY_noemer` (4 decimalen)
6) Partiële correlatie $r_{XY \cdot Z}$: `r_XY_Z` (4 decimalen)

### **Deel C: Interpretatie**

7) **Welk type effect heeft lage zelfcontrole (Z) op de relatie X–Y?**
   - 1 = Schijnverband: het verband verdwijnt grotendeels na controle voor Z
   - 2 = Indirect verband: het verband verzwakt significant maar blijft deels aanwezig
   - 3 = Suppressoreffect: een verborgen (sterker) verband wordt pas zichtbaar na controle voor Z
   - 4 = Teken omgekeerd door positieve confoundering
   - `conclusie_type`

**Instructie:** Vervang alle `???` door je antwoord. Gebruik decimalen met punt (niet komma).