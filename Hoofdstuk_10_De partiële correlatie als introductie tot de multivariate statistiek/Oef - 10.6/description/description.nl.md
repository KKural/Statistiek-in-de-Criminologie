# **Interactieve app — partiële correlatie**

In deze oefening oefen je de **partiële correlatie** aan de hand van de interactieve Shiny-app. De app genereert criminologische datasets met drie variabelen (X, Y en een controlevariabele Z) en laat je stap voor stap de partiële correlatie berekenen — vergelijkbaar met wat je deed in Oefening 8.2 (bivariate correlatie), maar nu inclusief het uitschakelen van een derde variabele.

---

## **De App Openen**

De interactieve app is beschikbaar op:

**<a href='https://statistiek-in-de-criminologie.shinyapps.io/Partial_Correlation/' target='_blank' rel='noopener noreferrer'>Interactieve oefeningen — Partiële correlatie</a>**

> **Let op:** De app werkt alleen als ze actief draait. Vraag je docent om de app te starten als deze niet beschikbaar is.

---

## **Leerdoelen**

Na het werken met deze app kun je:

- De **drie bivariate correlaties** (r_XY, r_XZ, r_YZ) berekenen of aflezen uit een correlatietabel
- De **partiële correlatie** $r_{XY \cdot Z}$ met de formule stap voor stap berekenen
- Het **type effect** van een controlevariabele herkennen: schijnverband, indirect verband, suppressoreffect of reëel verband
- Resultaten vergelijken met de bivariate correlatie om te beoordelen of Z een rol speelt

---

## **Verband met Oefening 8.2 en 8.3**

In **Oefening 8.2** oefende je de bivariate correlatie (r_XY) tussen twee variabelen. In **Oefening 8.3** interpreteerde je die correlaties grafisch via een scatterplot.

In **Oefening 10.6** ga je één stap verder: je voegt een **derde variabele Z** toe en onderzoekt wat er met r_XY gebeurt wanneer je voor Z controleert. Dat is precies het principe van partiële correlatie en een eerste stap naar **multivariate analyse**.

$$r_{XY \cdot Z} = \frac{r_{XY} - r_{XZ} \cdot r_{YZ}}{\sqrt{(1 - r_{XZ}^2)(1 - r_{YZ}^2)}}$$

---

## **Hoe Werkt de App?**

### **Stap 1: Kies het scenario "Partiële correlatie"**

Selecteer in de app het tabblad of het scenario voor partiële correlatie. Je krijgt een dataset met drie variabelen X, Y en Z met bijbehorende criminologische context (bijv. daderschap, slachtofferschap en leeftijd).

### **Stap 2: Lees de correlatietabel af**

De app toont een correlatietabel. Noteer:
- $r_{XY}$ — bivariate correlatie X–Y
- $r_{XZ}$ — bivariate correlatie X–Z (controlevariabele)
- $r_{YZ}$ — bivariate correlatie Y–Z (controlevariabele)

### **Stap 3: Bereken de partiële correlatie met de hand**

Gebruik de formule:
1. **Teller:** $r_{XY} - r_{XZ} \cdot r_{YZ}$
2. **Noemer:** $\sqrt{(1 - r_{XZ}^2)(1 - r_{YZ}^2)}$
3. **Partiële correlatie:** teller ÷ noemer

### **Stap 4: Interpreteer het resultaat**

Vergelijk $r_{XY \cdot Z}$ met $r_{XY}$ en bepaal het type effect:

| Type effect | Wat er gebeurt |
|---|---|
| **Schijnverband** | $r_{XY \cdot Z} \approx 0$ na controle: Z veroorzaakte de ogenschijnlijke samenhang |
| **Indirect verband** | $r_{XY \cdot Z}$ kleiner maar ≠ 0: relatie loopt deels via Z |
| **Suppressoreffect** | $r_{XY \cdot Z}$ sterker of ander teken: Z onderdrukte de ware relatie |
| **Reëel verband** | $r_{XY \cdot Z} \approx r_{XY}$: Z heeft nauwelijks invloed |

### **Stap 5: Vergelijk met de app-feedback**

Vul je berekende waarden in de app in en controleer meteen of je teller, noemer en eindresultaat kloppen.

---

## **Oefenschenario's in de App**

De app bevat onder andere de volgende criminologische scenario's voor partiële correlatie:

- **Daderschap en slachtofferschap** — controlevariabele: leeftijd *(gelijkaardig aan Oef. 10.1)*
- **Fysieke bekwaamheid en salaris** — controlevariabele: dienstjaren *(gelijkaardig aan Oef. 10.2)*
- **Schoolbetrokkenheid en delinquentie** — controlevariabele: zelfcontrole *(suppressoreffect)*
- **Buurtoverlast en angst voor criminaliteit** — controlevariabele: sociaaleconomische status

Gebruik meerdere scenario's om de vier verschillende types effecten te oefenen.

### **Situatie:**
De politie van Gent wil hun criminaliteitsregistratie verbeteren om betere analyses te kunnen maken voor beleidsbeslissingen.

### **Huidige registratie:**
- **Locatie:** Straatnaam (tekst)
- **Tijdstip:** "Ochtend/Middag/Avond/Nacht"
- **Ernst:** "Licht/Gemiddeld/Zwaar"
- **Daderleeftijd:** "Jong/Volwassen/Ouder"
- **Schade:** Bedrag in euro's

### **Probleem:**
De huidige categorieën maken het moeilijk om:
- Trends over tijd te analyseren
- Geografische hotspots te identificeren
- Effectiviteit van interventies te meten

### **Praktische oplossing:**
**Verbeterde registratie:**
- **Locatie:** GPS-coördinaten (ratio niveau)
- **Tijdstip:** Exacte tijd in uren en minuten (ratio niveau)
- **Ernst:** Numerieke schaal 1-10 (ordinaal/interval niveau)
- **Daderleeftijd:** Exacte leeftijd in jaren (ratio niveau)
- **Schade:** Bedrag in euro's (ratio niveau - behouden)

### **Voordelen:**
- Mogelijkheid tot geavanceerde statistische analyses
- Betere voorspellingsmodellen
- Meer precieze evaluatie van interventies

---

## **Toepassing 2: Gevangenisonderzoek - Steekproefdesign**

### **Onderzoeksvraag:**
"Wat is de effectiviteit van resocialisatieprogramma's op recidive in Belgische gevangenissen?"

### **Populatie vs. Steekproef uitdaging:**

**Populatie:** Alle gedetineerden die tussen 2020-2024 deelnamen aan resocialisatieprogramma's in België

**Steekproefproblemen:**
1. **Toegankelijkheid:** Niet alle gevangenissen verlenen onderzoekstoegang
2. **Selectiebias:** Alleen gemotiveerde gedetineerden nemen deel aan programma's
3. **Uitval:** Gedetineerden kunnen vervroegd vrijkomen of overgeplaatst worden

### **Praktische oplossing:**

**Gestratificeerde steekproef:**
- **Stratum 1:** Gesloten gevangenissen (60% van steekproef)
- **Stratum 2:** Halfopen gevangenissen (25% van steekproef)  
- **Stratum 3:** Open gevangenissen (15% van steekproef)

**Controlegroep:** Vergelijkbare gedetineerden die niet deelnamen aan programma's

**Follow-up:** 2 jaar na vrijlating voor recidivemeting

---

## **Toepassing 3: Slachtofferonderzoek - Betrouwbaarheid vs. Validiteit**

### **Casus:**
Onderzoek naar ongeregistreerde criminaliteit via slachtofferenquêtes.

### **Betrouwbaarheidsproblemen:**
1. **Herinneringsbias:** Slachtoffers vergeten details of timing
2. **Telescoping:** Gebeurtenissen worden dichter bij het heden geplaatst
3. **Sociale wenselijkheid:** Onderrapportage van gevoelige misdrijven

### **Validiteitsproblemen:**
1. **Non-response bias:** Bepaalde groepen weigeren mee te werken
2. **Dekking:** Daklozen, illegalen niet bereikt via telefonische enquêtes
3. **Definitieverschillen:** Wat slachtoffers als "misdrijf" beschouwen

### **Praktische verbeteringen:**

**Voor betrouwbaarheid:**
- Multiple-item vragen voor hetzelfde incident
- Kalendar-aided recall (gebruik van mijlpalen)
- Test-retest procedures bij subsample

**Voor validiteit:**
- Mixed-mode datacollectie (telefoon + online + face-to-face)
- Vertaling in meerdere talen
- Gebruik van vertrouwde organisaties voor werving

---

## **Toepassing 4: Reclassering - Parameters vs. Statistieken**

### **Situatie:**
De Belgische reclassering wil rapporteren over het succes van hun begeleiding.

### **Beschikbare data:**

**Parameter (populatiewaarde):**
- Alle 15.000 personen onder toezicht van reclassering in 2023
- Officiële recidivecijfers van het Centraal Strafregister

**Statistiek (steekproefwaarde):**
- Enquête bij 800 willekeurig geselecteerde cliënten
- Zelfgerapporteerde tevredenheid met begeleiding

### **Interpretatie-uitdaging:**
- **82% van alle cliënten pleegt geen nieuwe misdrijven** (parameter)
- **91% van ondervraagde cliënten is tevreden met begeleiding** (statistiek)

### **Vraag:** Kunnen we concluderen dat tevredenheid leidt tot minder recidive?

### **Kritische overwegingen:**
1. We vergelijken een populatieparameter met een steekproefstatistiek
2. Verschillende meetmomenten (recidive = 2 jaar follow-up, tevredenheid = direct)
3. Mogelijke derde variabelen (motivatie, type misdrijf, sociale steun)

---

## **Toepassing 5: Preventiebeleid - Kwantitatief vs. Kwalitatief**

### **Beleidsvraag:**
"Hoe effectief zijn camerasystemen in het voorkomen van criminaliteit?"

### **Kwantitatieve benadering:**
- **Variabelen:** Aantal misdrijven voor/na camera-installatie
- **Meetniveau:** Ratio (aantal = 0, 1, 2, ...)
- **Analyse:** Vergelijking van gemiddelden (t-toets)

### **Kwalitatieve benadering:**
- **Variabelen:** Ervaringen van bewoners, politie, winkeliers
- **Meetniveau:** Nominaal/ordinaal (categorieën van ervaringen)
- **Analyse:** Thematische analyse van interviews

### **Gecombineerde aanpak:**
1. **Kwantitatief:** Meet objectieve criminaliteitsdaling
2. **Kwalitatief:** Begrijp mechanismen achter verandering
3. **Mixed methods:** Volledig beeld van interventie-effecten

### **Praktische implicaties:**
- Kwantitatieve data overtuigt beleidsmakers
- Kwalitatieve data verklaart waarom interventies wel/niet werken
- Combinatie leidt tot betere interventies en beleid

---

## **Toepassing 6: Rechterlijke beslissingen - Variabele classificatie**

### **Context:**
Onderzoek naar factoren die invloed hebben op strafmaat.

### **Variabele classificatie:**

| Variabele | Type | Meetniveau | Rol in analyse |
|-----------|------|------------|----------------|
| Strafmaat (maanden) | Kwantitatief | Ratio | Afhankelijk |
| Type misdrijf | Kwalitatief | Nominaal | Onafhankelijk |
| Aantal eerdere veroordelingen | Kwantitatief | Ratio | Onafhankelijk |
| Ernst van misdrijf (schaal 1-5) | Kwantitatief | Ordinaal | Onafhankelijk |
| Geslacht dader | Kwalitatief | Nominaal | Controlevariabele |
| Leeftijd dader | Kwantitatief | Ratio | Controlevariabele |

### **Analytische implicaties:**
- **Ratio variabelen:** Correlatie en regressieanalyse mogelijk
- **Ordinale variabelen:** Niet-parametrische toetsen aangeraden
- **Nominale variabelen:** Dummy-variabelen nodig voor regressie

### **Beleidsrelevantie:**
- Identificatie van systematische verschillen in straftoemeting
- Basis voor training van rechters over impliciete bias
- Ondersteuning van plea bargaining richtlijnen