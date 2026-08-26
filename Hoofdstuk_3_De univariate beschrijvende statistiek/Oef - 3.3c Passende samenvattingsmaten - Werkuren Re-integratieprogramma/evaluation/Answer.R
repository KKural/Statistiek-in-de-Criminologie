context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          expected_values <- list(
            meest_relevante_centraliteit = "gemiddelde",
            meest_relevante_spreiding = "standaardafwijking",
            reden = "gebruikt alle informatie"
          )
          check_text <- function(name, expected) {
            if (!exists(name, envir = env)) {
              return(list(ok = FALSE, valid = FALSE, value = NA_character_, expected = expected))
            }
            raw <- get(name, envir = env)
            valid <- length(raw) == 1L && !is.na(raw) && nzchar(trimws(as.character(raw)))
            value <- if (valid) tolower(trimws(as.character(raw))) else NA_character_
            list(ok = valid && identical(value, expected), valid = valid, value = value, expected = expected)
          }
          results <- lapply(names(expected_values), function(name) check_text(name, expected_values[[name]]))
          names(results) <- names(expected_values)
          assign("results_3_3c", results, envir = globalenv())
          all(vapply(results, function(result) isTRUE(result$ok), logical(1)))
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("results_3_3c", envir = globalenv())
          if (isTRUE(generated == expected)) {
            message <- paste(
              "**Bevestiging:** gemiddelde en standaardafwijking vormen hier een samenhangend paar dat alle ratiowaarden in de berekening gebruikt.",
              "**Denkregel:** kies maten op basis van meetniveau én verdelingsvorm; bij numerieke data zonder problematische uitbijters zijn gemiddelde en standaardafwijking informatief.",
              "**Transferstap:** vergelijk dezelfde keuze met een nieuwe werkurendataset waarin één extreem hoge waarde voorkomt en motiveer wat dan verandert.",
              sep = "\n\n"
            )
          } else {
            center <- results$meest_relevante_centraliteit
            spread <- results$meest_relevante_spreiding
            reason <- results$reden
            if (!center$valid || !spread$valid || !reason$valid) {
              likely <- "Minstens één keuzeveld is leeg, `NA` of gebruikt niet exact een aangeboden term."
              why <- "De drie keuzes moeten als één inhoudelijk samenhangende combinatie kunnen worden beoordeeld."
              next_step <- "Kies per veld exact één term uit de lijst in de opgave."
            } else if (center$value == "mediaan" || spread$value == "interkwartielafstand" || reason$value == "robuust voor uitbijters") {
              likely <- "Je kiest robuuste maten alsof de verdeling een problematische uitbijter bevat."
              why <- "In deze werkurendata is geen extreme waarde die het centrum en de spreiding domineert; robuustheid hoeft daarom niet de doorslag te geven."
              next_step <- "Controleer het bereik en de ligging van alle waarden en kies vervolgens het paar dat alle numerieke informatie gebruikt."
            } else {
              likely <- "De gekozen centrummaat, spreidingsmaat en reden beantwoorden niet dezelfde samenvattingsstrategie."
              why <- "Een maatkeuze is pas verdedigbaar als meetniveau, verdelingsvorm en argument elkaar ondersteunen."
              next_step <- "Formuleer eerst of je alle numerieke afstanden wilt gebruiken of juist robuust wilt zijn, en kies daarna beide maten volgens dat doel."
            }
            message <- paste(
              paste0("**Waarschijnlijke redenering:** ", likely),
              paste0("**Waarom dit niet klopt:** ", why),
              "**Denkregel:** beoordeel meetniveau, uitbijters en informatiegebruik vóór je een centrum- en spreidingsmaat kiest.",
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
