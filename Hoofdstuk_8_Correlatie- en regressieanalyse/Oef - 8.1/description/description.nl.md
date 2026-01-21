Voor verschillende ontwikkelingslanden is koffie een belangrijk exportartikel. Wanneer koffieprijzen hoog zijn, kappen boeren soms bossen om meer koffiebomen te planten. Hieronder staan gegevens voor Indonesie: de prijs die koffieverbouwers kregen en het percentage ontbossing in een nationaal park, gemeten over vijf jaar.

**Tabel 1**

*Koffieprijs en ontbossing (5 jaar)*

<table style="border-collapse: collapse; width: 55%; margin: 20px auto; font-family: Times, serif;">
<thead>
<tr style="border-top: 2px solid #000; border-bottom: 2px solid #000;">
<th style="padding: 6px 8px; text-align: center; font-weight: bold;">Prijs (dollarcent per Am. pond)</th>
<th style="padding: 6px 8px; text-align: center; font-weight: bold;">Ontbossing (%)</th>
</tr>
</thead>
<tbody>
<tr><td style="padding: 4px 8px; text-align: center;">29</td><td style="padding: 4px 8px; text-align: center;">0.49</td></tr>
<tr><td style="padding: 4px 8px; text-align: center;">40</td><td style="padding: 4px 8px; text-align: center;">1.59</td></tr>
<tr><td style="padding: 4px 8px; text-align: center;">54</td><td style="padding: 4px 8px; text-align: center;">1.69</td></tr>
<tr><td style="padding: 4px 8px; text-align: center;">55</td><td style="padding: 4px 8px; text-align: center;">1.82</td></tr>
<tr style="border-bottom: 2px solid #000;"><td style="padding: 4px 8px; text-align: center;">72</td><td style="padding: 4px 8px; text-align: center;">3.10</td></tr>
</tbody>
</table>

Je berekent alles **met de hand** (rekenmachine mag). In R vul je enkel je **eindresultaten** in (geen R-berekeningen nodig).

## Opgaven (vul de variabelen in de boilerplate)
1) Wat is de verklarende variabele?
- `verklarende_variabele` = 1 (prijs) of 2 (ontbossing)

2) Hoeveel bedraagt Pearson's correlatie tussen prijs en ontbossing?
- Vul `pearson_r` in als getal en rond af op 3 decimalen.
- Hint: `r = cov(x,y) / (s_x * s_y)`.

3) De prijs werd uitgedrukt in dollars. Als de prijs in euro zou worden uitgedrukt (dus elke waarde wordt vermenigvuldigd met een constante en eventueel verschoven), verandert de correlatie dan?
- `correlatie_verandert` = 1 (ja) of 2 (nee)
- Geef een korte verklaring in `verklaring_euro` (1-3 zinnen).

**Instructie:** In de boilerplate vervang je `???` door je antwoord. Gebruik decimalen met punt (niet komma) en geen procentteken.
