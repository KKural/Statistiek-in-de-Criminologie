context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          results <- list()
          
          expected_mean <- 6
          expected_deviations <- c(-4, 1, 4, -1, 0, 2, -3, -2, 3)
          expected_squared <- c(16, 1, 16, 1, 0, 4, 9, 4, 9)
          expected_ss <- 60
          expected_variance <- 7.5
          expected_sd <- 2.74
          
          # Gemiddelde
          if (exists("gemiddelde_incidenten", envir = env)) {
            current_val <- as.numeric(get("gemiddelde_incidenten", envir = env))
            results$gemiddelde_incidenten <- list(
              exists = TRUE,
              value = current_val,
              correct = abs(current_val - expected_mean) < 0.01,
              expected = expected_mean
            )
          } else {
            results$gemiddelde_incidenten <- list(exists = FALSE, value = NA, correct = FALSE, expected = expected_mean)
          }
          
          # Afwijkingen
          if (exists("afwijkingen", envir = env)) {
            current_val <- as.numeric(get("afwijkingen", envir = env))
            results$afwijkingen <- list(
              exists = TRUE,
              value = current_val,
              correct = length(current_val) == length(expected_deviations) &&
                all(abs(current_val - expected_deviations) < 0.01),
              expected = expected_deviations
            )
          } else {
            results$afwijkingen <- list(exists = FALSE, value = NA, correct = FALSE, expected = expected_deviations)
          }
          
          # Gekwadrateerde afwijkingen
          if (exists("gekwadrateerde_afwijkingen", envir = env)) {
            current_val <- as.numeric(get("gekwadrateerde_afwijkingen", envir = env))
            results$gekwadrateerde_afwijkingen <- list(
              exists = TRUE,
              value = current_val,
              correct = length(current_val) == length(expected_squared) &&
                all(abs(current_val - expected_squared) < 0.01),
              expected = expected_squared
            )
          } else {
            results$gekwadrateerde_afwijkingen <- list(exists = FALSE, value = NA, correct = FALSE, expected = expected_squared)
          }
          
          # Sum of squares
          if (exists("sum_of_squares", envir = env)) {
            current_val <- as.numeric(get("sum_of_squares", envir = env))
            results$sum_of_squares <- list(
              exists = TRUE,
              value = current_val,
              correct = abs(current_val - expected_ss) < 0.01,
              expected = expected_ss
            )
          } else {
            results$sum_of_squares <- list(exists = FALSE, value = NA, correct = FALSE, expected = expected_ss)
          }
          
          # Variantie
          if (exists("variantie_incidenten", envir = env)) {
            current_val <- as.numeric(get("variantie_incidenten", envir = env))
            results$variantie_incidenten <- list(
              exists = TRUE,
              value = current_val,
              correct = abs(current_val - expected_variance) < 0.01,
              expected = expected_variance
            )
          } else {
            results$variantie_incidenten <- list(exists = FALSE, value = NA, correct = FALSE, expected = expected_variance)
          }
          
          # Standaarddeviatie
          if (exists("standaarddeviatie_incidenten", envir = env)) {
            current_val <- as.numeric(get("standaarddeviatie_incidenten", envir = env))
            results$standaarddeviatie_incidenten <- list(
              exists = TRUE,
              value = current_val,
              correct = abs(current_val - expected_sd) < 0.01,
              expected = expected_sd
            )
          } else {
            results$standaarddeviatie_incidenten <- list(exists = FALSE, value = NA, correct = FALSE, expected = expected_sd)
          }
          
          # Gekozen spreidingsmaat
          if (exists("gekozen_spreidingsmaat", envir = env)) {
            current_val <- as.numeric(get("gekozen_spreidingsmaat", envir = env))
            results$gekozen_spreidingsmaat <- list(
              exists = TRUE,
              value = current_val,
              correct = abs(current_val - expected_sd) < 0.01,
              expected = expected_sd
            )
          } else {
            results$gekozen_spreidingsmaat <- list(exists = FALSE, value = NA, correct = FALSE, expected = expected_sd)
          }
          
          # Score en feedback
          total_questions <- length(results)
          correct_count <- sum(vapply(results, function(x) x$exists && x$correct, logical(1)))
          
          feedback_lines <- c()
          for (name in names(results)) {
            res <- results[[name]]
            if (!res$exists) {
              feedback_lines <- c(feedback_lines, paste0("�?� **", name, "** ontbreekt in je code."))
            } else if (!res$correct) {
              feedback_lines <- c(feedback_lines, paste0("�?� **", name, "** verwacht ", paste(res$expected, collapse = ", "), " maar kreeg ", paste(res$value, collapse = ", "), "."))
            }
          }
          
          # Specifieke hint indien n gebruikt in plaats van n-1
          if (results$variantie_incidenten$exists && !results$variantie_incidenten$correct) {
            student_var <- as.numeric(results$variantie_incidenten$value)
            if (!is.na(student_var) && abs(student_var - 6.67) < 0.05) {
              feedback_lines <- c(feedback_lines, "�?� Gebruik **n-1 (8)** in de noemer voor de steekproefvariantie: 60/8 = 7.5.")
            }
          }
          
          feedback_lines <- c(
            feedback_lines,
            "",
            paste0("**", correct_count, " van ", total_questions, " juist.**"),
            "",
            "dY'? **Richtlijn:** Voor interval/ratio-variabelen is de **standaarddeviatie** de meest informatieve spreidingsmaat."
          )
          
          get_reporter()$add_message(
            paste(feedback_lines, collapse = "\n\n"),
            type = "markdown"
          )
          
          expected <- TRUE
          generated <- all(vapply(results, function(x) x$exists && x$correct, logical(1)))
          generated == expected
        }
      )
    }
  )
})
