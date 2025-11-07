# **Praktische toepassingen**

## **Surveyanalyse (jeugdcriminaliteit)**

### **Situatie:**
Onderzoek naar zelfgerapporteerde delicten bij 3000 jongeren, waarbij 8% niet alle vragen heeft beantwoord.

### **Praktische aanpak:**
- Gebruik **geldige percentages** en rapporteer altijd **n (totaal én geldig)**
- Voorkom bias door missings te negeren in "valid %"
- Bij gevoelige vragen (drugs, geweld): analyseer **missingspatroon** - zijn bepaalde groepen oververtegenwoordigd?

### **Voorbeeld:**
"Van de 3000 bevraagde jongeren gaven 2760 een geldig antwoord (92%). Van deze 2760 rapporteerde 23% minstens één delict het afgelopen jaar."

---

## **Communicatie naar beleid**

### **Situatie:** 
Beleidsmaker wil weten "hoeveel delicten plegen jongeren gemiddeld?" bij sterk rechtscheve verdeling.

### **Praktische aanpak:**
- Presenteer **mediaan + IKA** naast gemiddelde om vertekening door uitschieters te voorkomen
- Leg uit waarom beide maten relevant zijn

### **Voorbeeld:**
"Het gemiddelde aantal delicten is 2.1 per jongere, maar de **mediaan is 0** - de helft pleegt geen enkel delict. De meeste actieve 25% (Q3) pleegt maximaal 3 delicten. Een kleine groep 'veelplegers' trekt het gemiddelde omhoog."

---

## **Kwaliteitscontrole datastroom**

### **Situatie:**
Maandelijkse criminaliteitscijfers van 5 politiezones - zijn er plotselinge veranderingen of invoerfouten?

### **Praktische aanpak:**
- **Boxplot per meetmoment** (pre/post) detecteert datainvoerfouten en uitzonderlijke casussen
- **1.5×IKA regel** markeert automatisch verdachte waarden voor nader onderzoek

### **Voorbeeld:**
"Zone 3 toont plotseling 40% meer geweldsdelicten (*-markering in boxplot). Check: nieuwe registratieprocedure? Andere definitie? Echte stijging?"

---

## **Indicatorvergelijking tussen regio's**

### **Situatie:**
Vergelijking van 'criminaliteitsgraad per 1000 inwoners' vs 'politiecapaciteit per 1000 inwoners' tussen Vlaamse steden.

### **Praktische aanpak:**
- Gebruik **variatiecoëfficiënt (CV)** om variabelen met verschillende eenheden eerlijk te vergelijken
- CV = s/gemiddelde (dimensieloos)

### **Voorbeeld:**
"Criminaliteitsgraad varieert tussen steden (CV = 0.34) meer dan politiecapaciteit (CV = 0.18). Dit suggereert dat andere factoren dan politie-inzet de criminaliteitsverschillen bepalen."

---

## **Educationele feedback**

### **Situatie:**
Studenten denken dat "gemiddelde" altijd "typisch" betekent.

### **Praktische aanpak:**
- Toon met **histogram + normaalcurve** waarom "gemiddelde" niet altijd "typisch" is
- Koppel aan keuze van centrummaat bij scheefheid
- Gebruik criminologische voorbeelden (recidive, slachtofferschap)

### **Voorbeeld:**
"Bij strafmaten is het gemiddelde 18 maanden, maar de **modus is 6 maanden** (meest voorkomende straf). Voor beleid is beide informatie relevant: typische straf (modus) vs gemiddelde kosten (gemiddelde)."
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