context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        3,  # Correct answer: Q8 from your rotation pattern
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "❌ Fout. Dit gaat over steekproefgrootte, niet over de logische redenering.",
            
            "2" = "❌ Fout. Het probleem ligt in de interpretatie, niet in de statistiek.",
            
            "3" = "✅ Juist! Er kunnen confounding variabelen zijn: rijkere wijken hebben misschien zowel meer straatverlichting ALS minder criminaliteit door andere factoren (meer politie, beter onderwijs, meer werkgelegenheid).",
            
            "4" = "❌ Fout. De tijdsperiode is niet het kernprobleem hier."
          )
          
          likely_reasons <- list(
            "1" = "je zocht het probleem mogelijk in een te kleine steekproef, omdat steekproefgrootte vaak de betrouwbaarheid beïnvloedt, maar hier gaat het om de logische conclusie.",
            "2" = "je vermoedde mogelijk een fout in de statistische berekening, terwijl een correct verband nog steeds causaal kan worden overgeïnterpreteerd.",
            "4" = "je zag de gekozen tijdsperiode mogelijk als belangrijkste beperking, maar zelfs een langere periode sluit alternatieve verklaringen niet uit."
          )
          key <- as.character(generated)
          msg <- feedbacks[[key]] %||% "❌ Geef een getal tussen 1 en 4 in."
          if (key %in% names(feedbacks) && generated != expected) {
            msg <- paste0(
              "**Waarschijnlijke redenering:** ", likely_reasons[[key]], "\n\n",
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
              "**Invoercontrole:** je invoer lijkt niet overeen te komen met één van de aangeboden optienummers; dit kan een typefout of een andere invoerinterpretatie zijn.\n\n",
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
