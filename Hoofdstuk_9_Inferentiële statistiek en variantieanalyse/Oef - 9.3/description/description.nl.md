## Oef - 9.3: Steekproefgrootte voor topsalarissen bij banken

De Vlaamse minister-president vraagt je om een onderzoek in te stellen naar de **topsalarissen** bij enkele vooraanstaande banken. Uit een vooronderzoek blijkt dat de **standaardafwijking σ = € 9.000** bedraagt.

Op uitdrukkelijk verzoek van het ministerie mag de **foutenmarge** van het **95%-betrouwbaarheidsinterval** rond het steekproefgemiddelde **niet meer dan € 400** bedragen.

> **Vraag:** Hoe groot moet je steekproef dan minstens zijn?

Je berekent alles **met de hand** (rekenmachine mag). In R vul je enkel je **eindresultaten** in.

---

## **Berekeningsstappen**

**Formule voor de minimale steekproefgrootte:**
$$n = \left(\frac{z_{\alpha/2} \times \sigma}{E}\right)^2$$

Waarbij:
- $z_{\alpha/2}$ = de kritieke z-waarde bij het gewenste betrouwbaarheidsniveau
- $\sigma$ = de populatiestandaardafwijking (uit vooronderzoek)
- $E$ = de maximale foutenmarge

**Let op:** Rond altijd **omhoog** af (naar boven) — je wil minstens dat aantal.

---

## **Opgaven**

### **Deel A: Invulwaarden identificeren**

1) **De z-waarde voor een 95%-betrouwbaarheidsinterval**
   - `z_waarde` (2 decimalen)

2) **De standaardafwijking (σ in euro)**
   - `sigma` (geheel getal)

3) **De maximale foutenmarge (E in euro)**
   - `foutenmarge` (geheel getal)

### **Deel B: Steekproefgrootte**

4) **Het quotiënt (z × σ / E)**
   - `quotient` (rond af op 4 decimalen)

5) **Het kwadraat van het quotiënt (n vóór afronding)**
   - `n_voor_afronding` (rond af op 2 decimalen)

6) **De minimale steekproefgrootte (naar boven afgerond)**
   - `n_minimum` (geheel getal)
