context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          expected <- c(
            vraag1 = 2,
            vraag2 = 3,
            vraag3 = 2,
            vraag4 = 2,
            vraag5 = 2,
            vraag6 = 1,
            vraag7 = 1,
            vraag8 = 1,
            vraag9 = 1,
            vraag10 = 1,
            vraag11 = 2,
            vraag12 = 2,
            vraag13 = 3,
            vraag14 = 3
          )

          parse_num <- function(x) {
            if (is.character(x)) {
              x <- trimws(x)
              if (grepl("^[A-Da-d]$", x)) return(match(toupper(x), c("A", "B", "C", "D")))
              x <- gsub(",", ".", x, fixed = TRUE)
            }
            suppressWarnings(as.numeric(x))
          }

          res <- lapply(names(expected), function(q) {
            if (!exists(q, envir = env)) return(list(q = q, ok = FALSE, val = NA, reason = "missing"))
            raw <- get(q, envir = env)
            num <- parse_num(raw)
            ok <- !is.na(num) && abs(num - expected[[q]]) < 0.5
            list(q = q, ok = ok, val = raw, expected = expected[[q]], reason = if (ok) "ok" else "wrong")
          })
          names(res) <- names(expected)
          assign("mcq_results", res, envir = globalenv())

          all(vapply(res, function(x) isTRUE(x$ok), logical(1)))
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          res <- get("mcq_results", envir = globalenv())
          labels <- c(
            vraag1 = "Verschil voorspelde waarde en residu",
            vraag2 = "Betekenis van CI dat 0 bevat",
            vraag3 = "Betekenis van niet-significante coëfficiënt",
            vraag4 = "Nut van niet-significante predictor",
            vraag5 = "Waarom coëfficiënten veranderen",
            vraag6 = "Bivariaat vs multivariaat significantie",
            vraag7 = "Adjusted R² vs R²",
            vraag8 = "Concept multicollineariteit",
            vraag9 = "Concept ΔR²",
            vraag10 = "Ceteris paribus interpretatie van b",
            vraag11 = "95%-CI van b2 volledig positief",
            vraag12 = "Sterkste relatieve effect: welke parameter?",
            vraag13 = "Vrijheidsgraden foutterm (df residual)",
            vraag14 = "b positief maar bivariate correlatie negatief"
          )

          lines <- character(0)
          score <- 0
          total <- length(res)

          for (q in names(res)) {
            r <- res[[q]]
            if (isTRUE(r$ok)) {
              lines <- c(lines, paste0("✅ **", labels[[q]], "**: correct (", r$expected, ")"))
              score <- score + 1
            } else if (identical(r$reason, "missing")) {
              lines <- c(lines, paste0("❌ **", labels[[q]], "**: variabele `", q, "` ontbreekt."))
            } else {
              lines <- c(lines, paste0("❌ **", labels[[q]], "**: jouw antwoord `", as.character(r$val), "`, verwacht `", r$expected, "`."))
            }
          }

          lines <- c(lines, paste0("\n**Score: ", score, " / ", total, "**"))
          get_reporter()$add_message(paste(lines, collapse = "\n"), type = "markdown")

          generated == expected
        }
      )
    }
  )
})
