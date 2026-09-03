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
            "1" = "❌ Niet de beste keuze. Derde variabelen zijn een belangrijke concrete verklaring, maar de vraag zoekt de meest fundamentele methodologische beperking van de conclusie.",
            "2" = "❌ Niet de beste keuze. Omgekeerde causaliteit is een mogelijke verklaring, maar ook dit valt onder dezelfde bredere beperking dat correlatie op zich causaliteit niet bewijst.",
            "3" = "✅ Juist! Er kunnen confounding variabelen zijn: rijkere wijken hebben misschien zowel meer straatverlichting ALS minder criminaliteit door andere factoren (meer politie, beter onderwijs, meer werkgelegenheid).",
            "4" = "❌ Niet de beste keuze. Dit klopt als nuance over interpretatie van correlaties, maar het verklaart niet de kernfout in de conclusie over wat straatverlichting veroorzaakt."
          )

          likely_reasons <- list(
            "1" = "je herkende terecht het confounding-probleem en koos de concrete uitwerking daarvan, terwijl de vraag de meest algemene kernbeperking laat aanduiden.",
            "2" = "je redeneerde terecht dat de pijl ook omgekeerd kan lopen, maar die redenering is een specifieke vorm van dezelfde bredere causale beperking.",
            "4" = "je focuste mogelijk op hoe sterk een correlatie geïnterpreteerd mag worden, terwijl de kern hier is dat samenhang op zich geen richting van oorzaak-gevolg vastlegt."
          )
          key <- as.character(generated)
          msg <- feedbacks[[key]] %||% "❌ Geef een getal tussen 1 en 4 in."
          if (key %in% names(feedbacks) && generated != expected) {
            msg <- paste0(
              "**Waarom deze keuze begrijpelijk kan lijken:** ", likely_reasons[[key]], "\n\n",
              "**Waarom dit niet klopt:** ",
              msg,
              "\n\n**Denkregel:** Een derde variabele kan zowel X als Y sturen; correlatie alleen maakt X daarom niet tot oorzaak.\n\n",
              "**Volgende stap:** Zoek bij je optie een alternatieve verklaring en kies de uitspraak die deze causale beperking erkent."
            )
          } else if (key %in% names(feedbacks) && generated == expected) {
            msg <- paste0(
              "**Bevestiging:** je gekozen optie is correct.\n\n",
              msg,
              "\n\n**Denkregel:** Een samenhang bewijst geen causaliteit zolang confounders en omgekeerde richting niet zijn uitgesloten.\n\n",
              "**Transferstap:** Noem voor straatverlichting en criminaliteit een derde variabele die beide kan beinvloeden en teken de twee pijlen."
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
