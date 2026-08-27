context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          expected_values <- c(proportie_32 = 0.375, percentage_32 = 37.5)
          read_number <- function(name) {
            if (!exists(name, envir = env)) return(NA_real_)
            value <- suppressWarnings(as.numeric(get(name, envir = env)))
            if (length(value) != 1L || !is.finite(value)) return(NA_real_)
            value
          }
          values <- vapply(names(expected_values), read_number, numeric(1))
          valid <- all(is.finite(values))
          correct <- valid && all(abs(values - expected_values) <= 0.0005)
          assign("results_3_3_2", list(valid = valid, values = values), envir = globalenv())
          correct
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("results_3_3_2", envir = globalenv())
          values <- results$values
          if (isTRUE(generated == expected)) {
            message <- paste(
              "**Bevestiging:** de absolute frequentie is correct omgezet naar zowel een proportie als een percentage.",
              "**Denkregel:** proportie = frequentie / totaal; percentage = proportie × 100.",
              "**Transferstap:** pas dezelfde twee omzettingen toe op een categorie met een andere frequentie.",
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
              if (abs(values[["proportie_32"]] - 37.5) < 0.0005 && abs(values[["percentage_32"]] - 0.375) < 0.0005) {
                likely <- "Je hebt de proportie en het percentage verwisseld."
                why <- "Een proportie ligt tussen 0 en 1; een percentage gebruikt de schaal van 0 tot 100."
                next_step <- "Zet eerst frequentie/totaal bij de proportie en vermenigvuldig die uitkomst daarna met 100."
              } else if (abs(values[["proportie_32"]] - 3) < 0.0005 || abs(values[["percentage_32"]] - 3) < 0.0005) {
                likely <- "Je hebt de absolute frequentie laten staan."
                why <- "Een telling wordt pas relatief nadat je door het totale aantal waarnemingen deelt."
                next_step <- "Deel de gegeven frequentie eerst door acht en zet die proportie vervolgens om naar procenten."
              } else if (abs(values[["proportie_32"]] - 0.375) < 0.0005) {
                likely <- "De proportie klopt, maar de omzetting naar procenten niet."
                why <- "Een percentage is honderdmaal de proportie."
                next_step <- "Vermenigvuldig je proportie met 100 en gebruik geen procentteken in het invoerveld."
              }
            }
            message <- paste(
              paste0("**Waarschijnlijke redenering:** ", likely),
              paste0("**Waarom dit niet klopt:** ", why),
              "**Denkregel:** proportie = frequentie / totaal; percentage = proportie × 100.",
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
