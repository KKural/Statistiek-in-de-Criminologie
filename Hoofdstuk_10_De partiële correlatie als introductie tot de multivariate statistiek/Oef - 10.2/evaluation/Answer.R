context({
  testcase("", {
    testEqual("", function(env) {
      expected_values <- c(afname_na_controle = 1, suppressoreffect = 3, nauwelijks_verandering = 3, unieke_bijdrage = 2)
      read_number <- function(name) {
        if (!exists(name, envir = env)) return(NA_real_)
        value <- suppressWarnings(as.numeric(get(name, envir = env)))
        if (length(value) != 1L || !is.finite(value)) return(NA_real_)
        value
      }
      values <- vapply(names(expected_values), read_number, numeric(1))
      valid <- all(is.finite(values))
      correct <- valid && all(abs(values - expected_values) <= 0.0005)
      assign("results_10_2_combined", list(values = values, expected = expected_values, valid = valid), envir = globalenv())
      correct
    }, TRUE, comparator = function(generated, expected, ...) {
      results <- get("results_10_2_combined", envir = globalenv())
      if (isTRUE(generated == expected)) {
        message <- paste(
          "**Bevestiging:** alle vier patronen zijn juist herkend: sterke afname, suppressie, nauwelijks verandering en een unieke multivariate bijdrage.",
          "**Denkregel:** vergelijk eerst r_XY met r_XY.Z; de richting en grootte van de verandering bepalen de interpretatie.",
          "**Transferstap:** beschrijf bij een nieuw model eerst het patroon van de coëfficiënten en geef pas daarna een inhoudelijke verklaring.",
          sep = "\n\n"
        )
      } else if (!results$valid) {
        missing_fields <- names(results$expected)[!is.finite(results$values)]
        message <- paste(
          paste0("**Waarschijnlijke redenering:** de volgende antwoordcodes ontbreken of zijn niet numeriek: ", paste(missing_fields, collapse = ", "), "."),
          "**Waarom dit niet klopt:** ieder scenario toetst een ander relatiepatroon en vereist één geldige antwoordcode.",
          "**Denkregel:** gebruik uitsluitend de code die onder het betreffende scenario is gedefinieerd.",
          "**Volgende stap:** vul voor alle vier scenario's één code in en vergelijk daarna elk paar correlaties opnieuw.",
          sep = "\n\n"
        )
      } else {
        wrong_field <- names(which(abs(results$values - results$expected) > 0.0005))[[1L]]
        likely <- switch(wrong_field,
          afname_na_controle = "Je hebt een sterke afname mogelijk als suppressie of als bewijs van causaliteit geïnterpreteerd.",
          suppressoreffect = "Je hebt de sterke toename na controle mogelijk als het verdwijnen van een verband gelezen.",
          nauwelijks_verandering = "Je hebt een verschil van slechts 0.02 mogelijk als een grote inhoudelijke verandering beschouwd.",
          unieke_bijdrage = "Je hebt gezamenlijk modelleren mogelijk gelijkgesteld aan automatisch causaal bewijs.",
          "Je hebt een antwoordcode aan het verkeerde scenario gekoppeld."
        )
        why <- switch(wrong_field,
          afname_na_controle = "De daling van 0.60 naar 0.10 wijst erop dat Z een groot deel van het oorspronkelijke gedeelde verband verklaart.",
          suppressoreffect = "De correlatie wordt na controle veel sterker; dat is het kenmerk van suppressie.",
          nauwelijks_verandering = "0.50 en 0.48 zijn vrijwel gelijk, zodat Z het verband nauwelijks verandert.",
          unieke_bijdrage = "Meerdere predictors maken het mogelijk hun partiële, unieke bijdragen te schatten; causaliteit volgt daar niet automatisch uit.",
          "De gekozen code beschrijft het gegeven patroon niet."
        )
        next_step <- switch(wrong_field,
          afname_na_controle = "Bereken het verschil tussen 0.60 en 0.10 en benoem de richting.",
          suppressoreffect = "Vergelijk 0.10 rechtstreeks met 0.7209 en zoek de optie die versterking benoemt.",
          nauwelijks_verandering = "Beoordeel eerst de absolute verandering van 0.02.",
          unieke_bijdrage = "Formuleer wat een regressiecoëfficiënt betekent wanneer de andere predictors constant worden gehouden.",
          "Lees het scenario en zijn antwoordcodes opnieuw als één blok."
        )
        message <- paste(
          paste0("**Waarschijnlijke redenering:** ", likely),
          paste0("**Waarom dit niet klopt:** ", why),
          "**Denkregel:** afname wijst op gedeelde verklaring, sterke toename op suppressie en stabiliteit op weinig invloed van de controlevariabele.",
          paste0("**Volgende stap:** ", next_step),
          sep = "\n\n"
        )
      }
      get_reporter()$add_message(message, type = "markdown")
      generated == expected
    })
  })
})
