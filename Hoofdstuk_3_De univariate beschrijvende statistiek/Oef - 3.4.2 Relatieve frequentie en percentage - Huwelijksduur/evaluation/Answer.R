context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          expected_values <- c(relatieve_frequentie_120 = 0.33, percentage_120 = 33.33)
          read_number <- function(name) {
            if (!exists(name, envir = env)) return(NA_real_)
            value <- suppressWarnings(as.numeric(get(name, envir = env)))
            if (length(value) != 1L || !is.finite(value)) return(NA_real_)
            value
          }
          values <- vapply(names(expected_values), read_number, numeric(1))
          valid <- all(is.finite(values))
          correct <- valid && all(abs(values - expected_values) <= 0.0005)
          assign("results_3_4_2", list(valid = valid, values = values), envir = globalenv())
          correct
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("results_3_4_2", envir = globalenv())
          values <- results$values
          if (isTRUE(generated == expected)) {
            message <- paste(
              "**Bevestiging:** je hebt de telling correct omgezet naar een relatieve frequentie en een percentage.",
              "**Denkregel:** relatieve frequentie = frequentie / totaal; percentage = relatieve frequentie × 100.",
              "**Transferstap:** controleer bij een nieuwe omzetting of je relatieve frequentie tussen 0 en 1 ligt.",
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
              if (abs(values[["relatieve_frequentie_120"]] - 33.33) < 0.005 && abs(values[["percentage_120"]] - 0.33) < 0.005) {
                likely <- "Je hebt de relatieve frequentie en het percentage verwisseld."
                why <- "De relatieve frequentie gebruikt de schaal 0–1; het percentage de schaal 0–100."
                next_step <- "Plaats eerst 2/6 als decimaal en vermenigvuldig die uitkomst vervolgens met 100."
              } else if (abs(values[["relatieve_frequentie_120"]] - 2) < 0.005 || abs(values[["percentage_120"]] - 2) < 0.005) {
                likely <- "Je hebt de absolute frequentie ingevuld zonder door het totaal te delen."
                why <- "Een relatieve frequentie vergelijkt de telling met alle zes waarnemingen."
                next_step <- "Deel de telling door zes en zet daarna om naar een percentage."
              } else if (abs(values[["relatieve_frequentie_120"]] - 0.33) < 0.005 &&
                         abs(values[["percentage_120"]] - 33) < 0.005) {
                likely <- "Je hebt de afgeronde relatieve frequentie als tussenwaarde gebruikt."
                why <- "Tussentijds afronden verandert het percentage; gebruik voor beide eindantwoorden de ongeronde breuk."
                next_step <- "Bereken het percentage rechtstreeks met 2/6 × 100 en rond pas die uitkomst af."
              } else if (abs(values[["relatieve_frequentie_120"]] - 0.33) < 0.005) {
                likely <- "De relatieve frequentie klopt, maar de percentageschaal niet."
                why <- "Een percentage is honderd keer de relatieve frequentie."
                next_step <- "Vermenigvuldig je relatieve frequentie met 100 en rond af op twee decimalen."
              }
            }
            message <- paste(
              paste0("**Waarschijnlijke redenering:** ", likely),
              paste0("**Waarom dit niet klopt:** ", why),
              "**Denkregel:** relatieve frequentie = frequentie / totaal; percentage = relatieve frequentie × 100.",
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
