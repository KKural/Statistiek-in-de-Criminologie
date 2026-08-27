context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        1,  # Correct answer: Q7 from your rotation pattern
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "✅ Juist! Type misdrijf bestaat uit categorieën zonder natuurlijke rangorde - je kunt niet zeggen dat diefstal 'meer' of 'minder' is dan geweld.",

            "2" = "❌ Fout. Temperatuur heeft numerieke waarden en een natuurlijke rangorde (warmer/kouder).",

            "3" = "❌ Fout. Dit is ordinaal omdat er een duidelijke rangorde is van laag naar hoog.",

            "4" = "❌ Fout. Leeftijd is ratio omdat het numerieke waarden heeft met een absoluut nulpunt."
          )

          likely_reasons <- list(
            "2" = "je zag mogelijk verschillende temperatuurwaarden als categorieën, maar temperatuur draagt ook numerieke ordening en afstandsinformatie.",
            "3" = "je herkende mogelijk categorieën in het opleidingsniveau, maar die categorieën hebben juist een betekenisvolle volgorde van laag naar hoog.",
            "4" = "je zag mogelijk dat leeftijd personen kan groeperen, maar ruwe leeftijd is een numerieke ratio-variabele met een werkelijk nulpunt."
          )
          key <- as.character(generated)
          msg <- feedbacks[[key]] %||% "❌ Geef een getal tussen 1 en 4 in."
          if (key %in% names(feedbacks) && generated != expected) {
            msg <- paste0(
              "**Waarom deze keuze begrijpelijk kan lijken:** ", likely_reasons[[key]], "\n\n",
              "**Waarom dit niet klopt:** ",
              msg,
              "\n\n**Denkregel:** Controleer of de categorieen inhoudelijk gerangschikt kunnen worden; zo niet, dan is de variabele nominaal.\n\n",
              "**Volgende stap:** Probeer de delictcategorieen betekenisvol te rangschikken en kies, wanneer dat niet kan, de nominale optie."
            )
          } else if (key %in% names(feedbacks) && generated == expected) {
            msg <- paste0(
              "**Bevestiging:** je gekozen optie is correct.\n\n",
              msg,
              "\n\n**Denkregel:** Een nominale variabele bestaat uit categorieen zonder natuurlijke rangorde; eventuele cijfers zijn alleen labels.\n\n",
              "**Transferstap:** Classificeer modus operandi en leg uit waarom de categorieen niet betekenisvol van laag naar hoog kunnen worden gezet."
            )
          }

          if (!key %in% names(feedbacks)) {
            msg <- paste0(
              "**Controleer je invoer:** je invoer lijkt niet overeen te komen met één van de aangeboden optienummers; dit kan een typefout of een andere invoerinterpretatie zijn.\n\n",
              "**Waarom dit niet klopt:** de evaluator kan alleen een inhoudelijke optie beoordelen wanneer één geldig optienummer is ingevoerd.\n\n",
              "**Denkregel:** koppel eerst elke antwoordoptie aan haar nummer en voer uitsluitend dat ene nummer in.\n\n",
              "**Volgende stap:** lees de opties opnieuw, kies het nummer dat bij je redenering hoort en dien alleen dat nummer in."
            )
          }
          get_reporter()$add_message(msg, type = "markdown")

          generated == expected
        }
      )
    }
  )
})
