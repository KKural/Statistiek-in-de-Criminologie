Analyseer onderstaande gegevens over tevredenheidsmeting bij reclasseringsdiensten en beantwoord de vragen over meetniveau en beschrijvende statistieken.

## **Tevredenheidsmeting Reclasseringsdiensten**

Een reclasseringsdienst wil weten hoe tevreden veroordeelde delictplegers zijn over de begeleiding die ze ontvangen van hun begeleider in het kader van hun re-integratieproces. Eén van de vragen luidt: 

*"Was u tevreden met de begeleiding door uw reclasseringsambtenaar?"*

**Tabel 2** *(Onvolledige frequentietabel - vul de ontbrekende kolommen in via R)*

*Tevredenheidsverdeling van Veroordeelde Delictplegers over Reclasseringsbegeleiding*

<table style="border-collapse: collapse; width: 90%; margin: 20px auto; font-family: Times, serif;">
<thead>
<tr style="border-top: 2px solid #000; border-bottom: 2px solid #000;">
<th style="padding: 6px 8px; text-align: left; font-weight: bold; width: 30%;">Antwoord</th>
<th style="padding: 6px 8px; text-align: center; font-weight: bold; width: 17%;">Absolute<br>Frequentie</th>
<th style="padding: 6px 8px; text-align: center; font-weight: bold; width: 17%;">Cumulatieve<br>Abs. Freq.</th>
<th style="padding: 6px 8px; text-align: center; font-weight: bold; width: 18%;">Relatieve<br>Frequentie</th>
<th style="padding: 6px 8px; text-align: center; font-weight: bold; width: 18%;">Cumulatieve<br>Rel. Freq.</th>
</tr>
</thead>
<tbody>
<tr>
<td style="padding: 4px 8px; text-align: left;">Zeer ontevreden</td>
<td style="padding: 4px 8px; text-align: center; background-color: #f0f0f0;">33</td>
<td style="padding: 4px 8px; text-align: center;">?</td>
<td style="padding: 4px 8px; text-align: center;">?</td>
<td style="padding: 4px 8px; text-align: center;">?</td>
</tr>
<tr>
<td style="padding: 4px 8px; text-align: left;">Ontevreden</td>
<td style="padding: 4px 8px; text-align: center; background-color: #f0f0f0;">84</td>
<td style="padding: 4px 8px; text-align: center;">?</td>
<td style="padding: 4px 8px; text-align: center;">?</td>
<td style="padding: 4px 8px; text-align: center;">?</td>
</tr>
<tr>
<td style="padding: 4px 8px; text-align: left;">Noch tevreden, noch ontevreden</td>
<td style="padding: 4px 8px; text-align: center; background-color: #f0f0f0;">102</td>
<td style="padding: 4px 8px; text-align: center;">?</td>
<td style="padding: 4px 8px; text-align: center;">?</td>
<td style="padding: 4px 8px; text-align: center;">?</td>
</tr>
<tr>
<td style="padding: 4px 8px; text-align: left;">Tevreden</td>
<td style="padding: 4px 8px; text-align: center; background-color: #f0f0f0;">63</td>
<td style="padding: 4px 8px; text-align: center;">?</td>
<td style="padding: 4px 8px; text-align: center;">?</td>
<td style="padding: 4px 8px; text-align: center;">?</td>
</tr>
<tr>
<td style="padding: 4px 8px; text-align: left;">Zeer tevreden</td>
<td style="padding: 4px 8px; text-align: center; background-color: #f0f0f0;">48</td>
<td style="padding: 4px 8px; text-align: center;">?</td>
<td style="padding: 4px 8px; text-align: center;">?</td>
<td style="padding: 4px 8px; text-align: center;">?</td>
</tr>
<tr style="border-top: 1px solid #000; border-bottom: 2px solid #000;">
<td style="padding: 4px 8px; text-align: left; font-weight: bold;">Totaal (N)</td>
<td style="padding: 4px 8px; text-align: center; font-weight: bold; background-color: #f0f0f0;">330</td>
<td style="padding: 4px 8px; text-align: center;">-</td>
<td style="padding: 4px 8px; text-align: center;">1.00</td>
<td style="padding: 4px 8px; text-align: center;">-</td>
</tr>
</tbody>
</table>

*Noot.* De steekproef bestond uit veroordeelde delictplegers die begeleid worden door een reclasseringsdienst (*N* = 330).

### **📋 Instructies**

**STAP 1:** Vul eerst de ontbrekende kolommen in de frequentietabel in via R:
- **Cumulatieve absolute frequenties:** Gebruik `cumsum(abs_freq)`
- **Relatieve frequenties:** Bereken `abs_freq / 330` 
- **Cumulatieve relatieve frequenties:** Gebruik `cumsum(rel_freq)`

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