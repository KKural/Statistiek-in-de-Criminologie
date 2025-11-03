# bloom_level: Apply & Analyze
# scaffolding_level: Moderate support
# primm_phase: Modify

context({
  testcase(" ", {
    # Test of datum correct is geconverteerd
    testEqual(
      " ",
      function(env) {
        class(env$clean_data$date)[1]
      },
      "Date",
      comparator = function(generated, expected, ...) {
        result <- generated == expected
        if (!result) {
          get_reporter()$add_message(
            "❌ De kolom 'date' is niet correct omgezet naar het Date formaat. Gebruik `as.Date(raw_data$date, format = '%d/%m/%Y')`",
            type = "markdown"
          )
        } else {
          get_reporter()$add_message(
            "✅ De datumkolom is correct omgezet naar het Date formaat!",
            type = "markdown"
          )
        }
        return(result)
      }
    )
    
    # Test of categorische variabelen factor zijn
    testEqual(
      "Crime type als factor",
      function(env) {
        class(env$clean_data$crime_type)[1]
      },
      "factor",
      comparator = function(generated, expected, ...) {
        result <- generated == expected
        if (!result) {
          get_reporter()$add_message(
            "❌ De kolom 'crime_type' is niet omgezet naar een factor. Gebruik `factor(raw_data$crime_type)`",
            type = "markdown"
          )
        } else {
          get_reporter()$add_message(
            "✅ De crime_type kolom is correct omgezet naar een factor!",
            type = "markdown"
          )
        }
        return(result)
      }
    )
    
    # Test of district een factor is
    testEqual(
      "District als factor",
      function(env) {
        class(env$clean_data$district)[1]
      },
      "factor",
      comparator = function(generated, expected, ...) {
        result <- generated == expected
        if (!result) {
          get_reporter()$add_message(
            "❌ De kolom 'district' is niet omgezet naar een factor. Gebruik `factor(raw_data$district)`",
            type = "markdown"
          )
        } else {
          get_reporter()$add_message(
            "✅ De district kolom is correct omgezet naar een factor!",
            type = "markdown"
          )
        }
        return(result)
      }
    )
    
    # Test of er nog NA waarden in age_offender zijn
    testEqual(
      "NA waarden in age_offender",
      function(env) {
        sum(is.na(env$clean_data$age_offender))
      },
      0,
      comparator = function(generated, expected, ...) {
        result <- generated == expected
        if (!result) {
          get_reporter()$add_message(
            "❌ Er zijn nog steeds NA waarden in de kolom 'age_offender'. Je moet deze vervangen door het gemiddelde van alle beschikbare leeftijden.",
            type = "markdown"
          )
        } else {
          get_reporter()$add_message(
            "✅ Alle NA waarden in age_offender zijn correct vervangen!",
            type = "markdown"
          )
        }
        return(result)
      }
    )
    
    # Test of er nog NA waarden in severity zijn
    testEqual(
      "NA waarden in severity",
      function(env) {
        sum(is.na(env$clean_data$severity))
      },
      0,
      comparator = function(generated, expected, ...) {
        result <- generated == expected
        if (!result) {
          get_reporter()$add_message(
            "❌ Er zijn nog steeds NA waarden in de kolom 'severity'. Je moet deze vervangen door de mediaan van alle beschikbare waarden.",
            type = "markdown"
          )
        } else {
          get_reporter()$add_message(
            "✅ Alle NA waarden in severity zijn correct vervangen!",
            type = "markdown"
          )
        }
        return(result)
      }
    )
    
    # Test of de maand kolom is aangemaakt
    testEqual(
      "Maand kolom",
      function(env) {
        "month" %in% names(env$clean_data)
      },
      TRUE,
      comparator = function(generated, expected, ...) {
        result <- generated == expected
        if (!result) {
          get_reporter()$add_message(
            "❌ De kolom 'month' is niet aangemaakt. Gebruik de `month()` functie uit het lubridate package om de maand uit de datum te extraheren.",
            type = "markdown"
          )
        } else {
          get_reporter()$add_message(
            "✅ De maand kolom is succesvol aangemaakt!",
            type = "markdown"
          )
        }
        return(result)
      }
    )
    
    # Controleer of de maand kolom numerieke waarden bevat tussen 1 en 12
    testEqual(
      "Maand waarden",
      function(env) {
        all(env$clean_data$month >= 1 & env$clean_data$month <= 12)
      },
      TRUE,
      comparator = function(generated, expected, ...) {
        result <- generated == expected
        if (!result) {
          get_reporter()$add_message(
            "❌ De waarden in de 'month' kolom zijn niet correct. Alle waarden moeten tussen 1 en 12 liggen.",
            type = "markdown"
          )
        } else {
          get_reporter()$add_message(
            "✅ De maand kolom bevat correcte waarden!",
            type = "markdown"
          )
        }
        return(result)
      }
    )
  })
}, preExec = {
  library(lubridate)
  
  # Creëer een synthetische dataset
  set.seed(123)
  n <- 100
  
  # Genereer willekeurige data
  dates <- seq(as.Date("2022-01-01"), as.Date("2022-12-31"), by="day")[sample(1:365, n, replace = TRUE)]
  dates_char <- format(dates, "%d/%m/%Y")
  crime_types <- sample(c("Theft", "Assault", "Vandalism", "Fraud", "Burglary"), n, replace = TRUE)
  districts <- sample(c("North", "South", "East", "West", "Central"), n, replace = TRUE)
  
  # Voeg wat NA's toe
  age_offender <- sample(18:65, n, replace = TRUE)
  age_offender[sample(1:n, 10)] <- NA
  
  severity <- sample(1:5, n, replace = TRUE)
  severity[sample(1:n, 15)] <- NA
  
  # Maak de dataset
  raw_data <- data.frame(
    date = dates_char,
    crime_type = crime_types,
    district = districts,
    age_offender = age_offender,
    severity = severity,
    stringsAsFactors = FALSE
  )
})

# Model solution:
# library(lubridate)
#
# # Converteer de datum
# clean_data <- raw_data
# clean_data$date <- as.Date(raw_data$date, format = "%d/%m/%Y")
#
# # Zet categorische variabelen om naar factoren
# clean_data$crime_type <- factor(raw_data$crime_type)
# clean_data$district <- factor(raw_data$district)
#
# # Vervang missing values
# clean_data$age_offender[is.na(clean_data$age_offender)] <- mean(clean_data$age_offender, na.rm = TRUE)
# clean_data$severity[is.na(clean_data$severity)] <- median(clean_data$severity, na.rm = TRUE)
#
# # Maak een nieuwe kolom voor de maand
# clean_data$month <- month(clean_data$date)
