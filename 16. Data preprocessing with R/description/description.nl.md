# Data preprocessing met R

In deze oefening ga je leren hoe je ruwe data kunt voorbereiden voor analyse in R. Data preprocessing is een essentiële stap in het data-analyseproces die helpt om inconsistenties te verwijderen en de kwaliteit van je data te verbeteren.

## Datasets

We werken met een dataset `crime_statistics.csv` die de volgende kolommen bevat:
- `date`: Datum van het misdrijf (karakter formaat: DD/MM/YYYY)
- `crime_type`: Type misdrijf (karakter)
- `district`: District waar het misdrijf plaatsvond (karakter)
- `age_offender`: Leeftijd van de dader (numeriek, met enkele missing values)
- `severity`: Ernst van het misdrijf (1-5, met enkele ontbrekende waarden)

## Opdracht

1. Laad de dataset in (deze is al beschikbaar als `raw_data`)
2. Voer de volgende voorbereidende stappen uit:
   - Converteer de `date` kolom naar het juiste datum formaat
   - Zet `crime_type` en `district` om naar factoren
   - Vervang ontbrekende waarden in `age_offender` door het gemiddelde van alle beschikbare leeftijden
   - Vervang ontbrekende waarden in `severity` door de mediaan
   - Maak een nieuwe kolom `month` die de maand uit de datum extraheert
3. Sla het resultaat op in een nieuwe dataframe genaamd `clean_data`

```r
# De dataset is al geladen als raw_data
# Jouw code hier:

# 1. Converteer de datum naar het juiste formaat
# Hint: gebruik as.Date() met het juiste formaat

# 2. Zet categorische variabelen om naar factoren
# Hint: gebruik factor()

# 3. Vervang missing values in numerieke kolommen
# Hint: gebruik is.na() en mean()/median() met na.rm=TRUE

# 4. Maak een nieuwe kolom voor de maand
# Hint: gebruik de functie month() uit het lubridate package

# Sla het resultaat op in clean_data
```

**Hints**:
- Voor datumbewerking kun je het `lubridate` package gebruiken
- Gebruik `na.rm = TRUE` bij het berekenen van gemiddelde en mediaan
- Controleer met `summary()` of je alle missing values hebt vervangen
