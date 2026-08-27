context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          expected_values <- c(cumulatieve_frequentie_90 = 4, cumulatief_percentage_90 = 66.67)
          read_number <- function(name) {
            if (!exists(name, envir = env)) return(NA_real_)
            value <- suppressWarnings(as.numeric(get(name, envir = env)))
            if (length(value) != 1L || !is.finite(value)) return(NA_real_)
            value
          }
          values <- vapply(names(expected_values), read_number, numeric(1))
          valid <- all(is.finite(values))
          correct <- valid && all(abs(values - expected_values) <= 0.0005)
          assign("results_3_4_3", list(valid = valid, values = values), envir = globalenv())
          correct
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("results_3_4_3", envir = globalenv())
          values <- results$values
          if (isTRUE(generated == expected)) {
            message <- paste(
              "**Bevestiging:** je hebt de frequenties tot en met 90 dagen correct gecumuleerd en omgezet naar een percentage.",
              "**Denkregel:** cumulatief tot en met een grens betekent alle frequenties bij die grens én bij lagere waarden optellen.",
              "**Transferstap:** lees bij elke cumulatieve vraag eerst zorgvuldig of de grenswaarde wel of niet wordt meegeteld.",
              sep = "\n\n"
            )
          } else {
            if (!results$valid) {
              likely <- "Minstens één antwoord ontbreekt, bevat tekst of is niet één eindig getal."
              why <- "Elke lege plaats moet met precies één berekend getal worden ingevuld."
              next_step <- "Controleer alle invoervelden en vul uitsluitend de gevraagde eindwaarden in."
            } else {
              likely <- "Je hebt een verwante grootheid of tussenstap ingevuld."
              why <- "De ingevulde waarde beantwoordt niet precies de gevraagde statistische vraag."
              next_step <- "Lees de gevraagde bewerking opnieuw en voer alleen die stap uit."
              if (abs(values[["cumulatieve_frequentie_90"]] - 1) < 0.0005) {
                likely <- "Je hebt alleen de gewone frequentie van 90 dagen genomen."
                why <- "Cumulatief vraagt om de som van alle categorieën tot en met de grens."
                next_step <- "Tel de frequenties bij 30, 60 en 90 dagen samen."
              } else if (abs(values[["cumulatieve_frequentie_90"]] - 3) < 0.0005) {
                likely <- "Je hebt waarden onder 90 geteld maar de grenswaarde zelf weggelaten."
                why <- "‘Maximaal 90’ en ‘tot en met 90’ omvatten ook 90 dagen."
                next_step <- "Voeg de frequentie van de grenscategorie toe aan je cumulatieve telling."
              } else if (abs(values[["cumulatief_percentage_90"]] - 0.6667) < 0.005) {
                likely <- "Je hebt de cumulatieve proportie ingevuld in plaats van het percentage."
                why <- "Het gevraagde percentage gebruikt de schaal 0–100."
                next_step <- "Vermenigvuldig de cumulatieve proportie met 100."
              } else if (abs(values[["cumulatieve_frequentie_90"]] - 4) < 0.0005 &&
                         abs(values[["cumulatief_percentage_90"]] - 67) < 0.005) {
                likely <- "Je hebt een afgeronde proportie als tussenwaarde gebruikt."
                why <- "Tussentijds afronden verandert het cumulatieve percentage."
                next_step <- "Bereken 4/6 × 100 in één stap en rond pas het eindpercentage af."
              } else if (abs(values[["cumulatieve_frequentie_90"]] - 4) < 0.0005) {
                likely <- "De cumulatieve telling klopt, maar de omzetting naar een percentage niet."
                why <- "Het percentage vergelijkt de cumulatieve telling met alle zes waarnemingen."
                next_step <- "Deel je cumulatieve telling door zes en vermenigvuldig met 100."
              }
            }
            message <- paste(
              paste0("**Waarschijnlijke redenering:** ", likely),
              paste0("**Waarom dit niet klopt:** ", why),
              "**Denkregel:** cumulatief tot en met een grens betekent alle frequenties bij die grens én bij lagere waarden optellen.",
              paste0("**Volgende stap:** ", next_step),
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
