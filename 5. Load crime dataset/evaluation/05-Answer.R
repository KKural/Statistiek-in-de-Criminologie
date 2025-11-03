# bloom_level: Apply & Analyze
# scaffolding_level: Medium support
# primm_phase: Modify

context({
  testcase(" ", {
    testEqual(
      " ",
      function(env) {
        # Controleer of variabele bestaat
        if (!exists("misdaad_data", envir = env)) {
          get_reporter()$add_message(
            "❌ De variabele 'misdaad_data' bestaat niet. Heb je het CSV-bestand correct ingeladen?",
            type = "error"
          )
          return(FALSE)
        }
        # Controleer of het een dataframe is
        if (!is.data.frame(env$misdaad_data)) {
          get_reporter()$add_message(
            "❌ 'misdaad_data' moet een data frame zijn.",
            type = "error"
          )
          return(FALSE)
        }
        # Controleer of alle vereiste kolommen aanwezig zijn
        vereiste_kolommen <- c("zaak_id", "datum", "district", "misdaad_type", "waardeverlies", "agenten_uitgezonden", "reactietijd")
        if (!all(vereiste_kolommen %in% names(env$misdaad_data))) {
          get_reporter()$add_message(
            paste0("❌ 'misdaad_data' mist één of meer vereiste kolommen: ", paste(vereiste_kolommen, collapse=", "), "."),
            type = "error"
          )
          return(FALSE)
        }
        # Alles is correct
        return(TRUE)
      },
      TRUE,
      comparator = function(got, want, ...) {
        if (!got) {
          return(FALSE)
        }
        get_reporter()$add_message(
          "✅ Correct! Je hebt het CSV-bestand correct ingeladen in 'misdaad_data'.",
          type = "success"
        )
        # Toon voorbeeld van bestandspad en uitleg over functies
        get_reporter()$add_message(
          "## Uitleg over de gebruikte functies",
          type = "markdown"
        )
        voorbeeldpad <- "C:/Users/student/Documents/misdaad_data.csv"
        get_reporter()$add_message(paste(
          "### Voorbeeld van bestandspad bewerking:",
          "```r",
          paste0("bestandspad <- \"", voorbeeldpad, "\""),
          paste0("dirname(bestandspad)  # Geeft: \"C:/Users/student/Documents\""),
          paste0("basename(bestandspad) # Geeft: \"misdaad_data.csv\""),
          "```",
          sep = "\n"
        ), type = "markdown")
        get_reporter()$add_message(paste(
          "### Functies uitleg:",
          "- `getwd()`: Geeft de huidige werkmap (working directory) terug",
          "- `setwd()`: Verandert de huidige werkmap naar het opgegeven pad",
          "- `dirname()`: Haalt de mapnaam uit een volledig bestandspad",
          "- `basename()`: Haalt de bestandsnaam uit een volledig bestandspad", 
          "- `read.csv()`: Leest een CSV-bestand in als een dataframe",
          sep = "\n"
        ), type = "markdown")
        get_reporter()$add_message(
          "## Eerste rijen van je dataframe:",
          type = "markdown"
        )
        tryCatch({
          if (is.data.frame(env$misdaad_data)) {
            data_head <- capture.output(head(env$misdaad_data, 5))
            get_reporter()$add_message(paste(data_head, collapse = "\n"), type = "code")
          }
        }, error = function(e) {
          get_reporter()$add_message(paste0("Kon dataframe niet tonen: ", toString(e)), type = "code")
        })
        return(TRUE)
      }
    )
  })
}, preExec = {
  # Maak het CSV-bestand aan in tempdir()
  library(tibble); library(dplyr)
  set.seed(42)
  misdaad_data_origineel <- tibble(
    zaak_id    = sprintf("ZAAK%03d", 1:200),
    datum      = sample(seq.Date(as.Date("2023-01-01"),
                                 as.Date("2023-12-31"), "day"), 200, TRUE),
    district   = sample(c("A", "B", "C", "D"), 200, TRUE, prob = c(.4,.3,.2,.1)),
    misdaad_type = sample(c("Inbraak","Aanval","Diefstal","Vandalisme"),
                          200, TRUE),
    waardeverlies       = round(rlnorm(200, 3, 1)),
    agenten_uitgezonden = sample(1:5, 200, TRUE),
    reactietijd         = round(pmax(rnorm(200, 12, 4), 0), 1)
  )
  bestandspad <- file.path(tempdir(), "misdaad_data.csv")
  write.csv(misdaad_data_origineel, bestandspad, row.names = FALSE)
  
  # Maak bestandspad beschikbaar in de globale omgeving zodat studenten ernaar kunnen verwijzen
  assign("bestandspad", bestandspad, envir = globalenv())
})

# Modeloplossing (een mogelijke aanpak):
# # Bepaal huidige map
# huidige_map <- getwd()
# 
# # Bepaal de map waarin het bestand staat
# data_map <- dirname(bestandspad)
# 
# # Wissel naar de map met het CSV-bestand
# setwd(data_map)
# 
# # Lees het bestand in
# misdaad_data <- read.csv(basename(bestandspad))
# 
# # Ga terug naar de oorspronkelijke map
# setwd(huidige_map)
