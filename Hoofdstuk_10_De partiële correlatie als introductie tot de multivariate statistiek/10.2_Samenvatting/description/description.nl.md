* **Partiële correlatie** meet het verband tussen twee variabelen **na controle voor één of meer derde variabelen**.

* **Formule voor eerste-orde partiële correlatie**:
  $$r_{xy.z} = \frac{r_{xy} - r_{xz} \cdot r_{yz}}{\sqrt{(1-r_{xz}^2)(1-r_{yz}^2)}}$$

* **Interpretatie**:
  * **|r_{xy.z}| < |r_{xy}|**: derde variabele verklaart een deel van het verband (mediatie)
  * **|r_{xy.z}| ≈ |r_{xy}|**: derde variabele heeft weinig invloed
  * **r_{xy.z} ≈ 0** maar **r_{xy} ≠ 0**: schijnverband (suppressie)

* **Controlevariabelen kiezen**:
  * **Theoretisch relevant**: moet logisch verband hebben met X en Y
  * **Temporele volgorde**: controlevariabele komt meestal eerder in tijd
  * **Niet te veel tegelijk**: elke controlevariabele kost vrijheidsgraden

* **Multivariate logica**:
  * **Directe effecten**: X → Y (na controle voor Z)
  * **Indirecte effecten**: X → Z → Y (mediatie)
  * **Schijnverbanden**: X ← Z → Y (confounding)

* **Beperkingen**:
  * Alleen lineaire verbanden
  * Assumpties van Pearson correlatie blijven gelden
  * Causale interpretatie vereist theoretische onderbouwing