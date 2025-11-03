# **R Library Laden - dplyr**

In R moeten we bibliotheken (libraries) laden voordat we hun functies kunnen gebruiken. De `dplyr` library is een van de meest gebruikte bibliotheken voor data manipulatie in R.

**Opdracht:** Schrijf de R-code om de `dplyr` library te laden.

## **Wat gebeurt er in R?**

Wanneer je een library laadt in R:
- R zoekt naar de geïnstalleerde package
- De functies van de library worden beschikbaar gemaakt
- Je krijgt meestal een bevestigingsbericht te zien

### **Voorbeeld**

```console?lang=r&prompt=R>
R> library(dplyr)
Attaching package: 'dplyr'

The following objects are masked from 'package:stats':
    filter, lag

The following objects are masked from 'package:base':
    intersect, setdiff, setequal, union
```

**Verwacht resultaat:** Wanneer je `library(dplyr)` uitvoert, laadt R de dplyr package en toont mogelijk waarschuwingen over functienamen die andere functies "maskeren" (vervangen).