# Oefening 3.5: Spreidingsmaat bij politietoezicht

Een criminoloog onderzoekt of het **aantal uren patrouilleren per dag** door politieagenten een effect heeft op het **aantal geregistreerde incidenten per wijk**. Hij verzamelde onderstaande gegevens.

<table style="border-collapse: collapse; width: 60%; margin: 20px auto; font-family: Times, serif;">
  <thead>
    <tr style="border-top: 2px solid #000; border-bottom: 2px solid #000;">
      <th style="padding: 6px 8px; text-align: center; font-weight: bold;">Aantal geregistreerde incidenten<br>(AV)</th>
      <th style="padding: 6px 8px; text-align: center; font-weight: bold;">Aantal uren patrouilleren<br>per dag (OV)</th>
    </tr>
  </thead>
  <tbody>
    <tr><td style="padding: 4px 8px; text-align: center;">2</td><td style="padding: 4px 8px; text-align: center;">5</td></tr>
    <tr><td style="padding: 4px 8px; text-align: center;">7</td><td style="padding: 4px 8px; text-align: center;">3</td></tr>
    <tr><td style="padding: 4px 8px; text-align: center;">10</td><td style="padding: 4px 8px; text-align: center;">4</td></tr>
    <tr><td style="padding: 4px 8px; text-align: center;">5</td><td style="padding: 4px 8px; text-align: center;">2</td></tr>
    <tr><td style="padding: 4px 8px; text-align: center;">6</td><td style="padding: 4px 8px; text-align: center;">1</td></tr>
    <tr><td style="padding: 4px 8px; text-align: center;">8</td><td style="padding: 4px 8px; text-align: center;">3</td></tr>
    <tr><td style="padding: 4px 8px; text-align: center;">3</td><td style="padding: 4px 8px; text-align: center;">2</td></tr>
    <tr><td style="padding: 4px 8px; text-align: center;">4</td><td style="padding: 4px 8px; text-align: center;">1</td></tr>
    <tr><td style="padding: 4px 8px; text-align: center;">9</td><td style="padding: 4px 8px; text-align: center;">4</td></tr>
  </tbody>
</table>

## Opdracht

Bereken de **meest relevante maat van spreiding** voor de afhankelijke variabele (AV) *aantal geregistreerde incidenten* en vul de ontbrekende waarden in de R-code aan.

**Verwachte werkwijze (stap voor stap):**

1. **Data invoeren en gemiddelde berekenen** voor de AV.
2. **Afwijkingen van het gemiddelde** bepalen, kwadrateren en optellen (*sum of squares*).
3. **Steekproefvariantie** berekenen met `n - 1` in de noemer.
4. **Standaarddeviatie** nemen als vierkantswortel van de variantie.
5. **Keuze van spreidingsmaat** motiveren: voor interval/ratio-gegevens is de standaarddeviatie doorgaans de meest informatieve maat.

**Meerkeuze (kies de correcte spreidingsmaat voor de AV):**

- 7,5  
- 2,74  
- 2,8  
- 7,85

## In te vullen code

Vervang `???` door de juiste waarden of functies.

```r
# Data
incidenten <- c(2, 7, 10, 5, 6, 8, 3, 4, 9)
patrouille_uren <- c(5, 3, 4, 2, 1, 3, 2, 1, 4)

# Centrummaten
gemiddelde_incidenten <- ???

# Afwijkingen en spreiding
afwijkingen <- ???
gekwadrateerde_afwijkingen <- ???
sum_of_squares <- ???
variantie_incidenten <- ???
standaarddeviatie_incidenten <- ???

# Kies de juiste maat van spreiding voor de AV (gebruik decimale punt)
gekozen_spreidingsmaat <- ???
```

**Instructies:**
- Gebruik een **decimale punt** (bijv. `2.74`, niet `2,74`).
- Rond `standaarddeviatie_incidenten` af op **twee decimalen**.
- Controleer of je `variantie_incidenten` als **steekproefvariantie** berekent.
