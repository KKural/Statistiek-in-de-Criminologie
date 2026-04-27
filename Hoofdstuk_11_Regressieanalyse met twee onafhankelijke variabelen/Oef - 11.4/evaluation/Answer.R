context({
  testcase("Ligging van punt P t.o.v. de regressielijn", {
    testEqual("",
      function(env) {
        results <- list()

        exp_punt_positie <- 3L

        parse_num <- function(val) suppressWarnings(as.numeric(val))

        check_numeric <- function(varname, expected, tolerance = 0) {
          if (!exists(varname, envir = env))
            return(list(exists = FALSE, value = NA, value_num = NA, correct = FALSE, expected = expected))
          raw <- get(varname, envir = env)
          num <- parse_num(raw)
          ok  <- !is.na(num) && abs(num - expected) <= tolerance
          list(exists = TRUE, value = raw, value_num = num, correct = ok, expected = expected)
        }

        results$punt_positie <- check_numeric("punt_positie", exp_punt_positie, tolerance = 0)

        assign("detailed_results", results, envir = globalenv())
        all(sapply(results, function(r) isTRUE(r$correct)))
      },
      TRUE,
      comparator = function(generated, expected, ...) {
        results <- get("detailed_results", envir = globalenv())

        qnames <- c(punt_positie = "Ligging van punt P (code 1=boven, 2=op, 3=onder)")

        lbl_map <- c("1" = "boven de lijn", "2" = "op de lijn", "3" = "onder de lijn")

        parse_num <- function(val) suppressWarnings(as.numeric(val))

        wrong_msg_punt_positie <- function(val) {
          num <- parse_num(val)
          if (!is.na(num) && round(num) == 1) return(paste0(
            "**Waarom dit fout is:** Code 1 betekent 'boven de lijn', maar bij x = 8 voorspelt de regressielijn **Ŷ ≈ 18,3** — en P heeft y = 16, wat *lager* is dan 18,3.\n\n",
            "**Wat je miste:** Bij 'boven de lijn' geldt Y > Ŷ (positief residu). Hier is Y (16) < Ŷ (18,3), dus het residu is negatief.\n\n",
            "**Correctie:** P ligt **onder** de lijn → code **3**. Residu = 16 − 18,3 = −2,3 < 0."
          ))
          if (!is.na(num) && round(num) == 2) return(paste0(
            "**Waarom dit fout is:** Code 2 betekent 'op de lijn' (residu = 0). Punt P heeft y = 16, maar de lijn geeft op x = 8 een voorspelde waarde van **18,3**.\n\n",
            "**Wat je miste:** 16 ≠ 18,3, dus P ligt niet exact op de lijn.\n\n",
            "**Correctie:** Residu = 16 − 18,3 = −2,3 ≠ 0 → P ligt **onder** de lijn (code **3**)."
          ))
          paste0(
            "**Je antwoord \"", val, "\" is niet correct.**\n\n",
            "**Stap-voor-stap aanpak:**\n",
            "1. Lees op de regressielijn de voorspelde Y af bij x = 8: **Ŷ ≈ 18,3**\n",
            "2. Vergelijk met de werkelijke y van P: **y = 16**\n",
            "3. Residu = y − Ŷ = 16 − 18,3 = **−2,3** (negatief → P ligt *onder* de lijn)\n",
            "4. Correcte code: **3** (onder de lijn)"
          )
        }

        feedback_text <- ""

        q <- "punt_positie"
        r <- results[[q]]
        if (!r$exists) {
          feedback_text <- paste0(feedback_text,
            "❌ **", qnames[[q]], "** — **Je hebt geen antwoord ingevoerd.**\n\n",
            "Wijs code 1, 2 of 3 toe aan `punt_positie`, bijv. `punt_positie <- 1`\n\n"
          )
        } else if (r$correct) {
          feedback_text <- paste0(feedback_text,
            "✅ **", qnames[[q]], "** — **Correct! (code 3: onder de lijn)**\n\n",
            "**Uitleg:** Bij x = 8 voorspelt de regressielijn **Ŷ ≈ 18,3**. Punt P heeft y = 16, dus residu = 16 − 18,3 = **−2,3** (negatief). P ligt onder de lijn.\n\n",
            "**Let op de visuele val:** P lijkt 'in lijn' te liggen met de buurpunten (6,21) en (10,16), maar de regressielijn daalt op x = 8 al naar 18,3 — P zit 2,3 eenheden daáronder.\n\n"
          )
        } else {
          num_val <- parse_num(r$value)
          student_lbl <- if (!is.na(num_val) && as.character(round(num_val)) %in% names(lbl_map))
            lbl_map[[as.character(round(num_val))]] else paste0("ongeldig (", r$value, ")")
          msg <- wrong_msg_punt_positie(r$value)
          feedback_text <- paste0(feedback_text,
            "❌ **", qnames[[q]], "** — **Fout. Antwoord: `", r$value, "` (", student_lbl, "). Correct: code `3` (onder de lijn)**\n\n",
            msg, "\n\n"
          )
        }

        get_reporter()$add_message(feedback_text, type = "markdown")
        generated == expected
      }
    )
  })
})
