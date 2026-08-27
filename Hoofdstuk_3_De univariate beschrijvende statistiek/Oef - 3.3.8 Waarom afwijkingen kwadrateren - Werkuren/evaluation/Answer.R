context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          expected_values <- c(reden_kwadrateren = 2)
          read_number <- function(name) {
            if (!exists(name, envir = env)) return(NA_real_)
            value <- suppressWarnings(as.numeric(get(name, envir = env)))
            if (length(value) != 1L || !is.finite(value)) return(NA_real_)
            value
          }
          values <- vapply(names(expected_values), read_number, numeric(1))
          valid <- all(is.finite(values))
          correct <- valid && all(abs(values - expected_values) <= 0.0000001)
          assign("results_3_3_8", list(valid = valid, values = values), envir = globalenv())
          correct
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("results_3_3_8", envir = globalenv())
          values <- results$values
          if (isTRUE(generated == expected)) {
            message <- paste(
              "**Bevestiging:** je begrijpt waarom gekwadrateerde afwijkingen niet tegen elkaar wegvallen.",
              "**Denkregel:** positieve en negatieve afwijkingen kunnen optellen tot nul; kwadraten maken beide bijdragen positief.",
              "**Transferstap:** gebruik dit idee om uit te leggen waarom variantie spreiding meet en niet de richting van verschillen.",
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
              if (values[["reden_kwadrateren"]] == 1) {
                likely <- "Je denkt dat kwadrateren waarden altijd kleiner maakt."
                why <- "Kwadrateren kan waarden juist groter maken en is niet bedoeld als schaalverkleining."
                next_step <- "Kijk naar wat er gebeurt met een negatieve en een positieve afwijking wanneer je beide kwadrateert."
              } else if (values[["reden_kwadrateren"]] == 3) {
                likely <- "Je verwart de nul-som van gewone afwijkingen met het doel van kwadrateren."
                why <- "Het gemiddelde wordt niet door deze stap veranderd; de afwijkingen worden bewerkt."
                next_step <- "Vergelijk de som van -2 en +2 met de som van hun kwadraten."
              } else if (values[["reden_kwadrateren"]] == 4) {
                likely <- "Je koppelt de rekenbewerking aan een verandering van meetniveau."
                why <- "Kwadrateren verandert het meetniveau van de oorspronkelijke variabele niet."
                next_step <- "Zoek de optie die verklaart wat er met tegengestelde tekens gebeurt."
              } else {
                likely <- "Je invoer verwijst niet naar één van de vier aangeboden verklaringen."
                why <- "Deze vraag verwacht een optienummer van 1 tot en met 4."
                next_step <- "Kies één geldig optienummer."
              }
            }
            message <- paste(
              paste0("**Waarschijnlijke redenering:** ", likely),
              paste0("**Waarom dit niet klopt:** ", why),
              "**Denkregel:** positieve en negatieve afwijkingen kunnen optellen tot nul; kwadraten maken beide bijdragen positief.",
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
