context({
  testcase("R\u00b2 omzetten naar een percentage", {
    testEqual("",
      function(env) {
        results <- list()

        exp_r2_pct  <- 87
        tol_r2_pct  <- 1

        parse_num <- function(val) suppressWarnings(as.numeric(val))

        check_numeric <- function(varname, expected, tolerance = 0.01) {
          if (!exists(varname, envir = env))
            return(list(exists = FALSE, value = NA, value_num = NA, correct = FALSE, expected = expected, tolerance = tolerance))
          raw <- get(varname, envir = env)
          num <- parse_num(raw)
          ok  <- !is.na(num) && abs(num - expected) <= tolerance
          list(exists = TRUE, value = raw, value_num = num, correct = ok, expected = expected, tolerance = tolerance)
        }

        results$r_kwadraat_pct <- check_numeric("r_kwadraat_pct", exp_r2_pct, tolerance = tol_r2_pct)

        assign("detailed_results", results, envir = globalenv())
        all(sapply(results, function(r) isTRUE(r$correct)))
      },
      TRUE,
      comparator = function(generated, expected, ...) {
        results <- get("detailed_results", envir = globalenv())

        qnames <- c(r_kwadraat_pct = "R\u00b2 als percentage (geheel getal, tolerantie \u00b11)")

        parse_num <- function(val) suppressWarnings(as.numeric(val))

        wrong_msg_r_kwadraat_pct <- function(val) {
          num <- parse_num(val)
          if (!is.na(num) && abs(num - 86) <= 1) return(paste0(
            "**Waarom dit fout is:** 86% komt overeen met de **gecorrigeerde R\u00b2** (Adjusted R\u00b2 = 0,856 \u00d7 100 \u2248 86%).\n\n",
            "**Wat je miste:** De gecorrigeerde R\u00b2 corrigeert voor het aantal predictoren in het model. Hier is de gewone R\u00b2 gevraagd.\n\n",
            "**Correctie:** Gebruik de kolom **R\u00b2** (niet 'Gecorrigeerde R\u00b2'): R\u00b2 = **0,872** \u00d7 100 = **87%**."
          ))
          if (!is.na(num) && abs(num - 93) <= 2) return(paste0(
            "**Waarom dit fout is:** Een waarde rond 93% stemt overeen met R = 0,934 \u00d7 100 \u2248 93% — dit is de **correlatiecoëfficiënt R**, niet R\u00b2.\n\n",
            "**Wat je miste:** R en R\u00b2 zijn twee verschillende grootheden. R\u00b2 is het kwadraat van R.\n\n",
            "**Correctie:** R\u00b2 = (0,934)\u00b2 = **0,872** \u00d7 100 = **87%**."
          ))
          if (!is.na(num) && abs(num - 0.872) < 0.01) return(paste0(
            "**Waarom dit fout is:** Je gaf de decimale waarde 0,872 in plaats van het percentage.\n\n",
            "**Correctie:** De vraag vraagt een geheel getal in procent: 0,872 \u00d7 100 = **87**."
          ))
          paste0(
            "**Je antwoord ", val, " is niet correct.**\n\n",
            "**Stap-voor-stap:**\n",
            "1. Open de **Modelsamenvatting** in de SPSS-output\n",
            "2. Lees de kolom **R\u00b2** (NIET de gecorrigeerde R\u00b2): **0,872**\n",
            "3. Vermenigvuldig met 100: 0,872 \u00d7 100 = 87,2 \u2248 **87%**"
          )
        }

        feedback_text <- ""

        q <- "r_kwadraat_pct"
        r <- results[[q]]
        if (!r$exists) {
          feedback_text <- paste0(feedback_text,
            "\u274c **", qnames[[q]], "** — **Je hebt geen antwoord ingevoerd.**\n\n",
            "Wijs een geheel getal toe aan `r_kwadraat_pct`, bijv. `r_kwadraat_pct <- 85`\n\n"
          )
        } else if (r$correct) {
          feedback_text <- paste0(feedback_text,
            "\u2705 **", qnames[[q]], "** — **Correct! (", r$value, "%)**\n\n",
            "R\u00b2 = 0,872 uit de Modelsamenvatting \u00d7 100 = **87,2% \u2248 87%**.\n\n",
            "Dit betekent dat **87%** van de variantie in de responsvariabele wordt verklaard door het model.\n\n",
            "**Let op:** de gecorrigeerde R\u00b2 (0,856 \u2192 86%) is een andere maatstaf die corrigeert voor het aantal predictoren — hier niet gevraagd.\n\n"
          )
        } else {
          msg <- wrong_msg_r_kwadraat_pct(r$value)
          feedback_text <- paste0(feedback_text,
            "\u274c **", qnames[[q]], "** — **Fout. Antwoord: `", r$value, "`. Correct: `87`**\n\n",
            msg, "\n\n"
          )
        }

        get_reporter()$add_message(feedback_text, type = "markdown")
        generated == expected
      }
    )
  })
})
