context({
  testcase("", {
    testEqual("", function(env) {
      expected_values <- c(exogene_variabelen = 1, endogene_uitkomst = 2, intermediaire_variabelen = 3)
      read_number <- function(name) {
        if (!exists(name, envir = env)) return(NA_real_)
        value <- suppressWarnings(as.numeric(get(name, envir = env)))
        if (length(value) != 1L || !is.finite(value)) return(NA_real_)
        value
      }
      values <- vapply(names(expected_values), read_number, numeric(1))
      valid <- all(is.finite(values))
      correct <- valid && all(abs(values - expected_values) <= 0.0005)
      assign("results_12_1_combined", list(values = values, expected = expected_values, valid = valid), envir = globalenv())
      correct
    }, TRUE, comparator = function(generated, expected, ...) {
      results <- get("results_12_1_combined", envir = globalenv())
      if (isTRUE(generated == expected)) {
        message <- paste(
          "**Bevestiging:** de empathiedimensies zijn exogeen, moreel oordeel is de uiteindelijke endogene uitkomst en de intuïties en emoties zijn intermediair.",
          "**Denkregel:** pijlen vertrekken vanuit exogene variabelen; intermediaire variabelen ontvangen én verzenden pijlen; de uiteindelijke uitkomst ontvangt de laatste pijlen.",
          "**Transferstap:** volg in een nieuw padmodel de richting van de pijlen voordat je inhoudelijke namen gebruikt.",
          sep = "\n\n"
        )
      } else if (!results$valid) {
        missing_fields <- names(results$expected)[!is.finite(results$values)]
        message <- paste(
          paste0("**Waarschijnlijke redenering:** de volgende antwoordcodes ontbreken of zijn niet numeriek: ", paste(missing_fields, collapse = ", "), "."),
          "**Waarom dit niet klopt:** iedere variabelenrol moet afzonderlijk aan een aangeboden antwoordcode worden gekoppeld.",
          "**Denkregel:** gebruik precies één code per lege plaats en baseer de rol op inkomende en uitgaande pijlen.",
          "**Volgende stap:** vul alle drie velden in en controleer daarna de pijlrichting per variabelengroep.",
          sep = "\n\n"
        )
      } else {
        wrong_field <- names(which(abs(results$values - results$expected) > 0.0005))[[1L]]
        likely <- switch(wrong_field,
          exogene_variabelen = "Je hebt waarschijnlijk variabelen met inkomende pijlen gekozen in plaats van de startvariabelen van het model.",
          endogene_uitkomst = "Je hebt waarschijnlijk een intermediaire variabele gekozen in plaats van het eindpunt van de paden.",
          intermediaire_variabelen = "Je hebt waarschijnlijk alleen de emoties geselecteerd en de morele intuïties met inkomende én uitgaande pijlen gemist.",
          "Je hebt twee variabelenrollen verwisseld."
        )
        why <- switch(wrong_field,
          exogene_variabelen = "Empathische bezorgdheid en perspectiefneming ontvangen in dit model geen pijlen en horen bij code 1.",
          endogene_uitkomst = "Moreel oordeel is het uiteindelijke knooppunt waarop de verklarende routes uitkomen en hoort bij code 2.",
          intermediaire_variabelen = "De intuïties, schuld en boosheid liggen tussen empathie en het uiteindelijke oordeel en horen samen bij code 3.",
          "De gekozen code past niet bij de pijlstructuur."
        )
        next_step <- switch(wrong_field,
          exogene_variabelen = "Zoek de knooppunten zonder inkomende enkelvoudige pijlen.",
          endogene_uitkomst = "Volg alle routes tot het laatste knooppunt.",
          intermediaire_variabelen = "Markeer alle knooppunten die zowel een inkomende als een uitgaande pijl hebben.",
          "Teken de pijlrichting per knooppunt opnieuw."
        )
        message <- paste(
          paste0("**Waarschijnlijke redenering:** ", likely),
          paste0("**Waarom dit niet klopt:** ", why),
          "**Denkregel:** variabelenrollen worden door de positie in het padmodel bepaald, niet alleen door de inhoudelijke naam.",
          paste0("**Volgende stap:** ", next_step),
          sep = "\n\n"
        )
      }
      get_reporter()$add_message(message, type = "markdown")
      generated == expected
    })
  })
})
