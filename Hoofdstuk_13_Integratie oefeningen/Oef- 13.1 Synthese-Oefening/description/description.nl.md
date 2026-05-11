# DODONA SYNTHESE-OEFENING — HOOFDSTUK 13

## Introductie

De **Synthese-Oefening** (Hoofdstuk 13) is een interactieve examenoefening die concepten uit alle voorgaande hoofdstukken integreert. Elke run genereert een willekeurige dataset op basis van een **datasetcode** (seed). Studenten werken met drie vaste datatabellen en beantwoorden 21 meerkeuzevragen.

---

## Structuur van de oefening

De oefening bestaat uit drie gegevensbronnen die per datasetcode uniek zijn:

| Bron | Inhoud |
|------|--------|
| **Tabel 1** | Kruistabel (2 categorische variabelen, totalen ≈ 3.200–6.800 per rij) |
| **Tabel 2** | Lineaire regressiedataset met N = 6 eenheden, twee continue predictoren (X₁, X₂), één continue uitkomst (Y), en één dichotome variabele |
| **Figuur 1** | Padmodel met 5 variabelen: twee exogene startpunten (Xa, Xb), twee mediatoren (M1, M2), en één uitkomst (Y) |

---

## Scenario's

Bij elke run wordt willekeurig één criminologisch scenario gekozen als context voor Tabel 2 en Figuur 1:

| Scenario | Eenheid | X₁ | X₂ | Y |
|----------|---------|----|-----|---|
| Criminaliteitspreventie-programma | Buurt | Programma-blootstelling (%) | Politiezichtbaarheid (0-10) | Inbraakcijfer (per 1.000) |
| Hot-spot politiestrategie | Straat | Voetpatrouille-uren (uren/week) | Reactietijd (min.) | Meldingen aan politie (per week) |
| Angst voor criminaliteit en buurtwanorde | Buurt | Wanorde-index (0-10) | Collectieve effectiviteit (0-10) | Angstscore (0-100) |
| Politie-publiek relaties | District | Procedurele rechtvaardigheid (1-7) | Respect (1-7) | Vertrouwen in politie (1-7) |
| Toezicht en slachtofferschap | Huishouden | Toezicht (0-10) | Buitenverlichting (0-10) | Slachtofferschap (aantal) |
| Biosociaal risico | Student | Impulsiviteit (z-score) | Ouderlijk toezicht (0-10) | Agressieve incidenten (aantal) |
| Re-integratiebegeleiding en recidiverisico | Deelnemer | Ondersteuningsuren (per maand) | Huisvestingsondersteuning (0-10) | Recidiverisico (0-100) |
| Cybercrime-bewustmakingstraining | Medewerker | Trainingsuren (uren) | Quizscores (0-100) | Klikratio (%) |

Tabel 1 gebruikt telkens een willekeurige kruistabelcontext (bv. Geslacht × Slachtofferschap, Opleiding × Veroordeling).

---

## Vragen per sectie

### Sectie A — Tabel 1 (kruistabel)

| Vraag | Onderwerp | Type |
|-------|-----------|------|
| Q1 | Voorwaardelijke kans lezen en beoordelen | JUIST/FOUT (2 opties) |
| Q6 | Percentageverschil of odds-ratio berekenen en interpreteren | 1-uit-5 |

### Sectie B — Algemene statistiek (geen tabel nodig)

| Vraag | Onderwerp | Type |
|-------|-----------|------|
| Q2 | Betrouwbaarheidsinterval en foutenmarge | 1-uit-4 |
| Q3 | Type-I en Type-II fouten in criminologische context | 1-uit-2 |
| Q4 | Definitie en eigenschappen van multiple R | JUIST/FOUT (2 opties) |
| Q5 | Mediaan uit frequentieverdeling (ordinale schaal) | 1-uit-4 |
| Q7 | Normaalverdeling: kansen en intervallen berekenen (μ en σ variëren) | 1-uit-5 |
| Q8 | Minimale steekproefomvang berekenen: n = (z·σ/E)² | 1-uit-4 |
| Q13 | Chi-kwadraattoets rapporteren (df=2, α=0.05; χ²-waarde varieert) | JUIST/FOUT (2 opties) |
| Q14 | Éénzijdige z-toets: p-waarde berekenen (H₀: μ=μ₀; μ, σ, n, x̄ variëren) | 1-uit-4 |
| Q15 | Interactie-effect onderscheiden van mediatie en confounding | 1-uit-3 |
| Q16 | Definitie van vrijheidsgraden | JUIST/FOUT (2 opties) |
| Q17 | Gestandaardiseerde β vs. ongestandaardiseerde b | 1-uit-3 |

### Sectie C — Tabel 2 (regressiedataset)

| Vraag | Onderwerp | Type |
|-------|-----------|------|
| Q10 | Bivariaat regressieverband (a, b, R², R²-interpretatie) | 1-uit-5 |
| Q11 | One-way ANOVA: SSBetween, F, η voor dichotome variabele (α=0.01) | 1-uit-5 |
| Q12 | Partiële correlatie r(X₁,Y\|X₂): vergelijking met zero-order r | 1-uit-5 |

### Sectie D — Figuur 1 (padmodel)

| Vraag | Onderwerp | Type |
|-------|-----------|------|
| Q9 | Identificeer de FOUT uitspraak over het padmodel | 1-uit-5 |
| Q18 | Identificeer de exogene variabele | 1-uit-5 (gepoold) |
| Q19 | Onderscheid exogene / endogene / intermediaire variabelen | 1-uit-5 |
| Q20 | Tel het aantal indirecte effecten van Xa op Y | 1-uit-5 (gepoold) |
| Q21 | Bereken het totale effect van M1 op Y (direct + indirect via M2) | 1-uit-5 (gepoold) |

---

## Padmodelscenario's (Figuur 1)

Het padmodel heeft altijd dezelfde structuur (Xa → Xb; Xa → M1; M1 → M2; M2 → Y; M1 → Y; Xb → M2), maar de variabelenamen variëren per run:

| Scenario | Xa | Xb | M1 | M2 | Y |
|----------|----|----|-----|-----|---|
| Morele vorming bij adolescenten | Hechting ouders-kind | Sociale controle door ouders | Conventionele morele normen | Zelfcontrole | Altruisme |
| Schoolbinding en normovertreding | Band met school | Leerkrachttoezicht | Conventionele normen | Afwijzing van geweld | Delinquente intentie |
| Gezinsklimaat en cyberpesten | Gezinscohesie | Ouderlijke monitoring | Morele afkeuring cyberpesten | Digitale zelfcontrole | Cyberpestgedrag |
| Buurtcontext en regelnaleving | Buurtbinding | Informele sociale controle | Normatieve legitimiteit | Zelfregulatie | Regelnaleving |
| Empathie en moreel oordeel | Empathische perspectiefneming | Empathische bezorgdheid | Morele intuïties | Geanticipeerde schuld | Moreel oordeel |
| Re-integratie na detentie | Begeleidingskwaliteit | Sociale steun | Legitieme kansen | Zelfcontrole | Regelnaleving na vrijlating |

---

## Puntenverdeling

De oefening telt **21 vragen**. Elke vraag telt voor één punt.

- **Sectie A** (Tabel 1): 2 punten
- **Sectie B** (Algemene statistiek): 11 punten
- **Sectie C** (Tabel 2): 3 punten
- **Sectie D** (Padmodel): 5 punten

Een score onder 50% toont een adviesvenster met doorverwijzing naar de relevante individuele apps (Hoofdstukken 6–12).

---

## Reproducibiliteit

Elke dataset is volledig reproduceerbaar via de **datasetcode** (seed). **Dezelfde code geeft altijd exact hetzelfde scenario, dezelfde tabel en dezelfde getallen.** Vul je bijvoorbeeld code `123` in, dan krijg je steeds hetzelfde criminologische scenario, dezelfde kruistabel en hetzelfde padmodel — ongeacht wanneer of waar je de oefening opent.

Dit maakt de oefening geschikt voor groepssessies (iedereen dezelfde code), zelfstudie en formele examens.
