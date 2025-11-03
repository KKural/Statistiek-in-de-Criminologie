Je hebt gegevens over de leeftijden van personen die zijn gearresteerd voor verschillende strafbare feiten. Gebruik de functie `summary()` om beschrijvende statistieken te genereren voor de leeftijden van de verdachten en sla het resultaat op in een variabele genaamd `leeftijd_samenvatting`.

```R
# Vector met leeftijden van verdachten
leeftijden_daders <- c(19, 23, 45, 32, 28, 21, 24, 19, 37, 42, 18, 25, 22, 31, 19, 
                   27, 36, 29, 24, 33, 41, 26, 20, 38, 22, 19, 25, 29, 31, 34)

# Genereer een samenvatting van de leeftijden en sla deze op in een variabele genaamd 'leeftijd_samenvatting'
leeftijd_samenvatting <- summary(leeftijden_daders)
```

**Hint:**  
Gebruik de functie `summary()` om snel een overzicht te krijgen van de belangrijkste statistieken van een vector.
