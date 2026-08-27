context({
  testcase("", {
    testEqual("", function(env) {
      expected_values <- c(padcoefficient_ind_schuld = 0.18, aantal_indirecte_paden = 3, totaal_effect = 0.4264)
      read_number <- function(name) {
        if (!exists(name, envir = env)) return(NA_real_)
        value <- suppressWarnings(as.numeric(get(name, envir = env)))
        if (length(value) != 1L || !is.finite(value)) return(NA_real_)
        value
      }
      values <- vapply(names(expected_values), read_number, numeric(1))
      valid <- all(is.finite(values))
      correct <- valid && all(abs(values - expected_values) <= 0.0005)
      assign("results_12_4_combined", list(values = values, expected = expected_values, valid = valid), envir = globalenv())
      correct
    }, TRUE, comparator = function(generated, expected, ...) {
      results <- get("results_12_4_combined", envir = globalenv())
      if (isTRUE(generated == expected)) {
        message <- paste(
          "**Bevestiging:** de afgelezen padcoëfficiënt is 0.18, er zijn drie volledige indirecte paden en het totale effect is 0.4264.",
          "**Denkregel:** vermenigvuldig coëfficiënten binnen ieder volledig indirect pad en tel de padproducten daarna op bij het directe effect.",
          "**Transferstap:** schrijf bij een nieuw model eerst alle volledige routes symbolisch uit voordat je waarden invult.",
          sep = "\n\n"
        )
      } else if (!results$valid) {
        missing_fields <- names(results$expected)[!is.finite(results$values)]
        message <- paste(
          paste0("**Waarschijnlijke redenering:** de volgende antwoorden ontbreken of zijn geen enkel eindig getal: ", paste(missing_fields, collapse = ", "), "."),
          "**Waarom dit niet klopt:** de evaluator verwacht een afgelezen coëfficiënt, een aantal paden en een berekend totaal effect.",
          "**Denkregel:** vul alleen numerieke eindresultaten in en gebruik één waarde per lege plaats.",
          "**Volgende stap:** vul alle drie velden in en controleer daarna de vier decimalen van het totale effect.",
          sep = "\n\n"
        )
      } else {
        wrong_field <- names(which(abs(results$values - results$expected) > 0.0005))[[1L]]
        likely <- switch(wrong_field,
          padcoefficient_ind_schuld = "Je hebt waarschijnlijk een nabijgelegen coëfficiënt afgelezen in plaats van de gerichte verbinding tussen de twee genoemde knooppunten.",
          aantal_indirecte_paden = "Je hebt waarschijnlijk alleen de twee langere routes via de morele intuïties geteld en de kortere route via geanticipeerde schuld gemist.",
          totaal_effect = "Je hebt waarschijnlijk het directe en indirecte effect opgeteld zonder de coëfficiënten binnen het indirecte pad eerst te vermenigvuldigen.",
          "Je hebt een padgrootheid verwisseld."
        )
        why <- switch(wrong_field,
          padcoefficient_ind_schuld = "De gerichte pijl van individualiserende intuïties naar geanticipeerde schuld draagt de padcoëfficiënt 0.18.",
          aantal_indirecte_paden = "Er zijn drie routes: via individualiserende intuïties en schuld, via groepsgerichte intuïties en boosheid, en rechtstreeks via schuld.",
          totaal_effect = "Het indirecte effect is 0.48 × 0.18 = 0.0864; 0.34 + 0.0864 = 0.4264.",
          "Het antwoord volgt niet uit de gevraagde route."
        )
        next_step <- switch(wrong_field,
          padcoefficient_ind_schuld = "Volg alleen de gerichte pijl tussen de twee volledig genoemde variabelen en lees het label af.",
          aantal_indirecte_paden = "Schrijf de drie routes afzonderlijk uit en controleer dat elke route bij perspectiefneming start en bij moreel oordeel eindigt.",
          totaal_effect = "Bereken eerst 0.48 × 0.18 en tel het resultaat daarna bij 0.34.",
          "Markeer eerst startpunt, eindpunt en volledige route."
        )
        message <- paste(
          paste0("**Waarschijnlijke redenering:** ", likely),
          paste0("**Waarom dit niet klopt:** ", why),
          "**Denkregel:** coëfficiënten worden binnen een pad vermenigvuldigd en tussen verschillende paden opgeteld.",
          paste0("**Volgende stap:** ", next_step),
          sep = "\n\n"
        )
      }
      get_reporter()$add_message(message, type = "markdown")
      generated == expected
    })
  })
})
