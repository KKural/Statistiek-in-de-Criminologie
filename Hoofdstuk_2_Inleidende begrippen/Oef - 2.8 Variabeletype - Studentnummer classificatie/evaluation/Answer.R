context({
  testcase(
    " ",
    {
      testEqual(
        "",
        function(env) {
          # Expected table content (ignoring whitespace and formatting)
          expected_answers <- list(
            "favoriete keuze voor online onderzoek" = c("categorisch", "categorical"),
            "leeftijd" = c("kwantitatief", "quantitative"),
            "geslacht" = c("categorisch", "categorical"),
            "studierichting" = c("categorisch", "categorical"),
            "label (studentnummer)" = c("identificatie", "identification", "id")
          )
          
          # Get student's submission (should be printed output from cat() function)
          submission <- tolower(paste(capture.output(env$evaluationResult), collapse = "\n"))
          
          # Check if all correct classifications are present
          all_correct <- TRUE
          missing_vars <- c()
          incorrect_vars <- c()
          
          for (var_name in names(expected_answers)) {
            found_correct <- FALSE
            for (correct_type in expected_answers[[var_name]]) {
              # Check if variable name and correct type both appear in submission
              if (grepl(var_name, submission, fixed = TRUE) && grepl(correct_type, submission)) {
                found_correct <- TRUE
                break
              }
            }
            if (!found_correct) {
              all_correct <- FALSE
              if (!grepl(var_name, submission, fixed = TRUE)) {
                missing_vars <- c(missing_vars, var_name)
              } else {
                incorrect_vars <- c(incorrect_vars, var_name)
              }
            }
          }
          
          return(all_correct)
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          if (generated == expected) {
            get_reporter()$add_message("✅ **Juist - perfecte classificatie van alle variabelen!**\n\n• **Favoriete keuze voor online onderzoek**: Categorisch ✓ (verschillende keuzes zonder numerieke betekenis)\n• **Leeftijd**: Kwantitatief ✓ (getallen waarmee je kunt rekenen: gemiddelde, som)\n• **Geslacht**: Categorisch ✓ (man/vrouw zijn categorieën, geen getallen)\n• **Studierichting**: Categorisch ✓ (verschillende richtingen, geen numerieke waarde)\n• **Label (studentnummer)**: Identificatie ✓ (alleen voor identificatie, geen statistische betekenis)\n\n**Uitstekend!** Je begrijpt het verschil tussen categorische en kwantitatieve variabelen, en herkent identificatievariabelen.", type = "markdown")
          } else {
            # Provide detailed feedback on what's wrong
            submission <- tolower(env$evaluationResult)
            feedback_parts <- c("❌ **Niet alle variabelen zijn correct geclassificeerd.**\n")
            
            # Check each variable individually
            if (!grepl("categorisch", submission) || !grepl("favoriete keuze", submission)) {
              feedback_parts <- c(feedback_parts, "• **Favoriete keuze**: Moet 'Categorisch' zijn (Google, Bibliotheek, Wikipedia zijn categorieën)")
            }
            if (!grepl("kwantitatief", submission) || !grepl("leeftijd", submission)) {
              feedback_parts <- c(feedback_parts, "• **Leeftijd**: Moet 'Kwantitatief' zijn (17, 18, 19 jaar - je kunt gemiddelden berekenen)")
            }
            if (!grepl("geslacht", submission) || !(grepl("categorisch", submission) && grepl("geslacht", submission))) {
              feedback_parts <- c(feedback_parts, "• **Geslacht**: Moet 'Categorisch' zijn (man/vrouw zijn categorieën, geen getallen)")
            }
            if (!grepl("studierichting", submission) || !(grepl("categorisch", submission) && grepl("studierichting", submission))) {
              feedback_parts <- c(feedback_parts, "• **Studierichting**: Moet 'Categorisch' zijn (verschillende richtingen, geen numerieke waarde)")
            }
            if (!grepl("identificatie", submission) || !grepl("studentnummer", submission)) {
              feedback_parts <- c(feedback_parts, "• **Label (studentnummer)**: Moet 'Identificatie' zijn (alleen nummering, geen statistische betekenis)")
            }
            
            feedback_parts <- c(feedback_parts, "\n**Tip**: Kopieer de tabel en vul exact in: Categorisch, Kwantitatief, of Identificatie")
            
            get_reporter()$add_message(paste(feedback_parts, collapse = "\n"), type = "markdown")
          }
          
          generated == expected
        }
      )
    }
  )
})