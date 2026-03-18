Een criminoloog onderzoekt de relatie tussen **politie-aanwezigheid (X)** en **inbraken (Y)** in wijken.
De variabelen zijn:
- **X** = gemiddeld aantal politie-uren per week
- **Y** = aantal inbraken per 1.000 inwoners per jaar

---

Bekijk de onderstaande scatterplot. Punt **P** is rood aangeduid.

<img src="media/punt_P_lijn.png" alt="Scatterplot met regressielijn en punt P" width="600">

De regressielijn geeft voor elke X-waarde een **voorspeld** inbraakcijfer (Y-dak).
Vergelijk het werkelijke inbraakcijfer van wijk P met de voorspelling van de regressielijn.

Kies de bijpassende code:

| Code | Betekenis |
|------|-----------|
| 1    | P ligt **boven** de regressielijn (Y > Y-dak, residu positief) |
| 2    | P ligt **op** de regressielijn (Y = Y-dak, residu = 0) |
| 3    | P ligt **onder** de regressielijn (Y < Y-dak, residu negatief) |

> **Tip:** Kijk naar de verticale positie van P ten opzichte van de lijn,
> niet naar de absolute hoogte van het punt in de grafiek.

```r
punt_positie <- ???   # 1 = boven, 2 = op, 3 = onder
```
