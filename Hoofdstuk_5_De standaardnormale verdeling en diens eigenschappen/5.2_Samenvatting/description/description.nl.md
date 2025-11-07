* **Normale verdeling (N(μ,σ))**:

  * Symmetrisch, klokvormig en unimodaal (één piek).
  * μ bepaalt het **centrum** van de verdeling; σ bepaalt de **spreiding** en de positie van de buigpunten (μ ± σ).
  * 50% van de observaties ligt boven, 50% onder het gemiddelde.

* **Belangrijke vuistregels voor kansen:**

  * Ongeveer **68%** ligt binnen μ ± 1σ
  * Ongeveer **95%** ligt binnen μ ± 1.96σ
  * Ongeveer **99.7%** ligt binnen μ ± 3σ
    Deze regel noemt men de **68–95–99.7-regel**.

* **Van normale naar standaardnormale verdeling:**

  * Omdat elke normale verdeling andere waarden heeft, wordt ze **gestandaardiseerd** zodat μ = 0 en σ = 1.
  * Formule:
    $$Z = \frac{X - μ}{σ}$$
  * Hierdoor kunnen kansen worden opgezocht in één tabel of berekend met `pnorm()` (R).

* **Voorbeeld:**

  * Gewicht ~ N(75,4).
  * Wat is P(X > 81)?
    Z = (81−75)/4 = 1.5 → kans links van 81 is 0.9332 → rechts is 1−0.9332 = **0.0668 (6.68%)**.

* **Toepassing:**
  De standaardnormale verdeling maakt het mogelijk om kansen te berekenen, waarden te vergelijken, en conclusies te trekken over populaties op basis van steekproeven.