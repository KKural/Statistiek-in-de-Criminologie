Een onderzoeker wil nagaan of er een verband is tussen **geslacht** en **crimineel gedrag** (wel/geen misdrijf gepleegd). In een representatieve steekproef van **2.000** volwassenen werd het volgende gevonden:

**Tabel 1**

*Crimineel gedrag per geslacht (absolute frequenties)*

<table style="border-collapse: collapse; width: 45%; margin: 20px auto; font-family: Times, serif;">
<thead>
<tr style="border-top: 2px solid #000; border-bottom: 2px solid #000;">
<th style="padding: 6px 8px; text-align: left; font-weight: bold;">Crimineel gedrag</th>
<th style="padding: 6px 8px; text-align: center; font-weight: bold;">Man</th>
<th style="padding: 6px 8px; text-align: center; font-weight: bold;">Vrouw</th>
</tr>
</thead>
<tbody>
<tr>
<td style="padding: 4px 8px; text-align: left;">YES</td>
<td style="padding: 4px 8px; text-align: center;">380</td>
<td style="padding: 4px 8px; text-align: center;">120</td>
</tr>
<tr style="border-bottom: 2px solid #000;">
<td style="padding: 4px 8px; text-align: left;">NO</td>
<td style="padding: 4px 8px; text-align: center;">850</td>
<td style="padding: 4px 8px; text-align: center;">650</td>
</tr>
</tbody>
</table>

<img src="media/crimineel_geslacht_kruistabel.png" alt="Crimineel gedrag per geslacht" width="600">

*De figuur toont de absolute aantallen YES/NO voor mannen en vrouwen in dezelfde steekproef (N = 2000). Gebruik deze visualisatie ter ondersteuning bij het interpreteren van percentages, odds en de chi-kwadraatwaarde.*


1) Marginale percentages (t.o.v. N = 2000)
- `percentage_mannen` = (totaal mannen / 2000) * 100
- `percentage_vrouwen` = (totaal vrouwen / 2000) * 100
- `percentage_yes` = (totaal YES / 2000) * 100
- `percentage_no` = (totaal NO / 2000) * 100

2) Conditionele percentages (kolompercentages)
- `percentage_yes_bij_mannen` = (YES bij mannen / totaal mannen) * 100
- `percentage_yes_bij_vrouwen` = (YES bij vrouwen / totaal vrouwen) * 100

3) Percentageverschil (procentpunten)
- `percentageverschil_yes` = percentage_yes_bij_mannen - percentage_yes_bij_vrouwen

4) Odds en odds ratio
- `odds_mannen` = (YES bij mannen) / (NO bij mannen)
- `odds_vrouwen` = (YES bij vrouwen) / (NO bij vrouwen)
- `odds_ratio` = odds_mannen / odds_vrouwen

5) Chi-kwadraat (chi^2)
- Verwachte frequentie: `E_ij = (rijtotaal_i * kolomtotaal_j) / N`
- Daarna: tel voor alle cellen `(O - E)^2 / E` op
- Noteer het resultaat als `chi_kwadraat`

6) Extra + meerkeuze
- `kans_no_bij_vrouwen` = P(NO | Vrouw) = (NO bij vrouwen) / (totaal vrouwen)
- Meerkeuze: "Wat is de kans dat een willekeurige vrouw **geen** misdrijf pleegde?"
  - A. 30%
  - B. 15%
  - C. 85%
  - D. 6%
  - Zet je keuze in `antwoord_mc` (A=1, B=2, C=3, D=4)

Afronden: percentages op 2 decimalen, odds op 4 decimalen, OR op 2 decimalen, chi^2 op 4 decimalen.
