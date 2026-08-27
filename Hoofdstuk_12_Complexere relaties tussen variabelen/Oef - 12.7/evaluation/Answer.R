context({
  testcase("", {
    testEqual("", function(env) {
      expected_values <- c(r2_groepsgericht_pct = 2, onverklaard_pct = 57, interpretatie_onverklaard = 2)
      read_number <- function(name) {
        if (!exists(name, envir = env)) return(NA_real_)
        value <- suppressWarnings(as.numeric(get(name, envir = env)))
        if (length(value) != 1L || !is.finite(value)) return(NA_real_)
        value
      }
      values <- vapply(names(expected_values), read_number, numeric(1))
      valid <- all(is.finite(values))
      correct <- valid && all(abs(values - expected_values) <= 0.0005)
      assign("results_12_7_combined", list(values = values, expected = expected_values, valid = valid), envir = globalenv())
      correct
    }, TRUE, comparator = function(generated, expected, ...) {
      results <- get("results_12_7_combined", envir = globalenv())
      if (isTRUE(generated == expected)) {
        message <- paste(
          "**Bevestiging:** het groepsgerichte R² is 2%, bij R² = 43% blijft 57% onverklaard en die rest laat ruimte voor niet-gemeten factoren.",
          "**Denkregel:** R² hoort bij één specifieke endogene variabele; 100% − R² is onverklaard maar bewijst niet waarom.",
          "**Transferstap:** koppel in een nieuw model elk R²-label eerst aan het juiste knooppunt en formuleer oorzaken daarna als hypothesen.",
          sep = "\n\n"
        )
      } else if (!results$valid) {
        missing_fields <- names(results$expected)[!is.finite(results$values)]
        message <- paste(
          paste0("**Waarschijnlijke redenering:** de volgende antwoorden ontbreken of zijn niet numeriek: ", paste(missing_fields, collapse = ", "), "."),
          "**Waarom dit niet klopt:** de evaluator verwacht twee gehele percentages en één antwoordcode.",
          "**Denkregel:** voer percentages zonder procentteken in en gebruik bij de interpretatie de opgegeven code.",
          "**Volgende stap:** vul alle drie velden in en controleer dat verklaard plus onverklaard 100% is.",
          sep = "\n\n"
        )
      } else {
        wrong_field <- names(which(abs(results$values - results$expected) > 0.0005))[[1L]]
        likely <- switch(wrong_field,
          r2_groepsgericht_pct = "Je hebt waarschijnlijk het R²-label van een nabijgelegen, andere endogene variabele afgelezen.",
          onverklaard_pct = "Je hebt waarschijnlijk het verklaarde percentage 43 zelf ingevuld of het verkeerde complement genomen.",
          interpretatie_onverklaard = "Je hebt waarschijnlijk één mogelijke oorzaak als bewezen diagnose geïnterpreteerd.",
          "Je hebt een R²-grootheid verwisseld."
        )
        why <- switch(wrong_field,
          r2_groepsgericht_pct = "Het R²-label bij groepsgerichte morele intuïties is 2%.",
          onverklaard_pct = "Onverklaard is het complement: 100 − 43 = 57.",
          interpretatie_onverklaard = "R² kwantificeert het niet-verklaarde aandeel, maar identificeert zonder extra analyse geen specifieke oorzaak; code 2 is de voorzichtige interpretatie.",
          "Het antwoord past niet bij het gevraagde R²."
        )
        next_step <- switch(wrong_field,
          r2_groepsgericht_pct = "Omcirkel de volledige naam van de doelvariabele en lees alleen haar aangrenzende R²-label.",
          onverklaard_pct = "Trek het verklaarde aandeel af van 100.",
          interpretatie_onverklaard = "Kies de optie die ruimte laat voor ontbrekende factoren zonder een specifieke oorzaak te bewijzen.",
          "Koppel eerst de variabele aan het juiste R²-label."
        )
        message <- paste(
          paste0("**Waarschijnlijke redenering:** ", likely),
          paste0("**Waarom dit niet klopt:** ", why),
          "**Denkregel:** verklaard en onverklaard tellen op tot 100%, maar R² alleen is geen oorzakelijke diagnose.",
          paste0("**Volgende stap:** ", next_step),
          sep = "\n\n"
        )
      }
      get_reporter()$add_message(message, type = "markdown")
      generated == expected
    })
  })
})
