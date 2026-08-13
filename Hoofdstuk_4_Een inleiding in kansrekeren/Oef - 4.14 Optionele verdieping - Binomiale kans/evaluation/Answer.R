context({
  testcase(
    "Optionele binomiale verdieping: exact twee van vijf",
    {
      testEqual(
        "",
        function(env) {
          present <- exists("p_exact_twee", envir = env, inherits = FALSE)
          value <- if (present) suppressWarnings(as.numeric(get("p_exact_twee", envir = env))) else NA_real_
          value <- if (length(value) == 1L) value else NA_real_
          result <- list(
            present = present,
            value = value,
            correct = present && is.finite(value) && abs(value - 0.3087) <= 0.00005
          )
          assign("chapter4_14_result", result, envir = globalenv())
          isTRUE(result$correct)
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          result <- get("chapter4_14_result", envir = globalenv())
          value <- result$value
          near <- function(target, tolerance = 0.0002) is.finite(value) && abs(value - target) <= tolerance
          read_more <- "<a href='https://openstax.org/books/introductory-statistics-2e/pages/4-3-binomial-distribution' target='_blank' rel='noopener noreferrer'>Lees meer over de binomiale verdeling</a>"

          if (isTRUE(generated == expected)) {
            message <- paste0(
              "**Bevestiging:** `p_exact_twee = 0.3087` is correct.\n\n",
              "**Waarom dit klopt:** één specifieke volgorde met twee recidivisten heeft kans `0.30² × 0.70³`; er zijn `C(5,2)=10` mogelijke posities voor die twee recidivisten.\n\n",
              "**Denkregel:** voor exact `k` successen in `n` onafhankelijke proeven met constante kans `p` gebruik je `C(n,k)p^k(1-p)^(n-k)`.\n\n",
              "**Transferstap:** bereken binnen hetzelfde model de kans op exact nul recidivisten en benoem welke factor in de formule dan gelijk is aan 1.\n\n",
              read_more
            )
          } else {
            if (!result$present || !is.finite(value)) {
              diagnosis <- paste(
                "**Controleer je invoer:** `p_exact_twee` ontbreekt of bevat niet precies één eindig getal.",
                "**Waarom dit niet klopt:** het veld moet één decimale kans voor exact twee recidivisten bevatten.",
                sep = "\n\n"
              )
            } else if (near(0.03087)) {
              diagnosis <- paste(
                "**Waarschijnlijke redenering:** deze waarde is consistent met de kans op één specifieke volgorde van twee recidivisten en drie niet-recidivisten. Dezelfde waarde kan ook anders ontstaan.",
                "**Waarom dit niet klopt:** ‘exact twee’ legt niet vast welke twee personen recidiveren; vermenigvuldig daarom ook met `C(5,2)=10`.",
                sep = "\n\n"
              )
            } else if (near(0.09)) {
              diagnosis <- paste(
                "**Waarschijnlijke redenering:** deze waarde past bij alleen `0.30²`. Dezelfde waarde kan ook anders ontstaan.",
                "**Waarom dit niet klopt:** naast twee recidivisten moeten ook drie niet-recidivisten voorkomen, en de mogelijke posities van de twee recidivisten moeten worden geteld.",
                sep = "\n\n"
              )
            } else if (near(0.4718)) {
              diagnosis <- paste(
                "**Waarschijnlijke redenering:** deze waarde is consistent met de kans op minstens twee recidivisten. Dezelfde waarde kan ook anders ontstaan.",
                "**Waarom dit niet klopt:** gevraagd is `X=2`, niet `X≥2`; kansen voor drie, vier en vijf recidivisten mogen niet worden toegevoegd.",
                sep = "\n\n"
              )
            } else if (near(0.8369)) {
              diagnosis <- paste(
                "**Waarschijnlijke redenering:** deze waarde is consistent met de cumulatieve kans op hoogstens twee recidivisten. Dezelfde waarde kan ook anders ontstaan.",
                "**Waarom dit niet klopt:** ‘exact twee’ bevat alleen de term voor `X=2`, niet de termen voor nul en één recidivist.",
                sep = "\n\n"
              )
            } else if (near(30.87, 0.01)) {
              diagnosis <- paste(
                "**Waarschijnlijke redenering:** 30.87 is het correcte percentage, maar niet de gevraagde proportie. Dezelfde waarde kan ook anders ontstaan.",
                "**Waarom dit niet klopt:** 30.87% moet als `0.3087` worden ingevoerd.",
                sep = "\n\n"
              )
            } else {
              diagnosis <- paste(
                "**Waarschijnlijke redenering:** uit deze eindwaarde is de precieze denkstap niet zeker; mogelijk ontbreekt de combinatiecoëfficiënt of is ‘exact’ als cumulatieve kans gelezen.",
                "**Waarom dit niet klopt:** `C(5,2) × 0.30² × 0.70³ = 0.3087`.",
                sep = "\n\n"
              )
            }

            message <- paste(
              diagnosis,
              "**Denkregel:** controleer vóór de berekening vier voorwaarden: vast `n`, twee uitkomsten, constante `p` en onafhankelijke proeven; gebruik daarna één binomiale term voor ‘exact k’.",
              "**Volgende stap:** bereken afzonderlijk `C(5,2)=10`, `0.30²=0.09` en `0.70³=0.343`, en vermenigvuldig deze drie factoren.",
              read_more,
              sep = "\n\n"
            )
          }

          get_reporter()$add_message(message, type = "markdown")
          generated == expected
        }
      )
    }
  )
})
