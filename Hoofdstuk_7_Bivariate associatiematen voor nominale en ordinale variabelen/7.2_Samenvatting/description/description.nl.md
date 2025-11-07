# **Samenvatting**

## **1. Percentageverschil (nominaal)**
Een kruistabel toont hoe twee nominale variabelen gecombineerd voorkomen. De **celfrequenties** geven het aantal observaties per categoriecombinatie weer, terwijl **rij- en kolomtotalen** de marginale verdelingen vormen.  
Omdat absolute aantallen vaak misleidend kunnen zijn (door verschillende groepsgroottes), worden ze omgezet naar **percentages**.  

De **richting van percenteren** hangt af van de rol van de variabelen:
- Als de afhankelijke variabele in de **rijen** staat, berekenen we **kolompercentages**.  
- Staat de afhankelijke variabele in de **kolommen**, dan berekenen we **rijpercentages**.  

Voorbeeld: bij de relatie tussen *geslacht* en *betrokkenheid bij een jeugdgroep* blijkt dat 3,6% van de meisjes en 8,3% van de jongens betrokken is bij een problematische jeugdgroep — een verschil van **4,7 procentpunten**.  

> **Richtlijnen:**  
> - Vermeld altijd het totaal aantal observaties (**N**) bij gebruik van percentages.  
> - Bereken geen percentages wanneer het aantal observaties kleiner is dan 30.  

---

## **2. Odds en Odds Ratio (nominaal, asymmetrisch)**
De **odds** drukken de verhouding uit tussen het voorkomen en niet-voorkomen van een gebeurtenis.  
De **odds ratio (OR)** vergelijkt twee odds en toont hoe sterk de kans op een gebeurtenis verschilt tussen groepen.  

Bijvoorbeeld: meisjes hebben odds 26,84 (1208/45) om *niet* betrokken te zijn bij een jeugdgroep, tegenover 11,08 (1120/101) bij jongens.  
De **odds ratio** = 26,84 / 11,08 = **2,42**. Meisjes hebben dus 2,4 keer meer kans om niet betrokken te zijn.  

De OR = 1 wijst op geen verband; hoe verder van 1 (richting 0 of ∞), hoe sterker de associatie.  
Deze maat vormt de basis voor **logistische regressie** en is minder gevoelig voor steekproefverschillen.

---

## **3. Chi-kwadraat (X²)**
De **chi-kwadraattoets** vergelijkt de **geobserveerde** frequenties met de **verwachte** frequenties als er geen verband zou bestaan.  
De formule is:  
\[
X² = \sum \frac{(O - E)^2}{E}
\]  

Een hogere X² wijst op een sterkere afwijking van onafhankelijkheid, maar de waarde groeit met de steekproefgrootte.  
Daarom worden genormaliseerde maten zoals **Phi** en **Cramer’s V** gebruikt.

> **Voorwaarden voor X²:**  
> - Enkel ruwe frequenties, geen percentages.  
> - Categorieën moeten elkaar uitsluiten.  
> - Maximaal 20% van de cellen mag **E < 5** hebben, geen enkele **E = 0**.  

---

## **4. Phi (2×2 tabellen)**
**Phi (Φ)** is een gestandaardiseerde versie van de chi-kwadraat voor 2×2-tabellen.  
De waarde ligt tussen **0 (geen verband)** en **1 (perfect verband)**.  
In het voorbeeld over geslacht en jeugdgroep geldt **Φ = 0,10**, wat een zwakke associatie aanduidt.  

---

## **5. Cramer’s V (r×k tabellen)**
**Cramer’s V** wordt gebruikt bij tabellen groter dan 2×2 en corrigeert voor de steekproefgrootte.  
De waarde varieert van **0 tot 1**, waarbij 0 geen verband betekent en 1 een perfecte associatie.  
In ons voorbeeld met twee categorieën geldt **V = 0,10**, eveneens een zwak verband.  

---

## **6. Gamma (ordinaal)**
**Gamma (Γ)** wordt toegepast bij ordinale variabelen en is gebaseerd op het aantal **consistente** (CP) en **inconsistente** (IP) paren.  
De formule is:  
\[
\Gamma = \frac{CP - IP}{CP + IP}
\]  
De waarde varieert van **−1 tot +1**; het teken duidt de richting aan, de absolute waarde de sterkte.  

Voorbeeld: *houding tegenover regels* en *spijbelende vrienden* → **Γ = 0,328**, wat wijst op een matig positief verband.

---

## **7. Spearman’s Rho en Kendall’s Tau-b (ordinaal)**
Beide maten meten de **rangcorrelatie** tussen twee ordinale variabelen.  
- **Spearman’s Rho (ρ)**: afgeleid van de Pearson-correlatie, gevoelig voor rangverschillen.  
- **Kendall’s Tau-b (τb)**: robuuster bij gebonden rangen.  

De waarden variëren tussen **−1 en +1**.  
Voorbeeld: *regels breken* en *spijbelende vrienden* → **Rho = 0,226**, **Tau-b = 0,203** → matige positieve samenhang.  

---

## **8. Samenvattend overzicht**
- **Nominaal**: percentageverschil, odds ratio, chi-kwadraat, Phi, Cramer’s V.  
- **Ordinaal**: Gamma, Spearman’s Rho, Kendall’s Tau-b.  
Elke maat biedt een ander perspectief op de sterkte en richting van relaties, afhankelijk van het meetniveau.
