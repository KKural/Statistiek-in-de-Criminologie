# Verdachten en drugsmisdrijven: de productregel

Een onderzoeker selecteert aselect één verdachte uit de onderstaande registratie.

| | Diefstal | Geweldsmisdrijf | Drugsmisdrijf | Overige | Totaal |
|---|---:|---:|---:|---:|---:|
| Vrouw | 12 | 5 | 3 | 2 | 22 |
| Man | 70 | 30 | 15 | 10 | 125 |
| **Totaal** | **82** | **35** | **18** | **12** | **147** |

Bereken:

1. de marginale kans dat de geselecteerde verdachte een man is: $P(M)$;
2. de kans op een drugsmisdrijf, gegeven dat de verdachte een man is: $P(D\mid M)$;
3. de gezamenlijke kans op een mannelijke verdachte die voor een drugsmisdrijf is geregistreerd: $P(M\cap D)$.

Gebruik de algemene productregel:

$$P(M\cap D)=P(M)\times P(D\mid M)$$

Controleer de gezamenlijke kans vervolgens rechtstreeks met de cel `man × drugsmisdrijf`.

## Invoer

Vervang elke `NA` door een **decimale kans**, afgerond op **vier decimalen**. Gebruik in R een punt als decimaalteken.
