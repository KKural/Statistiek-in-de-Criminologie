# bloom_level: Remember & Understand
# scaffolding_level: Full support
# primm_phase: Run

context({
  testcase(" ", {
    # Controleer eerst of de str functie is gebruikt
    testFunctionUsed("str")
    
    # Controleer dan of ze precies str(df_crime_data) hebben gebruikt
    testEqual(
      " ",
      function(env) {
        # Haal de code van de student op als tekst van de geparseerde code
        code_text <- toString(deparse(test_env$parsed_code))
        # Zoek naar het exacte patroon str(df_crime_data)
        return(grepl("str\\(df_crime_data\\)", code_text))
      },
      TRUE,
      comparator = function(got, want, ...) {
        if (got) {
          # Student heeft str(df_crime_data) gebruikt, geef positieve feedback
          get_reporter()$add_message(
            "✅ Goed gedaan! Je hebt `str(df_crime_data)` gebruikt om de structuur van het dataframe te bekijken.",
            type = "success"
          )
          
          # Geef aanvullende educatieve boodschap over de str() functie
          get_reporter()$add_message(
            "De `str()` functie is erg nuttig om snel inzicht te krijgen in de structuur van een dataframe. Het toont de variabelen, hun types en enkele voorbeeldwaarden.",
            type = "info"
          )
          
          # Toon de str() output voor het dataframe
          get_reporter()$add_message(
            "## Structuur van df_crime_data:",
            type = "markdown"
          )
          
          # Converteer str() output naar een string en toon het als code
          str_output <- capture.output(str(df_crime_data))
          get_reporter()$add_message(paste(str_output, collapse = "\n"), type = "code")
          
          # Voeg educatieve uitleg toe over de meetniveaus
          get_reporter()$add_message(
            "## Meetniveaus in de dataset:",
            type = "markdown"
          )
          
          # Gebruik paste voor string concatenatie
          get_reporter()$add_message(paste(
            "- **Nominale variabelen**: `type`, `district` (categorieën zonder rangorde)",
            "- **Ordinale variabelen**: `ernst` (categorieën met rangorde: Licht < Matig < Ernstig)", 
            "- **Interval/Ratio variabelen**: `leeftijd` (numerieke waarden)",
            sep = "\n"
          ), type = "markdown")
          
          get_reporter()$add_message(
            "## Tips voor het herkennen van meetniveaus:",
            type = "markdown"
          )
          
          get_reporter()$add_message(paste(
            "- Nominale variabelen zijn vaak opgeslagen als `Factor` zonder ordered=TRUE",
            "- Ordinale variabelen zijn vaak opgeslagen als `Ord.factor`",
            "- Interval/Ratio variabelen zijn vaak opgeslagen als `num` of `int`",
            sep = "\n"
          ), type = "markdown")
          
          return(TRUE)
        } else {
          # Student heeft str() wel gebruikt, maar niet precies str(df_crime_data)
          get_reporter()$add_message(
            "❌ Je moet precies de opdracht `str(df_crime_data)` gebruiken om de structuur van het dataframe te bekijken.",
            type = "error"
          )
          
          return(FALSE)
        }
      }
    )
  })
}, preExec = {
  # Create the data frame that's mentioned in the description
  df_crime_data <- data.frame(
    type = factor(c("Diefstal", "Aanval", "Inbraak", "Fraude", "Vandalisme")),
    ernst = factor(c("Licht", "Matig", "Ernstig", "Matig", "Licht"), 
                   levels = c("Licht", "Matig", "Ernstig"), 
                   ordered = TRUE),
    leeftijd = c(19, 23, 45, 32, 28),
    district = c("A1", "B2", "C3", "D4", "E5")
  )
  
  # Important: Make df_crime_data available globally
  # Assign to both global environment and the current environment 
  # to ensure it's available in all contexts
  assign("df_crime_data", df_crime_data, envir = globalenv())
})

# Model solution:
# # Bekijk de structuur van het dataframe
# str(df_crime_data)
