context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        3, # Correct answer: Q8 from your rotation pattern
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "❌ Fout. Een correlatie bepaalt niet de causale richting en sluit derde variabelen niet uit.",
            "2" = "❌ Fout. Omgekeerde causaliteit is mogelijk, maar wordt door het resultaat niet bewezen.",
            "3" = "✅ Juist! Er kunnen confounding variabelen zijn: rijkere wijken hebben misschien zowel meer straatverlichting ALS minder criminaliteit door andere factoren (meer politie, beter onderwijs, meer werkgelegenheid).",
            "4" = "❌ Fout. Ook een sterke correlatie kan door een derde variabele ontstaan."
          )

          likely_reasons <- list(
            "1" = "je interpreteert de samenhang mogelijk als bewijs dat straatverlichting criminaliteit vermindert.",
            "2" = "je herkent mogelijk omgekeerde causaliteit als alternatief.",
            "4" = "je denkt mogelijk dat een sterke correlatie andere verklaringen uitsluit."
          )
          key <- as.character(generated)
          msg <- feedbacks[[key]] %||% "❌ Geef een getal tussen 1 en 4 in."
          if (key %in% names(feedbacks) && generated != expected) {
            msg <- paste0(
              "**Waarom deze keuze begrijpelijk kan lijken:** ", likely_reasons[[key]], "\n\n",
              "**Waarom dit niet klopt:** ",
              msg,
              "\n\n**Denkregel:** Samenhang is geen bewijs voor oorzaak en gevolg.\n\n",
              "**Volgende stap:** Bedenk minstens één alternatieve verklaring."
            )
          } else if (key %in% names(feedbacks) && generated == expected) {
            msg <- paste0(
              "**Bevestiging:** je gekozen optie is correct.\n\n",
              msg,
              "\n\n**Denkregel:** Voor een causale conclusie moeten derde variabelen en omgekeerde causaliteit worden onderzocht.\n\n",
              "**Transferstap:** Noem één mogelijke derde variabele, zoals buurtwelvaart of politie-inzet."
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
