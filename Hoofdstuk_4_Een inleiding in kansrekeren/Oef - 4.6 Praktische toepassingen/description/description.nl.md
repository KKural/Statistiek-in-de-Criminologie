## **Steekproeftrekking**

### **Situatie:**
Onderzoek naar criminaliteitspatronen vereist **representatieve steekproeven** uit grote populaties.

### **Praktische aanpak:**
- **Kansrekening** bepaalt of een steekproef representatief is
- **Random selectie** garandeert gelijke kansen voor alle eenheden
- **Steekproefgrootte** berekenen op basis van gewenste **betrouwbaarheid**

### **Voorbeeld:**
"Voor een betrouwbaarheidsinterval van 95% en foutmarge van 3% bij onbekende populatieproportie, hebben we n ≈ 1067 respondenten nodig. Bij bekende proportie p=0.25 (slachtofferschap) volstaan n ≈ 800 respondenten."

---

## **Beleidsevaluatie**

### **Situatie:**
Evaluatie van **alternatieve straffen** - wat is de kans op herval vergeleken met gevangenisstraf?

### **Praktische aanpak:**
- **Binomiale verdeling** modelleert kans op recidive (wel/niet binnen 2 jaar)
- **Vergelijking** tussen groepen via kansverschillen
- **Betrouwbaarheidsintervallen** rond geschatte recidivekansen

### **Voorbeeld:**
"Elektronisch toezicht: 30% recidive (95% BI: 25%-35%). Traditionele gevangenisstraf: 45% recidive (95% BI: 40%-50%). Verschil is statistisch significant en praktisch relevant voor beleid."

---

## **Risico-inschatting**

### **Situatie:**
**Risicotaxatie-instrumenten** voorspellen kans op recidive voor individuele daders.

### **Praktische aanpak:**
- **Kansmodellen** combineren meerdere risicofactoren
- **Binomiale logica**: elke factor verhoogt/verlaagt kans op herval
- **Probabilistische uitspraken** in plaats van absolute voorspellingen

### **Voorbeeld:**
"Dader X heeft 65% kans op recidive binnen 2 jaar (95% BI: 55%-75%) op basis van leeftijd, criminele geschiedenis en sociaal-economische factoren. Dit rechtvaardigt intensievere begeleiding."

---

## **Toevalsmechanismen in surveys**

### **Situatie:**
**Random selectie** van respondenten voor slachtofferenquêtes om selectiebias te voorkomen.

### **Praktische aanpak:**
- **Objectieve kansberekening** voor selectieprocedures
- **Stratified sampling**: verschillende kansen per stratum
- **Weging** achteraf op basis van selectiekansen

### **Voorbeeld:**
"Huishoudens in centrum hebben 3× hogere kans geselecteerd te worden dan in buitenwijken. Weging factor centrum = 0.33, buitenwijken = 1.0 om representatieve resultaten te verkrijgen."

---

## **Simulaties**

### **Situatie:**
**Scenario-analyse** voor beleidseffecten - wat gebeurt er als recidivekansen veranderen?

### **Praktische aanpak:**
- **Monte Carlo simulaties** met verschillende kansparameters
- **Binomiale trekkingen** simuleren groepen daders
- **Sensitiviteitsanalyse** voor robuustheid resultaten

### **Voorbeeld:**
"Als recidivekans daalt van 40% naar 30% door nieuw programma, verwachten we 180 minder recidivisten per 1000 behandelde daders (95% BI: 120-240). Dit bespaart geschat €2.1M aan maatschappelijke kosten."

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