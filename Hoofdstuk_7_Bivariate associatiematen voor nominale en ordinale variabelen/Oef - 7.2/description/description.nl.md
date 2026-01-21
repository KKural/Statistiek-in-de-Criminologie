Een onderzoeker wil nagaan of er een verband is tussen **geslacht** en **crimineel gedrag** (wel/geen misdrijf gepleegd). In een representatieve steekproef van **2.000** volwassenen werd het volgende gevonden:

| Crimineel gedrag | Man | Vrouw |
|---|---:|---:|
| YES | 380 | 120 |
| NO  | 850 | 650 |

In deze oefening bereken je verschillende **percentages** en **associatiematen** op basis van deze kruistabel.

## Opdrachten
Maak in R de onderstaande variabelen aan (zie boilerplate) en vul ze met de correcte waarden:

1. **Percentage marginaalverdeling** (t.o.v. 2000): `% mannen`, `% vrouwen`, `% YES`, `% NO`.
2. **Percentage mannen met crimineel gedrag**: \(P(YES \\,|\\, Man)\) in %.
3. **Percentage vrouwen met crimineel gedrag**: \(P(YES \\,|\\, Vrouw)\) in %.
4. **Percentageverschil** (in procentpunten) tussen mannen en vrouwen voor crimineel gedrag.
5. **Odds** voor crimineel gedrag bij mannen en bij vrouwen + de **odds ratio (OR)**.
6. **Chi-kwadraat** (\(\u03C7^2\)) voor deze 2×2-kruistabel.
7. Meerkeuze: “Wat is de kans dat een willekeurige vrouw **geen** misdrijf pleegde?” (A=30%, B=15%, C=85%, D=6%). Geef je keuze als `antwoord_mc` (1-4).

**Hint (percentageverschil):** zet de theoretisch onafhankelijke variabele in de kolommen en maak kolompercentages (kolommen = 100%).
