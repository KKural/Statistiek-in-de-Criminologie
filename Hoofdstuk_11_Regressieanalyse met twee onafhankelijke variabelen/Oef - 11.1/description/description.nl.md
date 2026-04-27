Criminologen onderzoeken welke buurtkenmerken de criminaliteitsindex verklaren. Voor **vijf steden** zijn de volgende gegevens beschikbaar:

- **X₁**: Politiedichtheid (agenten per km²)
- **X₂**: Werkloosheidsgraad (%)
- **Y**: Criminaliteitsindex (incidenten per 1000 inwoners)

**Tabel 1** *— Gegevens per stad*

<table style="border-collapse: collapse; width: 65%; margin: 20px auto; font-family: Times, serif;">
<thead>
<tr style="border-top: 2px solid #000; border-bottom: 2px solid #000;">
<th style="padding: 6px 10px; text-align: center;">Stad</th>
<th style="padding: 6px 10px; text-align: center;">Politiedichtheid (X₁)</th>
<th style="padding: 6px 10px; text-align: center;">Werkloosheid (X₂)</th>
<th style="padding: 6px 10px; text-align: center;">Criminaliteitsindex (Y)</th>
</tr>
</thead>
<tbody>
<tr><td style="padding: 4px 10px; text-align: center;">A</td><td style="padding: 4px 10px; text-align: center;">1</td><td style="padding: 4px 10px; text-align: center;">5</td><td style="padding: 4px 10px; text-align: center;">20</td></tr>
<tr><td style="padding: 4px 10px; text-align: center;">B</td><td style="padding: 4px 10px; text-align: center;">2</td><td style="padding: 4px 10px; text-align: center;">10</td><td style="padding: 4px 10px; text-align: center;">24</td></tr>
<tr><td style="padding: 4px 10px; text-align: center;">C</td><td style="padding: 4px 10px; text-align: center;">3</td><td style="padding: 4px 10px; text-align: center;">5</td><td style="padding: 4px 10px; text-align: center;">16</td></tr>
<tr><td style="padding: 4px 10px; text-align: center;">D</td><td style="padding: 4px 10px; text-align: center;">4</td><td style="padding: 4px 10px; text-align: center;">10</td><td style="padding: 4px 10px; text-align: center;">18</td></tr>
<tr style="border-bottom: 2px solid #000;"><td style="padding: 4px 10px; text-align: center;">E</td><td style="padding: 4px 10px; text-align: center;">5</td><td style="padding: 4px 10px; text-align: center;">5</td><td style="padding: 4px 10px; text-align: center;">12</td></tr>
</tbody>
</table>

Bereken alles **met de hand** (rekenmachine mag). Vul enkel je **eindresultaten** in R in.

---

## Berekeningsstappen voor meervoudige regressie

**Stap 1 — Gemiddelden**
- Bereken x̄₁, x̄₂ en Ȳ

**Stap 2 — Afwijkingstabel (maak twee tabellen)**
- Tabel A: (x₁−x̄₁), (x₂−x̄₂), (Y−Ȳ) voor elke stad
- Tabel B: kwadraten en kruisproducten per stad

**Stap 3 — Sommeer**
- SSx₁ = Σ(x₁−x̄₁)² &nbsp;&nbsp; SSx₂ = Σ(x₂−x̄₂)² &nbsp;&nbsp; SSy = Σ(Y−Ȳ)²
- SSx₁x₂ = Σ(x₁−x̄₁)(x₂−x̄₂) &nbsp;&nbsp; SSx₁y = Σ(x₁−x̄₁)(Y−Ȳ) &nbsp;&nbsp; SSx₂y = Σ(x₂−x̄₂)(Y−Ȳ)

**Stap 4 — Determinant**
$$D = SSx_1 \cdot SSx_2 - SSx_{12}^2$$

**Stap 5 — Regressiegewichten**
$$b_1 = \frac{SSx_{1y} \cdot SSx_2 - SSx_{2y} \cdot SSx_{12}}{D} \qquad b_2 = \frac{SSx_{2y} \cdot SSx_1 - SSx_{1y} \cdot SSx_{12}}{D}$$

**Stap 6 — Intercept**
$$a = \bar{Y} - b_1 \bar{x}_1 - b_2 \bar{x}_2$$

**Stap 7 — Voorspelling**
$$\hat{Y} = a + b_1 x_1 + b_2 x_2$$

**Stap 8 — Determinatiecoëfficiënt R²**
$$R^2 = \frac{b_1 \cdot SSx_{1y} + b_2 \cdot SSx_{2y}}{SSy}$$

---

## Opgaven

### Deel A: Variabelen

- 1) **Welke variabele is de afhankelijke variabele (Y)?**
   - `afhankelijke_variabele` = 1 (politiedichtheid), 2 (werkloosheid) of 3 (criminaliteitsindex)

### Deel B: Gemiddelden

- 2) **Gemiddelde van X₁** (politiedichtheid) — 2 decimalen
   - `gemiddelde_x1`

- 3) **Gemiddelde van X₂** (werkloosheid) — 2 decimalen
   - `gemiddelde_x2`

- 4) **Gemiddelde van Y** (criminaliteitsindex) — 2 decimalen
   - `gemiddelde_y`

### Deel C: Sommen van kwadraten en kruisproducten

- 5) **SSx₁** = Σ(x₁−x̄₁)²
   - `SSx1`

- 6) **SSx₂** = Σ(x₂−x̄₂)²
   - `SSx2`

- 7) **SSy** = Σ(Y−Ȳ)²
   - `SSy`

- 8) **SSx₁x₂** = Σ(x₁−x̄₁)(x₂−x̄₂)
   - `SSx1x2`

- 9) **SSx₁y** = Σ(x₁−x̄₁)(Y−Ȳ)
   - `SSx1y`

- 10) **SSx₂y** = Σ(x₂−x̄₂)(Y−Ȳ)
    - `SSx2y`

### Deel D: Determinant

- 11) **Determinant** D = SSx₁·SSx₂ − SSx₁x₂²
    - `determinant_D`

### Deel E: Regressiecoëfficiënten

- 12) **Regressiegewicht b₁** (voor politiedichtheid) — 2 decimalen
    - `b1`

- 13) **Regressiegewicht b₂** (voor werkloosheid) — 2 decimalen
    - `b2`

- 14) **Intercept a** — 2 decimalen
    - `intercept_a`

### Deel F: Voorspelling

- 15) **Voorspel Y voor een stad met X₁ = 3 en X₂ = 8** — 2 decimalen
    - `voorspelling`

### Deel G: Model fit

- 16) **Determinatiecoëfficiënt R²** — 4 decimalen
    - `R_kwadraat`

### Deel H: Interpretatie

- 17) **In welke richting werkt b₁?**
    - `richting_b1` = 1 (positief: meer politie → meer criminaliteit) of 2 (negatief: meer politie → minder criminaliteit)

- 18) **Welke predictor heeft het sterkste relatieve effect op Y (kijk naar de gestandaardiseerde coëfficiënten β)?**
    - `sterkste_predictor` = 1 (X₁ politiedichtheid) of 2 (X₂ werkloosheid)

---

