Je hebt een dataset met gerapporteerde misdrijven. Gebruik de functie `subset()` om een nieuwe dataset te maken die alleen gewelddadige misdrijven bevat (deze zijn geclassificeerd als 'Aanval', 'Overval' of 'Moord') en sla deze op in een variabele genaamd `geweldsdelicten_df`.

```R
# Een data frame met gerapporteerde misdrijven
misdaad_data <- data.frame(
  id = 1:20,
  delict = c("Diefstal", "Aanval", "Drugsdelict", "Overval", "Vandalisme", 
              "Aanval", "Inbraak", "Moord", "Diefstal", "Aanval",
              "Fraude", "Overval", "Diefstal", "Drugsdelict", "Moord",
              "Aanval", "Vandalisme", "Fraude", "Inbraak", "Diefstal"),
  district = c("Noord", "Zuid", "Oost", "Centrum", "West",
               "Zuid", "Noord", "Centrum", "Oost", "West",
               "Noord", "Zuid", "West", "Oost", "Zuid",
               "Centrum", "Noord", "Oost", "West", "Zuid"),
  datum = as.Date("2023-01-01") + 0:19
)

# Maak een nieuwe dataset met alleen gewelddadige misdrijven (Aanval, Overval of Moord)
# Sla het resultaat op in een variabele genaamd 'geweldsdelicten_df'

# Gebruik subset() om rijen te selecteren waar delict "Aanval", "Overval" of "Moord" is
# Ken het resultaat toe aan geweldsdelicten_df
```

**Hint:**  
Gebruik `subset()` of `dplyr::filter()` om rijen te selecteren op basis van een voorwaarde, bijvoorbeeld: delict %in% c('Aanval', 'Overval', 'Moord').
