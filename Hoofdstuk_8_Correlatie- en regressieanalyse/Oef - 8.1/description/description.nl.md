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

---

## Berekeningsstappen voor Pearson's correlatie

Om de correlatie te berekenen, moet je de volgende tussenstappen uitvoeren (maak een tabel zoals in Hoofdstuk 8):

1. **Bereken het gemiddelde** van X (prijs) en Y (ontbossing): x̄ en ȳ
2. **Bereken de afwijkingen** van het gemiddelde voor elke waarneming:
   - (x - x̄) voor elke prijswaarde
   - (y - ȳ) voor elke ontbossingswaarde
3. **Kwadrateer de afwijkingen**:
   - (x - x̄)² voor elke waarneming
   - (y - ȳ)² voor elke waarneming
4. **Bereken de kruisproducten**: (x - x̄)·(y - ȳ) voor elke waarneming
5. **Som alle waarden** op:
   - SSx = Σ(x - x̄)² (variatie in X)
   - SSy = Σ(y - ȳ)² (variatie in Y)
   - SSxy = Σ(x - x̄)·(y - ȳ) (covariatie)
6. **Bereken de varianties**: s²x = SSx/(n-1) en s²y = SSy/(n-1)
7. **Bereken de standaardafwijkingen**: sx = √s²x en sy = √s²y
8. **Bereken de covariantie**: s²xy = SSxy/(n-1)
9. **Bereken Pearson's r**: r = s²xy / (sx · sy)

**Tip:** Maak een tabel met kolommen voor: Prijs, x-x̄, (x-x̄)², Ontbossing, y-ȳ, (y-ȳ)², en (x-x̄)·(y-ȳ). Dit helpt je om georganiseerd te werken en fouten te vermijden.

---

## Opgaven (vul de variabelen in de boilerplate)

### Deel A: Basisvragen

1) **Wat is de verklarende variabele?**
   - `verklarende_variabele` = 1 (prijs) of 2 (ontbossing)

### Deel B: Gemiddelden

2) **Bereken het gemiddelde van de prijs (x̄)**
   - `gemiddelde_x` (rond af op 2 decimalen)

3) **Bereken het gemiddelde van ontbossing (ȳ)**
   - `gemiddelde_y` (rond af op 4 decimalen)

### Deel C: Afwijkingen en gekwadrateerde afwijkingen

4) **Bereken de som van de gekwadrateerde afwijkingen van X (SSx)**
   - `SSx` (geheel getal of 1 decimaal)

5) **Bereken de som van de gekwadrateerde afwijkingen van Y (SSy)**
   - `SSy` (rond af op 4 decimalen)

6) **Bereken de som van de kruisproducten (SSxy)**
   - `SSxy` (rond af op 2 decimalen)

### Deel D: Varianties en standaardafwijkingen

7) **Bereken de variantie van X (s²x = SSx/(n-1))**
   - `variantie_x` (rond af op 1 decimaal)

8) **Bereken de variantie van Y (s²y = SSy/(n-1))**
   - `variantie_y` (rond af op 4 decimalen)

9) **Bereken de standaardafwijking van X (sx = √s²x)**
   - `sd_x` (rond af op 4 decimalen)

10) **Bereken de standaardafwijking van Y (sy = √s²y)**
    - `sd_y` (rond af op 4 decimalen)

11) **Bereken de covariantie (s²xy = SSxy/(n-1))**
    - `covariantie` (rond af op 4 decimalen)

### Deel E: Pearson's correlatie

12) **Bereken Pearson's r (r = s²xy / (sx · sy))**
    - `pearson_r` (rond af op 4 decimalen)

### Deel F: Interpretatie

13) **De prijs werd uitgedrukt in dollars. Als de prijs in euro zou worden uitgedrukt (dus elke waarde wordt vermenigvuldigd met een constante en eventueel verschoven), verandert de correlatie dan?**
    - `correlatie_verandert` = 1 (ja) of 2 (nee)
    - Geef een korte verklaring in `verklaring_euro` (1-3 zinnen)

---

**Instructie:** In de boilerplate vervang je `???` door je antwoord. Gebruik decimalen met punt (niet komma) en geen procentteken.
