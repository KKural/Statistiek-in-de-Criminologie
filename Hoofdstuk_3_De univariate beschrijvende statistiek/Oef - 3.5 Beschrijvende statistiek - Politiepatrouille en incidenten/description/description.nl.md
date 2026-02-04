Een criminoloog onderzoekt of het **aantal uren patrouilleren per dag** door politieagenten een effect heeft op het **aantal geregistreerde incidenten per wijk**. Hij verzamelde onderstaande gegevens voor 9 wijken (AV = incidenten, OV = patrouille-uren).

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


Bereken de **meest relevante maat van spreiding** voor de afhankelijke variabele (AV) *aantal geregistreerde incidenten*. Vul de ontbrekende waarden in de R-code aan.

### Te volgen stappen
1. **Gemiddelde** van de incidenten berekenen.
2. **Afwijkingen**: elke waarde minus het gemiddelde.
3. **Kwadraten**: afwijkingen kwadrateren en optellen (*sum of squares*).
4. **Steekproefvariantie**: `SS / (n - 1)`.
5. **Standaarddeviatie**: wortel uit de variantie. Dit is de gekozen spreidingsmaat voor interval/ratio-gegevens.

### Instructie voor de code
Vervang `???` door het juiste antwoord. Gebruik een **decimale punt** en rond de standaarddeviatie af op **twee decimalen**.
