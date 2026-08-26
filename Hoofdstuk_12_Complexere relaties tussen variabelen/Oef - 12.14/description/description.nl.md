Een criminoloog wil de **recidivescore** (0–100) van ex-gedetineerden verklaren via meervoudige regressie.

In **Model A** gebruikt hij als predictoren:
- **Ondersteuningsuren per maand** (X₁)
- **Risicoschaal** (X₂, een samengestelde score van criminogene behoeften)

In **Model B** vervangt hij de risicoschaal door een **samengestelde risicoschaal** die bijna volledig lineair afhankelijk is van de ondersteuningsuren (r ≈ 0,99).

**Multicollineariteit** — te hoge correlatie tussen predictoren — kan de regressiecoëfficiënten onbetrouwbaar maken. De **VIF** (Variance Inflation Factor) meet dit: een VIF < 5 is aanvaardbaar, VIF ≥ 5 is problematisch, VIF ≥ 10 is ernstig.

---

<img src="media/vif_a.png" alt="VIF-uitvoer voor model A" width="580">

<img src="media/vif_b.png" alt="VIF-uitvoer voor model B" width="580">

---

**Welke uitspraak is JUIST?**

1. Model A heeft een multicollineariteitsprobleem — beide VIF-waarden overschrijden de grens van 5.
2. Model B heeft een multicollineariteitsprobleem — beide VIF-waarden zijn groter dan 10.
3. Beide modellen hebben een multicollineariteitsprobleem.
4. Geen van beide modellen heeft een multicollineariteitsprobleem.

- Typ je antwoord als één enkel getal (1-4) om je keuze aan te geven
