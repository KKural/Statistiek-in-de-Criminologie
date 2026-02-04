context({
  testcase(
    "",
    {
      testEqual(
        " ",
        function(env) {
          results <- list()

          # ============================
          # Expected correct answers
          # ============================
          exp1 <- 10
          exp2 <- 3.23
          exp3 <- 72.58
          exp4 <- 0.2097
          exp5 <- 2
          exp6 <- 245

          # ============================
          # CHECK EACH ANSWER
          # ============================

          check_value <- function(varname, expected, tol = 0.01, is_numeric = TRUE) {
            if (!exists(varname, envir = env)) {
              return(list(exists = FALSE, value = NA, correct = FALSE, expected = expected))
            }

            val <- get(varname, envir = env)

            if (is_numeric) {
              val_num <- suppressWarnings(as.numeric(val))
              correct <- !is.na(val_num) && abs(val_num - expected) < tol
              return(list(exists = TRUE, value = val, correct = correct, expected = expected))
            } else {
              return(list(exists = TRUE, value = val, correct = (val == expected), expected = expected))
            }
          }

          results$vraag1 <- check_value("vraag1", exp1)
          results$vraag2 <- check_value("vraag2", exp2)
          results$vraag3 <- check_value("vraag3", exp3)
          results$vraag4 <- check_value("vraag4", exp4, tol = 0.001)
          results$vraag5 <- check_value("vraag5", exp5)
          results$vraag6 <- check_value("vraag6", exp6)

          assign("detailed_results", results, envir = globalenv())

          all_correct <- all(sapply(results, function(x) x$correct))
          return(all_correct)
        },
        TRUE,
        comparator = function(generated, expected, ...) {

          results <- get("detailed_results", envir = globalenv())

          feedback <- c("**Resultaten per vraag:**\n")

          # Names displayed to user
          qnames <- c(
            vraag1 = "1. Hoeveel studenten drinken ‘dikwijls’?",
            vraag2 = "2. Hoeveel procent is dat?",
            vraag3 = "3. Hoeveel procent drinkt zelden of nooit?",
            vraag4 = "4. Welke proportie drinkt minstens ‘dikwijls’?",
            vraag5 = "5. Effect van missing data (1–4)?",
            vraag6 = "6. Hoeveel drinken hoogstens ‘af en toe’?"
          )

          # ================================================
          # LIST OF ALL LIKELY WRONG ANSWERS + EXPLANATIONS
          # ================================================
          
          wrong_msg_q1 <- function(val) {
            if (val == 55) return("Je gaf 55, maar dit is fout. Dat is ‘zeer vaak’. Het juiste antwoord is 10.")
            if (val == 255) return("Je gaf 255, maar dit is fout. Dat is de cumulatieve frequentie. Het juiste antwoord is 10.")
            if (abs(val - 3.23) < 0.01) return("Je gaf 3.23, maar dit is fout. Dat is het percentage, niet het aantal studenten. Het juiste antwoord is 10.")
            if (abs(val - 0.0323) < 0.001) return("Je gaf 0.0323, maar dit is fout. Dat is de proportie. Het juiste antwoord is 10.")
            return(paste0("Je gaf ", val, ", maar dit is fout. In de rij ‘dikwijls’ staat 10. Het juiste antwoord is 10."))
          }

          wrong_msg_q2 <- function(val) {
            if (abs(val - 0.0323) < 0.001) return("Je gaf 0.0323, maar dit is fout. Dat is de proportie. Het juiste antwoord is 3.23.")
            if (val == 10) return("Je gaf 10, maar dit is fout. Dat is de absolute frequentie. Het juiste antwoord is 3.23.")
            return(paste0("Je gaf ", val, ", maar dit is fout. Percentage = proportie × 100. Het juiste antwoord is 3.23."))
          }

          wrong_msg_q3 <- function(val) {
            if (abs(val - 61.29) < 0.1) return("Je gaf 61.29, maar dit is fout. Dat is alleen 'nooit'. Het juiste antwoord is 72.58.")
            if (abs(val - 11.29) < 0.1) return("Je gaf 11.29, maar dit is fout. Dat is alleen 'zelden'. Het juiste antwoord is 72.58.")
            return(paste0("Je gaf ", val, ", maar dit is fout. ‘Zelden of nooit’ = 11.29 + 61.29. Het juiste antwoord is 72.58."))
          }

          wrong_msg_q4 <- function(val) {
            if (abs(val - 0.0323) < 0.001) return("Je gaf 0.0323, maar dit is fout. Dat is alleen 'dikwijls'. Het juiste antwoord is 0.2097.")
            if (abs(val - 20.97) < 0.1) return("Je gaf 20.97, maar dit is fout. Dat is het percentage. Het juiste antwoord is 0.2097.")
            return(paste0("Je gaf ", val, ", maar dit is fout. 'Minstens dikwijls' = dikwijls + zeer vaak. Het juiste antwoord is 0.2097."))
          }

          wrong_msg_q5 <- function(val) {
            if (val == 1) return("Je gaf 1, maar dit is fout. N stijgt van 310 naar 360, proporties veranderen dus. Het juiste antwoord is 2.")
            if (val == 3) return("Je gaf 3, maar dit is fout. Proporties veranderen altijd als N verandert. Het juiste antwoord is 2.")
            if (val == 4) return("Je gaf 4, maar dit is fout. Proporties blijven niet gelijk als er 50 observaties bijkomen. Het juiste antwoord is 2.")
            return(paste0("Je gaf ", val, ", maar dit is fout. Proporties veranderen als N verandert. Het juiste antwoord is 2."))
          }

          wrong_msg_q6 <- function(val) {
            if (val == 20) return("Je gaf 20, maar dit is fout. Dat is alleen ‘af en toe’. Het juiste antwoord is 245.")
            if (val == 225) return("Je gaf 225, maar dit is fout. Dat is ‘nooit + zelden’. Je moet 'af en toe' nog toevoegen. Het juiste antwoord is 245.")
            return(paste0("Je gaf ", val, ", maar dit is fout. Cumulatief tot ‘af en toe’ is 245. Het juiste antwoord is 245."))
          }

          wrong_handlers <- list(
            vraag1 = wrong_msg_q1,
            vraag2 = wrong_msg_q2,
            vraag3 = wrong_msg_q3,
            vraag4 = wrong_msg_q4,
            vraag5 = wrong_msg_q5,
            vraag6 = wrong_msg_q6
          )

          # ================================================
          # Display Results
          # ================================================
          for (q in names(qnames)) {
            r <- results[[q]]
            label <- qnames[[q]]

            if (!r$exists) {
              feedback <- c(feedback, paste0("**", label, "**: Ontbreekt ❌"))
            } else if (r$correct) {
              feedback <- c(feedback, paste0("**", label, "**: ", r$value, " ✅"))
            } else {
              val <- suppressWarnings(as.numeric(r$value))
              msg <- wrong_handlers[[q]](val)
              feedback <- c(feedback, paste0("**", label, "**: ", msg, " ❌"))
            }
          }

          # SUCCESS MESSAGE
          if (generated == expected) {
            feedback <- c(feedback, "\n✅ **Alle antwoorden correct! Goed gedaan.**")
          }

          get_reporter()$add_message(paste(feedback, collapse = "\n\n"), type = "markdown")
          generated == expected
        }
      )
    }
  )
})
