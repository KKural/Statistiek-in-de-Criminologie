Een onderzoeker bestudeert de relatie tussen het **aantal gepleegde delicten** (X) en het **aantal keren dat men slachtoffer werd** (Y) bij een groep jongeren. Een criminoloog vermoedt dat **leeftijd** (Z) een rol speelt — oudere jongeren plegen mogelijk meer delicten én worden vaker slachtoffer. De onderzoeker wil weten in hoeverre de bivariate correlatie tussen X en Y verandert wanneer we controleren voor leeftijd.

De volgende gegevens werden verzameld bij 7 scholieren:

**Tabel 1**

*Delicten en leeftijd bij 7 scholieren*

<table style="border-collapse: collapse; width: 65%; margin: 20px auto; font-family: Times, serif;">
<thead>
<tr style="border-top: 2px solid #000; border-bottom: 1px solid #000;">
<th style="padding: 6px 10px; text-align: center; font-weight: bold;">Scholier</th>
<th style="padding: 6px 10px; text-align: center; font-weight: bold;">DelictenGepleegd (X)</th>
<th style="padding: 6px 10px; text-align: center; font-weight: bold;">DelictenSlachtoffer (Y)</th>
<th style="padding: 6px 10px; text-align: center; font-weight: bold;">Leeftijd (Z)</th>
</tr>
</thead>
<tbody>
<tr><td style="padding: 4px 10px; text-align: center;">1</td><td style="padding: 4px 10px; text-align: center;">2</td><td style="padding: 4px 10px; text-align: center;">2</td><td style="padding: 4px 10px; text-align: center;">17</td></tr>
<tr><td style="padding: 4px 10px; text-align: center;">2</td><td style="padding: 4px 10px; text-align: center;">0</td><td style="padding: 4px 10px; text-align: center;">0</td><td style="padding: 4px 10px; text-align: center;">15</td></tr>
<tr><td style="padding: 4px 10px; text-align: center;">3</td><td style="padding: 4px 10px; text-align: center;">0</td><td style="padding: 4px 10px; text-align: center;">1</td><td style="padding: 4px 10px; text-align: center;">14</td></tr>
<tr><td style="padding: 4px 10px; text-align: center;">4</td><td style="padding: 4px 10px; text-align: center;">6</td><td style="padding: 4px 10px; text-align: center;">3</td><td style="padding: 4px 10px; text-align: center;">16</td></tr>
<tr><td style="padding: 4px 10px; text-align: center;">5</td><td style="padding: 4px 10px; text-align: center;">3</td><td style="padding: 4px 10px; text-align: center;">2</td><td style="padding: 4px 10px; text-align: center;">15</td></tr>
<tr><td style="padding: 4px 10px; text-align: center;">6</td><td style="padding: 4px 10px; text-align: center;">0</td><td style="padding: 4px 10px; text-align: center;">3</td><td style="padding: 4px 10px; text-align: center;">14</td></tr>
<tr style="border-bottom: 2px solid #000;"><td style="padding: 4px 10px; text-align: center;">7</td><td style="padding: 4px 10px; text-align: center;">2</td><td style="padding: 4px 10px; text-align: center;">4</td><td style="padding: 4px 10px; text-align: center;">18</td></tr>
</tbody>
</table>

**Variabelen:**
- **X** = DelictenGepleegd (aantal delicten dat de scholier zelf gepleegd heeft)
- **Y** = DelictenSlachtoffer (aantal keren dat de scholier zelf slachtoffer werd)
- **Z** = Leeftijd (in jaren)

**Onderzoeksvraag:** In welke mate verandert de correlatie tussen X en Y wanneer we controleren voor de leeftijd (Z)?

Je berekent alles **met de hand** (rekenmachine mag). In R vul je enkel je **eindresultaten** in. Rond alle tussenresultaten af op **4 decimalen**.

---

## **Berekeningsstappen**

**Stap 1: Gemiddelden berekenen**

$$\bar{X} = \frac{\sum X_i}{n}, \quad \bar{Y} = \frac{\sum Y_i}{n}, \quad \bar{Z} = \frac{\sum Z_i}{n}$$

**Stap 2: Afwijkingstabel invullen** — bereken voor elke scholier:

`dX_i = X_i - X_bar`, `dY_i = Y_i - Y_bar`, `dZ_i = Z_i - Z_bar`

en hun kwadraten en kruisproducten: `dX^2`, `dY^2`, `dZ^2`, `dX*dY`, `dX*dZ`, `dY*dZ`

**Stap 3: Somkwadraten (SS) en kruisproductsommen (SCP)**

$$SS_X = \sum dX_i^2, \quad SS_Y = \sum dY_i^2, \quad SS_Z = \sum dZ_i^2$$
$$SCP_{XY} = \sum dX_i \cdot dY_i, \quad SCP_{XZ} = \sum dX_i \cdot dZ_i, \quad SCP_{YZ} = \sum dY_i \cdot dZ_i$$

**Stap 4: Varianties, standaarddeviaties en covarianties**

$$Var_X = \frac{SS_X}{n-1}, \quad SD_X = \sqrt{Var_X}, \quad Cov_{XY} = \frac{SCP_{XY}}{n-1}$$

**Stap 5: Bivariate correlatiecoëfficiënten**

$$r_{XY} = \frac{Cov_{XY}}{SD_X \cdot SD_Y}, \quad r_{XZ} = \frac{Cov_{XZ}}{SD_X \cdot SD_Z}, \quad r_{YZ} = \frac{Cov_{YZ}}{SD_Y \cdot SD_Z}$$

**Stap 6: Partiële correlatie**

$$r_{XY \cdot Z} = \frac{r_{XY} - r_{XZ} \cdot r_{YZ}}{\sqrt{(1 - r_{XZ}^2)(1 - r_{YZ}^2)}}$$

---

## **Opgaven**

### **Deel A: Gemiddelden (Stap 1)**

- 1) Gemiddelde van X: `X_bar` (4 decimalen)
- 2) Gemiddelde van Y: `Y_bar` (4 decimalen)
- 3) Gemiddelde van Z: `Z_bar` (4 decimalen)

### **Deel B: Somkwadraten en kruisproductsommen (Stap 2–3)**

- 4) `SS_X`: `SS_X` (4 decimalen)
- 5) `SS_Y`: `SS_Y` (4 decimalen)
- 6) `SS_Z`: `SS_Z` (4 decimalen)
- 7) `SCP_XY`: `SCP_XY` (4 decimalen)
- 8) `SCP_XZ`: `SCP_XZ` (4 decimalen)
- 9) `SCP_YZ`: `SCP_YZ` (4 decimalen)

### **Deel C: Varianties, standaarddeviaties en covarianties (Stap 4)**

- 10) `Var_X`: `Var_X` (4 decimalen)
- 11) `Var_Y`: `Var_Y` (4 decimalen)
- 12) `Var_Z`: `Var_Z` (4 decimalen)
- 13) `SD_X`: `SD_X` (4 decimalen)
- 14) `SD_Y`: `SD_Y` (4 decimalen)
- 15) `SD_Z`: `SD_Z` (4 decimalen)
- 16) `Cov_XY`: `Cov_XY` (4 decimalen)
- 17) `Cov_XZ`: `Cov_XZ` (4 decimalen)
- 18) `Cov_YZ`: `Cov_YZ` (4 decimalen)

### **Deel D: Bivariate correlaties (Stap 5)**

- 19) `r_XY`: `r_XY` (4 decimalen)
- 20) `r_XZ`: `r_XZ` (4 decimalen)
- 21) `r_YZ`: `r_YZ` (4 decimalen)

### **Deel E: Partiële correlatie (Stap 6)**

- 22) Teller van de formule: `r_XY_teller` (4 decimalen)
- 23) Noemer van de formule: `r_XY_noemer` (4 decimalen)
- 24) Partiële correlatie `r_XY.Z`: `r_XY_Z` (4 decimalen)

### **Deel F: Interpretatie**

- 25) **Welk type effect heeft leeftijd op de relatie X–Y?**
- 1 = Schijnverband: het verband verdwijnt grotendeels na controle voor leeftijd
- 2 = Indirect verband: het verband verzwakt significant maar blijft deels aanwezig
- 3 = Suppressoreffect: het verband wordt sterker na controle voor leeftijd
- 4 = Reëel verband: het verband verandert nauwelijks na controle voor leeftijd
- `conclusie_type`
