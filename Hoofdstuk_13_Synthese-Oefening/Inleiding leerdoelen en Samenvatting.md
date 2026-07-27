**Inleiding**  
Hoofdstuk 13 is het afsluitende hoofdstuk van de cursus en heeft geen nieuw theoriemateriaal. In plaats daarvan integreert het alle concepten uit Hoofdstukken 1–12 in de **Synthese-Oefening**: een gegenereerde examenoefening waarbij je werkt met een kruistabel, een regressiedataset en een padmodel. Elk van de 21 vragen vraagt je om een concept correct toe te passen, een formule in te vullen of een uitspraak kritisch te beoordelen. De oefening simuleert de werkwijze en breedte van een echt examen.

**Leerdoelen**  
Na dit hoofdstuk kan je:  
- Voorwaardelijke kansen aflezen uit een kruistabel en beoordelen of een gegeven uitspraak correct is.  
- Conditionele percentages, odds en de odds-ratio berekenen en interpreteren voor twee categorische variabelen.  
- De minimaal vereiste steekproefomvang berekenen met de formule $n = \left(\frac{z \cdot \sigma}{E}\right)^2$ en de uitkomst naar boven afronden.  
- Een éénzijdige z-toets uitvoeren: de z-waarde berekenen, de bijbehorende kans opzoeken en de beslissing motiveren.  
- Een chi-kwadraatresultaat (χ², df, α) correct rapporteren en de conclusie voor H₀ formuleren.  
- Type-I en Type-II fouten onderscheiden in concrete criminologische onderzoekssituaties.  
- De mediaan bepalen vanuit een frequentieverdeling op ordinale schaal.  
- Kansen en intervalwaarden berekenen voor een normaalverdeling op basis van gegeven μ en σ.  
- Het onderscheid uitleggen tussen een ongestandaardiseerde regressiecoëfficiënt (b) en een gestandaardiseerde coëfficiënt (β).  
- Interactie, mediatie en confounding conceptueel onderscheiden aan de hand van een beschrijving.  
- De definitie van vrijheidsgraden toepassen en de multiple correlatiecoëfficiënt R correct omschrijven.  
- Een bivariaat regressieverband interpreteren: intercept (a), helling (b), determinatiecoëfficiënt R², en het onverklaard aandeel (1 − R²).  
- De SSBetween berekenen in een one-way ANOVA voor een dichotome groepsvariabele en de F-waarde vergelijken met de kritieke waarde.  
- De partiële correlatie r(X₁,Y|X₂) interpreteren en vergelijken met de zero-order correlatie r(X₁,Y).  
- Exogene en endogene variabelen correct identificeren in een paddiagram.  
- Directe, indirecte en totale effecten berekenen in een recursief padmodel met twee mediatoren.  
- Het aantal indirecte routes van een exogene variabele naar de uitkomst systematisch tellen.

---

**Samenvatting**

**1 — Kruistabel en kansen**

Een kruistabel toont de gezamenlijke verdeling van twee categorische variabelen. De **voorwaardelijke kans** $P(A|B)$ lees je af als het rijaandeel: het aantal cellen A binnen rij B gedeeld door het rijtotaal. De **odds** voor een categorie zijn $\frac{P(\text{ja})}{P(\text{nee})}$. De **odds-ratio** is de verhouding van de odds in beide rijen:

$$OR = \frac{\text{odds}_1}{\text{odds}_2}$$

Een OR > 1 wijst op een hogere kans in rij 1 dan in rij 2; OR = 1 wijst op geen verschil. De **chi-kwadraattoets** toetst of het verband in de populatie nul is. Rapporteer: χ²-waarde, df, kritieke waarde en beslissing voor H₀.

---

**2 — Inferentiële statistiek**

| Techniek | Toepassing | Beslissingsregel |
|----------|-----------|-----------------|
| z-toets | μ toetsen bij bekende σ | Bereken $z = \frac{\bar{x} - \mu_0}{\sigma / \sqrt{n}}$; vergelijk met $z_{\alpha}$ |
| Chi-kwadraat | Verband tussen twee nominale variabelen | Vergelijk χ² met de kritieke waarde bij df = (r−1)(k−1) |
| One-way ANOVA | Gemiddelden vergelijken over groepen | Bereken $F = \frac{SS_{\text{between}}/df_1}{SS_{\text{within}}/df_2}$; vergelijk met $F_{\text{krit}}$ |

**Type-I fout:** H₀ onterecht verworpen — de onderzoeker besluit dat er een effect is terwijl er in werkelijkheid geen is (αkans).  
**Type-II fout:** H₀ onterecht behouden — de onderzoeker mist een reëel effect (β-kans).

**Minimale steekproefomvang** (betrouwbaarheidsinterval):

$$n = \left\lceil \left(\frac{z \cdot \sigma}{E}\right)^2 \right\rceil$$

Rond het tussenresultaat niet af; rond pas het eindresultaat naar boven af op het eerstvolgende gehele getal.

---

**3 — Normaalverdeling**

Voor een normaalverdeling met μ en σ:

$$z = \frac{x - \mu}{\sigma}$$

De kans $P(X \leq x)$ lees je af uit de standaardnormaaltabel via z. Voor een interval $[x_1, x_2]$: bereken beide z-waarden en neem het verschil in kansen. Het 95%-betrouwbaarheidsinterval loopt van $\mu - 1{,}96\sigma$ tot $\mu + 1{,}96\sigma$. De **variantie** is $\sigma^2$, niet $\sigma$.

---

**4 — Regressie en correlatie**

**Bivariaat:**  
$\hat{Y} = a + b \cdot X_1$  
- $b$ = ongestandaardiseerde helling: de verwachte verandering in Y per 1 eenheid X.  
- $\beta$ = gestandaardiseerde coëfficiënt: uitgedrukt in standaardafwijkingen — vergelijkbaar over predictoren, maar niet interpreteerbaar in de eenheid van Y.  
- $R^2$ = aandeel verklaarde variantie; $1 - R^2$ = onverklaard aandeel.

**Meervoudig:**  
$\hat{Y} = a + b_1 X_1 + b_2 X_2$  
- De **partiële correlatie** r(X₁,Y|X₂) meet het verband tussen X₁ en Y nadat de invloed van X₂ op beide variabelen is weggefilterd.  
- Een partiële r kan kleiner of groter zijn dan de zero-order r (suppressievariabele).  
- **Multiple R** = correlatie tussen geobserveerde en voorspelde waarden: $R = r(Y, \hat{Y}) \geq 0$ per definitie.

**One-way ANOVA (dichotome predictor):**  
$$SS_{\text{between}} = n_0(\bar{Y}_0 - \bar{Y})^2 + n_1(\bar{Y}_1 - \bar{Y})^2$$  
$$\eta = \sqrt{\frac{SS_{\text{between}}}{SS_{\text{total}}}}$$

---

**5 — Padmodellen**

Een **recursief padmodel** bestaat uit:

| Term | Definitie |
|------|-----------|
| Exogene variabele | Geen inkomende pijlen; wordt niet verklaard door het model |
| Endogene variabele | Minstens één inkomende pijl; heeft een eigen $R^2$ |
| Mediator | Zowel endogeen (inkomende pijl) als oorzaak van een andere variabele (uitgaande pijl) |

**Structuur** in de Synthese-Oefening: Xa → Xb; Xa → M1; M1 → M2; M2 → Y; M1 → Y; Xb → M2

**Effecten berekenen:**

- **Direct effect** van A op B = de padcoëfficiënt op de pijl A → B  
- **Indirect effect** via een keten = *product* van alle padcoëfficiënten langs die route  
  - Xa → M1 → Y: $a \times e$  
  - Xa → M1 → M2 → Y: $a \times d \times f$  
  - Xa → Xb → M2 → Y: $c \times g \times f$  
- **Totaal effect** = direct effect + som van alle indirecte effecten

**Vrijheidsgraden** zijn het aantal informatie-eenheden dat vrij kan variëren nadat de restricties van het model zijn opgelegd.

---

**6 — Interactie, mediatie en confounding**

| Patroon | Omschrijving |
|---------|-------------|
| **Mediatie** | X beïnvloedt Y via een tussenvariabele M (X → M → Y) |
| **Interactie / moderatie** | Het effect van X op Y verschilt naargelang het niveau van een derde variabele Z (conditioneel effect) |
| **Confounding** | X en Y hangen beide samen met een derde variabele; het ogenschijnlijke verband is (deels) spurieus |

Het onderscheid is conceptueel: dezelfde data kunnen meerdere verhalen vertellen — de theoretische onderbouwing bepaalt welk model gepast is.
