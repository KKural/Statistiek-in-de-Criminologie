In deze oefening ga je een csv-bestand met misdaadcijfers inladen. Het volledige pad naar het bestand staat in de variabele `bestandspad`.

Je moet een dataframe genaamd `misdaad_data` aanmaken door het CSV-bestand in te lezen. Volg deze stappen:

1. Controleer met `getwd()` in welke map R nu werkt.
2. Bepaal de map waarin het CSV-bestand staat met `dirname(bestandspad)`.
3. Bewaar je huidige werkmap zodat je er later naar kunt terugkeren.
4. Zet de werkmap met `setwd()` naar de map van het CSV-bestand.
5. Lees het bestand in met `read.csv()` en gebruik `basename(bestandspad)` om alleen de bestandsnaam op te geven.
6. Sla het resultaat op als `misdaad_data`.
7. Zet de werkmap eventueel terug naar de oorspronkelijke map.

```r
# Voorbeeld van bestandspad structuur
bestandspad  # Dit bevat het pad naar het CSV-bestand dat je moet inladen

# Stap 1: Controleer huidige werkmap
huidige_map <- getwd()

# Stap 2: Bepaal de map waarin het bestand staat
data_map <- dirname(bestandspad)  # Geeft alleen het pad naar de map

# Stap 3-4: Wissel naar de map met het CSV-bestand
setwd(data_map)

# Stap 5-6: Lees het bestand in met de juiste naam
misdaad_data <- read.csv(basename(bestandspad))  # basename geeft alleen de bestandsnaam

# Stap 7: Ga terug naar de oorspronkelijke map
setwd(huidige_map)
```

**Hint:**  
Gebruik de functies `dirname()` en `basename()` om respectievelijk de map en de bestandsnaam uit het volledige pad te halen. Controleer altijd of je werkmap correct staat voordat je een bestand inleest. Het is ook mogelijk om direct `read.csv(bestandspad)` te gebruiken zonder de werkmap te wijzigen, maar voor deze oefening is het belangrijk om te oefenen met het manipuleren van bestandspaden.
