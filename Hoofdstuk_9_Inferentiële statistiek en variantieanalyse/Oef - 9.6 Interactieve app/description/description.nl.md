# **Interactieve app — inferentiële statistiek en ANOVA**

In deze oefening oefen je met de **interactieve Shiny-app** voor inferentiële statistiek en variantieanalyse. Je weet al hoe de app werkt vanuit **Oefening 8.2** — hier pas je dezelfde werkwijze toe op de leerstof van Hoofdstuk 9.

De app is beschikbaar op:

**<a href='https://statistiek-in-de-criminologie.shinyapps.io/anova-app/' target='_blank' rel='noopener noreferrer'>Interactieve ANOVA-oefeningen — Statistiek in de Criminologie</a>**

> **Let op:** Vraag je docent om de app te starten als deze niet beschikbaar is.

---

## **Wat oefen je in deze app?**

Selecteer het tabblad **"Inferentiële statistiek & ANOVA"** in de app. Je krijgt een criminologisch scenario met groepsdata en oefent:

- De **nulhypothese (H₀)** en **alternatieve hypothese (H₁)** formuleren
- De **F-waarde** berekenen via tussen- en binnengroepsvariantie
- De **kritieke F-waarde** opzoeken en je berekende **F-waarde** vergelijken met het significantieniveau (α = 0.05)
- Beslissen of je H₀ **verwerpt of behoudt**
- Het resultaat **interpreteren** in criminologische context

> **Praktische noot:** In deze oefening hoeven studenten de **p-waarde niet handmatig te berekenen**. De beslissing over significantie gebeurt via de klassieke regel: vergelijk je berekende **F** met **Fkrit** uit een **F-tabel** bij α = 0.05, met `df_between = k - 1` als teller-vrijheidsgraden en `df_within = N - k` als noemer-vrijheidsgraden. Een bruikbare F-tabel vind je hier: <https://www.statology.org/f-distribution-table/>

---

## **Scenario's in de app**

De app bevat onder andere:

- **Straftoemeting per arrondissement** — Verschilt de gemiddelde straf per rechterlijk arrondissement?
- **Recidive per type detentie** — Is er een significant verschil in recidive tussen open, halfopen en gesloten instellingen?
- **Rapportagebereidheid per slachtoffergroep** — Rapporteren slachtoffers van verschillende misdrijftypen even vaak aan de politie?

Elk scenario doorloopt dezelfde vijf stappen: hypothesen → F-waarde → kritieke waarde → beslissing → interpretatie.
