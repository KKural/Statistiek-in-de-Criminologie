Je hebt een dataset gekregen met informatie over strafzaken. Bepaal het meetniveau (nominaal, ordinaal, interval of ratio) van elke variabele door het juiste niveau toe te wijzen aan elke variabelenaam.

```R
# Een dataset met informatie over strafzaken
crime_data <- data.frame(
  zaak_id = c(1001, 1002, 1003, 1004, 1005),
  geslacht = c("Man", "Vrouw", "Man", "Man", "Vrouw"),
  leeftijd = c(24, 37, 19, 42, 31),
  misdaad_type = c("Diefstal", "Aanval", "Inbraak", "Diefstal", "Fraude"),
  strafduur = c(12, 36, 6, 15, 24),
  opleidingsniveau = c("Secundair", "Primair", "Hoger", "Secundair", "Hoger"),
  risicocategorie = c("Midden", "Hoog", "Laag", "Midden", "Laag")
)
```
Wijs voor elke variabele het meetniveau toe als string: "nominaal", "ordinaal", "interval" of "ratio"
Voorbeeld: niveau_zaak_id <- "nominaal"
Vul de toewijzingen voor alle variabelen hieronder aan

**Hint:**  
Nominaal: categorieën zonder volgorde (bv. geslacht). Ordinaal: categorieën met volgorde (bv. opleidingsniveau). Interval/ratio: numerieke waarden, ratio heeft een absoluut nulpunt (bv. leeftijd).
