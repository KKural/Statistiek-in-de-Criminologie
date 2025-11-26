Analyseer onderstaande gegevens over tevredenheidsmeting bij reclasseringsdiensten en beantwoord de vragen over meetniveau en beschrijvende statistieken.

## **Tevredenheidsmeting Reclasseringsdiensten**

Een reclasseringsdienst wil weten hoe tevreden veroordeelde delictplegers zijn over de begeleiding die ze ontvangen van hun begeleider in het kader van hun re-integratieproces. Eén van de vragen luidt: 

*"Was u tevreden met de begeleiding door uw reclasseringsambtenaar?"*

## **📊 Frequentietabel te Voltooien**

*Tevredenheidsverdeling van Veroordeelde Delictplegers over Reclasseringsbegeleiding*

| Antwoord                         | Abs. Freq. | Cum. Abs. | Rel. Freq. | Cum. Rel. |
|----------------------------------|:----------:|:---------:|:----------:|:---------:|
| Zeer ontevreden                  | **33**     | ❓        | ❓         | ❓        |
| Ontevreden                       | **84**     | ❓        | ❓         | ❓        |
| Noch tevreden, noch ontevreden   | **102**    | ❓        | ❓         | ❓        |
| Tevreden                         | **63**     | ❓        | ❓         | ❓        |
| Zeer tevreden                    | **48**     | ❓        | ❓         | ❓        |
| **TOTAAL (N)**                   | **330**    | -         | **1.0000** | -         |

*Noot.* De steekproef bestond uit veroordeelde delictplegers die begeleid worden door een reclasseringsdienst (*N* = 330).

### **📋 Instructies**

**STAP 1:** Vul eerst de ontbrekende kolommen in de frequentietabel in via R:
- **Cumulatieve absolute frequenties:** Gebruik `cumsum(absolute_frequenties)`
- **Relatieve frequenties:** Bereken `absolute_frequenties / 330` (gebruik 4 decimalen!)
- **Cumulatieve relatieve frequenties:** Gebruik `cumsum(relatieve_frequenties)`

**Verwachte resultaten (4 decimalen):**
- Relatieve frequenties: 0.1000, 0.2545, 0.3100, 0.1909, 0.1455
- Cumulatieve relatieve frequenties: 0.1000, 0.3545, 0.6636, 0.8545, 1.0000

**STAP 2:** Analyseer vervolgens de data volgens de stap-voor-stap methode voor ordinale data.

## **Hoe weet je welke statistische maat het meest relevant is?**

**Stap 1: Bepaal welke maten je MAG berekenen (afhankelijk van meetniveau)**
- **Nominaal:** Alleen de modus
- **Ordinaal:** Modus en mediaan (+ kwartielen voor spreiding)
- **Interval/Ratio:** Alle maten (modus, mediaan, gemiddelde)

**Stap 2: Selecteer de maat die de MEESTE informatie geeft**
- Modus: toont alleen de meest voorkomende waarde
- Mediaan: toont de middelste waarde (meer informatie dan modus)
- Gemiddelde: geeft de meeste informatie (alleen bij interval/ratio)

**Voor dit ordinale meetniveau:**
- **Meest relevante centraliteitsmaat:** **Mediaan** = categorie die overeenkomt met de 165,5ste waarneming
- **Relevante spreidingsmaten:** **Kwartielen (Q1 en Q3)** en **Interkwartielafstand (IKA = Q3 - Q1)**

## **Jouw taak:**

Analyseer deze gegevens en beantwoord de onderstaande vragen.

**Instructie:** 
Vervang "???" door het juiste antwoord. Voor meetniveau gebruik "ordinaal", "nominaal" of "interval". Voor categorieën gebruik de exacte bewoordingen uit de tabel.