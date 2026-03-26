Een onderzoeker bestudeert bij **50 politieagenten** de relatie tussen **fysieke bekwaamheid** (X) en **jaarsalaris** (Y). Ze vermoedt dat het **aantal dienstjaren** (Z) beide variabelen beïnvloedt — meer dienstjaren gaat gepaard met zowel een lager fitnessgehalte als een hoger salaris door anciënniteit. De bivariate correlatie tussen X en Y lijkt hierdoor vertekend.

Uit eerder onderzoek is de volgende **correlatietabel** beschikbaar:

**Tabel 1**

*Correlatietabel van fysieke bekwaamheid, jaarsalaris en dienstjaren (n = 50)*

<table style="border-collapse: collapse; width: 55%; margin: 20px auto; font-family: Times, serif;">
<thead>
<tr style="border-top: 2px solid #000; border-bottom: 1px solid #000;">
<th style="padding: 6px 12px; text-align: left; font-weight: bold;">Variabele</th>
<th style="padding: 6px 12px; text-align: center; font-weight: bold;">X (Fysieke bekwaamheid)</th>
<th style="padding: 6px 12px; text-align: center; font-weight: bold;">Y (Jaarsalaris)</th>
<th style="padding: 6px 12px; text-align: center; font-weight: bold;">Z (Dienstjaren)</th>
</tr>
</thead>
<tbody>
<tr><td style="padding: 4px 12px;">X (Fysieke bekwaamheid)</td><td style="padding: 4px 12px; text-align: center;">1</td><td style="padding: 4px 12px; text-align: center;">-0.44</td><td style="padding: 4px 12px; text-align: center;">-0.68</td></tr>
<tr><td style="padding: 4px 12px;">Y (Jaarsalaris)</td><td style="padding: 4px 12px; text-align: center;">-0.44</td><td style="padding: 4px 12px; text-align: center;">1</td><td style="padding: 4px 12px; text-align: center;">0.82</td></tr>
<tr style="border-bottom: 2px solid #000;"><td style="padding: 4px 12px;">Z (Dienstjaren)</td><td style="padding: 4px 12px; text-align: center;">-0.68</td><td style="padding: 4px 12px; text-align: center;">0.82</td><td style="padding: 4px 12px; text-align: center;">1</td></tr>
</tbody>
</table>

**Variabelen:**
- **X** = Fysieke bekwaamheid score (0–100, hogere score = fitter)
- **Y** = Jaarsalaris (in €)
- **Z** = Dienstjaren (controlevariabele)

**Onderzoeksvraag:** Wat is de partiële correlatie tussen fysieke bekwaamheid en jaarsalaris, na uitschakeling van het effect van dienstjaren?

Uit de correlatietabel herleid je ook de `r^2`-waarden:

| | r | r^2 |
|---|---|---|
| `r_XY` (Fysieke bekwaamheid – salaris) | −0,44 | 0,19 |
| `r_XZ` (Fysieke bekwaamheid – dienstjaren) | −0,68 | 0,46 |
| `r_YZ` (Salaris – dienstjaren) | 0,82 | 0,67 |

Je berekent alles **met de hand** (rekenmachine mag). In R vul je enkel je **eindresultaten** in. Rond alle tussenresultaten af op **4 decimalen**.

---

## **Berekeningsstap**

$$r_{XY \cdot Z} = \frac{r_{XY} - r_{XZ} \cdot r_{YZ}}{\sqrt{(1 - r_{XZ}^2)(1 - r_{YZ}^2)}}$$

---

## **Opgaven**

### **Deel A: Correlaties uit de tabel aflezen**

- 1) Bivariate correlatie X–Y: `r_XY` (2 decimalen)
- 2) Bivariate correlatie X–Z: `r_XZ` (2 decimalen)
- 3) Bivariate correlatie Y–Z: `r_YZ` (2 decimalen)

### **Deel B: Partiële correlatie berekenen**

- 4) Teller van de formule: `r_XY_teller` (4 decimalen)
- 5) Noemer van de formule: `r_XY_noemer` (4 decimalen)
- 6) Partiële correlatie `r_XY.Z`: `r_XY_Z` (4 decimalen)

### **Deel C: Interpretatie**

- 7) **Welk type effect heeft dienstjaren (Z) op de relatie X–Y?**
- 1 = Schijnverband: het verband verdwijnt grotendeels na controle voor Z
- 2 = Indirect verband: het verband verzwakt significant maar blijft deels aanwezig
- 3 = Suppressoreffect: het verband wordt sterker na controle voor Z
- 4 = Teken omgekeerd: het verband keert van teken na controle voor Z
- `conclusie_type`
