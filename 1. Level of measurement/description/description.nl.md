In deze oefening leer je hoe je de `str()` functie gebruikt om de structuur van een dataframe te verkennen. Dit is een van de meest nuttige functies in R voor een snelle analyse van je gegevens.

We werken met een dataframe `df_crime_data` dat al voor je is ingeladen. Deze dataset bevat criminaliteitsgegevens:
- `type`: categorieën van misdrijven (factor)
- `ernst`: ernst van het misdrijf (geordende factor)
- `leeftijd`: leeftijd van de dader (numeriek)
- `district`: district-code (character)

1. Gebruik de `str()` functie om de structuur van het dataframe `df_crime_data` te bekijken.
2. Bestudeer welke variabelen factoren zijn en welke numeriek.
3. Let op welke factoren geordend zijn.
4. Noteer het aantal observaties (rijen) in het dataframe.

```r
# Bekijk de structuur van het dataframe
str(df_crime_data)
```

**Hint:**  
De `str()` functie toont een beknopt overzicht van een object. Voor een dataframe geeft het:
- Het type object (data.frame)
- Het aantal rijen en kolommen
- De naam van elke variabele
- Het type van elke variabele (factor, numeric, character, etc.)
- Enkele voorbeeldwaarden voor elke variabele

Let op: Je moet **exact** de opdracht `str(df_crime_data)` gebruiken zoals hierboven aangegeven.
