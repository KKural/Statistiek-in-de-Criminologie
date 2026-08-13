# Vrouw of diefstal: corrigeren voor overlap

Een onderzoeker selecteert aselect één verdachte uit deze registratie.

| | Diefstal | Geweldsmisdrijf | Drugsmisdrijf | Overige | Totaal |
|---|---:|---:|---:|---:|---:|
| Vrouw | 12 | 5 | 3 | 2 | 22 |
| Man | 70 | 30 | 15 | 10 | 125 |
| **Totaal** | **82** | **35** | **18** | **12** | **147** |

Bereken de kans dat de geselecteerde verdachte **een vrouw is of voor diefstal is geregistreerd**.

De gebeurtenissen overlappen: 12 personen behoren tot beide groepen. Gebruik daarom de algemene somregel:

$$P(V\cup D)=P(V)+P(D)-P(V\cap D)$$

Bereken afzonderlijk:

1. `p_vrouw` voor $P(V)$;
2. `p_diefstal` voor $P(D)$;
3. `p_overlap` voor $P(V\cap D)$;
4. `p_union` voor $P(V\cup D)$.

## Invoer

Vervang elke `NA` door een **decimale kans**, afgerond op **vier decimalen**. Gebruik in R een punt als decimaalteken.
