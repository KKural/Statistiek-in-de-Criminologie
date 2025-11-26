context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          # Use the provided environment (env) instead of globalenv()
          results <- list()
          
          # Data: 24, 36, 35, 28, 24, 28, 24, 36, 32, 36, 40, 38, 36, 34, 40, 36, 32, 36, 40, 36
          
          # STAP 0 - Frequentietabel
          # Frequency variables
          if (exists("freq_24", envir = env)) {
            current_val <- as.numeric(get("freq_24", envir = env))
            results$freq_24 <- list(
              exists = TRUE,
              value = get("freq_24", envir = env),
              correct = current_val == 3,
              expected = 3
            )
          } else {
            results$freq_24 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 3)
          }
          
          if (exists("freq_28", envir = env)) {
            current_val <- as.numeric(get("freq_28", envir = env))
            results$freq_28 <- list(
              exists = TRUE,
              value = get("freq_28", envir = env),
              correct = current_val == 2,
              expected = 2
            )
          } else {
            results$freq_28 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 2)
          }
          
          if (exists("freq_32", envir = env)) {
            current_val <- as.numeric(get("freq_32", envir = env))
            results$freq_32 <- list(
              exists = TRUE,
              value = get("freq_32", envir = env),
              correct = current_val == 2,
              expected = 2
            )
          } else {
            results$freq_32 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 2)
          }
          
          if (exists("freq_34", envir = env)) {
            current_val <- as.numeric(get("freq_34", envir = env))
            results$freq_34 <- list(
              exists = TRUE,
              value = get("freq_34", envir = env),
              correct = current_val == 1,
              expected = 1
            )
          } else {
            results$freq_34 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 1)
          }
          
          if (exists("freq_35", envir = env)) {
            current_val <- as.numeric(get("freq_35", envir = env))
            results$freq_35 <- list(
              exists = TRUE,
              value = get("freq_35", envir = env),
              correct = current_val == 1,
              expected = 1
            )
          } else {
            results$freq_35 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 1)
          }
          
          if (exists("freq_36", envir = env)) {
            current_val <- as.numeric(get("freq_36", envir = env))
            results$freq_36 <- list(
              exists = TRUE,
              value = get("freq_36", envir = env),
              correct = current_val == 7,
              expected = 7
            )
          } else {
            results$freq_36 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 7)
          }
          
          if (exists("freq_38", envir = env)) {
            current_val <- as.numeric(get("freq_38", envir = env))
            results$freq_38 <- list(
              exists = TRUE,
              value = get("freq_38", envir = env),
              correct = current_val == 1,
              expected = 1
            )
          } else {
            results$freq_38 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 1)
          }
          
          if (exists("freq_40", envir = env)) {
            current_val <- as.numeric(get("freq_40", envir = env))
            results$freq_40 <- list(
              exists = TRUE,
              value = get("freq_40", envir = env),
              correct = current_val == 3,
              expected = 3
            )
          } else {
            results$freq_40 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 3)
          }
          
          # Percentage variables
          if (exists("percent_24", envir = env)) {
            current_val <- as.numeric(get("percent_24", envir = env))
            results$percent_24 <- list(
              exists = TRUE,
              value = get("percent_24", envir = env),
              correct = abs(current_val - 15.0) < 0.1,
              expected = 15.0
            )
          } else {
            results$percent_24 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 15.0)
          }
          
          if (exists("percent_28", envir = env)) {
            current_val <- as.numeric(get("percent_28", envir = env))
            results$percent_28 <- list(
              exists = TRUE,
              value = get("percent_28", envir = env),
              correct = abs(current_val - 10.0) < 0.1,
              expected = 10.0
            )
          } else {
            results$percent_28 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 10.0)
          }
          
          if (exists("percent_32", envir = env)) {
            current_val <- as.numeric(get("percent_32", envir = env))
            results$percent_32 <- list(
              exists = TRUE,
              value = get("percent_32", envir = env),
              correct = abs(current_val - 10.0) < 0.1,
              expected = 10.0
            )
          } else {
            results$percent_32 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 10.0)
          }
          
          if (exists("percent_34", envir = env)) {
            current_val <- as.numeric(get("percent_34", envir = env))
            results$percent_34 <- list(
              exists = TRUE,
              value = get("percent_34", envir = env),
              correct = abs(current_val - 5.0) < 0.1,
              expected = 5.0
            )
          } else {
            results$percent_34 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 5.0)
          }
          
          if (exists("percent_35", envir = env)) {
            current_val <- as.numeric(get("percent_35", envir = env))
            results$percent_35 <- list(
              exists = TRUE,
              value = get("percent_35", envir = env),
              correct = abs(current_val - 5.0) < 0.1,
              expected = 5.0
            )
          } else {
            results$percent_35 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 5.0)
          }
          
          if (exists("percent_36", envir = env)) {
            current_val <- as.numeric(get("percent_36", envir = env))
            results$percent_36 <- list(
              exists = TRUE,
              value = get("percent_36", envir = env),
              correct = abs(current_val - 35.0) < 0.1,
              expected = 35.0
            )
          } else {
            results$percent_36 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 35.0)
          }
          
          if (exists("percent_38", envir = env)) {
            current_val <- as.numeric(get("percent_38", envir = env))
            results$percent_38 <- list(
              exists = TRUE,
              value = get("percent_38", envir = env),
              correct = abs(current_val - 5.0) < 0.1,
              expected = 5.0
            )
          } else {
            results$percent_38 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 5.0)
          }
          
          if (exists("percent_40", envir = env)) {
            current_val <- as.numeric(get("percent_40", envir = env))
            results$percent_40 <- list(
              exists = TRUE,
              value = get("percent_40", envir = env),
              correct = abs(current_val - 15.0) < 0.1,
              expected = 15.0
            )
          } else {
            results$percent_40 <- list(exists = FALSE, value = NA, correct = FALSE, expected = 15.0)
          }
          
          # STAP 1 - Basic statistics
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
          
          # Parameter choices
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
              correct = current_val == "interkwartielafstand",
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
          
          # STAP 2 - Advanced calculations
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
            results$afwijkingen <- list(exists = FALSE, value = NA, correct = FALSE, expected = "vector van 20 afwijkingen")
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
            results$gekwadrateerde_afwijkingen <- list(exists = FALSE, value = NA, correct = FALSE, expected = "vector van 20 gekwadrateerde afwijkingen")
          }
          
          # STAP 3 - Variance and standard deviation
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
            # Frequency table
            "freq_24" = "1. Frequentie 24 uren",
            "freq_28" = "2. Frequentie 28 uren", 
            "freq_32" = "3. Frequentie 32 uren",
            "freq_34" = "4. Frequentie 34 uren",
            "freq_35" = "5. Frequentie 35 uren",
            "freq_36" = "6. Frequentie 36 uren",
            "freq_38" = "7. Frequentie 38 uren",
            "freq_40" = "8. Frequentie 40 uren",
            "percent_24" = "9. Percentage 24 uren",
            "percent_28" = "10. Percentage 28 uren",
            "percent_32" = "11. Percentage 32 uren",
            "percent_34" = "12. Percentage 34 uren",
            "percent_35" = "13. Percentage 35 uren",
            "percent_36" = "14. Percentage 36 uren",
            "percent_38" = "15. Percentage 38 uren",
            "percent_40" = "16. Percentage 40 uren",
            # Basic statistics
            "modus" = "17. Modus",
            "mediaan" = "18. Mediaan", 
            "gemiddelde" = "19. Gemiddelde",
            "variatiebreedte" = "20. Variatiebreedte",
            "q1" = "21. Eerste kwartiel (Q1)",
            "q3" = "22. Derde kwartiel (Q3)",
            "ika" = "23. Interkwartielafstand",
            "meest_relevante_centraliteit" = "24. Beste centraliteitsmaat",
            "meest_relevante_spreiding" = "25. Beste spreidingsmaat",
            "reden" = "26. Reden voor keuze",
            "afwijkingen" = "27. Afwijkingen van gemiddelde",
            "gekwadrateerde_afwijkingen" = "28. Gekwadrateerde afwijkingen",
            "sum_of_squares" = "29. Som gekwadrateerde afwijkingen",
            "variantie" = "30. Variantie",
            "standaardafwijking" = "31. Standaardafwijking",
            "variatiecoefficient" = "32. Variatiecoëfficiënt"
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
                if(is.vector(result$expected) && length(result$expected) > 1) {
                  feedback_parts <- c(feedback_parts, paste0("**", var_display, "**: Verkeerde vector ❌"))
                } else {
                  feedback_parts <- c(feedback_parts, paste0("**", var_display, "**: ", result$value, " (verwacht: ", result$expected, ") ❌"))
                }
              }
            }
            counter <- counter + 1
          }
          
          if (generated == expected) {
            feedback_parts <- c(feedback_parts, "\n✅ **Alle berekeningen correct!**")
            feedback_parts <- c(feedback_parts, "\n**Uitstekend!** Je beheerst de volledige werkuren analyse perfect.")
          } else {
            incorrect_count <- sum(sapply(results, function(x) !x$correct))
            feedback_parts <- c(feedback_parts, paste0("\n❌ **", incorrect_count, " fouten gevonden**"))
            
            # Add helpful tips
            feedback_parts <- c(feedback_parts, "\n**📚 Tips:**")
            feedback_parts <- c(feedback_parts, "• **Frequenties**: Tel hoe vaak elke waarde voorkomt")
            feedback_parts <- c(feedback_parts, "• **Percentages**: (frequentie ÷ totaal) × 100")
            feedback_parts <- c(feedback_parts, "• **Data**: 24, 36, 35, 28, 24, 28, 24, 36, 32, 36, 40, 38, 36, 34, 40, 36, 32, 36, 40, 36")
            feedback_parts <- c(feedback_parts, "• **Modus**: 36 (komt 7× voor), **Mediaan**: 36, **Gemiddelde**: 33.55")
          }
          
          
          # Final result
          generated == expected
        }
      )
    }
  )
})
