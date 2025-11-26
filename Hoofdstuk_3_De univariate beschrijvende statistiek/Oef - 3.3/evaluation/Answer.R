context({
  testcase(
    "",
    {
      testEqual(
        " ",
        function(env) {
          # Use the provided environment (env) instead of globalenv()
          results <- list()
          
          # Data: 24, 36, 35, 28, 24, 28, 24, 36, 32, 36, 40, 38, 36, 34, 40, 36, 32, 36, 40, 36
          
          # STAP 1 - Centraliteit maten
          if (exists("modus", envir = env)) {
            current_val <- as.numeric(get("modus", envir = env))
            results$modus <- list(
              exists = TRUE,
              value = get("modus", envir = env),
              correct = current_val == 36,
              expected = 36
            )
          } else {
            results$modus <- list(exists = FALSE, value = NA, correct = FALSE, expected = 36)
          }
          
          if (exists("mediaan", envir = env)) {
            current_val <- as.numeric(get("mediaan", envir = env))
            results$mediaan <- list(
              exists = TRUE,
              value = get("mediaan", envir = env),
              correct = current_val == 36,
              expected = 36
            )
          } else {
            results$mediaan <- list(exists = FALSE, value = NA, correct = FALSE, expected = 36)
          }
          
          if (exists("gemiddelde", envir = env)) {
            current_val <- as.numeric(get("gemiddelde", envir = env))
            results$gemiddelde <- list(
              exists = TRUE,
              value = get("gemiddelde", envir = env),
              correct = abs(current_val - 33.55) < 0.01,
              expected = 33.55
            )
          } else {
            results$gemiddelde <- list(exists = FALSE, value = NA, correct = FALSE, expected = 33.55)
          }
          
          
          # STAP 1b: Spreiding maten
          if (exists("variatiebreedte", envir = env)) {
            current_val <- as.numeric(get("variatiebreedte", envir = env))
            results$variatiebreedte <- list(
              exists = TRUE,
              value = get("variatiebreedte", envir = env),
              correct = current_val == 16,
              expected = 16
            )
          } else {
            results$variatiebreedte <- list(exists = FALSE, value = NA, correct = FALSE, expected = 16)
          }
          
          if (exists("q1", envir = env)) {
            current_val <- as.numeric(get("q1", envir = env))
            results$q1 <- list(
              exists = TRUE,
              value = get("q1", envir = env),
              correct = current_val == 30,
              expected = 30
            )
          } else {
            results$q1 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 30)
          }
          
          if (exists("q3", envir = env)) {
            current_val <- as.numeric(get("q3", envir = env))
            results$q3 <- list(
              exists = TRUE,
              value = get("q3", envir = env),
              correct = current_val == 36,
              expected = 36
            )
          } else {
            results$q3 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 36)
          }
          
          if (exists("ika", envir = env)) {
            current_val <- as.numeric(get("ika", envir = env))
            results$ika <- list(
              exists = TRUE,
              value = get("ika", envir = env),
              correct = current_val == 6,
              expected = 6
            )
          } else {
            results$ika <- list(exists = FALSE, value = NA, correct = FALSE, expected = 6)
          }
          
          # STAP 1c: Parameter keuze
          if (exists("meest_relevante_centraliteit", envir = env)) {
            current_val <- tolower(trimws(as.character(get("meest_relevante_centraliteit", envir = env))))
            results$meest_relevante_centraliteit <- list(
              exists = TRUE,
              value = get("meest_relevante_centraliteit", envir = env),
              correct = current_val == "gemiddelde",
              expected = "gemiddelde"
            )
          } else {
            results$meest_relevante_centraliteit <- list(exists = FALSE, value = NA, correct = FALSE, expected = "gemiddelde")
          }
          
          if (exists("meest_relevante_spreiding", envir = env)) {
            current_val <- tolower(trimws(as.character(get("meest_relevante_spreiding", envir = env))))
            results$meest_relevante_spreiding <- list(
              exists = TRUE,
              value = get("meest_relevante_spreiding", envir = env),
              correct = current_val %in% c("interkwartielafstand", "variatiebreedte"),
              expected = "interkwartielafstand"
            )
          } else {
            results$meest_relevante_spreiding <- list(exists = FALSE, value = NA, correct = FALSE, expected = "interkwartielafstand")
          }
          
          if (exists("reden", envir = env)) {
            current_val <- tolower(trimws(as.character(get("reden", envir = env))))
            results$reden <- list(
              exists = TRUE,
              value = get("reden", envir = env),
              correct = current_val == "gebruikt alle informatie",
              expected = "gebruikt alle informatie"
            )
          } else {
            results$reden <- list(exists = FALSE, value = NA, correct = FALSE, expected = "gebruikt alle informatie")
          }
          
          
          # STAP 2: Afwijkingen
          if (exists("afwijkingen", envir = env)) {
            current_val <- get("afwijkingen", envir = env)
            expected_vec <- c(-9.55, 2.45, 1.45, -5.55, -9.55, -5.55, -9.55, 2.45, -1.55, 2.45, 6.45, 4.45, 2.45, 0.45, 6.45, 2.45, -1.55, 2.45, 6.45, 2.45)
            
            results$afwijkingen <- list(
              exists = TRUE,
              value = current_val,
              correct = is.numeric(current_val) && length(current_val) == 20 && 
                        all(abs(as.numeric(current_val) - expected_vec) < 0.01),
              expected = expected_vec
            )
          } else {
            results$afwijkingen <- list(exists = FALSE, value = NA, correct = FALSE, expected = expected_vec)
          }
          
          if (exists("gekwadrateerde_afwijkingen", envir = env)) {
            current_val <- get("gekwadrateerde_afwijkingen", envir = env)
            expected_vec2 <- c(91.2025, 6.0025, 2.1025, 30.8025, 91.2025, 30.8025, 91.2025, 6.0025, 2.4025, 6.0025, 41.6025, 19.8025, 6.0025, 0.2025, 41.6025, 6.0025, 2.4025, 6.0025, 41.6025, 6.0025)
            
            results$gekwadrateerde_afwijkingen <- list(
              exists = TRUE,
              value = current_val,
              correct = is.numeric(current_val) && length(current_val) == 20 && 
                        all(abs(as.numeric(current_val) - expected_vec2) < 0.01),
              expected = expected_vec2
            )
          } else {
            results$gekwadrateerde_afwijkingen <- list(exists = FALSE, value = NA, correct = FALSE, expected = expected_vec2)
          }
          
          
          # STAP 3: Variantie en standaardafwijking
          if (exists("sum_of_squares", envir = env)) {
            current_val <- as.numeric(get("sum_of_squares", envir = env))
            results$sum_of_squares <- list(
              exists = TRUE,
              value = get("sum_of_squares", envir = env),
              correct = abs(current_val - 528.95) < 0.01,
              expected = 528.95
            )
          } else {
            results$sum_of_squares <- list(exists = FALSE, value = NA, correct = FALSE, expected = 528.95)
          }
          
          if (exists("variantie", envir = env)) {
            current_val <- as.numeric(get("variantie", envir = env))
            results$variantie <- list(
              exists = TRUE,
              value = get("variantie", envir = env),
              correct = abs(current_val - 27.8295) < 0.01,
              expected = 27.8295
            )
          } else {
            results$variantie <- list(exists = FALSE, value = NA, correct = FALSE, expected = 27.8295)
          }
          
          if (exists("standaardafwijking", envir = env)) {
            current_val <- as.numeric(get("standaardafwijking", envir = env))
            results$standaardafwijking <- list(
              exists = TRUE,
              value = get("standaardafwijking", envir = env),
              correct = abs(current_val - 5.2763) < 0.01,
              expected = 5.2763
            )
          } else {
            results$standaardafwijking <- list(exists = FALSE, value = NA, correct = FALSE, expected = 5.2763)
          }
          
          if (exists("variatiecoefficient", envir = env)) {
            current_val <- as.numeric(get("variatiecoefficient", envir = env))
            results$variatiecoefficient <- list(
              exists = TRUE,
              value = get("variatiecoefficient", envir = env),
              correct = abs(current_val - 0.1573) < 0.01,
              expected = 0.1573
            )
          } else {
            results$variatiecoefficient <- list(exists = FALSE, value = NA, correct = FALSE, expected = 0.1573)
          }
          
          
          # Store results for use in comparator
          assign("detailed_results", results, envir = globalenv())
          
          # Return overall success
          all_correct <- all(sapply(results, function(x) x$correct))
          return(all_correct)
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          # Get detailed results from global environment
          results <- get("detailed_results", envir = globalenv())
          
          # Create detailed output showing all variables
          feedback_parts <- c("**Resultaten per vraag:**\n")
          
          question_names <- c(
            "modus" = "1. Modus van werkuren",
            "mediaan" = "2. Mediaan van werkuren", 
            "gemiddelde" = "3. Gemiddelde van werkuren",
            "variatiebreedte" = "4. Variatiebreedte (range)",
            "q1" = "5. Eerste kwartiel (Q1)",
            "q3" = "6. Derde kwartiel (Q3)",
            "ika" = "7. Interkwartielafstand (IKA)",
            "meest_relevante_centraliteit" = "8. Beste centraliteitsmaat",
            "meest_relevante_spreiding" = "9. Beste spreidingsmaat",
            "reden" = "10. Reden voor keuze",
            "afwijkingen" = "11. Afwijkingen van gemiddelde",
            "gekwadrateerde_afwijkingen" = "12. Gekwadrateerde afwijkingen",
            "sum_of_squares" = "13. Som gekwadrateerde afwijkingen",
            "variantie" = "14. Variantie",
            "standaardafwijking" = "15. Standaardafwijking",
            "variatiecoefficient" = "16. Variatiecoëfficiënt"
          )
          
          counter <- 1
          for(var_key in names(question_names)) {
            if(var_key %in% names(results)) {
              var_display <- question_names[var_key]
              result <- results[[var_key]]
              
              if(!result$exists) {
                feedback_parts <- c(feedback_parts, paste0("**", var_display, "**: *Ontbreekt* ❌"))
              } else if(result$correct) {
                feedback_parts <- c(feedback_parts, paste0("**", var_display, "**: ", result$value, " ✅"))
              } else {
                feedback_parts <- c(feedback_parts, paste0("**", var_display, "**: ", result$value, " (verwacht: ", result$expected, ") ❌"))
              }
            }
            counter <- counter + 1
          }
          
          if (generated == expected) {
            feedback_parts <- c(feedback_parts, "\n✅ **Alle berekeningen correct!**")
            feedback_parts <- c(feedback_parts, "\n**Uitstekend!** Je beheerst de analyse van werkuren data perfect.")
          } else {
            incorrect_count <- sum(sapply(results, function(x) !x$correct))
            feedback_parts <- c(feedback_parts, paste0("\n❌ **", incorrect_count, " fouten gevonden**"))
            
            # Add helpful tips
            feedback_parts <- c(feedback_parts, "\n**📚 Tips:**")
            feedback_parts <- c(feedback_parts, "• Data: 24, 36, 35, 28, 24, 28, 24, 36, 32, 36, 40, 38, 36, 34, 40, 36, 32, 36, 40, 36")
            feedback_parts <- c(feedback_parts, "• Gemiddelde = 671 ÷ 20 = 33.55")
            feedback_parts <- c(feedback_parts, "• Voor afwijkingen: Xi - 33.55")
            feedback_parts <- c(feedback_parts, "• Voor gekwadrateerde afwijkingen: (Xi - 33.55)²")
            feedback_parts <- c(feedback_parts, "• Variantie = som gekwadrateerde afwijkingen ÷ (n-1) = 528.95 ÷ 19")
            feedback_parts <- c(feedback_parts, "• Standaardafwijking = √variantie")
            feedback_parts <- c(feedback_parts, "• Variatiecoëfficiënt = standaardafwijking ÷ gemiddelde")
          }
          
          return(paste(feedback_parts, collapse = "\n"))
        }
      )
    }
  )
})
